if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx ALTERNATE_EDITOR 'emacsclient -t'
set -gx EDITOR 'nvim'
alias e $ALTERNATE_EDITOR
# alias e $EDITOR

# chruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
chruby 2.7.2

# asdf
source ~/.asdf/asdf.fish

# elixir
set -gx ERL_AFLAGS '-kernel shell_history enabled'
set PATH /Users/gonglexin/.asdf/installs/elixir/main/.mix/escripts/ $PATH


# neovide
set PATH /Users/gonglexin/projects/neovide/target/release/ $PATH
