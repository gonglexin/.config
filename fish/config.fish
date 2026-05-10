if status is-interactive
    # Commands to run in interactive sessions can go here
end

# proxy
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# Disable fish welcome message
set -U fish_greeting

if type -q eza
    alias ls eza
    alias ll "eza -l -g --icons"
    alias la "eza -la -g --icons"
    alias lt='eza -T --icons --level=2' # 树形展示，2层
    alias lt3='eza -T --icons --level=3'
end

set -gx ALTERNATE_EDITOR 'emacsclient -t'
set -gx EDITOR nvim
set -gx VISUAL nvim
alias e $ALTERNATE_EDITOR
alias v $EDITOR

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ruby
set -gx RUBY_YJIT_ENABLE true

# elixir
set -gx ERL_AFLAGS '-kernel shell_history enabled'

# bat
alias bat="bat --theme='base16-256'"

# rust
set PATH $HOME/.cargo/bin $PATH

# Load secrets (API keys, tokens, etc.)
source ~/.config/fish/secrets.fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# bob
# export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Amp CLI
export PATH="/Users/gonglexin/.amp/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# OpenClaw Completion
source "/Users/gonglexin/.openclaw/completions/openclaw.fish"
