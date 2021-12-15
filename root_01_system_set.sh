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
chattr +a /var/run/utmp

## make history cann't be modified
echo '
HISTFILE=/root/.commandline_warrior
chattr +a $HISTORY_FILE
HISTSIZE=100000
HISTFILESIZE=1823400
PROMPT_COMMAND=’{ date “+%Y-%m-%d %T ##### USER:$USER IP:$SSH_CLIENT PS:$SSH_TTY #### $(history 1 | { read x cmd; echo “$cmd”; })”; } >>$HISTORY_FILE’
export HISTTIMEFORMAT="[%Y.%m.%d %H:%M:%S-$USER_IP-$USER]"
' >>/etc/profile

source /etc/profile
