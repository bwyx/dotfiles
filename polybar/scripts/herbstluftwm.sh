#!/bin/sh

hash herbstclient xrandr
symbol=

print_tags() {
	for tag in $(herbstclient tag_status); do
		name=${tag#?}
		state=${tag%$name}
		case "$state" in
		'#') # the tag is viewed on the specified MONITOR and it is focused.
			# printf '%%{R} %s %%{R}' "$symbol"
			printf '%%{T12} %s %%{T-}' "$symbol"
			;;
			# '-') # the tag is viewed on a different MONITOR, but this monitor is not focused.
			# 	printf '%%{B#4c566a} %s %%{B-}' "$symbol"
			# 	;;
		'+') # the tag is viewed on the specified MONITOR, but this monitor is not focused.
			printf '%%{F#cccccc}%%{R} %s %%{R}%%{F-}' "$symbol"
			;;
		'!') # the tag contains an urgent window
			printf '%%{T12}%%{R}  s! %%{R}%%{T-}' "$symbol"
			;;
		'.') # the tag is empty
			printf '%%{T11}%%{F#616E88} %s %%{F-}%%{T-}' "$symbol"
			;;
		*)
			printf '%%{T11} %s %%{T-}' "$symbol"
			;;
		esac
	done
	printf '\n'
}

print_tags

IFS="$(printf '\t')" herbstclient --idle | while read -r hook args; do
	case "$hook" in
	tag*)
		print_tags
		;;
	esac
done
