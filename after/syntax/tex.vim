syntax match texStatement '\\hyphenation' nextgroup=texNoSpell
syntax region texNoSpell     matchgroup=Delimiter start='{' end='}' contained
     \ contains=@NoSpell

syntax region texTtStyle	matchgroup=texTypeStyle
     \ start="\\texttt\s*{" matchgroup=texTypeStyle 
     \ end="}"
