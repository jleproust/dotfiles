source "$HOME/.zsh/colors.zsh"
source "$HOME/.zsh/setopt.zsh"
source "$HOME/.zsh/exports.zsh"
source "$HOME/.zsh/prompt.zsh"
source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/bindkeys.zsh"
source "$HOME/.zsh/functions.zsh"
source "$HOME/.zsh/history.zsh"
source "$HOME/.zsh/zsh_hooks.zsh"
source "$HOME/.zsh/z/z.sh"
[[ -e "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}
