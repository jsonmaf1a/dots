# ENV
# export HISTFILE="$HOME/.zsh_history"

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="nvim"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

export PNPM_HOME="$HOME/.local/share/pnpm"
export BUN_INSTALL="$HOME/.bun"
export DOTNET_ROOT="$HOME/.dotnet"
export NVM_DIR="$HOME/.nvm"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

[[ -S $XDG_RUNTIME_DIR/ssh-agent.socket ]] && \
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export ELECTRON_OZONE_PLATFORM_HINT="wayland"
export QT_QPA_PLATFORM="wayland"
export GDK_BACKEND="wayland"
export XDG_SESSION_TYPE="wayland"
if [[ $HYPRLAND_INSTANCE_SIGNATURE ]]; then
  export XDG_CURRENT_DESKTOP="Hyprland"
  export XDG_SESSION_DESKTOP="Hyprland"
fi

export GTK_THEME='Adwaita:dark'
export XCURSOR_THEME="BreezeX-Black"
export XCURSOR_SIZE=28

export WLR_DRM_NO_ATOMIC=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_QPA_PLATFORMTHEME='qt5ct'
export QT_STYLE_OVERRIDE='qt5ct'


export SCRIPTS="$HOME/.local/bin/scripts/"
export ICONS="$HOME/.local/share/icons/dots"

export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$DOTNET_ROOT/tools"
export PATH="$PNPM_HOME:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/pyvenv/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
