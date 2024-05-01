call textobj#user#plugin('datetime', {
\   'date': {
\     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
\     'select': ['ad', 'id'],
\   },
\   'time': {
\     'pattern': '\<\d\d:\d\d:\d\d\>',
\     'select': ['at', 'it'],
\   },
\ })

let g:textobj_wordcolumn_no_default_key_mappings = 1

call textobj#user#map('wordcolumn', {
\ 'word' : {
\   'select-i' : 'iq',
\   'select-a' : 'aq',
\   },
\ 'WORD' : {
\   'select-i' : 'iQ',
\   'select-a' : 'aQ',
\   },
\ })
