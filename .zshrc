# OMZ
ZSH_THEME="minimal"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions) 

# SOURCES 
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/kb.zsh
source $ZSH/custom/eww.zsh
source <(fzf --zsh)

# ALIASES
alias p='sudo pacman -S'                        # install       
alias pu='sudo pacman -Syu'                     # update        
alias pr='sudo pacman -Rs'                      # remove        
alias ps='sudo pacman -Ss'                      # search        
alias pi='sudo pacman -Si'                      # info          
alias plo='sudo pacman -Qdt'                    # list orphans  
alias pc='sudo pacman -Scc'                     # clean cache   
alias plf='sudo pacman -Ql'                     # list files    
alias pro='sudo pacman -Rns $(pacman -Qtdq)'    # remove orphans

alias pa='paru -S'                              # install       
alias par='paru -Rs'                            # remove        
alias pai='paru -Si'                            # info          
alias pau='paru -Sua'                           # update        
alias pas='paru -Ss'                            # search        
alias pac='paru -Scc'                           # clean cache   

alias cd='z'
alias :q='exit'
alias ls='eza'
alias hx='helix'
alias rm='trash'
alias cb='wl-copy'
alias gc="git clone"
alias pp='ping 8.8.8.8'
alias mpvp="mpvpaper '*'"
alias pick="hyprpicker -a -f "
alias sr='systemctl soft-reboot'
alias weather='curl "wttr.in/?tqp0"'
alias nvchad="NVIM_APPNAME=nvchad nvim"
alias astronvim="NVIM_APPNAME=astronvim nvim"
alias xgnome="XINITRC=~/xsessions/gnome startx"
alias xplasma="XINITRC=~/xsessions/plasma startx"

# OTHER
setopt appendhistory
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
bindkey -v
bindkey '^ ' autosuggest-accept # Autocomplete on CTRL + SPACE
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

afetch
