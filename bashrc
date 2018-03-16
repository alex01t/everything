
export PATH=$PATH:/home/alex/GoLand-2017.3.2/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/alex/go

alias g='grep -r --color'
alias d=docker
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gm='git commit -m '
alias gc='git checkout'
alias k='kubectl --namespace=$NS'

alias crt='openssl x509 -text -noout'
alias csr='openssl req -text -noout'
alias vm-minikube='ssh docker@192.168.99.100 -i ~/.minikube/machines/minikube/id_rsa'

source <(kubectl completion bash)

echo 'minikube-s docker: eval $(minikube docker-env)'

function o() {
	[ x == x$1 ] && exit 1
	LIST="`find . -type f -name "*$1*" | sort `"
	if [ x"$LIST" == x ]; then
	    echo Nothing found; exit 0
	fi
	FIRST=`echo "$LIST" | head -1`
	echo "$LIST" | grep --color "$1"
	echo Press any key...
	read V
	if [ x$V == x ]; then
		vi $FIRST
	else
		vi $V
	fi
}
