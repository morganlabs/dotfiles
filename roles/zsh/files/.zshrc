# VARIABLES ------------------ #
export DOTFILES="$HOME/Dotfiles"
export ZSH_HOME="$HOME/.zsh"
export ZSH_PLUGINS="$ZSH_HOME/plugins"
export HISTTIMEFORMAT="[%F %T]"

[[ ! -d "$ZSH_HOME" ]] && mkdir -p "$ZSH_HOME"
path+=("$HOME/.local/share/npm/bin")
path+=("$DOTFILES/bin")

# HISTORY -------------------- #
SAVEHIST=5000
HISTSIZE="$SAVEHIST"
HISTFILE="$ZSH_HOME/history"

# OPTIONS -------------------- #
setopt autocd
setopt HIST_FIND_NO_DUPS # Ignore duplicates when searching history
setopt INC_APPEND_HISTORY # Append history on-enter key, not on-exit

# PLUGINS -------------------- #
[[ ! -d "$ZSH_PLUGINS" ]] && mkdir -p "$ZSH_PLUGINS"

PLUGINS=(
	"zsh-users/zsh-autosuggestions"
	"zsh-users/zsh-syntax-highlighting"
	"zsh-users/zsh-history-substring-search"
	"olets/zsh-abbr"
)

for PLUGIN in "${PLUGINS[@]}"; do
	PLUGIN_PATH="$ZSH_PLUGINS/$PLUGIN"
	if [[ ! -d "$PLUGIN_PATH" ]]; then
		echo "Installing $PLUGIN..."
		git clone "https://github.com/$PLUGIN" "$PLUGIN_PATH"
	fi

	PLUGIN_NAME="${PLUGIN##*/}"

	if [[ -f "$PLUGIN_PATH/$PLUGIN_NAME.plugin.zsh" ]]; then
		path+="$PLUGIN_PATH"
		fpath+="$PLUGIN_PATH"
		source "$PLUGIN_PATH/$PLUGIN_NAME.plugin.zsh"
	else
		echo "Error loading $PLUGIN"
	fi
done

## History Substring Search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ABBREVIATIONS -------------- #
function mkabbr() {
	ALIAS_AND_COMMAND="$1"

	alias "$ALIAS_AND_COMMAND"
	abbr -S "$ALIAS_AND_COMMAND" &>/dev/null
}

alias cat="bat -n --theme Nord"
alias mkdir="mkdir -p"
alias ls="eza --long --icons --colour=always --all -T --level 1 --group-directories-first -b -h --git"
alias src="source $HOME/.zshrc"
alias vi="nvim"
alias vim="nvim"
alias gbr="git branch --format=\"'%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:green) (%(committerdate:relative)) [ %(authorname) ]'\""
alias js="joshuto"

mkabbr c="clear"
mkabbr l="ls"
mkabbr e="exit"

mkabbr gi="git init"
mkabbr ga="git add"
mkabbr gaa="git add ."
mkabbr gc="git commit"
mkabbr gca="git commit --amend --no-edit"
mkabbr gcae="git commit --amend"
mkabbr gcall="git add . && git commit"
mkabbr gd="git diff"
mkabbr gs="git status"
mkabbr gp="git push"
mkabbr gl="git log --oneline"
mkabbr gll="git log"
mkabbr gco="git checkout"
mkabbr gfuck="git reset --hard"

# NODE VERSION MANAGER ------- #
source /usr/share/nvm/init-nvm.sh

# FUNCTIONS ------------------ #
function mkcdir() {
	mkdir -p "$1"
	cd "$1"
}

# PROMPT --------------------- #
PROMPT="%B%F{orange}[%n@%m:%3~]%b%{$reset_color%} "
