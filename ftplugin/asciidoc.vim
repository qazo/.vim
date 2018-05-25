set makeprg=asciidoctor\ %
let &errorformat =
		\ '%E%\w%\+: %tRROR: %f: line %l: %m,' .
		\ '%E%\w%\+: %tRROR: %f: %m,' .
		\ '%E%\w%\+: FAILED: %f: line %l: %m,' .
		\ '%E%\w%\+: FAILED: %f: %m,' .
		\ '%W%\w%\+: %tARNING: %f: line %l: %m,' .
		\ '%W%\w%\+: %tARNING: %f: %m,' .
		\ '%W%\w%\+: DEPRECATED: %f: line %l: %m,' .
		\ '%W%\w%\+: DEPRECATED: %f: %m'
