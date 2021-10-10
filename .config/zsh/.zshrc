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

autoload -U colors && colors
if [ -n "$XDG_DATA_HOME/zsh/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]; then
    source "$XDG_DATA_HOME/zsh/powerlevel10k/powerlevel10k.zsh-theme"
else
    setopt prompt_subst
    PROMPT="❰%{$fg[green]%}%n%{$reset_color%}|%{$fg[yellow]%}%1~%{$reset_color%}%{$fg[blue]%}$(git branch --show-current 2&> /dev/null | xargs -I branch echo '(branch)')%{$reset_color%}❱"
fi

# load extension
for file in "aliases" "fzf"; do
    if [ -r "$XDG_CONFIG_HOME/zsh/$file.zsh" ]; then
        source "$XDG_CONFIG_HOME/zsh/$file.zsh"
    fi
done

# apply the binary exectuable file in ~/.local/bin
path=("$HOME/.local/bin" $path)
# export to sub-processes (make it inherited by child processes)
export PATH

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] || source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$XDG_DATA_HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$XDG_DATA_HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$XDG_DATA_HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$XDG_DATA_HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda activate
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
