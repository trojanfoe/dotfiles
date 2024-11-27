zstyle :compinstall filename '/home/andy/.zshrc'

autoload -Uz compinit
compinit

eval "$(starship init zsh)"

