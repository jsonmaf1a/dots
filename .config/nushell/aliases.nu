alias p = sudo pacman -S                                        # install
alias pu = sudo pacman -Syu                                     # update
alias pr = sudo pacman -Rs                                      # remove
alias psearch = sudo pacman -Ss                                 # search
alias pinfo = sudo pacman -Si                                   # info
alias porph = sudo pacman -Qdt                                  # list orphans
alias pclean = sudo pacman -Scc                                 # clean cache
alias plistf = sudo pacman -Ql                                  # list files
alias prorph = sudo pacman -Rns ...(sudo pacman -Qtdq | lines)  # remove orphans

alias pa = paru -S                                              # install
alias par = paru -Rs                                            # remove
alias pau = paru -Sua                                           # update
alias painfo = paru -Si                                         # info
alias pasearch = paru -Ss                                       # search
alias paclean = paru -Scc                                       # clean cache

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

alias ":q" = exit
alias ":qa" = exit
alias ":wqa" = exit

alias nvchad = with-env {NVIM_APPNAME: "nvchad"} { nvim }
alias astronvim = with-env {NVIM_APPNAME: "astronvim"} { nvim }

alias xgnome = with-env {XINITRC: "~/xsessions/gnome"} { startx }
alias xplasma = with-env {XINITRC: "~/xsessions/plasma"} { startx }
