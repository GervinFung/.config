fish_vi_key_bindings
set -gx PATH $HOME/.cargo/bin $PATH
set -x PATH ~/npm/bin:$PATH

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

# pnpm
set -gx PNPM_HOME "/home/gervin/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
