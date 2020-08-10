#=================================================#
#============== Zsh Basic setting ================#
ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH="/home/pi/.oh-my-zsh"
plugins=(git vi-mode zsh-autosuggestions zsh-syntax-highlighting zsh-completions)
source $ZSH/oh-my-zsh.sh

#============== autosuggest accept ===============#
bindkey '^[[Z' autosuggest-accept

#=================== Cursor ======================#
bindkey -v
export KEYTIMEOUT=1

function _set_cursor() {
    if [[ $TMUX = '' ]]; then
      echo -ne $1
    else
      echo -ne "\ePtmux;\e\e$1\e\\"
    fi
}
function _set_block_cursor() { _set_cursor '\e[2 q' }
function _set_beam_cursor() { _set_cursor '\e[6 q' }

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
      _set_block_cursor
  else
      _set_beam_cursor
  fi
}
zle -N zle-keymap-select
precmd_functions+=(_set_beam_cursor)
zle-line-init() { zle -K viins; _set_beam_cursor }
#=================================================#

# Remember to use `p10k configure`
