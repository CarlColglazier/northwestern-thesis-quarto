$if(citations)$
$if(csl)$ 
  
#set bibliography(style: "$csl$") 
$elseif(bibliographystyle)$ 

#set bibliography(style: "$bibliographystyle$")
$endif$
$if(bibliography)$

////#set text(top-edge: 0.7em, bottom-edge: -0.3em)

#set text(top-edge: "cap-height", bottom-edge: "baseline")

#set par(
  first-line-indent: 0em,
  //hanging-indent: 2.5in,
  justify: false,
  leading: 0.65em,
)

#bibliography(
    $for(bibliography)$"$bibliography$"$sep$,$endfor$,
    title: none,
)
$endif$
$endif$