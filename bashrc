# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
	fi
#	export WD=$WORKDIR
#cd ${WORKDIR}
	  
	alias cw='cd /home/share3/youmingcong/work'
	alias cy="cd /home/share3/YY/"
	alias ce="cd /home/share3/Evolution/"
	alias b='bjobs -u all'
	alias ql='qstat -u jiguanyu|less -S'
	alias ls='ls -F --color=auto'
	alias lsl='lsload'
	alias l='ls -lrt'
	alias m='more'
	alias t='top'
	alias ty='top -u youmingcong'
	alias bw='bjobs |wc -l'
	alias la='ls -a'
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
	alias df='df -h' 
	alias erl="/share/raid1/genome/biosoft/otp_src_R12B-5/bin/erl"
	alias wc="wc -l"
#	export PS1="\[\033[0;37;44m\u@\033[0;32;43m\h:\033[0;33;41m\w$\033[0m\]"
	export PS1="\[\033[1;32;40m[\033[0;32;40m\u@\h:\033[1;35;40m\w\033[1;32;40m]\033[1;31;40m\$\033[1;32;40m \]\n"
#   export PS2='> '
	alias c="cd .." 
	alias cl="clear"
	alias ssh0="ssh master -p 53641"
	alias ssh1="ssh node01"
	alias ssh2="ssh node02"
	alias ssh3="ssh node03"
	alias ssh4="ssh node04"
	alias ssh5="ssh node05"
	alias le="less -S"
	alias soft="cd  /ifs1/EPI/jiguanyu/software"
#alias less='less -S'
#alias make='gmake'
#	alias R=/opt/blc/genome/biosoft/R/bin/R
	alias Rs=/home/local/bin/Rscript
	alias bsuby="bsub -q priority -o %J.log -e %J.err"
#   export PATH=$PATH:/opt/blc/genome/bin/:/opt/blc/self-software/bin/:/opt/blc/genome/biosoft:/ifs1/pub/genome/biosoft:/opt/blc/self-software:/share/raid1/self-software/bin/:/opt/blc/genome/biosoft/R/bin/

	export PATH=$PATH:/opt/blc/genome/biosoft/R/bin/
### Math CDF #######
	MYCDF="/ifs2/EPI/huangshujia/bin/Math-CDF-0.1"
#export MATH_CDF="${MATH_CDF}:${MYCDF}/blib/lib:${MYCDF}/cdflib:${MYCDF}/blib"
	export PERL5LIB="${PERL5LIB}:${MYCDF}:${MYCDF}/blib/lib:${MYCDF}/cdflib:${MYCDF}/blib"

#execute
#ssh a compute

#qrsh
