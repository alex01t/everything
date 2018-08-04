
export GOPATH=/home/alex/go
export PATH=$PATH:/home/alex/GoLand-2017.3.2/bin
export PATH=$PATH:/home/alex/pycharm-community-2018.1/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=~/.local/bin:$PATH
complete -C '/home/alex/.local/bin/aws_completer' aws

alias g='grep -r --color'
alias d=docker
alias v=vagrant
alias gb='git branch'
alias gp='git pull'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gm='git commit -m '
alias gc='git checkout'
alias k='kubectl --namespace=$ns'
alias uv042='ssh -p2222 root@uv042.com'
alias 2222='ssh -p2222 localhost'
alias jnode-vcert='ssh root@localhost -p5005'

alias amtel='ssh -p 20201 soft@195.208.201.138'
# alias aws='ssh 52.15.233.8'

alias vm-minikube='ssh docker@192.168.99.100 -i ~/.minikube/machines/minikube/id_rsa'

function csr(){
	sed 's/^\s*//g' | openssl req -text -noout
}
export csr
function crt(){
	sed 's/^\s*//g' | openssl x509 -text -noout
}
export crt
alias crl='openssl crl -inform DER -text -noout'

source <(kubectl completion bash)

echo 'minikube-s docker: eval $(minikube docker-env)'

function o() {
	[ x == x$1 ] && exit 1
	LIST="`find . -type f -name "*$1*" | sort `"
	if [ x"$LIST" == x ]; then
	    echo Nothing found
            return
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
