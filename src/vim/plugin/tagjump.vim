" Lovingly stolen from https://github.com/racer-rust/vim-racer/commit/6fe615ecedce06df9ec2624dd8f2ae0b3b69c4f5

function s:tagjump()
  if &tagstack && exists('*gettagstack') && exists('*settagstack')
    let from = [bufnr('%'), line('.'), col('.'), 0]
    let tagname = expand('<cword>')
    let stack = gettagstack()

    if stack.curidx > 1
      let stack.items = stack.items[0:stack.curidx-2]
    else
      let stack.items = []
    endif

    let stack.items += [{'from': from, 'tagname': tagname}]
    let stack.curidx = len(stack.items)

    call settagstack(win_getid(), stack)
  endif
endfunction

command! -bar TagJump call s:tagjump()
