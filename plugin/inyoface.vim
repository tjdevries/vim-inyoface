if exists(":CPHL")
    CPHL NonComment gray2 - - -
else
    highlight default NonComment ctermfg=8 ctermbg=none cterm=none guifg=#333333 guibg=none gui=none
endif

nmap <Plug>(InYoFace_Toggle) :<c-u>call inyoface#toggle_comments()
