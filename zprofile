
sys=$(uname -s)

for d in $HOME/bin $HOME/.local/bin $HOME/.cargo/bin /opt/EtsyStore/bin
do
  if test -d $d; then
    PATH=$d:$PATH
  fi
done

. "$HOME/.cargo/env"


if [[ $sys == Darwin ]]; then
  #
  # macOS
  #

  eval "$(/opt/homebrew/bin/brew shellenv)"
  export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"

  export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
  export ANDROID_SDK=$ANDROID_SDK_ROOT
  export ANDROID_HOME=$ANDROID_SDK_ROOT
  export ANDROID_NDK=$ANDROID_SDK_ROOT/ndk/25.2.9519653
  export ANDROID_NDK_HOME=$ANDROID_NDK
  export NDK_HOME=$ANDROID_NDK

  pip3_user_dir=$(python3 -c "import site; print(site.USER_BASE)")
  export PATH="$HOME/bin:$JAVA_HOME/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$pip3_user_dir:$PATH"
  unset pip3_user_dir

elif [[ $sys == Linux ]]; then
  #
  # Linux
  #

  alias fd=fdfind

  eval $(keychain --eval id_github_trojanfoe)

fi

export VISUAL=nvim
export EDITOR=$VISUAL

alias lg=lazygit

# Remove dupes
typeset -U PATH


