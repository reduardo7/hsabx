## *
## Throw illegal error and exit.
##
## Params:
##   *: {String} Error message.

local msg="$*"

APP_EXIT_ILLEGAL_ERROR=true

echo >&2
@alert '@@@ Error! @@@'
@error "$msg" true 1