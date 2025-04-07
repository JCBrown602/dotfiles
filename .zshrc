# Enable 256 color support for Vim and Terminal
export TERM=xterm-256color

# Add custom paths (if needed)
export PATH="/usr/local/bin:$PATH"

# Example aliases
alias ll='ls -alhs'
alias gs='git status'

# You can also source other config files if you want to stay organized
# Terminal settings
export TERM=xterm-256color

# Set the default text editor to Vim
export EDITOR=vim

# PATH additions (optional - add more if needed)
export PATH="/usr/local/bin:$PATH"

# Quality-of-life aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -alhs'
alias ..='cd ..'
alias ...='cd ../..'
alias vrc='vim ~/.vimrc'
alias zrc='vim ~/.zshrc'
alias src='source ~/.zshrc'
alias dot='code ~/dotfiles/dotfiles.code-workspace'

# Enable color support for grep, ls, etc.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# 🐍 Show virtualenv in prompt
function virtualenv_info {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "%F{10}($(basename $VIRTUAL_ENV))%f "
  fi
}

# Prompt tweak (optional)
#PROMPT='$(virtualenv_info)%F{cyan}%n@%m%f:%F{yellow}%~%f$ '
#PROMPT='$(virtualenv_info)%F{green}%n@%m%f:%F{blue}%~%f %# '
PROMPT='$(virtualenv_info)%F{green}%n@%m%f:%F{yellow}%~%f$ '

# Load .zshrc on terminal start
[ -f ~/.vimrc ] || echo '" Basic vimrc created by zshrc' > ~/.vimrc

# Git branch/status in prompt
function parse_git_branch {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  local status=$(git status --porcelain 2>/dev/null)
  local state=""

  if [[ -n "$status" ]]; then
    state="*"
  fi

  echo " ($branch$state)"
}

# Git branch/status in prompt (right-side)
function parse_git_branch {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  local git_status=$(git status --porcelain 2>/dev/null)
  local state=""

  if [[ -n "$git_status" ]]; then
    state="*"
  fi

  echo " ($branch$state)"
}


# Hook to update RPROMPT before each command
autoload -Uz add-zsh-hook

function update_rprompt {
  RPROMPT="%F{green}$(parse_git_branch)%f"
}

add-zsh-hook precmd update_rprompt

# Left and Right prompt setup
PROMPT='%F{cyan}%n@%m%f:%F{yellow}%~%f$ '

# 🐍 Virtualenvwrapper setup
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source $HOME/.local/bin/virtualenvwrapper.sh
