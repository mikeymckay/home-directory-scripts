" Vim syntax file
" Language:	GSP - GNU Server Pages (v. 0.86)
" Created By:	Nathaniel Harward nharward@yahoo.com
" Last Changed: Dec. 12, 2000
" Filenames:    *.xml

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

syn case match

" Include Java syntax
  syn include @xmlJava syntax/java.vim

" Add <java> as an XML tag name along with its args
syn keyword xmlTag contained java

" Define the GSP java code blocks
syn region  gspJavaBlock start="<java\>" end="</java>" contains=@smlJava,xmlTag
syn region  gspInLine    matchgroup=xmlError start="`" end="`" contains=@smlJava

