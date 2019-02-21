# Path to your oh-my-zsh installation.
export ZSH=/home/jsangil/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy-fixed"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/python_envs
source /usr/local/bin/virtualenvwrapper.sh

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Adding spotify client terminal
export PATH="$PATH:$HOME/spotify-command-line/"

# Adding NGINX
export PATH="$PATH:/opt/nginx/sbin/"

# Adding Android SDK
export ANDROID_HOME="$HOME/android-sdk-linux/"
# Genymotion (Android Emulator)
export PATH="$PATH:$HOME/genymotion/"

# weather command
alias weather='curl wttr.in/barcelona'
# create a function, because alias cannot get arguments:
# use it as follows: weather_in Hamburg
function fun_weather_in() { curl "wttr.in/$1" ;}
alias weather_in=fun_weather_in

# myip command
alias myip='curl ipecho.net/plain; echo'
# git status alias
alias gits='git status'

# Connecting to rdesktop
alias kingslayer='rdesktop -u Administrator -g 1850x950 -p - gmtfxtrading.com'
alias asgard='rdesktop -u Administrator -g 1850x950 -p \)owbiA\)3X3 52.20.192.187'

# pyenv (Python Version Management)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# asdf (Version manager elixir)
# For Ubuntu or other linux distros
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# Starting node environment
nvm use stable

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jsangil/localbitcoins/google-cloud-sdk/path.zsh.inc' ]; then . '/home/jsangil/localbitcoins/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jsangil/localbitcoins/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/jsangil/localbitcoins/google-cloud-sdk/completion.zsh.inc'; fi

# The next line updates PATH for the original App Engine SDK (Google Cloud asks you to install both things)
export PATH=$PATH:~/localbitcoins/google_appengine/
