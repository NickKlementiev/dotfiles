# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/atikin/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fox"

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
HIST_STAMPS="dd.mm.yyyy"
HISTFILE=$HOME/.zsh_history
HISTSIZE=15000

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract z vi-mode)

source $ZSH/oh-my-zsh.sh

autoload -U colors && colors
autoload -U compinit && compinit

bindkey -v
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR="nvim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls="clear"
alias ..="cd .."
alias cd..="cd .."
alias ls="ls -CF --color=auto"
alias ll="ls -lisa --color=auto"
alias lsl="ls -lhFA | less"
alias home="cd ~"
#alias df="df -ahiT --total"
alias mkdir="mkdir -pv"
alias userlist="cut -d: -f1 /etc/passwd"
alias fhere="find . -name "
alias free="free -mt"
#alias du="du -ach | sort -h"
alias ps="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias wget="wget -c"
alias histg="history | grep"
alias myip="curl http://ipecho.net/plain; echo"
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias grep='grep --color=auto'
alias sysinfo='clear ; neofetch --disk_show "/" --disable theme icons /dev/sda2 | lolcat -S 25 -a -d 1'
#alias sysinfo='clear ; neofetch --loop --w3m ~/Pictures/Icons/Cthulhu2.png --disk_show "/" --disable theme icons packages /dev/sda2 | lolcat -S 35' 
#alias bye='shutdown -P now'
#alias seeya='reboot'
alias wireless_on='bluetoothctl connect C2:26:7C:E6:D1:BD'
alias wireless_off='bluetoothctl disconnect'
alias bluetooth_on='sudo systemctl start bluetooth && sleep 5 && bluetoothctl power on'
alias bluetooth_off='bluetoothctl power off && sudo systemctl stop bluetooth'
alias ds4_on='bluetoothctl connect A4:AE:11:A0:E8:F6'
alias ds4_off='bluetoothctl disconnect A4:AE:11:A0:E8:F6'
alias hdmi_sound='pacmd set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo'
alias bat='upower -i $(upower -e | grep 'BAT')'
alias bat2='sudo tlp-stat -b'
alias red='redshift -O 4000'
alias redx='redshift -x'
alias pac='sudo pacman'
alias ss='sudo systemctl'
alias sctl='systemctl --user'
alias ytmp4='youtube-dl -ic --format mp4'
alias ytmp3='youtube-dl -xic --audio-format mp3'
alias ccat='highlight --out-format=ansi'
alias opti='optimus-manager'
alias v='nvim'
alias sv='sudo nvim'
alias clock='tty-clock -Dcbr -C 2'
alias pipes='pipes.sh -t 3 -R'
alias matrix='cmatrix -a -u 6'
alias wine32='env WINEPREFIX=/home/atikin/.wine32 WINEARCH=win32 wine'
alias gtop='gotop -c default -p -r 500ms'
alias clip='xsel -l /dev/null -i --clipboard'
alias paste='xsel -l /dev/null -o --clipboard'
alias winesteam='WINEPREFIX=~/.local/share/lutris/runners/winesteam/prefix64 wine'
alias refreshswapram='~/Documents/Scripts/refreshmemory.sh'
alias mus='cd ~/Music && cmus && cd $OLDPWD'
alias vtop='vtop -t brew --no-mouse'
alias dd='dd status=progress'
alias z='LC_ALL=C _z 2>&1'

# Functions

vd() {
    neovide $1 &>/dev/null &
}

n() {
    nautilus . &
}

export LC_ALL="en_US.UTF-8"


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk
zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-autosuggestions
#zplugin light zsh-users/zsh-completions

# Personal export variables
export I3CONF="$HOME/.config/i3/config"
export NVIMPATH="$HOME/.config/nvim"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export DEVICES="/run/media/atikin/"
