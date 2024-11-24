alias p = sudo pacman -S                        # install       
alias pu = sudo pacman -Syu                     # update        
alias pr = sudo pacman -Rs                      # remove        
alias ps = sudo pacman -Ss                      # search        
alias pi = sudo pacman -Si                      # info          
alias plo = sudo pacman -Qdt                    # list orphans  
alias pc = sudo pacman -Scc                     # clean cache   
alias plf = sudo pacman -Ql                     # list files    
alias pro = sudo pacman -Rns (pacman -Qtdq)    # remove orphans

alias pa = paru -S                              # install       
alias par = paru -Rs                            # remove        
alias pai = paru -Si                            # info          
alias pau = paru -Sua                           # update        
alias pas = paru -Ss                            # search        
alias pac = paru -Scc                           # clean cache   

alias pnpx = pnpm dlx
alias pnpi = pnpm add 
alias pnpg = pnpm add -g
alias pnpr = pnpm run

alias cd = z
alias hx = helix
alias rm = trash
alias md = mkdir
alias l = ls -la
alias cb = wl-copy
alias gc = git clone
alias pp = ping 8.8.8.8
alias pick = hyprpicker -a -f 
alias sr = systemctl soft-reboot
alias nvchad = NVIM_APPNAME=nvchad nvim
alias astronvim = NVIM_APPNAME=astronvim nvim
alias xgnome = XINITRC=~/xsessions/gnome startx
alias xplasma = XINITRC=~/xsessions/plasma startx
