# Write to LOG to Console
#
# *: Text to log

@style default 1>&2
printf "¬ %.23s | %s:%s > %s\n" `date +%F.%T.%N` ${BASH_SOURCE[2]##*/} ${BASH_LINENO[1]} "${@}" 1>&2