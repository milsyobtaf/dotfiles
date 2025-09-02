" One Dark Atom v1.0.0
"
" https://github.com/jdsimcoe/onedarkatom.vim
"
" Copyright 2018. All rights reserved
"
" Code licensed under the MIT license
" https://mit-license.org/
"
" @author Jonathan Simcoe <@jdsimcoe>

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "onedarkatom"

hi Cursor ctermfg=236 ctermbg=15 cterm=NONE guifg=#1e1f21 guibg=#ffffff gui=NONE
hi Visual ctermfg=NONE ctermbg=241 cterm=NONE guifg=NONE guibg=#1e1f21 gui=NONE
hi CursorLine ctermbg=236 cterm=NONE guifg=NONE guibg=#1e1f21 gui=NONE
hi CursorColumn ctermbg=236 cterm=NONE guifg=NONE guibg=#1e1f21 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#3d3f49 gui=NONE
hi LineNr ctermfg=240 ctermbg=NONE cterm=NONE guifg=#25282b guibg=#1e1f21 gui=NONE
hi VertSplit ctermfg=231 ctermbg=236 cterm=bold guifg=#64666d guibg=#64666d gui=bold
hi MatchParen ctermfg=205 ctermbg=NONE cterm=underline guifg=#FF73FD guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=236 cterm=bold guifg=#d9d7cd guibg=#64666d gui=bold
hi StatusLineNC ctermfg=231 ctermbg=236 cterm=NONE guifg=#d9d7cd guibg=#64666d gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#1e1f21 gui=NONE
hi IncSearch ctermfg=236 ctermbg=229 cterm=NONE guifg=#1e1f21 guibg=#FFFFB6 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=62 ctermbg=NONE cterm=NONE guifg=#A8FF60 guibg=NONE gui=NONE
hi Folded ctermfg=33 ctermbg=235 cterm=NONE guifg=#96CBFE guibg=#1e1f21 gui=NONE
hi SignColumn ctermfg=246 ctermbg=235 cterm=NONE guifg=#8a8a8a guibg=#1e1f21 gui=NONE
hi FoldColmun ctermfg=246 ctermbg=235 cterm=NONE guifg=#8a8a8a guibg=#1e1f21 gui=NONE
hi Normal guifg=#d9d7cd guibg=#1e1f21 gui=NONE
hi Boolean ctermfg=62 ctermbg=NONE cterm=NONE guifg=#A8FF60 guibg=NONE gui=NONE
hi Character ctermfg=62 ctermbg=NONE cterm=NONE guifg=#A8FF60 guibg=NONE gui=NONE
hi Comment ctermfg=240 ctermbg=NONE cterm=NONE guifg=#25282b guibg=NONE gui=NONE
hi Conditional ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=79 cterm=bold guifg=#d9d7cd guibg=#00CC95 gui=bold
hi DiffDelete ctermfg=196 ctermbg=NONE cterm=NONE guifg=#F30000 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=221 cterm=NONE guifg=#d9d7cd guibg=#F4D25D gui=NONE
hi DiffText ctermfg=231 ctermbg=221 cterm=bold guifg=#d9d7cd guibg=#F4D25D gui=bold
hi ErrorMsg ctermfg=231 ctermbg=205 cterm=NONE guifg=#f8f8f0 guibg=#FF73FD gui=NONE
hi WarningMsg ctermfg=231 ctermbg=205 cterm=NONE guifg=#f8f8f0 guibg=#FF73FD gui=NONE
hi Float ctermfg=62 ctermbg=NONE cterm=NONE guifg=#A8FF60 guibg=NONE gui=NONE
hi Function ctermfg=50 ctermbg=NONE cterm=NONE guifg=#C6C5FE guibg=NONE gui=NONE
hi Identifier ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=italic
hi Keyword ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi Label ctermfg=229 ctermbg=NONE cterm=NONE guifg=#FFFFB6 guibg=NONE gui=NONE
hi NonText ctermfg=231 ctermbg=NONE cterm=NONE guifg=#1e1f21 guibg=#1e1f21 gui=NONE
hi Number ctermfg=62 ctermbg=NONE cterm=NONE guifg=#A8FF60 guibg=NONE gui=NONE
hi Operator ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi PreProc ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#d9d7cd guibg=NONE gui=NONE
hi SpecialKey ctermfg=231 ctermbg=235 cterm=NONE guifg=#1e1f21 guibg=#1e1f21 gui=NONE
hi Statement ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi StorageClass ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=italic
hi String ctermfg=229 ctermbg=NONE cterm=NONE guifg=#FFFFB6 guibg=NONE gui=NONE
hi Tag ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#d9d7cd guibg=NONE gui=bold
hi Todo ctermfg=33 ctermbg=NONE cterm=inverse,bold guifg=#96CBFE guibg=NONE gui=inverse,bold
hi Type ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi rubyFunction ctermfg=50 ctermbg=NONE cterm=NONE guifg=#C6C5FE guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=62 ctermbg=NONE cterm=NONE guifg=#A8FF60 guibg=NONE gui=NONE
hi rubyConstant ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=italic
hi rubyStringDelimiter ctermfg=229 ctermbg=NONE cterm=NONE guifg=#FFFFB6 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ff6347 guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=203 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInclude ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=229 ctermbg=NONE cterm=NONE guifg=#FFFFB6 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=229 ctermbg=NONE cterm=NONE guifg=#FFFFB6 guibg=NONE gui=NONE
hi rubyEscape ctermfg=62 ctermbg=NONE cterm=NONE guifg=#A8FF60 guibg=NONE gui=NONE
hi rubyControl ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi rubyException ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=italic
hi rubyRailsARAssociationMethod ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=33 ctermbg=NONE cterm=NONE guifg=#96CBFE guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=62 ctermbg=NONE cterm=NONE guifg=#A8FF60 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=205 ctermbg=NONE cterm=NONE guifg=#FF73FD guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=229 ctermbg=NONE cterm=NONE guifg=#FFFFB6 guibg=NONE gui=NONE
hi cssURL ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ff6347 guibg=NONE gui=italic
hi cssFunctionName ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=NONE
hi cssColor ctermfg=62 ctermbg=NONE cterm=NONE guifg=#A8FF60 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=50 ctermbg=NONE cterm=NONE guifg=#C6C5FE guibg=NONE gui=NONE
hi cssClassName ctermfg=50 ctermbg=NONE cterm=NONE guifg=#C6C5FE guibg=NONE gui=NONE
hi cssValueLength ctermfg=62 ctermbg=NONE cterm=NONE guifg=#A8FF60 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=87 ctermbg=NONE cterm=NONE guifg=#96cbfe guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi TabLineFill  guifg=#25282b guibg=#1e1f21 gui=none
hi TabLine      guifg=#8a8a8a guibg=#1e1f21 gui=none
hi TabLineSel   guifg=WHITE guibg=#1e1f21 gui=none

" Elixir {{{
hi elixirAtom ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=italic"
hi elixirModuleDeclaration ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=italic"
hi elixirAlias ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE gui=italic"
hi elixirInterpolationDelimiter ctermfg=50 ctermbg=NONE cterm=NONE guifg=#C6C5FE guibg=NONE gui=NONE
hi elixirStringDelimiter ctermfg=229 ctermbg=NONE cterm=NONE guifg=#FFFFB6 guibg=NONE gui=NONE
"}}}
"
" Vim Script {{{
hi vimGroupName ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE
hi vimGroup ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE
hi vimOption ctermfg=87 ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE
hi vimHiCtermFgBg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE
hi vimHiGuiFgBg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE
" }}}


"
"cygwin has an annoying behavior where it resets background to light
"regardless of what is set above, so we force it yet again
"
"add these to get cygwin shell working when used to ssh into a centos6 vm
"this requires your TERM=xterm-256color in the guest vm
"- one way to do this is to append to /home/vagrant/.bash_profile ala:
"      TERM=xterm-256color
"      export $TERM

execute "set background=dark"
"-------------------