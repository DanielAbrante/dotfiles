if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

source ~/.asdf/asdf.fish

export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/usr/bin/flutter/bin"

abbr --add gacm 'git add . && git commit -m "'
