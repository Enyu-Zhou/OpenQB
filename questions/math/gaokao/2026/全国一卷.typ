#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, fill-placeholder, question, section, step,
)
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
