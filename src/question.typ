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

// 单选题和多选题共用的校验。
#let validate-choices(stem, choices) = {
  assert(
    choices.len() > 0,
    message: "Choice questions require non-empty choices",
  )
  assert(
    has-choice-placeholder(stem),
    message: "Choice question stem must contain choice-placeholder()",
  )
}

// 单选题特有的答案校验。
#let validate-single-choice(choices, answers) = {
  assert(
    answers.len() == 1,
    message: "Single-choice questions require exactly one answer",
  )
  assert(
    range(choices.len()).any(index => (
      answers.first() == [#numbering("A", index + 1)]
    )),
    message: "Single-choice answer must match an existing choice label",
  )
}

#let question(type, stem: [], choices: (), answers: (), explanation: []) = {
  assert(
    std.type(answers) == array
      and answers.all(answer => std.type(answer) == content),
    message: "answers must be an array of content",
  )
  assert(
    type in ("single-choice", "multiple-choice", "fill-in", "solution"),
    message: "Unsupported question type: " + type,
  )
  assert(
    std.type(explanation) == content,
    message: "explanation must be content",
  )
  let is-choice = type in ("single-choice", "multiple-choice")
  if is-choice {
    validate-choices(stem, choices)
  }
  if type == "single-choice" {
    validate-single-choice(choices, answers)
  }
  counter("question").step()
  block(above: 1.5em, below: 1.5em, breakable: true, context enum(
    numbering: n => box(width: 2em, numbering("1.", n)),
    start: counter("question").get().first(),
    {
      // 题干和选项保持整体，答案与解析允许续页。
      block(above: 0pt, below: 0pt, breakable: false, {
        stem
        if is-choice {
          render-choices(choices)
        }
      })
      if sys.inputs.at("show-answers", default: "false") == "true" {
        if answers.len() > 0 {
          block(above: 1.5em)[
            #strong[【答案】]

            #answers.join([，])
          ]
        }
        if explanation != [] {
          block(above: 1.5em, breakable: true)[
            #block(above: 0pt, below: 1.2em, sticky: true)[#strong[【解析】]]
            #explanation
          ]
        }
      }
    },
  ))
}
