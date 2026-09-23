#let section(title) = {
  counter("section").step()
  set text(
    font: (
      (name: "New Computer Modern", covers: "latin-in-cjk"),
      "Source Han Sans SC",
    ),
    weight: "bold",
  )
  show enum: set block(above: 2em, below: 2em, sticky: true)
  context enum(
    numbering: n => box(width: 2em, align(left, numbering("一、", n))),
    body-indent: 0.5em,
    start: counter("section").get().first(),
    title,
  )
}
