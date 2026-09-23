// 标题跟随首行正文，步骤内容允许跨页。
#let step(title, body) = block(above: 1em, below: 1em, breakable: true)[
  #block(above: 0pt, below: 0.8em, sticky: true)[#strong(title)]
  #body
]
