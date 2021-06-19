#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make colorcoding available for everyone

Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


# new alert text
ALERT=${BWhite}${On_Red} # Bold White on red background

# mostly used alias functions

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
alias bye='shutdown -P now'
alias seeya='reboot'
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
alias ytmp4='youtube-dl -ic --format mp4'
alias ytmp3='youtube-dl -xic --audio-format mp3'
alias ccat='highlight --out-format=ansi'
alias opti='optimus-manager'
alias v='vim'
alias sv='sudo vim'
alias clock='tty-clock -Dcbr -C 6'
alias pipes='pipes.sh -t 3 -R'
alias matrix='cmatrix -a -u 6'
alias wine32='env WINEPREFIX=~/.wine32 WINEARCH=win32 /opt/wine-lol/bin/wine'
alias gotop='gotop -c monokai -p -m -r 2'
alias clip='xsel -l /dev/null -i --clipboard'
alias paste='xsel -l /dev/null -o --clipboard'
alias winesteam='WINEPREFIX=~/.local/share/lutris/runners/winesteam/prefix64 wine'
alias refreshswapram='~/Documents/Scripts/refreshmemory.sh'
alias mus='cd ~/Music && cmus && cd $OLDPWD'
alias vtop='vtop -t parallax --no-mouse'

# Environment variables
export EDITOR="vim"
set -o vi
export PY="/home/atikin/Documents/Programming/Python"
export JS="/home/atikin/Documents/Programming/JavaScript"

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

# jump directorys upwards until it hits a directory with multiple folders
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# create an directory and directly cd into it
mcd () {
  mkdir -p $1
  cd $1
}

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"


export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
stty -ixon
shopt -s autocd
#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"


