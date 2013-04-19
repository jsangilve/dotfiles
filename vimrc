:set tabstop=2
:set shiftwidth=2
:set expandtab

colorscheme desert
set number

" Python-mode Plugin:  Pathogen to install plugins
filetype off

call pathogen#infect()
call pathogen#helptags()

let g:pymode_folding = 0
filetype plugin indent off
syntax on

" setting tab number to the tab's name
fu! MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
" Get buffername
let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
let bufdirty = getbufvar(buflist[winnr - 1], "&mod")?'+':''
return bufdirty.(empty(string) ? '[unnamed]' : string)
endfu

fu! MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
" select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' ' 

    " the label is made by MyTabLabel()
    let s .= '%{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
        let s .= ' |'
    endif
endfor
return s
endfu
set tabline=%!MyTabLine()
hi TabLineSel term=bold cterm=bold ctermfg=Yellow
