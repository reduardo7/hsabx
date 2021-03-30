array=("abc" "aaa bbb" "123" "aaa" "aaa 123 bbb" "a 5 b" "" true false 123 0)

@@assert.noOut '@array.contains'
@@assert.noOut '@array.contains "a"'
@@assert.noOut '@array.contains "a" "b"'
@@assert.noOut '@array.contains "a" "a"'
@@assert.noOut '@array.contains "" "b"'
@@assert.noOut '@array.contains "abc" "${array[@]}"'
@@assert.noOut '@array.contains "" "${array[@]}"'
@@assert.noOut '@array.contains true "${array[@]}"'
@@assert.noOut '@array.contains 0 "${array[@]}"'

@@assert.exec '@array.contains' true '"abc" "${array[@]}"'
@@assert.exec '@array.contains' true 'true "${array[@]}"'
@@assert.exec '@array.contains' true '0 "${array[@]}"'
@@assert.exec '@array.contains' true 'false "${array[@]}"'
@@assert.exec '@array.contains' false '5 "${array[@]}"'
@@assert.exec '@array.contains' false '"5" "${array[@]}"'
@@assert.exec '@array.contains' false '"bbb" "${array[@]}"'
@@assert.exec '@array.contains' true '"aaa bbb" "${array[@]}"'
@@assert.exec '@array.contains' true '"0" "${array[@]}"'
@@assert.exec '@array.contains' false '"123 bbb" "${array[@]}"'

# vim: filetype=sh tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
