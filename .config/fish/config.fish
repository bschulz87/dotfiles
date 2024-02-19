if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/go/bin" $PATH
set -gx TERM xterm-256color
set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx FZF_DEFAULT_OPTS '-m --height 50% --border'
alias vim="nvim"
alias ls="eza"
alias cat="bat -p"
source /opt/asdf-vm/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish

# Created by `pipx` on 2024-02-14 15:57:20
set PATH $PATH /home/ben/.local/bin
zoxide init --cmd cd fish | source
#starship init fish | source
