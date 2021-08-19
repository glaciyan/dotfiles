export ZSH_FOLDER="$HOME/.zsh"
source "$ZSH_FOLDER/aliasrc"
source "$ZSH_FOLDER/exportrc"
source "$ZSH_FOLDER/path"
source "$ZSH_FOLDER/lib/directories.zsh" 
source "$ZSH_FOLDER/lib/theme-and-appearance.zsh" 
source "$ZSH_FOLDER/lib/compl.zsh" 
source "$ZSH_FOLDER/lib/url.zsh" 2> /dev/null

# change prompt:
PS1=" %F{cyan}%U%n%u%f %F{yellow}%2~%f%F{blue}]%f%(?.$.%F{red}$%f) "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

source $ZSH_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
