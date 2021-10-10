# source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# setting
# set the height and preview
export FZF_DEFAULT_OPTS="--height 50% --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

# ignore some directories and files
export FZF_DEFAULT_COMMAND="fd --exclude={\
.git,\
.idea,\
.vscode,\
.sass-cache,\
node_modules,\
build,\
__pycache__,\
*.pyc\
} --type f"


