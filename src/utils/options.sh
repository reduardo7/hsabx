## options*
## Read options.
##
## Params:
##   options*: {Map} Valid options specifications.
##
##
## Options Format: [VARIABLE:KEY:INPUT]*
##   where:
##     VARIABLE: {String} Valid local variable name (without spaces).
##               This produces a local variable with this name.
##     KEY:      {Char} Full option key.
##               Use `|` to concatenate multiple options.
##     INPUT:    {Boolean} Option with input?
##               Optional. Default: false.
##
## Options Example: 'new:-n' 'path:-p:true' 'foo:-x:false'
##   This produces next variables:
##     - "new" with TRUE when "-n" is present or FALSE when "-n" is not present.
##     - "path" with user inputs values as Array, or EMPTY on empty user input.
##     - "foo" with TRUE when "-x" is present or FALSE when "-x" is not present.
##
## Usage example:
##   eval "$(@options 'new:-n|-N' 'path:-p|--path:true')"
##   @print "'-n|-N' parameter: ${new}"
##   @print "'-p|--path' parameter: ${path[@]} (${#path[@]})"

local options="$@"
local variable
local config
local config_key
local config_var
local config_var_val_def
local config_var_val
local config_input
local script_vars=''
local script_case=''
local OIFS="$IFS"
local variables

IFS=' ' variables=(${options}) IFS="$OIFS"

for variable in ${variables[@]} ; do
  IFS=':' config=(${variable}) IFS="$OIFS"
  config_var="${config[0]}"
  config_key="${config[1]}"
  config_input=${config[2]:-false}

  [[ ${#config_key} -ge 1 ]] || @throw-invalid-param options 'Invalid KEY'
  [ ! -z "${config_var}" ] || @throw-invalid-param options 'Empty VARIABLE'
  @is-boolean "${config_input}" || @throw-invalid-param options 'Invalid INPUT value'

  if ${config_input}; then
    config_var_val_def='=()'
    config_var_val='+=($1) ; shift'
  else
    config_var_val_def='=false'
    config_var_val='=true'
  fi

  [ -z "${script_vars}" ] || script_vars="${script_vars}${BASHX_NL}"
  [ -z "${script_case}" ] || script_case="${script_case}${BASHX_NL}${BASHX_TAB}${BASHX_TAB}"
  script_vars="${script_vars}local ${config_var}${config_var_val_def}"
  script_case="${script_case}${config_key}) shift ; ${config_var}${config_var_val} ;;"
done

cat <<EOF
${script_vars}
local OPTARG
while true; do
  OPTARG="\$1"
  case "\$OPTARG" in
    ${script_case}
    -*) @error "Unrecognized option \$OPTARG" ;;
    *) break ;;
  esac
done
unset OPTARG
EOF


# while true; do
#     case $1 in
#       -R) level=1
#             shift
#             case $1 in
#               *[!0-9]* | "") ;;
#               *) level=$1; shift ;;
#             esac ;;
#         # ... Other options ...
#         -*) echo "$0: Unrecognized option $1" >&2
#             exit 2;;
#         *) break ;;
#     esac
# done

# OPTARG_NET=false
# OPTARG_PORTS='' #@TODO
# while getopts ni::p: opt
# do
#   case "$opt" in
#     n) OPTARG_NET=true ;;
#     p) #@TODO
#       [ ! -z "$OPTARG_PORTS" ] && OPTARG_PORTS="$OPTARG_PORTS,"
#       OPTARG_PORTS="$OPTARG_PORTS$OPTARG"
#       ;;
#     \?) @error "ERROR: Invalid option -$OPTARG" ;;
#     :) @error "Missing option argument for -$OPTARG" ;;
#     *) @error "Unimplemented option: -$OPTARG" ;;
#   esac
# done
# shift $((OPTIND - 1))