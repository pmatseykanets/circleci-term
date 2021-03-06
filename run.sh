#!/usr/bin/env bash

set -e

red() {
	# check if stdout is a terminal
	if [ -t 1 ] && ! [ -z "${TERM:-}" ] && [ "$TERM" != "dumb" ]; then
        
        echo "as-is '$TERM'"
        echo "default '${TERM:-}'"

        # see if it supports colors
        ncolors=$(tput colors)
        if [ $ncolors -ge 8 ]; then
            tput setaf 1; echo "$@"; tput sgr0
            return
        fi
	fi

	# either not a terminal or doesn't support colors
	echo "$@"
}

main() {
    red "Look ma it's working"
}

main
