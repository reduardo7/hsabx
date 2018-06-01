## path command
## Run with `sudo` if necessary.
## If {path} is not writable then run with `sudo`.
##
## Params:
##   path:    {String} Related path for write permission is granted.
##   command: {String} Command to execute.

local path="$1"
local command="$2"

if [ -w "${path}" ]; then
  ( set -ex
    bash -c "${command}"
  )
else
  @required sudo
  ( set -ex
    sudo bash -c "${command}"
  )
fi
