# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# POWERLINETHEME
POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K=truncate_beginning
POWERLEVEL9K_TIME_BACKGROUND=black
POWERLEVEL9K_TIME_FOREGROUND=white
POWERLEVEL9K_TIME_FORMAT=%D{%I:%M}
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=green
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=white
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=black
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=black
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=blue
POWERLEVEL9K_FOLDER_ICON=
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON=●
POWERLEVEL9K_VCS_UNSTAGED_ICON=±
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=↓
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=↑
POWERLEVEL9K_VCS_COMMIT_ICON=' '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{'248'}╭─%F{'248'}'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{'248'}╰%f '
POWERLEVEL9K_CUSTOM_OS_ICON='echo '
POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND='248'
POWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND='237'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon ssh root_indicator dir vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs time ram)

ZSH_THEME=powerlevel10k/powerlevel10k

#############
##Oh-my-zsh##
#############

export ZSH="/home/y0ch3n/.oh-my-zsh"
plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

################
##Other Plugin##
################

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^[[Z' autosuggest-accept

############## 
## My alias ## 
############## 

alias ssha='ssh autolab@autolab -p 2222'
alias sshy='ssh y0ch3n@140.112.94.129 -p 2020'
alias cdg='cd ~/Documents/GitHub/'
alias rg='. ranger'
alias ls='colorls';

############## 
## Shortcut ## 
############## 

bindkey "^[k" clear-screen

##################
### Env setting ## 
################## 

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$WORKSPACE/lib
export PATH=$PATH:$WORKSPACE/bin
source "`ueberzug library`"

function cd(){ builtin cd "$@" && colorls}

function uscp() {
    scp -P 2020 "$1" y0ch3n@yochen_linux:~/Downloads
}

function dscp() {
    scp -P 2020 y0ch3n@yochen_linux:"$1" ~/Downloads
}

function rsl() {
    rsync -avzh -e 'ssh -p 2020' y0ch3n@140.112.94.129:~/Documents/sync/ ~/Documents/sync/
}

function rsp() {
    rsync -avzh -e 'ssh -p 2020' ~/Documents/sync/ y0ch3n@140.112.94.129:~/Documents/sync/
}
neofetch --source ~/.config/neofetch/logo.txt

# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Golang
export PATH=$PATH:/usr/local/go/bin

# Cursor
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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /home/y0ch3n/.config/broot/launcher/bash/br
