#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020全国1文(河南,河北,山西,江西,湖北,湖南,广东,安徽,福建).pdf",
  regions: (
    "河南",
    "河北",
    "山西",
    "江西",
    "湖北",
    "湖南",
    "广东",
    "安徽",
    "福建",
  ),
)
#let pyramid-diagram() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  let h = calc.sqrt((1 + calc.sqrt(5)) / 2)
  let a = (-1, -1, 0)
  let b = (1, -1, 0)
  let c = (1, 1, 0)
  let d = (-1, 1, 0)
  let p = (0, 0, h)
  oblique-project((1, 0), (0.45, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, a, b, c, p, b)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(p, d, stroke: (dash: figure-style.dash))
  })
})
#let scatter-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: $0$,
    x: (label: (anchor: "west", offset: 0.25)),
    y: (label: (anchor: "south", offset: 0.2)),
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
    grid: (stroke: (paint: black, thickness: figure-style.thickness)),
  ))
  let points = (
    (10, 0.44),
    (11, 0.51),
    (12, 0.60),
    (13, 0.65),
    (14, 0.67),
    (15, 0.65),
    (16.5, 0.70),
    (18, 0.73),
    (20, 0.74),
    (21, 0.78),
    (22, 0.77),
    (23.5, 0.79),
    (25, 0.81),
    (26, 0.76),
    (27, 0.80),
    (28.5, 0.80),
    (30, 0.83),
    (32, 0.81),
    (34, 0.81),
    (35, 0.85),
  )
  plot.plot(
    size: (7, 3.4),
    axis-style: "school-book",
    x-min: 0,
    x-max: 40,
    y-min: 0,
    y-max: 1,
    x-label: move(dx: 8pt)[温度/$degree "C"$],
    y-label: move(dy: -3pt)[发芽率],
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (10, 20, 30, 40),
    y-ticks: (
      (0.2, [$20%$]),
      (0.4, [$40%$]),
      (0.6, [$60%$]),
      (0.8, [$80%$]),
      (1, [$100%$]),
    ),
    y-grid: true,
    {
      plot.add(
        points,
        mark: "square",
        mark-size: 0.10,
        style: (stroke: none),
        mark-style: (fill: black, stroke: none),
      )
    },
  )
})
#let cosine-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: move(dx: -5pt)[$O$],
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (7, 3),
    axis-style: "school-book",
    x-min: -3.8,
    x-max: 3.8,
    y-min: -1.35,
    y-max: 1.35,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (
      (-calc.pi, move(dy: -16pt)[$-pi$]),
      (-4 * calc.pi / 9, move(dx: 6pt, dy: 5pt)[$-4pi/9$]),
      (calc.pi, move(dy: -16pt)[$pi$]),
    ),
    {
      plot.add(
        x => calc.cos((1.5 * x + calc.pi / 6) * 1rad),
        domain: (-calc.pi, calc.pi),
        samples: 160,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
    },
  )
})
#let flowchart() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  rect((-0.6, 5.3), (0.6, 5.8), radius: 0.2)
  content((0, 5.55), [开始])
  line((-2, 4.4), (1.8, 4.4), (2, 4.9), (-1.8, 4.9), close: true)
  content((0, 4.65), [输入 $n=1,S=0$])
  rect((-1.15, 3.25), (1.15, 3.75))
  content((0, 3.5), [$S=S+n$])
  line((0, 2.8), (1.4, 2.3), (0, 1.8), (-1.4, 2.3), close: true)
  content((0, 2.3), [$S<=100$])
  rect((-3.8, 3.25), (-1.8, 3.75))
  content((-2.8, 3.5), [$n=n+2$])
  line((-0.95, 0.85), (0.75, 0.85), (0.95, 1.35), (-0.75, 1.35), close: true)
  content((0, 1.1), [输出 $n$])
  rect((-0.6, -0.05), (0.6, 0.45), radius: 0.2)
  content((0, 0.2), [结束])
  for (a, b) in (
    (5.3, 4.9),
    (4.4, 3.75),
    (3.25, 2.8),
    (1.8, 1.35),
    (0.85, 0.45),
  ) {
    line((0, a), (0, b), mark: (end: ">"))
  }
  line((-1.4, 2.3), (-2.8, 2.3), (-2.8, 3.25), mark: (end: ">"))
  line((-2.8, 3.75), (-2.8, 4.05), (-0.3, 4.05), mark: (end: ">"))
  line((-0.3, 4.05), (0, 4.05))
  content((-1.75, 2.4), [是], anchor: "south")
  content((0.15, 1.57), [否], anchor: "west")
})
#let cone-diagram() = cetz.canvas(length: 28mm, {
  import cetz.draw: *
  let h = calc.sqrt(2)
  let a = (-calc.sqrt(3) / 2, -0.5, 0)
  let b = (calc.sqrt(3) / 2, -0.5, 0)
  let c = (0, 1, 0)
  let o = (0, 0, 0)
  let d = (0, 0, h)
  let p = (0, 0, 1 / calc.sqrt(2))
  let delta = calc.atan(0.15)
  let alpha = calc.asin(0.35 / (1.1 * h * calc.sqrt(1 + 0.15 * 0.15)))
  let t1 = delta + alpha
  let t2 = delta + 180deg - alpha
  let rim(t) = (calc.cos(t), calc.sin(t), 0)
  let arc-points(start, end) = range(0, 101).map(i => rim(
    start + (end - start) * i / 100,
  ))
  oblique-project((1, 0), (0.15, 0.35), (0, 1.1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(rim(t1), d, rim(t2))
    line(..arc-points(t2, t1 + 360deg))
    line(..arc-points(t1, t2), stroke: (dash: figure-style.dash))
    line(d, o, stroke: (dash: figure-style.dash))
    line(a, b, c, a, stroke: (dash: figure-style.dash))
    line(a, p, b, stroke: (dash: figure-style.dash))
    line(c, p, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "south-west"),
      (o, $O$, "north-west"),
      (d, $D$, "south"),
      (p, $P$, "east"),
    ) {
      content(point, label, anchor: anchor, padding: if point == c {
        12pt
      } else { 3pt })
    }
  })
})
#let absolute-diagram(solved: false) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  let ticks = range(-7, 8)
    .filter(v => v != 0)
    .map(v => (v, if v == 1 { $1$ } else { [] }))
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: if solved { move(dx: -12pt)[$O$] } else { $O$ },
    x: (label: (anchor: "west", offset: 0.15)),
    y: (label: (anchor: "south", offset: 0.15)),
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
    grid: (stroke: (paint: luma(65%), thickness: figure-style.thickness)),
  ))
  plot.plot(
    size: (7, 7),
    axis-style: "school-book",
    x-min: -7,
    x-max: 7,
    y-min: -7,
    y-max: 7,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: if solved { (1,) } else { ticks },
    y-ticks: if solved { () } else { ticks },
    x-grid: not solved,
    y-grid: not solved,
    {
      plot.annotate(resize: false, {})
      if solved {
        plot.add(((-7, 4), (-1 / 3, -8 / 3), (1, 4), (4, 7)), style: (
          stroke: (paint: black, thickness: figure-style.thickness),
        ))
        plot.annotate(resize: false, {
          content((-2.8, -4), $(-1/3,-8/3)$)
          content((3, 3.6), $(1,4)$)
        })
      }
    },
  )
})


#section[选择题：本大题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A=\{x | x^2-3x-4<0\},B=\{-4,1,3,5\}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([$\{-4,1\}$], [$\{1,5\}$], [$\{3,5\}$], [$\{1,3\}$]),
  answers: ([D],),
  explanation: [由 $(x-4)(x+1)<0$ 得 $A=(-1,4)$，故 $A inter B=\{1,3\}$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [若 $z=1+2i+i^3$，则 $|z|=$#choice-placeholder()。],
  choices: ([$0$], [$1$], [$sqrt(2)$], [$2$]),
  answers: ([C],),
  explanation: [$i^3=-i$，故 $z=1+i$，$|z|=sqrt(1^2+1^2)=sqrt(2)$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [埃及胡夫金字塔是古代世界建筑奇迹之一，它的形状可视为一个正四棱锥，以该四棱锥的高为边长的正方形面积等于该四棱锥一个侧面三角形的面积，则其侧面三角形底边上的高与底面正方形的边长的比值为#choice-placeholder()。#figure(pyramid-diagram())],
  choices: (
    [$(sqrt(5)-1)/4$],
    [$(sqrt(5)-1)/2$],
    [$(sqrt(5)+1)/4$],
    [$(sqrt(5)+1)/2$],
  ),
  answers: ([C],),
  explanation: [设底面边长为 $s$，侧面三角形底边上的高为 $l$，棱锥高为 $h$，则 $h^2=l^2-s^2/4$。由题意，$h^2=1/2 s l$，故 $4(l/s)^2-2l/s-1=0$。因 $l/s>0$，得 $l/s=(1+sqrt(5))/4$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $O$ 为正方形 $A B C D$ 的中心，在 $O,A,B,C,D$ 中任取 3 点，则取到的 3 点共线的概率为#choice-placeholder()。],
  choices: ([$1/5$], [$2/5$], [$1/2$], [$4/5$]),
  answers: ([A],),
  explanation: [共有 $binom(5, 3)=10$ 种等可能的取法。仅 $\{A,O,C\}$ 与 $\{B,O,D\}$ 两组共线，故概率为 $2/10=1/5$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [某校一个课外学习小组为研究某作物种子的发芽率 $y$ 和温度 $x$（单位：$degree "C"$）的关系，在 20 个不同的温度条件下进行种子发芽实验，由实验数据 $(x_i,y_i)$（$i=1,2,dots,20$）得到下面的散点图：#figure(scatter-diagram())由此散点图，在 $10degree "C"$ 至 $40degree "C"$ 之间，下面四个回归方程类型中最适宜作为发芽率 $y$ 和温度 $x$ 的回归方程类型的是#choice-placeholder()。],
  choices: ([$y=a+b x$], [$y=a+b x^2$], [$y=a+b e^x$], [$y=a+b ln x$]),
  answers: ([D],),
  explanation: [散点呈现随温度升高而上升、但上升速度逐渐减小的趋势。直线的斜率不变；$a+b x^2$ 与 $a+b e^x$ 若递增，则上升速度均逐渐增大；$a+b ln x$ 在 $b>0,x>0$ 时递增且斜率 $b/x$ 逐渐减小，最符合图示趋势。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知圆 $x^2+y^2-6x=0$，过点 $(1,2)$ 的直线被该圆所截得的弦的长度的最小值为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([B],),
  explanation: [圆心 $C(3,0)$，半径 $r=3$。设 $P(1,2)$，则 $C P=2sqrt(2)<3$。过 $P$ 的直线到圆心的距离 $d<=C P$，当直线垂直于 $C P$ 时取等号。因此弦长 $2sqrt(9-d^2)$ 的最小值为 $2sqrt(9-8)=2$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=cos(omega x+pi/6)$ 在 $[-pi,pi]$ 的图象大致如下图，则 $f(x)$ 的最小正周期为#choice-placeholder()。#figure(cosine-diagram())],
  choices: ([$10pi/9$], [$7pi/6$], [$4pi/3$], [$3pi/2$]),
  answers: ([C],),
  explanation: [图象在 $x=0$ 附近递减，而 $f'(0)=-omega/2$，故 $omega>0$。图中 $x=-4pi/9$ 是原点左侧最近的零点，因此相位为 $-pi/2$，即 $-4pi/9 omega+pi/6=-pi/2$。解得 $omega=3/2$，所以最小正周期 $T=2pi/omega=4pi/3$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $a log_3 4=2$，则 $4^(-a)=$#choice-placeholder()。],
  choices: ([$1/16$], [$1/9$], [$1/8$], [$1/6$]),
  answers: ([B],),
  explanation: [$a log_3 4=log_3(4^a)=2$，故 $4^a=9$，所以 $4^(-a)=1/9$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [执行下面的程序框图，则输出的 $n=$#choice-placeholder()。#figure(flowchart())],
  choices: ([$17$], [$19$], [$21$], [$23$]),
  answers: ([C],),
  explanation: [第 $k$ 次累加时，$n=2k-1$，$S=1+3+dots+(2k-1)=k^2$。当 $k=10$ 时，$S=100$，仍继续循环；当 $k=11$ 时，$S=121>100$，退出并输出 $n=21$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $\{a_n\}$ 是等比数列，且 $a_1+a_2+a_3=1$，$a_2+a_3+a_4=2$，则 $a_6+a_7+a_8=$#choice-placeholder()。],
  choices: ([$12$], [$24$], [$30$], [$32$]),
  answers: ([D],),
  explanation: [设公比为 $q$，则 $2=a_2+a_3+a_4=q(a_1+a_2+a_3)=q$。因此 $a_6+a_7+a_8=q^5(a_1+a_2+a_3)=32$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $F_1,F_2$ 是双曲线 $C:x^2-y^2/3=1$ 的两个焦点，$O$ 为坐标原点，点 $P$ 在 $C$ 上且 $|O P|=2$，则 $triangle P F_1 F_2$ 的面积为#choice-placeholder()。],
  choices: ([$7/2$], [$3$], [$5/2$], [$2$]),
  answers: ([B],),
  explanation: [焦点为 $F_1(-2,0),F_2(2,0)$。设 $P(x,y)$，由 $x^2+y^2=4$ 与 $x^2-y^2/3=1$ 相减，得 $4y^2/3=3$，故 $|y|=3/2$。所以面积为 $1/2 times 4 times 3/2=3$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知 $A,B,C$ 为球 $O$ 的球面上的三个点，圆 $O_1$ 为 $triangle A B C$ 的外接圆。若圆 $O_1$ 的面积为 $4pi$，$A B=B C=A C=O O_1$，则球 $O$ 的表面积为#choice-placeholder()。],
  choices: ([$64pi$], [$48pi$], [$36pi$], [$32pi$]),
  answers: ([A],),
  explanation: [圆 $O_1$ 的半径为 $2$。由正弦定理，正三角形的边长 $A B=2 times 2sin 60degree=2sqrt(3)$，故 $O O_1=2sqrt(3)$。球心在截面圆圆心的垂线上，球半径满足 $R^2=O O_1^2+O_1 A^2=12+4=16$，所以球的表面积为 $4pi R^2=64pi$。],
)

#section[填空题：本大题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(2x+y-2<=0, x-y-1>=0, y+1>=0)$，则 $z=x+7y$ 的最大值为#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [由约束条件，$2x+y<=2,x-y>=1$，故 $z=8/3(2x+y)-13/3(x-y)<=16/3-13/3=1$。当 $(x,y)=(1,0)$ 时满足所有约束且等号成立，故最大值为 $1$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设向量 $bold(a)=(1,-1),bold(b)=(m+1,2m-4)$，若 $bold(a) perp bold(b)$，则 $m=$#fill-placeholder()。],
  answers: ([$5$],),
  explanation: [由 $bold(a) dot bold(b)=0$，得 $(m+1)-(2m-4)=0$，解得 $m=5$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [曲线 $y=ln x+x+1$ 的一条切线的斜率为 $2$，则该切线的方程为#fill-placeholder()。],
  answers: ([$y=2x$],),
  explanation: [函数的定义域为 $(0,+infinity)$，导数为 $1/x+1$。令 $1/x+1=2$，得切点横坐标 $x=1$，纵坐标 $y=2$，故切线方程为 $y-2=2(x-1)$，即 $y=2x$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [数列 $\{a_n\}$ 满足 $a_(n+2)+(-1)^n a_n=3n-1$，前 $16$ 项和为 $540$，则 $a_1=$#fill-placeholder()。],
  answers: ([$7$],),
  explanation: [#step[分别计算奇数项与偶数项的和][当 $n$ 为奇数时，$a_(n+2)-a_n=3n-1$，因此
      $ a_(2k-1)=a_1+sum_(j=1)^(k-1)(6j-4)=a_1+3k^2-7k+4. $
      所以前 $8$ 个奇数项的和为 $8a_1+392$。
      当 $n$ 为偶数时，$a_(n+2)+a_n=3n-1$。依次取 $n=2,6,10,14$，得前 $8$ 个偶数项的和为 $5+17+29+41=92$。]
    #step[利用总和求首项][$8a_1+392+92=540$，解得 $a_1=7$。]],
)

#section[解答题：共 70 分。第 17 至 21 题为必考题，每题 12 分；第 22、23 题为选考题。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 12,
  stem: [某厂接受了一项加工业务，加工出来的产品（单位：件）按标准分为 $A,B,C,D$ 四个等级。加工业务约定：对于 $A$ 级品、$B$ 级品、$C$ 级品，厂家每件分别收取加工费 90 元、50 元、20 元；对于 $D$ 级品，厂家每件要赔偿原料损失费 50 元。该厂有甲、乙两个分厂可承接加工业务。甲分厂加工成本费为 25 元/件，乙分厂加工成本费为 20 元/件。厂家为决定由哪个分厂承接加工业务，在两个分厂各试加工了 100 件这种产品，并统计了这些产品的等级，整理如下：
    #grid(
      columns: (auto, auto),
      gutter: 1cm,
      block(breakable: false)[甲分厂产品等级的频数分布表
        #table(
          columns: 5,
          align: center,
          [等级], [$A$], [$B$], [$C$], [$D$],
          [频数], [40], [20], [20], [20],
        )],
      block(breakable: false)[乙分厂产品等级的频数分布表
        #table(
          columns: 5,
          align: center,
          [等级], [$A$], [$B$], [$C$], [$D$],
          [频数], [28], [17], [34], [21],
        )],
    )],
  parts: (
    subquestion(
      stem: [分别估计甲、乙两分厂加工出来的一件产品为 $A$ 级品的概率；],
      answers: ([甲为 $0.4$，乙为 $0.28$。],),
      explanation: [以样本频率估计概率。甲分厂为 $40/100=0.4$，乙分厂为 $28/100=0.28$。],
    ),
    subquestion(
      stem: [分别求甲、乙两分厂加工出来的 100 件产品的平均利润，以平均利润为依据，厂家应选哪个分厂承接加工业务？],
      answers: ([甲为 15 元/件，乙为 10 元/件；选甲分厂。],),
      explanation: [#step[计算每件产品的利润][甲分厂各等级产品的单件利润依次为 $65,25,-5,-75$ 元；乙分厂依次为 $70,30,0,-70$ 元。$D$ 级品既需赔偿原料损失，也需支付加工成本。]
        #step[按频数加权求平均][甲分厂的平均利润为
          $ frac(40 times 65+20 times 25-20 times 5-20 times 75, 100)=15 $
          元/件。乙分厂的平均利润为
          $ frac(28 times 70+17 times 30+34 times 0-21 times 70, 100)=10 $
          元/件。甲分厂平均利润更高，因此应选甲分厂承接加工业务。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$。已知 $B=150degree$。],
  parts: (
    subquestion(
      stem: [若 $a=sqrt(3)c,b=2sqrt(7)$，求 $triangle A B C$ 的面积；],
      answers: ([$sqrt(3)$。],),
      explanation: [由余弦定理，$b^2=a^2+c^2-2a c cos B=3c^2+c^2+3c^2=7c^2$。故 $c=2,a=2sqrt(3)$，面积为 $1/2 a c sin B=sqrt(3)$。],
    ),
    subquestion(
      stem: [若 $sin A+sqrt(3)sin C=sqrt(2)/2$，求 $C$。],
      answers: ([$15degree$。],),
      explanation: [∵ $A+C=30degree$，∴
        $
          sin A+sqrt(3)sin C=sin(30degree-C)+sqrt(3)sin C
          =1/2 cos C+sqrt(3)/2 sin C=sin(C+30degree).
        $
        又 $0degree<C<30degree$，故 $30degree<C+30degree<60degree$。由 $sin(C+30degree)=sqrt(2)/2$，得 $C+30degree=45degree$，所以 $C=15degree$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，$D$ 为圆锥的顶点，$O$ 是圆锥底面的圆心，$triangle A B C$ 是底面的内接正三角形，$P$ 为 $D O$ 上一点，$angle A P C=90degree$。#figure(cone-diagram())],
  parts: (
    subquestion(
      stem: [证明：平面 $P A B perp$ 平面 $P A C$；],
      answers: ([证明见解析。],),
      explanation: [∵ $P O perp$ 平面 $A B C$，且 $O A=O B=O C$，∴ $P A=P B=P C$。又 $A C=B C$，故 $triangle P A C$ 与 $triangle P B C$ 全等。
        由 $angle A P C=90degree$ 得 $P C perp P A,P C perp P B$。∵ $P A inter P B=P$，∴ $P C perp$ 平面 $P A B$。又 $P C subset$ 平面 $P A C$，故平面 $P A B perp$ 平面 $P A C$。],
    ),
    subquestion(
      stem: [设 $D O=sqrt(2)$，圆锥的侧面积为 $sqrt(3)pi$，求三棱锥 $P-A B C$ 的体积。],
      answers: ([$sqrt(6)/8$。],),
      explanation: [#step[求圆锥底面半径][设底面半径为 $r$，母线长为 $l$，则 $l^2=r^2+2$，$pi r l=sqrt(3)pi$。所以 $r^2(r^2+2)=3$，即 $(r^2-1)(r^2+3)=0$，故 $r=1,l=sqrt(3)$。]
        #step[求棱锥的高与体积][正三角形的边长 $A C=sqrt(3)r=sqrt(3)$。在等腰直角三角形 $A P C$ 中，$P A=(A C)/sqrt(2)=sqrt(6)/2$，因此
          $ P O=sqrt(P A^2-O A^2)=sqrt(2)/2. $
          底面积为 $S_(triangle A B C)=sqrt(3)/4 times 3=3sqrt(3)/4$，所以
          $ V_(P-A B C)=1/3 times 3sqrt(3)/4 times sqrt(2)/2=sqrt(6)/8. $]],
    ),
  ),
)
#question("solution", score: 12, stem: [已知函数 $f(x)=e^x-a(x+2)$。], parts: (
  subquestion(
    stem: [当 $a=1$ 时，讨论 $f(x)$ 的单调性；],
    answers: (
      [在 $(-infinity,0)$ 上单调递减，在 $(0,+infinity)$ 上单调递增。],
    ),
    explanation: [当 $a=1$ 时，$f'(x)=e^x-1$。$x<0$ 时导数为负，$x>0$ 时导数为正，故 $f$ 在 $(-infinity,0)$ 上单调递减，在 $(0,+infinity)$ 上单调递增。],
  ),
  subquestion(
    stem: [若 $f(x)$ 有两个零点，求 $a$ 的取值范围。],
    answers: ([$(1/e,+infinity)$。],),
    explanation: [#step[排除非正参数][当 $a<=0$ 时，$f'(x)=e^x-a>0$，$f$ 严格递增，至多有一个零点，不符合题意。]
      #step[判断正参数时的最小值][当 $a>0$ 时，$f'(x)=e^x-a$，故 $f$ 在 $(-infinity,ln a)$ 上严格递减，在 $(ln a,+infinity)$ 上严格递增，最小值为
        $ f(ln a)=a-a(ln a+2)=-a(ln a+1). $
        又当 $x arrow -infinity$ 或 $x arrow +infinity$ 时，$f(x) arrow +infinity$。因此恰有两个零点的充要条件为 $f(ln a)<0$，即 $ln a>-1$，解得 $a>1/e$。
        所以所求范围为 $(1/e,+infinity)$。]],
  ),
))
#question(
  "solution",
  score: 12,
  stem: [已知 $A,B$ 分别为椭圆 $E:x^2/a^2+y^2=1$（$a>1$）的左、右顶点，$G$ 为 $E$ 的上顶点，$arrow(A G) dot arrow(G B)=8$，$P$ 为直线 $x=6$ 上的动点，$P A$ 与 $E$ 的另一交点为 $C$，$P B$ 与 $E$ 的另一交点为 $D$。],
  parts: (
    subquestion(
      stem: [求 $E$ 的方程；],
      answers: ([$x^2/9+y^2=1$。],),
      explanation: [由 $A(-a,0),B(a,0),G(0,1)$，得 $arrow(A G)=(a,1),arrow(G B)=(a,-1)$，所以 $a^2-1=8$，得 $a=3$。故椭圆方程为 $x^2/9+y^2=1$。],
    ),
    subquestion(
      stem: [证明：直线 $C D$ 过定点。],
      answers: ([直线 $C D$ 恒过点 $(3/2,0)$，证明见解析。],),
      explanation: [#step[求出两交点的坐标][设 $P(6,t)$，则 $P A:y=t/9(x+3)$。与椭圆联立并除去对应点 $A$ 的因式，得
          $ (x+3)((t^2+9)x+3t^2-27)=0, $
          所以 $C(3(9-t^2)/(t^2+9),6t/(t^2+9))$。同理，由 $P B:y=t/3(x-3)$，得
          $ D(3(t^2-1)/(t^2+1),(-2t)/(t^2+1)). $
          $t != 0$ 时两点纵坐标异号，$t=0$ 时 $C=B,D=A$，故两点始终不同。]
        #step[写出不依赖斜率的直线方程][将 $C,D$ 坐标分别代入可知，它们都满足
          $ 4t x+3(t^2-3)y-6t=0. $
          两个一次项系数不同时为零，因此这就是直线 $C D$ 的方程。点 $(3/2,0)$ 对任意 $t$ 都满足该方程，故 $C D$ 恒过此定点。该方程同时包含 $t=0$ 时的水平直线与 $t^2=3$ 时的竖直直线。]],
    ),
  ),
)

#section[选考题：第 22、23 题中任选一题作答，每题 10 分。如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4-4：坐标系与参数方程。在直角坐标系 $x O y$ 中，曲线 $C_1$ 的参数方程为 $cases(x=cos^k t, y=sin^k t)$（$t$ 为参数）。以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，曲线 $C_2$ 的极坐标方程为 $4rho cos theta-16rho sin theta+3=0$。],
  parts: (
    subquestion(
      stem: [当 $k=1$ 时，$C_1$ 是什么曲线？],
      answers: ([以原点为圆心、半径为 $1$ 的圆。],),
      explanation: [此时 $x=cos t,y=sin t$，消去参数得 $x^2+y^2=1$。随 $t$ 遍历实数，得到圆上所有点，故 $C_1$ 是以原点为圆心、半径为 $1$ 的圆。],
    ),
    subquestion(
      stem: [当 $k=4$ 时，求 $C_1$ 与 $C_2$ 的公共点的直角坐标。],
      answers: ([$(1/4,1/4)$。],),
      explanation: [$C_2$ 的直角坐标方程为 $4x-16y+3=0$。令 $u=cos^2 t in [0,1]$，则 $x=u^2,y=(1-u)^2$。代入得
        $ 4u^2-16(1-u)^2+3=0, quad (2u-1)(6u-13)=0. $
        所以 $u=1/2$ 或 $13/6$。舍去不在 $[0,1]$ 内的 $13/6$，得 $x=y=1/4$；$u=1/2$ 可由 $t=pi/4$ 实现，故唯一公共点为 $(1/4,1/4)$。],
    ),
  ),
)

#question(
  "solution",
  score: 10,
  stem: [选修 4-5：不等式选讲。已知函数 $f(x)=|3x+1|-2|x-1|$。],
  parts: (
    subquestion(
      stem: [画出 $y=f(x)$ 的图象；#figure(absolute-diagram())],
      answers: ([图象见解析。],),
      explanation: [按绝对值内的零点 $-1/3,1$ 分段，得
        $
          f(x)=cases(-x-3 & quad x<=-1/3, 5x-1 & quad -1/3<x<1, x+3 & quad x>=1).
        $
        图象由两条射线与一条线段连接而成，折点为 $(-1/3,-8/3)$ 与 $(1,4)$。
        #figure(absolute-diagram(solved: true))],
    ),
    subquestion(
      stem: [求不等式 $f(x)>f(x+1)$ 的解集。],
      answers: ([$(-infinity,-7/6)$。],),
      explanation: [#step[排除递增区间][$f$ 在 $[-1/3,+infinity)$ 上严格递增，所以 $x>=-1/3$ 时，$f(x)<f(x+1)$，不满足所求不等式。]
        #step[求解剩余两段][当 $x<=-4/3$ 时，$x,x+1$ 均不大于 $-1/3$，故 $f(x)-f(x+1)=1>0$。
          当 $-4/3<x< -1/3$ 时，$f(x)-f(x+1)=(-x-3)-(5(x+1)-1)=-6x-7$。因此该段内的解为 $-4/3<x< -7/6$。
          合并得解集为 $(-infinity,-7/6)$。]],
    ),
  ),
)

