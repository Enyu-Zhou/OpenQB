#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020全国1理(河南,河北,山西,江西,湖北,湖南,广东,安徽,福建).pdf",
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
#let net-diagram() = cetz.canvas(length: 14mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (0, 0)
  let b = (calc.sqrt(3), 0)
  let c = (0, -1)
  let d = (0, calc.sqrt(3))
  let e = (-calc.sqrt(3) / 2, -1.5)
  let fx = (calc.sqrt(15) - calc.sqrt(3)) / 8
  let f = (fx, -1.5 - calc.sqrt(3) * fx)
  line(a, d, b, f, c, e, a)
  line(a, b, c, a)
  for (point, label, anchor) in (
    (a, $A$, "east"),
    (b, $B$, "west"),
    (c, $C$, "east"),
    (d, $D(P)$, "south"),
    (e, $E(P)$, "north-east"),
    (f, $F(P)$, "north"),
  ) {
    content(point, label, anchor: anchor, padding: 3pt)
  }
})
#let cone-diagram() = cetz.canvas(length: 14mm, {
  import cetz.draw: *
  let r = 2
  let h = 2 * calc.sqrt(3)
  let a = (0, -2, 0)
  let b = (calc.sqrt(3), 1, 0)
  let c = (-calc.sqrt(3), 1, 0)
  let e = (0, 2, 0)
  let o = (0, 0, 0)
  let d = (0, 0, h)
  let p = (0, 0, calc.sqrt(2))
  let delta = calc.atan(0.35 / 0.8)
  let alpha = calc.asin(
    r * 0.2125 / (1.1 * h * calc.sqrt(0.8 * 0.8 + 0.35 * 0.35)),
  )
  let t1 = delta + alpha
  let t2 = delta + 180deg - alpha
  let rim(t) = (r * calc.cos(t), r * calc.sin(t), 0)
  let arc-points(start, end) = range(0, 101).map(i => rim(
    start + (end - start) * i / 100,
  ))
  oblique-project((0.8, -0.15), (0.35, 0.2), (0, 1.1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(rim(t1), d, rim(t2))
    line(..arc-points(t2, t1 + 360deg))
    line(..arc-points(t1, t2), stroke: (dash: figure-style.dash))
    line(d, o, stroke: (dash: figure-style.dash))
    line(a, b, c, a, stroke: (dash: figure-style.dash))
    line(a, e, stroke: (dash: figure-style.dash))
    line(a, p, b, stroke: (dash: figure-style.dash))
    line(c, p, e, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "south-east"),
      (e, $E$, "south-west"),
      (o, $O$, "north"),
      (d, $D$, "south"),
      (p, $P$, "east"),
    ) {
      content(point, label, anchor: anchor, padding: 3pt)
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
  stem: [若 $z=1+i$，则 $|z^2-2z|=$#choice-placeholder()。],
  choices: ([$0$], [$1$], [$sqrt(2)$], [$2$]),
  answers: ([D],),
  explanation: [$z^2-2z=(1+i)^2-2(1+i)=-2$，故 $|z^2-2z|=2$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A=\{x | x^2-4<=0\},B=\{x | 2x+a<=0\}$，且 $A inter B=\{x | -2<=x<=1\}$，则 $a=$#choice-placeholder()。],
  choices: ([$-4$], [$-2$], [$2$], [$4$]),
  answers: ([B],),
  explanation: [$A=[-2,2],B=(-infinity,-a/2]$。要使交集为 $[-2,1]$，必有 $-a/2=1$，故 $a=-2$。],
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
  stem: [已知 $A$ 为抛物线 $C:y^2=2p x$（$p>0$）上一点，点 $A$ 到 $C$ 的焦点的距离为 12，到 $y$ 轴的距离为 9，则 $p=$#choice-placeholder()。],
  choices: ([$2$], [$3$], [$6$], [$9$]),
  answers: ([C],),
  explanation: [抛物线上点的横坐标非负，故 $x_A=9$。由抛物线定义，$x_A+p/2=12$，即 $9+p/2=12$，解得 $p=6$。],
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
  stem: [函数 $f(x)=x^4-2x^3$ 的图象在点 $(1,f(1))$ 处的切线方程为#choice-placeholder()。],
  choices: ([$y=-2x-1$], [$y=-2x+1$], [$y=2x-3$], [$y=2x+1$]),
  answers: ([B],),
  explanation: [$f(1)=-1,f'(x)=4x^3-6x^2$，故 $f'(1)=-2$。切线方程为 $y+1=-2(x-1)$，即 $y=-2x+1$。],
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
  stem: [$(x+y^2/x)(x+y)^5$ 的展开式中 $x^3 y^3$ 的系数为#choice-placeholder()。],
  choices: ([$5$], [$10$], [$15$], [$20$]),
  answers: ([C],),
  explanation: [所求项分别来自 $x$ 与 $(x+y)^5$ 中的 $x^2 y^3$ 项相乘，以及 $y^2/x$ 与其中的 $x^4 y$ 项相乘。因此系数为 $binom(5, 3)+binom(5, 1)=10+5=15$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知 $alpha in (0,pi)$，且 $3cos 2alpha-8cos alpha=5$，则 $sin alpha=$#choice-placeholder()。],
  choices: ([$sqrt(5)/3$], [$2/3$], [$1/3$], [$sqrt(5)/9$]),
  answers: ([A],),
  explanation: [设 $t=cos alpha in (-1,1)$，由 $cos 2alpha=2t^2-1$ 得 $3t^2-4t-4=0$，故 $t=2$ 或 $-2/3$。舍去 $2$，得 $sin alpha=sqrt(1-4/9)=sqrt(5)/3$，正号由 $alpha in (0,pi)$ 确定。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知 $A,B,C$ 为球 $O$ 的球面上的三个点，圆 $O_1$ 为 $triangle A B C$ 的外接圆。若圆 $O_1$ 的面积为 $4pi$，$A B=B C=A C=O O_1$，则球 $O$ 的表面积为#choice-placeholder()。],
  choices: ([$64pi$], [$48pi$], [$36pi$], [$32pi$]),
  answers: ([A],),
  explanation: [圆 $O_1$ 的半径为 $2$。由正弦定理，正三角形的边长 $A B=2 times 2sin 60degree=2sqrt(3)$，故 $O O_1=2sqrt(3)$。球心在截面圆圆心的垂线上，球半径满足 $R^2=O O_1^2+O_1 A^2=12+4=16$，所以球的表面积为 $4pi R^2=64pi$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知圆 $M:x^2+y^2-2x-2y-2=0$，直线 $l:2x+y+2=0$，$P$ 为 $l$ 上的动点，过点 $P$ 作圆 $M$ 的切线 $P A,P B$，切点为 $A,B$。当 $|P M| dot |A B|$ 最小时，直线 $A B$ 的方程为#choice-placeholder()。],
  choices: ([$2x-y-1=0$], [$2x+y-1=0$], [$2x-y+1=0$], [$2x+y+1=0$]),
  answers: ([D],),
  explanation: [圆心 $M(1,1)$，半径为 $2$。圆心到 $l$ 的距离为 $sqrt(5)>2$，所以所述两条切线始终存在。设 $d=P M$，由直角三角形 $P A M$ 及切点弦的对称性，得 $A B=4sqrt(d^2-4)/d$，故 $P M dot A B=4sqrt(d^2-4)$ 随 $d$ 增大而增大。
    当 $P$ 为 $M$ 在 $l$ 上的垂足时取最小值，此时 $P=(-1,0)$。切点 $X(x,y)$ 满足 $(P-M) dot (X-M)=4$，故 $-2(x-1)-(y-1)=4$，即 $2x+y+1=0$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [若 $2^a+log_2 a=4^b+2log_4 b$，则#choice-placeholder()。],
  choices: ([$a>2b$], [$a<2b$], [$a>b^2$], [$a<b^2$]),
  answers: ([B],),
  explanation: [对数有意义要求 $a,b>0$。设 $F(t)=2^t+log_2 t$，它在 $(0,+infinity)$ 上严格递增。由题意，$F(a)=2^(2b)+log_2 b=F(2b)-1<F(2b)$，故 $a<2b$。],
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
  stem: [设 $bold(a),bold(b)$ 为单位向量，且 $|bold(a)+bold(b)|=1$，则 $|bold(a)-bold(b)|=$#fill-placeholder()。],
  answers: ([$sqrt(3)$],),
  explanation: [由 $|bold(a)+bold(b)|^2=2+2bold(a) dot bold(b)=1$，得 $bold(a) dot bold(b)=-1/2$。所以 $|bold(a)-bold(b)|^2=2-2bold(a) dot bold(b)=3$，故所求模为 $sqrt(3)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $F$ 为双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的右焦点，$A$ 为 $C$ 的右顶点，$B$ 为 $C$ 上的点，且 $B F$ 垂直于 $x$ 轴。若 $A B$ 的斜率为 3，则 $C$ 的离心率为#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [设焦半距为 $c$，则 $A(a,0),F(c,0)$。将 $x=c$ 代入双曲线方程，得 $y_B=plus.minus b^2/a$。因 $c>a$ 且 $A B$ 的斜率为正，故 $y_B=b^2/a$。于是
    $ 3=(b^2)/(a(c-a))=(c^2-a^2)/(a(c-a))=(c+a)/a=e+1, $
    所以 $e=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，在三棱锥 $P-A B C$ 的平面展开图中，$A C=1,A B=A D=sqrt(3)$，$A B perp A C,A B perp A D,angle C A E=30 degree$，则 $cos angle F C B=$#fill-placeholder()。#figure(net-diagram())],
  answers: ([$-1/4$],),
  explanation: [折叠后 $D,E,F$ 重合于顶点 $P$，故 $A E=A D=sqrt(3),B F=B D,C F=C E$。由勾股定理，$B C=2,B D=sqrt(6)$。在 $triangle A C E$ 中，由余弦定理，
    $ C E^2=A C^2+A E^2-2A C dot A E cos 30degree=1+3-3=1. $
    因此 $C F=1,B F=sqrt(6)$，在 $triangle B C F$ 中，$cos angle F C B=(C F^2+B C^2-B F^2)/(2C F dot B C)=(1+4-6)/4=-1/4$。],
)

#section[解答题：共 70 分。第 17～21 题为必考题，每题 12 分；第 22、23 题为选考题，任选一题作答。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 12,
  stem: [设 $\{a_n\}$ 是公比不为 1 的等比数列，$a_1$ 为 $a_2,a_3$ 的等差中项。],
  parts: (
    subquestion(
      stem: [求 $\{a_n\}$ 的公比；],
      answers: ([$-2$。],),
      explanation: [设公比为 $q$。由 $2a_1=a_2+a_3$ 及 $a_1 != 0$，得 $q^2+q-2=0$，即 $(q-1)(q+2)=0$。已知 $q != 1$，故 $q=-2$。],
    ),
    subquestion(
      stem: [若 $a_1=1$，求数列 $\{n a_n\}$ 的前 $n$ 项和。],
      answers: ([$frac(1-(3n+1)(-2)^n, 9)$。],),
      explanation: [由（1）得 $a_n=(-2)^(n-1)$。设所求和为 $T_n$，则
        $ T_n=1+2(-2)+3(-2)^2+dots+n(-2)^(n-1). $
        两边乘 $-2$ 后错位相减，得
        $ 3T_n=sum_(j=0)^(n-1)(-2)^j-n(-2)^n=(1-(-2)^n)/3-n(-2)^n. $
        故 $T_n=frac(1-(3n+1)(-2)^n, 9)$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，$D$ 为圆锥的顶点，$O$ 是圆锥底面的圆心，$A E$ 为底面直径，$A E=A D$。$triangle A B C$ 是底面的内接正三角形，$P$ 为 $D O$ 上一点，$P O=sqrt(6)/6 D O$。#figure(cone-diagram())],
  parts: (
    subquestion(
      stem: [证明：$P A perp "平面" P B C$；],
      answers: ([证明见解析。],),
      explanation: [不妨取底面半径为 $2$，则 $A E=A D=4$，$D O=sqrt(4^2-2^2)=2sqrt(3)$，$P O=sqrt(2)$。以 $O$ 为原点，底面中平行于 $C B$ 的方向、$O E$ 的方向及 $O D$ 的方向分别为三条坐标轴的正方向，则
        $ A(0,-2,0),B(sqrt(3),1,0),C(-sqrt(3),1,0),E(0,2,0),P(0,0,sqrt(2)). $
        于是 $arrow(P A)=(0,-2,-sqrt(2)),arrow(P B)=(sqrt(3),1,-sqrt(2)),arrow(P C)=(-sqrt(3),1,-sqrt(2))$，从而
        $ arrow(P A) dot arrow(P B)=arrow(P A) dot arrow(P C)=-2+2=0. $
        ∵ $P B inter P C={P}$，∴ $P A perp "平面" P B C$。],
    ),
    subquestion(
      stem: [求二面角 $B-P C-E$ 的余弦值。],
      answers: ([$2sqrt(5)/5$。],),
      explanation: [#step[构造二面角的平面角方向][沿用（1）的坐标系，$arrow(P B) dot arrow(P C)=-3+1+2=0$，故 $P B perp P C$。又 $arrow(P E)=(0,2,-sqrt(2))$，其在垂直于 $P C$ 方向上的分量为
          $
            bold(v)=arrow(P E)-(arrow(P E) dot arrow(P C))/(|arrow(P C)|^2)arrow(P C)
            =arrow(P E)-2/3 arrow(P C)=(2sqrt(3)/3,4/3,-sqrt(2)/3).
          $
          向量 $arrow(P B)$ 与 $bold(v)$ 分别指向含 $B$、含 $E$ 的两个半平面，且均垂直于棱 $P C$，故它们的夹角就是所求二面角。]
        #step[计算余弦值][设二面角为 $theta$，则 $arrow(P B) dot bold(v)=4$，$|arrow(P B)|^2=6,|bold(v)|^2=10/3$。因此
          $ cos theta=4/(sqrt(6)sqrt(10/3))=2sqrt(5)/5. $]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [甲、乙、丙三位同学进行羽毛球比赛，约定赛制如下：累计负两场者被淘汰；比赛前抽签决定首先比赛的两人，另一人轮空；每场比赛的胜者与轮空者进行下一场比赛，负者下一场轮空，直至有一人被淘汰；当一人被淘汰后，剩余的两人继续比赛，直至其中一人被淘汰，另一人最终获胜，比赛结束。经抽签，甲、乙首先比赛，丙轮空。设每场比赛双方获胜的概率都为 $1/2$。],
  parts: (
    subquestion(
      stem: [求甲连胜四场的概率；],
      answers: ([$1/16$。],),
      explanation: [甲连胜时依次与乙、丙、乙、丙比赛，四场全部取胜的概率为 $(1/2)^4=1/16$。],
    ),
    subquestion(
      stem: [求需要进行第五场比赛的概率；],
      answers: ([$3/4$。],),
      explanation: [比赛结束时已有两人各负两场，所以至少需要四场。记每场负者依次为甲、乙、丙中的一人。四场结束的负者序列只能为
        $ ("甲","乙","甲","乙"), quad ("甲","丙","甲","丙"), $
        $ ("乙","甲","乙","甲"), quad ("乙","丙","乙","丙"). $
        每种序列的概率均为 $1/16$，故四场结束的概率为 $1/4$。剩余情形均需进行第五场，所求概率为 $1-1/4=3/4$。],
    ),
    subquestion(
      stem: [求丙最终获胜的概率。],
      answers: ([$7/16$。],),
      explanation: [#step[按前三场结果分类][甲、乙的地位对称，先以第一场甲胜为例。此时第二场为甲对丙，第三场由第二场胜者对乙。以下四种情形的条件概率均为 $1/4$：
          #block(breakable: false)[#table(
            columns: 3,
            align: center,
            [第二场胜者], [第三场胜者], [此后丙最终获胜的概率],
            [甲], [甲], [$1/4$],
            [甲], [乙], [$1/4$],
            [丙], [丙], [$3/4$],
            [丙], [乙], [$1/2$],
          )]
          第一行中乙已淘汰，甲未负、丙负一场，丙须连胜两场，概率为 $1/4$。
          第二行中三人各负一场，下一场乙对丙，丙须先胜乙再胜甲，概率为 $1/4$。
          第三行中乙已淘汰，丙未负、甲负一场，丙只需在自己连负两场之前取胜，概率为 $1-(1/2)^2=3/4$。
          第四行中三人各负一场，下一场甲对乙，丙与其胜者决胜，概率为 $1/2$。]
        #step[合并条件概率][第一场甲胜时，丙最终获胜的概率为 $1/4(1/4+1/4+3/4+1/2)=7/16$。第一场乙胜时，由对称性概率相同，所以丙最终获胜的概率为 $7/16$。]],
    ),
  ),
)
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
#question("solution", score: 12, stem: [已知函数 $f(x)=e^x+a x^2-x$。], parts: (
  subquestion(
    stem: [当 $a=1$ 时，讨论 $f(x)$ 的单调性；],
    answers: (
      [在 $(-infinity,0)$ 上单调递减，在 $(0,+infinity)$ 上单调递增。],
    ),
    explanation: [当 $a=1$ 时，$f'(x)=e^x+2x-1,f''(x)=e^x+2>0$，故 $f'$ 严格递增。由 $f'(0)=0$，得 $x<0$ 时 $f'(x)<0$，$x>0$ 时 $f'(x)>0$。所以 $f$ 在 $(-infinity,0)$ 上单调递减，在 $(0,+infinity)$ 上单调递增。],
  ),
  subquestion(
    stem: [当 $x>=0$ 时，$f(x)>=1/2 x^3+1$，求 $a$ 的取值范围。],
    answers: ([$[(7-e^2)/4,+infinity)$。],),
    explanation: [#step[分离参数][当 $x=0$ 时，不等式恒成立。当 $x>0$ 时，不等式等价于
        $ a>=g(x), quad g(x)=frac(x^3/2+x+1-e^x, x^2). $
        求导得
        $ g'(x)=frac((2-x)(e^x-1-x-x^2/2), x^3). $]
      #step[确定所需上界][令 $H(x)=e^x-1-x-x^2/2$。当 $x>0$ 时，$H''(x)=e^x-1>0$，又 $H'(0)=H(0)=0$，故 $H'(x)>0,H(x)>0$。
        因此 $g$ 在 $(0,2)$ 上严格递增，在 $(2,+infinity)$ 上严格递减，最大值为 $g(2)=(7-e^2)/4$。所以 $a$ 的取值范围为 $[(7-e^2)/4,+infinity)$。]],
  ),
))

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
