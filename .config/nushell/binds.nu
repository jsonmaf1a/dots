export def main [] {
    return [
        {
            name: completion_menu
            modifier: none 
            keycode: tab 
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: ide_completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: completion_previous_menu
            modifier: shift
            keycode: backtab
            mode: [emacs, vi_normal, vi_insert]
            event: { send: menuprevious }
        }
        {
            name: history_menu
            modifier: control
            keycode: char_r
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: history_menu }
        }
        {
            name: help_menu
            modifier: none
            keycode: f1
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: help_menu }
        }
        {
            name: next_page_menu
            modifier: control
            keycode: char_x
            mode: emacs
            event: { send: menupagenext }
        }
        {
            name: undo_or_previous_page_menu
            modifier: control
            keycode: char_z
            mode: emacs
            event: {
                until: [
                    { send: menupageprevious }
                    { edit: undo }
                ]
            }
        }
        {
            name: history_hint
            modifier: control
            keycode: space
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                ]
            }
        }
        {
            name: insert_left
            modifier: alt
            keycode: char_h
            mode: [vi_insert]
            event: {
                until: [
                    { send: left }
                ]
            }
        }
        {
            name: insert_right
            modifier: alt
            keycode: char_l
            mode: [vi_insert]
            event: {
                until: [
                    { send: right }
                ]
            }
        }
        {
            name: insert_up
            modifier: alt
            keycode: char_k
            mode: [vi_insert]
            event: {
                until: [
                    { send: up }
                ]
            }
        }
        {
            name: insert_down
            modifier: alt
            keycode: char_j
            mode: [vi_insert]
            event: {
                until: [
                    { send: down }
                ]
            }
        }
    ]
}

export def --env "set keybindings" [] {
    $env.config.keybindings = (main)
}

export module activate {
    export-env {
        set keybindings
    }
}

use activate
