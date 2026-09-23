#let exam(
  body,
  subject: none,
  year: none,
  type: none,
  name: none,
  source: none,
  regions: none,
) = {
  for (field, value) in (
    subject: subject,
    type: type,
    name: name,
    source: source,
  ) {
    assert(
      std.type(value) == str and value.trim() != "",
      message: field + " must be a non-empty string",
    )
  }
  assert(
    std.type(year) == int and year > 0,
    message: "year must be a positive integer",
  )
  assert(
    std.type(regions) == array
      and regions.len() > 0
      and regions.all(
        region => std.type(region) == str and region.trim() != "",
      ),
    message: "regions must be a non-empty array of non-empty strings",
  )
  set page(
    paper: "a4",
    margin: 20mm,
    numbering: (current, total) => text(
      size: 9pt,
    )[第 #current 页（共 #total 页）],
    number-align: center + bottom,
  )
  set text(
    font: (
      (name: "New Computer Modern", covers: "latin-in-cjk"),
      "Source Han Serif SC",
    ),
    size: 10.5pt,
    lang: "zh",
  )
  set par(leading: 0.8em)
  // 行内公式使用 display 样式，但仍保留在当前行。
  show math.equation.where(block: false): math.display
  // 按行内公式实际高度排版，避免分式和大括号跨行重叠。
  show math.equation.where(block: false): set text(
    top-edge: "bounds",
    bottom-edge: "bounds",
  )
  set enum(body-indent: 0.5em)
  counter("section").update(0)
  counter("question").update(0)

  align(center)[
    #text(size: 16pt)[#year 年#type]

    #text(
      font: (
        (name: "New Computer Modern", covers: "latin-in-cjk"),
        "Source Han Sans SC",
      ),
      size: 22pt,
      weight: "bold",
      tracking: 1em,
      subject,
    )

    #text(size: 10.5pt)[#name]
  ]

  v(1em)
  body
}
