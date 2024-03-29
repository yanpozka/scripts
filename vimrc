"
" Yandry vimrc file
"
filetype plugin on
set hlsearch " :noh
" set autowriteall
set incsearch
" set number
set nocompatible

" Search files into subfolders with :find
set path=.,**

" suggestion with Tab when :find
" we can use * for fuzzy
set wildmenu
" ignore vendor folders
set wildignore+=vendor/**
set wildignore+=node_modules/**

" ^x^n for JUST this file
" ^x^f for filenames (works with our path trick!)
" ^x^] for tags only
" ^n for anything specified by the 'complete' option

set tabstop=4 shiftwidth=4 smarttab
set backspace=indent,eol,start
set autoread
set mmp=10000

" Ctrl L if syntax is lost
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Pathogen popular
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in ‘runtimepath’
syntax on
filetype plugin indent on

" Maps
map <C-n> :NERDTreeToggle<CR>
map <C-i> :GoImplements<CR>
map <C-D> :GoDef<CR>
map <C-r> :GoReferrers<CR>
map <C-e> :GoRename<CR>
map <C-H> :noh<CR>
map <C-a> <esc>ggVG<CR>
map <Home> 0

" let g:go_metalinter_autosave = 1 
" let g:go_metalinter_autosave_enabled = ['vet']

" 
map <C-z> :u<CR>
map <C-y> :redo<CR>
nnoremap <C-b> :%!xxd<CR>
nnoremap <C-j> :%!jq . --tab<CR>
nnoremap <leader>J :%!jq . -c<CR>
nmap <F8> :TagbarToggle<CR>

nmap <F5> :GoRun<CR>
nmap <F6> :GoBuild<CR>
nmap <F7> :GoTest -c<CR>

" https://stackoverflow.com/a/6988748
map ^[OA <up>
map ^[OB <down>
map ^[OC <right>
map ^[OD <left>
map <C-v><Esc>OA <up>
map <C-v><Esc>OB <down>
map <C-v><Esc>OC <right>
map <C-v><Esc>OD <left>

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

com! FormatJSON %!python3 -m json.tool

" Auto commands
"
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" autocmd CompleteDone * pclose
" au VimEnter * NERDTree
"
" Trying to change cursor when Insert Mode, but doesn't work :(
" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul
" autocmd InsertEnter,InsertLeave * set cul!

" set completeopt=longest,menuone
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

let g:gitgutter_max_signs=10000

"" Golang
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_structs = 0
let g:go_highlight_operators = 1
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0

" let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = "camelcase"


"" Js
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

autocmd FileType javascript noremap <buffer> <c-F> :call JsBeautify()<cr>
" html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" autocmd BufWritePre *.js :call JsBeautify()
autocmd BufWritePre *.html  :call HtmlBeautify()
autocmd BufWritePre *.css :call CSSBeautify()


"" Python
let g:jedi#goto_command = "<C-d>"
" Autopep8
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=120
let g:autoformat_max_line_length=120
" autocmd BufWritePost *.py :Autopep8
"
" Indent on save hook
autocmd BufWritePre *.py :Autopep8

set t_Co=256
" colorscheme vividchalk
" colorscheme distinguished
colorscheme honeybadger

" folding settings za: toggle folding, zM: fold everything, zR: unfold everything 
" help :folding
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
" set foldlevel=1       " this is just what i use


let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
