set tabstop=2 softtabstop=2
set expandtab
set smartindent
set shiftwidth=2
set relativenumber
set number
set scrolloff=8
set nohlsearch
set noerrorbells
set hidden
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set colorcolumn=80
set signcolumn=yes
set noshowmode
set updatetime=50
set completeopt=menuone,noselect
set shortmess+=c

call plug#begin('~/.vim/plugged')
" LSP (Language Server Protocol)
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'neovim/nvim-lspconfig'

" The CoC
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'kevinoid/vim-jsonc'

" Telescope + deps
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Other
" Plug 'tpope/vim-fugitive'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-endwise'
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'mbbill/undotree'
call plug#end()

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>ip :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <leader>in :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
" Telescope
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" My random tries
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>
" This is a jamky start to a map that comments lines
nnoremap <leader>cm _i" <esc>j

" Trim trailing blankspace
augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END


" Theme
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
highlight Normal guibg=none

" LSP Setup
lua require'lspconfig'.solargraph.setup{ on_attach=on_attach }
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
