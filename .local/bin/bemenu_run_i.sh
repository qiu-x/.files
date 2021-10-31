#!/bin/sh
# dmenu_run improved
# if a command ends with "!", it is started in term.

termcmd="st -e"
shellcmd="oksh -c"


cmd="$( (lspath; cat $HOME/.cache/bemenu_run_cache) | bemenu.sh -p 'Run:')"
case $cmd in
    *\! ) ${termcmd} ${shellcmd} "$(printf "%s" "${cmd}" | cut -d'!' -f1)" || read
    echo "$cmd" >> $HOME/.cache/bemenu_run_cache
    ;;
    * ) ${shellcmd} "${cmd}" && true || st -t st-popup -e mksh -c "echo Command Error; read" ;;

esac
exit

