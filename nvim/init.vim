" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" Search files into subfolders with :find
set path=.,**

" suggestion with Tab when :find
" we can use * for fuzzy
set wildmenu
" ignore vendor folders
set wildignore+=vendor/**
set wildignore+=node_modules/**

set tabstop=4 shiftwidth=4 smarttab
set backspace=indent,eol,start
set autoread
set signcolumn=yes:1
let mapleader=","

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua' " recommanded if need floating window support
Plug 'EdenEast/nightfox.nvim'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/preservim/tagbar.git'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }

call plug#end()

lua <<EOF
require("nvim-tree").setup({
	tab = {
	  sync = {
		open = true,
		close = false,
		ignore = {},
	  },
	}
})

require('telescope').setup{}

local specs = {
  nightfox = {
    syntax = {
      keyword = "blue",
	  builtin0 = "blue",
	  builtin1 = "blue",
	  builtin2 = "blue",
	  conditional = "blue",
    },
  },
}

local options = {
    styles = {
      comments = "italic",
    }
  }

require('nightfox').setup({ specs = specs, options = options })

require('lspconfig').gopls.setup{
	settings = {
        gopls = {
            gofumpt = false
        }
    }
}

require 'go'.setup({
	gofmt = 'gofmt',
	max_line_len = 180,
})

local protocol = require'vim.lsp.protocol'

EOF

colorscheme nightfox

" autocmd CursorMoved *.go :GoDoc
autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil, 300)
autocmd FileType apache setlocal commentstring=#\ %s

" key shortcuts:
map <C-H> :noh<CR>
nmap <C-d> :lua vim.lsp.buf.definition()<CR>
nmap <C-r> :lua vim.lsp.buf.references()<CR>
nmap K :lua vim.lsp.buf.hover()<CR>
nmap <F8> :TagbarToggle<CR>
nmap <C-z> :u<CR>
nmap <C-n> ::NvimTreeToggle<CR>
map <Home> 0

" Find files using Telescope command-line sugar.
"
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Next tab: gt
" 
" Prior tab: gT Numbered tab: nnngt
"
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
