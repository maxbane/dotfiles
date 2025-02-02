# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:$HOME/conda/bin:$PATH
export MANPATH="$HOME/share/man:$MANPATH"

export PAGER=less
export LESS=-R

#unsetopt correct_all
setopt share_history extended_history hist_ignore_dups auto_cd multios

export EDITOR='vim'
# apply dircolors (solarized)
eval `dircolors ~/.dircolors`

# To save every command before it is executed (this is different from bash's
# history -a solution):
setopt inc_append_history

# To read the history file everytime history is called upon as well as the
# functionality from inc_append_history:
setopt share_history

# Set up ssh agent
if [ -f $HOME/.ssh/id_rsa ]; then
    eval $(ssh-agent)
    ssh-add $HOME/.ssh/id_rsa
fi

eval "$(starship init zsh)"

function set_win_title() {
    echo -ne "\033]0; $(hostname):$(basename "$PWD") \007"
}
precmd_functions+=(set_win_title)
