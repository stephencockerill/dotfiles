# start from the default profile
source /etc/profile
# load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# aliases
alias ll='ls -FGlAhp'
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"				    # ~:	    Go Home
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
