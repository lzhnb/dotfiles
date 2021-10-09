# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source plugins
source "$XDG_DATA_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$XDG_DATA_HOME/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh"

if [ -n "$XDG_DATA_HOME/zsh/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]; then
    source "$XDG_DATA_HOME/zsh/powerlevel10k/powerlevel10k.zsh-theme"
else
    autoload -U colors && colors
    setopt prompt_subst
    PROMPT="❰%{$fg[green]%}%n%{$reset_color%}|%{$fg[yellow]%}%1~%{$reset_color%}%{$fg[blue]%}$(git branch --show-current 2&> /dev/null | xargs -I branch echo '(branch)')%{$reset_color%}❱"
fi

# load extension
for file in ".aliases"; do
    if [ -r "$XDG_CONFIG_HOME/$file" ]; then
        source "$XDG_CONFIG_HOME/$file"
    fi
done

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] || source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"

