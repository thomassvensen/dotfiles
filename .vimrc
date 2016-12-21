set relativenumber
:au FocusLost * silent! wa

" Vundle setup starts here
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
let path='~/vimfiles/bundle'
"call vundle#begin(path)
"
"" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"
"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"
"Plugin 'bling/vim-airline'
"
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"
"
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"
"" Vundle setup end


" Start maximized
au GUIEnter * simalt ~x

" Autosave when switching to other window
"autocmd FocusLost * :wall

let g:airline_powerline_fonts = 1

if has("autocmd")
	" set verbosity to at least 1, except during startup and closedown
	"if ! &verbose
	"	au vimEnter * set verbose=1
	"	au vimLeave * set verbose=0
	"endif


	" this was fixed by patch 7.1.261 but doesn't hurt,
	" and will make Vim open UTF-16 files with BOM correctly even without that patch
	if has('multi_byte')
		au BufReadPost * if (&fenc == 'ucs-2le') && &bomb | e ++enc=utf-16le | endif
		au BufReadPost * if (&fenc == 'ucs-2')   && &bomb | e ++enc=utf-16   | endif
	endif
endif

if has("multi_byte")
	let g:locale_encoding = &encoding
	if &encoding !~? '^u'		" ... if not already Unicode ...
		if &termencoding == ""
			let &termencoding = &encoding
		endif
		set encoding=utf-8
	endif
	set fileencodings=ucs-bom,utf-8,latin1
	setg bomb fileencoding=utf-8
"	if has("printer")
"		set penc=utf-8
"	endif
endif

" Don't want to be limited to old-fashioned VI
set nocompatible

" Turn on syntax highlighting
syntax enable

" Try to auto-detect file encoding
set fileencodings=ucs-bom,utf-8,latin-1

" Expand tabs to spaces
set expandtab

" I always have a dark background
set background=dark

" Tab size 4
set softtabstop=4

" Move in/out in steps of 4
set shiftwidth=4

" Allow backspace to delete previously inserted text
set backspace=2

" Don't create those annoying backup files
set backupskip=*

" When a bracket is inserted, briefly jump to the matching one.
set sm!

" Never move to the upper/lower edges of the screen
set scrolloff=2

" No characters should trigger auto-magic indentation
set cinkeys=""

" No need to "reselect" old visual area after indenting
:vnoremap < <gv
:vnoremap > >gv

" Incremental searching
set incsearch

" Search case sensitively only when I enter UPPER CASE letters
set ignorecase smartcase

" Don't create those annoying swp files
set noswapfile

" Avoid noisy message from NERD_comments when editing .txt files
let NERDShutUp=1

" Setup gh ("Go Home") to set working directory to match current buffer
" Causes problems, eg. when doing diff from CVS
function! CDCURR()
        let _dir = expand("%:p:h")
        exec "cd " . _dir
        unlet _dir
endfunction
:nmap gh :call CDCURR()<CR>

" Causes "Parse Error" in Visual Studio
" autocmd BufEnter * call CDCURR()

" Enable reading class files as text
" autocmd BufReadPre *.class set ro
" autocmd BufReadPost *.class silent %!jad -p "%" 
" autocmd BufReadPost *.class set filetype=java

" Enable reading PDF's as text
" autocmd BufReadPre *.pdf set ro
" autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78

" Vim Tip 790 - view word documents in Vim (good for diff'ing)
" autocmd BufReadPre *.doc set ro
" autocmd BufReadPre *.doc set hlsearch
" autocmd BufReadPost *.doc silent %!antiword '%' 


" Cool to use Control + h,j,k,l to resize the windows :-)
nmap <C-h> :vertical resize -1<CR>
nmap <C-l> :vertical resize +1<CR>
nmap <C-j> <C-w>+
nmap <C-k> <C-w>-

" Match behaviour in Vimperator and standard Windows programs
nmap <silent> <C-n> :bn<CR>
nmap <silent> <C-p> :bp<CR>
nmap <C-Tab> :bn<CR>
nmap <C-S-Tab> :bp<CR>
nmap <space> <C-d>

" Bash-like history searching
cmap <C-p> <Up>
cmap <C-n> <Down>
cmap <A-b> <C-Left>
cmap <C-b> <Left>
cmap <A-f> <C-Right>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-BS> <C-W>
cmap <A-BS> <C-W>

nmap <Leader>b :buffers<CR>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" Ctrl-I toggles search hilighting
nmap <silent> <C-I> :let &hlsearch = !&hlsearch<CR>

" Vim Tip 145 (show whether unix or dos line endings are used)
set statusline=%f\ %m%<%w%r%=[%{&ff}][%{&enc}]\ %l,%v\ \ %P

" Show modified date, current time+date, lines, buffer number, filetype, etc.
"set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
set rulerformat=%15(%c%V\ %p%%%)
"set rulerformat=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%,=%{CurTime()}

fu! FileTime()
        let ext=tolower(expand("%:e"))
        let fname=tolower(expand('%<'))
        let filename=fname . '.' . ext
        let msg=""
        let msg=msg." ".strftime("(Mod. %d.%m'%y %H:%M)",getftime(filename))
        return msg
endf

fu! CurTime()
        let ftime=""
        let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
        return ftime
endf 

" Vim Tip 154 - to allow overriding the alt key
set winaltkeys=menu
imap <A-BS> <C-w>
imap <C-BS> <C-w>
cmap <A-BS> <C-w>
cmap <C-BS> <C-w>

" Vim Tip 15 - always show status line
set laststatus=2

" DBExt stuff
let g:dbext_default_profile_HR   = 'type=ORA:user=hr:passwd=hr'
let g:dbext_default_profile_AIW   = 'type=ORA:user=aiw:passwd=aiw'
let g:dbext_default_type   = 'ORA'
let g:dbext_default_user   = ''
let g:dbext_default_passwd = ''

" Get new windows below and to the right of the current one (not using it
" since I don't bother setting it on all servers I access.)
set splitright
set splitbelow

" Enable query log highlighting
"au BufRead,BufNewFile query_log.* set filetype=querylog
au! Syntax querylog source $VIM/vimfiles/syntax/querylog.vim

" Make searching by start of line easier
nmap <C-space> /^

" Make it swift to support ConfluenceWiki
nmap gw :set filetype=confluencewiki linebreak<CR>

" For some reason need to override these
set shell=cmd
set shellcmdflag=/c

" Easier to switch between buffers
nmap B :buffer 

" Avoid the BOMB
set nobomb

" Show line numbers
set number

" Make it easy to type curly braces indepently of keyboard layout
imap ((( {
imap ))) }
