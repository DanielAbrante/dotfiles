if status is-interactive
    # Commands to run in interactive sessions can go here
end

~/.local/bin/mise activate fish | source

starship init fish | source
zoxide init fish | source

export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/usr/bin/flutter/bin"

set -x ANDROID_HOME $HOME/Android/sdk

fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/emulator

abbr --set-cursor=! --add gacm 'git add --all && git commit -m "!"'

# pnpm
set -gx PNPM_HOME "/home/daniel/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

function dev
    if test -f pnpm-lock.yaml
        pnpm run dev
    else if test -f yarn.lock
        yarn dev
    else if test -f package-lock.json
        npm run dev
    else
        echo "Nenhum lockfile encontrado."
    end
end

function build
    if test -f pnpm-lock.yaml
        pnpm run build
    else if test -f yarn.lock
        yarn build
    else if test -f package-lock.json
        npm run build
    else
        echo "Nenhum lockfile encontrado."
    end
end

function preview
    if test -f pnpm-lock.yaml
        pnpm run preview
    else if test -f yarn.lock
        yarn preview
    else if test -f package-lock.json
        npm run preview
    else
        echo "Nenhum lockfile encontrado."
    end
end
