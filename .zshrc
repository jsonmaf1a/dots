# OMZ
ZSH_THEME="minimal"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

# SOURCES
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/kb.zsh
source $ZSH/custom/vim.zsh
source <(fzf --zsh)

# ALIASES
alias p='sudo pacman -S'                            # install
alias pu='sudo pacman -Syu'                         # update
alias pr='sudo pacman -Rs'                          # remove
alias psearch='sudo pacman -Ss'                     # search
alias pinfo='sudo pacman -Si'                       # info
alias pclean='sudo pacman -Scc'                     # list orphans
alias plistf='sudo pacman -Ql'                      # clean cache
alias porph='sudo pacman -Qdt'                      # list files
alias prorph='sudo pacman -Rns $(pacman -Qtdq)'     # remove orphans

alias pa='paru -S'                                  # install
alias pau='paru -Sua'                               # update
alias par='paru -Rs'                                # remove
alias painfo='paru -Si'                             # info
alias pasearch='paru -Ss'                           # search
alias paclean='paru -Scc'                           # clean cache

alias pnpx='pnpm dlx'
alias pnpi='pnpm add'
alias pnpr='pnpm run'
alias pnpg='pnpm add -g'

alias cd='z'
alias ls='eza'
alias hx='helix'
alias v='nvim'
alias vv='nvim .'
alias cb='wl-copy'
alias rm='trash -v'
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

alias nvchad='NVIM_APPNAME="nvchad" nvim'
alias astronvim='NVIM_APPNAME="astronvim" nvim'
alias nvim10='NVIM_APPNAME="nvim10" ~/.local/neovim-0.10.4/usr/bin/nvim'

alias xgnome='XINITRC="~/xsessions/gnome" startx'
alias xplasma='XINITRC="~/xsessions/plasma" startx'
alias wlplasma='/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland'

# EXEC
setopt appendhistory
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
bindkey '^ ' autosuggest-accept # Autocomplete on CTRL + SPACE
fastfetch
# afetch
