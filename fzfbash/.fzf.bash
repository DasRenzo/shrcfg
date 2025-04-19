# FUZZY-FINDER setup, maintained on ACER, by RPA

# Append path with path to fzf-executable in main user's homedir
MYFZFDIR=/home/rens/.fzf/bin
if [ -d $MYFZFDIR ]
	then
	[[ ":$PATH:" != *"$MYFZFDIR"* ]] && PATH="${PATH}:$MYFZFDIR"
fi

# Key bindings
source "/home/rens/.fzf/shell/key-bindings.bash"

# Auto-completion; these commands can output to fzf
source "/home/rens/.fzf/shell/completion.bash"

# Make sure for other users: create a symlink in their home: ln -s /home/rens/.fzf.bash
# Take care off accessrights:
# User can execute fzf in main user's homedir
# User can read the files in subdir 'shell' (for the above mentioned key bindings and auto-cempletion commands)

# If fd exists; we use it as the search-engine and set some nice options.
# Otherwise with the standard value in fzf-default (ev), fzf uses 'find' as its search-engine, which is slower.
# Instructions for package fd-find:
# sudo apt install fd-find (let op: package heet 'fd-find', maar de binary heet 'fdfind')
# dan vanuit /usr/bin: sudo ln -s /usr/bin/fdfind fd
# test of commando 'fd' nu werkt, want deze naam gebruiken we hieronder

if type fd &>/dev/null; then
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude proc --exclude snap --exclude .cache --exclude .undodir --exclude .git 2> /dev/null'
fi
# if 'fd' is not installed on the system, we fall back to 'find' (which is slower)

# force hotkey CTRL-t to follow the set FZF_DEFAULT_COMMAND (in previous line)
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# default options:
export FZF_DEFAULT_OPTS="
--header 'Press ctrl-y to copy itemname'
--layout=reverse
--border
--info=inline
--height=80%
--multi
--preview-window=:nohidden
--preview='if file --mime-type {} | grep -qF image/; then
    xdg-open {}
  else
    batcat --color=always {}
  fi'
--bind 'ctrl-/:toggle-preview'
--color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'
--prompt='rpa-fzf: ' --pointer='▶' --marker='✓'
--bind 'ctrl-y:execute-silent(echo {+} | xclip -se c)'
"

# CTRL-r options concerning bashhistory-handling:
export FZF_CTRL_R_OPTS="
--header 'Press ctrl-y to copy command into clipboard'
--preview 'echo {}' --preview-window up:3:hidden:wrap
--bind 'ctrl-/:toggle-preview'
--color header:italic
--bind 'ctrl-y:execute-silent(echo {+} | xclip -se c)'
"

# ALT-c options: for directory-viewing; this option adds a tree-structure when previewing a directory
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"


# ===========AUTO-COMPLETION-SECTION for certain Commands============

# Use ** as the trigger-sequence (default)
export FZF_COMPLETION_TRIGGER='**'

# Options for autocompletion
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd instead of the default find; on ubuntu you typically must direct a new symlink 'fd' to symlink 'fdfind'
# Meaning: fd ===> fdfind ===> /usr/lib/cargo/bin/fd
# Check with: fdfind --version; followed by fd --version
# The first argument to the function ($1) is the basepath to start traversal.
_fzf_compgen_path() {
  fd --hidden --follow --exclude "snap" --exclude ".git" --exclude ".undodir" --exclude ".cache" . "$1"
}

# Use fd to generate the list for directory-completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude "snap" --exclude ".git" --exclude ".undodir" --exclude ".cache" . "$1"
}

# Advanced customization of fzf options via: _fzf_comprun function
# The first argument to the function is the name of the command, to be included in the case-block.
# You should edit the arguments to preview list-entries with your desired commands/options.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview '' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    xdg-open)     fzf --preview 'xdg-open {}'              "$@" ;;
    *)            fzf --preview 'batcat -n --color=always {}' "$@" ;;
  esac
}

