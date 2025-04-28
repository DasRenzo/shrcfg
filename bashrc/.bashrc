# BASHRC-file, maintained on "ACER"

# package 'tldr' is amazing for shorthand man-info on other packages

# shelloption globbing
shopt -s globstar

# a minimal rescue-path; use standardpath, and if needed extend on the spot
# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

# umask mode
umask 0027

# path-extension(s)
MYPATHDIR=$HOME/bin
if [ -d $MYPATHDIR ]
then
 [[ ":$PATH:" != *"$MYPATHDIR"* ]] && PATH="${PATH}:$MYPATHDIR"
fi

# default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# batcat; don't alter the theme morron; default-theme is the default for a reason
command -v batcat &> /dev/null && alias bat='batcat' && alias cat='batcat --paging=never'

# fzf-trics
alias vuf='nvim $(fzf)'
alias lfuc='command ls -a | fzf | xargs -I {} cat {}'

# convenience-aliases
alias secdoc='nvim /auks/kbrpa/documentatie/security.txt'
alias netdoc='nvim /auks/kbrpa/documentatie/networking.txt'

# backup-scripts
alias bacgd='/auks/scripts/produktie/backup_to_gd.sh'
alias bacflash='/auks/scripts/produktie/backup_to_flash.sh'
alias bacserver='/auks/scripts/produktie/backup_to_server.sh'

# cd-aliases
alias cd..='cd ..'
alias ..='cd ..'
alias cd...='cd .. && cd ..'
alias ...='cd .. && cd ..'

# mijn dirs
alias auks='cd /auks && ls'
alias srpa='cd /auks/scripts/produktie && ls'
alias frpa='cd /auks/scripts/produktie/firewall && ls'
alias home='cd ~ && ls'
alias jau='cd /jau && ls'
alias shrcfg='cd /shrcfg && ls'
alias doc='cd /auks/kbrpa/documentatie && ls'
alias scr='cd ~/Pictures/Screenshots && ls'

# nvim en cfgfile-launchers
alias vim='nvim'
alias vimba='nvim ~/.bashrc'
alias vimrc='nvim ~/.vimrc'
alias vimi='nvim ~/.config/nvim/init.vim'
alias vimf='nvim ~/.fzf.bash'
alias vimbr='nvim ~/.config/broot/conf.hjson'
alias vimve='nvim ~/.config/broot/verbs.hjson'
alias vimki='nvim ~/.config/kitty/kitty.conf'
alias vimgh='nvim ~/.config/ghostty/config'
alias vimya='nvim ~/.config/yazi/yazi.toml'
alias ykeys='nvim ~/.config/yazi/keymap.toml'

# exit-codes
alias e?='echo $?'

# environment-vars
alias ep='echo $PATH'

# sudo en su
alias si='sudo -i'
alias sus='sudo -s'
alias su='su -l'

# package management
alias install='sudo apt install'
alias lpi='apt list --installed | less' #lokaal geinstalleerde pakketjes
alias csapt='apt-cache search --names-only' #zoek package existentie in all (local) repos; hoeft niet te zijn geinstalleerd
alias sapt='apt search'
alias aptar='sudo apt autoremove'
alias upgr='sudo apt update && sudo apt upgrade'

# source
alias sb='source ~/.bashrc'

# network
alias ssp='sudo ss -ltnp | rg' #show open ports with processes

# find
alias rfind='find / -iname 2> /dev/null'
alias hfind='find ~ -iname 2> /dev/null'

# git aliases - meest gebruikt
alias gst='git status' #status
alias gcam='git commit -am' #autostage all changes in tracked files, and use an inline message
alias gada='git add .' #bring all to staging-area
alias gcm='git commit -m' #what follows between quotes is an inline-commit-message
alias gps='git push' #push to remote
alias gpu='git push' #push to remote

# git aliases
alias gcl='git config --list --show-origin' #list config with file-origin for current values
alias grc='git rm --cached' #untracks a file, but does not delete it from wd
alias glo='git log --pretty=oneline' #log with one line per commit
alias gls='git log --stat' #summary log
alias glp='git log -p -1' #last patch/diff
alias gamend='git commit --amend' #replaces last commit, in case you forgot something, or comitted too early
alias grv='git remote -v' #list remotes with shortname and full url
alias grso='git remote show origin' #show tracking-details for pull/push
alias grr='git remote rename' #rename an existing shortname (old ==> new)
alias gco='git checkout' #checkout or switch to a different commit/branche
alias grh='git reset --hard' #reset project to a previous commit, discarding the more recent commits

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
HISTSIZE=2500
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
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
    alias ls='ls --color=auto --group-directories-first -hltra' # lsrpa added by rpa
    alias dir='dir --color=auto -lha'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

LS_COLORS=$LS_COLORS:'di=1;36:'

# Fuzzyfinder <== shell-integratie
# Let op: ik heb fzf via een github-clone overgezet. Dus niet geinstalleerd via een package uit een repo van ubuntu.
# De binary staat dan in: ~/.fzf/bin
# Source de fzf-config (if exists)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Broot and br
# Running broot for the first time, makes the user run the integrate for the "br-shellfunction", or refuse/reject it
# The shellfunction 'br' can be installed at any time by typing: "broot --install" (as the loggedin user)
# Het voegt een source-regel toe in .bashrc zoals het tweede deel hieronder (de toevoeging is dus overbodig en kun je weghalen)
# Symlink the broot-config-file en verb-file in ~/.config/broot naar /shrcfg/broot
# If br-shellfunction exists, source it:
[ -f ~/.config/broot/launcher/bash/br ] && source ~/.config/broot/launcher/bash/br

# redirecting output:
# stdoutput is stroom1: echo 'hello' 1> /dev/null
# error-output is stroom2: echo 'hello' 2> /dev/null
# beide stromen in een ampersand: echo 'hello' &> /dev/null

# yazi terminal file manager y-function
# path-extension(s)
MYPATHDIR=/snap/yazi/current
if [ -d $MYPATHDIR ]
then
 [[ ":$PATH:" != *"$MYPATHDIR"* ]] && PATH="${PATH}:$MYPATHDIR"
fi

# the y-function leaves you in the dir that was current when exiting yazi
# check eerst of 'yazi' aanwezig is
if command -v yazi &> /dev/null; then
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
fi

# eza (a better ls) als ez
command -v eza &> /dev/null && alias ez='eza --tree --level=2 --sort=modified'

# gio trash
# use 'gio trash' for removing files/dirs in terminal to a user's trashcan; works recursively; uitbreidbaar met -f (force)
# use 'sudo gio trash' for elevated privileges

# oh-my-posh
if [[ 'true' || ! $GNOME_TERMINAL_SCREEN ]]; then
command -v oh-my-posh &> /dev/null && eval "$(oh-my-posh init bash --config /shrcfg/omp/stelbent-compact.minimal.omp.json)"
fi

# zoxide, standard cfg with z and zi (interactive with fzf-search)
command -v zoxide &> /dev/null && eval "$(zoxide init bash)"
# zoxide aliases
alias ze='zoxide edit'
alias zq='zoxide query -l -s'

