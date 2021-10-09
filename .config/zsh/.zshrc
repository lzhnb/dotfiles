# # set the xdg
# export XDG_CACHE_HOME="$HOME"/.cache
# export XDG_CONFIG_HOME="$HOME"/.config
# export XDG_DATA_HOME="$HOME"/.local/share

# source plugins
source "$XDG_DATA_HOME"/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$XDG_DATA_HOME"/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$XDG_DATA_HOME"/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
.zsh

# source color mention
autoload -U colors && colors

# refresh the menion
setopt prompt_subst

autoload -U promptinit; promptinit
prompt pure

# set the mention
PROMPT="❰%{$fg[green]%}%n%{$reset_color%}|%{$fg[yellow]%}%1~%{$reset_color%}%{$fg[blue]%}$(git branch --show-current 2&> /dev/null | xargs -I branch echo '(branch)')%{$reset_color%}❱ "

# load extension
for file in ".aliases"; do
    if [ -r "$XDG_CONFIG_HOME"/"$file" ]; then
        source "$XDG_CONFIG_HOME"/"$file"
    fi
done


