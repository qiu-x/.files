#!/bin/sh
# TODO: multisel

target="$1"
[ -z "$target" ] && target="$(realpath .)"
prompt="$2"

while true; do
	p="$prompt"
	[ -z "$p" ] && p="$target"
	sel="$(ls -p -1a "$target" | fzf --no-sort --prompt="$p/")"
	ec=$?
	[ "$ec" -ne 0 ] && exit $ec

	c="$(echo "$sel" |cut -b1)"
	if [ "$c" = "/" ]; then
		newt="$sel"
	else
		newt="$(realpath "${target}/${sel}")"
	fi

	if [ -e "$newt" ]; then
		target="$newt"
		if [ ! -d "$target" ]; then
			echo "$target"
			exit 0
		fi
		if [ "$sel" = "." ]; then
			echo "$target"
			exit 0
		fi
	fi
done
