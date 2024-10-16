#show: nuthesis.with(
$if(title)$         title: "$title$",                  $endif$
$if(abstract)$      abstract: [$abstract$],            $endif$
$if(author)$        author: "$author$",                $endif$
$if(date)$          date: "$date$",                    $endif$
$if(toc)$           toc: $toc$,                        $endif$
$if(lof)$           lof: $lof$,                        $endif$
$if(lot)$           lot: $lot$,                        $endif$
$if(toc-title)$     toc_title: [$toc-title$],          $endif$
$if(document-type)$ document-type: "$document-type$",  $endif$
$if(field)$         field: "$field$",                  $endif$
$if(mainfont)$      mainfont: "$mainfont$"             $endif$
)