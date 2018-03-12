set number
set relativenumber

"""BASIC TOOLS
"Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>
let mapleader = ","
"For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
"For split navigation
map <C-h> <C-w>h
let g:Ctrl_j = 'off'
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set nocompatible
filetype plugin on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

nnoremap S :%s//g<Left><Left>
vnoremap S noop
vnoremap S :s//g<Left><Left>

" No Hell's bells please!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

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


syntax on

"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

colorscheme wal

"set laststatus=2
set encoding=utf-8
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_theme = 'solarized256'
"let g:Powerline_theme = 'solarized256'
"let g:Powerline_colorscheme = 'solarized256'

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
map <F5> :!w<Enter>:!pdflatex <C-r>%<Enter>
"Spell-check set to F6
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F10> :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a

set wildmode=longest,list,full
set wildmenu

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++

vnoremap K xkP`[V`]
vnoremap J xp`[V`]
vnoremap L >gv
vnoremap H <gv

"autocmd BufWritePost *.md !pandoc <C-r>% -o <C-r>&<Backspace><Backspace>pdf && evince <C-r>%<Backspace><Backspace>pdf
"


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
