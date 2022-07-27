fish_vi_key_bindings
set -gx PATH $HOME/.cargo/bin $PATH
set -x PATH ~/npm/bin:$PATH

# Tokyo night theme
# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 364A82
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# This is needed to solve Powerline not being rendered inside tmux
# Refer https://github.com/gpakosz/.tmux/issues/171#issuecomment-426048355
set -gx LC_ALL en_US.UTF-8

# Solve SSH cannot open connection issue
# Refer https://gist.github.com/gerbsen/5fd8aa0fde87ac7a2cae
setenv SSH_ENV $HOME/.ssh/environment
function start_agent
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' >$SSH_ENV
    echo succeeded
    chmod 600 $SSH_ENV
    . $SSH_ENV >/dev/null
    ssh-add
end
function test_identities
    ssh-add -l | grep "The agent has no identities" >/dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end
if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent >/dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV >/dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent >/dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end
