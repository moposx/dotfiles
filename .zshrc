## PATH settings
# Dotnet root location
export DOTNET_ROOT=/opt/dotnet

# ANDROID SDK location
export ANDROID_SDK_ROOT=$HOME/.local/android/sdk

# Flutter SDK location
export FLUTTER_SDK_ROOT=$HOME/.local/flutter-sdk

# PATH
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$ANDROID_SDK_ROOT/platform-tools:$FLUTTER_SDK_ROOT/bin:$PATH

## Environmental Variables
# MANPATH setting
export MANPATH="/usr/local/man:$MANPATH"

# Language environment settings
export LANGUAGE=en_US
export LANG=en_US.UTF-8

# Google Chrome launcher executable name
export CHROME_EXECUTABLE=google-chrome-stable

# TUNA Flutter mirrors
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
export FLUTTER_GIT_URL="https://mirrors.tuna.tsinghua.edu.cn/git/flutter-sdk.git"


## Zsh settings
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Don't mark untracked files under VCS as dirty.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Set history timestamp format
HIST_STAMPS="yyyy-mm-dd"

# Zsh plugins to load
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-z)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh


## Aliases

# Load Node Version Manager
source /usr/share/nvm/init-nvm.sh
