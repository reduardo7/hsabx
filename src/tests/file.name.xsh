@@assert.equal "$(@file.name 'foo.bar')" 'foo.bar'
@@assert.equal "$(@file.name 'foo.bar' false)" 'foo.bar'
@@assert.equal "$(@file.name 'foo.bar' true)" 'foo'
@@assert.equal "$(@file.name '/tmp/foo.bar.xx')" 'foo.bar.xx'
@@assert.equal "$(@file.name '/a.b/foo')" 'foo'
@@assert.equal "$(@file.name '/tmp/foo.bar.xx' true)" 'foo.bar'
@@assert.equal "$(@file.name '/tmp/.foo.bar' true)" '.foo'
@@assert.equal "$(@file.name '/tmp/.foo.bar.xx' true)" '.foo.bar'

@@assert.noErrOut '@file.name "/tmp/foo.bar.xx"'