#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, space-axes, step, subquestion,
)

#show: exam.with(
  subject: "数学",
  year: 2026,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2026/2026天津.pdf",
  regions: ("天津",),
)

#let migration-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(axes: (
      stroke: figure-style.thickness,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      padding: 0,
      overshoot: 0.15,
      shared-zero: $O$,
      x: (label: (anchor: "north-east", offset: 0.1)),
      y: (label: (anchor: "south", offset: 0.1)),
    ))
    plot.plot(
      size: (4, 3),
      axis-style: "school-book",
      x-min: 0,
      x-max: 4,
      y-min: 0,
      y-max: 3,
      x-label: [空气质量指数 $x$],
      y-label: [候鸟迁徙数量 $y$],
      x-tick-step: none,
      y-tick-step: none,
      {
        plot.annotate(resize: false, {
          for p in (
            (0.3, 2.7),
            (0.6, 2.5),
            (0.8, 2.2),
            (1.1, 2.3),
            (1.4, 1.9),
            (1.6, 1.8),
            (1.9, 1.6),
            (2.1, 1.4),
            (2.3, 1.2),
            (2.6, 1.1),
            (2.8, 0.8),
            (3.1, 0.6),
            (3.4, 0.4),
          ) { circle(p, radius: 0.028, fill: black, stroke: none) }
        })
      },
    )
  })
}

#let function-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 12mm, {
    import cetz.draw: *
    set-style(axes: (
      stroke: figure-style.thickness,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      padding: 0,
      overshoot: 0.15,
      shared-zero: $O$,
    ))
    plot.plot(
      size: (3.2, 3.2),
      axis-style: "school-book",
      x-min: -1.6,
      x-max: 1.6,
      y-min: -1.6,
      y-max: 1.6,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (-1, 1),
      y-ticks: (1,),
      {
        plot.add(
          x => -x + calc.sin(calc.pi * x),
          domain: (-1.14, 1.14),
          style: (stroke: figure-style.thickness),
        )
      },
    )
  })
}

#let cuboid-figure(auxiliary: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 11mm, {
    import cetz.draw: *
    let a = (0, 0, 0)
    let b = (2, 0, 0)
    let c = (2, 4, 0)
    let d = (0, 4, 0)
    let a1 = (0, 0, 3)
    let b1 = (2, 0, 3)
    let c1 = (2, 4, 3)
    let d1 = (0, 4, 3)
    let e = (0, 3, 3)
    let f = (2, 4, 2)
    oblique-project((1, 0), (0.16, 0.28), (0, 1), {
      set-style(stroke: (thickness: figure-style.thickness, join: "round"))
      line(a, b, c, c1, d1, a1, a)
      line(a1, b1, c1)
      line(b1, b)
      line(a, d, c, stroke: (dash: figure-style.dash))
      line(d, d1, stroke: (dash: figure-style.dash))
      line(b, d, stroke: (dash: figure-style.dash))
      line(a, e, c, stroke: (dash: figure-style.dash))
      line(a, f, e, stroke: (dash: figure-style.dash))
      if auxiliary {
        space-axes(
          (2, 4, 3),
          (2.8, 6, 4.5),
          label-anchors: ("north", "south-west", "south"),
        )
      }
      for (p, label, anchor) in (
        (a, $A$, "north-east"),
        (b, $B$, "north"),
        (c, $C$, "west"),
        (d, $D$, "north-east"),
        (a1, $A_1$, "east"),
        (b1, $B_1$, "north-east"),
        (c1, $C_1$, "south-west"),
        (d1, $D_1$, "south"),
        (e, $E$, "east"),
        (f, $F$, "west"),
      ) { content(p, label, anchor: anchor, padding: 0.12) }
    })
  })
}

参考公式：#linebreak()
如果事件 $A, B$ 互斥，那么 $P(A union B) = P(A) + P(B)$。#linebreak()
如果事件 $A, B$ 相互独立，那么 $P(A B) = P(A) P(B)$。#linebreak()
球的体积公式 $V = 4/3 pi R^3$，其中 $R$ 表示球的半径。#linebreak()
圆锥的体积公式 $V = 1/3 S h$，其中 $S$ 表示圆锥的底面积，$h$ 表示圆锥的高。

#section[选择题：本大题共 9 小题，每小题 5 分，共 45 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]

#question(
  "single-choice",
  stem: [已知全集 $U = {-2, -1, 0, 1, 2, 3}$，集合 $A = {-1, 0, 1, 3}$，集合 $B = {-2, 0, 1}$，则 $(complement_U A) union B =$#choice-placeholder()],
  choices: ([${-2}$], [${-2, 2}$], [${0, 1, 2}$], [${-2, 0, 1, 2}$]),
  answers: ([D],),
  explanation: [由 $complement_U A = {-2, 2}$，得 $(complement_U A) union B = {-2, 0, 1, 2}$，故选 D。],
)
#question(
  "single-choice",
  stem: [设 $x in RR$，则“$x > 0$”是“$x^2 + 3x > 0$”的#choice-placeholder()],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [$x^2 + 3x > 0$ 等价于 $x < -3$ 或 $x > 0$。#linebreak()$x > 0$ 能推出该不等式，但取 $x = -4$ 时不等式成立而 $x > 0$ 不成立，故选 A。],
)
#question(
  "single-choice",
  stem: [为研究候鸟迁徙数量与空气质量指数的关系，在不同空气质量指数（$x$）下统计候鸟迁徙数量（$y$），所得数据如图所示，其中 $y$ 与 $x$ 的样本相关系数 $r = -0.91$，根据最小二乘法算得 $hat(y) = -1.17x + 1370.7$，下列说法正确的是#choice-placeholder()
    #figure(migration-figure())
  ],
  choices: (
    [$y$ 与 $x$ 负相关],
    [当 $x = 10$ 时，$y$ 一定为 $1359$],
    [当 $x = 10$ 时，$y$ 一定小于 $1359$],
    [两变量无线性关系],
  ),
  answers: ([A],),
  explanation: [由 $r = -0.91 < 0$，知 $y$ 与 $x$ 负相关，故 A 正确、D 错误。#linebreak()当 $x = 10$ 时，$hat(y) = 1359$ 只是预测值，不能确定实际值等于或小于 $1359$，故 B、C 错误。],
)
#question(
  "single-choice",
  stem: [函数 $f(x)$ 的部分图象如图所示，则 $f(x)$ 的解析式可能为#choice-placeholder()
    #figure(function-figure())
  ],
  choices: (
    [$f(x) = x + sin pi x$],
    [$f(x) = x - sin pi x$],
    [$f(x) = -x + sin pi x$],
    [$f(x) = x dot sin pi x$],
  ),
  answers: ([C],),
  explanation: [图中 $f(1) < 0$，而 A、B 在 $x = 1$ 处的值均为 $1$，D 的值为 $0$，可排除。#linebreak()C 为奇函数，$f(1) = -1$，且 $f'(0) = pi - 1 > 0$，与图象相符，故选 C。],
)
#question(
  "single-choice",
  stem: [正方体 $A B C D - A_1 B_1 C_1 D_1$ 中，下列结论错误的是#choice-placeholder()],
  choices: (
    [$A C parallel A_1 C_1$],
    [$C C_1 perp$ 平面 $A B C$],
    [平面 $A C D_1 parallel$ 平面 $A_1 C_1 B$],
    [平面 $A D D_1 perp$ 平面 $A C D_1$],
  ),
  answers: ([D],),
  explanation: [
    #step[建立坐标系][以 $A$ 为原点，$A B, A D, A A_1$ 的方向为三条坐标轴的正方向，设棱长为 $1$。则 $B(1, 0, 0)$、$C(1, 1, 0)$、$A_1(0, 0, 1)$、$C_1(1, 1, 1)$、$D_1(0, 1, 1)$。]
    #step[判断各结论][由 $arrow(A C) = arrow(A_1 C_1) = (1, 1, 0)$，知 A 正确；正方体的侧棱垂直于底面，B 正确。#linebreak()平面 $A C D_1$、$A_1 C_1 B$ 分别为 $x - y + z = 0$、$x - y + z = 1$，故 C 正确。#linebreak()平面 $A D D_1$ 为 $x = 0$，其法向量 $(1, 0, 0)$ 与 $(1, -1, 1)$ 的数量积为 $1 != 0$，两平面不垂直，故选 D。]
  ],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x) = abs(ln x)$，若 $a = f(2^0.3)$，$b = f(3^0.3)$，$c = f(3^(-0.5))$，则 $a, b, c$ 的大小关系为#choice-placeholder()],
  choices: ([$a < b < c$], [$b < a < c$], [$c < b < a$], [$c < a < b$]),
  answers: ([A],),
  explanation: [$a = 0.3 ln 2$，$b = 0.3 ln 3$，$c = 0.5 ln 3$。#linebreak()∵ $0 < ln 2 < ln 3$，∴ $a < b < c$，故选 A。],
)
#question(
  "single-choice",
  stem: [$(x + 1/x)(x + 4/x)$ 的最小值为#choice-placeholder()],
  choices: ([$10$], [$9$], [$8$], [$6$]),
  answers: ([B],),
  explanation: [定义域中 $x != 0$，故 $(x + 1/x)(x + 4/x) = x^2 + 4/x^2 + 5 >= 2 sqrt(x^2 dot 4/x^2) + 5 = 9$。#linebreak()当且仅当 $x^2 = 4/x^2$，即 $x = plus.minus sqrt(2)$ 时等号成立，故选 B。],
)
#question(
  "single-choice",
  stem: [已知数列 $\{a_n\}$ 的前 $n$ 项和为 $S_n$，$S_(2n) - S_n = n$，$a_3 = 6$，则 $a_7 + a_8 =$#choice-placeholder()],
  choices: ([$68$], [$56$], [$-3$], [$-4$]),
  answers: ([C],),
  explanation: [令 $n = 2$，得 $a_3 + a_4 = 2$，故 $a_4 = -4$。#linebreak()令 $n = 3$，得 $a_4 + a_5 + a_6 = 3$，故 $a_5 + a_6 = 7$。#linebreak()令 $n = 4$，得 $a_5 + a_6 + a_7 + a_8 = 4$，所以 $a_7 + a_8 = -3$，选 C。],
)
#question(
  "single-choice",
  stem: [已知双曲线 $x^2/a^2 - y^2/b^2 = 1$（$a > 0, b > 0$）的左焦点为 $F$，$A$ 是右顶点，$P$ 是双曲线上一点，满足 $abs(F A) = abs(F P)$，$angle F A P = 30 degree$，则双曲线的离心率为#choice-placeholder()],
  choices: ([$4$], [$8/3$], [$8/5$], [$4/3$]),
  answers: ([D],),
  explanation: [
    #step[由等腰三角形确定点位][设焦距为 $2c$，不妨取 $P$ 在 $x$ 轴上方。由 $F A = F P = a + c$、$angle F A P = 30 degree$，得 $A P = sqrt(3)(a + c)$，从而
      $ P(-(a + 3c)/2, (sqrt(3)(a + c))/2). $
      因 $c > a$，点 $P$ 位于双曲线左支。设右焦点为 $F'$，则 $P F' = P F + 2a = 3a + c$。
    ]
    #step[应用余弦定理][在 $triangle P A F'$ 中，$A F' = c - a$、$angle P A F' = 150 degree$，故
      $ (3a + c)^2 = 3(a + c)^2 + (c - a)^2 + 3(a + c)(c - a). $
      整理得 $(4a - 3c)(a + c) = 0$，所以 $c/a = 4/3$，故选 D。
    ]
  ],
)

#section[填空题：本大题共 6 小题，每小题 5 分，共 30 分。试题中包含两个空的，答对 1 个的给 3 分，全部答对的给 5 分。]

#question(
  "fill-in",
  stem: [已知 $i$ 是虚数单位，化简 $(3 + i)^2 =$#fill-placeholder()。],
  answers: ([$8 + 6i$],),
  explanation: [$(3 + i)^2 = 9 + 6i + i^2 = 8 + 6i$。],
)
#question(
  "fill-in",
  stem: [$(x + 2y)^4$ 的展开式中 $x^3 y$ 的系数为#fill-placeholder()。],
  answers: ([$8$],),
  explanation: [所求项为 $binom(4, 1) x^3 (2y) = 8x^3 y$，故系数为 $8$。],
)
#question(
  "fill-in",
  stem: [在 $triangle A B C$ 中，$B C = 4$，$A C = 3$，$cos A = -1/4$，则 $sin B =$#fill-placeholder()。],
  answers: ([$(3 sqrt(15))/16$],),
  explanation: [∵ $0 < A < pi$，∴ $sin A = sqrt(1 - cos^2 A) = sqrt(15)/4$。#linebreak()由正弦定理，$sin B = (A C)/(B C) sin A = 3/4 dot sqrt(15)/4 = (3 sqrt(15))/16$。],
)
#question(
  "fill-in",
  stem: [箱子里有一个红球，两个黄球，三个白球。有放回地抽取三次，每次抽取一个，三次都没抽到黄球的概率是#fill-placeholder()；在三次都没抽到黄球的条件下，至少抽到一次红球的概率是#fill-placeholder()。],
  answers: ([$8/27$], [$37/64$]),
  explanation: [设 $H$ 为三次均未抽到黄球，$R$ 为至少一次抽到红球。#linebreak()由有放回抽取的独立性，$P(H) = (4/6)^3 = 8/27$。#linebreak()事件 $H$ 中未出现红球即三次均为白球，故
    $ P(R | H) = 1 - ((3/6)^3)/(8/27) = 1 - 27/64 = 37/64. $
  ],
)
#question(
  "fill-in",
  stem: [已知 $abs(bold(a)) = bold(a) dot bold(b) = 1$，$abs(bold(b)) > 1$，记 $bold(c) = lambda bold(a) + mu bold(b)$。当 $bold(a) + bold(b) - bold(c) = bold(0)$ 时，$lambda + mu =$#fill-placeholder()；当 $abs(bold(a) + bold(b) - bold(c)) = 1$ 时，$lambda + mu$ 的取值范围为#fill-placeholder()。],
  answers: ([$2$], [$[1, 3]$]),
  explanation: [
    #step[分解为正交分量][令 $bold(w) = bold(b) - bold(a)$，则 $bold(a) dot bold(w) = 0$，且 $abs(bold(w))^2 = abs(bold(b))^2 - 1 > 0$。#linebreak()因此
      $
        bold(a) + bold(b) - bold(c) = (2 - lambda - mu)bold(a) + (1 - mu)bold(w).
      $
      当此向量为零时，两正交分量均为零，故 $mu = 1$，$lambda + mu = 2$。
    ]
    #step[求第二空的完整范围][设 $s = lambda + mu$，模长条件给出
      $ (2 - s)^2 + (1 - mu)^2 abs(bold(w))^2 = 1. $
      ∴ $abs(2 - s) <= 1$，即 $1 <= s <= 3$。#linebreak()反之，对任意 $s in [1, 3]$，取 $mu = 1 + sqrt(1 - (2 - s)^2)/abs(bold(w))$、$lambda = s - mu$，上式成立，故范围为 $[1, 3]$。
    ]
  ],
)
#question(
  "fill-in",
  stem: [在平面内，$O$ 为坐标原点，抛物线 $y^2 = 2x$ 上有 $A, B, C, D$ 四个点，其纵坐标分别为 $y_A, y_B, y_C, y_D$。直线 $A B$、直线 $C D$ 交 $x$ 轴于点 $P$，直线 $A C$ 交 $x$ 轴于点 $M$，直线 $B D$ 交 $x$ 轴于点 $N$。以下说法正确的有#fill-placeholder()。#linebreak()
    ① 若 $P$ 与抛物线焦点重合，则 $y_A y_B = -2$；#linebreak()
    ② $y_A y_B = y_C y_D$；#linebreak()
    ③ $abs(O M) abs(O N) = 2 abs(O P)^2$；#linebreak()
    ④ $abs(y_A - y_C) abs(O P) = abs(y_B - y_D) abs(O M)$；#linebreak()
    ⑤ $S_(triangle A C P)/S_(triangle B D P) = (abs(O M)/abs(O N))^2$。
  ],
  answers: ([②④],),
  explanation: [
    #step[统一表示各弦与横轴的交点][记 $u = y_A$、$v = y_B$、$w = y_C$、$t = y_D$，四者两两不同。连接纵坐标为 $r, s$ 的两点，弦所在直线为 $2x = (r + s)y - r s$，故
      $ x_P = -u v/2 = -w t/2, quad x_M = -u w/2, quad x_N = -v t/2. $
      四点互异且两弦相交于横轴上的同一点，故 $u, v, w, t$ 均非零：若一个为零，则 $P = O$，另一条弦也必须以 $O$ 为端点，与四点互异矛盾。
    ]
    #step[判断①②③][若 $P$ 是焦点，则 $x_P = 1/2$，所以 $u v = -1$，①错误。#linebreak()由交点公式，$u v = w t$，②正确。#linebreak()又 $abs(O M) abs(O N) = abs(u v w t)/4 = abs(u v)^2/4 = abs(O P)^2$，故③错误。]
    #step[判断④][由 $u v = w t$，得 $(u - w)v = w(t - v)$。两边取绝对值，再乘 $abs(u)/2$，即得
      $ abs(u - w) abs(O P) = abs(v - t) abs(O M), $
      故④正确。
    ]
    #step[判断⑤][分别以横轴上的 $M P$、$N P$ 为底，用面积的和或差可得
      $ S_(triangle A C P) = 1/2 abs(x_M - x_P) abs(u - w), $
      $ S_(triangle B D P) = 1/2 abs(x_N - x_P) abs(v - t). $
      ∵ $v = w t/u$，∴ $abs(u - w)/abs(v - t) = abs(u/t)$。于是
      $
        S_(triangle A C P)/S_(triangle B D P) = abs((u(w - v))/(v(t - u))) abs(u/t) = abs(u/t)^2 = abs(O M)/abs(O N).
      $
      例如取 $(u, v, w, t) = (2, 3, 1, 6)$，四点符合条件，此时上式为 $1/9$，而⑤右端为 $1/81$，故⑤错误。
    ]
  ],
)

#section[解答题：本大题共 5 小题，共 75 分。解答应写出文字说明、证明过程或演算步骤。]

#question(
  "solution",
  score: 14,
  stem: [已知 $f(x) = sin(2x + pi/6)$。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的最小正周期；],
      answers: ([$pi$],),
      explanation: [由正弦函数的周期公式，$T = (2pi)/abs(2) = pi$。],
    ),
    subquestion(
      stem: [若 $x in [-pi/6, pi/12]$，求 $f(x)$ 的最大值和最小值；],
      answers: ([最大值为 $sqrt(3)/2$，最小值为 $-1/2$。],),
      explanation: [此时 $2x + pi/6 in [-pi/6, pi/3]$，正弦函数在该区间递增。#linebreak()所以最小值为 $f(-pi/6) = -1/2$，最大值为 $f(pi/12) = sqrt(3)/2$。],
    ),
    subquestion(
      stem: [若 $alpha in (0, pi/2)$，$sin alpha = sqrt(3)/3$，求 $f(alpha)$。],
      answers: ([$(2 sqrt(6) + 1)/6$],),
      explanation: [由 $alpha$ 为锐角，得 $cos alpha = sqrt(6)/3$，从而 $sin 2alpha = (2 sqrt(2))/3$，$cos 2alpha = 1/3$。#linebreak()所以
        $
          f(alpha) = sin 2alpha cos pi/6 + cos 2alpha sin pi/6 = (2 sqrt(6) + 1)/6.
        $
      ],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，在长方体 $A B C D - A_1 B_1 C_1 D_1$ 中，$A B = 2$，$A A_1 = 3$，$A D = 4$，$A_1 E = 3E D_1$，$2C_1 F = F C$。
    #figure(cuboid-figure())
  ],
  parts: (
    subquestion(
      stem: [求证：$B D perp$ 平面 $C E F$；],
      answers: ([$B D perp$ 平面 $C E F$，证明见解析。],),
      explanation: [以 $A$ 为原点，$A B, A D, A A_1$ 的方向为 $x, y, z$ 轴的正方向，建立空间直角坐标系。#linebreak()由题设得 $B(2, 0, 0)$、$D(0, 4, 0)$、$C(2, 4, 0)$、$E(0, 3, 3)$、$F(2, 4, 2)$。
        #figure(cuboid-figure(auxiliary: true))
        $arrow(B D) = (-2, 4, 0)$，$arrow(C E) = (-2, -1, 3)$，$arrow(C F) = (0, 0, 2)$。#linebreak()∵ $arrow(B D) dot arrow(C E) = 0$，$arrow(B D) dot arrow(C F) = 0$，∴ $B D perp C E$ 且 $B D perp C F$。#linebreak()又 $C E inter C F = C$，两线均在平面 $C E F$ 内，所以 $B D perp$ 平面 $C E F$。
      ],
    ),
    subquestion(
      stem: [求平面 $A E F$ 与平面 $C E F$ 的夹角的余弦值；],
      answers: ([$sqrt(15)/5$],),
      explanation: [由第（1）问，可取平面 $C E F$ 的法向量 $bold(n) = (-1, 2, 0)$。#linebreak()又 $arrow(A E) = (0, 3, 3)$，$arrow(A F) = (2, 4, 2)$，取 $bold(m) = (1, -1, 1)$，则 $bold(m) dot arrow(A E) = bold(m) dot arrow(A F) = 0$。#linebreak()故 $bold(m)$ 是平面 $A E F$ 的法向量，所求余弦为
        $
          abs(bold(m) dot bold(n))/(abs(bold(m)) abs(bold(n))) = 3/(sqrt(3) sqrt(5)) = sqrt(15)/5.
        $
      ],
    ),
    subquestion(
      stem: [求三棱锥 $A - C E F$ 的体积。],
      answers: ([$2$],),
      explanation: [平面 $C E F$ 的方程为 $-x + 2y - 6 = 0$，故 $A$ 到该平面的距离为 $6/sqrt(5)$。#linebreak()$C F = 2$，点 $E$ 到直线 $C F$ 的距离为 $sqrt((0 - 2)^2 + (3 - 4)^2) = sqrt(5)$，从而 $S_(triangle C E F) = sqrt(5)$。#linebreak()因此 $V_(A - C E F) = 1/3 dot sqrt(5) dot 6/sqrt(5) = 2$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知椭圆 $C: x^2/a^2 + y^2/b^2 = 1$（$a > b > 0$）的离心率为 $1/2$，椭圆被直线 $x = b$ 截得的线段长为 $sqrt(3)$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的标准方程；],
      answers: ([$x^2/4 + y^2/3 = 1$],),
      explanation: [由 $c/a = 1/2$，得 $b^2 = a^2 - c^2 = 3/4 a^2$。#linebreak()将 $x = b$ 代入椭圆方程，得 $y = plus.minus b/2$，故弦长为 $b = sqrt(3)$，进而 $a^2 = 4$。#linebreak()所求方程为 $x^2/4 + y^2/3 = 1$。],
    ),
    subquestion(
      stem: [斜率为 $-sqrt(3)$ 的直线与圆 $x^2 + y^2 = b^2$ 相切，且该直线交椭圆于 $P(x_1, y_1), Q(x_2, y_2)$（$y_1 < y_2$），$A$ 是椭圆的上顶点。记直线 $A P, A Q$ 的斜率分别为 $k_1, k_2$，求 $k_1/k_2$。],
      answers: ([$3$],),
      explanation: [
        #step[确定两条切线][由第（1）问，圆为 $x^2 + y^2 = 3$，$A(0, sqrt(3))$。#linebreak()设直线为 $y = -sqrt(3)x + m$，由圆心到直线的距离等于半径，得 $abs(m)/2 = sqrt(3)$，故 $m = plus.minus 2 sqrt(3)$。]
        #step[当截距为正时][将 $y = -sqrt(3)x + 2 sqrt(3)$ 代入椭圆，得 $5x^2 - 16x + 12 = 0$，解得 $x = 2$ 或 $6/5$。#linebreak()由 $y_1 < y_2$，得 $P(2, 0)$、$Q(6/5, (4 sqrt(3))/5)$。#linebreak()所以 $k_1 = -sqrt(3)/2$、$k_2 = -sqrt(3)/6$，$k_1/k_2 = 3$。]
        #step[当截距为负时][将 $y = -sqrt(3)x - 2 sqrt(3)$ 代入椭圆，得 $5x^2 + 16x + 12 = 0$，解得 $x = -2$ 或 $-6/5$。#linebreak()由 $y_1 < y_2$，得 $P(-6/5, -(4 sqrt(3))/5)$、$Q(-2, 0)$。#linebreak()所以 $k_1 = (3 sqrt(3))/2$、$k_2 = sqrt(3)/2$，仍有 $k_1/k_2 = 3$。#linebreak()综上，所求比值为 $3$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知等差数列 $\{a_n\}$ 与等比数列 $\{b_n\}$ 满足：$a_1 = 2$，$b_1 = 1$，$a_2 = b_1 + b_2$，$a_4 = b_3 - b_1$。],
  parts: (
    subquestion(
      stem: [求数列 $\{a_n\}, \{b_n\}$ 的通项公式；],
      answers: ([$a_n = 2n$，$b_n = 3^(n - 1)$。],),
      explanation: [设公差为 $d$，公比为 $q$（$q != 0$），则 $2 + d = 1 + q$、$2 + 3d = q^2 - 1$。#linebreak()消去 $d$ 得 $q(q - 3) = 0$，故 $q = 3$、$d = 2$。#linebreak()于是 $a_n = 2n$，$b_n = 3^(n - 1)$。],
    ),
    subquestion(
      stem: [记 $E_n = {x in RR | x <= n, exists k in NN^*, x = a_k "或" x = b_k}$，记 $c_n$ 为 $E_n$ 中的元素个数。],
      parts: (
        subquestion(
          stem: [求 $c_(3^n)$；],
          answers: ([$(3^n + 2n + 1)/2$],),
          explanation: [$a_k$ 是全部正偶数，$b_k$ 是 $3$ 的非负整数次幂，均为奇数，两类互不重复。#linebreak()不超过 $3^n$ 的正偶数有 $(3^n - 1)/2$ 个，$3$ 的幂有 $3^0, 3^1, dots, 3^n$ 共 $n + 1$ 个，故
            $ c_(3^n) = (3^n - 1)/2 + n + 1 = (3^n + 2n + 1)/2. $
          ],
        ),
        subquestion(
          stem: [求 $sum_(m = 1)^(3^n - 1) (-1)^m dot a_m dot c_m$。],
          answers: ([$3/4 (3^n - 1)^2 + n dot 3^n$],),
          explanation: [
            #step[相邻两项配对][令 $L = (3^n - 1)/2$，并记不超过 $2j$ 的 $3$ 的非负整数次幂的个数为 $t_j$。#linebreak()因这些幂均为奇数，$c_(2j) = j + t_j$，$c_(2j - 1) = j - 1 + t_j$。故一对相邻项之和为
              $
                a_(2j)c_(2j) - a_(2j - 1)c_(2j - 1) = 4j(j + t_j) - (4j - 2)(j - 1 + t_j) = 6j - 2 + 2t_j.
              $
            ]
            #step[按每个幂出现的次数计数][$3^k$（$0 <= k <= n - 1$）被计入 $t_j$ 当且仅当 $j >= (3^k + 1)/2$，共被计入 $L - (3^k - 1)/2$ 次。因此
              $
                sum_(j = 1)^L t_j = sum_(k = 0)^(n - 1) (L - (3^k - 1)/2) = n L - (3^n - 1)/4 + n/2.
              $
            ]
            #step[求和化简][所以原式等于
              $ sum_(j = 1)^L (6j - 2 + 2t_j) = 3L^2 + L + 2n L - (3^n - 1)/2 + n = 3L^2 + 2n L + n. $
              代入 $L$，得 $3/4 (3^n - 1)^2 + n dot 3^n$。
            ],
          ],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知 $f(x) = e^x - 2/3 sin x$。],
  parts: (
    subquestion(
      stem: [求曲线 $y = f(x)$ 在点 $(0, f(0))$ 处的切线方程；],
      answers: ([$y = x/3 + 1$],),
      explanation: [$f(0) = 1$，$f'(x) = e^x - 2/3 cos x$，$f'(0) = 1/3$，故切线为 $y = x/3 + 1$。],
    ),
    subquestion(
      stem: [当 $x in [-1/3, +infinity)$ 时，证明 $f(x) >= 1 + x/3$；],
      answers: ([证明见解析。],),
      explanation: [令 $g(x) = f(x) - 1 - x/3$，则 $g(0) = g'(0) = 0$，$g''(x) = e^x + 2/3 sin x$。#linebreak()当 $x >= 0$ 时，$g''(x) >= 1 - 2/3 = 1/3 > 0$。#linebreak()当 $-1/3 <= x <= 0$ 时，由 $e^x >= 1 + x$ 及 $sin x >= x$，得
        $ g''(x) >= 1 + x + 2/3 x >= 4/9 > 0. $
        这里 $e^x - 1 - x$ 在 $0$ 处取得最小值 $0$；而 $(sin x - x)' = cos x - 1 <= 0$，故在 $x <= 0$ 时 $sin x - x >= 0$。#linebreak()所以 $g'$ 在 $[-1/3, +infinity)$ 上严格递增，$g$ 在 $[-1/3, 0]$ 上递减，在 $[0, +infinity)$ 上递增。#linebreak()∴ $g(x) >= g(0) = 0$，即 $f(x) >= 1 + x/3$。
      ],
    ),
    subquestion(
      stem: [求实数 $a$ 的最大可能值，使得 $f(1) dot f(1/2) dot f(1/3) dots f(1/n) >= (n + 1)^a$ 对任意的 $n in NN^*$ 都成立。],
      answers: ([$1/3$],),
      explanation: [
        #step[证明 $a = 1/3$ 可行][由第（2）问，对每个正整数 $k$，$f(1/k) >= 1 + 1/(3k) > 0$。又
          $ (1 + 1/(3k))^3 = 1 + 1/k + 1/(3k^2) + 1/(27k^3) > 1 + 1/k, $
          故 $f(1/k) > ((k + 1)/k)^(1/3)$。逐项相乘得
          $
            product_(k = 1)^n f(1/k) > (product_(k = 1)^n (k + 1)/k)^(1/3) = (n + 1)^(1/3).
          $
        ]
        #step[给乘积的对数建立上界][对 $0 <= x <= 1$，令 $h(x) = 1 + x/3 + 2x^2 - f(x)$。#linebreak()有 $h(0) = h'(0) = 0$，且 $h''(x) = 4 - e^x - 2/3 sin x >= 4 - e - 2/3 > 0$，故 $h(x) >= 0$。#linebreak()由 $ln(1 + u) <= u$（$u >= 0$），得
          $ ln f(1/k) <= ln(1 + 1/(3k) + 2/k^2) <= 1/(3k) + 2/k^2. $
          对 $k >= 2$，有 $1/k <= ln(k/(k - 1))$、$1/k^2 <= 1/(k - 1) - 1/k$；第一式可由 $ln(1 + u) >= u/(1 + u)$（$u >= 0$）求导证明。裂项相加得
          $
            sum_(k = 1)^n 1/k <= 1 + ln n, quad sum_(k = 1)^n 1/k^2 <= 2 - 1/n < 2.
          $
          因此
          $ sum_(k = 1)^n ln f(1/k) < 1/3 ln n + 13/3 < 1/3 ln(n + 1) + 13/3. $
        ]
        #step[排除所有更大的指数][若 $a > 1/3$，取足够大的正整数 $n$，使 $(a - 1/3) ln(n + 1) > 13/3$，则
          $ sum_(k = 1)^n ln f(1/k) < a ln(n + 1), $
          与要求的乘积不等式矛盾。故 $a <= 1/3$；结合可行性，最大值为 $1/3$。
        ],
      ],
    ),
  ),
)
