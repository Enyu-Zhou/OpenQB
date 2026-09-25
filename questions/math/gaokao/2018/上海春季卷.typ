#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校春季招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2018/2018春季上海.pdf",
  regions: ("上海",),
)

#let cuboid() = cetz.canvas(length: 11mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (3, 0, 0)
  let c = (3, 4, 0)
  let d = (0, 4, 0)
  let a1 = (0, 0, 5)
  let b1 = (3, 0, 5)
  let c1 = (3, 4, 5)
  let d1 = (0, 4, 5)
  let o = (1.5, 2, 5)
  oblique-project((1, 0), (0.35, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(a1, c1)
    line(o, b1, a)
    line(a, o, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
      (o, $O$, "south"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let blind-zone() = cetz.canvas(length: 2.4mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((0, 0), (20, 0), (20, 20), (0, 20), close: true)
  circle((10, 10), radius: 1)
  circle((10, 10), radius: 0.12, stroke: none, fill: black)
  line((0, 6), (20, 16))
  for (p, label, anchor) in (
    ((0, 0), $A$, "north-east"),
    ((20, 0), $B$, "north-west"),
    ((20, 20), $C$, "south-west"),
    ((0, 20), $D$, "south-east"),
    ((10, 10), $O$, "north-west"),
    ((0, 6), $P$, "east"),
    ((20, 16), $Q$, "west"),
  ) {
    content(p, label, anchor: anchor, padding: 3pt)
  }
})
#let triangular-prism() = cetz.canvas(length: 19mm, {
  import cetz.draw: *
  let a = (0, -1, 0)
  let b = (calc.sqrt(3), 0, 0)
  let c = (0, 1, 0)
  let a1 = (0, -1, 2)
  let b1 = (calc.sqrt(3), 0, 2)
  let c1 = (0, 1, 2)
  oblique-project((0.3, -0.3), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, c, stroke: (dash: figure-style.dash))
    line(b, c1)
    for (p, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "north-east"),
      (c1, $C_1$, "south-west"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let swept-segment() = cetz.canvas(length: 5mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.15,
    shared-zero: false,
  ))
  plot.plot(
    size: (12, 18),
    axis-style: "school-book",
    x-min: -7,
    x-max: 5,
    y-min: -9,
    y-max: 9,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.annotate(resize: false, {
        line((0, 0), (3, 4), (3, -4), close: true)
        line((0, 0), (-6, 8), (-6, -8), close: true)
        content((-0.9, 0.15), $A$, anchor: "south-east")
        circle((2, 0), radius: 0.05, stroke: none, fill: black)
        content((2, 0), $B$, anchor: "north", padding: 3pt)
        content((3, 4), $(3,4)$, anchor: "south-west", padding: 3pt)
        content((-6, 8), $(-6,8)$, anchor: "south", padding: 3pt)
        content((3, -4), $(3,-4)$, anchor: "north-west", padding: 3pt)
        content((-6, -8), $(-6,-8)$, anchor: "north", padding: 3pt)
      })
    },
  )
})
#let lights() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  scope({
    rect((0, 0), (3.8, 3.8))
    for center in (1, 2.8) {
      let points = range(61).map(i => {
        let x = -0.8 + 1.6 * i / 60
        (center + x, 3.2 - 4.375 * x * x)
      })
      line(..points, close: true, fill: luma(90%))
      circle((center, 4), radius: 0.12, fill: black)
      line((center, 3.8), (center, 3.6))
    }
    content((1.9, -1.55), [图 1（示意）])
  })
  scope({
    translate((5.1, 0, 0))
    let points(center) = range(61).map(i => {
      let x = -0.9 + 1.8 * i / 60
      (center + x, 3.6 - 5 * x * x)
    })
    line(..points(0), stroke: (dash: figure-style.dash))
    line(..points(1.8))
    line((1.8, 3.6), (1.8, 0))
    let r = calc.sqrt(3.6 / 5)
    line((1.8 - r, 0), (1.8 + r, 0))
    line((1.64, 0), (1.64, 0.16), (1.8, 0.16))
    for (p, label, anchor) in (
      ((1.8, 3.6), $O$, "south"),
      ((1.8 - r, 0), $A$, "north-east"),
      ((1.8 + r, 0), $B$, "north-west"),
      ((1.8, 0), $C$, "north"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
    content((0.9, -1.55), [图 2])
  })
  scope({
    translate((11, 0, 0))
    let r = 1.5
    let h = 1.5 * calc.sqrt(35)
    let s = (0, 0, h)
    let c = (0, 0, 0)
    let a = (0, r, 0)
    let b = (0, -r, 0)
    let d = (-r, 0, 0)
    let e = (r, 0, 0)
    let o = (r / 2, 0, h / 2)
    let point(t) = (r * calc.cos(t), r * calc.sin(t), 0)
    let alpha = calc.asin(r * 0.6 / (h * 0.45 * calc.sqrt(1.1225)))
    let first = -calc.atan(0.35) + alpha
    let last = -calc.atan(0.35) + 180deg - alpha
    let curve(y) = (
      (r * r - y * y) / (2 * r),
      y,
      h * (r * r - y * y) / (2 * r * r),
    )
    oblique-project((1, 0), (-0.35, 0.6), (0, 0.45), {
      line(point(first), s, point(last))
      line(
        ..range(101).map(i => point(last + (first + 360deg - last) * i / 100)),
      )
      line(
        ..range(101).map(i => point(first + (last - first) * i / 100)),
        stroke: (dash: figure-style.dash),
      )
      line(d, s, e)
      line(s, c, o, stroke: (dash: figure-style.dash))
      line(a, b, stroke: (dash: figure-style.dash))
      line(d, e, stroke: (dash: figure-style.dash))
      line(..range(61).map(i => curve(-r + r * i / 60)))
      line(..range(61).map(i => curve(r * i / 60)), stroke: (
        dash: figure-style.dash,
      ))
      for (p, label, anchor) in (
        (s, $S$, "south"),
        (c, $C$, "north-east"),
        (a, $A$, "south-east"),
        (b, $B$, "north"),
        (d, $D$, "east"),
        (e, $E$, "west"),
        (o, $O$, "south-west"),
      ) {
        content(p, label, anchor: anchor, padding: 3pt)
      }
    })
    content((0, -1.55), [图 3])
  })
})

#section[填空题：本题共 12 小题，共 54 分。第 1—6 题每小题 4 分，第 7—12 题每小题 5 分。]
#question(
  "fill-in",
  score: 4,
  stem: [不等式 $|x|>1$ 的解集为#fill-placeholder()。],
  answers: ([$(-infinity,-1) union (1,+infinity)$],),
  explanation: [$|x|>1$ 等价于 $x< -1$ 或 $x>1$，故解集为 $(-infinity,-1) union (1,+infinity)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [计算：$lim_(n -> infinity) (3n-1)/(n+2)=$#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [$(3n-1)/(n+2)=3-7/(n+2) -> 3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设集合 $A={x | 0<x<2}$，$B={x | -1<x<1}$，则 $A inter B=$#fill-placeholder()。],
  answers: ([$(0,1)$],),
  explanation: [同时满足两个集合条件的实数为 $0<x<1$，故 $A inter B=(0,1)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [若复数 $z=1+"i"$（$"i"$ 是虚数单位），则 $z+2/z=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [$2/z=2/(1+"i")=1-"i"$，故 $z+2/z=2$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知 ${a_n}$ 是等差数列，若 $a_2+a_8=10$，则 $a_3+a_5+a_7=$#fill-placeholder()。],
  answers: ([$15$],),
  explanation: [由等差数列的性质，$2a_5=a_2+a_8=10$，故 $a_3+a_5+a_7=3a_5=15$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知平面上动点 $P$ 到两个定点 $(1,0)$ 和 $(-1,0)$ 的距离之和等于 $4$，则动点 $P$ 的轨迹方程为#fill-placeholder()。],
  answers: ([$x^2/4+y^2/3=1$],),
  explanation: [轨迹是以两定点为焦点的椭圆，$a=2,c=1$，故 $b^2=a^2-c^2=3$，方程为 $x^2/4+y^2/3=1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，在长方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$A B=3$，$B C=4$，$A A_1=5$，$O$ 是 $A_1 C_1$ 的中点，则三棱锥 $A-A_1 O B_1$ 的体积为#fill-placeholder()。#figure(cuboid())],
  answers: ([$5$],),
  explanation: [$triangle A_1 O B_1$ 的面积为上底面面积的 $1/4$，即 $3 times 4/4=3$。三棱锥的高为 $A A_1=5$，故体积为 $1/3 times 3 times 5=5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某校组队参加辩论赛，从 6 名学生中选出 4 人分别担任一、二、三、四辩，若其中学生甲必须参赛且不担任四辩，则不同的安排方法种数为#fill-placeholder()。（结果用数值表示）],
  answers: ([$180$],),
  explanation: [先安排甲，有 $3$ 种位置；再从其余 $5$ 人中选 $3$ 人，依次安排到余下位置，有 $A_5^3$ 种。故共有 $3A_5^3=180$ 种安排。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $a in RR$，若 $(x^2+2/x)^9$ 与 $(x+a/x^2)^9$ 的二项展开式中的常数项相等，则 $a=$#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [两展开式的通项分别为 $C_9^k 2^k x^(18-3k)$ 和 $C_9^k a^k x^(9-3k)$。常数项分别为 $C_9^6 2^6$ 与 $C_9^3 a^3$，故 $a^3=64$，得 $a=4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $m in RR$，若 $z$ 是关于 $x$ 的方程 $x^2+m x+m^2-1=0$ 的一个虚根，则 $|z|$ 的取值范围是#fill-placeholder()。],
  answers: ([$(sqrt(3)/3,+infinity)$],),
  explanation: [有虚根要求 $Delta=m^2-4(m^2-1)=4-3m^2<0$，即 $m^2>4/3$。两根互为共轭复数，由韦达定理，$|z|^2=m^2-1>1/3$，且能取遍 $(1/3,+infinity)$，故 $|z| in (sqrt(3)/3,+infinity)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $a>0$，函数 $f(x)=x+2(1-x)sin(a x)$，$x in (0,1)$，若函数 $y=2x-1$ 与 $y=f(x)$ 的图象有且仅有两个不同的公共点，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$(11pi/6,19pi/6]$],),
  explanation: [两函数相等，得 $(1-x)(2sin(a x)+1)=0$。由 $x in (0,1)$，可化为 $sin(a x)=-1/2$。令 $t=a x$，则 $t in (0,a)$。$sin t=-1/2$ 的前三个正根为 $7pi/6,11pi/6,19pi/6$，故恰有两个交点的条件为 $11pi/6<a<=19pi/6$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，正方形 $A B C D$ 的边长为 20 米，圆 $O$ 的半径为 1 米，圆心是正方形的中心，点 $P,Q$ 分别在线段 $A D,C B$ 上。若线段 $P Q$ 与圆 $O$ 有公共点，则称点 $Q$ 在点 $P$ 的“盲区”中。已知点 $P$ 以 1.5 米/秒的速度从 $A$ 出发向 $D$ 移动，同时，点 $Q$ 以 1 米/秒的速度从 $C$ 出发向 $B$ 移动，则在点 $P$ 从 $A$ 移动到 $D$ 的过程中，点 $Q$ 在点 $P$ 的盲区中的时长约为#fill-placeholder()秒（精确到 0.1）。#figure(blind-zone())],
  answers: ([$4.4$],),
  explanation: [以 $A$ 为原点，$A B,A D$ 的方向为坐标轴正方向建系。经过 $t$ 秒时，$P(0,1.5t)$，$Q(20,20-t)$，其中 $0<=t<=40/3$，圆心为 $O(10,10)$。
    直线 $P Q$ 的方程为 $(20-2.5t)x-20y+30t=0$。圆在正方形内部，故线段 $P Q$ 与圆有公共点，等价于圆心到直线的距离不大于 $1$，即
    $ (5t)/sqrt((20-2.5t)^2+400)<=1 <=> 3t^2+16t-128<=0. $
    结合时间范围，得 $0<=t<=8(sqrt(7)-1)/3$，故时长为 $8(sqrt(7)-1)/3 approx 4.4$ 秒。],
)

#section[选择题：本题共 4 小题，每小题 5 分，共 20 分。每小题只有一项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [下列函数中，为偶函数的是#choice-placeholder()。],
  choices: ([$y=x^(-2)$], [$y=x^(1/3)$], [$y=x^(-1/2)$], [$y=x^3$]),
  answers: ([A],),
  explanation: [$y=x^(-2)$ 的定义域为 $RR without {0}$，且 $(-x)^(-2)=x^(-2)$，故为偶函数。选项 B、D 中的函数为奇函数，选项 C 的定义域 $(0,+infinity)$ 不关于原点对称。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，在直三棱柱 $A B C-A_1 B_1 C_1$ 的棱所在的直线中，与直线 $B C_1$ 异面的直线的条数为#choice-placeholder()。#figure(triangular-prism())],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([C],),
  explanation: [过 $B$ 的 $A B,B C,B B_1$ 及过 $C_1$ 的 $A_1 C_1,B_1 C_1,C C_1$ 都与 $B C_1$ 相交。其余三条棱所在直线 $A C,A_1 B_1,A A_1$ 均与 $B C_1$ 既不平行也不相交，所以共有 $3$ 条异面直线。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $S_n$ 为数列 ${a_n}$ 的前 $n$ 项和，“${a_n}$ 是递增数列”是“${S_n}$ 是递增数列”的#choice-placeholder()。],
  choices: (
    [充分非必要条件],
    [必要非充分条件],
    [充要条件],
    [既非充分又非必要条件],
  ),
  answers: ([D],),
  explanation: [取 $a_n=n-10$，则 ${a_n}$ 递增，但 $S_2-S_1=a_2=-8<0$，故不充分。取 $a_n=1/n$，则 $S_(n+1)-S_n=a_(n+1)>0$，但 ${a_n}$ 递减，故不必要。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $A,B$ 为平面上的两个定点，且 $|arrow(A B)|=2$，该平面上的动线段 $P Q$ 的端点 $P,Q$ 满足 $|arrow(A P)|<=5$，$arrow(A P) dot arrow(A B)=6$，$arrow(A Q)=-2arrow(A P)$，则动线段 $P Q$ 所形成图形的面积为#choice-placeholder()。],
  choices: ([$36$], [$60$], [$72$], [$108$]),
  answers: ([B],),
  explanation: [取 $A(0,0),B(2,0)$，设 $P(x,y)$。由 $2x=6$ 与 $x^2+y^2<=25$，得 $P(3,y)$，$-4<=y<=4$，且 $Q(-6,-2y)$。
    $A$ 在线段 $P Q$ 上，线段扫过的区域是以 $A$ 为公共顶点的两个三角形，分别以 $x=3,-6$ 上长为 $8,16$ 的线段为底。故总面积为 $1/2 times 8 times 3+1/2 times 16 times 6=60$。
    #figure(swept-segment())],
)

#section[解答题：本题共 5 小题，共 76 分。解答应写出文字说明、证明过程或演算步骤。]
#question("solution", score: 14, stem: [已知 $f(x)=cos x$。], parts: (
  subquestion(
    score: 6,
    stem: [若 $f(alpha)=1/3$，且 $alpha in [0,pi]$，求 $f(alpha-pi/3)$ 的值。],
    answers: ([$(1+2sqrt(6))/6$],),
    explanation: [由 $cos alpha=1/3$，$alpha in [0,pi]$，得 $sin alpha=(2sqrt(2))/3$。故 $f(alpha-pi/3)=cos alpha cos(pi/3)+sin alpha sin(pi/3)=1/6+sqrt(6)/3=(1+2sqrt(6))/6$。],
  ),
  subquestion(
    score: 8,
    stem: [求函数 $y=f(2x)-2f(x)$ 的最小值。],
    answers: ([$-3/2$],),
    explanation: [$y=cos 2x-2cos x=2cos^2 x-2cos x-1=2(cos x-1/2)^2-3/2>=-3/2$。当 $cos x=1/2$ 时等号成立，故最小值为 $-3/2$。],
  ),
))
#question(
  "solution",
  score: 14,
  stem: [已知 $a in RR$，双曲线 $Gamma:x^2/a^2-y^2=1$。],
  parts: (
    subquestion(
      score: 6,
      stem: [若点 $(2,1)$ 在 $Gamma$ 上，求 $Gamma$ 的焦点坐标。],
      answers: ([$(-sqrt(3),0),(sqrt(3),0)$],),
      explanation: [将 $(2,1)$ 代入，得 $4/a^2-1=1$，故 $a^2=2$。由 $c^2=a^2+1=3$，得焦点坐标为 $(-sqrt(3),0),(sqrt(3),0)$。],
    ),
    subquestion(
      score: 8,
      stem: [若 $a=1$，直线 $y=k x+1$ 与 $Gamma$ 相交于 $A,B$ 两点，且线段 $A B$ 中点的横坐标为 $1$，求实数 $k$ 的值。],
      answers: ([$(sqrt(5)-1)/2$],),
      explanation: [联立方程，得 $(1-k^2)x^2-2k x-2=0$。有两个不同交点要求 $k^2!=1$ 且 $Delta=8-4k^2>0$。
        由韦达定理，中点横坐标为 $k/(1-k^2)=1$，故 $k^2+k-1=0$，解得 $k=(-1 plus.minus sqrt(5))/2$。结合 $|k|<sqrt(2)$，舍去负根，得 $k=(sqrt(5)-1)/2$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [利用“平行于圆锥母线的平面截圆锥面，所得截线是抛物线”的几何原理，某快餐店用两个射灯（射出的光锥为圆锥）在广告牌上投影出其标识，如图 1 所示。图 2 是投影射出的抛物线的平面图，图 3 是一个射灯投影的直观图。在图 2 与图 3 中，点 $O,A,B$ 在抛物线上，$O C$ 是抛物线的对称轴，$O C perp A B$ 于 $C$，$A B=3$ 米，$O C=4.5$ 米。
    #figure(lights())],
  parts: (
    subquestion(
      score: 7,
      stem: [求抛物线的焦点到准线的距离。],
      answers: ([$1/4$ 米。],),
      explanation: [以 $O$ 为原点、$O C$ 方向为 $y$ 轴正方向建系，设抛物线方程为 $x^2=2p y$（$p>0$）。由对称性，$C$ 为 $A B$ 的中点，故 $B(1.5,4.5)$。代入得 $1.5^2=2p times 4.5$，即 $p=1/4$，所以焦点到准线的距离为 $1/4$ 米。],
    ),
    subquestion(
      score: 7,
      stem: [在图 3 中，已知 $O C$ 平行于圆锥的母线 $S D$，$A B,D E$ 是圆锥底面的直径，求圆锥的母线与轴的夹角的大小（精确到 $0.01degree$）。],
      answers: ([$9.59degree$],),
      explanation: [由 $A B,D E$ 为直径及 $C$ 为 $A B$ 的中点，知 $C$ 是底面圆心，也是 $D E$ 的中点。在 $triangle S D E$ 中，$C O parallel D S$，故 $O$ 为 $S E$ 的中点，$S D=2C O=9$ 米。
        设母线与轴的夹角为 $theta$。在直角三角形 $S C D$ 中，$sin theta=(C D)/(S D)=1.5/9=1/6$，故 $theta=arcsin(1/6) approx 9.59degree$。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [设 $a>0$，函数 $f(x)=1/(1+a dot 2^x)$。],
  parts: (
    subquestion(
      score: 4,
      stem: [若 $a=1$，求 $f(x)$ 的反函数 $f^(-1)(x)$。],
      answers: ([$f^(-1)(x)=log_2 ((1-x)/x)$，$0<x<1$。],),
      explanation: [由 $y=1/(1+2^x)$，得 $2^x=(1-y)/y$，所以 $x=log_2 ((1-y)/y)$。又 $f$ 的值域为 $(0,1)$，故反函数为 $f^(-1)(x)=log_2 ((1-x)/x)$，定义域为 $(0,1)$。],
    ),
    subquestion(
      score: 6,
      stem: [求函数 $y=f(x) dot f(-x)$ 的最大值（用 $a$ 表示）。],
      answers: ([$1/(1+a)^2$],),
      explanation: [$y=1/(1+a^2+a(2^x+2^(-x)))$。因 $2^x+2^(-x)>=2$，当且仅当 $x=0$ 时等号成立，故 $y<=1/(1+a)^2$，最大值为 $1/(1+a)^2$。],
    ),
    subquestion(
      score: 6,
      stem: [设 $g(x)=f(x)-f(x-1)$，若对任意 $x in (-infinity,0]$，$g(x)>=g(0)$ 恒成立，求 $a$ 的取值范围。],
      answers: ([$(0,sqrt(2)]$],),
      explanation: [令 $u=a dot 2^x$，则 $0<u<=a$，且
        $ g(x)=1/(1+u)-2/(2+u)=(-u)/((u+1)(u+2))=h(u). $
        由 $h'(u)=(u^2-2)/((u+1)^2 (u+2)^2)$，知 $h$ 在 $(0,sqrt(2)]$ 上递减，在 $[sqrt(2),+infinity)$ 上递增。
        若 $0<a<=sqrt(2)$，则所有 $u in (0,a]$ 都满足 $h(u)>=h(a)$。若 $a>sqrt(2)$，取 $u=sqrt(2)$，则 $h(u)<h(a)$，不满足条件。因此 $a in (0,sqrt(2)]$。],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [若 ${c_n}$ 是递增数列，数列 ${a_n}$ 满足：对任意 $n in NN^*$，存在 $m in NN^*$，使得 $(a_m-c_n)/(a_m-c_(n+1))<=0$，则称 ${a_n}$ 是 ${c_n}$ 的“分隔数列”。],
  parts: (
    subquestion(
      stem: [设 $c_n=2n$，$a_n=n+1$，证明：数列 ${a_n}$ 是 ${c_n}$ 的分隔数列。],
      answers: ([证明见解析。],),
      explanation: [因 $c_n<c_(n+1)$，定义中的不等式等价于 $c_n<=a_m<c_(n+1)$。对任意正整数 $n$，取 $m=2n-1$，则 $a_m=2n=c_n<c_(n+1)$。故 ${a_n}$ 是 ${c_n}$ 的分隔数列。],
    ),
    subquestion(
      stem: [设 $c_n=n-4$，$S_n$ 是 ${c_n}$ 的前 $n$ 项和，$d_n=c_(3n-2)$，判断数列 ${S_n}$ 是否是数列 ${d_n}$ 的分隔数列，并说明理由。],
      answers: ([不是。],),
      explanation: [$S_m=m(m-7)/2$，$d_n=3n-6$。取 $n=4$，则 $[d_4,d_5)=[6,9)$。当 $1<=m<=7$ 时，$S_m<=0$；$m=8$ 时，$S_8=4$；当 $m>=9$ 时，$S_m>=9$。因此不存在 $S_m in [6,9)$，故 ${S_n}$ 不是 ${d_n}$ 的分隔数列。],
    ),
    subquestion(
      stem: [设 $c_n=a q^(n-1)$，$T_n$ 是 ${c_n}$ 的前 $n$ 项和，若数列 ${T_n}$ 是 ${c_n}$ 的分隔数列，求实数 $a,q$ 的取值范围。],
      answers: ([$a>0$，$q>=2$。],),
      explanation: [#step[由递增性确定符号][由 ${c_n}$ 严格递增，得 $a>0,q>1$ 或 $a<0,0<q<1$。若 $a<0,0<q<1$，所有 $T_m<=a=c_1<c_2$，不能落入 $[c_2,c_3)$，故只能有 $a>0,q>1$。]
        #step[必要性][此时 ${T_m}$ 严格递增，且 $T_m>=c_m$。对任意 $n$，前 $n$ 个互不相交的区间 $[c_1,c_2),dots,[c_n,c_(n+1))$ 都须各含至少一个部分和。
          若 $T_n>=c_(n+1)$，则从 $T_n$ 起的所有部分和均不在这些区间内，只剩 $n-1$ 个部分和，不可能满足条件。因此必须对所有正整数 $n$ 都有
          $ T_n=(a(q^n-1))/(q-1)<a q^n=c_(n+1) <=> (2-q)q^n<1. $
          当 $1<q<2$ 时，$(2-q)q^n -> +infinity$，不可能恒小于 $1$，故 $q>=2$。]
        #step[充分性][若 $a>0,q>=2$，则对任意正整数 $n$，都有 $T_n>=c_n$，且由 $(2-q)q^n<=0<1$ 得 $T_n<c_(n+1)$。取 $m=n$ 即满足分隔数列的定义。综上，所求范围为 $a>0,q>=2$。]],
    ),
  ),
)
