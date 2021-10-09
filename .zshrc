# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source plugins
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source color mention
autoload -U colors && colors

# refresh the menion
setopt prompt_subst

# set the mention
PROMPT='❰%{$fg[green]%}%n%{$reset_color%}|%{$fg[yellow]%}%1~%{$reset_color%}%{$fg[blue]%}$(git branch --show-current 2&> /dev/null | xargs -I branch echo "(branch)")%{$reset_color%}❱ '

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

