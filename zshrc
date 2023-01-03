# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/zackzhu/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# set dir colors
eval "`dircolors`"

source /usr/facebook/ops/rc/master.zshrc
export PATH=".:$HOME/ccls/Release:$HOME/www/scripts/bin:$PATH"

export EDITOR='nvim'
export VISUAL='nvim'
set -o vi
alias vi='nvim'
alias vim='nvim'

alias python3=/usr/bin/python3.8
alias python=/usr/bin/python3.8

# Colorize the ls output
alias ls='ls --color=auto'
# Use a long listing format
alias ll='ls -la'
# Pipe anything into `clip` to forward it to Clipper
# alias clip="~/clip.sh"
# function clip { ~/clip.sh; }
# export -f clip

# HG
alias hg.pager="hg.real log --pager never --color never -r 'sort(draft(), -date)' --template "\""{label(sl_label, separate(' ', sl_node_info, pad(sl_diff, 8), sl_desc))}\n"\"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias fz='fzf --preview "cat {}" --bind "enter:execute(vim {})+abort,ctrl-y:execute-silent(echo {} | clip)+abort"'
export FZF_DEFAULT_COMMAND='fd -t f --no-ignore --hidden --follow --exclude .git --exclude .hg --exclude ".ccls*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -t d --no-ignore --hidden --follow --exclude .git --exclude .hg --exclude ".ccls*"'

_fzf_complete_hg() {
  _fzf_complete "--ansi --no-sort" "$@" < <(
    hg.pager
  )
}

_fzf_complete_hg_post() {
  cut -d' ' -f1
}

# proxy
 export no_proxy=".fbcdn.net,.facebook.com,.thefacebook.com,.tfbnw.net,.fb.com,.fburl.com,.facebook.net,.sb.fbsbx.com,localhost"
 export http_proxy=fwdproxy:8080
 export https_proxy=fwdproxy:8080

# rust tooling
export PATH="$HOME/.cargo/bin:$HOME/fbsource/fbcode/common/rust/tools/rust-project:$HOME/fbsource/fbcode/common/rust/tools/toolchain/rustup:$HOME/fbsource/third-party/rust/tools:$HOME/fbsource/tools/third-party/rustfmt:$PATH"
