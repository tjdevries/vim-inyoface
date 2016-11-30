let s:brightness_changed = get(s:, 'brightness_changed', 0)
let s:brightness_diff = get(s:, 'brightness_diff', 0)

function! s:change_the_brightness(change) abort
  if !exists('g:colorpal_palette')
    return
  endif

  if a:change ==? 'dark'
    let l:modifier = 'dark'
    let l:changer = -1
  elseif a:change ==? 'bright'
    let l:modifier = 'bright'
    let l:changer = 1
  endif

  " If brightness diff is 5, then you want five modifiers there.
  let l:modifier = repeat(l:modifier . ',', s:brightness_diff)

  " TODO: Figure out how to better track what brightness we are at
  " I seem to be getting slightly different results at the end of this

  " while s:brightness_changed != 0
    execute 'CPHL Comment Comment,' . l:modifier . ' - -'
    let s:brightness_changed += l:changer
  " endwhile

endfunction

function! inyoface#set_brightness_diff(num) abort
  let s:brightness_diff = a:num
endfunction

function! inyoface#toggle_comments() abort
  if exists('w:toggle_comments')
    " If you've got colorpal, let's do some cool Comment helping
    call s:change_the_brightness('dark')

    silent! call matchdelete(w:toggle_comments)
    unlet! w:toggle_comments
  else
    " If you've got colorpal, let's do some cool Comment helping
    call s:change_the_brightness('bright')

    try
      let l:comment_str = split(escape(&commentstring, '^$.*/"'''), '%s')[0]
    catch
      let l:comment_str = ''
    endtry

    let w:toggle_comments = matchadd('NonComment', '^\%(\s*' . l:comment_str . '\)\@!.*')
  endif
endfunction
