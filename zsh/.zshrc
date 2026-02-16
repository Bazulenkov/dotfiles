
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle :compinstall filename '/home/bas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE   # команды с пробелом в начале не попадают в историю
setopt SHARE_HISTORY

# Key bindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[5~" up-history
bindkey "^[[6~" down-history
bindkey "^[[3~" delete-char


# Aliases
alias l='eza'
alias la='eza -a'
alias ll='eza -la'
alias lt='eza --tree'

alias grep='grep --color=auto'

alias ..='cd ..'
alias ...='cd ../..'

## Modern CLI tools
alias ls='eza'
alias l='eza'
alias la='eza -a'
alias ll='eza -la'
alias lt='eza --tree'

alias cat='bat --paging=never'
alias batp='bat'                # bat с пейджером, если нужно

#alias find='fd'
#alias grep='rg'
alias du='dust'
alias ps='procs'
#alias sed='sd'
alias diff='delta'

## zoxide вместо cd
eval "$(zoxide init zsh)"
alias cd='z'



source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"
