#!/bin/zsh
###############################################################################
# Shell Configuration                                                         #
###############################################################################

###############################################################################
# PATH & variables                                                            #
###############################################################################


# load files
for file in ~/.zshconfig/.{extra,aliases,functions,tiny-care-terminal-settings}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Set brew path
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH


# Add Pyenv shims
if _has pyenv; then
  eval "$(pyenv init -)";
fi

if _has pyenv; then
  eval "$(pyenv virtualenv-init -)";
fi

# Add Rbenv shims
if _has rbenv; then
  eval "$(rbenv init -)";
fi

# Adds hub sugar
fpath=(~/.zshconfig/.oh-my-zsh/custom $fpath) 
autoload -U compinit && compinit
eval "$(hub alias -s)"

# Add Cargo to Path
export PATH=/Users/Home/.cargo/bin:$PATH

# Add Go to Path
export PATH=/Users/Home/go/bin:$PATH
# Go will automatically set GOROOT to the binary installed with Homebrew
# export GOROOT=/Users/Home/go
export GOPATH=/Users/Home/go
 
# Create Node Path
export NODE_PATH=$PWD/node_modules

# create nvm reference
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# Set ag colors
if _has ag; then
  alias ack=ag
  alias ag='ag --color-path 1\;31 --color-match 1\;32 --color'
fi

# fzf, fuzzy finder, keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf + ag configuration
# if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor --hidden -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --height 50%
  --reverse
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168'
# fi

# Evals for CLI tools
eval "$(direnv hook zsh)"

# Enable tab completion for colorls flags
source $(dirname $(gem which colorls))/tab_complete.sh

# Activate gcloud autocompletion goodness
source "$HOME/google-cloud-sdk/path.zsh.inc"
source "$HOME/google-cloud-sdk/completion.zsh.inc"

# Set environment variables for unicode character names, for ZSH prompts
source "$HOME/.fonts/devicons-regular.sh"
source "$HOME/.fonts/octicons-regular.sh"
source "$HOME/.fonts/fontawesome-regular.sh"
source "$HOME/.fonts/pomicons-regular.sh"

# highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[38;5;27m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[1;38;5;49m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;49m' # begin underline

export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
export GREP_OPTIONS='--color=always'

# Editor
export EDITOR="/usr/local/bin/subl-wait"

###############################################################################
# ZSH Settings                                                                #
###############################################################################
ZSH=/Users/Home/.zshconfig/.oh-my-zsh

# default theme: "robbyrussell"
# random theme:   "random"
export ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel 9k Settings
source "$HOME/.zshconfig/.powerlevel9k-settings"

# Autostart tmux
ZSH_TMUX_AUTOSTART=false

# Eliminate gutter on right prompt
# ZLE_RPROMPT_INDENT=0

# Help with ghost characters remaining after delete
LC_ALL="en_US.UTF-8"
LANG="en_US.UTF-8"

plugins=(osx pip fasd git zsh-syntax-highlighting history history-substring-search npm yarn zsh-better-npm-completion)
# plugins=(httpie redis-cli fzf-fasd composer)

source $ZSH/oh-my-zsh.sh

# Display start up message
startup-command

# Zplug - Plugin Manager
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'qq
zplug "wookayin/fzf-fasd"
zplug "lukechilds/zsh-nvm"

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load

###############################################################################
# Misc OH-MY-ZSH Configuration                                                #
###############################################################################

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
# DISABLE_AUTO_TITLE="true"

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

# plugins=(osx vi-mode tmux z encode64 git-extras gitfast httpie history jira jsontools urltools vagrant yarn fasd sudo cp docker git python virtualenv virtualenvwrapper django web-search gulp)



# User configuration


# export MANPATH="/usr/local/man:$MANPATH"

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




