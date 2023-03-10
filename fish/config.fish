if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx ALTERNATE_EDITOR 'emacsclient -t'
set -gx EDITOR 'nvim'
alias e $ALTERNATE_EDITOR
# alias e $EDITOR

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.fish

# ruby
set -gx RUBY_YJIT_ENABLE true

# elixir
set -gx ERL_AFLAGS '-kernel shell_history enabled'
set PATH /Users/gonglexin/.asdf/installs/elixir/main/.mix/escripts/ $PATH

# rust
set PATH $HOME/.cargo/bin $PATH
