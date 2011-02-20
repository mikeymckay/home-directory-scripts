" Vim syntax file=0A=
" Language:     Template Toolkit=0A=
" Maintainer:   Clifton Wood <cliff@slashdot.org>=0A=
" Last Change:  2002 May 30=0A=
" Location:     <none yet>=0A=
"=0A=
" Thanks to Andy Wardley and the entire TT crew. =0A=
"=0A=
" I felt it was high time to contribute something back to the Template =0A=
" community.=0A=
"=0A=
" HEAVILY borrows from the rules from perl.vim. =0A=
" 'Standing on the shoulders of Giants', never applied more than it does =
here. =0A=
" Credit for this syntax file should also go to the authors of perl.vim, =
and of=0A=
" course, those involved with VIM itself.=0A=
"=0A=
" Please download most recent version first before mailing=0A=
" any comments.=0A=
"=0A=
=0A=
if version < 600=0A=
  syntax clear=0A=
  elseif exists("B:current_syntax")=0A=
    finish=0A=
    endif=0A=
    =0A=
    " The following is copied from the mason syntax file=0A=
    " First pull in the HTML syntax.=0A=
    =0A=
    if !exists("main_syntax")=0A=
        let main_syntax =3D 'template'=0A=
        endif=0A=
        =0A=
        if version < 600=0A=
            so <sfile>:p:h/html.vim=0A=
            else=0A=
                runtime! syntax/html.vim=0A=
                  unlet b:current_syntax=0A=
                  endif=0A=
                  =0A=
                  "syn cluster htmlPreproc add=3D@TemplateDirectiveContents=0A=
                  =0A=
                  " Now pull in the Perl syntax.=0A=
                  =0A=
                  if version < 600=0A=
                      syn include @perlTop <sfile>:p:h/perl.vim=0A=
                      else=0A=
                          syn include @perlTop syntax/perl.vim=0A=
                          endif=0A=
                          =0A=
                          =0A=
                          " All Template syntax items will appear inside of the default TAG syntax =
                          item,=0A=
                          " defined below.=0A=
                          =0A=
                          " $variables and ${variables}.=0A=
                          syn match TemplateVar contained =
                          "\a\i*\(\.\(\(\$\=3D\i*\)|\${.*}\)\+\)\=3D\>" =
                          contains=3DTemplateVarOp,TemplateNum=0A=
                          =0A=
                          " Variables in double quoted strings. These may eventually need to be=0A=
                          " combined. Should handle the following:=0A=
                          "=0A=
                          "   $template_var=0A=
                          "   $template.var=0A=
                          "   $template.${var}=0A=
                          "   $template.${template.var}=0A=
                          "=0A=
                          " For simplicity's sake, if you start a template var with a capital =
                          letter,=0A=
                          " you risk colliding with a directive, therefore colorization will not =
                          attempt=0A=
                          " to color those entries. You're on your own there. If someone has the =
                          ability=0A=
                          " to remove this limitation, please do.=0A=
                          syn match TemplateStrV  contained "\${\a\i*\(\.\(\\I\i*|\d\+\)\)\=3D}" =
                          contains=3DTemplateVarOp,TemplateNum,TemplateSeparator=0A=
                          syn match TemplateStrV  contained =
                          "\$\a\i*\(\.\(\I\i*\|${\I\i*}\|\d\+\)\)\=3D" =
                          contains=3DTemplateVarOp,TemplateNum,TemplateSeparator=0A=
                          =0A=
                          " Standard Template variable methods=0A=
                          syn keyword TemplateVarOp contained defined replace reverse unshift=0A=
                          syn keyword TemplateVarOp contained exists import length repeat search =
                          values=0A=
                          syn keyword TemplateVarOp contained first match nsort shift split=0A=
                          syn keyword TemplateVarOp contained each grep hash item join keys last =
                          list=0A=
                          syn keyword TemplateVarOp contained push size sort max pop=0A=
                          =0A=
                          " Keywords=0A=
                          syn keyword TemplateAccess  contained GET CALL SET DEFAULT META=0A=
                          syn keyword TemplateProcess contained INSERT INCLUDE PROCESS WRAPPER =
                          BLOCK=0A=
                          syn keyword TemplateProcess contained CLEAR TAGS=0A=
                          syn keyword TemplateConditional contained IF UNLESS ELSIF ELSE SWITCH =
                          CASE=0A=
                          syn keyword TemplateLoop  contained FOR FOREACH WHILE NEXT LAST BREAK=0A=
                          syn keyword TemplateFilter  contained FILTER USE MACRO PERL RAWPERL=0A=
                          syn keyword TemplateException contained TRY THROW CATCH FINAL=0A=
                          syn keyword TemplateControl contained STOP RETURN END=0A=
                          =0A=
                          " Numbers and Floats. =0A=
                          " (These rules borrowed from perl.vim for my own nefarious purposes).=0A=
                          syn match TemplateNum contained =
                          "[-+]\=3D\(\<\d[[:digit:]_]*L\=3D\>\|-[xX]\x[[:digit:]_]*\>\)"=0A=
                          syn match TemplateFloat contained =
                          "[-+]\=3D\<\d[[:digit:]_]*[eE][\-+]\=3D\d+"=0A=
                          syn match TemplateFloat contained =
                          "[-+]\=3D\<\d[[:digit:]_]*\.[[:digit:]_]*\([eE][\-+]\=3D\d\+\)\=3D"=0A=
                          syn match TemplateFloat contained =
                          "[-+]\=3D\<\.[[:digit:]_]\+\([eE][\-+]\=3D\d\+\)\=3D"=0A=
                          =0A=
                          " Operators=0A=
                          =0A=
                          " The basics were kinda tricky to get down right. It would be nicer if =
                          the=0A=
                          " patterns could be more specific. I haven't been able to play with =
                          these =0A=
                          " enough to get them working to my taste, yet. "Good enough for gov't =
                          work", =0A=
                          " though. =3DD=0A=
                          syn match TemplateOperator  contained "\s*[*!+-/=3D|<>]\s*"=0A=
                          =0A=
                          syn match TemplateOperator  contained "=3D=3D"      " =3D=3D=0A=
                          syn match TemplateOperator  contained "<=3D"      " <=3D=0A=
                          syn match TemplateOperator  contained ">=3D"      " >=3D=0A=
                          syn match TemplateOperator  contained "||"      " ||=0A=
                          syn match TemplateOperator  contained "&&"      " &&=0A=
                          syn match TemplateOperator  contained "!=3D"      " !=3D=0A=
                          syn match TemplateOperator  contained "\.\."    =0A=
                          syn match TemplatePipeOperator  contained "|"     " | (filter)=0A=
                          syn keyword TemplateOperator  contained MOD DIV AND OR NOT=0A=
                          syn keyword TemplateOperator  contained mod div and or not=0A=
                          =0A=
                          " String interpolation.=0A=
                          syn match TemplateString  contained "\\\(\d\+\|[xX]\x\+\|c\u\|.\)"=0A=
                          syn match TemplateStringU contained "\\['\\]"=0A=
                          =0A=
                          " Command delimeter. (Sometimes it helps if you can visibly see the =
                          semi's)=0A=
                          syn match TemplateSeparator contained "\>\s*;"=0A=
                          =0A=
                          syn cluster TemplateDoubleQuote contains=3DTemplateString,TemplateStrV=0A=
                          syn cluster TemplateSingleQuote contains=3DTemplateStringU=0A=
                          =0A=
                          " Like perl, the '=3D>' operator forces a barewword to the left to be=0A=
                          " interpreted as a string. This should probably be under its own group =0A=
                          " so that it can be contained in an eventual '{}' assignment region.=0A=
                          syn match TemplateHashString  contained "\<\I\i*\s*=3D>"me=3De-2=0A=
                          =0A=
                          syn region TemplateSQString contained =
                          matchgroup=3DTemplateStringStartEnd start=3D"'" end=3D"'" =
                          contains=3D@TemplateSingleQuote=0A=
                          syn region TemplateDQString contained =
                          matchgroup=3DTemplateStringStartEnd start=3D+"+ end=3D+"+ =
                          contains=3D@TemplateDoubleQuote=0A=
                          =0A=
                          " {} Blocks.=0A=
                          syn region TemplateCurlyBlock contained matchgroup=3DTemplateOperator =
                          start=3D'{' end=3D'}' =
                          contains=3DTemplateHashString,TemplateSQString,TemplateDQString,TemplateN=
                          um,TemplateFloat,TemplateVar=0A=
                          =0A=
                          " Single line template comment.=0A=
                          syn match TemplateSingleComment contained "#.*"=0A=
                          =0A=
                          " ATTEMPT to highlight filternames.=0A=
                          syn match TemplateFilterName  contained "\l\i*"=0A=
                          syn region TemplateFilterExpr contained start=3D"|\s*\l\i*" =
                          end=3D";"he=3De-1 contains=3DTemplatePipeOperator,TemplateFilterName=0A=
                          syn region TemplateFilterExpr contained start=3D"|\s*\l\i*" =
                          end=3D"%]"he=3De-2 contains=3DTemplatePipeOperator,TemplateFilterName=0A=
                          syn region TemplateFilterExpr contained start=3D"|\s*\l\i*" =
                          end=3D"\(-|+\)%]"he=3De-3 =
                          contains=3DTemplatePipeOperator,TemplateFilterName=0A=
                          =0A=
                          " What is legal inside of a tag?=0A=
                          syn cluster TemplateDirectiveContents =
                          contains=3DTemplateAccess,TemplateProcess,TemplateConditional,TemplateLoo=
                          p,TemplateFilter,TemplateFilterExpr,TemplateException,TemplateControl,Tem=
                          plateOperator,TemplatePipeOperator,TemplateSingleComment,TemplateVar,Temp=
                          lateNum,TemplateFloat,TemplateDQString,TemplateSQString,TemplateSeparator=
                          ,TemplateCurlyBlock=0A=
                          =0A=
                          =0A=
                          "syn cluster TemplateDirectiveContents =
                          contains=3DTemplateAccess,TemplateProcess,TemplateConditional,TemplateLoo=
                          p,TemplateFilter,TemplateFilterExpr,TemplateException,TemplateControl,Tem=
                          plateOperator,TemplatePipeOperator,TemplateSingleComment,TemplateNum,Temp=
                          lateFloat,TemplateDQString,TemplateSQString,TemplateSeparator=0A=
                          =0A=
                          " '[%(-+)?' '(-+)?%]' -- This is the syntax group that matches any given=0A=
                          " directives and its contents should be highlighted accordingly.=0A=
                          "=0A=
                          " Bless you, "matchgroup" -- as it highlights the "start" and "end" =
                          patters=0A=
                          " appropriately. If it weren't for matchgroup, the POST/PRECHOMP chars =
                          would=0A=
                          " be highlighted as operators.=0A=
                          syn region TemplateDirective matchgroup=3DTemplateTags =
                          start=3D"\[%[-+]\=3D" end=3D"[-+]\=3D%\]" keepend =
                          contains=3D@TemplateDirectiveContents=0A=
                          =0A=
                          " Multiline template comments are handled by their own region.=0A=
                          " (No need for "matchgroup" here since this region doesn't contain=0A=
                          " TemplateOperator)=0A=
                          syn region TemplateComment start=3D"\[%#" end=3D"[-+]\=3D%\]" keepend=0A=
                          =0A=
                          " Now we assign highlight groups.=0A=
                          if version >=3D 508 || !exists("did_template_syn_inits")=0A=
                              if version < 508=0A=
                                    let did_template_syn_inits =3D 1=0A=
                                        command -nargs=3D+ HiLink hi link <args>=0A=
                                          else=0A=
                                                command -nargs=3D+ HiLink hi def link <args>=0A=
                                                  endif=0A=
                                                  =0A=
                                                    HiLink TemplateAccess   Include=0A=
                                                      HiLink TemplateProcess  PreProc=0A=
                                                        HiLink TemplateConditional  Conditional=0A=
                                                          HiLink TemplateLoop   Repeat=0A=
                                                            HiLink TemplateFilter   Statement=0A=
                                                              HiLink TemplateException  Special=0A=
                                                                HiLink TemplateControl  Repeat=0A=
                                                                =0A=
                                                                  HiLink TemplateVarOp    Type=0A=
                                                                    HiLink TemplateVar    Identifier=0A=
                                                                      =0A=
                                                                        HiLink TemplateNum    Number=0A=
                                                                          HiLink TemplateFloat    Float=0A=
                                                                          =0A=
                                                                            HiLink TemplateOperator Operator=0A=
                                                                              HiLink TemplatePipeOperator Operator=0A=
                                                                              =0A=
                                                                                HiLink TemplateFilterName Statement=0A=
                                                                                =0A=
                                                                                  HiLink TemplateHashString String=0A=
                                                                                    HiLink TemplateString   String=0A=
                                                                                      HiLink TemplateSQString Constant=0A=
                                                                                        HiLink TemplateDQString String=0A=
                                                                                          HiLink TemplateStringStartEnd String=0A=
                                                                                            HiLink TemplateStrV   Identifier=0A=
                                                                                            =0A=
                                                                                              HiLink TemplateDirective  Delimiter=0A=
                                                                                                HiLink TemplateTags   Delimiter=0A=
                                                                                                =0A=
                                                                                                  HiLink TemplateSeparator  SpecialChar=0A=
                                                                                                  =0A=
                                                                                                    HiLink TemplateComment  Comment=0A=
                                                                                                      HiLink TemplateSingleComment  Comment=0A=
                                                                                                      =0A=
                                                                                                        delcommand HiLink=0A=
                                                                                                        endif=0A=
                                                                                                        =0A=
                                                                                                        " Standard variable methods, don't get the preceeding dot-separator.=0A=
                                                                                                        =0A=
                                                                                                        " Identify the current syntax.=0A=
                                                                                                        let b:current_syntax =3D "template"=0A=
                                                                                                        =0A=
                                                                                                        " vim: ts=3D8=0A=
