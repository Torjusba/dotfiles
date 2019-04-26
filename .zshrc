
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

export PATH=$PATH:$HOME/bin

# Aliases
alias sudo='sudo ' #Fixes sudo issues in aliases
alias gimme='apt install'
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshaliases="vim ~/.zsh_aliases"
alias vimconfig="vim ~/.vimrc"

# Move aliases to separate file
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi


# Z navigation
. ~/.oh-my-zsh/z/z.sh



#if [ -f ~.zsh-ros-setup ]; then
. ~/.zsh-ros-setup
#fi



bindkey -v # Vim keybindings

# SYNTAX HIGHLIGHTING
# MUST BE LAST IN .ZSHRC
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
