/*#let quote(body) = [
    #set text( size: 3.92em )
    #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]*/

#let nuthesis(
  title: "Paper Title",
  author: "Author Name",
  abstract: none,
  paper-size: "us-letter",
  bibliography-file: none,
  toc: false,
  lof: false,
  lot: true,
  toc_title: none,
  toc_depth: none,
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
  align(center, "A DISSERTATION")
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
  align(center, "Month Year")
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

  set quote(block: true)
  show quote: set par(leading: 0.65em)

  set par(
    leading: 1.3em,
  )

  if abstract != none [
    = Abstract
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
      depth: toc_depth
    );
    ]
    pagebreak()
  }

  outline(title: "Figures", target: figure.where(kind: image))


  if lof {
    //"List of Figures"
    outline(
      title: [List of Figures],
      target: figure.where(kind: image),
      depth: none,
    )
    pagebreak()
  }

  if lot {
    outline(
      title: [List of Tables],
      target: figure.where(kind: table),
    )
    pagebreak()
  }
  //contents
  body
}
