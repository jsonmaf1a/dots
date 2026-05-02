source ~/.antidote/antidote.zsh
antidote load

autoload -Uz compinit
compinit -C

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

setopt INTERACTIVE_COMMENTS
setopt AUTO_CD
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt CORRECT

bindkey -v
bindkey '^R' fzf-history-widget
bindkey '^ ' autosuggest-accept

# ---------- ALIASES ----------
alias p='sudo pacman -S'
alias pu='sudo pacman -Syu'
alias pr='sudo pacman -Rs'
alias psearch='sudo pacman -Ss'
alias pinfo='sudo pacman -Si'
alias pclean='sudo pacman -Scc'
alias plistf='sudo pacman -Ql'
alias porph='sudo pacman -Qdt'
alias prorph='sudo pacman -Rns $(pacman -Qtdq)'

alias pa='paru -S'
alias pau='paru -Sua'
alias par='paru -Rs'
alias painfo='paru -Si'
alias pasearch='paru -Ss'
alias paclean='paru -Scc'

alias pnpx='pnpm dlx'
alias pnpi='pnpm add'
alias pnpr='pnpm run'
alias pnpg='pnpm add -g'

alias cd='z'
alias ls='eza'
alias l='eza -la'
alias hx='helix'
alias v='nvim'
alias vv='nvim .'
alias cb='wl-copy'
alias rm='rm -iv'
alias md='mkdir'
alias trash='trash -v'
alias pp='ping 8.8.8.8'
alias mpvp="mpvpaper '*'"
alias pick="hyprpicker -a -f "
alias sr='systemctl soft-reboot'
alias gc='git clone --recursive'

alias ":q"='exit'
alias ":q!"='exit'
alias ":qa"='exit'
alias ":qa!"='exit'
alias ":wqa"='exit'

function yy() {
  local tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ]; then
    cd "$cwd"
  fi
  rm -f -- "$tmp"
}

function cdi() {
  local dir
  dir=$(zoxide query -i) || return
  cd "$dir"
}

# ---------- STARTUP ----------
if [[ -o interactive ]]; then
  fastfetch
fi
