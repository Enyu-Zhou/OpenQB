#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "全国三卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017全国3文(云南,广西,贵州,四川,西藏).pdf",
  regions: ("云南", "广西", "贵州", "四川", "西藏"),
)
#let visitors() = {
  set text(size: 8pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: $O$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
        label: (offset: 0.12),
      ),
      grid: (
        stroke: (thickness: figure-style.thickness, dash: figure-style.dash),
      ),
      y: (label: (anchor: "south", offset: 0.2)),
    ))
    let values = (
      26.5,
      27.25,
      27,
      29,
      28.5,
      28.25,
      33,
      35,
      30.5,
      32,
      29,
      28,
      31,
      31.5,
      30.5,
      32,
      32,
      31,
      36,
      37.5,
      33.5,
      35,
      32.5,
      32,
      32.5,
      35,
      36.5,
      36,
      35,
      34,
      39.5,
      42,
      37,
      39,
      35,
      35,
    )
    plot.plot(
      size: (14, 4),
      axis-style: "school-book",
      x-min: 0,
      x-max: 36.5,
      x-tick-step: none,
      x-ticks: range(1, 37).map(i => (
        i,
        text(size: 7pt, str(calc.rem(i - 1, 12) + 1)),
      )),
      y-min: 20,
      y-max: 45,
      y-break: true,
      y-tick-step: none,
      y-ticks: (25, 30, 35, 40, 45),
      y-grid: true,
      y-label: [月接待游客量（万人）],
      {
        plot.annotate(resize: false, {
          let points = values.enumerate().map(((i, y)) => (i + 1, y))
          line(..points)
          for (x, y) in points {
            rect(
              (x - 0.09, y - 0.16),
              (x + 0.09, y + 0.16),
              fill: black,
              stroke: none,
            )
          }
        })
      },
    )
    for (x, label) in ((2.5, [2014 年]), (7.1, [2015 年]), (11.7, [2016 年])) {
      content((x, -0.65), label, padding: 0pt)
    }
  })
}
#let loop-chart() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.7, -0.35), (0.7, 0.35), radius: 0.18)
  content((0, 0), text(size: 9pt)[开始])
  line((-1, -1.9), (0.8, -1.9), (1, -1.1), (-0.8, -1.1), close: true)
  content((0, -1.5), text(size: 9pt)[输入 $N$])
  rect((-2.2, -3.4), (2.2, -2.6))
  content((0, -3), text(size: 9pt)[$t=1,M=100,S=0$])
  line((0, -4), (1.7, -4.7), (0, -5.4), (-1.7, -4.7), close: true)
  content((0, -4.7), text(size: 9pt)[$t<=N$])
  for (y, label) in ((-6.2, [$S=S+M$]), (-8, [$M=-M/10$]), (-9.8, [$t=t+1$])) {
    rect((-1.4, y - 0.5), (1.4, y + 0.5))
    content((0, y), text(size: 9pt, label))
  }
  line((2.7, -6.6), (4.3, -6.6), (4.5, -5.8), (2.9, -5.8), close: true)
  content((3.6, -6.2), text(size: 9pt)[输出 $S$])
  rect((2.9, -8.35), (4.3, -7.65), radius: 0.18)
  content((3.6, -8), text(size: 9pt)[结束])
  for (a, b) in (
    ((0, -0.35), (0, -1.1)),
    ((0, -1.9), (0, -2.6)),
    ((0, -3.4), (0, -4)),
    ((0, -5.4), (0, -5.7)),
    ((0, -6.7), (0, -7.5)),
    ((0, -8.5), (0, -9.3)),
    ((3.6, -6.6), (3.6, -7.65)),
  ) { line(a, b, mark: (end: ">")) }
  line((-1.4, -9.8), (-2.6, -9.8), (-2.6, -3.7), (0, -3.7), mark: (end: ">"))
  line((1.7, -4.7), (3.6, -4.7), (3.6, -5.8), mark: (end: ">"))
  content((0.15, -5.5), text(size: 9pt)[是], anchor: "west")
  content((2.4, -4.6), text(size: 9pt)[否], anchor: "south")
})
#let tetrahedron(auxiliary: false) = cetz.canvas(length: 25mm, {
  import cetz.draw: *
  let a = (-1, 0, 0)
  let b = (0, calc.sqrt(3), 0)
  let c = (1, 0, 0)
  let d = (0, 0, 1)
  let e = (0, calc.sqrt(3) / 2, 0.5)
  oblique-project((0.4, 0.5), (1, 0), (0, 1.8), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, d, b, a)
    line(a, e)
    for (u, v) in ((a, c), (c, b), (c, d), (c, e)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    if auxiliary {
      let o = (0, 0, 0)
      line(d, o, b, stroke: (dash: figure-style.dash))
      content(o, $O$, anchor: "north-west", padding: 4pt)
    }
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "west"),
      (c, $C$, "east"),
      (d, $D$, "south"),
      (e, $E$, "south-west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#let option-graph(index) = {
  set text(size: 8pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      shared-zero: $O$,
    ))
    let curves = (
      (
        (
          (-4.3001, -3.3496),
          (-4.1648, -3.2140),
          (-4.0294, -3.0772),
          (-3.8941, -2.9391),
          (-3.7587, -2.7997),
          (-3.6233, -2.6586),
          (-3.4880, -2.5159),
          (-3.3527, -2.3712),
          (-3.2174, -2.2246),
          (-3.0820, -2.0757),
          (-2.9466, -1.9243),
          (-2.8113, -1.7702),
          (-2.6759, -1.6132),
          (-2.5406, -1.4529),
          (-2.4053, -1.2891),
          (-2.2699, -1.1213),
          (-2.1345, -0.9490),
          (-1.9992, -0.7716),
          (-1.8639, -0.5882),
          (-1.7285, -0.3979),
          (-1.5931, -0.1992),
          (-1.4578, 0.0098),
          (-1.3224, 0.2318),
          (-1.1871, 0.4709),
          (-1.0518, 0.7332),
          (-0.9164, 1.0284),
          (-0.7810, 1.3731),
          (-0.6457, 1.7978),
          (-0.5103, 2.3654),
          (-0.3750, 3.2296),
          (-0.2532, 4.6549),
        ),
        (
          (0.2500, -2.7081),
          (0.3853, -1.1461),
          (0.5207, -0.3142),
          (0.6561, 0.2388),
          (0.7914, 0.6556),
          (0.9268, 0.9956),
          (1.0621, 1.2878),
          (1.1974, 1.5482),
          (1.3328, 1.7857),
          (1.4682, 2.0067),
          (1.6035, 2.2148),
          (1.7388, 2.4128),
          (1.8742, 2.6025),
          (2.0095, 2.7854),
          (2.1449, 2.9624),
          (2.2803, 3.1344),
          (2.4156, 3.3019),
          (2.5509, 3.4653),
          (2.6863, 3.6254),
          (2.8217, 3.7821),
          (2.9570, 3.9360),
          (3.0923, 4.0872),
          (3.2277, 4.2360),
          (3.3630, 4.3825),
          (3.4984, 4.5269),
          (3.6338, 4.6695),
          (3.7691, 4.8104),
          (3.9044, 4.9498),
          (4.0398, 5.0877),
          (4.1751, 5.2245),
          (4.2969, 5.3465),
        ),
      ),
      (
        (
          (-4.3001, -1.2326),
          (-4.1648, -1.2401),
          (-4.0294, -1.2482),
          (-3.8941, -1.2569),
          (-3.7587, -1.2661),
          (-3.6233, -1.2760),
          (-3.4880, -1.2868),
          (-3.3527, -1.2983),
          (-3.2174, -1.3108),
          (-3.0820, -1.3245),
          (-2.9466, -1.3394),
          (-2.8113, -1.3558),
          (-2.6759, -1.3737),
          (-2.5406, -1.3937),
          (-2.4053, -1.4158),
          (-2.2699, -1.4406),
          (-2.1345, -1.4685),
          (-1.9992, -1.5002),
          (-1.8639, -1.5365),
          (-1.7285, -1.5785),
          (-1.5931, -1.6278),
          (-1.4578, -1.6861),
          (-1.3224, -1.7561),
          (-1.1871, -1.8423),
          (-1.0518, -1.9509),
          (-0.9164, -2.0913),
          (-0.7810, -2.2804),
          (-0.6457, -2.5489),
          (-0.5103, -2.9598),
          (-0.3750, -3.6671),
          (-0.2532, -4.9502),
        ),
        (
          (0.2500, 5.0001),
          (0.3853, 3.5952),
          (0.5207, 2.9208),
          (0.6561, 2.5244),
          (0.7914, 2.2637),
          (0.9268, 2.0791),
          (1.0621, 1.9416),
          (1.1974, 1.8352),
          (1.3328, 1.7504),
          (1.4682, 1.6812),
          (1.6035, 1.6237),
          (1.7388, 1.5752),
          (1.8742, 1.5336),
          (2.0095, 1.4976),
          (2.1449, 1.4662),
          (2.2803, 1.4387),
          (2.4156, 1.4140),
          (2.5509, 1.3921),
          (2.6863, 1.3723),
          (2.8217, 1.3545),
          (2.9570, 1.3382),
          (3.0923, 1.3234),
          (3.2277, 1.3099),
          (3.3630, 1.2974),
          (3.4984, 1.2859),
          (3.6338, 1.2752),
          (3.7691, 1.2654),
          (3.9044, 1.2561),
          (4.0398, 1.2476),
          (4.1751, 1.2395),
          (4.2969, 1.2328),
        ),
      ),
      (
        (
          (-4.4001, -2.5586),
          (-4.2572, -2.5249),
          (-4.1142, -2.4899),
          (-3.9712, -2.4535),
          (-3.8282, -2.4158),
          (-3.6853, -2.3768),
          (-3.5422, -2.3360),
          (-3.3993, -2.2936),
          (-3.2563, -2.2494),
          (-3.1133, -2.2030),
          (-2.9704, -2.1544),
          (-2.8274, -2.1033),
          (-2.6844, -2.0495),
          (-2.5414, -1.9926),
          (-2.3984, -1.9322),
          (-2.2554, -1.8680),
          (-2.1125, -1.7994),
          (-1.9695, -1.7256),
          (-1.8265, -1.6461),
          (-1.6836, -1.5596),
          (-1.5405, -1.4650),
          (-1.3976, -1.3605),
          (-1.2546, -1.2438),
          (-1.1116, -1.1115),
          (-0.9686, -0.9591),
          (-0.8257, -0.7793),
          (-0.6827, -0.5598),
          (-0.5397, -0.2783),
          (-0.3967, 0.1150),
          (-0.2537, 0.7630),
          (-0.1250, 2.5855),
        ),
        (
          (0.1250, -2.5879),
          (0.2680, -0.6785),
          (0.4110, -0.0681),
          (0.5539, 0.3101),
          (0.6969, 0.5840),
          (0.8399, 0.7987),
          (0.9829, 0.9754),
          (1.1259, 1.1255),
          (1.2689, 1.2560),
          (1.4118, 1.3714),
          (1.5548, 1.4748),
          (1.6978, 1.5686),
          (1.8407, 1.6543),
          (1.9838, 1.7332),
          (2.1267, 1.8064),
          (2.2697, 1.8746),
          (2.4127, 1.9384),
          (2.5556, 1.9984),
          (2.6986, 2.0550),
          (2.8416, 2.1085),
          (2.9846, 2.1594),
          (3.1275, 2.2077),
          (3.2706, 2.2539),
          (3.4135, 2.2980),
          (3.5565, 2.3402),
          (3.6995, 2.3807),
          (3.8424, 2.4196),
          (3.9854, 2.4571),
          (4.1284, 2.4934),
          (4.2714, 2.5283),
          (4.4001, 2.5587),
        ),
      ),
      (
        (
          (-4.3001, -3.2505),
          (-4.1648, -3.1155),
          (-4.0294, -2.9816),
          (-3.8941, -2.8490),
          (-3.7587, -2.7178),
          (-3.6233, -2.5881),
          (-3.4880, -2.4601),
          (-3.3527, -2.3340),
          (-3.2174, -2.2100),
          (-3.0820, -2.0882),
          (-2.9466, -1.9689),
          (-2.8113, -1.8523),
          (-2.6759, -1.7386),
          (-2.5406, -1.6282),
          (-2.4053, -1.5213),
          (-2.2699, -1.4184),
          (-2.1345, -1.3200),
          (-1.9992, -1.2268),
          (-1.8639, -1.1394),
          (-1.7285, -1.0590),
          (-1.5931, -0.9870),
          (-1.4578, -0.9253),
          (-1.3224, -0.8766),
          (-1.1871, -0.8451),
          (-1.0518, -0.8367),
          (-0.9164, -0.8611),
          (-0.7810, -0.9352),
          (-0.6457, -1.0891),
          (-0.5103, -1.3861),
          (-0.3750, -1.9795),
          (-0.2532, -3.1612),
        ),
        (
          (0.2500, 5.2082),
          (0.3853, 3.9168),
          (0.5207, 3.3557),
          (0.6561, 3.0733),
          (0.7914, 2.9273),
          (0.9268, 2.8579),
          (1.0621, 2.8365),
          (1.1974, 2.8468),
          (1.3328, 2.8799),
          (1.4682, 2.9297),
          (1.6035, 2.9923),
          (1.7388, 3.0650),
          (1.8742, 3.1459),
          (2.0095, 3.2338),
          (2.1449, 3.3275),
          (2.2803, 3.4262),
          (2.4156, 3.5294),
          (2.5509, 3.6366),
          (2.6863, 3.7473),
          (2.8217, 3.8612),
          (2.9570, 3.9780),
          (3.0923, 4.0975),
          (3.2277, 4.2194),
          (3.3630, 4.3436),
          (3.4984, 4.4699),
          (3.6338, 4.5980),
          (3.7691, 4.7278),
          (3.9044, 4.8591),
          (4.0398, 4.9919),
          (4.1751, 5.1259),
          (4.2969, 5.2475),
        ),
      ),
    )
    plot.plot(
      size: (4.5, 5),
      axis-style: "school-book",
      x-min: -5,
      x-max: 5,
      y-min: -5,
      y-max: 6,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (1,),
      y-ticks: (1,),
      {
        plot.annotate(resize: false, {
          for points in curves.at(index) { line(..points) }
        })
      },
    )
  })
}

#section[选择题：共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={1,2,3,4}$，$B={2,4,6,8}$，则 $A inter B$ 中元素的个数为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([B],),
  explanation: [$A inter B={2,4}$，共有 $2$ 个元素。],
)
#question(
  "single-choice",
  score: 5,
  stem: [复平面内表示复数 $z=i(-2+i)$ 的点位于#choice-placeholder()。],
  choices: ([第一象限], [第二象限], [第三象限], [第四象限]),
  answers: ([C],),
  explanation: [$z=-1-2i$，对应点为 $(-1,-2)$，位于第三象限。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某城市为了解游客人数的变化规律，提高旅游服务质量，收集并整理了 2014 年 1 月至 2016 年 12 月期间月接待游客量（单位：万人）的数据，绘制了下面的折线图。
    #figure(visitors())
    根据该折线图，下列结论错误的是#choice-placeholder()。],
  choices: (
    [月接待游客量逐月增加],
    [年接待游客量逐年增加],
    [各年的月接待游客量高峰期大致在 $7,8$ 月],
    [各年 $1$ 月至 $6$ 月的月接待游客量相对于 $7$ 月至 $12$ 月，波动性更小，变化比较平稳],
  ),
  answers: ([A],),
  explanation: [各年月接待游客量有升有降，例如每年 $8$ 月到 $9$ 月均下降，因此 A 错误。图中各年的总接待量逐年增加，高峰期大致位于 $7,8$ 月，上半年的波动较小，B、C、D 均符合图示。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $sin alpha-cos alpha=4/3$，则 $sin 2alpha=$#choice-placeholder()。],
  choices: ([$-7/9$], [$-2/9$], [$2/9$], [$7/9$]),
  answers: ([A],),
  explanation: [两边平方得 $1-2sin alpha cos alpha=16/9$，所以 $sin 2alpha=1-16/9=-7/9$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $x,y$ 满足约束条件 $cases(3x+2y-6<=0, x>=0, y>=0)$，则 $z=x-y$ 的取值范围是#choice-placeholder()。],
  choices: ([$[-3,0]$], [$[-3,2]$], [$[0,2]$], [$[0,3]$]),
  answers: ([B],),
  explanation: [可行域为顶点 $(0,0)$、$(2,0)$、$(0,3)$ 围成的三角形。线性目标函数在这三个顶点处的值分别为 $0,2,-3$，故取值范围为 $[-3,2]$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $f(x)=1/5 sin(x+pi/3)+cos(x-pi/6)$ 的最大值为#choice-placeholder()。],
  choices: ([$6/5$], [$1$], [$3/5$], [$1/5$]),
  answers: ([A],),
  explanation: [∵ $cos(x-pi/6)=sin(x+pi/3)$，∴ $f(x)=6/5 sin(x+pi/3)$，最大值为 $6/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $y=1+x+(sin x)/x^2$ 的部分图象大致为#choice-placeholder()。],
  choices: (
    [#figure(option-graph(0))],
    [#figure(option-graph(1))],
    [#figure(option-graph(2))],
    [#figure(option-graph(3))],
  ),
  answers: ([D],),
  explanation: [当 $x=1$ 时，$y=2+sin 1>2$，排除 A、C；当 $x arrow +infinity$ 时，$(sin x)/x^2 arrow 0$，故 $y arrow +infinity$，排除 B。因此选 D。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图的程序框图，为使输出 $S$ 的值小于 $91$，则输入的正整数 $N$ 的最小值为#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$5$], [$4$], [$3$], [$2$]),
  answers: ([D],),
  explanation: [当 $N=1$ 时，循环一次，输出 $S=100$，不满足要求。当 $N=2$ 时，循环两次，输出 $S=100-10=90<91$，故最小值为 $2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知圆柱的高为 $1$，它的两个底面的圆周在直径为 $2$ 的同一个球的球面上，则该圆柱的体积为#choice-placeholder()。],
  choices: ([$pi$], [$(3pi)/4$], [$pi/2$], [$pi/4$]),
  answers: ([B],),
  explanation: [球的半径为 $1$，两个底面到球心的距离均为 $1/2$。设底面半径为 $r$，由勾股定理得 $r^2=1-(1/2)^2=3/4$，故圆柱体积为 $pi r^2 dot 1=(3pi)/4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$E$ 为棱 $C D$ 的中点，则#choice-placeholder()。],
  choices: (
    [$A_1 E perp D C_1$],
    [$A_1 E perp B D$],
    [$A_1 E perp B C_1$],
    [$A_1 E perp A C$],
  ),
  answers: ([C],),
  explanation: [连接 $A D_1$、$A_1 D$。正方形 $A D D_1 A_1$ 的两条对角线互相垂直，故 $A D_1 perp A_1 D$。又 $D E perp$ 平面 $A D D_1 A_1$，所以 $A D_1 perp D E$。由 $A_1 D inter D E={D}$ 得 $A D_1 perp$ 平面 $A_1 D E$，从而 $A D_1 perp A_1 E$。∵ $B C_1 parallel A D_1$，∴ $A_1 E perp B C_1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的左、右顶点分别为 $A_1,A_2$，且以线段 $A_1 A_2$ 为直径的圆与直线 $b x-a y+2a b=0$ 相切，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$sqrt(6)/3$], [$sqrt(3)/3$], [$sqrt(2)/3$], [$1/3$]),
  answers: ([A],),
  explanation: [该圆的圆心为原点，半径为 $a$。由相切得 $(2a b)/sqrt(a^2+b^2)=a$，即 $a^2=3b^2$。因此 $e=sqrt(1-b^2/a^2)=sqrt(2/3)=sqrt(6)/3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=x^2-2x+a(e^(x-1)+e^(-x+1))$ 有唯一零点，则 $a=$#choice-placeholder()。],
  choices: ([$-1/2$], [$1/3$], [$1/2$], [$1$]),
  answers: ([C],),
  explanation: [令 $t=x-1$，则 $f(x)=t^2-1+a(e^t+e^(-t))$，是关于 $t$ 的偶函数。若零点唯一，只能在 $t=0$，从而 $-1+2a=0$，得 $a=1/2$。反之，此时由 $e^t+e^(-t)>=2$ 得 $f(x)>=t^2>=0$，且只有 $t=0$ 时取等号，确有唯一零点。],
)
#section[填空题：共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)=(-2,3)$，$bold(b)=(3,m)$，且 $bold(a) perp bold(b)$，则 $m=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [由 $bold(a) dot bold(b)=-6+3m=0$，得 $m=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [双曲线 $x^2/a^2-y^2/9=1$（$a>0$）的一条渐近线方程为 $y=3/5 x$，则 $a=$#fill-placeholder()。],
  answers: ([$5$],),
  explanation: [渐近线方程为 $y=plus.minus 3/a x$，由 $a>0$ 得 $3/a=3/5$，故 $a=5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [$triangle A B C$ 内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $C=60 degree$，$b=sqrt(6)$，$c=3$，则 $A=$#fill-placeholder()。],
  answers: ([$75 degree$],),
  explanation: [由正弦定理，$sin B=(b sin C)/c=sqrt(2)/2$。∵ $b<c$，∴ $B<C=60 degree$，故 $B=45 degree$，从而 $A=180 degree-60 degree-45 degree=75 degree$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设函数 $f(x)=cases(x+1 quad &x<=0, 2^x quad &x>0)$，则满足 $f(x)+f(x-1/2)>1$ 的 $x$ 的取值范围是#fill-placeholder()。],
  answers: ([$(-1/4,+infinity)$],),
  explanation: [两段函数各自严格递增，且在 $x=0$ 处连续，故 $f$ 在 $RR$ 上严格递增。因此 $g(x)=f(x)+f(x-1/2)$ 也严格递增。又 $g(-1/4)=f(-1/4)+f(-3/4)=3/4+1/4=1$，所以不等式等价于 $x> -1/4$。],
)
#section[解答题：共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17～21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [设数列 ${a_n}$ 满足 $a_1+3a_2+dots+(2n-1)a_n=2n$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=2/(2n-1)$],),
      explanation: [当 $n=1$ 时，$a_1=2$。当 $n>=2$ 时，将原等式与 $a_1+3a_2+dots+(2n-3)a_(n-1)=2(n-1)$ 相减，得 $(2n-1)a_n=2$。因此 $a_n=2/(2n-1)$，对所有正整数 $n$ 均成立。],
    ),
    subquestion(
      stem: [求数列 ${a_n/(2n+1)}$ 的前 $n$ 项和。],
      answers: ([$2n/(2n+1)$],),
      explanation: [由第（1）问，$a_n/(2n+1)=2/((2n-1)(2n+1))=1/(2n-1)-1/(2n+1)$。裂项相消得
        $
          S_n=(1-1/3)+(1/3-1/5)+dots+(1/(2n-1)-1/(2n+1))=1-1/(2n+1)=2n/(2n+1).
        $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某超市计划按月订购一种酸奶，每天进货量相同，进货成本每瓶 $4$ 元，售价每瓶 $6$ 元，未售出的酸奶降价处理，以每瓶 $2$ 元的价格当天全部处理完。根据往年销售经验，每天需求量与当天最高气温（单位：℃）有关。如果最高气温不低于 $25$，需求量为 $500$ 瓶；如果最高气温位于区间 $[20,25)$，需求量为 $300$ 瓶；如果最高气温低于 $20$，需求量为 $200$ 瓶。为了确定六月份的订购计划，统计了前三年六月份各天的最高气温数据，得下面的频数分布表：
    #table(
      columns: 7,
      align: center,
      [最高气温],
      [$[10,15)$],
      [$[15,20)$],
      [$[20,25)$],
      [$[25,30)$],
      [$[30,35)$],
      [$[35,40)$],

      [天数], [$2$], [$16$], [$36$], [$25$], [$7$], [$4$],
    )
    以最高气温位于各区间的频率代替最高气温位于该区间的概率。],
  parts: (
    subquestion(
      stem: [估计六月份这种酸奶一天的需求量不超过 $300$ 瓶的概率。],
      answers: ([$3/5$],),
      explanation: [需求量不超过 $300$ 瓶对应最高气温低于 $25$ ℃，共有 $2+16+36=54$ 天，总天数为 $90$，故所求概率约为 $54/90=3/5$。],
    ),
    subquestion(
      stem: [设六月份一天销售这种酸奶的利润为 $Y$（单位：元），当六月份这种酸奶一天的进货量为 $450$ 瓶时，写出 $Y$ 的所有可能值，并估计 $Y$ 大于零的概率。],
      answers: ([$Y$ 的所有可能值为 $-100,300,900$；$P(Y>0) approx 4/5$。],),
      explanation: [设需求量为 $X$。当 $X=200$ 时，$Y=6 times 200+2 times 250-4 times 450=-100$；当 $X=300$ 时，$Y=6 times 300+2 times 150-4 times 450=300$；当 $X=500$ 时，全部按原价售出，$Y=(6-4)times 450=900$。
        因此 $Y>0$ 对应最高气温不低于 $20$ ℃，故 $P(Y>0) approx (36+25+7+4)/90=4/5$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，四面体 $A B C D$ 中，$triangle A B C$ 是正三角形，$A D=C D$。
    #figure(tetrahedron())],
  parts: (
    subquestion(
      stem: [证明：$A C perp B D$。],
      answers: ([证明见解析。],),
      explanation: [取 $A C$ 中点 $O$，连接 $D O$、$B O$。由 $A D=C D$ 和 $A B=C B$，得 $A C perp D O$、$A C perp B O$。又 $D O inter B O={O}$，所以 $A C perp$ 平面 $B O D$，从而 $A C perp B D$。
        #figure(tetrahedron(auxiliary: true))],
    ),
    subquestion(
      stem: [已知 $triangle A C D$ 是直角三角形，$A B=B D$。若 $E$ 为棱 $B D$ 上与 $D$ 不重合的点，且 $A E perp E C$，求四面体 $A B C E$ 与四面体 $A C D E$ 的体积比。],
      answers: ([$1:1$],),
      explanation: [#step[确定 E 的位置][由 $A D=C D$ 知 $angle A D C=90 degree$，所以 $D O=A O=1/2 A C$。正三角形 $A B C$ 中，$B O^2=A B^2-A O^2$，从而 $B O^2+D O^2=A B^2=B D^2$，故 $B O perp D O$。因此 $cos angle O D B=D O/B D=1/2$，即 $angle O D B=60 degree$。
          由 $A E perp E C$，直角三角形 $A E C$ 的斜边中线满足 $E O=1/2 A C=D O$。∵ $E!=D$，$E$ 在 $B D$ 上，∴ $triangle D O E$ 为等腰三角形且底角为 $60 degree$，故为等边三角形。于是 $D E=D O=1/2 B D$，即 $B E=E D$。]
        #step[计算体积比][两四面体可分别以 $triangle A B E$、$triangle A D E$ 为底，顶点均为 $C$，高相同；两底面以 $B E$、$D E$ 为底的高也相同。所以 $V_(A B C E):V_(A C D E)=B E:D E=1:1$。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [在直角坐标系 $x O y$ 中，曲线 $y=x^2+m x-2$ 与 $x$ 轴交于 $A,B$ 两点，点 $C$ 的坐标为 $(0,1)$。当 $m$ 变化时，解答下列问题：],
  parts: (
    subquestion(
      stem: [能否出现 $A C perp B C$ 的情况？说明理由。],
      answers: ([不能。],),
      explanation: [设 $A=(x_1,0)$、$B=(x_2,0)$。由 $x^2+m x-2=0$ 的判别式为 $m^2+8>0$，知总有两个不同实根，且 $x_1 x_2=-2$。因此 $arrow(C A) dot arrow(C B)=x_1 x_2+1=-1!=0$，故不可能有 $A C perp B C$。],
    ),
    subquestion(
      stem: [证明过 $A,B,C$ 三点的圆在 $y$ 轴上截得的弦长为定值。],
      answers: ([定值为 $3$，证明见解析。],),
      explanation: [由于 $A,B$ 是 $x$ 轴上不同的点，$C$ 不在 $x$ 轴上，故三点确定唯一圆。设圆方程为 $x^2+y^2+D x+E y+F=0$。令 $y=0$，其两个根即 $x_1,x_2$，由韦达定理得 $D=m$、$F=-2$。代入 $C=(0,1)$ 得 $E=1$，故圆方程为 $x^2+y^2+m x+y-2=0$。
        令 $x=0$，得 $y^2+y-2=(y-1)(y+2)=0$。因此圆与 $y$ 轴的交点恒为 $(0,1)$、$(0,-2)$，弦长恒为 $3$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=ln x+a x^2+(2a+1)x$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性。],
      answers: (
        [当 $a>=0$ 时，在 $(0,+infinity)$ 上单调递增；当 $a<0$ 时，在 $(0,-1/(2a))$ 上单调递增，在 $(-1/(2a),+infinity)$ 上单调递减。],
      ),
      explanation: [定义域为 $(0,+infinity)$，
        $ f'(x)=1/x+2a x+2a+1=((x+1)(2a x+1))/x. $
        若 $a>=0$，则 $f'(x)>0$，故在整个定义域上递增。若 $a<0$，导数在 $0<x< -1/(2a)$ 时为正，在 $x> -1/(2a)$ 时为负，从而得到所述单调区间。],
    ),
    subquestion(
      stem: [当 $a<0$ 时，证明 $f(x)<=-3/(4a)-2$。],
      answers: ([证明见解析。],),
      explanation: [由第（1）问，函数在 $x=-1/(2a)$ 处取得最大值。令 $t=-1/(2a)>0$，则
        $ f(x)<=f(t)=ln t+t/2-1. $
        对任意 $t>0$，$ln t<=t-1$：设 $h(t)=t-1-ln t$，则 $h'(t)=(t-1)/t$，故 $h$ 在 $t=1$ 处取最小值 $0$。因此
        $ f(x)<=t-1+t/2-1=3t/2-2=-3/(4a)-2. $
        当且仅当 $a=-1/2$ 且 $x=1$ 时等号成立。],
    ),
  ),
)
选考题：请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。
#question(
  "solution",
  score: 10,
  stem: [在直角坐标系 $x O y$ 中，直线 $l_1$ 的参数方程为 $cases(x=2+t, y=k t)$（$t$ 为参数），直线 $l_2$ 的参数方程为 $cases(x=-2+m, y=m/k)$（$m$ 为参数）。设 $l_1$ 与 $l_2$ 的交点为 $P$，当 $k$ 变化时，$P$ 的轨迹为曲线 $C$。],
  parts: (
    subquestion(
      stem: [写出 $C$ 的普通方程。],
      answers: ([$x^2-y^2=4$（$y!=0$）],),
      explanation: [消去参数得 $y=k(x-2)$、$k y=x+2$。其中 $k!=0$，且 $k=plus.minus 1$ 时两直线平行，无交点。将两式相乘，约去非零的 $k$ 得 $y^2=(x-2)(x+2)$。若 $y=0$，两式分别要求 $x=2$ 和 $x=-2$，矛盾，故 $y!=0$。反之，双曲线上任意 $y!=0$ 的点均可取 $k=y/(x-2)$，此时 $k!=0,plus.minus 1$，且满足两条直线方程，所以轨迹为 $x^2-y^2=4$（$y!=0$）。],
    ),
    subquestion(
      stem: [以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，设 $l_3:rho(cos theta+sin theta)-sqrt(2)=0$，$M$ 为 $l_3$ 与 $C$ 的交点，求 $M$ 的极径。],
      answers: ([$sqrt(5)$],),
      explanation: [直线 $l_3$ 的直角坐标方程为 $x+y=sqrt(2)$。与 $(x+y)(x-y)=4$ 联立得 $x-y=2sqrt(2)$，所以 $M=((3sqrt(2))/2,-sqrt(2)/2)$，满足 $y!=0$。其极径为 $rho=sqrt(x^2+y^2)=sqrt(5)$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [已知函数 $f(x)=abs(x+1)-abs(x-2)$。],
  parts: (
    subquestion(
      stem: [求不等式 $f(x)>=1$ 的解集。],
      answers: ([$[1,+infinity)$],),
      explanation: [将函数写为
        $ f(x)=cases(-3 quad &x<=-1, 2x-1 quad &-1<x<2, 3 quad &x>=2). $
        当 $x<=-1$ 时不成立；当 $-1<x<2$ 时要求 $x>=1$；当 $x>=2$ 时恒成立。故解集为 $[1,+infinity)$。],
    ),
    subquestion(
      stem: [若不等式 $f(x)>=x^2-x+m$ 的解集非空，求 $m$ 的取值范围。],
      answers: ([$(-infinity,5/4]$],),
      explanation: [原条件等价于 $m<=max_(x in RR)[f(x)-x^2+x]$。设 $g(x)=f(x)-x^2+x$，则
        $
          g(x)=cases(-x^2+x-3 quad &x<=-1, -x^2+3x-1 quad &-1<x<2, -x^2+x+3 quad &x>=2).
        $
        第一段最大值为 $g(-1)=-5$；第二段在 $x=3/2$ 处取得最大值 $5/4$；第三段最大值为 $g(2)=1$。所以全局最大值为 $5/4$，且能取到，故 $m in (-infinity,5/4]$。],
    ),
  ),
)
