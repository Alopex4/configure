# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias vm='ssh root@192.168.122.100'
    alias vm2='ssh root@192.168.122.200'
    alias cent7='ssh alpha@192.168.122.70'
    alias xmysql='ssh root@192.168.122.88'
    alias arch_linux='ssh leslie@192.168.122.77'
    alias vmu='ssh leslie@192.168.122.155'
    alias kali='ssh root@192.168.122.111'
	alias clean_problem='sudo rm /var/crash/*'
    alias gcp_linux='ssh root@35.234.42.1'
    alias spruceTest='ssh sprucetest@192.168.122.254'
    alias gentoo='ssh alopex@192.168.122.36'

	# networking setting
    alias ethup='sudo ip link set enp4s0 up'
    alias ethdown='sudo ip link set enp4s0 down'

    # virsh setting
    alias vm-on='virsh start centos_x'
    alias vm-off='virsh shutdown centos_x'

	# self script
 	alias theday="date '+%r %A, %d %B %Y (GMT+8)'"
	alias diary="bash /home/alopex/Desktop/doc/scripts/shell/append_daily.sh"
	alias take_rest="bash /home/alopex/Desktop/doc/scripts/shell/breaking_clock.sh &"
	#alias mark="python3 /home/alopex/Desktop/doc/scripts/python/mark.py"
    alias mark="python3 /home/alopex/Desktop/doc/scripts/python/qkmd/qkmd/qkmd.py"
	alias cd_to_T="mkdir -p /tmp/T 2>/dev/null; cd /tmp/T"
	alias rshell="exec bash -l"
	alias proxy="export https_proxy=http://127.0.0.1:8123; export http_proxy=http://127.0.0.1:8123"
	alias ssr="python /opt/shadowsocksr/shadowsocks/local.py -c /opt/shadowsocksr/config.json &"
	#alias kssr="kill -9 `pstree -p | grep 'python' | egrep -o '[0-9]{1,}'`"
    
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    # colorful print code
    alias catc='pygmentize -g'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# some interesting alias from https://opensource.com/article/19/7/bash-aliases
# sort by file size
alias lt='ls --human-readable --size -1 -S --classify'
# mount just print mounted drives
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3;  }' | column -t | egrep ^/dev/ | sort"
# print history command
alias gh='history | grep'
# sort by modify time
alias left='ls -t -1'
# vultr virtual machine
alias vultr_sg1='ssh root@45.77.40.70 -p 22' 

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Custome function
## Get the weather
weather(){
    curl -s "wttr.in/$1?m1"
}

ask_google(){
	search_str=`echo "$@" | tr ' ' '+'`
	chromium-browser  --app="https://www.google.com/search?q="${search_str}""
}

ipip(){
    local request_parse="${1}"

    echo ${request_parse} | egrep -xq '([0-9.]{1,4}){3}[0-9]{1,3}'
    if [ $? == 0 ]
    then
        hosts=${request_parse}
    else
        echo ${request_parse} | grep -iq 'http'
        if [ $? == 0 ] 
        then
            request_parse=`echo ${request_parse} | cut -d ':' -f2 | cut -d '/' -f3`
        fi
        hosts=`getent hosts ${request_parse} | awk '{print $1}'`
    fi

    for host in ${hosts}
    do 
        echo '/*-----<<<# begin #>>>------*/'
        echo ">> ${host} <<"
        parse ${host}
        echo '/*-----<<<# end #>>>--------*/'
        echo ''
    done
}

#parse(){
    #local ip="${1}"
    #local token="80977e50c0ef36"
    #export https_proxy=http://127.0.0.1:8123
    #export http_proxy=http://127.0.0.1:8123
    #curl ipinfo.io/${ip}?token=${token}
    #echo
#}

parse(){
    local ip="${1}"
    #export https_proxy=http://127.0.0.1:8123
    #export http_proxy=http://127.0.0.1:8123
    parse_raw=`curl --fail --silent --show-error http://ip-api.com/json/${ip}`
    parse_length=${#parse_raw}
    echo ${parse_raw} | python3 -m json.tool
}

mark_to_file(){
    python3 /home/alopex/Desktop/doc/scripts/python/qkmd/qkmd/qkmd.py ${1} -o ~/Desktop/mark.md
}

qr_code(){
    url=${1}
    name=${2}
    file_name=${name:-qrcode.png}
    qrencode -o /tmp/${file_name} ${url} -s 8
    display /tmp/${file_name}
}

transfer() { 
if [ $# -eq 0 ]; 
    then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; 
    return 1;
fi 

tmpfile=$( mktemp -t transferXXX ); 

if tty -s; 
    then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); 
    curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; 
else 
    curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; 
fi; 
cat $tmpfile; 
rm -f $tmpfile;
}

xdns(){
    sudo echo -n "nameserver 8.8.8.8\nnameserver 8.8.4.4\n" > /etc/resolv.conf;
}

## promoto

#PS1="\[\e[36;1m\]\h:\[\e[32;1m\]\w$ \[\e[0m\]"
#PS1="\[\e[36;1m\]\u \[\e[31;1m\]\W>\[$(tput sgr0)\] \[\e[0m\]"
#PS1="\[\e[31;1m\]\W 🍀  \[$(tput sgr0)\]\[\e[0m\]"
#PS1="\[\e[32;1m\]🍀 \W \[\e[31;1m\]> \[\e[0m\]"
#PS1="\[\e[32;1m\] 🌸 \W \[\e[31;1m\]> \[\e[0m\]"
PS1=" 🌸 \W\[\e[0m\] \[\e[31;1m\]> \[\e[0m\]"
#PS1="\[\e[32;1m\]🦝  \W \[\e[31;1m\]> \[\e[0m\]"
#PS1="\[\e[31;1m\] $ \[\e[0m\]"
# `fc` command editor
FCEDIT='vim'

