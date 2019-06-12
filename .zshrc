function log_error {
	echo -e "\033[0;31m"$1"\033[0;m"

}

function try_source {
	{ [ -f $1 ] && source $1 } || log_error "File '$1' not found."
}


# Path to your oh-my-zsh installation.
  export ZSH="/home/torjusba/.oh-my-zsh"


# Use 'clean' for remotes and servers
#ZSH_THEME="clean"
ZSH_THEME="mh"

# Colorscheme from pywal
#(cat ~/.cache/wal/sequences &)
#wal -q --theme vscode &


# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


# Add snaps to path
export PATH=$PATH:/snap/bin

#Add custom scripts to path
export PATH=$PATH:$HOME/scripts

# Aliases
alias zshaliases="vim ~/.zsh_aliases"

# Move aliases to separate file
try_source "$HOME/.zsh_aliases"

# Z navigation
try_source "$HOME/.oh-my-zsh/z/z.sh"



bindkey -v # Vim keybindings


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
