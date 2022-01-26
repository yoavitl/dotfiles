if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



export ZSH="$HOME/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="/opt/homebrew/Cellar/pyenv-virtualenv/1.1.5/shims:/opt/homebrew/bin:$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

source $ZSH/oh-my-zsh.sh


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yovi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yovi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yovi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yovi/google-cloud-sdk/completion.zsh.inc'; fi

function mkd() {
	mkdir -p "$@" && cd "$_";
}

function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

function server() {
	localadd=`ipconfig getifaddr en0`
	local port="${1:-8000}";
	python -m http.server
	open "http://${localadd}:${port}/" &
}

function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}
sshu () { ssh -t -i /Users/???/.ssh/id_rsa -o "StrictHostKeyChecking no" yoav@"$@" "sudo su -";}

function aprint() { awk "{print \$${1:-1}}"; }
alias tf=terraform
