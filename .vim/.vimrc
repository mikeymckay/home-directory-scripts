"" Dbl dbl quotes gives comments
""source ~/.vim/matchit.vim
""source ~/.vim/spell.vim
set ruler
set nohlsearch
set background=dark
set ts=2
""Following should make it so that I only insert spaces
set shiftwidth=2
set tabstop=2
set expandtab

set visualbell
set smartindent
set incsearch
""set mouse=a
set backspace=indent,eol,start
set hls
set lbr
""$netrw_rsync_cmd=rsync -e ssh -a
syntax on

autocmd BufRead mutt* set tw=72 writebackup nobackup


:map <MouseDown> <C-Y>
:map <S-MouseDown> <C-U>
:map <MouseUp> <C-E>
:map <S-MouseUp> <C-D>

map et2 :set shiftwidth=2 ts=2 expandtab
map et4 :set shiftwidth=4 ts=4 expandtab
map et8 :set shiftwidth=8 ts=8 expandtab
map tt8 :set shiftwidth=8 ts=8 noexpandtab

iab dslBug http://bugs.decisionsoft.com/show_bug.cgi?id

:map @xp :call XMLPATH()
:map @cp :call CDSPATH()

map  <F5>      :set hls!<bar>set hls?<CR>
imap <F5> <Esc>:set hls!<bar>set hls?<CR>i

au FileType java :map <F7> :%!prettyjava.pl<cr>
au FileType xml :map <F7> :%!xmlpp -s<cr>
au FileType html :map <F7> :%!xmlpp<cr>

function! XMLPATH()
:perl 
\ my ($row,$col) = $curwin->Cursor(); 
\ my @elements; 
\ my @lines = $curbuf->Get(1 .. $row); 
\ foreach my $line (@lines) { 
\   while ($line =~ m|<(/?)\s*([\w:-]+)\b[^>]*?(/?)>|g) {
\       if ($3 eq '/') {
\           next;       
\       } elsif ($1 eq '') { 
\           push @elements, $2 
\       } else {
\           pop @elements;
\       } 
\   } 
\ } 
\ VIM::Msg("XML Path: /".join('/',@elements)) 
endf

function! CDSPATH()
:perl 
\ my ($row,$col) = $curwin->Cursor(); 
\ my @elements; 
\ my @lines = $curbuf->Get(1 .. $row); 
\ foreach my $line (@lines) { 
\   while ($line =~ m|<(/?)\s*(?:\S*?\:)?element(?:\s+[^>]*name\w*=\w*(["'])([^'"]*)\2)?[^/>]*(/?)>|g) {
\       if ($4 eq '/') {
\           next;       
\       } elsif ($1 eq '') { 
\           push @elements, $3
\       } else {
\           pop @elements;
\       }
\   }                                                                           
\ } 
\ VIM::Msg("CDS path: /".join('/',@elements)) 
endf

function UpdateModifiable()
    if !exists("b:setmodifiable")
        let b:setmodifiable = 0
    endif
    if &readonly
        if &modifiable
            setlocal nomodifiable
            let b:setmodifiable = 1
        endif
    else
        if b:setmodifiable
            setlocal modifiable
        endif
    endif
endfunction

autocmd BufReadPost * call UpdateModifiable()

source ~/.vim/keypad.vim

" On ubuntu (running vim in gnome-terminal)
" " The reason for the double-command on <C-c> is due to some weirdness with
" the X clipboard system.
vmap <C-c> y:call system("xclip -i -selection clipboard",getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
