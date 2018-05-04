filetype plugin on
syntax enable

call plug#begin('~/.config/nvim/plugged')
Plug 'ajmwagar/vim-deus'
Plug 'junegunn/goyo.vim'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'OrangeT/vim-csharp.git'
Plug 'fsharp/vim-fsharp'
call plug#end()

colorscheme deus
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

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:deus_termcolors=256

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap S :%s//g<Left><Left>
vnoremap S noop
vnoremap S :s//g<Left><Left>
" nnoremap <Enter> :noh<cr> " Clear higlighting
nnoremap \\ :noh<cr> " Clear higlighting

" Various file formats
autocmd FileType c setlocal noexpandtab tabstop=4 shiftwidth=4 textwidth=85 colorcolumn=85 textwidth=85
autocmd FileType h setlocal noexpandtab tabstop=4 shiftwidth=4 textwidth=85 colorcolumn=85 textwidth=85
autocmd FileType cpp setlocal noexpandtab tabstop=4 shiftwidth=4 textwidth=85 colorcolumn=85 textwidth=85
autocmd FileType s setlocal noexpandtab tabstop=4 shiftwidth=4 colorcolumn=85 textwidth=85 textwidth=85
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 colorcolumn=85 textwidth=85
autocmd FileType hy setlocal filetype=lisp
autocmd FileType sh setlocal noexpandtab tabstop=4 shiftwidth=4 colorcolumn=85 textwidth=85
autocmd BufRead,BufNewFile *.js setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=85 textwidth=85
autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType htmldjango setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=85 textwidth=85
autocmd FileType fsharp setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=85 textwidth=85
autocmd FileType csharp setlocal expandtab tabstop=4 shiftwidth=4 colorcolumn=85 textwidth=85
autocmd FileType scss setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=85 textwidth=85
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=85 textwidth=85
autocmd FileType markdown setlocal textwidth=85
autocmd FileType text setlocal textwidth=85
autocmd FileType meson setlocal noexpandtab tabstop=2 shiftwidth=2
autocmd FileType bzl setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.ms set syntax=python tabstop=4 shiftwidth=4 noexpandtab colorcolumn=85 textwidth=85
autocmd BufNewFile,BufRead *.scd set syntax=markdown tabstop=4 shiftwidth=4 noexpandtab colorcolumn=85 textwidth=85
autocmd FileType tex hi Error ctermbg=NONE

" Markdown
"Make calcurse notes markdown compatible:
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

let g:instant_markdown_autostart = 0

autocmd FileType markdown inoremap <F5> <esc>:!pandoc<space><c-r>%<space>-o<space><c-r>%.pdf<enter>a
autocmd FileType markdown nnoremap <F5> :!pandoc<space><c-r>%<space>-o<space><c-r>%.pdf<enter>
autocmd Filetype markdown inoremap ;n ---<Enter><Enter>
autocmd Filetype markdown inoremap ;b ****<Space><++><Esc>F*hi
autocmd Filetype markdown inoremap ;s ~~~~<Space><++><Esc>F~hi
autocmd Filetype markdown inoremap ;e **<Space><++><Esc>F*i
autocmd Filetype markdown inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ;i ![](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;a [](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;l --------<Enter>
autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%.pdf<Enter><Enter>

nmap <leader>l :set list!<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F10> :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a


" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Copy selected text to system clipboard (requires xclip installed):
vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><enter>

" Use urlview to choose and open a url:
:noremap <leader>u :w<Home>silent <End> !urlview<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" FZF
" fzf and ripgrep
map <Leader>p :Files<CR>
nmap ; :Buffers<CR>

" use ripgrep for finding text
map <Leader>f :Find<space>
command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Omni complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <leader>, <C-x><C-o>


" cpp
"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

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

" Overrides deus colorscheme
" Set background transparent
highlight Normal guibg=NONE
" Set ColorColumn to be more darker
highlight ColorColumn guibg=#222222
