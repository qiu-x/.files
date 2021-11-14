#
# ~/.okshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty stop undef
stty start undef

# Enable vi mode
set -o vi

. ~/.config/user-dirs.dirs

export PAGER=less
export EDITOR=vise
export VISUAL=vise
export BROWSER=w3m
export XDG_CONFIG_HOME=$HOME/.config
export HISTSIZE=3000
export HISTFILE=~/.cache/oksh_history
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/android/cmdline-tools/bin:$HOME/.local/share/android/cmdline-tools/build-tools/29.0.3:$HOME/.cargo/bin:$HOME/.local/share/go/bin
export GOROOT=/usr/local/go
export MOZ_ENABLE_WAYLAND=1
export TEXFM=/home/$HOME/.local/share/texmf
export QT_STYLE_OVERRIDE=adwaita-dark
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat
export GEM_HOME=$XDG_DATA_HOME/gem
export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem
export GOPATH=$XDG_DATA_HOME/go
export ANDROID_SDK_ROOT=/home/$HOME/.local/share/android/cmdline-tools
export ANDROID_HOME=/home/$HOME/.local/share/android/cmdline-tools
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export LESS=-R
export LESSHISTFILE="-"
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
#export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
#export GO111MODULE=
export CGO_CFLAGS="-I /usr/local/include"
export FZF_DEFAULT_OPTS=" --exact --border --cycle --reverse --height '70%'"
export FZF_DEFAULT_COMMAND='find .'
#export WLR_RENDERER=vulkan

export XKB_DEFAULT_LAYOUT="pl"
export XKB_DEFAULT_OPTIONS="caps:escape"

PS1="[0;97m[[1;96m$(hostname)[0;37m:[0;94m\${PWD##*/}/[0;37m]$(if (( $(id -u) )); then print '\$[0;39m'; else print '[1;31m#'; fi) "

# Aliases
alias ls='exa --color always -h'
alias ll='exa --color always -h -la'
alias mpvm='mpv --force-window=no --no-vid'
alias cdf='cd "$(find . -type d | fzf -e +s)"'
alias ..='cd ..'
alias cd='z'

if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
  if ! test -d "${XDG_RUNTIME_DIR}"; then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi

listen-to-yt() { [ -z "$1" ] && echo "Enter a search string!" || youtube-dl --default-search 'ytsearch1:' "$@" --get-url | tail -1 | xargs -J % mpv --force-window=no --no-vid "%"; }
search-yt() {
[ -z "$*" ] || curl "https://www.youtube.com/results" -s -G --data-urlencode "search_query=$*" |  pup 'script' | grep  "^ *var ytInitialData" | sed 's/^[^=]*=//g;s/;$//' | jq '..|.videoRenderer?' | sed '/^null$/d' | jq '.title.runs[0].text,.longBylineText.runs[0].text,.shortViewCountText.simpleText,.lengthText.simpleText,.publishedTimeText.simpleText,.videoId'| sed 's/^"//;s/"$//;s/\\"//g' | sed -E -n "s/(.{60}).*/\1/;N;s/\n(.{30}).*/\n\1/;N;N;N;N;s/\n/\t|/g;p" | column -t  -s "$(printf "\t")" | fzf --delimiter='\|' --nth=1,2  | sed -E 's_.*\|([^|]*)$_https://www.youtube.com/watch?v=\1_' | xargs -r -I'{}' mpv {}
}
radio-tilde() { mpv --force-window=no --no-vid "https://radio.tildeverse.org/radio/8000/radio.ogg"; }
h() { fc -n -l 0 | fzf | sh ; }

## oksh command completions
[ -f ~/.oksh_completions ] && . ~/.oksh_completions

eval "$(zoxide init posix --hook prompt)"

# Security is important
umask 077
