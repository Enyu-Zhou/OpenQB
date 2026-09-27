#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017北京理.pdf",
  regions: ("北京",),
)
#let loop-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((-0.65, 0.3), (0.65, -0.3), radius: 0.15)
    content((0, 0), [开始])
    rect((-1.3, -1), (1.3, -1.7))
    content((0, -1.35), $k=0,s=1$)
    line((0, -4.2), (1.5, -4.8), (0, -5.4), (-1.5, -4.8), close: true)
    content((0, -4.8), $k<3$)
    rect((2.2, -3.1), (4, -3.8))
    content((3.1, -3.45), $k=k+1$)
    rect((2.2, -1.75), (4, -2.85))
    content((3.1, -2.3), $s=(s+1)/s$)
    line((-0.85, -6), (0.95, -6), (0.7, -6.7), (-1.1, -6.7), close: true)
    content((0, -6.35), [输出 $s$])
    rect((-0.65, -7.35), (0.65, -7.95), radius: 0.15)
    content((0, -7.65), [结束])
    for (a, b) in (
      ((0, -0.3), (0, -1)),
      ((0, -1.7), (0, -4.2)),
      ((0, -5.4), (0, -6)),
      ((0, -6.7), (0, -7.35)),
      ((3.1, -3.1), (3.1, -2.85)),
    ) { line(a, b, mark: (end: ">")) }
    line((1.5, -4.8), (3.1, -4.8), (3.1, -3.8), mark: (end: ">"))
    line((2.2, -2.3), (0, -2.3), mark: (end: ">"))
    content((1.8, -4.7), [是], anchor: "south")
    content((0.15, -5.6), [否], anchor: "west")
  })
}
#let three-views() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((0, 0), (2, 0), (2, 2), close: true)
  rect((3.5, 0), (5.5, 2))
  line((3.5, 0), (5.5, 2))
  line((0, -1.5), (2, -1.5), (2, -3.5), close: true)
  for (x, label) in ((1, [正（主）视图]), (4.5, [侧（左）视图])) {
    content((x, -0.7), label)
  }
  content((1, -4), [俯视图])
  for (x1, x2) in ((0, 2), (3.5, 5.5)) {
    line((x1, -0.22), (x2, -0.22), mark: (start: ">", end: ">"))
    for x in (x1, x2) { line((x, -0.05), (x, -0.4)) }
    content(
      ((x1 + x2) / 2, -0.25),
      $2$,
      frame: "rect",
      fill: white,
      stroke: none,
      padding: 1pt,
    )
  }
  line((2.25, 0), (2.25, 2), mark: (start: ">", end: ">"))
  line((2.05, 0), (2.4, 0))
  line((2.05, 2), (2.4, 2))
  content(
    (2.25, 1),
    $2$,
    frame: "rect",
    fill: white,
    stroke: none,
    padding: 1pt,
  )
})
#let workers() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.15,
      shared-zero: $O$,
    ))
    plot.plot(
      size: (7, 5),
      axis-style: "school-book",
      x-min: 0,
      x-max: 3.2,
      y-min: 0,
      y-max: 2.3,
      x-tick-step: none,
      y-tick-step: none,
      x-label: [工作时间（小时）],
      y-label: [零件数（件）],
      {
        plot.annotate(resize: false, {
          for (p, label, anchor) in (
            ((1.0796, 1.967), $A_1$, "south-west"),
            ((0.4366, 0.7446), $A_2$, "south-east"),
            ((1.1748, 0.1968), $A_3$, "east"),
            ((2.3814, 0.4588), $B_1$, "west"),
            ((2.1432, 1.2844), $B_2$, "north"),
            ((2.8894, 1.459), $B_3$, "west"),
          ) {
            circle(p, radius: 0.025, fill: black, stroke: none)
            content(p, label, anchor: anchor, padding: 3pt)
          }
        })
      },
    )
  })
}
#let pyramid(auxiliary: false) = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  let a = (-2, 0, 0)
  let b = (-2, 4, 0)
  let c = (2, 4, 0)
  let d = (2, 0, 0)
  let p = (0, 0, calc.sqrt(2))
  let m = (-1, 2, calc.sqrt(2) / 2)
  oblique-project((-0.45, -0.4), (0.85, 0), (0, 1.1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, d, c, b, p)
    line(p, c)
    line(m, c)
    for (u, v) in ((p, a), (a, d), (a, b), (a, c), (b, d), (a, m)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    for (pt, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "west"),
      (c, $C$, "north"),
      (d, $D$, "north-east"),
      (p, $P$, "south"),
      (m, $M$, "south"),
    ) { content(pt, label, anchor: anchor, padding: 3pt) }
    if auxiliary {
      let e = (0, 2, 0)
      let o = (0, 0, 0)
      line(m, e, stroke: (dash: figure-style.dash))
      line(p, o, e, stroke: (dash: figure-style.dash))
      content(e, $E$, anchor: "north", padding: 3pt)
      content(o, $O$, anchor: "east", padding: 3pt)
    }
  })
})
#let patients() = {
  set text(size: 9pt)
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
      ),
    ))
    let groups = (
      (
        (0.80189, 54.07502),
        (0.85962, 97.54411),
        (0.45548, 85.91117),
        (0.42982, 79.78908),
        (0.51321, 82.85067),
        (0.41057, 71.83005),
        (0.45548, 67.54491),
        (0.55170, 66.93151),
        (0.64792, 65.09456),
        (0.69925, 54.68734),
        (0.62867, 49.17649),
        (0.65435, 47.95185),
        (0.78906, 49.78880),
        (0.83397, 49.17649),
        (0.89170, 46.11490),
        (0.89811, 51.62575),
        (0.78906, 65.09456),
        (0.77624, 74.27931),
        (0.83397, 71.83005),
        (0.82114, 79.78908),
        (0.87245, 90.19739),
        (0.93019, 70.60541),
        (0.95586, 82.23727),
        (0.93661, 53.46162),
        (0.97509, 63.86993),
        (0.98151, 92.03434),
        (1.01359, 68.76846),
        (1.05207, 66.31920),
        (1.01359, 52.85039),
        (1.09057, 51.01344),
        (1.17396, 56.52321),
        (1.12905, 65.70796),
        (1.13548, 73.05468),
        (1.16113, 77.95213),
        (1.18679, 69.38078),
        (1.27661, 47.34062),
        (1.26377, 77.33982),
        (1.19962, 96.32056),
        (1.29585, 85.29885),
        (1.28302, 68.76846),
        (1.37925, 55.91197),
        (1.37283, 76.11626),
        (1.42416, 87.13580),
        (1.42416, 94.48253),
        (1.50114, 86.52349),
        (1.65510, 93.87021),
        (1.67434, 83.46298),
        (1.72567, 83.46298),
        (1.89246, 88.36044),
        (2.02075, 57.74784),
      ),
      (
        (2.50831, 93.92313),
        (0.53245, 88.41227),
        (2.81624, 71.88296),
        (0.37208, 90.24922),
        (0.32075, 82.90250),
        (0.50679, 71.26957),
        (0.70567, 87.80104),
        (0.68642, 82.90250),
        (0.80189, 87.18872),
        (0.83396, 83.51482),
        (1.04566, 92.08618),
        (1.05849, 85.96409),
        (1.07773, 70.65725),
        (1.18038, 86.57640),
        (1.28302, 94.53544),
        (1.26378, 87.80104),
        (1.48189, 74.94347),
        (1.48189, 89.02567),
        (1.54604, 89.63691),
        (1.66793, 87.18872),
        (1.60378, 80.45432),
        (1.57170, 69.43262),
        (1.64227, 73.71883),
        (1.66151, 68.20798),
        (1.76416, 92.08618),
        (1.81548, 85.96409),
        (1.76416, 70.65725),
        (1.83472, 55.96381),
        (1.92453, 73.10652),
        (1.95019, 78.61737),
        (1.98227, 75.55578),
        (2.01435, 82.29019),
        (2.07850, 83.51482),
        (2.16831, 87.80104),
        (2.13623, 80.45432),
        (2.11056, 75.55578),
        (2.18755, 82.90250),
        (2.23245, 85.35069),
        (2.25170, 77.39273),
        (2.29020, 81.06555),
        (2.32869, 77.39273),
        (2.37359, 80.45432),
        (2.39284, 71.26957),
        (2.45058, 77.39273),
        (2.47623, 82.29019),
        (2.51472, 79.84092),
        (2.57246, 81.67787),
        (2.48907, 68.20798),
        (2.55963, 68.82138),
        (2.64302, 71.88296),
      ),
    )
    plot.plot(
      size: (12, 5),
      axis-style: "school-book",
      x-min: 0,
      x-max: 3.2,
      y-min: 0,
      y-max: 120,
      x-label: [指标 $x$],
      y-label: [指标 $y$],
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (1.7,),
      y-ticks: (60,),
      {
        plot.annotate(resize: false, {
          line((1.7, 0), (1.7, 120), stroke: (dash: figure-style.dash))
          line((0, 60), (3, 60), stroke: (dash: figure-style.dash))
          for (i, points) in groups.enumerate() {
            for (x, y) in points {
              let angles = if i == 0 { (30deg, 90deg, 150deg) } else {
                (0deg, 90deg)
              }
              for angle in angles {
                let dx = 0.024 * calc.cos(angle)
                let dy = 2.3 * calc.sin(angle)
                line((x - dx, y - dy), (x + dx, y + dy))
              }
            }
          }
        })
      },
    )
    for (p, label) in (
      ((9.44, 4.16), $A$),
      ((3.24, 4.32), $B$),
      ((10.65, 3.43), $C$),
      ((1.99, 3.95), $D$),
    ) { content(p, label, anchor: "south", padding: 2pt) }
  })
}

#section[选择题：共 8 小题，每小题 5 分，共 40 分。在每小题列出的四个选项中，选出符合题目要求的一项。]
#question(
  "single-choice",
  score: 5,
  stem: [若集合 $A={x|-2<x<1}$，$B={x|x< -1 #text[或] x>3}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${x|-2<x< -1}$], [${x|-2<x<3}$], [${x|-1<x<1}$], [${x|1<x<3}$]),
  answers: ([A],),
  explanation: [同时满足 $-2<x<1$ 与 $x< -1$ 或 $x>3$，只有 $-2<x< -1$，故选 A。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若复数 $(1-i)(a+i)$ 在复平面内对应的点在第二象限，则实数 $a$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$(-infinity,1)$],
    [$(-infinity,-1)$],
    [$(1,+infinity)$],
    [$(-1,+infinity)$],
  ),
  answers: ([B],),
  explanation: [$(1-i)(a+i)=a+1+(1-a)i$。第二象限要求 $a+1<0$ 且 $1-a>0$，故 $a< -1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图所示的程序框图，输出的 $s$ 值为#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$2$], [$3/2$], [$5/3$], [$8/5$]),
  answers: ([C],),
  explanation: [初始 $k=0,s=1$。三次循环后，$(k,s)$ 依次为 $(1,2)$、$(2,3/2)$、$(3,5/3)$，此时 $k<3$ 不成立，输出 $s=5/3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $x,y$ 满足 $cases(x<=3, x+y>=2, y<=x)$，则 $x+2y$ 的最大值为#choice-placeholder()。],
  choices: ([$1$], [$3$], [$5$], [$9$]),
  answers: ([D],),
  explanation: [由 $y<=x<=3$，得 $x+2y<=3x<=9$。当 $(x,y)=(3,3)$ 时满足所有约束且等号成立，故最大值为 $9$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=3^x-(1/3)^x$，则 $f(x)$#choice-placeholder()。],
  choices: (
    [是奇函数，且在 $RR$ 上是增函数],
    [是偶函数，且在 $RR$ 上是增函数],
    [是奇函数，且在 $RR$ 上是减函数],
    [是偶函数，且在 $RR$ 上是减函数],
  ),
  answers: ([A],),
  explanation: [定义域为 $RR$，且 $f(-x)=3^(-x)-3^x=-f(x)$，故为奇函数。$3^x$ 与 $-3^(-x)$ 都在 $RR$ 上严格递增，其和也严格递增。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $bold(m),bold(n)$ 为非零向量，则“存在负数 $lambda$，使得 $bold(m)=lambda bold(n)$”是“$bold(m) dot bold(n)<0$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [若 $bold(m)=lambda bold(n)$ 且 $lambda<0$，则 $bold(m) dot bold(n)=lambda abs(bold(n))^2<0$，充分性成立。反之，取 $bold(m)=(1,0)$、$bold(n)=(-1,1)$，数量积为 $-1$，但两向量不共线，不存在所述 $lambda$，故不是必要条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某四棱锥的三视图如图所示，则该四棱锥的最长棱的长度为#choice-placeholder()。
    #figure(three-views())],
  choices: ([$3sqrt(2)$], [$2sqrt(3)$], [$2sqrt(2)$], [$2$]),
  answers: ([B],),
  explanation: [由三视图还原：可把底面放在平面 $x=2$ 上，其四个顶点为 $(2,0,0)$、$(2,2,0)$、$(2,2,2)$、$(2,0,2)$，锥顶为 $(0,0,0)$。底面各棱长为 $2$，四条侧棱长依次为 $2,2sqrt(2),2sqrt(3),2sqrt(2)$，所以最长棱为 $2sqrt(3)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [根据有关资料，围棋状态空间复杂度的上限 $M$ 约为 $3^361$，而可观测宇宙中普通物质的原子总数 $N$ 约为 $10^80$，则下列各数中与 $M/N$ 最接近的是#choice-placeholder()。（参考数据：$lg 3 approx 0.48$）],
  choices: ([$10^33$], [$10^53$], [$10^73$], [$10^93$]),
  answers: ([D],),
  explanation: [$lg(M/N) approx 361lg 3-80 approx 361 times 0.48-80=93.28$，故最接近的是 $10^93$。],
)
#section[填空题：共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [若双曲线 $x^2-y^2/m=1$ 的离心率为 $sqrt(3)$，则实数 $m=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [方程表示双曲线要求 $m>0$。由 $a^2=1,b^2=m$，得 $e^2=(a^2+b^2)/a^2=1+m=3$，故 $m=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若等差数列 ${a_n}$ 和等比数列 ${b_n}$ 满足 $a_1=b_1=-1$，$a_4=b_4=8$，则 $a_2/b_2=$#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [等差数列的公差 $d=(8+1)/3=3$，故 $a_2=2$。等比数列的公比满足 $-q^3=8$，故 $q=-2$，$b_2=2$，所以 $a_2/b_2=1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在极坐标系中，点 $A$ 在圆 $rho^2-2rho cos theta-4rho sin theta+4=0$ 上，点 $P$ 的坐标为 $(1,0)$，则 $abs(A P)$ 的最小值为#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [圆的直角坐标方程为 $(x-1)^2+(y-2)^2=1$，圆心 $C=(1,2)$，半径为 $1$。$P$ 的直角坐标也为 $(1,0)$，故 $P C=2$，点到圆的最短距离为 $2-1=1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，角 $alpha$ 与角 $beta$ 均以 $O x$ 为始边，它们的终边关于 $y$ 轴对称，若 $sin alpha=1/3$，则 $cos(alpha-beta)=$#fill-placeholder()。],
  answers: ([$-7/9$],),
  explanation: [由对称关系，$sin beta=sin alpha$、$cos beta=-cos alpha$，故 $cos(alpha-beta)=-cos^2 alpha+sin^2 alpha=2sin^2 alpha-1=-7/9$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [能够说明“设 $a,b,c$ 是任意实数。若 $a>b>c$，则 $a+b>c$”是假命题的一组整数 $a,b,c$ 的值依次为#fill-placeholder()。],
  answers: ([$-1,-2,-3$（答案不唯一）],),
  explanation: [取 $a=-1,b=-2,c=-3$，有 $a>b>c$，但 $a+b=-3=c$，不满足 $a+b>c$，故构成反例。],
)
#question(
  "fill-in",
  score: 5,
  stem: [三名工人加工同一种零件，他们在一天中的工作情况如图所示，其中 $A_i$ 的横、纵坐标分别为第 $i$ 名工人上午的工作时间和加工的零件数，点 $B_i$ 的横、纵坐标分别为第 $i$ 名工人下午的工作时间和加工的零件数，$i=1,2,3$。
    #figure(workers())
    （1）记 $Q_i$ 为第 $i$ 名工人在这一天中加工的零件总数，则 $Q_1,Q_2,Q_3$ 中最大的是#fill-placeholder()；

    （2）记 $p_i$ 为第 $i$ 名工人在这一天中平均每小时加工的零件数，则 $p_1,p_2,p_3$ 中最大的是#fill-placeholder()。
  ],
  answers: ([$Q_1$], [$p_2$]),
  explanation: [设 $A_i B_i$ 的中点为 $H_i$，其纵坐标为 $Q_i/2$，而直线 $O H_i$ 的斜率为总零件数与总工作时间之比，即 $p_i$。由图作各线段中点后比较，$H_1$ 最高，$O H_2$ 的斜率最大，所以两空分别为 $Q_1$、$p_2$。],
)
#section[解答题：共 6 小题，共 80 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [在 $triangle A B C$ 中，$angle A=60 degree$，$c=3/7 a$。],
  parts: (
    subquestion(
      stem: [求 $sin C$ 的值。],
      answers: ([$(3sqrt(3))/14$],),
      explanation: [由正弦定理，$sin C=c/a sin A=3/7 times sqrt(3)/2=(3sqrt(3))/14$。],
    ),
    subquestion(
      stem: [若 $a=7$，求 $triangle A B C$ 的面积。],
      answers: ([$6sqrt(3)$],),
      explanation: [由题意 $c=3$，余弦定理给出 $49=b^2+9-3b$，即 $(b-8)(b+5)=0$。由 $b>0$ 得 $b=8$，故 $S_(triangle A B C)=1/2 b c sin A=1/2 times 8 times 3 times sqrt(3)/2=6sqrt(3)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在四棱锥 $P-A B C D$ 中，底面 $A B C D$ 为正方形，平面 $P A D perp$ 平面 $A B C D$，点 $M$ 在线段 $P B$ 上，$P D parallel$ 平面 $M A C$，$P A=P D=sqrt(6)$，$A B=4$。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [求证：$M$ 为 $P B$ 的中点。],
      answers: ([证明见解析。],),
      explanation: [设 $A C inter B D={E}$，连接 $M E$。因为 $P D parallel$ 平面 $M A C$，而平面 $P B D$ 与平面 $M A C$ 的交线为 $M E$，所以 $M E parallel P D$。正方形的对角线互相平分，故 $E$ 是 $B D$ 中点，由三角形中位线性质得 $M$ 是 $P B$ 中点。
        #figure(pyramid(auxiliary: true))],
    ),
    subquestion(
      stem: [求二面角 $B-P D-A$ 的大小。],
      answers: ([$60 degree$],),
      explanation: [#step[建立坐标系][取 $A D$ 中点 $O$。由等腰三角形性质及面面垂直，$P O perp$ 平面 $A B C D$，且 $P O=sqrt(6-2^2)=sqrt(2)$。以 $O$ 为原点，$O D$、$O E$、$O P$ 的方向分别为 $x,y,z$ 轴正向，则
          $ A=(-2,0,0),quad D=(2,0,0),quad B=(-2,4,0),quad P=(0,0,sqrt(2)). $]
        #step[确定二面角][平面 $P B D$ 的一个法向量为 $bold(n)=(1,1,sqrt(2))$，平面 $P A D$ 的一个法向量为 $bold(v)=(0,1,0)$。两法向量夹角余弦为 $1/2$。为确定二面角的锐钝，令 $bold(d)=arrow(P D)=(2,0,-sqrt(2))$，将 $arrow(P A)$、$arrow(P B)$ 投影到垂直 $bold(d)$ 的平面，得
          $
            bold(u)=(-4/3,0,-(4sqrt(2))/3),quad bold(w)=(-4/3,4,-(4sqrt(2))/3).
          $
          $bold(u) dot bold(w)=16/3>0$，故所求二面角为锐角，其大小为 $60 degree$。]],
    ),
    subquestion(
      stem: [求直线 $M C$ 与平面 $B D P$ 所成角的正弦值。],
      answers: ([$(2sqrt(6))/9$],),
      explanation: [沿用第（2）问坐标，$M=(-1,2,sqrt(2)/2)$、$C=(2,4,0)$，故 $arrow(M C)=(3,2,-sqrt(2)/2)$。设所求角为 $theta$，则
        $
          sin theta=abs(bold(n) dot arrow(M C))/(abs(bold(n)) abs(arrow(M C)))=4/(2 times sqrt(27/2))=(2sqrt(6))/9.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [为了研究一种新药的疗效，选 $100$ 名患者随机分成两组，每组各 $50$ 名，一组服药，另一组不服药。一段时间后，记录了两组患者的生理指标 $x$ 和 $y$ 的数据，并制成如图，其中“$ast$”表示服药者，“$+$”表示未服药者。
    #figure(patients())],
  parts: (
    subquestion(
      stem: [从服药的 $50$ 名患者中随机选出一人，求此人指标 $y$ 的值小于 $60$ 的概率。],
      answers: ([$0.3$],),
      explanation: [图中服药者的 $50$ 个标记中，位于 $y=60$ 下方的有 $15$ 个，故所求概率为 $15/50=0.3$。],
    ),
    subquestion(
      stem: [从图中 $A,B,C,D$ 四人中随机选出两人，记 $xi$ 为选出的两人中指标 $x$ 的值大于 $1.7$ 的人数，求 $xi$ 的分布列和数学期望 $E(xi)$。],
      answers: ([分布列见解析，$E(xi)=1$。],),
      explanation: [四人中 $A,C$ 的 $x$ 大于 $1.7$，$B,D$ 的 $x$ 小于 $1.7$。从四人中选两人共有 $C_4^2=6$ 种等可能选法，$xi=0,1,2$ 分别有 $1,4,1$ 种，故分布列为：
        #table(
          columns: 4,
          align: center,
          [$xi$], [$0$], [$1$], [$2$],
          [$P$], [$1/6$], [$2/3$], [$1/6$],
        )
        于是 $E(xi)=0 times 1/6+1 times 2/3+2 times 1/6=1$。],
    ),
    subquestion(
      stem: [试判断这 $100$ 名患者中服药者指标 $y$ 数据的方差与未服药者指标 $y$ 数据的方差的大小。（只需写出结论）],
      answers: ([服药者的方差大于未服药者的方差。],),
      explanation: [服药组在纵向上的数据更分散，未服药组相对集中，故服药者指标 $y$ 的方差较大。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知抛物线 $C:y^2=2p x$ 过点 $P(1,1)$。过点 $(0,1/2)$ 作直线 $l$ 与抛物线 $C$ 交于不同的两点 $M,N$，过点 $M$ 作 $x$ 轴的垂线分别与直线 $O P,O N$ 交于点 $A,B$，其中 $O$ 为原点。],
  parts: (
    subquestion(
      stem: [求抛物线 $C$ 的方程，并求其焦点坐标和准线方程。],
      answers: ([$y^2=x$；焦点 $(1/4,0)$；准线 $x=-1/4$。],),
      explanation: [代入 $P=(1,1)$ 得 $2p=1$，故 $p=1/2$，抛物线方程为 $y^2=x$。焦点为 $(p/2,0)=(1/4,0)$，准线为 $x=-p/2=-1/4$。],
    ),
    subquestion(
      stem: [求证：$A$ 为线段 $B M$ 的中点。],
      answers: ([证明见解析。],),
      explanation: [竖直线 $x=0$ 或水平线 $y=1/2$ 均不能与抛物线交于两个不同点，故可设 $l:y=k x+1/2$，其中 $k!=0$。设 $M=(y_1^2,y_1)$、$N=(y_2^2,y_2)$，则 $k y^2-y+1/2=0$，从而
        $ y_1+y_2=1/k,quad y_1 y_2=1/(2k),quad y_1+y_2=2y_1 y_2. $
        $O P$ 的方程为 $y=x$，故 $A=(y_1^2,y_1^2)$。由 $y_2!=0$，直线 $O N$ 的方程为 $y=x/y_2$，故 $B=(y_1^2,y_1^2/y_2)$。于是
        $ (y_1+y_1^2/y_2)/2=(y_1(y_1+y_2))/(2y_2)=y_1^2. $
        三点横坐标相同，且 $A$ 的纵坐标是 $B,M$ 纵坐标的平均数，故 $A$ 为 $B M$ 的中点。],
    ),
  ),
)
#question("solution", score: 13, stem: [已知函数 $f(x)=e^x cos x-x$。], parts: (
  subquestion(
    stem: [求曲线 $y=f(x)$ 在点 $(0,f(0))$ 处的切线方程。],
    answers: ([$y=1$],),
    explanation: [$f'(x)=e^x (cos x-sin x)-1$，故 $f(0)=1$、$f'(0)=0$。切线方程为 $y=1$。],
  ),
  subquestion(
    stem: [求函数 $f(x)$ 在区间 $[0,pi/2]$ 上的最大值和最小值。],
    answers: ([最大值为 $1$，最小值为 $-pi/2$。],),
    explanation: [设 $g(x)=f'(x)$，则 $g'(x)=-2e^x sin x$。在 $(0,pi/2)$ 上，$g'(x)<0$，故 $g$ 严格递减。又 $g(0)=0$，所以 $f'(x)<0$（$0<x<=pi/2$），因此 $f$ 在 $[0,pi/2]$ 上严格递减。故最大值为 $f(0)=1$，最小值为 $f(pi/2)=-pi/2$。],
  ),
))
#question(
  "solution",
  score: 13,
  stem: [设 ${a_n}$ 和 ${b_n}$ 是两个等差数列，记 $c_n=max{b_1-a_1 n,b_2-a_2 n,dots,b_n-a_n n}$（$n=1,2,3,dots$），其中 $max{x_1,x_2,dots,x_s}$ 表示 $x_1,x_2,dots,x_s$ 这 $s$ 个数中最大的数。],
  parts: (
    subquestion(
      stem: [若 $a_n=n$，$b_n=2n-1$，求 $c_1,c_2,c_3$ 的值，并证明 ${c_n}$ 是等差数列。],
      answers: ([$c_1=0,c_2=-1,c_3=-2$；${c_n}$ 是公差为 $-1$ 的等差数列。],),
      explanation: [固定 $n$，有 $b_k-n a_k=(2-n)k-1$（$1<=k<=n$）。当 $n=1$ 时 $c_1=0$；当 $n=2$ 时两项均为 $-1$；当 $n>=3$ 时，该式随 $k$ 递减，最大值在 $k=1$ 处取得，故 $c_n=1-n$。因此对所有正整数 $n$，都有 $c_n=1-n$，结论成立。],
    ),
    subquestion(
      stem: [证明：或者对任意正数 $M$，存在正整数 $m$，当 $n>=m$ 时，$c_n/n>M$；或者存在正整数 $m$，使得 $c_m,c_(m+1),c_(m+2),dots$ 是等差数列。],
      answers: ([证明见解析。],),
      explanation: [#step[化简最大值][设两数列公差分别为 $d_1,d_2$。固定 $n$，则
          $ b_k-n a_k=b_1-a_1 n+(k-1)(d_2-n d_1). $
          它关于 $k$ 为一次式，所以
          $ c_n=b_1-a_1 n+(n-1)max{d_2-n d_1,0}. $]
        #step[公差 d₁ 非负][若 $d_1>0$，取正整数 $m>d_2/d_1$，则对 $n>=m$ 有 $c_n=b_1-a_1 n$，其尾部为等差数列。
          若 $d_1=0$，则 $c_n=b_1-a_1 n+(n-1)max{d_2,0}$，整个数列为等差数列。]
        #step[公差 d₁ 为负][当 $d_1<0$ 且 $n>d_2/d_1$ 时，有 $d_2-n d_1>0$，故
          $ c_n/n=(-d_1)n+d_1+d_2-a_1+(b_1-d_2)/n. $
          记 $K=abs(d_1+d_2-a_1)+abs(b_1-d_2)$，则对 $n>=1$ 有 $c_n/n>=(-d_1)n-K$。给定任意 $M>0$，取正整数
          $ m>max{1,d_2/d_1,(M+K)/(-d_1)}. $
          当 $n>=m$ 时即有 $c_n/n>=(-d_1)n-K>M$。三种情况覆盖所有可能，命题得证。]],
    ),
  ),
)
