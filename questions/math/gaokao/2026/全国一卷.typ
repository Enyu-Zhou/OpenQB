#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, fill-placeholder, question, section, step,
  subquestion,
)
// 所有顶点使用三维坐标；中点由端点计算，投影只影响展示。
#let prism-figure(auxiliary: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 13mm, {
    import cetz.draw: *
    let a = (2, 0, 0)
    let b = (0, 2, 0)
    let c = (0, 0, 0)
    let a1 = (2, 0, 2)
    let b1 = (0, 2, 2)
    let c1 = (0, 0, 2)
    let d = a.zip(b).map(((x, y)) => (x + y) / 2)
    let e = a.zip(c1).map(((x, y)) => (x + y) / 2)
    let h = (0, 1, 0)
    ortho(x: -65deg, y: 0deg, z: -135deg, sorted: false, {
      set-style(stroke: 0.65pt)
      line(a, c, b, stroke: (dash: "dashed"))
      line(c, c1, stroke: (dash: "dashed"))
      line(a, c1, stroke: (dash: "dashed"))
      line(a, b, b1, c1, a1, a)
      line(a1, b1)
      line(d, e, stroke: (dash: "dashed"))
      if auxiliary {
        for (point, label, anchor) in (
          ((2.7, 0, 0), $x$, "east"),
          ((0, 2.7, 0), $y$, "west"),
          ((0, 0, 2.6), $z$, "south"),
        ) {
          let start = point.map(value => if value == 0 { 0 } else { 2 })
          line(start, point, stroke: 0.4pt, mark: (end: ">"))
          content(point, label, anchor: anchor, padding: 0.1)
        }
        line(b, c1, stroke: (dash: "dashed"))
        line(d, h, stroke: (dash: "dashed"))
        line((0.15, 1, 0), (0.15, 1.15, 0), (0, 1.15, 0))
        content(h, $H$, anchor: "south-west", padding: 0.1)
      }
      for (point, label, anchor) in (
        (a, $A$, if auxiliary { "north" } else { "north-east" }),
        (b, $B$, if auxiliary { "north" } else { "north-west" }),
        (c, $C$, "south-west"),
        (a1, $A_1$, "south-east"),
        (b1, $B_1$, "south-west"),
        (c1, $C_1$, if auxiliary { "south-east" } else { "south" }),
        (d, $D$, "north"),
        (e, $E$, "east"),
      ) {
        content(point, label, anchor: anchor, padding: 0.1)
      }
    })
  })
}

// 函数图直接采样解析式，标出极大值与零点。
#let derivative-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let g(x) = 1 - (x + 1) * calc.exp(x)
    line((-4.5, 0), (1.1, 0), stroke: 0.4pt, mark: (end: ">"))
    line((0, -2.2), (0, 1.8), stroke: 0.4pt, mark: (end: ">"))
    line((-4.4, 1), (-2.8, 1), stroke: (dash: "dashed", thickness: 0.4pt))
    line((-2, 0), (-2, g(-2)), (0, g(-2)), stroke: (
      dash: "dashed",
      thickness: 0.4pt,
    ))
    line(
      ..range(0, 101).map(i => {
        let x = -4.4 + i * 0.05
        (x, g(x))
      }),
      stroke: 0.7pt,
    )
    for (point, label, anchor) in (
      ((1.1, 0), $x$, "north"),
      ((0, 1.8), $y$, "east"),
      ((0, 0), $O$, "north-east"),
      ((-2, 0), $-2$, "north"),
      ((0, g(-2)), $1 + e^(-2)$, "west"),
      ((-4.4, 1), $1$, "east"),
      ((-3.2, 1.55), $y = g(x)$, "south"),
    ) {
      content(point, label, anchor: anchor, padding: 0.1)
    }
  })
}

// 空间图使用真实三维坐标，右图单独展示垂直于 AB 的截面。
#let dihedral-figure() = {
  set text(size: 9pt)
  grid(
    columns: (auto, auto),
    column-gutter: 1.5em,
    align: center + horizon,
    [
      #cetz.canvas(length: 15mm, {
        import cetz.draw: *
        let a = (-0.9, 0, 0)
        let b = (3.9, 0, 0)
        let e = (0, 0, 0)
        let f = (3, 0, 0)
        let c = (0, 0, 2)
        let g = (0, -calc.sqrt(3) / 2, 0.5)
        let d = (3, -calc.sqrt(3) / 2, 0.5)
        ortho(x: -25deg, y: -15deg, z: 0deg, sorted: false, {
          set-style(stroke: 0.65pt)
          line(a, e)
          line(e, f, stroke: (dash: "dashed"))
          line(f, b)
          line(c, f, d, g, c)
          line(c, d)
          line(c, e, g, stroke: (dash: "dashed"))
          line(e, d, stroke: (dash: "dashed"))
          for (point, label, anchor) in (
            (a, $A$, "east"),
            (b, $B$, "west"),
            (c, $C$, "south"),
            (d, $D$, "north"),
            (e, $E$, "south-west"),
            (f, $F$, "south"),
            (g, $G$, "north"),
          ) {
            content(point, label, anchor: anchor, padding: 0.12)
          }
        })
      })
    ],
    [
      #cetz.canvas(length: 15mm, {
        import cetz.draw: *
        let e = (0, 0)
        let g = (1, 0)
        let c = (1, calc.sqrt(3))
        line(e, g, c, e, stroke: 0.65pt)
        line((0.86, 0), (0.86, 0.14), (1, 0.14), stroke: 0.5pt)
        line(
          ..range(0, 61, step: 3).map(t => (
            0.3 * calc.cos(t * 1deg),
            0.3 * calc.sin(t * 1deg),
          )),
          stroke: 0.5pt,
        )
        for (point, label, anchor) in (
          (e, $E$, "north-east"),
          (g, $G$, "north-west"),
          (c, $C$, "south"),
          ((0.5, 0), $1$, "north"),
          ((0.5, calc.sqrt(3) / 2), $2$, "east"),
          ((1, calc.sqrt(3) / 2), $sqrt(3)$, "west"),
          ((0.18, 0.4), $60 degree$, "west"),
        ) {
          content(point, label, anchor: anchor, padding: 0.1)
        }
      })
    ],
  )
}

// 圆与割线按同一比例绘制，垂足由投影公式计算。
#let circles-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 15mm, {
    import cetz.draw: *
    let direction = (0.5, calc.sqrt(3) / 2)
    set-style(stroke: 0.65pt)
    line((-2.4, 0), (2.5, 0), stroke: 0.35pt, mark: (end: ">"))
    line((0, -1.3), (0, 3.1), stroke: 0.35pt, mark: (end: ">"))
    for center in ((-1, 0), (1, 0), (0, calc.sqrt(3))) {
      circle(center, radius: 1)
      circle(center, radius: 0.025, fill: black)
      let projection = center.zip(direction).map(((a, b)) => a * b).sum()
      let foot = direction.map(v => v * projection)
      line(center, foot, stroke: (dash: "dashed", thickness: 0.45pt))
    }
    line(
      direction.map(v => -1.35 * v),
      direction.map(v => 2.75 * v),
      stroke: 0.45pt,
    )
    for (point, label, anchor) in (
      ((2.5, 0), $x$, "north"),
      ((0, 3.1), $y$, "east"),
      ((0, 0), $O$, "north-west"),
      ((-1, 0), $(-1, 0)$, "north"),
      ((1, 0), $(1, 0)$, "north"),
      ((0, calc.sqrt(3)), $(0, sqrt(3))$, "east"),
      ((-1.9, -0.65), $C_1$, "east"),
      ((1.9, -0.65), $C_2$, "west"),
      ((-0.9, 2.35), $C_3$, "east"),
      (direction.map(v => 2.75 * v), $l: y = sqrt(3)x$, "west"),
    ) {
      content(point, label, anchor: anchor, padding: 0.1)
    }
  })
}

// 由边长、平行与垂直条件计算坐标，两个坐标轴使用同一比例。
#let triangle-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 7mm, {
    import cetz.draw: *
    let a = (0, 0)
    let b = (3, 0)
    let c = (1, 2 * calc.sqrt(2))
    let d = (-3 * calc.sqrt(2), 0)
    let e = (-4 * calc.sqrt(2), 2)
    set-style(stroke: 0.65pt)
    line((-6.2, 0), (3.9, 0), stroke: 0.4pt, mark: (end: ">"))
    line((0, -0.6), (0, 3.5), stroke: 0.4pt, mark: (end: ">"))
    content((3.9, 0), $x$, anchor: "west", padding: 0.1)
    content((0, 3.5), $y$, anchor: "east", padding: 0.1)
    line(e, d, b, c, a, e)
    line(e, c, stroke: (dash: "dashed"))
    // 在 A 处标出 AE 与 AC 的直角。
    let u = c.map(x => x / 3 * 0.25)
    let v = e.map(x => x / 6 * 0.25)
    line(u, u.zip(v).map(((x, y)) => x + y), v)
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "south"),
      (d, $D$, "north"),
      (e, $E$, "south-east"),
    ) {
      content(point, label, anchor: anchor, padding: 0.12)
    }
  })
}

// 取第 (2)(i) 问求得的直线；交点由椭圆方程精确计算。
#let ellipse-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 12mm, {
    import cetz.draw: *
    let k = calc.sqrt(5) / 2
    let p = (0.5, 3 * calc.sqrt(5) / 4)
    let q = (-1.75, -3 * calc.sqrt(5) / 8)
    let r = p.map(x => -x)
    set-style(stroke: 0.65pt)
    circle((0, 0), radius: (2, calc.sqrt(3)))
    line((-2.5, 0), (2.5, 0), stroke: 0.4pt, mark: (end: ">"))
    line((0, -2.1), (0, 2.1), stroke: 0.4pt, mark: (end: ">"))
    line((-2, -k), (0.85, 1.85 * k))
    line(p, r, q)
    line(q, (0, 0), stroke: (dash: "dashed"))
    for (point, label, anchor) in (
      ((2.5, 0), $x$, "north"),
      ((0, 2.1), $y$, "east"),
      ((0, 0), $O$, "north-west"),
      ((-1, 0), $F$, "south-east"),
      (p, $P$, "south-east"),
      (q, $Q$, "north-east"),
      (r, $R$, "north-west"),
      ((0.85, 1.85 * k), $l$, "west"),
    ) {
      content(point, label, anchor: anchor, padding: 0.1)
    }
  })
}

#show: exam.with(
  subject: "数学",
  year: 2026,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2026/2026全国1(山东%2C广东%2C湖南%2C湖北%2C河北%2C江苏%2C福建%2C浙江%2C河南%2C江西%2C安徽).pdf",
  regions: (
    "山东",
    "广东",
    "湖南",
    "湖北",
    "河北",
    "江苏",
    "福建",
    "浙江",
    "河南",
    "江西",
    "安徽",
  ),
)

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]

#question(
  "single-choice",
  stem: [样本数据 $6, 8, 4, 5, 12$ 的中位数为#choice-placeholder()],
  choices: ([$5$], [$6$], [$8$], [$9$]),
  answers: ([B],),
  explanation: [
    将数据从小到大排列为 $4, 5, 6, 8, 12$，中间的数为 $6$，故选 B。
  ],
)

#question(
  "single-choice",
  stem: [已知平面向量 $bold(a), bold(b)$ 不共线，且 $2 bold(a) + y bold(b) = x bold(a) - 3 bold(b)$，则#choice-placeholder()],
  choices: (
    [$x = 2, y = -3$],
    [$x = -2, y = 3$],
    [$x = 2, y = 3$],
    [$x = -2, y = -3$],
  ),
  answers: ([A],),
  explanation: [
    移项得 $(2 - x) bold(a) + (y + 3) bold(b) = bold(0)$。#linebreak()
    $because bold(a), bold(b)$ 不共线，$therefore 2 - x = 0$，$y + 3 = 0$。#linebreak()
    即 $x = 2$，$y = -3$，故选 A。
  ],
)

#question(
  "single-choice",
  stem: [已知集合 $A = {sin (7 pi)/6, cos (5 pi)/3, tan (5 pi)/4}$，$B = {-sqrt(3)/2, -1/2, 1}$，则 $A inter B =$#choice-placeholder()],
  choices: (
    [${-sqrt(3)/2, -1/2}$],
    [${-sqrt(3)/2, 1}$],
    [${-1/2, 1}$],
    [${-sqrt(3)/2, -1/2, 1}$],
  ),
  answers: ([C],),
  explanation: [
    由 $sin (7 pi)/6 = -1/2$，$cos (5 pi)/3 = 1/2$，$tan (5 pi)/4 = 1$。#linebreak()
    得 $A = {-1/2, 1/2, 1}$，$therefore A inter B = {-1/2, 1}$，选 C。
  ],
)

#question(
  "single-choice",
  stem: [曲线 $y = 5x + 8 ln x$ 在点 $(1, 5)$ 处的切线方程为#choice-placeholder()],
  choices: ([$y = 3x + 2$], [$y = 5x$], [$y = 8x - 3$], [$y = 13x - 8$]),
  answers: ([D],),
  explanation: [
    求导得 $y' = 5 + 8/x$，在 $x = 1$ 处的切线斜率为 $13$。#linebreak()
    切线方程为 $y - 5 = 13(x - 1)$，即 $y = 13x - 8$，故选 D。
  ],
)

#question(
  "single-choice",
  stem: [已知抛物线 $C_1: y^2 = 2p_1 x (p_1 > 0)$ 和 $C_2: x^2 = 2p_2 y (p_2 > 0)$ 均经过点 $(4, 8)$，则 $C_1$ 的焦点与 $C_2$ 的焦点之间的距离为#choice-placeholder()],
  choices: ([$12$], [$4 sqrt(5)$], [$6$], [$sqrt(65)/2$]),
  answers: ([D],),
  explanation: [
    代入点 $(4, 8)$，得 $64 = 8p_1$，$16 = 16p_2$，$therefore p_1 = 8$，$p_2 = 1$。#linebreak()
    两焦点分别为 $(4, 0)$、$(0, 1/2)$。#linebreak()
    距离为 $sqrt(4^2 + (1/2)^2) = sqrt(65)/2$，故选 D。
  ],
)

#question(
  "single-choice",
  stem: [已知函数 $f(x) = (x + 2)/(e^x + a)$ 的最大值为 $1$，则 $a =$#choice-placeholder()],
  choices: ([$1/2$], [$1$], [$3/2$], [$2$]),
  answers: ([B],),
  explanation: [
    #step[由最大值求参数][
      由选项知 $a > 0$，故定义域为 $RR$。#linebreak()
      设最大值在 $x_0$ 处取得，则 $f(x_0) = 1$，$f'(x_0) = 0$。#linebreak()
      $f'(x) = (a - (x + 1)e^x)/(e^x + a)^2$。#linebreak()
      两个条件分别给出 $a = x_0 + 2 - e^(x_0)$，$a = (x_0 + 1)e^(x_0)$。#linebreak()
      联立得 $(x_0 + 2)(e^(x_0) - 1) = 0$。#linebreak()
      $because f(x_0) = 1$，故 $x_0 + 2 = e^(x_0) + a > 0$。#linebreak()
      $therefore x_0 = 0$，$a = 1$。
    ]
    #step[验证最大值][
      当 $a = 1$ 时，令 $g(x) = 1 - (x + 1)e^x$，则 $g'(x) = -(x + 2)e^x$。#linebreak()
      $g$ 在 $(-infinity, -2)$ 上递增，在 $(-2, +infinity)$ 上递减。#linebreak()
      又 $g(0) = 0$，且 $x$ 趋于负无穷时 $g(x)$ 趋于 $1$。#linebreak()
      $therefore x < 0$ 时 $g(x) > 0$；$x > 0$ 时 $g(x) < 0$。
      #align(center, derivative-figure())
      $f'(x)$ 与 $g(x)$ 同号，故 $f$ 先增后减，最大值为 $f(0) = 1$。#linebreak()
      故选 B。
    ]
  ],
)

#question(
  "single-choice",
  stem: [一百零八塔位于宁夏回族自治区青铜峡市，以其独特的建筑格局和深远的历史文化闻名遐迩。该塔群共有 $108$ 座塔，依山势自上而下排成 $12$ 行，将第 $i$ 行中塔的座数记为 $a_i (i = 1, 2, dots.c, 12)$，其中 $a_1 = 1$，$a_2 = a_3 = 3$，$a_4 = a_5 = 5$，且 $a_6, a_7, dots.c, a_12$ 是一个首项为 $7$，公差为 $2$ 的等差数列。将 $a_1, a_2, dots.c, a_12$ 分为 $6$ 组，每组 $2$ 个数，使得每组的 $2$ 个数之和可构成一个项数为 $6$ 且公差为 $d (d > 0)$ 的等差数列，则 $d =$#choice-placeholder()],
  choices: ([$2$], [$4$], [$6$], [$8$]),
  answers: ([B],),
  explanation: [
    设六组的和按递增顺序构成等差数列 $b_1, dots.c, b_6$。#linebreak()
    则 $6b_1 + 15d = 108$，即 $b_1 = 18 - 5d/2$。#linebreak()
    原数列各项均为正奇数，$therefore b_1$ 必须为正偶数。#linebreak()
    将选项中的 $d = 2, 4, 6, 8$ 代入，分别得到 $b_1 = 13, 8, 3, -2$，仅 $d = 4$ 符合。#linebreak()
    此时可分组为 $(a_1, a_6)$、$(a_2, a_7)$、$(a_4, a_8)$、$(a_3, a_11)$、$(a_5, a_12)$、$(a_9, a_10)$。#linebreak()
    各组之和依次为 $8, 12, 16, 20, 24, 28$，故选 B。
  ],
)

#question(
  "single-choice",
  stem: [设 $U = {(x_1, x_2, x_3) | x_i in {-2, -1, 1, 2}, i = 1, 2, 3}$ 为空间中的 $64$ 个点构成的集合，点 $P(1, 1, 1)$，记样本空间 $Omega = complement_U {P}$，从 $Omega$ 中随机取一个点，定义随机变量 $X$ 如下：对于 $Omega$ 中的每个点 $A(x_1, x_2, x_3)$，令 $X(A) = x_1 + x_2 + x_3$，则 $X$ 的数学期望为#choice-placeholder()],
  choices: ([$-1/21$], [$-1/63$], [$0$], [$1/7$]),
  answers: ([A],),
  explanation: [
    集合 $U$ 中的点关于原点成对出现，$therefore$ 所有点的三个坐标之和为 $0$。#linebreak()
    去掉点 $P(1, 1, 1)$ 后，剩余 $63$ 个点的坐标总和为 $-3$。#linebreak()
    各点被取到的概率相同，$therefore E(X) = -3/63 = -1/21$，故选 A。
  ],
)

#section[选择题：本题共 3 小题，每小题 6 分，共 18 分。在每小题给出的四个选项中，有多项符合题目要求。全部选对的得 6 分，部分选对的得部分分，有选错的得 0 分。]

#question(
  "multiple-choice",
  stem: [设 $z = 3 + 2i$，则#choice-placeholder()],
  choices: (
    [$overline(z) = 3 - 2i$],
    [$abs(z) = 5$],
    [$z^2 = 5 + 12i$],
    [$(z + 3)/(z - i) in RR$],
  ),
  answers: ([ACD],),
  explanation: [
    #step[选项 A][
      $overline(z) = 3 - 2i$，正确。
    ]
    #step[选项 B][
      $abs(z) = sqrt(3^2 + 2^2) = sqrt(13) != 5$，错误。
    ]
    #step[选项 C][
      $z^2 = (3 + 2i)^2 = 9 + 12i - 4 = 5 + 12i$，正确。
    ]
    #step[选项 D][
      $(z + 3)/(z - i) = (6 + 2i)/(3 + i) = 2 in RR$，正确。
    ]
    故选 ACD。
  ],
)

#question(
  "multiple-choice",
  stem: [在空间中，$A$、$B$ 为两个定点，动点 $C$ 到直线 $A B$ 的距离为 $2$，动点 $D$ 到直线 $A B$ 的距离为 $1$。若二面角 $C - A B - D$ 为 $60 degree$，则#choice-placeholder()],
  choices: (
    [$angle C A D >= 60 degree$],
    [$C D >= sqrt(3)$],
    [当 $A B perp C D$ 时，$C D perp$ 平面 $A B D$],
    [当 $A B perp$ 平面 $A C D$ 时，$A C perp A D$],
  ),
  answers: ([BC],),
  explanation: [
    过 $C$、$D$ 分别作 $C E perp A B$、$D F perp A B$，垂足为 $E$、$F$。#linebreak()
    将 $arrow(F D)$ 平移到 $E$，得 $arrow(E G) = arrow(F D)$，连接 $C G$、$D G$。#linebreak()
    则 $C E = 2$，$E G = D F = 1$，$angle C E G = 60 degree$。
    #align(center, dihedral-figure())
    #step[选项 A][
      取 $E = F$，使 $A E = 2$，且 $E$ 在射线 $A B$ 上。此时 $D = G$。#linebreak()
      由勾股定理，$A C = sqrt(8)$，$A D = sqrt(5)$。#linebreak()
      在 $triangle C E D$ 中，由余弦定理得 $C D^2 = 4 + 1 - 4 cos 60 degree = 3$。#linebreak()
      $therefore cos angle C A D = (8 + 5 - 3)/(2 sqrt(8) sqrt(5)) = 5/sqrt(40) > 1/2$。#linebreak()
      $therefore angle C A D < 60 degree$，A 错误。
    ]
    #step[选项 B][
      在 $triangle C E G$ 中，$C G^2 = 2^2 + 1^2 - 2 dot 2 dot 1 cos 60 degree = 3$。#linebreak()
      $because C E^2 = C G^2 + E G^2$，故 $C G perp E G$。#linebreak()
      又 $A B perp C E$、$A B perp E G$，故 $A B perp$ 平面 $C E G$。#linebreak()
      当 $E != F$ 时，四边形 $E F D G$ 为矩形，故 $D G parallel A B$，$D G perp C G$。#linebreak()
      于是 $C D^2 = C G^2 + D G^2 >= 3$；当 $E = F$ 时，$D = G$，$C D = sqrt(3)$。#linebreak()
      故 $C D >= sqrt(3)$，B 正确。
    ]
    #step[选项 C][
      若 $A B perp C D$，则过 $C$ 且垂直于 $A B$ 的平面同时包含 $D$、$E$、$G$。#linebreak()
      $D$ 在该平面上的垂足为 $G$，故 $D = G$。#linebreak()
      由选项 B 的推导，$C D perp E D$；又 $C D perp A B$。#linebreak()
      $E D$ 与 $A B$ 是平面 $A B D$ 内相交的两条直线。#linebreak()
      $therefore C D perp$ 平面 $A B D$，C 正确。
    ]
    #step[选项 D][
      若 $A B perp$ 平面 $A C D$，则 $C$、$D$ 到 $A B$ 的垂足均为 $A$。#linebreak()
      即 $E = F = A$，$G = D$，故 $angle C A D = angle C E G = 60 degree$。#linebreak()
      D 错误。
    ]
    故选 BC。
  ],
)

#question(
  "multiple-choice",
  stem: [已知圆 $C_1: (x + 1)^2 + y^2 = 1$，圆 $C_2: (x - 1)^2 + y^2 = 1$，圆 $C_3: x^2 + (y - sqrt(3))^2 = 1$，直线 $l: y = k x + b$ 与 $C_1, C_2, C_3$ 均有两个交点。记 $l$ 被 $C_1, C_2, C_3$ 截得的弦长分别为 $s_1, s_2, s_3$，则#choice-placeholder()],
  choices: (
    [$k$ 可以取任意实数],
    [满足 $s_1 = s_2 = s_3$ 的直线 $l$ 共有 $3$ 条],
    [满足 $s_1 + s_2 + s_3 = 3$ 的直线 $l$ 多于 $3$ 条],
    [当 $b = 0$ 时，$s_1 + s_2 + s_3$ 的最大值为 $(2 sqrt(21))/3$],
  ),
  answers: ([BCD],),
  explanation: [
    三个圆心到直线的距离分别为：#linebreak()
    $d_1 = abs(b - k)/sqrt(1 + k^2)$，$d_2 = abs(b + k)/sqrt(1 + k^2)$，#linebreak()
    $d_3 = abs(b - sqrt(3))/sqrt(1 + k^2)$。#linebreak()
    由题意，$d_i < 1$，且弦长 $s_i = 2 sqrt(1 - d_i^2)$（$i = 1, 2, 3$）。#linebreak()
    下图取 $l: y = sqrt(3)x$，示意 $b = 0$ 时的情形；此时三条弦长均为 $1$。
    #align(center, circles-figure())
    #step[选项 A][
      取 $k = sqrt(3)/3$。#linebreak()
      由 $d_1 < 1$、$d_2 < 1$，得 $-1/sqrt(3) < b < 1/sqrt(3)$。#linebreak()
      但 $d_3 < 1$ 要求 $b > 1/sqrt(3)$，矛盾。故 A 错误。
    ]
    #step[选项 B][
      弦长相等当且仅当 $d_1 = d_2 = d_3$。#linebreak()
      由 $abs(b - k) = abs(b + k)$，得 $b k = 0$。#linebreak()
      若 $k = 0$，则 $b = sqrt(3)/2$。#linebreak()
      若 $b = 0$，则 $k = plus.minus sqrt(3)$。#linebreak()
      三条直线均满足 $d_i = sqrt(3)/2 < 1$，故 B 正确。
    ]
    #step[求 $b = 0$ 时的弦长之和][
      令 $b = 0$，由 $d_3 < 1$ 得 $k^2 > 2$。#linebreak()
      此时 $s_1 + s_2 + s_3 = (4 + 2 sqrt(k^2 - 2))/sqrt(1 + k^2)$。#linebreak()
      设 $t = sqrt(k^2 - 2) > 0$，则弦长之和为 $S(t) = (4 + 2t)/sqrt(t^2 + 3)$。
    ]
    #step[选项 C][
      令 $S(t) = 3$，得 $5t^2 - 16t + 11 = 0$。#linebreak()
      解得 $t = 1$ 或 $11/5$。#linebreak()
      对应 $k = plus.minus sqrt(3)$ 或 $plus.minus sqrt(171)/5$。#linebreak()
      仅 $b = 0$ 时就有四条直线，故 C 正确。
    ]
    #step[选项 D][
      求导得 $S'(t) = (6 - 4t)/(t^2 + 3)^(3/2)$。#linebreak()
      当 $0 < t < 3/2$ 时，$S'(t) > 0$；当 $t > 3/2$ 时，$S'(t) < 0$。#linebreak()
      $therefore S$ 在 $t = 3/2$ 处取得最大值 $(2 sqrt(21))/3$，D 正确。
    ]
    故选 BCD。
  ],
)

#section[填空题：本题共 3 小题，每小题 5 分，共 15 分。]

#question(
  "fill-in",
  stem: [双曲线 $5x^2 - 6y^2 = 1$ 的离心率为#fill-placeholder()。],
  answers: ([$sqrt(66)/6$],),
  explanation: [
    双曲线的标准方程为 $x^2/(1/5) - y^2/(1/6) = 1$，$therefore a^2 = 1/5$，$b^2 = 1/6$。#linebreak()
    由 $c^2 = a^2 + b^2 = 11/30$，得离心率 $e = c/a = sqrt(11/6) = sqrt(66)/6$。
  ],
)

#question(
  "fill-in",
  stem: [已知 $f(x) = 2 sin(a x + theta)$（$a in ZZ$，$0 <= theta < 2 pi$）是偶函数，$f(x)$ 在区间 $(0, pi/2)$ 单调递增。则 $theta =$#fill-placeholder()，$f((2 pi)/3) =$#fill-placeholder()。],
  answers: ([$(3 pi)/2$], [$1$]),
  explanation: [
    由严格单调递增知 $a != 0$。#linebreak()
    正弦函数的递增区间长度为 $pi/abs(a)$，$therefore pi/abs(a) >= pi/2$。#linebreak()
    结合 $a in ZZ$，得 $abs(a) = 1$ 或 $2$。#linebreak()
    由偶函数性质，$f'(0) = 2a cos theta = 0$，$therefore theta = pi/2$ 或 $(3 pi)/2$。#linebreak()
    若 $theta = pi/2$，则 $f(x) = 2 cos(a x)$，在 $(0, pi/2)$ 上递减，不符合题意。#linebreak()
    $therefore theta = (3 pi)/2$，$f(x) = -2 cos(a x)$，在 $abs(a) = 1$、$2$ 时均满足题意。#linebreak()
    当 $abs(a) = 1$ 时，$f((2 pi)/3) = -2 cos((2 pi)/3) = 1$。#linebreak()
    当 $abs(a) = 2$ 时，$f((2 pi)/3) = -2 cos((4 pi)/3) = 1$。#linebreak()
    故两空依次为 $(3 pi)/2$，$1$。
  ],
)

#question(
  "fill-in",
  stem: [设实数 $q$ 满足：存在数列 ${a_n}$，使得对于任意 $n in NN^*$，均有 $a_1 + a_2 + dots.c + a_(3n) = n^2 + n$，且 ${a_n}$ 中有某连续 $9$ 项 $a_k, a_(k + 1), dots.c, a_(k + 8)$ 是公比为 $q$ 的等比数列，则 $q$ 的最大值为#fill-placeholder()。],
  answers: ([$root(3, 12)/2$],),
  explanation: [
    #step[按三项分组][
      每三项分为一组，记 $T_n = a_(3n - 2) + a_(3n - 1) + a_(3n)$。#linebreak()
      由相邻的前 $3n$ 项和相减，得#linebreak()
      $T_n = (n^2 + n) - ((n - 1)^2 + n - 1) = 2n$。#linebreak()
      设连续九项为 $x, x q, dots.c, x q^8$。#linebreak()
      记 $H = 1 + q + q^2 > 0$，以下按起点 $k$ 分类。
    ]
    #step[分类求公比的上界][
      若 $k = 3m + 1$（$m >= 0$），这九项恰含三个完整块。#linebreak()
      块和依次为 $x H$、$x q^3 H$、$x q^6 H$。#linebreak()
      $therefore$ 同时有 $q^3 = (m + 2)/(m + 1)$ 和 $q^3 = (m + 3)/(m + 2)$，矛盾。#linebreak()
      若 $k = 3m + 2$（$m >= 0$），两个完整块的和满足：#linebreak()
      $x q^2 H = 2(m + 2)$，$x q^5 H = 2(m + 3)$。#linebreak()
      两式右端均为正，可以相除，得 $q^3 = (m + 3)/(m + 2) <= 3/2$。#linebreak()
      若 $k = 3m$（$m >= 1$），同理有：#linebreak()
      $x q H = 2(m + 1)$，$x q^4 H = 2(m + 2)$。#linebreak()
      两式右端均为正，可以相除，得 $q^3 = (m + 2)/(m + 1) <= 3/2$。#linebreak()
      $therefore q <= root(3, 3/2) = root(3, 12)/2$。
    ]
    #step[构造取到上界的数列][
      取 $q = root(3, 3/2)$，$k = 2$，$x = 4/(q^2 H)$。#linebreak()
      令 $a_(2 + j) = x q^j$（$j = 0, 1, dots.c, 8$）。#linebreak()
      第二、第三块的和已分别为 $4$、$6$。#linebreak()
      取 $a_1 = 2 - x - x q$，使第一块的和为 $2$。#linebreak()
      取 $a_11 = 0$，$a_12 = 8 - a_10$，使第四块的和为 $8$。#linebreak()
      对 $n >= 5$，取 $a_(3n - 2) = 2n$，$a_(3n - 1) = a_(3n) = 0$。#linebreak()
      于是每块的和均为 $T_n = 2n$，前 $3n$ 项和为 $n^2 + n$。#linebreak()
      $therefore$ 上界可以取到，最大值为 $root(3, 12)/2$。
    ]
  ],
)

#section[解答题：本题共 5 小题，共 77 分。解答应写出文字说明、证明过程或演算步骤。]

#question(
  "solution",
  stem: [
    （13 分）如图，在直三棱柱 $A B C - A_1 B_1 C_1$ 中，$angle A C B = 90 degree$，$A C = B C$，$D$、$E$ 分别为 $A B$、$A C_1$ 的中点。
    #align(center, prism-figure())
  ],
  parts: (
    subquestion(
      stem: [证明：$D E parallel$ 平面 $B C C_1 B_1$；],
      answers: ([$D E parallel$ 平面 $B C C_1 B_1$，证明见解析。],),
      explanation: [
        连接 $B C_1$。在 $triangle A B C_1$ 中，$D$、$E$ 分别为 $A B$、$A C_1$ 的中点，$therefore D E parallel B C_1$。#linebreak()
        又 $B C_1 subset$ 平面 $B C C_1 B_1$，$D E subset.not$ 平面 $B C C_1 B_1$，$therefore D E parallel$ 平面 $B C C_1 B_1$。
      ],
    ),
    subquestion(
      stem: [设 $C C_1 = 2$，直线 $D E$ 与平面 $A C C_1 A_1$ 所成的角为 $45 degree$，求直线 $D E$ 到平面 $B C C_1 B_1$ 的距离。],
      answers: ([$1$],),
      explanation: [
        #step[建立空间直角坐标系][
          以 $C$ 为原点，$C A$、$C B$、$C C_1$ 的方向分别为三条坐标轴的正方向。#linebreak()
          设 $A C = B C = a > 0$。#linebreak()
          则 $A(a, 0, 0)$，$B(0, a, 0)$，$C_1(0, 0, 2)$。#linebreak()
          两中点为 $D(a/2, a/2, 0)$，$E(a/2, 0, 1)$。
          #align(center, prism-figure(auxiliary: true))
        ]
        #step[利用线面角求边长][
          平面 $A C C_1 A_1$ 的法向量为 $(0, 1, 0)$，而 $arrow(D E) = (0, -a/2, 1)$。#linebreak()
          由线面角为 $45 degree$，得 $sin 45 degree = (a/2)/sqrt(a^2/4 + 1)$，解得 $a = 2$。
        ]
        #step[计算线面距离][
          由第（1）问，只需求点 $D$ 到平面 $B C C_1 B_1$ 的距离。#linebreak()
          该平面的方程为 $x = 0$，故距离为 $a/2 = 1$。#linebreak()
          图中 $H$ 为 $D$ 到该平面的垂足，$D H$ 即所求距离。
        ]
      ],
    ),
  ),
)

#question(
  "solution",
  stem: [（15 分）已知在 $triangle A B C$ 中，$A B = 3$，$B C = 2 sqrt(3)$，$cos B = sqrt(3)/3$。],
  parts: (
    subquestion(
      stem: [求 $cos A$；],
      answers: ([$1/3$],),
      explanation: [
        由余弦定理，$A C^2 = A B^2 + B C^2 - 2 A B dot B C cos B = 9 + 12 - 12 = 9$，$therefore A C = 3$。#linebreak()
        再由余弦定理，$cos A = (A B^2 + A C^2 - B C^2)/(2 A B dot A C) = (9 + 9 - 12)/18 = 1/3$。
      ],
    ),
    subquestion(
      stem: [设 $D$、$E$ 两点满足：$D$ 在 $B A$ 的延长线上，$D E parallel B C$，$A E perp A C$。若 $D E = sqrt(6)$，求 $C E$。],
      answers: ([$3 sqrt(5)$],),
      explanation: [
        #step[建立平面直角坐标系][
          以 $A$ 为原点，$A B$ 的方向为 $x$ 轴正方向，取 $C$ 在 $x$ 轴上方，则 $A(0, 0)$，$B(3, 0)$。#linebreak()
          由 $A C = 3$、$cos A = 1/3$，得 $C(1, 2 sqrt(2))$。
          #align(center, triangle-figure())
        ]
        #step[确定点 $E$][
          设 $D(-t, 0)$（$t > 0$）。#linebreak()
          由 $D E parallel B C$，可设 $arrow(D E) = lambda (-2, 2 sqrt(2))$。#linebreak()
          于是 $E(-t - 2 lambda, 2 sqrt(2) lambda)$。#linebreak()
          由 $A E perp A C$，得 $(-t - 2 lambda) + 8 lambda = 0$，即 $lambda = t/6 > 0$。#linebreak()
          $therefore D E = 2 sqrt(3) lambda = sqrt(3)t/3 = sqrt(6)$，解得 $t = 3 sqrt(2)$，$lambda = sqrt(2)/2$。
        ]
        #step[计算 $C E$][
          代入得 $E(-4 sqrt(2), 2)$。#linebreak()
          由两点间距离公式，#linebreak()
          $C E = sqrt((1 + 4 sqrt(2))^2 + (2 sqrt(2) - 2)^2) = 3 sqrt(5)$。
        ]
      ],
    ),
  ),
)

#question(
  "solution",
  stem: [（15 分）设整数 $N >= 2$。某同学用一个球进行投篮练习，至多投篮 $N$ 次，当且仅当投中 $1$ 次时或 $N$ 次均未投中时，停止练习。设该同学每次投中的概率为 $p$（$0 < p < 1$），各次投中与否相互独立。记 $X$ 为停止练习时该同学的投篮次数。],
  parts: (
    subquestion(
      stem: [当 $N = 4$，$p = 1/3$ 时，求 $X$ 的分布列；],
      answers: (
        [
          #table(
            columns: 5,
            align: center,
            inset: 0.6em,
            stroke: 0.5pt,
            [$X$], [$1$], [$2$], [$3$], [$4$],
            [$P$], [$1/3$], [$2/9$], [$4/27$], [$8/27$],
          )
        ],
      ),
      explanation: [
        当 $j = 1, 2, 3$ 时，$X = j$ 表示前 $j - 1$ 次未投中、第 $j$ 次投中。#linebreak()
        $therefore P(X = j) = (2/3)^(j - 1) dot 1/3$。#linebreak()
        $X = 4$ 当且仅当前三次均未投中，第四次无论是否投中都停止。#linebreak()
        $therefore P(X = 4) = (2/3)^3 = 8/27$。#linebreak()
        四个概率之和为 $1/3 + 2/9 + 4/27 + 8/27 = 1$，分布列如答案所示。
      ],
    ),
    subquestion(
      stem: [设 $k$、$m$ 均为自然数。],
      parts: (
        subquestion(
          stem: [当 $k <= N - 1$ 时，求 $P(X > k)$；],
          answers: ([$(1 - p)^k$],),
          explanation: [
            当 $0 <= k <= N - 1$ 时，$X > k$ 当且仅当前 $k$ 次均未投中，$therefore P(X > k) = (1 - p)^k$。#linebreak()
            $k = 0$ 时事件必然发生，公式也成立。
          ],
        ),
        subquestion(
          stem: [当 $k + m <= N - 1$ 时，证明：$P(X > k + m | X > k) = P(X > m)$。],
          answers: ([$P(X > k + m | X > k) = P(X > m)$，证明见解析。],),
          explanation: [
            $because {X > k + m} subset.eq {X > k}$，且 $P(X > k) = (1 - p)^k > 0$，#linebreak()
            $therefore P(X > k + m | X > k) = P(X > k + m)/P(X > k) = (1 - p)^(k + m)/(1 - p)^k = (1 - p)^m$。#linebreak()
            又 $m <= N - 1$，由（i）知右端等于 $P(X > m)$，结论成立。
          ],
        ),
      ),
    ),
  ),
)

#question(
  "solution",
  stem: [（17 分）已知椭圆 $C: x^2/a^2 + y^2/b^2 = 1$（$a > b > 0$）的左焦点为 $F(-1, 0)$，离心率为 $1/2$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程；],
      answers: ([$x^2/4 + y^2/3 = 1$],),
      explanation: [
        由左焦点为 $F(-1, 0)$，得 $c = 1$。又 $c/a = 1/2$，$therefore a = 2$，$b^2 = a^2 - c^2 = 3$。#linebreak()
        $therefore$ 椭圆的方程为 $x^2/4 + y^2/3 = 1$。
      ],
    ),
    subquestion(
      stem: [设 $O$ 为坐标原点，过 $F$ 且斜率大于 $0$ 的动直线 $l$ 与 $C$ 交于 $P$、$Q$ 两点，其中 $Q$ 在第三象限，直线 $P O$ 与 $C$ 的另一个交点为 $R$。],
      parts: (
        subquestion(
          stem: [若 $triangle P Q R$ 的面积是 $triangle P F O$ 的面积的 $3$ 倍，求 $l$ 的方程；],
          answers: ([$y = sqrt(5)/2 (x + 1)$],),
          explanation: [
            #step[将面积关系转化为坐标关系][
              $F$ 在线段 $P Q$ 上，且 $O F = 1$，故#linebreak()
              $S_(triangle P Q O) = S_(triangle P F O) + S_(triangle Q F O) = (y_1 - y_2)/2$。#linebreak()
              又 $O$ 是 $P R$ 的中点，故 $S_(triangle P Q R) = 2 S_(triangle P Q O) = y_1 - y_2$。#linebreak()
              又 $S_(triangle P F O) = y_1/2$。#linebreak()
              由面积比为 $3$，得 $y_1 = -2y_2$。#linebreak()
              代入 $y_i = k(x_i + 1)$，得 $x_1 + 2x_2 = -3$。
            ]
            #step[利用韦达定理求斜率][
              令 $u = k^2$，结合根的和得 $x_1 = (9 - 4u)/(3 + 4u)$，$x_2 = -(9 + 4u)/(3 + 4u)$。#linebreak()
              再代入根的积，得#linebreak()
              $-(9 - 4u)(9 + 4u)/(3 + 4u)^2 = (4u - 12)/(3 + 4u)$。#linebreak()
              解得 $u = 5/4$。#linebreak()
              $because k > 0$，$therefore k = sqrt(5)/2$，即 $l: y = sqrt(5)/2 (x + 1)$。
            ]
          ],
        ),
        subquestion(
          stem: [求 $tan angle P Q R$ 的最小值。],
          answers: ([$4 sqrt(3)$],),
          explanation: [
            #step[求斜率并判断夹角][
              $Q R$ 的斜率为 $(-y_1 - y_2)/(-x_1 - x_2) = k(x_1 + x_2 + 2)/(x_1 + x_2) = -3/(4k)$。#linebreak()
              向量 $arrow(Q P)$、$arrow(Q R)$ 的横坐标均为正。#linebreak()
              又斜率之积为 $-3/4 > -1$，$therefore$ 两向量的数量积为正。#linebreak()
              $therefore angle P Q R$ 为锐角。
            ]
            #step[求正切值的最小值][
              由两直线夹角公式，#linebreak()
              $tan angle P Q R = (k + 3/(4k))/(1 - 3/4) = 4k + 3/k$。#linebreak()
              由基本不等式，$4k + 3/k >= 2 sqrt(4k dot 3/k) = 4 sqrt(3)$。#linebreak()
              当且仅当 $4k = 3/k$，即 $k = sqrt(3)/2$ 时取等号，故最小值为 $4 sqrt(3)$。
            ]
          ],
        ),
      ),
      explanation: [
        设 $l: y = k(x + 1)$（$k > 0$），$P(x_1, y_1)$、$Q(x_2, y_2)$，则 $y_1 > 0 > y_2$，$x_1 > x_2$。#linebreak()
        由椭圆的中心对称性，$R(-x_1, -y_1)$。联立直线与椭圆方程，得#linebreak()
        $(3 + 4k^2)x^2 + 8k^2 x + 4k^2 - 12 = 0$，#linebreak()
        $therefore x_1 + x_2 = -(8k^2)/(3 + 4k^2)$，$x_1 x_2 = (4k^2 - 12)/(3 + 4k^2)$。#linebreak()
        下图取（i）求得的直线，展示 $P$、$Q$、$R$、$F$、$O$ 的位置关系。
        #align(center, ellipse-figure())
      ],
    ),
  ),
)

#question(
  "solution",
  stem: [（17 分）已知函数 $f(x)$ 的定义域为 $RR$，且当 $x < 0$ 时，$f(x) = 2^x$。对任意 $x_0 in RR$，定义集合 $D(x_0) = {d in RR | f(x_0 + d) > f(x_0)}$。],
  parts: (
    subquestion(
      stem: [若当 $x >= 0$ 时，$f(x) = 1 - x$，求 $D(-1)$；],
      answers: ([$(0, 3/2)$],),
      explanation: [
        $f(-1) = 1/2$，需解 $f(-1 + d) > 1/2$。#linebreak()
        当 $d < 1$ 时，$2^(-1 + d) > 2^(-1)$，得 $0 < d < 1$。#linebreak()
        当 $d >= 1$ 时，$2 - d > 1/2$，得 $1 <= d < 3/2$。#linebreak()
        合并得 $D(-1) = (0, 3/2)$。
      ],
    ),
    subquestion(
      stem: [若 $f(x)$ 是奇函数，$f(x_1) <= f(x_2)$，且 $x_1 x_2 != 0$，证明：$D(x_2) subset.eq D(x_1)$；],
      answers: ([$D(x_2) subset.eq D(x_1)$，证明见解析。],),
      explanation: [
        #step[求集合 $D(x)$][
          由奇函数性质，$f(0) = 0$，且当 $x > 0$ 时，$f(x) = -2^(-x)$。#linebreak()
          $f$ 在负半轴和正半轴上分别递增。#linebreak()
          当 $x < 0$ 时，$f(x) > 0$。#linebreak()
          比它大的函数值只能出现在 $(x, 0)$，$therefore D(x) = (0, -x)$。#linebreak()
          当 $x > 0$ 时，$f(x) < 0$。#linebreak()
          此时 $f(x + d) > f(x)$ 等价于 $x + d <= 0$ 或 $x + d > x$。#linebreak()
          $therefore D(x) = (-infinity, -x] union (0, +infinity)$。
        ]
        #step[分类比较集合的包含关系][
          若 $x_1, x_2 < 0$，由 $f(x_1) <= f(x_2)$ 得 $x_1 <= x_2$。#linebreak()
          $therefore D(x_2) = (0, -x_2) subset.eq (0, -x_1) = D(x_1)$。#linebreak()
          若 $x_1, x_2 > 0$，同样有 $x_1 <= x_2$，$therefore (-infinity, -x_2] subset.eq (-infinity, -x_1]$。#linebreak()
          两边与 $(0, +infinity)$ 取并集，得 $D(x_2) subset.eq D(x_1)$。#linebreak()
          若两者异号，则只能是 $x_1 > 0 > x_2$。#linebreak()
          此时 $D(x_2) = (0, -x_2) subset.eq (0, +infinity) subset.eq D(x_1)$。#linebreak()
          综上，$D(x_2) subset.eq D(x_1)$。
        ]
      ],
    ),
    subquestion(
      stem: [设 $f(x)$ 满足：① 若 $f(x_1) <= f(x_2)$，则 $D(x_2) subset.eq D(x_1)$；② 当 $0 < x < 1$ 时，$f(x) < f(0)$。],
      parts: (
        subquestion(
          stem: [证明：$f(0) >= 1$；],
          answers: ([$f(0) >= 1$，证明见解析。],),
          explanation: [
            假设 $f(0) < 1$。#linebreak()
            当 $t$ 从左侧趋近 $0$ 时，$2^t$ 趋近 $1$。#linebreak()
            $therefore$ 可取 $t in (-1, 0)$，使 $f(t) = 2^t > f(0)$。#linebreak()
            由条件①，$D(t) subset.eq D(0)$。#linebreak()
            令 $d = -t/2 in (0, 1/2)$，则 $t + d = t/2 < 0$。#linebreak()
            于是 $f(t + d) = 2^(t/2) > 2^t = f(t)$。#linebreak()
            $therefore d in D(t) subset.eq D(0)$，从而 $f(d) > f(0)$。#linebreak()
            但由条件②，$f(d) < f(0)$，矛盾。$therefore f(0) >= 1$。
          ],
        ),
        subquestion(
          stem: [证明：$f(x)$ 在区间 $(0, +infinity)$ 单调递增。],
          answers: ([$f(x)$ 在 $(0, +infinity)$ 单调递增，证明见解析。],),
          explanation: [
            只需证明：任取 $x > 0$、$h > 0$，都有 $h in D(x)$。#linebreak()
            先证正半轴上 $f(x) <= 0$，再利用条件①比较 $D(x)$ 与负半轴对应的集合。
            #step[证明区间内的函数值非正][
              假设存在 $x in (0, 1)$，使 $f(x) > 0$。#linebreak()
              取 $t < 0$，使 $0 < f(t) = 2^t < f(x)$。#linebreak()
              由条件①，$D(x) subset.eq D(t)$。#linebreak()
              由条件②，$f(0) > f(x)$，$therefore -x in D(x)$，从而 $-x in D(t)$。#linebreak()
              但 $t - x < t < 0$，$therefore f(t - x) < f(t)$，即 $-x in.not D(t)$，矛盾。#linebreak()
              $therefore 0 < x < 1$ 时，$f(x) <= 0$。
            ]
            #step[推广到所有正数][
              假设存在 $s >= 1$，使 $f(s) > 0$。#linebreak()
              取 $u in (0, 1)$，再取 $b < 0$，使 $f(b) = 2^b < f(s)$。#linebreak()
              令 $a = b - (s - u) < b < 0$，$d = s - b$。#linebreak()
              此时 $b + d = s$，$a + d = u$。#linebreak()
              $because f(b + d) = f(s) > f(b)$，$therefore d in D(b)$。#linebreak()
              又 $f(a) < f(b)$，由条件①得 $D(b) subset.eq D(a)$。#linebreak()
              $therefore d in D(a)$，即 $f(u) = f(a + d) > f(a) = 2^a > 0$。#linebreak()
              这与上一步的 $f(u) <= 0$ 矛盾。#linebreak()
              $therefore$ 所有 $x > 0$ 均有 $f(x) <= 0$。
            ]
            #step[证明单调递增][
              任取 $x > 0$、$h > 0$，再取 $t < -h$。#linebreak()
              $because f(x) <= 0 < f(t)$，由条件①得 $D(t) subset.eq D(x)$。#linebreak()
              $because t < t + h < 0$，$therefore f(t + h) > f(t)$。#linebreak()
              $therefore h in D(t) subset.eq D(x)$，即 $f(x + h) > f(x)$。#linebreak()
              $therefore f(x)$ 在 $(0, +infinity)$ 上单调递增。
            ]
          ],
        ),
      ),
    ),
  ),
)
