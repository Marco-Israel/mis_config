" Vim color file - marco9_modified3
" Generated by http://bytefluent.com/vivify 2016-12-29
set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

set t_Co=256
let g:colors_name = "marco_pi"

"cterm: bold, underline, reverse, italic, none
"Highlight makefile variables, strings ...
"
""" MAIN Default Groups """"""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Comment    guifg=#969696   guibg=NONE    guisp=NONE    gui=NONE ctermfg=246  ctermbg=NONE cterm=NONE
hi Constant   guifg=#00afaf   guibg=NONE    guisp=NONE    gui=NONE ctermfg=14   ctermbg=NONE cterm=NONE
hi Identifier guifg=#ff8700   guibg=NONE    guisp=#262626 gui=NONE ctermfg=214  ctermbg=NONE cterm=NONE
hi Statement  guifg=#00ffff   guibg=NONE    guisp=NONE    gui=NONE ctermfg=14   ctermbg=NONE cterm=NONE
hi PreProc    guifg=#ff8700   guibg=NONE    guisp=NONE    gui=NONE ctermfg=214  ctermbg=NONE cterm=ITALIC
hi Type       guifg=#00ffff   guibg=NONE    guisp=NONE    gui=NONE ctermfg=198  ctermbg=NONE cterm=BOLD
hi Special    guifg=#940094   guibg=NONE    guisp=NONE    gui=NONE ctermfg=85   ctermbg=NONE cterm=NONE
hi Underlined cterm=underline term=underline
"hi Ignore     guifg=bg        ctermfg=bg
hi Error      guifg=NONE      guibg=#fff0f0 guisp=#fff0f0 gui=NONE ctermfg=NONE ctermbg=160  cterm=NONE
hi Todo       guifg=#f00e8b   guibg=#262626 guisp=#262626 gui=NONE ctermfg=0    ctermbg=219  cterm=BOLD

""" COMMENT """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" CONSTANT """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi String    guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15  ctermbg=NONE cterm=NONE
hi Character guifg=#707070 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi Number    guifg=#ffd700 guibg=NONE guisp=NONE gui=NONE ctermfg=208  ctermbg=NONE cterm=NONE
hi Boolean   guifg=#707070 guibg=NONE guisp=NONE gui=NONE ctermfg=195 ctermbg=NONE cterm=NONE
hi Float     guifg=#707070 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE

""" IDENTIFIER """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Function     guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=187 ctermbg=NONE cterm=NONE

""" STATEMENT """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Conditional guifg=#ff5f00 guibg=NONE guisp=NONE gui=NONE ctermfg=30  ctermbg=NONE cterm=NONE
hi Repeat      guifg=#4a4a4a guibg=NONE guisp=NONE gui=NONE ctermfg=85  ctermbg=NONE cterm=NONE
hi Label       guifg=#4a4a4a guibg=NONE guisp=NONE gui=NONE ctermfg=13  ctermbg=NONE cterm=NONE
hi Operator    guifg=#4a4a4a guibg=NONE guisp=NONE gui=NONE ctermfg=199 ctermbg=NONE cterm=NONE
hi Keyword     guifg=#4a4a4a guibg=NONE guisp=NONE gui=NONE ctermfg=9   ctermbg=NONE cterm=NONE
hi Exception   guifg=#4a4a4a guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE

""" PRE-PROC """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Include   guifg=#ff8700 guibg=NONE guisp=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=ITALIC
hi Define    guifg=#ff8700 guibg=NONE guisp=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=BOLD
hi Macro     guifg=#ff8700 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi PreCondit guifg=#ff8700 guibg=NONE guisp=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=ITALIC

""" TYPE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi StorageClass guifg=#4a4a4a guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi Structure    guifg=#ff8800 guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi Typedef      guifg=#4a4a4a guibg=NONE guisp=NONE gui=NONE ctermfg=30  ctermbg=NONE cterm=NONE

""" SPECIAL """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi SpecialChar    guifg=#707070 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi Tag            guifg=#707070 guibg=NONE guisp=NONE gui=NONE ctermfg=0   ctermbg=NONE cterm=NONE
hi Delimiter      guifg=#707070 guibg=NONE guisp=NONE gui=NONE ctermfg=198 ctermbg=NONE cterm=NONE
hi SpecialComment guifg=#707070 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi Debug          guifg=#707071 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE

""" UNDERLINE """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" IGNORE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" TO-DO """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi ColorColumn     guifg=NONE    guibg=#f5f5f5 guisp=#f5f5f5    gui=NONE      ctermfg=NONE ctermbg=237      cterm=NONE
hi Conceal          guifg=#707070 guibg=NONE    guisp=NONE       gui=NONE      ctermfg=242  ctermbg=NONE    cterm=NONE
hi Cursor           guifg=#080808 guibg=#c6c6c6 guisp=#c6c6c6    gui=underline ctermfg=0  ctermbg=0     cterm=underline
hi lCursor          guifg=#080808 guibg=#c6c6c6 guisp=#c6c6c6    gui=underline ctermfg=0  ctermbg=NONE    cterm=underline
hi CursorIM         guifg=#080808 guibg=#c6c6c6 guisp=#c6c6c6    gui=underline ctermfg=0  ctermbg=NONE    cterm=underline
hi CursorColumn     guifg=NONE    guibg=#f5f5f5 guisp=#f5f5f5    gui=NONE      ctermfg=NONE ctermbg=0     cterm=NONE
hi CursorLine       guifg=#080808 guibg=#c6c6c6 guisp=#c6c6c6    gui=underline ctermfg=NONE ctermbg=NONE     cterm=underline
hi Directory        guifg=#4a4a4a guibg=NONE    guisp=NONE       gui=NONE      ctermfg=249  ctermbg=NONE    cterm=NONE
hi DiffAdd          guifg=#4a4a4a guibg=NONE    guisp=NONE       gui=NONE      ctermfg=249  ctermbg=darkred cterm=NONE
hi DiffChange       guifg=#4a4a4a guibg=NONE    guisp=NONE       gui=NONE      ctermfg=249  ctermbg=239     cterm=NONE
hi DiffDelete       guifg=#4a4a4a guibg=NONE    guisp=NONE       gui=NONE      ctermfg=249  ctermbg=cyan    cterm=NONE
hi DiffText         guifg=#4a4a4a guibg=NONE    guisp=NONE       gui=NONE      ctermfg=249  ctermbg=red     cterm=bold
hi EndOfBuffer      guifg=#00ffff guibg=NONE    guisp=NONE       gui=NONE      ctermfg=85   ctermbg=NONE    cterm=NONE
hi ErrorMsg         guifg=#e4e4e4 guibg=#ff0000 guisp=#ff0000    gui=NONE      ctermfg=254  ctermbg=160     cterm=NONE
hi VertSplit        guifg=#e3e3e3 guibg=NONE    guisp=NONE       gui=NONE      ctermfg=254  ctermbg=NONE    cterm=NONE
hi Folded           guifg=#808080 guibg=#000040 ctermfg=darkgrey ctermbg=black cterm=bold   term=bold
hi FoldColumn       guifg=#808080 guibg=#000040 ctermfg=darkgrey ctermbg=black cterm=bold   term=bold
hi SignColumn       guifg=#c2c2c2 guibg=NONE    guisp=NONE       gui=NONE      ctermfg=7    ctermbg=NONE    cterm=NONE
hi IncSearch        guifg=#700253 guibg=#ffd7d7 guisp=#ffd7d7    gui=bold      ctermfg=53   ctermbg=214     cterm=bold
hi LineNr           guifg=#ffd700 guibg=NONE    guisp=NONE       gui=NONE      ctermfg=208  ctermbg=NONE    cterm=NONE
hi CursorLineNr     guifg=#ffd700 guibg=NONE    guisp=NONE       gui=NONE      ctermfg=214  ctermbg=NONE    cterm=NONE
hi LineNrAbove      guifg=#ffd700 guibg=NONE    guisp=NONE       gui=NONE      ctermfg=84 ctermbg=NONE    cterm=NONE
hi LineNrBelow      guifg=#ffd700 guibg=NONE    guisp=NONE       gui=NONE      ctermfg=85  ctermbg=NONE    cterm=NONE
hi MatchParen       guifg=NONE    guibg=#e3e3e3 guisp=#e3e3e3    gui=NONE      ctermfg=202  ctermbg=254     cterm=NONE
hi ModeMsg          guifg=#00ff00 guibg=#262626 guisp=#262626    gui=NONE      ctermfg=172  ctermbg=193     cterm=NONE
hi MoreMsg          guifg=#00ff00 guibg=#262626 guisp=#262626    gui=NONE      ctermfg=172  ctermbg=193     cterm=NONE
hi NonText          guifg=#c2c2c2 guibg=NONE    guisp=NONE       gui=NONE      ctermfg=21   ctermbg=NONE    cterm=NONE
hi Normal           guifg=#f00e8b guibg=#262626 guisp=#262626    gui=NONE      ctermfg=219  ctermbg=236     cterm=BOLD
hi PMenu            guifg=#000000 guibg=#ff7fc5 guisp=#ff7fc5    gui=italic    ctermfg=232  ctermbg=212     cterm=NONE
hi PMenuSel         guifg=#5f005f guibg=#69ffff guisp=#69ffff    gui=bold      ctermfg=53   ctermbg=85      cterm=bold
hi PMenuSbar        guifg=#000000 guibg=#ffffff guisp=#ffffff    gui=NONE      ctermfg=NONE ctermbg=15      cterm=NONE
hi PMenuThumb       guifg=#080808 guibg=#ff005f guisp=#ff005f    gui=NONE      ctermfg=232  ctermbg=197     cterm=NONE
hi Question         guifg=#080808 guibg=#ff005f guisp=#ff005f    gui=NONE      ctermfg=232  ctermbg=172     cterm=NONE
hi Search           guifg=#700253 guibg=#ffafd7 guisp=#ffafd7    gui=NONE      ctermfg=53   ctermbg=202     cterm=NONE
hi QuickfixLine     guifg=#00ffff guibg=NONE    guisp=NONE       gui=NONE      ctermfg=NONE ctermbg=NONE    cterm=ITALIC
hi SpecialKey       guifg=#c2c2c2 guibg=NONE    guisp=NONE       gui=NONE      ctermfg=7    ctermbg=NONE    cterm=NONE
hi SpellBad         guifg=NONE    guibg=#fff0f0 guisp=#fff0f0    gui=NONE      ctermfg=None   ctermbg=None    cterm=underline
hi SpellCap         guifg=NONE    guibg=#f0fff0 guisp=#f0fff0    gui=NONE      ctermfg=NONE ctermbg=NONE    cterm=NONE
hi SpellLocal       guifg=NONE    guibg=#f0fff0 guisp=#f0fff0    gui=NONE      ctermfg=NONE ctermbg=NONE    cterm=NONE
hi SpellRare        guifg=NONE    guibg=#ededed guisp=#ededed    gui=NONE      ctermfg=NONE ctermbg=NONE    cterm=NONE
hi StatusLine       guifg=#262626 guibg=#d0d0d0 guisp=#d0d0d0    gui=NONE      ctermfg=0    ctermbg=252     cterm=NONE
hi StatusLineNC     guifg=#121212 guibg=#3dffff guisp=#3dffff    gui=NONE      ctermfg=0    ctermbg=127     cterm=NONE
hi StatusLineTerm   guifg=#262626 guibg=#d0d0d0 guisp=#d0d0d0    gui=NONE      ctermfg=0    ctermbg=252     cterm=NONE
hi StatusLineTermNC guifg=#121212 guibg=#3dffff guisp=#3dffff    gui=NONE      ctermfg=0    ctermbg=127     cterm=NONE
hi TabLine          guifg=#969696 guibg=#ededed guisp=#ededed    gui=NONE      ctermfg=246  ctermbg=214     cterm=NONE
hi TabLineFill      guifg=NONE    guibg=#ededed guisp=#ededed    gui=NONE      ctermfg=NONE ctermbg=214     cterm=NONE
hi TabLineSel       guifg=#262626 guibg=#ededed guisp=#ededed    gui=NONE      ctermfg=235  ctermbg=214     cterm=NONE
hi Terminal         guifg=#262626 guibg=#ededed guisp=#ededed    gui=NONE      ctermfg=16   ctermbg=219     cterm=NONE
hi Title            guifg=#707070 guibg=NONE    guisp=NONE       gui=NONE      ctermfg=242  ctermbg=NONE    cterm=NONE
hi Visual           guifg=NONE    guibg=#e3e3e3 guisp=#e3e3e3    gui=NONE      ctermfg=NONE ctermbg=12      cterm=NONE
hi VisualNDS        guifg=NONE    guibg=#e3e3e3 guisp=#e3e3e3    gui=NONE      ctermfg=NONE ctermbg=27      cterm=NONE
hi WarningMsg       guifg=NONE    guibg=#fff0f0 guisp=#fff0f0    gui=NONE      ctermfg=NONE ctermbg=160     cterm=NONE
hi WildMenu         guifg=NONE    guibg=#d1d1d1 guisp=#d1d1d1    gui=NONE      ctermfg=9    ctermbg=252     cterm=NONE


""" TAG HIGHLIGTER """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi CTagsImport         guifg=#00ffff guibg=NONE    guisp=NONE    gui=NONE ctermfg=9   ctermbg=NONE cterm=ITALIC
hi CTagsGlobalVariable guifg=#00ffff guibg=NONE    guisp=NONE    gui=NONE ctermfg=9   ctermbg=NONE cterm=ITALIC
hi CTagsGlobalConstant guifg=#00ffff guibg=NONE    guisp=NONE    gui=NONE ctermfg=9   ctermbg=NONE cterm=ITALIC
hi CTagsClass          guifg=#00ffff guibg=NONE    guisp=NONE    gui=NONE ctermfg=9   ctermbg=NONE cterm=ITALIC
hi CTagsMember         guifg=#00ffff guibg=NONE    guisp=NONE    gui=NONE ctermfg=9   ctermbg=0  cterm=ITALIC
hi EnumerationValue    guifg=#00ffff guibg=NONE    guisp=NONE    gui=NONE ctermfg=85  ctermbg=NONE cterm=ITALIC
hi EnumerationName     guifg=#00ffff guibg=NONE    guisp=NONE    gui=NONE ctermfg=85  ctermbg=NONE cterm=ITALIC
hi LocalVariable       guifg=NONE    guibg=#262626 guisp=#262626 gui=NONE ctermfg=9   ctermbg=NONE cterm=BOLD
hi GlobalVariable      guifg=NONE    guibg=#262626 guisp=#262626 gui=NONE ctermfg=225 ctermbg=NONE cterm=BOLD
hi DefinedName         guifg=NONE    guibg=#262626 guisp=#262626 gui=NONE ctermfg=58  ctermbg=NONE cterm=BOLD
hi Union               guifg=#00ffff guibg=NONE    guisp=NONE    gui=NONE ctermfg=196 ctermbg=NONE cterm=BOLD


""" C.VIM """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hp def link cFormat            cSpecial
"hi def link cCppString         cString
"hi def link cCommentL          cComment
"hi def link cCommentStart      cComment
"hi def link cLabel             Label
"hi def link cUserLabel         Label
"hi def link cConditional       Conditional
"hi def link cRepeat            Repeat
"hi def link cCharacter         Character
"hi def link cSpecialCharacter  cSpecial
"hi def link cNumber            Number
"hi def link cOctal             Number
"hi def link cOctalZero         PreProc
"hi def link cFloat             Float
"hi def link cOctalError        cError
"hi def link cParenError        cError
"hi def link cErrInParen        cError
"hi def link cErrInBracket      cError
"hi def link cCommentError      cError
"hi def link cCommentStartError cError
"hi def link cSpaceError        cError
"hi def link cWrongComTail      cError
"hi def link cSpecialError      cError
"hi def link cCurlyError        cError
"hi def link cOperator          Operator
"hi def link cStructure         Structure
"hi def link cTypedef           Structure
"hi def link cStorageClass      StorageClass
"hi def link cInclude           Include
"hi def link cPreProc           PreProc
"hi def link cDefine            Macro
"hi def link cIncluded          cString
"hi def link cError             Error
"hi def link cStatement         Statement
"hi def link cCppInWrapper      cCppOutWrapper
"hi def link cCppOutWrapper     cPreCondit
"hi def link cPreConditMatch    cPreCondit
"hi def link cPreCondit         PreCondit
"hi def link cType              Type
"hi def link cConstant          Constant
"hi def link cCommentString     cString
"hi def link cComment2String    cString
"hi def link cCommentSkip       cComment
"hi def link cString            String
"hi def link cComment           Comment
"hi def link cSpecial           SpecialChar
"hi def link cTodo              Todo
"hi def link cBadContinuation   Error
"hi def link cCppOutSkip        cCppOutIf2
"hi def link cCppInElse2        cCppOutIf2
"hi def link cCppOutIf2         cCppOut
"hi def link cCppOut            Comment





"autocmd BufRead,BufEnter,BufAdd,BufNewFile,BufWritePost,BufWinEnter,ColorScheme * syn match math /[><%&*\/]/ | hi math guifg=#ff1998 guibg=#303030 guisp=#303030 gui=BOLD ctermfg=198 ctermbg=NONE cterm=NONE
autocmd FileType c,cpp,python  autocmd Syntax,ColorScheme * syn match math /[><%;!?=&*]/ | hi math guifg=#ff1998 guibg=#303030 guisp=#303030 gui=BOLD ctermfg=199 ctermbg=NONE cterm=NONE
autocmd FileType c,cpp,python  autocmd Syntax,ColorScheme  * syn match parents /[()\]\[{}]/ | hi parents guifg=#ff1998 guibg=#303030 guisp=#303030 gui=NONE ctermfg=198  ctermbg=NONE cterm=NONE
autocmd FileType c,cpp,python  autocmd Syntax,ColorScheme  * syn match parents2 /[()]/ | hi parents2 guifg=#ff1998 guibg=#303030 guisp=#303030 gui=NONE ctermfg=14  ctermbg=NONE cterm=NONE
autocmd FileType c,cpp,python  autocmd Syntax,ColorScheme  * syn match other /[,]/ | hi other guifg=#ff1998 guibg=#303030 guisp=#303030 gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
"autocmd Syntax,BufReadPost,BufNew,BufEnter,BufAdd,BufNewFile,BufWritePost,BufWinEnter,ColorScheme  * syn match structure /\w.*__st/
autocmd FileType c,cpp,python  autocmd Syntax,ColorScheme  * syn match structure /\<\S\+_st\>/
autocmd FileType c,cpp,python  autocmd Syntax,ColorScheme  * syn match enum /\<\S\+_et\>/ |  hi enum guifg=#ff1998 guibg=#303030 guisp=#303030 gui=NONE ctermfg=94  ctermbg=NONE cterm=NONE
"autocmd BufRead,BufEnter,BufAdautocmd d,BufNewFile,BufWritePost,BufWinEnter,ColorScheme  * syn match variable /\<\S\+_S\>/ | hi variable guifg=#ff1998 guibg=#303030 guisp=#303030 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
"
"
" "Highlight all function names
autocmd FileType c,cpp,python  autocmd Syntax,ColorScheme  * syntax match Type /bool_t\|char_t/
"autocmd BufRead,BufEnter,BufAdautocmd d,BufNewFile,BufWritePost,BufWinEnter,ColorScheme * syntax match testmacros /TRUE\|FALSE\|STATIC\|EXTERN\|PROTECTED\|INLINE\|TEST_GROUP\|TEST\|POINTERS_EQUAL\|LONGS_EQUAL\|NULL\|NULLPTR\|PTR\|SPY\|MOCK\|FAKE\|STUP/
"autocmd BufRead,BufEnter,BufAdautocmd d,BufNewFile,BufWritePost,BufWinEnter,ColorScheme * syntax match StorageClass /TRUE\|FALSE\|STATIC\|EXTERN\|PROTECTED\|INLINE\|TEST_GROUP\|TEST\|POINTERS_EQUAL\|LONGS_EQUAL\|NULL\|NULLPTR\|PTR\|SPY\|MOCK\|FAKE\|STUP/
"autocmd BufRead,BufEnter,BufAdautocmd d,BufNewFile,BufWritePost,BufWinEnter,ColorScheme * syntax match MacroUse "\v<[A-Z]+>"| hi MacroUse guifg=#ff1998 guibg=#303030 guisp=#303030 gui=NONE ctermfg=208  ctermbg=NONE cterm=NONE
"autocmd Syntax,BufReadPost,BufNew,BufEnter,BufAdd,BufNewFile,BufWinEnter,ColorScheme * syntax match MacroUse "\v<[A-Z_0-9]+>"| hi link MacroUse Macro
autocmd FileType c,cpp,python  autocmd Syntax,ColorScheme * syntax match Macro "\v<[A-Z_0-9]+>"
"""
"autocmd BufRead,BufEnter,BufAdautocmd d,BufNewFile,BufWritePost,BufWinEnter,ColorScheme * syntax match StorageClass /CHECK_EQUAL\|MEMCMP_EQUAL\|FUNCTIONPOINTERS_EQUAL\|DOUBLES_EQUAL\|POINTERS_EQUAL\|BYTES_EQUAL\|UNSIGNED_LONGS_EQUAL\|POINTERS_EQUAL\|BYTES_EQUAL\|UNSIGNED_LONGS_EQUAL/
"autocmd BufRead,BufEnter,BufAdautocmd d,BufNewFile,BufWritePost,BufWinEnter,ColorScheme * syntax match StorageClass /LONGS_EQUAL\|STRCMP_CONTAINS\|STRCMP_NOCASE_EQUAL\|STRNCMP_EQUAL\|STRNCMP_EQUAL\|CHECK_THROWS\|CHECK_COMPARE\|CHECK_EQUAL\|CHECK_FALSE\|CHECK_FALSE\|CHECK/
"autocmd BufRead,BufEnter,BufAdd,BufNewFile,BufWritePost,BufWinEnter,ColorScheme * syntax match StorageClass /IMPORT_TEST_GROUP\|TEST_GROUP_BASE\|TEST_GROUP\|IGNORE_TEST\|\<TEST\>/
"autocmd BufRead,BufEnter,BufAdd,BufNewFile,BufWritePost,BufWinEnter,ColorScheme * syntax match StorageClass /\<TG_.*\>/

