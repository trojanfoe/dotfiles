
sys=$(uname -s)

for d in $HOME/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/.local/go/bin /usr/local/go/bin
do
  if test -d $d; then
    PATH=$d:$PATH
  fi
done

if [[ $sys == Darwin ]]; then
  #
  # macOS
  #

  eval "$(/opt/homebrew/bin/brew shellenv)"

  if test -d "/Applications/Android Studio.app"; then
    export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
    export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
    export ANDROID_SDK=$ANDROID_SDK_ROOT
    export ANDROID_HOME=$ANDROID_SDK_ROOT
    export ANDROID_NDK=$ANDROID_SDK_ROOT/ndk/25.2.9519653
    export ANDROID_NDK_HOME=$ANDROID_NDK
    export NDK_HOME=$ANDROID_NDK
    export PATH="$JAVA_HOME/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"
  fi

  pip3_user_dir=$(python3 -c "import site; print(site.USER_BASE)")
  export PATH="$pip3_user_dir:$PATH"
  unset pip3_user_dir

  export VISUAL=zed
  export EDITOR=$VISUAL

elif [[ $sys == Linux || $sys == FreeBSD ]]; then
  #
  # Linux or FreeBSD
  #

  export VISUAL=nvim
  export EDITOR=$VISUAL

  eval $(keychain --eval id_github_trojanfoe)
fi

if [[ $sys == Linux ]]; then
  #
  # Linux
  #

  alias fd=fdfind
fi

alias lg=lazygit

# Remove dupes
typeset -U PATH

# Rust
if test -d $HOME/.cargo; then
  . "$HOME/.cargo/env"
fi

# Golang
go env -w GOPATH=$HOME/.local/go

if test -f $HOME/.zprofile.local; then
    source $HOME/.zprofile.local
fi
