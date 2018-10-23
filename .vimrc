" Plugin Section
call plug#begin('~/.vim/plugs')

" Sensible default settings
Plug 'tpope/vim-sensible'
" File Explorer for Vim
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Git status icons for NERDTree
Plug 'xuyuanp/nerdtree-git-plugin'
" Icons for NERDTree
Plug 'ryanoasis/vim-devicons'
" Add git commands in Vim
Plug 'tpope/vim-fugitive'
" Show git status in the gutter
Plug 'airblade/vim-gitgutter'
" Zen Mode for Vim
Plug 'junegunn/goyo.vim'
" Line area highlighting (default in goyo plugin)
Plug 'junegunn/limelight.vim'
" Search plugins for FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'mhinz/vim-startify'
" Autocompletion
Plug 'valloric/youcompleteme'
" Comment with gcc, uncomment with gcgc
Plug 'tpope/vim-commentary'
" Various keystrokes for better UX
Plug 'tpope/vim-unimpaired'
" Powerful keystrokes for search
Plug 'easymotion/vim-easymotion'
" Auto close tag
Plug 'docunext/closetag.vim'
" Auto brackets
Plug 'tpope/vim-surround'
" Minimalist Status Line
Plug 'itchyny/lightline.vim'
" Kill a buffer
Plug 'qpkorr/vim-bufkill'
" Color Schemes
Plug 'jdkanani/vim-material-theme'
Plug 'altercation/vim-colors-solarized'

call plug#end()

set encoding=UTF-8

" Change the mapleader from \ to ,
let mapleader=","

"Setup gundo
nnoremap <F5> :GundoToggle<CR>

"Setup fzf vim plugin
"set rtp+=/usr/local/opt/fzf

"Eliminates OS defaults
set nocompatible

"Unix fileformats only! (Fuck carriage returns!)
set ffs=unix

"Line numbers
set number

"Relative line numbers
set relativenumber

"Automatically toggle off relative line numbers on Insert mode and others
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"Set fold method
set foldmethod=indent

" Ack searches with ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"Syntax highlighting
syntax on

"Auto-Indent per filetype
filetype indent plugin on

"Setting for nerdcommenter plugin
filetype plugin on

"Better command-line completion
set wildmenu
set wildmode=list:longest,full

"Show partial commands in the last line of the screen
set showcmd

"Highlight searches (use <C-L> to temporarily turn off highlighting; see the mapping of <C-L> below)
set hlsearch

"Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

"Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

"Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

"When adding a new line, keep the indentation of the previous line (filetype-specific indentation takes priority)
set autoindent

"Stop certain movements from always going to the first character of a line (deviates from Vi)
"set nostartofline

"Display the cursor position (numerically, in the status line)
set ruler

"Always display the status line
set laststatus=2

"Instead of failing a command due to unsaved files, ask to save.
set confirm

"Use visual notification instead of beeping when doing something wrong.
set visualbell

"This overrides the visualbell. Use it in conjunction with set visualbell to turn off beep and visual notifications
"set t_vb=

"Enable use of the mouse for all modes
set mouse=a

"Set the command window height to 2 lines, instead of 1
set cmdheight=2

"All tabs and indentations are 2 spaces by default.
"Pressing F9 toggles between the default and 8-column hardtabs.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" function TabToggle()
"   if &expandtab
"     set tabstop=3
"     set shiftwidth=3
"     set softtabstop=3
"     set noexpandtab
"   else
"     set tabstop=2
"     set shiftwidth=2
"     set softtabstop=2
"     set expandtab
"   endif
" endfunction
" nmap <F9> mz:execute TabToggle()<CR>'z

" function ToUnix()
"  update
"  e ++ff=dos
"  setlocal ff=unix
"  w
" endfunction

"Have VIM automatically set the title to the current file
set title
set titlestring=%F%r%m

"Set clipboard
set clipboard=unnamed

"JJ = ESC
:imap jj <Esc>

:imap <S-Tab> <C-N>

"Autocomplete using Tab
"function! Tab_Or_Complete()
"  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"    return "\<C-N>"
"  else
"    return "\<Tab>"
"  endif
"endfunction
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

"Switch panes using jkhl
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Saves
map <Leader>w :w<Enter>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

"Enables copy & paste
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

"Sets up powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

"In diffs, added lines are green, changed lines are yellow, deleted lines are
"red, and changed text (within a changed line) is bright yellow and bold.
highlight DiffAdd    ctermfg=0 ctermbg=2
highlight DiffChange ctermfg=0 ctermbg=3
highlight DiffDelete ctermfg=0 ctermbg=124
highlight DiffText   ctermfg=0 ctermbg=11 cterm=bold

"Invert selected lines in visual mode
"highlight Visual     ctermfg=NONE ctermbg=NONE cterm=inverse

"Dim line numbers, comments and color columns
"highlight LineNr      ctermfg=247
highlight Comment     ctermfg=8
highlight ColorColumn ctermfg=7 ctermbg=8
highlight Folded      ctermfg=7 ctermbg=30
highlight FoldColumn  ctermfg=7 ctermbg=8
highlight Pmenu       ctermfg=15 ctermbg=8
highlight PmenuSel    ctermfg=8 ctermbg=15

" Limelight Config
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
" When there's no empty line between the paragraphs
" and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
"
" Highlighting priority (default: 10)
" Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [['mode', 'paste'], ['filename', 'modified']],
      \   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ },
      \ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" Section: Color and syntax
"--------------------------------------------------------------------------

" Make sure colored syntax mode is on, and make it Just Work with newer 256
" color terminals like iTerm2.
" colorscheme solarized
colors default 
" set background=dark
" set termguicolors
" Fixes colors for Tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:rehash256 = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
let g:solarized_diffmode = "high"

if !has('gui_running')
  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
  elseif has("terminfo")
    colorscheme default
    colors default
    set t_Co=8
    set t_Sf=[3%p1%dm
    set t_Sb=[4%p1%dm
  else
    colorscheme default
    colors default
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  endif
  " Disable Background Color Erase when within tmux - https://stackoverflow.com/q/6427650/102704
  if $TMUX != ""
    set t_ut=
  endif
endif
