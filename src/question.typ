#import "score.typ": score as render-score

#let choice-placeholder() = box[#metadata("choice-placeholder")（#h(1.5em)）]

#let fill-placeholder() = box[
  #metadata("fill-placeholder")
  #underline(stroke: 0.5pt, offset: 0.15em)[#box(width: 5em, repeat(sym.space))]
]

#let count-placeholders(value, kind) = {
  if std.type(value) == content {
    if value.func() == metadata {
      return if value.value == kind { 1 } else { 0 }
    }
    return count-placeholders(value.fields(), kind)
  }
  if std.type(value) == dictionary {
    return count-placeholders(value.values(), kind)
  }
  if std.type(value) == array {
    return value.fold(0, (total, item) => (
      total + count-placeholders(item, kind)
    ))
  }
  0
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
    count-placeholders(stem, "choice-placeholder") == 1,
    message: "Choice question stem must contain exactly one choice-placeholder()",
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

// 多选题允许选择一个或多个选项，字母合写且不可重复。
#let validate-multiple-choice(choices, answers) = {
  assert(
    answers.len() == 1,
    message: "Multiple-choice questions require exactly one answer",
  )
  let answer = answers.first()
  assert(
    answer.func() == text,
    message: "Multiple-choice answer must be non-empty choice letters",
  )
  let letters = answer.text.clusters()
  let labels = range(choices.len()).map(index => numbering("A", index + 1))
  assert(
    letters.len() > 0 and letters.all(letter => letter in labels),
    message: "Multiple-choice answer must contain only existing choice labels",
  )
  assert(
    letters.dedup().len() == letters.len(),
    message: "Multiple-choice answer must not contain duplicate labels",
  )
}

#let subquestion(stem: [], parts: (), answers: (), explanation: []) = {
  assert(std.type(stem) == content, message: "Subquestion stem must be content")
  assert(
    std.type(answers) == array
      and answers.all(answer => std.type(answer) == content),
    message: "Subquestion answers must be an array of content",
  )
  assert(
    std.type(explanation) == content,
    message: "Subquestion explanation must be content",
  )
  assert(
    std.type(parts) == array,
    message: "Subquestion parts must be an array",
  )
  (stem: stem, parts: parts, answers: answers, explanation: explanation)
}

// 题干、答案和解析共用同一棵子问树，空内容不占位，编号不重排。
#let render-parts(parts, field, depth: 0, parent: none) = {
  assert(
    parts.len() == 0 or depth < 2,
    message: "Questions support at most three levels: question, subquestion, nested subquestion",
  )
  let rendered = []
  let first = true
  for (index, part) in parts.enumerate() {
    let body = if field == "answers" {
      part.answers.join([，], default: [])
    } else {
      part.at(field)
    }
    let label = numbering(if depth == 0 { "(1)" } else { "(i)" }, index + 1)
    let children = render-parts(
      part.parts,
      field,
      depth: depth + 1,
      parent: if body == [] { label } else { none },
    )
    rendered += if body == [] {
      children
    } else {
      // 空父项的编号并入首个子项，与公式共享同一行基线。
      let marker = {
        if parent != none {
          box(width: 2em, align(left, if first { parent } else { [] }))
        }
        box(width: 1.5em, align(left, label))
      }
      block(above: 0.6em, below: 0pt, breakable: true, enum(
        numbering: n => marker,
        full: false,
        indent: 0pt,
        body-indent: 0.5em,
        {
          block(above: 0pt, below: 0pt, sticky: children != [])[#body]
          children
        },
      ))
    }
    if body != [] or children != [] { first = false }
  }
  rendered
}

#let question(
  type,
  score: none,
  stem: [],
  choices: (),
  parts: (),
  answers: (),
  explanation: [],
) = {
  assert(std.type(parts) == array, message: "Question parts must be an array")
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
  if type == "multiple-choice" {
    validate-multiple-choice(choices, answers)
  }
  if type == "fill-in" {
    let blanks = count-placeholders(stem, "fill-placeholder")
    assert(
      blanks > 0,
      message: "Fill-in question stem must contain fill-placeholder()",
    )
    assert(
      answers.len() == blanks,
      message: "Fill-in answers must match the number of placeholders",
    )
  }
  counter("question").step()
  block(above: 1.5em, below: 1.5em, breakable: true, context enum(
    numbering: n => box(width: 1em, align(left, numbering("1.", n))),
    indent: 1em,
    start: counter("question").get().first(),
    {
      // 题干和选项保持整体，答案与解析允许续页。
      block(above: 0pt, below: 0pt, breakable: false, sticky: parts.len() > 0, {
        if score != none { render-score(score) }
        stem
        if is-choice {
          render-choices(choices)
        }
      })
      render-parts(parts, "stem")
      if sys.inputs.at("show-answers", default: "false") == "true" {
        let part-answers = render-parts(parts, "answers")
        if answers.len() > 0 or part-answers != [] {
          block(above: 1.5em)[
            #strong[【答案】]

            #answers.join([，])
            #part-answers
          ]
        }
        let part-explanations = render-parts(parts, "explanation")
        if explanation != [] or part-explanations != [] {
          block(above: 1.5em, breakable: true)[
            #block(above: 0pt, below: 1.2em, sticky: true)[#strong[【解析】]]
            #explanation
            #part-explanations
          ]
        }
      }
    },
  ))
}
