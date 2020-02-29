"=============================================="
" Plugin 
"=============================================="

filetype off
call plug#begin()

Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe', {'on': []}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sillybun/vim-repl'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-peekaboo'
Plug 'WesleyCh3n/center.vim'
Plug 'camspiers/animate.vim'
Plug 'luochen1990/rainbow'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

"=============================================="
" Plugin Configuration
"=============================================="

" Plugin: YouCompleteMe
let g:ycm_global_ycm_extra_conf = '/home/y0ch3n/.vim/plugged/YouCompleteMe/ycm_extra_conf.py'
augroup load_ycm
    au!
    au InsertEnter * call plug#load('YouCompleteMe') | autocmd! load_ycm
augroup END
let g:ycm_autoclose_preview_window_after_insertion = 1

" Plugin: delimitMate
let delimitMate_expand_cr = 1
" Plugin: indentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'

" Plugin: ctrlp
let g:ctrlp_show_hidden = 1

" Plugin: vim-repl
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'vim': 'vim -e',
            \   }
let g:repl_position = 3
let g:repl_ipython_version = '7'
let g:repl_width = 50
let g:sendtorepl_invoke_key = ",w"
nnoremap ,r :REPLToggle<Cr>
tnoremap <C-h> <C-w><C-h>

" Plugin: rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'separately': {
\		'nerdtree': 0,
\	}
\}

" Plugin: devicon
let g:webdevicons_enable_ctrlp = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Plugin: vim-fugitive
nnoremap <space>gs :Gstatus<cr>
nnoremap <space>ga :Git add .<cr><cr>
nnoremap <space>gcm :Gcommit -m ''<left>
nnoremap <space>gp :Gpush<cr>

" Plugin: vim-go
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2

" Plugin: wesleych3n-center
nnoremap ,c :call CenterToggle()<cr>

" Plugin: NERDTree
map <C-n> :NERDTreeToggle<cr>
let NERDTreeShowLineNumbers=1
augroup nerdtree_
    autocmd!
    " autocmd vimenter * NERDTree
    " setting auto launching command
    autocmd StdinReadPre * let s:std_in=1
    " open vim and NERDTree when no file is choosen
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && winnr('$') < 2 | NERDTree | endif
    " NERDTree cwd is same as working area
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    " when there is only NERDTree left, quit vim
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
let g:webdevicons_conceal_nerdtree_brackets = 1

" Plugin: animate
nnoremap <silent> <Up>    :call animate#window_delta_height(5)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-5)<CR>
nnoremap <silent> <Right>  :call animate#window_delta_width(5)<CR>
nnoremap <silent> <Left> :call animate#window_delta_width(-5)<CR>

"=============================================="
" Vim Configuration"
"=============================================="

syntax enable
set encoding=utf8
set showcmd
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler
set hlsearch
set confirm
set history=200
set cursorline
set number
set relativenumber
set spr
set sb
set ttimeoutlen=100
set swapfile
set dir=~/tmp
set incsearch
set mouse=a
set fillchars+=vert:│
set showmatch

"=============================================="
" Mapping
"=============================================="

" source vimrc
map <leader>rc :tabe ~/.vimrc<cr>
augroup source_vimrc
    au!
    au bufwritepost .vimrc source ~/.vimrc 
augroup END

" Tab
nnoremap ,1 1gt
nnoremap ,2 2gt
nnoremap ,3 3gt
nnoremap ,4 4gt
nnoremap ,5 5gt
nnoremap ,6 6gt
nnoremap ,7 7gt
nnoremap ,8 8gt
nnoremap ,9 9gt
nnoremap <C-t> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>

" Others
nnoremap ,n :let @/=""<cr>
nnoremap ,N :set<space>nospr<bar>30vs<bar>set<space>spr<bar>Nread<space>scp://y0ch3n@140.112.94.129:2020//home/y0ch3n/<cr>
nnoremap ,l :60vs<bar>ter<space>++curwin<cr>
augroup aucmd_
    au!
    au filetype cpp nnoremap ,m :w<bar>:!g++<space>%:t<space>-o<space>out<space>&&<space>./out<space>&&<space>rm<space>./out<cr>
    au filetype python nnoremap ,m :w<bar>:!python3<space>%:t<cr>
    au filetype go nnoremap ,m :GoRun<space>%<cr>
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"=============================================="
" Colorscheme
"=============================================="

set background=dark
let g:gruvbox_material_background = 'medium'
let g:airline_theme = 'gruvbox_material'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_transparent_background = 1
colorscheme gruvbox-material
