call plug#begin()
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-rooter'
Plug 'rust-lang/rust.vim'
Plug 'ianding1/leetcode.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mhinz/vim-signify'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'OmniSharp/omnisharp-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'psf/black', { 'branch': 'stable' }
Plug '907th/vim-auto-save'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ggandor/lightspeed.nvim'
" formatting
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'
" theme 
Plug 'projekt0n/github-nvim-theme'
" tmux navigator
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

syntax enable
filetype plugin indent on
" default updatetime 4000ms is not good for async update
set updatetime=100
" TextEdit might fail if hidden is not set
set hidden
set encoding=utf8

colorscheme kanagawa
set number
set relativenumber
set splitright
set splitbelow
set autoread
set ts=4 sw=4
xnoremap p pgvy
" auto save
let g:auto_save = 1
let g:auto_save_keep_undo = 1
highlight Visual guibg=blue guifg=white

au CursorHold * checktime


autocmd FileType python setlocal foldmethod=indent

let mapleader = "," " map leader to comma
set timeoutlen=2000 ttimeoutlen=0
map <leader>h :noh<CR>
map <leader>nf :NvimTreeFocus<CR>
map <leader>nl :NvimTreeFindFile<CR>
map <leader>nc :NvimTreeCollapse<CR>
map <leader>na :set number<CR>
map <leader>nn :set nonumber<CR>
nnoremap <leader>% :MtaJumpToOtherTag<cr>
" move lines up and down
"alt + j
"alt + k
nnoremap Ï :m .+1<CR>==
nnoremap È :m .-2<CR>==
inoremap Ï <Esc>:m .+1<CR>==gi
inoremap È <Esc>:m .-2<CR>==gi
vnoremap Ï :m '>+1<CR>gv=gv
vnoremap È :m '<-2<CR>gv=gv
" Leetcode map
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

"remap window resize 
nnoremap <C-w>> :vertical resize +15<CR>
nnoremap <C-w>< :vertical resize -15<CR>

" setting up copilot
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
let g:copilot_filetypes = {
		\ '*': v:true,
		\ 'rust': v:false
	  \ }

"Rust
let g:rust_format_on_save = v:true
"Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
"Leetcode
let g:leetcode_browser='chrome'
let g:leetcode_solution_filetype='golang'
let g:leetcode_hide_paid_only=v:true
" vim-airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:far#enable_undo=1

" add the missing imports on save
" Use the stdio version of OmniSharp-roslyn - this is the default
lua require('config')
