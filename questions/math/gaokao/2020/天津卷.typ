#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020天津.pdf",
  regions: ("天津",),
)

#let function-choice(index) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: move(dx: -2pt)[$O$],
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
    y: (tick: (label: (anchor: "east", offset: 0.15))),
  ))
  plot.plot(
    size: (4.2, 3.2),
    axis-style: "school-book",
    x-min: -4,
    x-max: 4,
    y-min: -2.7,
    y-max: 2.7,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (1,),
    y-ticks: (2,),
    {
      for domain in ((-3.8, 0), (0, 3.8)) {
        plot.add(
          x => {
            let y = 4 * x / (x * x + 1)
            if index == 0 { y } else if index == 1 { -y } else if index == 2 {
              calc.abs(y)
            } else { -calc.abs(y) }
          },
          domain: domain,
          samples: 100,
          style: (stroke: (paint: black, thickness: figure-style.thickness)),
        )
      }
    },
  )
})
#let diameter-histogram() = {
  set text(size: 8pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let heights = (1.25, 3.75, 2.5, 7.5, 10, 8.75, 6.25, 5, 5)
    let levels = range(1, 9).map(i => 1.25 * i)
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: $0$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      x: (label: (anchor: "west", offset: 0.2)),
    ))
    plot.plot(
      size: (9, 4.8),
      axis-style: "school-book",
      x-min: 5.29,
      x-max: 5.5,
      x-break: true,
      y-min: 0,
      y-max: 11,
      x-label: [直径/mm],
      y-label: [$"频率"/"组距"$],
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: range(531, 550, step: 2).map(n => (n / 100, str(n / 100))),
      y-ticks: levels.zip((
        "1.25",
        "2.50",
        "3.75",
        "5.00",
        "6.25",
        "7.50",
        "8.75",
        "10.00",
      )),
      {
        plot.annotate(resize: false, {
          for (i, h) in heights.enumerate() {
            let x = 5.31 + 0.02 * i
            line((x, h), (x + 0.02, h))
            line(
              (x, 0),
              (x, calc.max(h, if i == 0 { 0 } else { heights.at(i - 1) })),
            )
          }
          line((5.49, 0), (5.49, heights.last()))
          for level in levels {
            let i = heights.position(h => h >= level)
            line((5.29, level), (5.31 + 0.02 * i, level), stroke: (
              dash: figure-style.dash,
            ))
          }
        })
      },
    )
  })
}
#let quadrilateral-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (1.5, 1.5 * calc.sqrt(3))
  let d = (2.5, 1.5 * calc.sqrt(3))
  line((0, 0), a, d, (6, 0), close: true)
  line((3, 0), d, (4, 0))
  for (p, label, anchor) in (
    (a, $A$, "south"),
    (d, $D$, "south"),
    ((0, 0), $B$, "north"),
    ((6, 0), $C$, "north"),
    ((3, 0), $M$, "north"),
    ((4, 0), $N$, "north"),
  ) {
    content(p, label, anchor: anchor, padding: 3pt)
  }
})
#let prism-diagram() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  let a = (2, 0, 0)
  let b = (0, 2, 0)
  let c = (0, 0, 0)
  let a1 = (2, 0, 3)
  let b1 = (0, 2, 3)
  let c1 = (0, 0, 3)
  let d = (2, 0, 1)
  let e = (0, 0, 2)
  let m = (1, 1, 3)
  oblique-project((-0.35, -0.35), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, b1, a1, a)
    line(a1, c1, b1)
    line(c1, m)
    line(d, b1)
    line(a, c, b, stroke: (dash: figure-style.dash))
    line(c, c1, stroke: (dash: figure-style.dash))
    line(d, e, b1, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north"),
      (b, $B$, "north-west"),
      (c, $C$, "north-west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south"),
      (d, $D$, "east"),
      (e, $E$, "east"),
      (m, $M$, "north-east"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})

#section[选择题：本大题共 9 小题，每小题 5 分，共 45 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]

#question(
  "single-choice",
  score: 5,
  stem: [设全集 $U = {-3, -2, -1, 0, 1, 2, 3}$，集合 $A = {-1, 0, 1, 2}$，$B = {-3, 0, 2, 3}$，则 $A inter (complement_U B) =$ #choice-placeholder()。],
  choices: ([${-3, 3}$], [${0, 2}$], [${-1, 1}$], [${-3, -2, -1, 1, 3}$]),
  answers: ([C],),
  explanation: [$
    complement_U B = {-2, -1, 1}, quad A inter (complement_U B) = {-1, 1}.
  $],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $a in RR$，则“$a > 1$”是“$a^2 > a$”的 #choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [∵ $a^2 > a$ 等价于 $a < 0$ 或 $a > 1$，∴ $a > 1$ 是充分不必要条件。],
)

#question(
  "single-choice",
  score: 5,
  stem: [函数 $y = (4x)/(x^2 + 1)$ 的图象大致为 #choice-placeholder()。],
  choices: (
    [#figure(function-choice(0))],
    [#figure(function-choice(1))],
    [#figure(function-choice(2))],
    [#figure(function-choice(3))],
  ),
  answers: ([A],),
  explanation: [函数为奇函数，且 $x > 0$ 时 $y > 0$，排除 B、C、D。又 $y(1) = 2$，且 $y' = (4(1 - x^2))/(x^2 + 1)^2$，与 A 中的图象相符。],
)

#question(
  "single-choice",
  score: 5,
  stem: [从一批零件中抽取 80 个，测量其直径（单位：mm），将所得数据分为 9 组：$[5.31, 5.33)$，$[5.33, 5.35)$，$dots$，$[5.45, 5.47)$，$[5.47, 5.49]$，并整理得到如下频率分布直方图，则在被抽取的零件中，直径落在区间 $[5.43, 5.47)$ 内的个数为 #choice-placeholder()。#figure(diameter-histogram())],
  choices: ([10], [18], [20], [36]),
  answers: ([B],),
  explanation: [所求频率为 $(6.25 + 5) times 0.02 = 0.225$，故个数为 $80 times 0.225 = 18$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [若棱长为 $2sqrt(3)$ 的正方体的顶点都在同一球面上，则该球的表面积为 #choice-placeholder()。],
  choices: ([$12 pi$], [$24 pi$], [$36 pi$], [$144 pi$]),
  answers: ([C],),
  explanation: [球的直径等于正方体的体对角线，故半径 $R = (2sqrt(3) times sqrt(3))/2 = 3$，表面积 $4 pi R^2 = 36 pi$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $a = 3^0.7$，$b = (1/3)^(-0.8)$，$c = log_0.7 0.8$，则 $a, b, c$ 的大小关系为 #choice-placeholder()。],
  choices: ([$a < b < c$], [$b < a < c$], [$b < c < a$], [$c < a < b$]),
  answers: ([D],),
  explanation: [∵ $b = 3^0.8 > 3^0.7 = a > 1$，而 $0 < log_0.7 0.8 < 1$，∴ $c < a < b$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设双曲线 $C$ 的方程为 $x^2/a^2 - y^2/b^2 = 1$（$a > 0, b > 0$），过抛物线 $y^2 = 4x$ 的焦点和点 $(0, b)$ 的直线为 $l$。若 $C$ 的一条渐近线与 $l$ 平行，另一条渐近线与 $l$ 垂直，则双曲线 $C$ 的方程为 #choice-placeholder()。],
  choices: (
    [$x^2/4 - y^2/4 = 1$],
    [$x^2 - y^2/4 = 1$],
    [$x^2/4 - y^2 = 1$],
    [$x^2 - y^2 = 1$],
  ),
  answers: ([D],),
  explanation: [抛物线的焦点为 $(1, 0)$，∴ $l$ 的斜率为 $-b$。由平行、垂直关系得 $ -b = -b/a, quad (-b) dot b/a = -1. $ 又 $a, b > 0$，解得 $a = b = 1$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x) = sin(x + pi/3)$。给出下列结论：\
    ① $f(x)$ 的最小正周期为 $2 pi$；\
    ② $f(pi/2)$ 是 $f(x)$ 的最大值；\
    ③ 把函数 $y = sin x$ 的图象上所有点向左平移 $pi/3$ 个单位长度，可得到函数 $y = f(x)$ 的图象。\
    其中所有正确结论的序号是 #choice-placeholder()。],
  choices: ([①], [①③], [②③], [①②③]),
  answers: ([B],),
  explanation: [①正确，最小正周期为 $2 pi$。②错误，$f(pi/2) = sin(5pi/6) = 1/2 < 1$。③正确，向左平移 $pi/3$ 个单位长度即将 $x$ 替换为 $x + pi/3$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x) = cases(x^3 & quad x >= 0, -x & quad x < 0)$，若函数 $g(x) = f(x) - |k x^2 - 2x|$（$k in RR$）恰有 4 个零点，则 $k$ 的取值范围是 #choice-placeholder()。],
  choices: (
    [$(-infinity, -1/2) union (2sqrt(2), +infinity)$],
    [$(-infinity, -1/2) union (0, 2sqrt(2))$],
    [$(-infinity, 0) union (0, 2sqrt(2))$],
    [$(-infinity, 0) union (2sqrt(2), +infinity)$],
  ),
  answers: ([D],),
  explanation: [#step[非正零点][
      $x = 0$ 恒为零点。$x < 0$ 时，除以 $-x$ 得 $|k x - 2| = 1$，即 $k x = 1$ 或 $k x = 3$。故 $k < 0$ 时有两个负零点，$k >= 0$ 时没有负零点。
    ]
    #step[正零点][
      $x > 0$ 时方程化为 $x^2 = |k x - 2|$，即 $x^2 + k x - 2 = 0$ 或 $x^2 - k x + 2 = 0$。
      前一方程恒有一个正根；后一方程仅在 $k > 2sqrt(2)$ 时有两个正根，在 $k = 2sqrt(2)$ 时有一个正根，其余情况没有正根。两方程没有公共正根。
    ]
    #step[合并计数][
      $k < 0$ 时共 $1 + 2 + 1 = 4$ 个零点；$k > 2sqrt(2)$ 时共 $1 + 1 + 2 = 4$ 个零点。其余情况均不满足。
    ]],
)

#section[填空题：本大题共 6 小题，每小题 5 分，共 30 分。]

#question(
  "fill-in",
  score: 5,
  stem: [$i$ 是虚数单位，复数 $(8 - i)/(2 + i) =$ #fill-placeholder()。],
  answers: ([$3 - 2i$],),
  explanation: [$
    (8 - i)/(2 + i) = ((8 - i)(2 - i))/5 = (15 - 10i)/5 = 3 - 2i.
  $],
)

#question(
  "fill-in",
  score: 5,
  stem: [在 $(x + 2/x^2)^5$ 的展开式中，$x^2$ 的系数是 #fill-placeholder()。],
  answers: ([10],),
  explanation: [通项为 $T_(r+1) = upright(C)_5^r 2^r x^(5-3r)$。令 $5 - 3r = 2$，得 $r = 1$，所求系数为 $upright(C)_5^1 dot 2 = 10$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知直线 $x - sqrt(3)y + 8 = 0$ 和圆 $x^2 + y^2 = r^2$（$r > 0$）相交于 $A, B$ 两点。若 $|A B| = 6$，则 $r$ 的值为 #fill-placeholder()。],
  answers: ([5],),
  explanation: [圆心到直线的距离为 $d = 8/sqrt(1+3) = 4$，半弦长为 $3$，故 $r = sqrt(4^2 + 3^2) = 5$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知甲、乙两球落入盒子的概率分别为 $1/2$ 和 $1/3$。假定两球是否落入盒子互不影响，则甲、乙两球都落入盒子的概率为 #fill-placeholder()；甲、乙两球至少有一个落入盒子的概率为 #fill-placeholder()。],
  answers: ([$1/6$], [$2/3$]),
  explanation: [都落入的概率为 $1/2 times 1/3 = 1/6$；至少有一个落入的概率为 $1 - (1 - 1/2)(1 - 1/3) = 2/3$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知 $a > 0$，$b > 0$，且 $a b = 1$，则 $1/(2a) + 1/(2b) + 8/(a+b)$ 的最小值为 #fill-placeholder()。],
  answers: ([4],),
  explanation: [令 $t = a + b >= 2$。由 $a b = 1$ 得 $ 1/(2a) + 1/(2b) + 8/(a+b) = t/2 + 8/t >= 2sqrt(t/2 dot 8/t) = 4. $ 等号当且仅当 $t = 4$ 成立，可取 $a = 2 + sqrt(3)$，$b = 2 - sqrt(3)$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [如图，在四边形 $A B C D$ 中，$angle B = 60 degree$，$A B = 3$，$B C = 6$，且 $arrow(A D) = lambda arrow(B C)$，$arrow(A D) dot arrow(A B) = -3/2$，则实数 $lambda$ 的值为 #fill-placeholder()。若 $M, N$ 是线段 $B C$ 上的动点，且 $|arrow(M N)| = 1$，则 $arrow(D M) dot arrow(D N)$ 的最小值为 #fill-placeholder()。#figure(quadrilateral-diagram())],
  answers: ([$1/6$], [$13/2$]),
  explanation: [#step[求参数][
      取 $B = (0, 0)$，$C = (6, 0)$，$A = (3/2, (3sqrt(3))/2)$。于是
      $
        arrow(A D) dot arrow(A B) = (6lambda, 0) dot (-3/2, -(3sqrt(3))/2) = -9lambda = -3/2.
      $
      ∴ $lambda = 1/6$，$D = (5/2, (3sqrt(3))/2)$。
    ]
    #step[求最小值][
      不妨设 $M = (x, 0)$，$N = (x+1, 0)$，其中 $0 <= x <= 5$，则
      $ arrow(D M) dot arrow(D N) = (x-5/2)(x-3/2) + 27/4 = (x-2)^2 + 13/2. $
      当 $x = 2$ 时取得最小值 $13/2$。
    ]],
)

#section[解答题：本大题共 5 小题，共 75 分。解答应写出文字说明、证明过程或演算步骤。]

#question(
  "solution",
  score: 14,
  stem: [在 $triangle A B C$ 中，角 $A, B, C$ 所对的边分别为 $a, b, c$。已知 $a = 2sqrt(2)$，$b = 5$，$c = sqrt(13)$。],
  parts: (
    subquestion(
      stem: [求角 $C$ 的大小。],
      answers: ([$pi/4$],),
      explanation: [由余弦定理，$ cos C = (a^2 + b^2 - c^2)/(2a b) = (8 + 25 - 13)/(20sqrt(2)) = sqrt(2)/2. $ ∵ $0 < C < pi$，∴ $C = pi/4$。],
    ),
    subquestion(
      stem: [求 $sin A$ 的值。],
      answers: ([$(2sqrt(13))/13$],),
      explanation: [由正弦定理，$ sin A = (a sin C)/c = (2sqrt(2) dot sqrt(2)/2)/sqrt(13) = (2sqrt(13))/13. $],
    ),
    subquestion(
      stem: [求 $sin(2A + pi/4)$ 的值。],
      answers: ([$(17sqrt(2))/26$],),
      explanation: [∵ $a < c$，∴ $A < C = pi/4$，故 $cos A = (3sqrt(13))/13$。于是 $ sin 2A = 2 sin A cos A = 12/13, quad cos 2A = 1 - 2 sin^2 A = 5/13. $ ∴ $ sin(2A + pi/4) = (12/13 + 5/13) sqrt(2)/2 = (17sqrt(2))/26. $],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [如图，在三棱柱 $A B C - A_1 B_1 C_1$ 中，$C C_1 perp$ 平面 $A B C$，$A C perp B C$，$A C = B C = 2$，$C C_1 = 3$，点 $D, E$ 分别在棱 $A A_1$ 和棱 $C C_1$ 上，且 $A D = 1$，$C E = 2$，$M$ 为棱 $A_1 B_1$ 的中点。#figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [求证：$C_1 M perp B_1 D$。],
      answers: ([证明见解析。],),
      explanation: [以 $C$ 为原点，$C A$、$C B$、$C C_1$ 的方向依次为 $x$、$y$、$z$ 轴正方向，建立空间直角坐标系。则 $ A = (2,0,0), quad B = (0,2,0), quad C_1 = (0,0,3), $ $ A_1 = (2,0,3), quad B_1 = (0,2,3), quad D = (2,0,1), $ $ E = (0,0,2), quad M = (1,1,3). $ ∵ $arrow(C_1 M) = (1,1,0)$，$arrow(B_1 D) = (2,-2,-2)$，且两向量数量积为 $0$，∴ $C_1 M perp B_1 D$。],
    ),
    subquestion(
      stem: [求二面角 $B - B_1 E - D$ 的正弦值。],
      answers: ([$sqrt(30)/6$],),
      explanation: [平面 $B B_1 E$ 的一个法向量为 $bold(m) = (1,0,0)$。由 $arrow(E D) = (2,0,-1)$，$arrow(E B_1) = (0,2,1)$，可取平面 $D B_1 E$ 的法向量 $bold(n) = (1,-1,2)$。设所求二面角为 $theta$，则 $ cos^2 theta = (bold(m) dot bold(n))^2/(|bold(m)|^2 |bold(n)|^2) = 1/6, $ ∴ $sin theta = sqrt(1 - 1/6) = sqrt(30)/6$。],
    ),
    subquestion(
      stem: [求直线 $A B$ 与平面 $D B_1 E$ 所成角的正弦值。],
      answers: ([$sqrt(3)/3$],),
      explanation: [由 $arrow(A B) = (-2,2,0)$，所求角 $alpha$ 满足 $ sin alpha = (|arrow(A B) dot bold(n)|)/(|arrow(A B)| |bold(n)|) = 4/(2sqrt(2) sqrt(6)) = sqrt(3)/3. $],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [已知椭圆 $x^2/a^2 + y^2/b^2 = 1$（$a > b > 0$）的一个顶点为 $A(0,-3)$，右焦点为 $F$，且 $|O A| = |O F|$，其中 $O$ 为原点。],
  parts: (
    subquestion(
      stem: [求椭圆方程。],
      answers: ([$x^2/18 + y^2/9 = 1$],),
      explanation: [由题意，$b = 3$，半焦距 $c = 3$，故 $a^2 = b^2 + c^2 = 18$，椭圆方程为 $x^2/18 + y^2/9 = 1$。],
    ),
    subquestion(
      stem: [已知点 $C$ 满足 $3arrow(O C) = arrow(O F)$，点 $B$ 在椭圆上（$B$ 异于椭圆的顶点），直线 $A B$ 与以 $C$ 为圆心的圆相切于点 $P$，且 $P$ 为线段 $A B$ 的中点。求直线 $A B$ 的方程。],
      answers: ([$y = 1/2 x - 3$ 或 $y = x - 3$],),
      explanation: [#step[表示交点与中点][
          $C = (1,0)$。由 $B$ 不是顶点，直线 $A B$ 的斜率存在且非零，设为 $k$。联立 $y = k x - 3$ 与椭圆方程，得
          $ (1+2k^2)x^2 - 12k x = 0. $
          其中 $x = 0$ 对应 $A$，故
          $
            B = ((12k)/(1+2k^2), (6k^2-3)/(1+2k^2)), quad P = ((6k)/(1+2k^2), -3/(1+2k^2)).
          $
        ]
        #step[利用切线条件][
          由 $C P perp A B$，得
          $ ((6k)/(1+2k^2)-1, -3/(1+2k^2)) dot (1,k) = 0, $
          即 $2k^2 - 3k + 1 = 0$，解得 $k = 1/2$ 或 $k = 1$。
          两者分别对应 $B = (4,-1)$、$(4,1)$，均非顶点，且 $C P$ 非零，满足切线条件。
          故直线方程为 $y = 1/2 x - 3$ 或 $y = x - 3$。
        ]],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [已知 ${a_n}$ 为等差数列，${b_n}$ 为等比数列，$a_1 = b_1 = 1$，$a_5 = 5(a_4 - a_3)$，$b_5 = 4(b_4 - b_3)$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 和 ${b_n}$ 的通项公式。],
      answers: ([$a_n = n$，$b_n = 2^(n-1)$],),
      explanation: [设公差为 $d$，公比为 $q != 0$，则 $1 + 4d = 5d$，$q^4 = 4(q^3 - q^2)$。∴ $d = 1$，$(q - 2)^2 = 0$，即 $q = 2$。故 $a_n = n$，$b_n = 2^(n-1)$。],
    ),
    subquestion(
      stem: [记 ${a_n}$ 的前 $n$ 项和为 $S_n$，求证：$S_n S_(n+2) < S_(n+1)^2$（$n in NN^*$）。],
      answers: ([证明见解析。],),
      explanation: [由 $S_n = (n(n+1))/2$，有 $ S_n S_(n+2) - S_(n+1)^2 = ((n+1)(n+2))/4 [n(n+3)-(n+1)(n+2)] = -((n+1)(n+2))/2 < 0. $ 故结论成立。],
    ),
    subquestion(
      stem: [对任意的正整数 $n$，设 $c_n = cases(((3a_n-2)b_n)/(a_n a_(n+2)) & quad n "为奇数", a_(n-1)/b_(n+1) & quad n "为偶数")$，求数列 ${c_n}$ 的前 $2n$ 项和。],
      answers: ([$4^n/(2n+1) - (6n+5)/(9 dot 4^n) - 4/9$],),
      explanation: [#step[分别裂项][
          对正整数 $j$，有
          $
            c_(2j-1) = ((6j-5)4^(j-1))/((2j-1)(2j+1)) = 4^j/(2j+1) - 4^(j-1)/(2j-1),
          $
          $ c_(2j) = (2j-1)/4^j = (6j-1)/(9 dot 4^(j-1)) - (6j+5)/(9 dot 4^j). $
        ]
        #step[求和][
          $ sum_(j=1)^n c_(2j-1) = 4^n/(2n+1) - 1, $
          $ sum_(j=1)^n c_(2j) = 5/9 - (6n+5)/(9 dot 4^n). $
          相加得所求和为 $4^n/(2n+1) - (6n+5)/(9 dot 4^n) - 4/9$。
        ]],
    ),
  ),
)

#question(
  "solution",
  score: 16,
  stem: [已知函数 $f(x) = x^3 + k ln x$（$k in RR$），$f'(x)$ 为 $f(x)$ 的导函数。],
  parts: (
    subquestion(stem: [当 $k = 6$ 时，], parts: (
      subquestion(
        stem: [求曲线 $y = f(x)$ 在点 $(1,f(1))$ 处的切线方程。],
        answers: ([$y = 9x - 8$],),
        explanation: [$f(1) = 1$，$f'(x) = 3x^2 + 6/x$，故 $f'(1) = 9$，切线方程为 $y - 1 = 9(x - 1)$，即 $y = 9x - 8$。],
      ),
      subquestion(
        stem: [求函数 $g(x) = f(x) - f'(x) + 9/x$ 的单调区间和极值。],
        answers: (
          [在 $(0,1)$ 上单调递减，在 $(1,+infinity)$ 上单调递增；极小值为 $g(1) = 1$，无极大值。],
        ),
        explanation: [$g(x) = x^3 - 3x^2 + 6 ln x + 3/x$，定义域为 $(0,+infinity)$。求导得 $ g'(x) = 3x^2 - 6x + 6/x - 3/x^2 = (3(x-1)^3(x+1))/x^2. $ 故在 $(0,1)$ 上 $g'(x) < 0$，在 $(1,+infinity)$ 上 $g'(x) > 0$。∴ $g$ 在 $(0,1)$ 上单调递减，在 $(1,+infinity)$ 上单调递增，在 $x = 1$ 处取得极小值 $g(1) = 1$，无极大值。],
      ),
    )),
    subquestion(
      stem: [当 $k >= -3$ 时，求证：对任意的 $x_1, x_2 in [1,+infinity)$，且 $x_1 > x_2$，有 $ (f'(x_1)+f'(x_2))/2 > (f(x_1)-f(x_2))/(x_1-x_2). $],
      answers: ([证明见解析。],),
      explanation: [#step[化为单变量不等式][
          令 $t = x_1/x_2 > 1$，并记
          $ D = (x_1-x_2)(f'(x_1)+f'(x_2))-2(f(x_1)-f(x_2)). $
          由 $f'(x) = 3x^2 + k/x$，整理得
          $ D = x_2^3(t-1)^3 + k(t-1/t-2 ln t). $
        ]
        #step[利用已知的最小值][
          设 $h(t) = t - 1/t - 2 ln t$，则 $h(1) = 0$，且 $h'(t) = (t-1)^2/t^2 > 0$（$t > 1$），故 $h(t) > 0$。
          ∵ $x_2 >= 1$，$k >= -3$，∴
          $ D >= (t-1)^3 - 3h(t) = t^3 - 3t^2 + 6 ln t + 3/t - 1. $
          右端等于第 (1) 问中的 $g(t) - 1$，由其在 $(1,+infinity)$ 上严格递增及 $g(1) = 1$，得 $D > 0$。
          两边除以 $2(x_1-x_2) > 0$，即得所证不等式。
        ]],
    ),
  ),
)
