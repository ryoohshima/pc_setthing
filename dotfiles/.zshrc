# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ryoohshima/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="candy"

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

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#------------------------------------------------------------------------------------------------------

# プロンプトの表示

# VCSの情報を取得するzsh関数
autoload -Uz colors
autoload -Uz vcs_info

# PROMPT変数内で変数参照
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

# %b ブランチ情報
# %a アクション名(mergeなど)
# %c changes
# %u uncommit

# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }

# プロンプトの左側
PROMPT='%{$fg[white]%}
%{$bg[yellow]%}[%*]%{${fg[white]}%}%{${bg[red]}%}[%d]
%{$reset_color%}'

# プロンプトの右側
## vcs_infoを読み込み
autoload -Uz vcs_info
## vcs_info_msg_0_変数をどのように表示するかフォーマットの指定
### デフォルトのフォーマット
#### %s: どのバージョン管理システムを使っているか（git, svnなど）
#### %b: ブランチ名
zstyle ':vcs_info:*' formats '%K{cyan}(%s)%k%K{blue}[%b]%k'
### 特別な状態（mergeでコンフリクトしたときなど）でのフォーマット
#### %a: アクション名（merge, rebaseなど）
zstyle ':vcs_info:*' actionformats '%K{cyan}(%s)%k%K{blue}[%b|%a]%k'
## プロンプトが表示される毎にバージョン管理システムの情報を取得
### precmd: プロンプトが表示される毎に実行される関数
### vcs_info: バージョン管理システムから情報を取得
precmd () { vcs_info }
## 右プロンプトに表示
### prompt_subst: プロンプトを表示する際に変数を展開するオプション
setopt prompt_subst
### vcs_info_msg_0_: バージョン管理システムの情報
### RPROMPT: 右プロンプトに情報を表示するときの環境変数
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

#------------------------------------------------------------------------------------------------------

# パス
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"

export PATH="/Users/ryoohshima/.nodebrew/node/12.13.1/bin:$PATH"
export PATH="/Users/ryoohshima/.nodebrew/node/12.13.1/bin:$PATH"

export PATH="$HOME/Library/Python/2.7/bin:$PATH"
eval "$(rbenv init -)"

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }
export PATH=$PATH:/Users/ryoohshima/.nodebrew/current/bin

#------------------------------------------------------------------------------------------------------

# エイリアス
alias sshpex='ssh -i /Users/ryoohshima/gitfiles/pepy-web/key/pepy_id_rsa -p 10022 pepy@sv8713.xserver.jp'
alias sshba1='ssh -i ~/.ssh/id_rsa ryoohshima@ec2-54-199-221-32.ap-northeast-1.compute.amazonaws.com'
alias sshba2='ssh -i ~/.ssh/id_rsa ryoohshima@ec2-13-115-84-232.ap-northeast-1.compute.amazonaws.com'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# ------------------------------------------------------------------------------------------------------

# screen設定
alias screen='WEEK=`LANG=C date "+%a"` screen'

# ------------------------------------------------------------------------------------------------------

# グロブ展開阻止
setopt nonomatch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ryoohshima/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ryoohshima/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ryoohshima/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ryoohshima/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

