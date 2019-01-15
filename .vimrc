syntax on
set number
set nocompatible              " be iMproved, required
filetype off                  " required
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set splitright

" Improve ESC delay
set timeoutlen=1000 ttimeoutlen=0

"map leader key
let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'Shougo/neoinclude.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'kristijanhusak/deoplete-phpactor'
Plugin 'mattn/emmet-vim'
Plugin 'vim-syntastic/syntastic'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Include use statement

nnoremap <Leader>dd :call phpactor#UseAdd()<CR>
"
" " Invoke the context menu
nnoremap <Leader>mm :call phpactor#ContextMenu()<CR>
"
" " Invoke the navigation menu
nnoremap <Leader>nn :call phpactor#Navigate()<CR>
"
" " Goto definition of class or class member under the cursor
nnoremap <Leader>o :call phpactor#GotoDefinition()<CR>
"
" " Transform the classes in the current file
noremap <Leader>tt :call phpactor#Transform()<CR>
"
" " Generate a new class (replacing the current file)
nnoremap <Leader>cc :call phpactor#ClassNew()<CR>
"
" " Extract expression (normal mode)
" nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
"
" " Extract expression from selection
" vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
"
" " Extract method from selection
" vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:deoplete#enable_at_startup = 1

" My keymaps
nnoremap tn :tabnew<Space>
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>N
vnoremap tt y/\V<C-r>=escape(@",'/\')<CR><CR>Ncgn
inoremap jk <esc>
cnoremap <silent> jk <esc>
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR> 
nnoremap fr :find **/

colorscheme colorsbox-faff

set backspace=indent,eol,start " backspace over everything in insert mode

" CtrlP settings
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_custom_ignore={'dir':'vendor$'}

set wildignore+=*/.git/*
set wildignore+=*/.hg/*
set wildignore+=*/.svn/*
set wildignore+=*/.idea/*
set wildignore+=*/.DS_Store
" set wildignore+=*/vendor/*
set wildignore+=*/var/*
set wildignore+=*/tmp/*                                     " ctrlp - ignore files in tmp directories
set wildignore+=*/target/*                                  " ctrlp - ignore files in target directories
set wildignore+=*/build/*                                   " ctrlp - ignore gradle build directories
set wildignore+=*.swp                                       " ctrlp - ignore .swp files
set wildignore+=*.zip                                       " ctrlp - ignore .zip files
set wildignore+=*.pdf                                       " ctrlp - ignore .pdf files
set wildignore+=*/node_modules/*                            " ctrlp - ignore node modules
set wildignore+=*/bower_components/*                        " ctrlp - ignore bower components
set wildignore+=*/dist/*                                    " ctrlp - ignore grunt build directory

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" Ultisnips settings
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
