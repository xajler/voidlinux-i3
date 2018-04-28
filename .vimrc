set nocompatible
filetype plugin on
set shell=bash
syntax enable
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set relativenumber
set autoindent
set magic " unbreak vim's regex implementation
set noesckeys

set ruler
set cc=80
"
" Search as you type, highlight results
set incsearch
set showmatch
set hlsearch

" Don't litter swp files everywhere
set backupdir=~/.cache
set directory=~/.cache

set tags=./tags;

let mapleader = ","
"
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

colorscheme wal

nnoremap S :%s//g<Left><Left>
vnoremap S noop
vnoremap S :s//g<Left><Left>
nnoremap \\ :noh<cr> " Clear higlighting

" No Hell's bells please!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Various file formats
autocmd FileType c setlocal noet ts=4 sw=4 tw=80
autocmd FileType h setlocal noet ts=4 sw=4 tw=80
autocmd FileType cpp setlocal noet ts=4 sw=4 tw=80
autocmd FileType s setlocal noet ts=4 sw=4
autocmd FileType go setlocal noet ts=4 sw=4
autocmd FileType hy setlocal filetype=lisp
autocmd FileType sh setlocal noet ts=4 sw=4
autocmd BufRead,BufNewFile *.js setlocal et ts=2 sw=2
autocmd FileType html setlocal et ts=2 sw=2
autocmd FileType htmldjango setlocal et ts=2 sw=2
autocmd FileType ruby setlocal et ts=2 sw=2
autocmd FileType scss setlocal et ts=2 sw=2
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType markdown setlocal tw=80
autocmd FileType text setlocal tw=80
autocmd FileType meson setlocal noet ts=2 sw=2
autocmd FileType bzl setlocal et ts=2 sw=2
autocmd FileType typescript setlocal et ts=2 sw=2
autocmd BufNewFile,BufRead *.ms set syntax=python ts=4 sw=4 noet
autocmd BufNewFile,BufRead *.scd set syntax=markdown ts=4 sw=4 noet
autocmd FileType tex hi Error ctermbg=NONE

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

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

map <F6> :setlocal spell! spelllang=en_us<CR>
map <F10> :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a

" Enable autocompletion:
set wildmode=longest,list,full
set wildmenu

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
