function! inyoface#toggle_comments() abort
  if exists('w:toggle_comments')
    silent! call matchdelete(w:toggle_comments)
    unlet! w:toggle_comments
  else
    try
      let l:comment_str = split(escape(&commentstring, '^$.*/"'''), '%s')[0]
    catch
      let l:comment_str = ''
    endtry

    let w:toggle_comments = matchadd('NonComment', '^\%(\s*' . l:comment_str . '\)\@!.*')
  endif
endfunction
