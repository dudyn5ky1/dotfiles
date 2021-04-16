call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tranvansang/octave.vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'vimlab/split-term.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'alvan/vim-closetag'
Plug 'w0rp/ale'
Plug 'vim-test/vim-test'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'dudyn5ky1/vim', { 'as': 'dracula' }
Plug 'chrisbra/Colorizer'
Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'izifortune/weblink.vim'
Plug 'dudyn5ky1/weblink.vim'
Plug 'mhinz/vim-startify'
" Plug '907th/vim-auto-save'
Plug 'tpope/vim-rails'
" Plug 'dudyn5ky1/follow-markdown-links'
" Plug '~/Desktop/projects/github/follow-markdown-links'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'lervag/vimtex'
" Plug 'SirVer/ultisnips'
Plug 'mechatroner/rainbow_csv'
Plug 'vim-ruby/vim-ruby'
Plug 'vimwiki/vimwiki'
Plug 'ianks/vim-tsx'
Plug 'jbyuki/instant.nvim'

call plug#end()

"" General
set number
set relativenumber
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set mouse=a
set splitbelow
set splitright
set autoindent
set smartindent
set smarttab
set noexpandtab
set encoding=UTF-8
set fileencoding=utf-8
set autoread
set smartindent
set cindent


"" Vim collaboration
let g:instant_username = "maksym"

"" Fix for copying to system clipboard
:let $LANG='en_US.UTF-8'

"" FZF config
nnoremap <C-F> :FZF<CR>
nnoremap <C-G> :Ag<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

"" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nmap <C-Q> :NERDTreeToggle<CR>
nmap <C-A> :NERDTreeFocus<CR>
nmap <C-U> :TestFile<CR>
nmap <C-T> :split <bar> resize 20 <bar> terminal<CR>
vmap <leader>y "*y
nmap <leader>p "*p
tnoremap jj <C-\><C-n>
nnoremap D :move +1<CR>
nnoremap U :move -2<CR>


"" Eslint
let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier'],
 \ 'typescript': ['tslint', 'prettier'],
 \ 'javascript.jsx': ['eslint'],
 \ 'typescript.jsx': ['eslint'],
 \ 'ruby': ['rubocop']
 \ }

"" Git gutter config
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 0

"" Open vim fugitive diff in vertical splits
set diffopt+=vertical

let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:ale_fix_on_save = 1

syntax on
set t_Co=256
set cursorline

let g:test#javascript#runner = 'jest'

"" Color scheme
colorscheme dracula
let g:dracula_colorterm = 1
hi Normal guibg=NONE ctermbg=NONE

"" Jedi vim
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

"" COC
nmap <silent> \ge <Plug>(coc-definition)

"" Weblink
let g:weblink_host_url = "https://stash.ryanair.com"
let g:weblink_host_url_prefix = "/projects/"

"" Navigation between panes
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

"" Markdown preview
let g:mkdp_auto_close = 0

"" Nerd tree config
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusUseNerdFonts = 1
set guifont=DroidSansMono_Nerd_Font:h11

"" Startify. Prevent changing working directory
let g:startify_change_to_dir = 0
let g:startify_custom_header_quotes = [
        \ systemlist("~/scripts/get_quotes.sh")
        \ ]

"" Fix for wrong template literal highlight
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 0


"" Autosave files
" let g:auto_save = 1

"" Goyo / Limelight
let g:limelight_conceal_ctermfg = 238
function! s:goyo_leave()
  hi Normal guibg=NONE ctermbg=NONE
  Limelight!
endfunction
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"" Vim-tex
" set conceallevel=1
" let g:tex_conceal='abdmg'
" let g:tex_flavor = 'latex'


"" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["vim-snippets"]

"" Spellcheck
" setlocal spell
" set spelllang=en_gb,pl,uk,ru
" inoremap <C-y> <c-g>u<Esc>[s1z=`]a<c-g>u

"" Vim wiki
set nocompatible
filetype plugin on
let g:vimwiki_list = [{'path': '~/Documents/notes',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

set backspace=indent,eol,start

"" Svelte (treat .svelte as .html)
au! BufNewFile,BufRead *.svelte set ft=html
