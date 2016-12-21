script='fnx() { local x="x" ; echo "${x}a${x}" ; } ; fnx'
cmd="@cmd-log '${script}'"

output="$(eval "${cmd}" 3>/dev/null)"
@@assertContains "${output}" 'xax'

output="$( (eval "${cmd}" >/dev/null ) 3>&1 )"
@@assertContains "${output}" "${script}"