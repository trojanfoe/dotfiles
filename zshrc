zstyle :compinstall filename '/home/andy/.zshrc'

autoload -Uz compinit
compinit

eval "$(starship init zsh)"
starship config command_timeout 1000

