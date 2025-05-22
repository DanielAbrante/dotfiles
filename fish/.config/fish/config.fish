if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/usr/bin/flutter/bin"

abbr --add gacm 'git add . && git commit -m "'

~/.local/bin/mise activate fish | source

# pnpm
set -gx PNPM_HOME "/home/daniel/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
