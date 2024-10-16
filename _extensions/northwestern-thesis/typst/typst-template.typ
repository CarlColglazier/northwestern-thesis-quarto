

#let nuthesis(
  title: "Paper Title",
  author: "Author Name",
  date: "Month Year",
  abstract: none,
  paper-size: "us-letter",
  bibliography-file: none,
  toc: false,
  lof: false,
  lot: false,
  toc_title: "Table of Contents",
  toc_depth: none,
  document-type: "dissertation",
  body
) = {
  // Set document metadata.
  set document(title: title, author: author)

  // Set the body font.
  set text(font: "Times New Roman", size: 12pt)

  // Configure the page.
  set page(
    paper: paper-size,
    // The margins depend on the paper size.
    margin: {
      (
        x: 1in,
        y: 1in,
      )
    }
  )

  // Display the paper's title.
  align(center, "NORTHWESTERN UNIVERSITY")
  v(48pt, weak: true)
  align(center, text(title))
  v(48pt, weak: true)
  align(center, "A " + document-type)
  v(48pt, weak: true)
  align(center, "SUBMITTED TO THE GRADUATE SCHOOL")
  align(center, "IN PARTIAL FULFILLMENT OF THE REQUIREMENTS")
  v(48pt, weak: true)
  align(center, "for the degree")
  v(48pt, weak: true)
  align(center, "DOCTOR OF PHILOSOPHY")
  v(48pt, weak: true)
  align(center, "Field of Computer Science")
  v(48pt, weak: true)
  align(center, "By")
  v(48pt, weak: true)
  align(center, text(author))
  v(48pt, weak: true)
  align(center, "Evanston, Illinois")
  v(48pt, weak: true)
  align(center, text(date))
  v(8.35mm, weak: true)

  // newpage
  pagebreak()

  // Now after the title page
  set page(
    header: align(right)[
      #counter(page).display("1")]
  )

  //set heading()
  show heading.where(level: 1): it => [
    #set align(center)
    #set text(12pt, weight: "bold")
    #set block(spacing: 1.3em)
    #block(it.body)
  ]

  show heading.where(level: 2): it => [
    #set align(center)
    #set text(12pt, weight: "regular")
    #set block(spacing: 1.3em)
    #block(it.body)
  ]
  // Third level headings
  show heading.where(
    level: 3
  ): it => [
    #set text(
      weight: "regular",
      style: "italic"
    )
    #set block(spacing: 1.3em)
    // Add new line
    //[#set block(spacing: 1.3em)
    //#par(first-line-indent: 0em, it.body + linebreak())
    //],
    #block(it.body)
  ]
  set quote(block: true)
  show quote: set par(leading: 0.65em)

  //set par(
  //  leading: 1.3em,
  //)
  // Rules
  // Paragraph
  // https://github.com/typst/typst/issues/106
  set text(top-edge: 0.7em, bottom-edge: -0.3em)
  set par(
    first-line-indent: 0.25in,
    leading: 1em,
    justify: false,
  )

  show figure: it => box(width:100%)[
  	#align(center)[#it.body]
  	//#v(if it.has("gap") {it.gap} else {0.65em})
    #set text(
      size: 10pt,
      top-edge: "cap-height",
      bottom-edge: "baseline"
    )
  	#set align(left)
  	#set par(
      first-line-indent: 0em,
      hanging-indent: 0em,
      justify: false,
      leading: 0.65em,
    )
    //
    // #it.supplement #it.counter.display(it.numbering): 
  	//#pad(x: 1cm)[#it.caption]
    #it.caption
    // TODO: one line margin
  ]

  if abstract != none [
    #set align(center)
    #block[
      #set text(weight: "bold")
      Abstract
    ]
    #set align(left)
    #abstract
    #pagebreak()
  ]

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: 2em
    );
    ]
    pagebreak()
  }


  if lof == true{
    //"List of Figures"
    show outline.entry: it=> if <no-prefix> != it.fields().at(
      default: {},
      "label",
    ) [#outline.entry(
      it.level,
      it.element,
      {
          it.element.caption.supplement
          " "
          numbering(
              it.element.numbering,
              ..it.element.counter.at(it.element.location()),
          )
          //figure.caption.separator
          //it.element.caption.body
      },
      it.fill,
      it.page
    )<no-prefix>] else {it}

  {
    show heading: none
    heading[List of Figures]
  }

  block(above: 0em, below: 2em)[
    /*#show outline.entry.where(
      level: 1
    ): it => {
      [
        #block(it.body)
      ]
    }*/
    #outline(
      title: "List of Figures",
      target: figure.where(kind: "quarto-float-fig"), //.where(kind: image),
      //depth: none,
    )
  ]
    pagebreak()
  }

  if lot == true {
    {
      show heading: none
      heading[List of Tables]
    }
    outline(
      title: [List of Tables],
      target: figure.where(kind: table),
    )
    pagebreak()
  }  
  //contents
  body
}
