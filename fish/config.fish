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

# Android
# Refer to https://gist.github.com/ivopr/3f2ee281cd38e66dc1a4d1344154b715
#set -Ux ANDROID_HOME $HOME/Android/Sdk
#set -U fish_user_paths $ANDROID_HOME/emulator $fish_user_paths
#set -U fish_user_paths $ANDROID_HOME/tools $fish_user_paths
#set -U fish_user_paths $ANDROID_HOME/tools-bin $fish_user_paths
#set -U fish_user_paths $ANDROID_HOME/platform-tools $fish_user_paths

# This is needed to solve Powerline not being rendered inside tmux
# Refer https://github.com/gpakosz/.tmux/issues/171#issuecomment-426048355
set -gx LC_ALL en_US.UTF-8
