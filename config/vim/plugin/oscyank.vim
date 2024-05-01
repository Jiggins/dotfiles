let g:oscyank_term = 'default'

autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is 'a' | execute 'OSCYankRegister a' | endif
