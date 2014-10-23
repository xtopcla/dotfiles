function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='\u@\H:`[[ $(git status 2> /dev/null | grep "nothing to commit (working directory clean)" | wc -l) == 0 ]] && echo "\[\e[31m\]" || echo "\[\e[32m\]"`$(parse_git_branch)\[\e[34m\]\w\[\e[00m\]\$ '
