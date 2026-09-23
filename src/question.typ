#let choice-placeholder() = box[#metadata("choice-placeholder")（#h(1.5em)）]

#let has-choice-placeholder(value) = {
  if std.type(value) == content {
    if value.func() == metadata {
      return value.value == "choice-placeholder"
    }
    return has-choice-placeholder(value.fields())
  }
  if std.type(value) == dictionary {
    return value.values().any(has-choice-placeholder)
  }
  if std.type(value) == array {
    return value.any(has-choice-placeholder)
  }
  false
}

#let render-choices(choices) = layout(size => {
  let items = choices
    .enumerate()
    .map(((index, choice)) => [
      #numbering("A.", index + 1)#h(0.5em)#choice
    ])
  let width = calc.max(..items.map(item => measure(item).width))
  let gutter = 1em.to-absolute()
  // 选择列数时预留 30% 行宽，避免选项过于拥挤。
  let available = size.width * 0.7
  let columns = if width * 4 + gutter * 3 <= available {
    4
  } else if width * 2 + gutter <= available {
    2
  } else {
    1
  }
  let cell-width = (size.width - gutter * (columns - 1)) / columns
  // 同行选项放入一个段落，利用行内盒子的基线对齐。
  grid(
    columns: 1,
    row-gutter: 0.8em,
    ..items
      .chunks(columns)
      .map(row => {
        for (index, item) in row.enumerate() {
          if index > 0 { h(gutter) }
          box(width: cell-width, item)
        }
      }),
  )
})

#let question(type, stem: [], choices: ()) = {
  assert(
    type in ("single-choice", "multiple-choice", "fill-in", "solution"),
    message: "Unsupported question type: " + type,
  )
  let is-choice = type in ("single-choice", "multiple-choice")
  if is-choice {
    assert(
      choices.len() > 0,
      message: "Choice questions require non-empty choices",
    )
    assert(
      has-choice-placeholder(stem),
      message: "Choice question stem must contain choice-placeholder()",
    )
  }
  counter("question").step()
  block(above: 1.5em, below: 1.5em, breakable: false, context enum(
    numbering: n => box(width: 2em, numbering("1.", n)),
    start: counter("question").get().first(),
    {
      stem
      if is-choice {
        render-choices(choices)
      }
    },
  ))
}
