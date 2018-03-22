## code [cmd]
## Check error.
##
## code: {Integer} Exit code. Example: $?
## cmd:  {String} Command to execute on error.
##
## Example: @check-error $? "error 'Invalid operation'".

local code=$1
local cmd="$2"

if @is-number "${code}"; then
  if [[ ${code} -gt 0 ]]; then
    # Error
    eval "${cmd}"
  fi
else
  # Error
  eval "${cmd}"
fi
