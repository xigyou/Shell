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


#chattr +a $HISTFILE
wget -o /etc/profile.d/history_command https://raw.githubusercontent.com/xigyou/Shell/master/history_command
chmod +r /etc/profile.d/history_command
chattr +i /etc/profile.d/history_command


touch /var/log/history.log
chmod 777 /var/log/history.log
chattr +a /var/log/history.log

## make history cann't be modified
echo '
source /etc/profile.d/history_command
HISTORY_FILE=/var/log/history.log
#PROMPT_COMMAND=’{ date "+[ %Y%m%d %H:%M:%S `whoami` ] ##### USER:$USER IP:$SSH_CLIENT PS:$SSH_TTY #### $(history 1 | { read x cmd; echo "$cmd from ip:$SSH_CLIENT   $SSH_TTY"; })"; } >>$HISTORY_FILE’
PROMPT_COMMAND='history 1 >>$HISTORY_FILE'
' >>/etc/profile

source /etc/profile




