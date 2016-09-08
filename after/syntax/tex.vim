syntax match texStatement '\\\(hyphenation\|texttt\)' nextgroup=texNoSpell
syntax region texNoSpell     matchgroup=Delimiter start='{' end='}' contained
     \ contains=@NoSpell

syntax region texZone
      \ start="\\begin{\(alltt\|tikzpicture\)}"rs=s
      \ end="\\end{\(alltt\|tikzpicture\)}"re=e
      \ keepend
      \ transparent
      \ contains=texBeginEnd,@NoSpell
