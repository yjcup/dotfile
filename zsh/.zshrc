alias make="make -j"
alias jo="joshuto"
alias rm="trash"
alias nv="nvim"
alias vim="nvim"
alias v="nvim"
alias oc="opencode"
alias cc="claude"
alias python="python3.11"
# go test
alias gt="cd ~/code/test/"
alias gsu='cd "/Users/yjc/Google Drive/其他计算机/我的计算机/cloud/resume/"'
alias note='cd "/Users/yjc/Google Drive/其他计算机/我的计算机/cloud/Note"'
#yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

#env
export VISUAL=nvim
export EDITOR=nvim
# global secrets
[ -f "$HOME/.config/secrets/global.env" ] && source "$HOME/.config/secrets/global.env"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.0
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
# java env
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home
export JAVA_HOME=/Users/yjc/env/jdk/jdk17
export PATH=$JAVA_HOME/bin:$PATH

source ~/.claude/claude_shell.sh

alias proxyon="export http_proxy=http://127.0.0.1:7897; export https_proxy=http://127.0.0.1:7897; echo 'Terminal proxy ON'"

alias proxyoff="unset http_proxy; unset https_proxy; echo 'Terminal proxy OFF'"

function joshuto() {
	ID="$$"
	mkdir -p /tmp/$USER
	OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
	env joshuto --output-file "$OUTPUT_FILE" $@
	exit_code=$?

	case "$exit_code" in
		# regular exit
		0)
			;;
		# output contains current directory
		101)
			JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
			cd "$JOSHUTO_CWD"
			;;
		# output selected files
		102)
			;;
		*)
			echo "Exit code: $exit_code"
			;;
	esac
}

. "$HOME/.local/bin/env"




# personal scripts
export PATH=/Users/yjc/env/scripts:$PATH

# eza aliases
alias ls='eza'
alias ll='eza -lh --git'


# fzf
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow \
  --exclude .git \
  --exclude node_modules \
  --exclude dist \
  --exclude build \
  --exclude .venv \
  --exclude __pycache__ \
  --exclude target \
  --exclude vendor \
  --exclude Library \
  --exclude .cache"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS="\
  --height=40% \
  --layout=reverse \
  --border \
  --info=inline"

# zinit
source "${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git/zinit.zsh"

# zsh history
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt EXTENDED_HISTORY

# zsh completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# zsh plugins
zinit light zsh-users/zsh-completions
autoload -Uz compinit
compinit
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
