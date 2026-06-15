export PATH="$HOME/.config/emacs/bin:$PATH"
export EDITOR=helix
export VISUAL=helix
# if [ "$TMUX" = "" ]; then tmux; fi

# source global shell alias & variables files
source <(fzf --zsh)
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"
alias bar-re="killall waybar && waybar & disown"
alias hex="helix"
alias hx="helix"

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris # main attraction of zsh, obviously

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
# zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main opts
setopt append_history inc_append_history # share_history # better history
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
HISTFILE=~/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000

# binds
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^H" backward-kill-word
# ctrl J & K for going up and down in prev commands
bindkey "^K" up-line-or-history
bindkey "^J" down-line-or-history
bindkey '^R' fzf-history-widget

# set up prompt
NEWLINE=$'\n'
# PROMPT="${NEWLINE}%K{#657b83}%F{#fdf6e3}$(date +%_I:%M%P) %K{#657b83}%F{#fdf6e3} %n %K{#657b83} %~ %f%k ❯ " # solarized white
# PROMPT="${NEWLINE}%K{#692a12}%F{#cfbcba}$(date +%_I:%M%P) %K{#f06a3f}%F{#cfbcba} %n %K{#f06a3f} %~ %f%k ❯ " # serika-white
# PROMPT="${NEWLINE}%K{#555555}%F{#ffffff}$(date +%_I:%M%P) %K{#555555}%F{#ffffff} %n %K{#555555} %~ %f%k > " # nano theme
PROMPT='[%n@%m:%~] > '

# echo -e "${NEWLINE}\033[48;2;0;185;209;38;2;0;0;0m $0 \033[0m\033[48;2;48;231;255;38;2;0;0;0m $(uptime -p | cut -c 4-) \033[0m" # blue edition
# echo -e "${NEWLINE}\033[48;2;101;123;131;38;2;253;246;227m $0 \033[0m\033[48;2;101;123;131;38;2;253;246;227m $(uptime -p | cut -c 4-) \033[0m"
# echo -e "${NEWLINE}\033[48;2;234;131;165;38;2;201;199;205m $0 \033[0m\033[48;2;234;131;165;38;2;201;199;205m $(uptime -p | cut -c 4-) \033[0m"

# autosuggestions
# requires zsh-autosuggestions
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

