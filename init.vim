call plug#begin()
Plug 'github/copilot.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Chiel92/vim-autoformat'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-rooter'
Plug 'Valloric/MatchTagAlways'
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
Plug 'ggandor/lightspeed.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
" nvim auto-completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" formatting
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'
" theme 
Plug 'projekt0n/github-nvim-theme'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
call plug#end()

syntax enable
filetype plugin indent on
" default updatetime 4000ms is not good for async update
set updatetime=100
" TextEdit might fail if hidden is not set
set hidden
set encoding=utf8

colorscheme gruvbox
set number
set splitright
set splitbelow
set autoread
set ts=4 sw=4
xnoremap p pgvy
" auto save
let g:auto_save = 1
let g:auto_save_keep_undo = 1

au CursorHold * checktime
set guifont=hack_nerd_font:h13

autocmd FileType python setlocal foldmethod=indent

let mapleader = "," " map leader to comma
set timeoutlen=2000 ttimeoutlen=0
map <leader>h :noh<CR>
map <leader>ne :NvimTreeToggle<CR>
map <leader>nf :NvimTreeFocus<CR>
map <leader>nl :NvimTreeFindFile<CR>
map <leader>nc :NvimTreeCollapse<CR>
map <leader>na :set number<CR>
map <leader>nn :set nonumber<CR>
map <leader>rf :Files<CR>
map <leader>bf :Buffers<CR>
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
" Go to tab by number
map <C-h> :bprevious<CR>
map <C-l> :bnext<CR>

" setting up copilot
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
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
" nerdtree-git-plugin
let g:NERDTreeGitStatusUseNerdFonts = v:true
let g:NERDTreeGitStatusShowStatus = v:true
let g:NERDTreeGitStatusShowIgnored = v:true
let NERDTreeIgnore = ['\.pyc$', 'tmp', 'node_modules']
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" add the missing imports on save
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" Use the stdio version of OmniSharp-roslyn - this is the default
lua require('config')
