call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'jreybert/vimagit'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'sickill/vim-monokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'ekalinin/dockerfile.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
call plug#end()

set nocompatible
syntax on
filetype plugin indent on

" indentation
"set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set tabstop=2 shiftwidth=2 noexpandtab smarttab
set scrolloff=8
set tw=0 wm=0
au BufRead,BufNewFile *.txt,*.md set tw=0 wm=0

set incsearch hlsearch showmatch
set number relativenumber

" bash-like TAB completion
set wildmode=longest,list

" Navigate through completion variants using ← and →
set wildmenu

" Case insensitive search if all lowercase
set ignorecase smartcase

" Apply rename to all matches in line
set gdefault

" Show unprintable chars
set list
"set listchars=tab:▹\ ,eol:¬
"set listchars=tab:→\ ,eol:¬
"set listchars=tab:\:\ ,eol:¬
set listchars=tab:⁞\ ,eol:¬

set background=dark
"colorscheme default
"colorscheme railscasts
"colorscheme solarized
"colorscheme zenburn
"colorscheme molokai
"colorscheme seoul256
"not needed for terminal colorscheme dracula

let g:gruvbox_italic=1
colorscheme gruvbox

" enable Normal mode keys in ru layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" cscope
if !has('nvim')
  set cscopequickfix=g-,s-,c-,d-,i-,t-,e-,a-
  " enable using scope as tags
  set cscopetag
  set nocscopeverbose
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set cscopeverbose
  command CR execute 'silent !time cscope -bRq' | redraw! | cs reset
  map g<C-]> :lcs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>s :lcs find s <C-R>=expand("<cword>")<CR><CR>:lopen<CR>
  nmap <C-\>g :lcs find g <C-R>=expand("<cword>")<CR><CR>:lopen<CR>
  nmap <C-\>c :lcs find c <C-R>=expand("<cword>")<CR><CR>:lopen<CR>
  nmap <C-\>t :lcs find t <C-R>=expand("<cword>")<CR><CR>:lopen<CR>
  nmap <C-\>e :lcs find e <C-R>=expand("<cword>")<CR><CR>:lopen<CR>
  nmap <C-\>f :lcs find f <C-R>=expand("<cfile>")<CR><CR>:lopen<CR>
  nmap <C-\>i :lcs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:lopen<CR>
  nmap <C-\>d :lcs find d <C-R>=expand("<cword>")<CR><CR>:lopen<CR>
  nmap <C-\>a :lcs find a <C-R>=expand("<cword>")<CR><CR>:lopen<CR>
endif


" Highlight extra whitespaces at the end
highlight ExtraWhitespace ctermbg=red guibg=red
au BufNew,BufEnter,BufWinEnter,WinEnter,BufNew * match ExtraWhitespace /\s\+$/

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Use Ag as default grep if available
"if executable('ag')
"	set grepprg=ag\ --nogroup\ --nocolor\ --column
"	set grepformat=%f:%l:%c:%m
"	command! -nargs=+ -bang Ag silent! grep <args> | redraw! | botright
"	copen
"endif

" indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_space_guides = 1
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  guibg=#282a36 ctermbg=235
hi IndentGuidesEven guibg=#383a46 ctermbg=236

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_type_glsl = {
    \ 'ctagstype' : 'c',
    \ 'kinds' : [
        \ 'h:header files:1:0',
        \ 'd:macros:1:0',
        \ 'p:prototypes:1:0',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 's:structs',
        \ 'u:unions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0',
        \ 'f:functions',
        \ '?:unknown',
    \ ],
\ }

" S P E E D
let g:airline_highlighting_cache=1
set ttyfast
set lazyredraw

" FZF
nmap <C-P> :FZF<CR>
