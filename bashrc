export PS1='\[\e]0;@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export PATH=/home/atarasenko/azul/phabricator-integration/p4-phabricator/arcanist/bin:$PATH
export GOPATH=/home/atarasenko/go
export PATH=$PATH:/home/atarasenko/pycharm-2018.2.4/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=~/.local/bin:$PATH
export PATH=~/bloc/0/fabric-samples/bin:$PATH
export PATH=~/.npm/bin:$PATH
complete -C '/home/atarasenko/.local/bin/aws_completer' aws

export PATH=~/azul/p4v-2018.2.1687764/bin:$PATH
export P4CONFIG=/home/atarasenko/P4CONFIG

alias p=p4
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
alias ap=ansible-playbook
alias uv042='ssh -p2222 root@uv042.com'
alias 2222='ssh -p2222 localhost'
alias jvcert='ssh root@localhost -p5005'
alias jminikube='ssh root@localhost -p5006'
alias bb='ssh atarasenko@buildbot'
alias dev='ssh atarasenko@devastator'
alias dem='ssh atarasenko@demiurge'

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
alias p12='openssl pkcs12 -nodes'

# source <(kubectl completion bash)

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
