bindkey -e

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

zmodload zsh/net/tcp
zmodload zsh/net/socket

setopt NO_BEEP
setopt PROMPT_SUBST

export HISTFILE=~/.history
export HISTSIZE=1000000
export SAVEHIST=1000000

setopt NO_SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

command -v exa >/dev/null && alias ls=exa
command -v helix >/dev/null && alias hx=helix
command -v batcat >/dev/null && alias bat=batcat
command -v xdg-open >/dev/null && alias open=xdg-open

export PS1='%F{yellow}%~%f %(!.%F{red}#.%F{green}%%)%f '
export RPS1=""

if [ -e ~/.zshrc_is_remote ]; then
  export PS1="%F{white}$(hostname)%f $PS1"
fi  

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

[ -e /usr/local/go ] && export PATH="/usr/local/go/bin:$PATH"
[ -e ~/.nimble ] && export PATH="/home/user/.nimble/bin:$PATH"

bindkey \^U backward-kill-line

function () {
  local dir
  for dir in /home/*; do
    hash -d "$(basename $dir)=$dir"
  done
}

[ -e /etc/profile.d/nix.sh ] && source /etc/profile.d/nix.sh
[ -e /home/user/.nix-profile/etc/profile.d/nix.sh ] && source /home/user/.nix-profile/etc/profile.d/nix.sh
