## set rm 
echo "mkdir -p ~/Trash
alias rm='mv -t ~/Trash'
alias rm!=/bin/rm
" >>/etc/bashrc
source /etc/bashrc

## protect log 
touch /var/run/utmp
touch /var/log/wtmp

chattr +a -R /var/log/
#chattr +a /var/run/utmp

## make history cann't be modified
echo '
HISTORY_FILE=/var/log/history.log
HISTFILE=~/.bash_history
touch $HISTFILE
HISTSIZE=100000
HISTFILESIZE=1823400
#PROMPT_COMMAND=’{ date "+[ %Y%m%d %H:%M:%S `whoami` ] ##### USER:$USER IP:$SSH_CLIENT PS:$SSH_TTY #### $(history 1 | { read x cmd; echo "$cmd from ip:$SSH_CLIENT   $SSH_TTY"; })"; } >>$HISTORY_FILE’
PROMPT_COMMAND='history 1 >>$HISTORY_FILE'
export HISTTIMEFORMAT="[%Y.%m.%d %H:%M:%S-$SSH_CLIENT-$USER]"
' >>/etc/profile

source /etc/profile


## root only
#chattr +a $HISTFILE
