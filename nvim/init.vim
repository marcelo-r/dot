call plug#begin('~/.local/share/nvim/plugged')

""" base for IDE-like XP
"Plug 'sheerun/vim-polyglot'							" sytanx highlight
Plug 'dense-analysis/ale'							" linters
Plug 'SirVer/ultisnips'								" snippets
" file explorer 
Plug 'scrooloose/nerdtree'							" sidebar explorer
Plug 'ryanoasis/vim-devicons'						" icons for nerdtree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'							" ripgrep plugin

Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', { 'tag': 'v0.9.1' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }

" git support
Plug 'tpope/vim-fugitive'							" git integration
Plug 'airblade/vim-gitgutter'						" show diff on buffer
Plug 'Xuyuanp/nerdtree-git-plugin'					" git icons for nerdtree
" status line (choose one of these)
Plug 'vim-airline/vim-airline'
"Plug 'itchyny/lightline.vim'
""" utils
Plug 'ctrlpvim/ctrlp.vim' "				
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'machakann/vim-highlightedyank'				" highlight copied text
Plug 'jiangmiao/auto-pairs'							" auto close () [] {} '' etc
"Plug 'luochen1990/rainbow'							" rainbow parenteses
Plug 'tpope/vim-surround'							" surround phrases with stuff
Plug 'Yggdroot/indentLine'							" show indetation level

Plug 'github/copilot.vim'
"call Copilot('disable')
"imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
"let g:copilot_no_tab_map = v:true

"Plug 'nvim-neo-tree/neo-tree.nvim'
"Plug 'MunifTanjim/nui.nvim'
"Plug 'nvim-tree/nvim-web-devicons'

" experimental & autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

""" languages support
" python
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }
" golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plug 'sebdah/vim-delve'
" rust
Plug 'rust-lang/rust.vim'
" yaml 
Plug 'stephpy/vim-yaml'
"docker
Plug 'ekalinin/dockerfile.vim'
Plug 'Konfekt/FastFold'
Plug 'andrewstuart/vim-kubernetes'
" typescript
"Plug 'neovim/nvim-lspconfig'
"Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

""" optionals
" themes 
Plug 'sainnhe/sonokai'
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_disable_italic_comment=1
let g:sonokai_style = 'atlantis'
Plug 'joshdick/onedark.vim'
Plug 'projekt0n/github-nvim-theme'
let g:github_comment_style = 'none'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" only in neovim:
if has('nvim-0.5')
	Plug 'radenling/vim-dispatch-neovim'
	" minimap
    "Plug 'wfxr/minimap.vim'
    "let g:minimap_width = 10
    "let g:minimap_git_colors = 1
endif
Plug 'szw/vim-smartclose'

call plug#end()

"Automatically reloads neovim configuration file on write (w)
autocmd! bufwritepost init.vim source %

set encoding=utf-8
" allow buffers to open in background
set hidden
" Highlight the current line the cursor is on
"set cursorline
" set mouse to scroll nvim instead of terminal emulator output
set mouse=a

" search with case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

set nocompatible
set sessionoptions+=globals

" Showing line numbers and length
set number  " show line numbers
set tw=99   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=100
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
set signcolumn=yes

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" shorter updatetime for better UX
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" ensure spliting below or to the right
set splitbelow
set splitright

" configure tabs spaces indetation
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab smarttab

" Enable filetype plugins
filetype plugin on
filetype indent on

" syntax and theme options
syntax enable
if has('termguicolors')
  set termguicolors
endif
colorscheme sonokai
"highlight ColorColumn ctermbg=233 ctermfg=233 guibg=#262626 guifg=#262626

"Open file at same line last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" persist undo history after closing file
try
    set undodir=~/.local/share/nvim/temp_dirs/undodir
    set undofile
catch
endtry

"set relativenumber

""" mappings
" remove spacebar mapping and make it leader
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader=","

" easier command input, especially for keymaps with bad : location
" ; will work like :
"nnoremap ; :
"vnoremap ; :

" easier navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>w <C-W>
" easier tab navigation
nmap <leader>1 <esc>1gt
nmap <leader>2 <esc>2gt
nmap <leader>3 <esc>3gt
nmap <leader>4 <esc>4gt
nmap <leader>5 <esc>5gt
nmap <leader>6 <esc>6gt
nmap <leader>7 <esc>7gt
nmap <leader>8 <esc>8gt
nmap <leader>9 <esc>9gt
nmap <leader>0 <esc>0gt

"Highlights code for multiple indents without reselecting
vnoremap < <gv
vnoremap > >gv

"save with ctrl-s
nnoremap <silent><C-S> :update<CR>

" redraws the screen and removes any highlighting.
nnoremap <leader>l :nohl<CR><C-S-l>

"nnoremap <leader>b <esc>:buffers<CR>
nnoremap <leader>b <esc>:ls<CR>:b<Space>

""" plugins configuration

let g:go_gopls_options = ['-remote=unix;/tmp/gopls-daemon-socket']
"let g:go_debug = ['lsp']
" open NERDTree on starup when no file specified
"function! StartUp()
"    if 0 == argc()
"        NERDTree
"    end
"endfunction
"autocmd VimEnter * call StartUp()

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let NERDTreeIgnore=["\.git$", "\.vscode", "bin$"]

" avoid conflict between ALE and coc-vim
let g:ale_disable_lsp = 0
let g:ale_use_neovim_diagnostics_api = 1
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded', 'highlight': 'Identifier',  }}
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
"let g:fzf_layout = { 'down': '~40%' }
" See `man fzf-tmux` for available options
if exists('$TMUX')
	let g:fzf_layout = { 'tmux': '-p80%,60%' }
else
	let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded', 'highlight': 'Identifier',  }}
endif

" git
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

" to restrict :Git status height, but may restrict other stuff
set previewheight=20

let g:lightline = {
	\ 'colorscheme': 'github_dark_default',
	\ }

let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = ['fzf', 'branch', 'quickfix', 'searchcount']
let g:airline_section_z = '%c %l/%L'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'

let g:indentLine_enabled = 0
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char = '⎸'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0
set list lcs=tab:\|\ 

" Utilsnips
let g:UltiSnipsExpandTrigger="<C-l>"

""" plugin mappings - <leader>p

" Fugitive Mappings
nnoremap <leader>gg :G<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gd :Gvdiffsplit!<CR>
command! Gp silent Git pull | Git push

" Use tab to trigger completion and navigate to next item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" fzf
"nmap <leader>ff <esc>:FzfFiles<CR>
"nmap <leader>fe <esc>:FzfGFiles<CR>
"nmap <leader>fc <esc>:FzfCommands<CR>
"nmap <leader>fs <esc>:FzfLines<CR>
"nmap <leader>fb <esc>:FzfBuffers<CR>
"nmap <leader>bb <esc>:FzfBuffers<CR>
"nmap <leader>fr <esc>:FzfRg<CR>

nnoremap <leader>pn :NERDTreeToggle<CR>
"nnoremap <leader>pf :Black<CR>
nnoremap <leader>pa :ALEFix<CR>

""" functions
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" terminal
if has('nvim')
    command! -nargs=* T split | resize 16 | terminal <args>
    command! -nargs=* VT vsplit | terminal <args>
    nnoremap <leader><S-T> <esc>:T<CR>

    " exit terminal mode
    :tnoremap <esc><esc> <C-\><C-n>
    " enable window navigation while in terminal mode
    :tnoremap <C-w> <C-\><C-n><C-w>

    " auto close terminal window after shell exit
    augroup terminal_settings
        autocmd!

        autocmd BufWinEnter,WinEnter term://* startinsert
        autocmd BufLeave term://* stopinsert

        " Ignore various filetypes as those will close terminal automatically
        " Ignore fzf, ranger
        autocmd TermClose term://*
              \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger")) |
              \   call nvim_input('<CR>')  |
              \ endif
    augroup END
endif

nnoremap <leader>pn :NERDTreeToggle<CR>
" sync nerdtree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
nnoremap <silent> <leader>k :bnext<CR>:call SyncTree()<CR>
nnoremap <silent> <leader>j :bprev<CR>:call SyncTree()<CR>
nnoremap <silent> <F12> :NERDTreeToggle<cr><c-w>l:call SyncTree()<cr><c-w>h
nnoremap <silent> <leader>pn :NERDTreeToggle<cr><c-w>l:call SyncTree()<cr><c-w>h

"fun! SetupCommandAlias(from, to)
"  exec 'cnoreabbrev <expr> '.a:from
"        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
"        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
"endfun
"call SetupCommandAlias("W","w")

" Highlight currently open buffer in NERDTree
"autocmd BufRead * call SyncTree()

" enable when using _ as terminal cursor so vim can reset it on exit
au VimLeave * set guicursor=a:hor100

" auto save session on exit
"au VimLeave * mksession! session.vim

" spellcheck
" use F11 to toggle spellcheck
" use <C-x>s in insert mode to show suggestions
set spelllang=en
set spellsuggest=best,9
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

"let &t_SI = "\e[4 q"
"let &t_EI = "\e[4 q"

lua <<EOF
	require('init')
	vim.cmd("filetype plugin on")
EOF
