## src limit [offset]
## Sub string.
##
## src:    {String} String to cut.
## limit:  {Integer} Limit.
## offset: {Integer} (Optional) Offset.
## Out:    {String} Result string

local src_str="$1"
local limit=$2
local offset=$3

if [ -z "${offset}" ] || [[ ${offset} -eq 0 ]]; then
  echo "${src_str:0:${limit}}"
else
  echo "${src_str:${offset}:${limit}}"
fi