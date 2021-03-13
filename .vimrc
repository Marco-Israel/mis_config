
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set undofile
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set directory=~/.vim/swp,/tmp,/var/tmp,.
set writebackup
autocmd BufWritePre  * let &bex='@' . strftime("%F.%H")
set autoindent "automatische Zeileneinrueckung
set smartindent "intelligente Zeileneinrueckung
set expandtab "Tabs durch Leerzeichen ersetzen lassen
set shiftwidth=4 "Anzahl der Leezeichen fuer autoindent
set softtabstop=4 "Ruecktaste loescht Tab, 4 Leerzeichen
set ignorecase "Gross-/Kleinschreibung ignorieren
"set smartcase "Gross-/Kleinschreibung NICHT ignorieren wenn CameCase
set hlsearch "Suchergebnisse hervorheben
set incsearch "Ergebnisse beim Tippen anzeigen
set cryptmethod=blowfish "Verschuesselungsmethode definieren
"set cursorline "aktuelle Zeile unterstreichen
set history=1000 "setzt die bash history. Default in vim=20, vi=0
set showmatch "öffnende und schließende Klammern hervorheben
set showcmd "Kommandos beim Eintippen rechts unten in der Statuszeile anzeigen
set autoread  "Liest die Datei neu, wenn ausserhalb von VIM geändert.
set wrap
set linebreak "Bei aautomatiscben Linebreak (set wrap) Wörter nicht trennen
set list "listchars anzeigen
set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:+,eol:$,precedes:#,extends:* " Tabs und Leerzeichen am Zeilenende anzeigen hjkhj
set list "listchars anzeigen
set relativenumber "Relative Zeilennummern
set nocompatible "enter the current millenium
set colorcolumn=80 "show a line in <n> coloum
set textwidth=80  "autowrap after 80 char for instance. 0==turn off.
set splitright " new vertical splits are on the right
set linebreak  "break a line hard, not only display a linebreak.
set nolist
set expandtab "   Tabs durch Leerzeichen ersetzen lassen
set tabstop=4 " Tab auf 4 Zeichen setzen
set shiftwidth=4 "   Anzahl der Leezeichen fuer autoindent
set softtabstop=4 "   Ruecktaste loescht Tab, 4 Leerzeichen
"set clipboard=unnamedplus,unnamed "d,c,y,x will write the text into *,+.
set clipboard=""
set laststatus=2 " Statuszeile immer anzeigen.
set statusline+=%F
set path+=** "extand the vim path"
"set path+=../**
"set path+=../../**
"set tags+=$PWD/.scopedb/ctags.db
set number "Activates real number"
set scrolloff=15 "show the last X lines. 999 = Center everytime.
set viminfo='100,f1,:20,@20,/20
set encoding=utf-8
set fileencodings:=utf-8
set ffs=unix
set cmdheight=1     " Hight of error massage box.
set shortmess+=aFOo     "Error message format and types
set shortmess-=S        "Show search / matching results lik [ 11 / 47 ] if <99
set fo=tcroqnblj   "Activate textwide wrapping.
set shortmess+=aI  " Short message or turn massage off
set belloff+=all "If Vim beeps during completion
set matchpairs=(:),{:},[:] "define matching pairs
set ruler rulerformat=%15(%c%V\ %p%%%)
set encoding=utf8
set fillchars=fold:\
set sessionoptions=curdir,folds,tabpages,winsize,terminal
"set isfname-=:  "split a filename:linenumber to filename when press key gf


"set pumheight=8 "Maximum members of matches shown in poplist. 0 all.
"set previewpopup=height:10,width:60 "Overwrite use of preview to popup
"set shortmess+=c " Don't pass messages to |ins-completion-menu|.
"
"
" Always show the signcolumn, otherwise it would shift the text
" each time diagnostics appear/become resolved.
" Recently vim can merge signcolumn and number column into one
"if has("patch-8.1.1564")
"    set signcolumn=number
"else
"    set signcolumn=yes
"endif
""

""" "Vim (quickfix) completion """""""""""""""""""""""""""""""""""""""""""""""""
set autowrite
set autowriteall
set complete=.,t,w,b,u,U,k,kspell,s "not: d/i=included, k/sfile special file
set completeopt=menu,menuone,longest,preview,noinsert
"set completeopt=menu,menuone,longest,preview,noselect
"set previewpopup=height:10,width:60 "Overwrite use of preview to popup

""" Foldable code blocks """"""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldlevelstart=3
set foldlevel=5
set foldnestmax=5
set foldminlines=3
set foldmethod=indent
set foldopen=all
"set foldtext=
autocmd InsertEnter,WinLeave * setlocal foldmethod=manual

""" List special chars  for filetypes
autocmd BufNewFile,BufRead *.make,mk            setlocal list
autocmd BufNewFile,BufRead *.make,mk            setlocal noexpandtab



""" Open Quickfix entry in Vertical split """""""""""""""""""""""""""""""""""""
autocmd FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L


""" Set flode """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * setlocal foldmethod=syntax


""" Open URL under cursor """"""""""""""""""""""""""""""""""""""""""""""""""""""
function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!open '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
map <leader>u :call HandleURL()<cr>


""" Set options for preview window """""""""""""""""""""""""""""""""""""""""""""
augroup PreviewAutocmds
  autocmd!
  autocmd WinEnter * if &previewwindow | setlocal nonumber | endif
augroup END


"" Set options for help """"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType help  setlocal nospell
autocmd FileType help  setlocal number


""" Fill up a line till cursorculumn """""""""""""""""""""""""""""""""""""""""""
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth + 1
    if tw==0 | let tw = 81| endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(repeat(a:str, reps))/
    endif
endfunction
map <special> <F5>  :call FillLine(matchstr(getline('.')[col('.') - 1 :], '^.'))<CR>
map <C-F5>  :call FillLine(input(">")) <CR>
"


""" Toggle diffoptions """""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffopt+=iwhite,iwhiteall,iwhiteeol,vertical,closeoff
if &diff
     map gs :call DiffWhiteToggle()<CR>
     function! DiffWhiteToggle()
       if &diffopt =~ 'iwhite'
		 set diffopt+=iwhite,iwhiteall,iwhiteeol,vertical,closeoff
       else
		 set diffopt-=iwhite,iwhiteall,iwhiteeol,vertical,closeoff
       endif
     endfunction
 endif



""" Deleate all buffers """"""""""""""""""""""""""""""""""""""""""""""""""""""""
command Bd :up | %bd | e#



""" open vertical """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Newvert( str )
  :vsp a:str
  <CR>h
  :resize vertical 82
  <CR>l
endfunction


""" Grep in all open buffers """"""""""""""""""""""""""""""""""""""""""""""""""
function! BuffersList()
  let all = range(0, BUfnr('$'))
  let res = []
  for b in all
    if buflisted(b)
      call add(res, bufname(b))
    endif
  endfor
  return res
endfunction

function! GrepBuffers (expression)
  exec 'vimgrep/'.a:expression.'/ '.join(BuffersList())
endfunction

command! -nargs=+ GrepBufs call GrepBuffers(<q-args>)



""" color current line, not underline it """""""""""""""""""""""""""""""""""""""
"highlight CursorLine term=bold,underline,undercurl cterm=bold,underline,undercurl



""" Spelling and spellcheck """"""""""""""""""""""""""""""""""""""""""""""""""""
set spell spelllang=en_us
autocmd VimEnter,BufNewFile,BufReadPost *.uml <buffer> :setlocal nospell
autocmd BufNewFile,BufRead *.txt           setlocal spell spelllang=en_us,de_de
autocmd BufNewFile,BufRead *.tex           setlocal spell spelllang=en_us,de_de
autocmd BufNewFile,BufRead *.todo          setlocal spell spelllang=en_us,de_de
autocmd BufNewFile,BufRead README          setlocal spelllang=en_us,de_de
autocmd BufNewFile,BufRead *.c,*.cpp       setlocal spelllang=en_us
autocmd BufNewFile,BufRead *.h,*.hpp,*.hh  setlocal spelllang=en_us
autocmd BufNewFile,BufRead *.py            setlocal spelllang=en_us
autocmd BufNewFile,BufRead *.sh            setlocal spelllang=en_us


""" Tag handling """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufNewFile,BufRead *c,*.cpp,*h,*hh.*hpp set
"            \ tags=~/.tags/last_project,
"            \ ~/.tags/last_utest,
"            \ ~/.tags/thirdparty,
"            \~/.tags/cpputest



""" Syntax and colors """ """"""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on "Sytaxhighliting einschalten
set background=dark
set t_Co=256
colorscheme mis
"source ~/.config/vimrc_256colors
match TODO /s+%#@<!$/
let g:rainbow_active = 0    "Colord Brackets
set autoindent              "turns it on
set smartindent   "does the right thing (mostly) in programs
set cindent       "stricter rules for C programs
let c_space_errors = 1 "space errors einschalten
let java_space_errors = 1 "space errors einschalten
let python_space_errors = 1 "space errors einschalten
let ruby_space_errors = 1 "space errors einschalten
let c_curly_error = 1 "highlight a missing }; can be slow down vim !!



""" Jason syntax highlight """""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType json syntax match Comment +\/\/.\+$+



""" Save last current line in a open file when close """""""""""""""""""""""""""
 if has("autocmd")
     au BufReadPost * if line("'\"") > 1
                 \ && line("'\"") <= line("$") | exe "normal! g'\"" | endif
 endif



""" Vim internal Explorer setting """"""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=2  " open in prior window in vertical split
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree style view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 10    "split size in in percentage of page



""" FileTyoe and Syntax """"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufFilePost,BufEnter,BufReadPost,FileReadPost,SessionLoadPost *.tex
            \ set filetype=tex

""" Change Cursor Colllor """"""""""""""""""""""""""""""""""""""""""""""""""""""
 if &term =~ "xterm\\|rxvt"
     "1 is the blinky block cursor
     "2 is the default (non-blinky) block cursor
     "3 is blinky underscore
     "4 fixed underscore
     "5 pipe bar (blinking)
     "6 fixed pipe bar

     " use an orange cursor in insert mode
     let &t_SI = "\033[2 q"
     "let &t_SI .= "\<Esc>]12;orange\007"
     let &t_SI .= "\<Esc>]12;green\x7"
     "let &t_SI .= \"\<Esc>[4 q"

     " use an orange cursor in insert mode
     let &t_SR = "\033[1 q"
     let &t_SR .= "\<Esc>]12;green\x7"
     "let &t_SR .= "\<Esc>]12;orange\007"


      "use a red cursor otherwise
     let &t_EI = "\033[2 q"
     let &t_EI .= "\<Esc>]12;orange\007"
     "let &t_EI .= "\<Esc>]12;green\x7"
     "let &t_EI .= \"\<Esc>[5 q"
     "
     " reset cursor when vim exits
     au VimLeave * silent execute '!echo -e "\033]12;magenta\007"'
     au VimLeave * silent execute '!echo -e "\033[6 q"'
 else
     au VimLeave * silent execute '!echo -e "\033]12;magenta\007"'
     au VimLeave * silent execute '!echo -e "\033[6 q"'
 endif


 """ Deleat all Trailing Whitespace """"""""""""""""""""""""""""""""""""""""""""
"autocmd TabClosed,BufLeave,VimLeave,VimLeavePre,WinLeave,BufWrite * :%s/\s\+$//e<CR>
"autocmd BufLeave,VimLeave,VimLeavePre,BufWritePre * :call StripTrailingWhitespaces()
autocmd VimLeavePre,BufWritePre * :call StripTrailingWhitespaces()
function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction


""" Combining move and scroll. Scroll a page instead/without cursor movement """
function! s:Saving_scroll(cmd)
  let save_scroll = &scroll
  execute 'normal! ' . a:cmd
  let &scroll = save_scroll
endfunction
nnoremap <C-Down> :call <SID>Saving_scroll("1<C-V><C-D>")<CR>
vnoremap <C-Down> <Esc>:call <SID>Saving_scroll("gv1<C-V><C-D>")<CR>
nnoremap <C-Up> :call <SID>Saving_scroll("1<C-V><C-U>")<CR>
vnoremap <C-Up> <Esc>:call <SID>Saving_scroll("gv1<C-V><C-U>")<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Key MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Toggle auto-linebreak
"noremap <M-F4> :set formatoptions+=a<CR>
"noremap <C-F4> :set formatoptions-=a<CR>


"faster moving inside splits
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
"

"remap copy past to clipboard buffers
nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP


"toggle between tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabmmove<Space>
nnoremap td  :tabclose<CR>
nnoremap ta  :tabnew<CR>


"new tab or close tab with shift+[cn]
"map <M-n> mz:tabnew<CR>
"map <M-c> mz:tabclose<CR>


"Swap lineslines
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z


"strg+w mapping
"nmap <C-> <C-w>left
"nmap <C-> <C-w>right
nmap <C-w>< <C-w>5<
nmap <C-w>> <C-w>5>
"new tab or close tab with shift+[cn]


" Get maake errors into quickfix.  Configure the `make` command to run RSpec
"set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter


"moving between breaked lines
nnoremap k gk
nnoremap j gj
"inoremap <C-k> <C-o>gk
"inoremap <C-j> <C-o>gj


"Show taglist instead of jump directly
"nnoremap <C-]> g<C-]>


"map for all modes, apply by using nmap, vmap, and imap
map <F6> :w!<CR>:!aspell --lang=en_us check %<CR>:e! %<CR>
map <leader>hex :%!xxd<CR>        " Hexeditor mit \hex starten
map <leader>nhex :%!xxd -r<CR>    " Hexeditor mit \nhex beenden
map <F3> <C-V>}<S-I>
map <C-F9> :r!date +\%Y-\%m-\%d<CR>
"map <F11> //####################ETWAS########################<ESC>?ETWAS<CR>cw




map <C-F9> :call StripTrailingWhitespaces()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"From
"http://vimcasts.org/episodes/simple-calculations-with-vims-expression-register/

"Use of vims expression register . Past it into cursor place.
        "Simple on command line on command line press:
            "<C-r>=

"Calculate the term from the beginning of the line TILL an REQUIRED '='.
        nnoremap \lcalc 0yt=A<C-r>=<C-r>"<CR><Esc>


"From "https://vim.fandom.com/wiki/Using_vim_as_calculator
"Use Linux bc on line in INSERT or VISUAL selection. REPLACEs the current line.
        "Pipe the CURRENT LINE to bc and REPLACE with it with the result:
            "!!bc
        "Pipe the VISUAL selected inbc and REPLACE with it with the result:
            "!bc

"Calculate the term from the beginning of the line TILL CURSOR. Adds '=' before
        inoremap \elcalc <C-O>yiW<End>=<C-R>=<C-R>0<CR>

"Calculate the CURRENT LINE by Linux bc.
        map \lecalc yypkA =<Esc>jOscale=2<Esc>:.,+1!bc<CR>kJ

"Calculate VISUAL BLOCK of Numbers and insert result IN A NEW LINE.
        vmap \bclac "y'>p:'[,']-1s/$/+/\|'[,']+1j!<CR>
            \ '[0"wy$:.s§.*§\=w§<CR>'[yyP:.s/./=/g<CR>_j


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Auto open quickfix or list window after preforming make or lmake.
  augroup Vimtex
    autocmd!
    autocmd QuickFixCmdPost lmake lwindow
    autocmd QuickFixCmdPost Make lwindow
    autocmd QuickFixCmdPost make cwindow
  augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Assyncrone Make
  command! -bang -nargs=* -complete=file Make
          \ AsyncRun<bang> -auto=make -program=make






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source  ~/.vimplug.conf





"""" Grep in all open bufffers """"""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" TEMPLATES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TODO: Create a selection menu for it like the compleat menu !!
"TODO: Ore configure compleation by using FZF. eg like calling FZF with a path
"predifined via command or hotkey like map autocmd <key> FZF "path/to/templates.
"nnoremap ,html :-1read $PROJECT_HOME/bin/templates/cpputestcpp.txt<CR>3jwf>a
nnoremap ,ccc :-1read ~/templates/template.c<CR>/__TODO__<CR>
nnoremap ,utest :-1read ~/templates/cpputest/test_template.cpp<CR>/____TODO____<CR>
nnoremap ,mockapp :-1read $PROJECT_HOME/TOOLS/templates/cpputest/mockCppHpp.txt<CR>/____TODO____<CR>
nnoremap ,mockcpp :-1read $PROJECT_HOME/TOOLS/templates/cpputest/mockCpp.txt<CR>/____TODO____<CR>
nnoremap ,mockhpp :-1read $PROJECT_HOME/TOOLS/templates/cpputest/mockHpp.txt<CR>/____TODO____<CR>
nnoremap ,test :-1read $PROJECT_HOME/TOOLS/templates/cpputest/cpputestCppCase.txt <CR>/____TODO____<CR>
nnoremap ,testcpp :-1read $PROJECT_HOME/TOOLS/templates/empty_ch_template.txt<CR>/____TODO______<CR>
nnoremap ,empty :-1read $PROJECT_HOME/TOOLS/templates/empty_ch_template.txt<CR>/____TODO______<CR>
nnoremap ,ooc :-1read $PROJECT_HOME/TOOLS/thirdparty/mi_ooc/productive/mi_ooc.c<CR>/____TODO______<CR>
nnoremap ,ooch :-1read $PROJECT_HOME/TOOLS/thirdparty/mi_ooc/productive/mi_ooc.h<CR>/____TODO______<CR>
nnoremap ,oob :-1read $PROJECT_HOME/TOOLS/thirdparty/mi_ooc/productive/mi_ooc_base_template.c<CR>/____TODO______<CR>
nnoremap ,oobh :-1read $PROJECT_HOME/TOOLS/thirdparty/mi_ooc/productive/mi_ooc_base_template.h<CR>/____TODO______<CR>
nnoremap ,oos :-1read $PROJECT_HOME/TOOLS/thirdparty/mi_ooc/productive/mi_ooc_sub_template.c<CR>/____TODO______<CR>
nnoremap ,oosh :-1read $PROJECT_HOME/TOOLS/thirdparty/mi_ooc/productive/mi_ooc_sub_template.h<CR>/____TODO______<CR>
nnoremap ,erroh :-1read $PROJECT_HOME/TOOLS/thirdparty/mi_ooc/productive/mi_ooc_errorHandler.c<CR>/____TODO______<CR>
nnoremap ,errohh :-1read $PROJECT_HOME/TOOLS/thirdparty/mi_ooc/productive/mi_ooc_errorHandler.h<CR>/____TODO______<CR>
nnoremap ,umlc :-1read $PROJECT_HOME/TOOLS/templates/plantumlNote.txt<CR>/____TODO______<CR>
nnoremap ,sempty :-1read $PROJECT_HOME/TOOLS/templates/shortDocinfo.txt<CR>/____TODO______<CR>
