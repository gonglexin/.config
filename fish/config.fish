if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set -gx EDITOR 'emacsclient -t'
# set -gx ALTERNATE_EDITOR 'vim'
# alias e $EDITOR
set -gx ALTERNATE_EDITOR 'emacsclient -t'
set -gx EDITOR 'nvim'
alias e $EDITOR

# chruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
chruby 2.7.2

# asdf
source ~/.asdf/asdf.fish

# elixir
set PATH /Users/gonglexin/.asdf/installs/elixir/master/.mix/escripts/ $PATH
set PATH /Users/gonglexin/projects/neovide/target/release/ $PATH
