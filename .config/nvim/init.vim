filetype plugin on
syntax enable


call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ajmwagar/vim-deus'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'OrangeT/vim-csharp.git'
"Plug 'fsharp/vim-fsharp', {
"      \ 'for': 'fsharp',
"      \ 'do':  'make fsautocomplete',
"      \}
"Plug 'moll/vim-node'
"Plug 'walm/jsjint.vim'
"Plug 'jelera/vim-javascript-syntax'
"Plug 'maksimr/vim-jsbeautify'
Plug 'scrooloose/syntastic'
" Plug 'Valloric/YouCompleteMe'
"Plug 'yggdroot/indentline'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
endif
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

let mapleader = ","

set nocompatible
set encoding=utf-8
set shell=bash
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set relativenumber
set autoindent
set magic " unbreak vim's regex implementation
" set noesckeys
set scrolloff=5
set ruler
set listchars=tab:▸\ ,eol:¬
set tags=./tags;
set t_Co=256
set termguicolors
set background=dark
set cursorline
" Enable autocompletion:
set wildmode=longest,list,full
set wildmenu
" Search as you type, highlight results
set incsearch
set showmatch
set hlsearch
" Don't litter swp files everywhere
set backupdir=~/.cache
set directory=~/.cache
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright
" No Hell's bells please!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set autowrite

" gruvbox

let g:gruvbox_termcolors=256
let g:gruvbox_guisp_fallback = 'fg'
" colorscheme deus
colorscheme gruvbox
" Overrides colorscheme
" Set background transparent
highlight Normal guibg=NONE
" Set ColorColumn to be more darker
" highlight ColorColumn guibg=#222222
"highlight NonText ctermfg=59 ctermbg=0 cterm=NONE guifg=#414e58 guibg=#232c31 gui=NONE

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" let g:deus_termcolors=256

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>t
map <C-k> <C-w>n
map <C-l> <C-w>s

map <C-s> :wincmd l<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>

no s l
no S L
no l s
no L S

" Disable Ex mode
nnoremap Q <nop>

nnoremap S :%s//g<Left><Left>
vnoremap S noop
vnoremap S :s//g<Left><Left>
" nnoremap <Enter> :noh<cr> " Clear higlighting
nnoremap \\ :noh<cr> " Clear higlighting

" Various file formats
autocmd FileType c setlocal noexpandtab tabstop=4 shiftwidth=4 textwidth=85 colorcolumn=85 textwidth=100
autocmd FileType h setlocal noexpandtab tabstop=4 shiftwidth=4 textwidth=85 colorcolumn=85 textwidth=100
autocmd FileType cpp setlocal noexpandtab tabstop=4 shiftwidth=4 textwidth=85 colorcolumn=85 textwidth=100
autocmd FileType s setlocal noexpandtab tabstop=4 shiftwidth=4 colorcolumn=85 textwidth=85 textwidth=100
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 colorcolumn=85 textwidth=100
autocmd FileType hy setlocal filetype=lisp
autocmd FileType sh setlocal noexpandtab tabstop=4 shiftwidth=4 colorcolumn=85 textwidth=120
autocmd BufRead,BufNewFile *.js setlocal expandtab colorcolumn=85 textwidth=120
autocmd FileType javascript let b:syntastic_checkers = ['eslint']
autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType htmldjango setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=85 textwidth=85
autocmd FileType fsharp setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=85 textwidth=120
autocmd FileType csharp setlocal expandtab tabstop=4 shiftwidth=4 colorcolumn=85 textwidth=120
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 colorcolumn=79 textwidth=120
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=85 textwidth=120
autocmd FileType markdown setlocal textwidth=120
autocmd FileType text setlocal textwidth=120
autocmd FileType meson setlocal noexpandtab tabstop=2 shiftwidth=2
autocmd FileType bzl setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.ms set syntax=python tabstop=4 shiftwidth=4 noexpandtab colorcolumn=85 textwidth=85
autocmd BufNewFile,BufRead *.scd set syntax=markdown tabstop=4 shiftwidth=4 noexpandtab colorcolumn=85 textwidth=85
autocmd FileType tex hi Error ctermbg=NONE

" Markdown
"Make calcurse notes markdown compatible:
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

nmap <leader>l :set list!<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F10> :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a


" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
" map <leader>t :%s/\s\+$//e

" Copy selected text to system clipboard (requires xclip installed):
vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><enter>

" Use urlview to choose and open a url:
:noremap <leader>u :w<Home>silent <End> !urlview<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" NERDTree
map <Leader>n :NERDTreeToggle<cr>

" FZF
map <Leader>f :FZF<cr>
" map <Leader>f :Files<CR>
map <Leader>ta :Tags<cr>
map <Leader>bu :Buffers<cr>

" use ripgrep for finding text
"map <Leader>f :Find<space>
command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Omni complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <leader>, <C-x><C-o>

map <leader>y "+y
map <leader>p "+p


" cpp
"
"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1

" fsharp
" "
"let g:fsharp_only_check_errors_on_write = 1
"let g:fsharp_interactive_bin = '/usr/bin/fsharpi'
"let g:fsharp_xbuild_path = "/usr/bin/xbuild"


" Syntastic
" "

let g:syntastic_jslint_checkers=['eslint']
"let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail

" Support for vim modeline in git config.
let git_config_modeline = system("git config --get vim.modeline")
if strlen(git_config_modeline)
    exe "set" git_config_modeline
endif

" Node-vim
"autocmd User Node
"  \ if &filetype == "javascript" |
"  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
"  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
"  \ endif

" ycm
" let g:ycm_extra_conf_vim_data   = ['&filetype']
"let g:ycm_auto_trigger = 1
"let g:ycm_min_num_of_chars_for_completion = 3
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_autoclose_preview_window_after_insertion = 1

" vim-jsbeautify
".vimrc
"map <leader>b :call JsBeautify()<cr>
" or
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
"autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
"autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
"autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
"autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Airline
let g:airline_left_sep = ''        " Remove arrow symbols.
let g:airline_left_alt_sep = ''    " Remove arrow symbols.
let g:airline_right_sep = ''       " Remove arrow symbols.
let g:airline_right_alt_sep = ''   " Remove arrow symbols.
let g:airline_theme = 'tomorrow'   " Use hybrid theme.
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Show tabs and spaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
au FileType nerdtree set nolist

" These are supposedly colors for Neovim's terminal emulator

" let g:terminal_color_0 = "#202020"
" let g:terminal_color_1 = "#333333"
" let g:terminal_color_2 = "#666666"
" let g:terminal_color_3 = "#80a78c"
" let g:terminal_color_4 = "#f7c527"
" let g:terminal_color_5 = "#ffffff"
" let g:terminal_color_6 = "#333333"
" let g:terminal_color_7 = "#ffffff"
" let g:terminal_color_8 = "#ec691e"
" let g:terminal_color_9 = "#73e4f6"
" let g:terminal_color_10 = "#ffffff"
" let g:terminal_color_11 = "#a1d7f2"
" let g:terminal_color_12 = "#73e4f6"
" let g:terminal_color_13 = "#f7c527"
" let g:terminal_color_14 = "#ec691e"
" let g:terminal_color_15 = "#f7c527"
" let g:terminal_color_16 ="#202020"
" let g:terminal_color_background="#202020"
" let g:terminal_color_foreground="#eee"

" Path to python
" let g:python3_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'

fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

command! TrimWhitespace call TrimWhitespace()


" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>t :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Go setup
" Clashes with 'q:'
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
"let g:go_fmt_fail_silently = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>. :GoAlternate<CR>
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang Av call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang As call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang At call go#alternate#Switch(<bang>0, 'tabe')

" Deoplete
let g:deoplete#enable_at_startup = 1


