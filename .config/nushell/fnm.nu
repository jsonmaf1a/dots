use std "path add"

^fnm env --json | from json | load-env
path add ([([$env.FNM_MULTISHELL_PATH "bin"] | path join) $env.PATH] | str join (char esep))
