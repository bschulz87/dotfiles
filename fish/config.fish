if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx TERM xterm-256color
set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx FZF_DEFAULT_OPTS '-m --height 50% --border'
alias vim="nvim"
source /opt/asdf-vm/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish
