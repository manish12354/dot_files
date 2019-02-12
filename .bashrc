export CLICOLOR=1

export LS_COLORS=di="1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"


[[ -f $HOME/.dircolors ]] && eval $(dircolors -b $HOME/.dircolors)
  if $_isxrunning; then

    [[ -f $HOME/.dircolors_256 ]] && eval $(dircolors -b $HOME/.dircolors_256)

    export TERM='xterm-256color'

    B='\[\e[1;38;5;33m\]'
    LB='\[\e[1;38;5;81m\]'
    GY='\[\e[1;38;5;242m\]'
    G='\[\e[1;38;5;82m\]'
    P='\[\e[1;38;5;161m\]'
    PP='\[\e[1;38;5;93m\]'
    R='\[\e[1;38;5;196m\]'
    Y='\[\e[1;38;5;214m\]'
    W='\[\e[0m\]'

    get_prompt_symbol() {
      [[ $UID == 0 ]] && echo "#" || echo "\$"
    }
    
    parse_git_branch() {
	    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }
    if [[ $PS1 && -f /usr/share/git/git-prompt.sh ]]; then
      source /usr/share/git/git-completion.bash
      source /usr/share/git/git-prompt.sh

      export GIT_PS1_SHOWDIRTYSTATE=1
      export GIT_PS1_SHOWSTASHSTATE=1
      export GIT_PS1_SHOWUNTRACKEDFILES=0

     export PS1="$GY[$Y Manishy$GY@$P\h$GY:$B\W\$(__git_ps1 \"$GY|$LB%s\")$GY]$W\$(get_prompt_symbol) "
     export PS1="$GY$Y Manish$GY:$P\w$GY\$(__git_ps1 \"$LB($LB%s)\")$GY$W\$(get_prompt_symbol) "
    else
      export PS1="$Y Manishy$GY:$B\w$W$(get_prompt_symbol) "
      export PS1="$GY$Y Manishy$GY:$B\w$GY$Y\$(parse_git_branch)$W\$(get_prompt_symbol) "
    fi
  else
    export TERM='xterm-color'
  fi

  alias ll="ls -la"
  alias cdp="cd ~/projects"
  alias gp="git pull -r"
  alias grv="git remote -v"
  alias gco="git checkout"
  alias gcm="git checkout master"
  alias gst="git status"
  alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'
  alias gcp='git cherry-pick'
  alias dc='docker-compose'
  alias d='docker'

  alias -- -="cd -"
  alias ..="cd ../"
  alias ...="cd ../.."
  alias ....="cd ../../.."
  alias .....="cd ../../../.."
  alias ......="cd ../../../../.."
  alias gcp="git cherry-pick"
  alias gd="git diff"
  alias gf="git fetch"



