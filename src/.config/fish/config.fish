if status is-interactive
# Commands to run in interactive sessions can go here

function fish_prompt
    set -l prompt_symbol '>'
    fish_is_root_user; and set prompt_symbol '#'

    echo -s  (prompt_pwd)" "$prompt_symbol" " 
end

function drop-post
    if test (count $argv) -ne 2 
        echo "Insert two arguments! (File, device)"
    else
        set file $argv[1]
        set cell $argv[2]

        tailscale file cp $file $cell:
    end
end
function drop-get
    tailscale file get ~/taildrop/
end

# sets fish welcome message to null
set fish_greeting

# utils aliases
alias ls='ls -a --color=auto'
alias lsa='ls -a --color=auto . *'
alias grep='grep --color=auto'
alias ascii='jp2a --colors -c ~/.config/kitty/images/blindseer.png'

# config aliases
alias chypr='nvim ~/.config/hypr/'
alias cnvim='nvim ~/.config/nvim/'
alias cterm='nvim ~/.config/kitty/'

# power aliases
alias sdn='shutdown now'
alias rbt='reboot'

fish_add_path -a --path ~/.local/bin:
fish_add_path -a --path ~/.cargo/bin:
fish_add_path -a --path ~/scripts:

# VI mode
fish_vi_key_bindings
set fish_cursor_insert block
set fish_cursor_default block

ascii
end
