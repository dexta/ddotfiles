# ~/.bashrc: executed by bash(1) for non-login shells.
xinput --set-prop "8" "Device Accel Constant Deceleration" 3
# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias la='ls $LS_OPTIONS -lah'
alias l='ls $LS_OPTIONS -l'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


if [[ ${EUID} == 0 ]] ; then
        sq_color="\[\033[0;31m\]"
  else          
        sq_color="\[\033[0;34m\]"
  fi

PS1="$sq_color\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[01;37m\]\342\234\227$sq_color]\342\224\200\")[\[\033[01;37m\]\t$sq_color] \`pwd\` $  \342\224\200[\[\033[01;37m\]\u@\h$sq_color]\n\342\224\224\342\224\200\342\224\200> \[\033[01;37m\]\W $sq_color $ \[\033[01;37m\]>>\\[\\033[0m\\] "

unset sq_color

