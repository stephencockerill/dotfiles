set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'saltstack/salt-vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'chase/vim-ansible-yaml'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" generic settings
set encoding=utf-8
set nu
let python_highlight_all=1
syntax on
set clipboard=unnamed
set cursorline
let mapleader = ","
set mouse=a
set noswapfile
vnoremap p "_dP

" split window preferences
set splitbelow	" :sp <filename>
set splitright	" :vs <filename>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1	" show docstring

" enable folding with the spacebar
noremap <space> za

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=90 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" text file indentation
au BufNewFile,BufRead *.txt
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=90 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" js/html/css indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" nerdtree settings
let NERDTreeIgnore=['\.pyc$', '\$']	" ignore .pyc files
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree		" auto open nerdtree
autocmd vimenter * wincmd p		" go to previous window (start in file not nerdtree)
map <C-n> :NERDTreeToggle<CR>   " toggle nerdtree on/off

" youcompleteme settings
let g:ycm_collect_identifiers_from_tags_files = 1 " let ycm read tags from ctags file
let g:ycm_use_ultisnips_completer = 1 " default 1, just ensure
let g:ycm_seed_idnetifiers_with_syntax = 1 " completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " completion in comments
let g:ycm_complete_in_strings = 1 " completion in string
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Goto definition with
map <leader>g :YcmCompleter GoTo<CR>

" choose color scheme
if has('gui_running')
  set background=dark
  colorscheme solarized
  call togglebg#map("<F5>")
else
  colorscheme zenburn
endif
