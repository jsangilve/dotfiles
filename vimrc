:set tabstop=2
:set shiftwidth=2
:set expandtab

"colorscheme desert
colorscheme desert
set number

" Python-mode Plugin:  Pathogen to install plugins
" filetype off

" python pep syntax
" call pathogen#infect()
" call pathogen#helptags()

" vim Pathogen
execute pathogen#infect()

filetype plugin indent on
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

" calling flake8 everytime you write a Python file
autocmd BufWritePost *.py call Flake8()

" detecting markdown files with .md extension
au BufRead,BufNewFile *.md set filetype=markdown

" detecting .hbs templates as HTML
au BufRead,BufNewFile *.hbs set filetype=html

