:set tabstop=2
:set shiftwidth=2
:set expandtab
set t_Co=256

colorscheme desierto
"colorscheme badwolf
set number

" Python-mode Plugin:  Pathogen to install plugins
" filetype off

" python pep syntax
"call pathogen#infect()
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

set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set hlsearch " highlight search matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" toggle tagbar
nnoremap <F3> :TagbarToggle<CR>

" open nerdtree
map <C-n> :NERDTreeToggle<CR>

" Hilight Pmenu (popup menu)
hi Pmenu ctermbg=Black ctermfg=Yellow
hi PmenuSel ctermbg=Yellow ctermfg=Black

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_cmd = 'CtrlP .'
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" Deleting trailing spaces
function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  if (line("'Z") != line(".")) || (l:chars != col("$"))
    echo "Trailing whitespace stripped\n"
  endif
  normal `Z
endfunction

au BufWritePre *.py :call StripTrailingWhitespace()
" au BufWritePre *.js :call StripTrailingWhitespace()
au BufWritePre *.ex :call StripTrailingWhitespace()

" Statusline vim-airlinne
set laststatus=2 " This is required for some reason
let g:airline_theme='badwolffixed'
let g:airline_powerline_fonts=1


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_python_checkers = []

" Prettier-eslint Javascript formatter
" let g:prettier_eslint_path = '/home/jsangil/.nvm/versions/node/v6.9.2/bin/prettier-eslint'
autocmd FileType javascript set formatprg=prettier-eslint\ --stdin\ --no-semi\ --single-quote
" autocmd FileType javascript execute "set formatprg=".g:prettier_eslint_path."\\ --stdin"
" autocmd BufWritePre *.js :normal gggqG

" move selected lines up one line
xnoremap k :m-2<CR>gv=gv

" move selected lines down one line
xnoremap j :m'>+<CR>gv=gv

" changing vim cursor
au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
au InsertEnter,InsertChange *
  \ if v:insertmode == 'i' | 
  \   silent execute '!echo -ne "\e[5 q"' | redraw! |
  \ elseif v:insertmode == 'r' |
  \   silent execute '!echo -ne "\e[3 q"' | redraw! |
  \ endif
au VimLeave * silent execute '!echo -ne "\e[5 q"' | redraw!

" Format elixir files using mix format
autocmd FileType elixir set formatprg=mix\ format\ -
