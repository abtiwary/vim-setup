let g:ale_disable_lsp = 1

set nocompatible

call plug#begin('~/.vim/plugged')

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'

Plug 'preservim/nerdtree'

Plug 'BurntSushi/ripgrep'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'fannheyward/telescope-coc.nvim'

Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'

Plug 'mhinz/vim-signify'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'

Plug 'Yggdroot/indentLine'

" Plugin 'ycm-core/YouCompleteMe'

Plug 'machakann/vim-highlightedyank'

Plug 'justinmk/vim-sneak'

" Plug 'chriskempson/base16-vim'
" Plug 'rebelot/kanagawa.nvim'
Plug 'morhetz/gruvbox'

"Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" Rust plugin
Plug 'rust-lang/rust.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dense-analysis/ale'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plug 'L9'

" Plug 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on


"let g:Powerline_symbols="fancy"

let g:airline_theme = "powerlineish"
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ctrlp#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#unicode#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if exists('g:loaded_fugitive')
    set statusline=%<\ %f\ %{fugitive#statusline()}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_experimental_template_highlight = 1

let c_no_curly_error=1

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 0
let g:indentLine_char = '¦'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']


let g:ycm_global_ycm_extra_conf = '$HOME/.vim/ycm_extra_conf/ycm_extra_conf.py'


let g:CommandTPreferredImplementation='ruby'


let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']


" colorscheme solarized
" colorscheme zenburn
" colorscheme desert

colorscheme gruvbox 
let g:gruvbox_contrast_dark = 'hard'

" colorscheme kanagawa 

syntax enable

set encoding=utf-8
set laststatus=2
set timeoutlen=50

set shiftwidth=4
set tabstop=4
set softtabstop=4

set expandtab
set smarttab

set relativenumber number

set showcmd

set cursorline

filetype indent on

set wildmenu

set showmatch

set incsearch
set hlsearch

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" set list
set bg=dark

nmap <F6> :NERDTreeToggle<CR>

set backspace=indent,eol,start

let mapleader = " "

nnoremap <leader>? :Telescope find_files<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


