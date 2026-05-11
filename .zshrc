# main zsh settings. env in ~/.zprofile
# read second

# source global shell alias & variables files
source <(fzf --zsh)
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris # main attraction of zsh, obviously

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

# binds
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^H" backward-kill-word
# ctrl J & K for going up and down in prev commands
bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history
bindkey '^R' fzf-history-widget

# set up prompt
NEWLINE=$'\n'
PROMPT="${NEWLINE}%K{#006875}%F{#ffffff}$(date +%_I:%M%P) %K{#00B9D1}%F{#000000} %n %K{#30e7ff} %~ %f%k ❯ " # nord theme

echo -e "${NEWLINE}\033[48;2;0;185;209;38;2;0;0;0m $0 \033[0m\033[48;2;48;231;255;38;2;0;0;0m $(uptime -p | cut -c 4-) \033[0m"

# autosuggestions
# requires zsh-autosuggestions
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
