# Nushell Environment Config File
#
# version = "0.99.1"

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

use std "path add"

$env.ZSH = ($env.HOME | path join ".oh-my-zsh")
$env.BUN_INSTALL = ($env.HOME | path join ".bun")
$env.PNPM_HOME = ($env.HOME | path join ".local" "share" "pnpm")
$env.DOTNET_ROOT = ($env.HOME | path join ".dotnet")
$env.XCURSOR_THEME = "Bibata-Modern-Ice"
$env.QT_QPA_PLATFORM = "xcb"
# $env.GTK_THEME = "Adwaita:dark"
$env.XCURSOR_SIZE = "24"
$env.STARSHIP_CONFIG = ($env.HOME | path join ".config" "starship" "starship.toml")
$env.SSH_AUTH_SOCK = ($env.XDG_RUNTIME_DIR | path join "ssh-agent.socket")
$env.ADB_TRACE = "all"
$env.QML_XHR_ALLOW_FILE_READ = "1"
$env.EDITOR = "nvim"
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
$env.NVM_DIR = ($env.HOME | path join ".nvm")
$env.XDG_DATA_HOME = ($env.HOME | path join ".local" "share")
$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
$env.ELECTRON_OZONE_PLATFORM_HINT = "wayland"
$env.SCRIPTS = ($env.HOME | path join ".local" "bin")
$env.ICONS = ($env.HOME | path join ".local" "share" "icons" "dots")
$env.LC_ALL = "en_US.UTF-8"
$env.LANG = "en_US.UTF-8"

path add /usr/local/go/bin
path add ($env.HOME | path join ".cargo" "bin")
path add ($env.HOME | path join "pyvenv" "bin")
path add ($env.HOME | path join "go" "bin")
path add ($env.DOTNET_ROOT)
path add ($env.DOTNET_ROOT | path join "tools")
path add ($env.HOME | path join "Android" "Sdk" "platform-tools")
path add $env.PNPM_HOME
path add ($env.BUN_INSTALL | path join "bin")
path add ($env.HOME | path join ".ghcup" "bin")

source ./fnm.nu

zoxide init nushell | save -f ~/.cache/zoxide.nu
starship init nu | save -f ~/.cache/starship.nu
carapace _carapace nushell | save --force ~/.cache/carapace.nu

afetch
