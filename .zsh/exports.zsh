export PATH="/usr/local/sbin:/usr/local/bin:$HOME/.local/bin:$PATH"

# Setup terminal, and turn on colors
#export TERM=xterm-256color
export CLICOLOR=1

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export LESS='--ignore-case --raw-control-chars'
if command -v most > /dev/null
then
    export PAGER='most'
else
    export PAGER='less'
fi
if command -v nvim > /dev/null
then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
#export LC_COLLATE=C

# GitHub token with no scope, used to get around API limits
if [[ -n "%$IS_MAC" ]]
then
    export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.gh_api_token)
fi

export WORKON_HOME="$HOME/.virtualenvs"
if [ -x /usr/local/bin/virtualenvwrapper.sh ]
then
    source /usr/local/bin/virtualenvwrapper.sh
fi
