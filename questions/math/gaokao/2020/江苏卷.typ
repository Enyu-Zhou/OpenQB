#import "/src/lib.typ": (
  cetz, exam, figure-style, fill-placeholder, oblique-project, question,
  section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "江苏卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020江苏.pdf",
  regions: ("江苏",),
)

#let flowchart() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.55, 5.7), (0.55, 6.2), radius: 0.2)
  content((0, 5.95), [开始])
  line((-0.8, 4.7), (0.6, 4.7), (0.8, 5.2), (-0.6, 5.2), close: true)
  content((0, 4.95), [输入 $x$])
  line((0, 4.2), (1.2, 3.75), (0, 3.3), (-1.2, 3.75), close: true)
  content((0, 3.75), [$x>0$？])
  rect((-2.7, 2.25), (-1.3, 2.8))
  content((-2, 2.525), $y arrow.l 2^x$)
  rect((1.1, 2.25), (2.9, 2.8))
  content((2, 2.525), $y arrow.l x+1$)
  line((-0.8, 0.9), (0.6, 0.9), (0.8, 1.4), (-0.6, 1.4), close: true)
  content((0, 1.15), [输出 $y$])
  rect((-0.55, -0.1), (0.55, 0.4), radius: 0.2)
  content((0, 0.15), [结束])
  for (y1, y2) in ((5.7, 5.2), (4.7, 4.2), (0.9, 0.4)) {
    line((0, y1), (0, y2), mark: (end: ">"))
  }
  line((-1.2, 3.75), (-2, 3.75), (-2, 2.8), mark: (end: ">"))
  line((1.2, 3.75), (2, 3.75), (2, 2.8), mark: (end: ">"))
  content((-1.55, 3.75), [Y], anchor: "south", padding: 3pt)
  content((1.55, 3.75), [N], anchor: "south", padding: 3pt)
  line((-2, 2.25), (-2, 1.75), (0, 1.75))
  line((2, 2.25), (2, 1.75), (0, 1.75))
  line((0, 1.75), (0, 1.4), mark: (end: ">"))
})
#let nut-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  let vertex(i, z) = (2 * calc.cos(i * 60deg), 2 * calc.sin(i * 60deg), z)
  let circle-points(z) = range(0, 121).map(i => (
    0.5 * calc.cos(i * 3deg),
    0.5 * calc.sin(i * 3deg),
    z,
  ))
  oblique-project((1, 0), (0.35, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(..range(0, 6).map(i => vertex(i, 2)), close: true)
    line(..(0, 5, 4, 3).map(i => vertex(i, 0)))
    line(..(0, 1, 2, 3).map(i => vertex(i, 0)), stroke: (
      dash: figure-style.dash,
    ))
    for i in range(0, 6) {
      line(vertex(i, 0), vertex(i, 2), stroke: (
        dash: if i == 1 or i == 2 { figure-style.dash } else { none },
      ))
    }
    line(..circle-points(2))
    line(..circle-points(0), stroke: (dash: figure-style.dash))
    let t = calc.atan(0.35)
    for a in (t, t + 180deg) {
      line(
        (0.5 * calc.cos(a), 0.5 * calc.sin(a), 0),
        (0.5 * calc.cos(a), 0.5 * calc.sin(a), 2),
        stroke: (dash: figure-style.dash),
      )
    }
  })
})
#let vector-diagram() = cetz.canvas(length: 6mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (0, 0)
  let b = (4, 0)
  let c = (0, 3)
  let d = (72 / 25, 21 / 25)
  let p = (216 / 25, 63 / 25)
  line(a, b, c, a, p, b)
  line(c, p)
  for (point, label, anchor) in (
    (a, $A$, "north-east"),
    (b, $B$, "north"),
    (c, $C$, "south-east"),
    (d, $D$, "south"),
    (p, $P$, "west"),
  ) {
    content(point, label, anchor: anchor, padding: 3pt)
  }
})
#let prism-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (0, 2, 0)
  let c = (3, 0, 0)
  let a1 = (3, -2, 2)
  let b1 = (3, 0, 2)
  let c1 = (6, -2, 2)
  let e = (1.5, 0, 0)
  let f = (3, 0, 1)
  oblique-project((1, 0), (0.5, -0.6), (0, 1.4), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, a1, a)
    line(a1, b1, c1)
    line(b, b1, c)
    line(a, c, stroke: (dash: figure-style.dash))
    line(a, b1, stroke: (dash: figure-style.dash))
    line(a, c1, stroke: (dash: figure-style.dash))
    line(e, f, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "north-west"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "south"),
      (c1, $C_1$, "south-west"),
      (e, $E$, "north-east"),
      (f, $F$, "west"),
    ) {
      content(point, label, anchor: anchor, padding: if point == b1 {
        10pt
      } else { 3pt })
    }
  })
})
#let triangle-diagram(auxiliary: false) = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (1, 1)
  let b = (0, 0)
  let c = (3, 0)
  let d = (7 / 3, 0)
  line(a, b, c, a, d)
  if auxiliary {
    line(a, (1, 0), stroke: (dash: figure-style.dash))
    content((1, 0), $H$, anchor: "north", padding: 3pt)
  }
  for (point, label, anchor) in (
    (a, $A$, "south"),
    (b, $B$, "north-east"),
    (c, $C$, "north-west"),
    (d, $D$, "north"),
  ) {
    content(point, label, anchor: anchor, padding: 3pt)
  }
})
#let bridge-diagram() = cetz.canvas(length: 0.42mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let h1(x) = x * x / 40
  let h2(x) = -x * x * x / 800 + 6 * x
  let a = 60
  let b = 20
  line(..range(0, 81).map(i => (-i, h1(i))))
  line(..range(0, 41).map(i => (i, h2(i))))
  line((-80, 160), (40, 160))
  line((-95, 0), (52, 0))
  line((-a, 160), (-a, h1(a)))
  line((b, 160), (b, h2(b)))
  line((0, 0), (0, 160), stroke: (dash: figure-style.dash))
  line((-a, 0), (-a, h1(a)), (0, h1(a)), stroke: (dash: figure-style.dash))
  line((b, 0), (b, h2(b)), (0, h2(b)), stroke: (dash: figure-style.dash))
  for (point, label, anchor) in (
    ((-80, 160), $A$, "south-east"),
    ((-a, 160), $C$, "south"),
    ((0, 160), $O'$, "south"),
    ((b, 160), $E$, "south"),
    ((40, 160), $B$, "south-west"),
    ((-a, h1(a)), $D$, "east"),
    ((b, h2(b)), $F$, "west"),
    ((-95, 0), $M$, "north"),
    ((52, 0), $N$, "north"),
    ((-a, 0), $D_1$, "north"),
    ((0, 0), $O$, "north-east"),
    ((b, 0), $F_1$, "north"),
  ) {
    content(point, label, anchor: anchor, padding: 3pt)
  }
  content((-30, h1(a)), $a$, anchor: "south", padding: 3pt)
  content((10, h2(b)), $b$, anchor: "south", padding: 3pt)
  content((-a, 40), $h_1$, anchor: "east", padding: 3pt)
  content((b, 50), $h_2$, anchor: "west", padding: 3pt)
})
#let pyramid-diagram() = cetz.canvas(length: 19mm, {
  import cetz.draw: *
  let o = (0, 0, 0)
  let a = (0, 0, 2)
  let b = (1, 0, 0)
  let c = (0, 2, 0)
  let d = (-1, 0, 0)
  let e = (0, 1, 1)
  let f = (0.75, 0.5, 0)
  oblique-project((-0.45, -0.4), (1, 0), (0, 1.3), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, a)
    line(e, f)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(b, d, e, stroke: (dash: figure-style.dash))
    line(a, o, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "south"),
      (b, $B$, "north-east"),
      (c, $C$, "west"),
      (d, $D$, "east"),
      (o, $O$, "east"),
      (e, $E$, "south-west"),
      (f, $F$, "north"),
    ) {
      content(point, label, anchor: anchor, padding: 3pt)
    }
  })
})

#section[填空题：本大题共 14 小题，每小题 5 分，共 70 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知集合 $A=\{-1,0,1,2\},B=\{0,2,3\}$，则 $A inter B=$#fill-placeholder()。],
  answers: ([$\{0,2\}$],),
  explanation: [同时属于集合 $A$ 与 $B$ 的元素为 $0,2$，故 $A inter B=\{0,2\}$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知 $i$ 是虚数单位，则复数 $z=(1+i)(2-i)$ 的实部是#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [$z=2-i+2i-i^2=3+i$，故实部为 $3$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知一组数据 $4,2a,3-a,5,6$ 的平均数为 $4$，则 $a$ 的值是#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [由平均数的定义，$4+2a+3-a+5+6=5 times 4$，解得 $a=2$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [将一颗质地均匀的正方体骰子先后抛掷 2 次，观察向上的点数，则点数和为 5 的概率是#fill-placeholder()。],
  answers: ([$1/9$],),
  explanation: [两次点数组成的有序数对共 $6^2=36$ 个，且等可能。点数和为 $5$ 的有 $(1,4),(2,3),(3,2),(4,1)$，故概率为 $4/36=1/9$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [如图是一个算法流程图。若输出 $y$ 的值为 $-2$，则输入 $x$ 的值是#fill-placeholder()。#figure(flowchart())],
  answers: ([$-3$],),
  explanation: [∵ $2^x>0$，输出 $-2$ 时必执行 $y=x+1$。由 $x+1=-2$ 得 $x=-3$，满足该分支的条件 $x<=0$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，若双曲线 $x^2/a^2-y^2/5=1$（$a>0$）的一条渐近线方程为 $y=sqrt(5)/2 x$，则该双曲线的离心率是#fill-placeholder()。],
  answers: ([$3/2$],),
  explanation: [由渐近线斜率得 $sqrt(5)/a=sqrt(5)/2$，故 $a=2$。焦半距 $c=sqrt(a^2+5)=3$，所以 $e=c/a=3/2$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知 $y=f(x)$ 是奇函数，当 $x>=0$ 时，$f(x)=x^(2/3)$，则 $f(-8)$ 的值是#fill-placeholder()。],
  answers: ([$-4$],),
  explanation: [∵ $f$ 是奇函数，∴ $f(-8)=-f(8)=-8^(2/3)=-4$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知 $sin^2(pi/4+alpha)=2/3$，则 $sin 2alpha$ 的值是#fill-placeholder()。],
  answers: ([$1/3$],),
  explanation: [由降幂公式，$sin^2(pi/4+alpha)=(1-cos(pi/2+2alpha))/2=(1+sin 2alpha)/2$，故 $sin 2alpha=2 times 2/3-1=1/3$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [如图，六角螺帽毛坯是由一个正六棱柱挖去一个圆柱所构成的。已知螺帽的底面正六边形边长为 $2 "cm"$，高为 $2 "cm"$，内孔半径为 $0.5 "cm"$，则此六角螺帽毛坯的体积是#fill-placeholder()$"cm"^3$。#figure(nut-diagram())],
  answers: ([$12sqrt(3)-pi/2$],),
  explanation: [正六边形由六个边长为 $2$ 的正三角形组成，底面积为 $6 times sqrt(3)/4 times 2^2=6sqrt(3)$。故所求体积为 $6sqrt(3) times 2-pi times 0.5^2 times 2=12sqrt(3)-pi/2$（$"cm"^3$）。],
)

#question(
  "fill-in",
  score: 5,
  stem: [将函数 $y=3sin(2x+pi/4)$ 的图象向右平移 $pi/6$ 个单位长度，则平移后的图象中与 $y$ 轴最近的对称轴的方程是#fill-placeholder()。],
  answers: ([$x=-5pi/24$],),
  explanation: [平移后的函数为 $y=3sin(2(x-pi/6)+pi/4)=3sin(2x-pi/12)$。其对称轴满足 $2x-pi/12=pi/2+k pi$，即 $x=7pi/24+k pi/2$（$k in ZZ$）。取 $k=-1$ 时，$|x|$ 最小，故所求方程为 $x=-5pi/24$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设 $\{a_n\}$ 是公差为 $d$ 的等差数列，$\{b_n\}$ 是公比为 $q$ 的等比数列。已知数列 $\{a_n+b_n\}$ 的前 $n$ 项和 $S_n=n^2-n+2^n-1$（$n in NN^*$），则 $d+q$ 的值是#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [由 $S_1=1$ 及 $S_n-S_(n-1)$，得 $a_n+b_n=2(n-1)+2^(n-1)$，对 $n>=1$ 均成立。相邻两式相减得 $d+(q-1)b_n=2+2^(n-1)$，再次作差得 $(q-1)^2 b_n=2^(n-1)$。该式右端非零，比较相邻两项得 $q=2$，进而 $b_n=2^(n-1),d=2$，故 $d+q=4$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知 $5x^2 y^2+y^4=1$（$x,y in RR$），则 $x^2+y^2$ 的最小值是#fill-placeholder()。],
  answers: ([$4/5$],),
  explanation: [∵ $y != 0$，∴ $x^2+y^2=(1-y^4)/(5y^2)+y^2=1/(5y^2)+4y^2/5>=2sqrt(4/25)=4/5$。当 $y^2=1/2,x^2=3/10$ 时满足已知条件且等号成立，故最小值为 $4/5$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [在 $triangle A B C$ 中，$A B=4,A C=3,angle B A C=90 degree$，$D$ 在边 $B C$ 上，延长 $A D$ 到 $P$，使得 $A P=9$。若 $arrow(P A)=m arrow(P B)+(3/2-m)arrow(P C)$（$m$ 为常数），则 $C D$ 的长度是#fill-placeholder()。#figure(vector-diagram())],
  answers: ([$0$ 或 $18/5$],),
  explanation: [#step[用向量确定点位][以 $A$ 为原点，$A B,A C$ 的方向分别为 $x,y$ 轴正方向，则 $B(4,0),C(0,3)$。已知向量式化为 $arrow(A P)=2m arrow(A B)+(3-2m)arrow(A C)$，故 $P(8m,9-6m)$。由 $A P=9$，得
      $ (8m)^2+(9-6m)^2=81, quad 4m(25m-27)=0. $
      ∴ $m=0$ 或 $27/25$。]
    #step[计入端点情形][$m=0$ 时，$P(0,9)$，射线 $A P$ 与 $B C$ 交于 $C$，故 $D=C,C D=0$。
      $m=27/25$ 时，$P(216/25,63/25)$。因 $B C$ 的方程为 $x/4+y/3=1$，而 $P$ 的两项之和为 $3$，故 $D=P/3=(72/25,21/25)$。于是 $C D=sqrt((72/25)^2+(21/25-3)^2)=18/5$。]],
)

#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，已知 $P(sqrt(3)/2,0)$，$A,B$ 是圆 $C:x^2+(y-1/2)^2=36$ 上的两个动点，满足 $P A=P B$，则 $triangle P A B$ 面积的最大值是#fill-placeholder()。],
  answers: ([$10sqrt(5)$],),
  explanation: [圆心为 $C(0,1/2)$，$P C=1$。由 $P A=P B,C A=C B$，得 $P C$ 为弦 $A B$ 的垂直平分线。设圆心到弦的距离为 $d$，则 $0<=d<6$，$A B=2sqrt(36-d^2)$，点 $P$ 到弦的距离不超过 $d+1$，且把弦放在圆心背向 $P$ 的一侧可取等号。于是
    $ S_(triangle P A B)<=sqrt(36-d^2)(d+1). $
    令 $u(d)=(36-d^2)(d+1)^2$，则 $u'(d)=2(d+1)(-2d^2-d+36)=-2(d+1)(2d+9)(d-4)$。故 $u$ 在 $[0,4]$ 上递增，在 $[4,6)$ 上递减。取 $d=4$ 及上述弦的位置，面积达到最大值 $sqrt(20) times 5=10sqrt(5)$。],
)

#section[解答题：本大题共 6 小题，共 90 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [在三棱柱 $A B C-A_1 B_1 C_1$ 中，$A B perp A C$，$B_1 C perp "平面" A B C$，$E,F$ 分别是 $A C,B_1 C$ 的中点。#figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [求证：$E F parallel "平面" A B_1 C_1$；],
      answers: ([证明见解析。],),
      explanation: [在 $triangle A C B_1$ 中，$E,F$ 分别是 $A C,C B_1$ 的中点，故 $E F parallel A B_1$。
        平面 $A C B_1$ 与平面 $A B_1 C_1$ 相交于 $A B_1$；$E$ 为 $A C$ 的中点，故 $E ∉ "平面" A B_1 C_1$，从而 $E F$ 不在该平面内。又 $A B_1$ 在该平面内，∴ $E F parallel "平面" A B_1 C_1$。],
    ),
    subquestion(
      stem: [求证：平面 $A B_1 C perp "平面" A B B_1$。],
      answers: ([证明见解析。],),
      explanation: [由 $B_1 C perp "平面" A B C$，得 $A B perp B_1 C$。又 $A B perp A C$，$A C inter B_1 C={C}$，故 $A B perp "平面" A B_1 C$。∵ $A B$ 在平面 $A B B_1$ 内，∴ 平面 $A B_1 C perp "平面" A B B_1$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $a=3,c=sqrt(2),B=45 degree$。#figure(triangle-diagram())],
  parts: (
    subquestion(
      stem: [求 $sin C$ 的值；],
      answers: ([$sqrt(5)/5$。],),
      explanation: [过 $A$ 作 $A H perp B C$，垂足为 $H$。∵ $A B=sqrt(2),B=45 degree$，∴ $A H=B H=1$，从而 $H C=2,A C=sqrt(5)$。
        #figure(triangle-diagram(auxiliary: true))
        故 $sin C=(A H)/(A C)=sqrt(5)/5$。],
    ),
    subquestion(
      stem: [在边 $B C$ 上取一点 $D$，使得 $cos angle A D C=-4/5$，求 $tan angle D A C$ 的值。],
      answers: ([$2/11$。],),
      explanation: [沿用（1）中的垂足 $H$。∵ $angle A D C$ 为钝角，∴ $D$ 在 $H C$ 内，且 $cos angle A D H=4/5,sin angle A D H=3/5$。故 $D H=4/3$，$tan angle D A H=4/3$；又 $tan angle C A H=2$，所以
        $
          tan angle D A C=tan(angle C A H-angle D A H)=(2-4/3)/(1+2 times 4/3)=2/11.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [某地准备在山谷中建一座桥梁，桥址位置的竖直截面图如图所示：谷底 $O$ 在水平线 $M N$ 上，桥 $A B$ 与 $M N$ 平行，$O O'$ 为铅垂线（$O'$ 在 $A B$ 上）。经测量，左侧曲线 $A O$ 上任一点 $D$ 到 $M N$ 的距离 $h_1$（米）与 $D$ 到 $O O'$ 的距离 $a$（米）之间满足关系式 $h_1=1/40 a^2$；右侧曲线 $B O$ 上任一点 $F$ 到 $M N$ 的距离 $h_2$（米）与 $F$ 到 $O O'$ 的距离 $b$（米）之间满足关系式 $h_2=-1/800 b^3+6b$。已知点 $B$ 到 $O O'$ 的距离为 40 米。#figure(bridge-diagram())],
  parts: (
    subquestion(
      stem: [求桥 $A B$ 的长度；],
      answers: ([120 米。],),
      explanation: [桥面距水平线 $M N$ 的高度为 $O O'=-1/800 times 40^3+6 times 40=160$（米）。故 $(O'A)^2/40=160$，得 $O'A=80$（米）。于是 $A B=O'A+O'B=80+40=120$（米）。],
    ),
    subquestion(
      stem: [计划在谷底两侧建造平行于 $O O'$ 的桥墩 $C D$ 和 $E F$，且 $C E$ 为 80 米，其中 $C,E$ 在 $A B$ 上（不包括端点）。桥墩 $E F$ 每米造价 $k$（万元）、桥墩 $C D$ 每米造价 $3/2 k$（万元）（$k>0$）。问 $O'E$ 为多少米时，桥墩 $C D$ 与 $E F$ 的总造价最低？],
      answers: ([$O'E=20$ 米。],),
      explanation: [设 $O'E=x$ 米，则 $0<x<40,O'C=80-x$。总造价为
        $
          T(x)=k(160+x^3/800-6x)+3/2 k(160-(80-x)^2/40)
          =k(160+x^3/800-3x^2/80).
        $
        $ T'(x)=(3k)/800 x(x-20). $
        ∵ $k>0$，∴ $T$ 在 $(0,20)$ 上递减，在 $(20,40)$ 上递增。因此，当 $O'E=20$ 米时，总造价最低。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [在平面直角坐标系 $x O y$ 中，已知椭圆 $E:x^2/4+y^2/3=1$ 的左、右焦点分别为 $F_1,F_2$，点 $A$ 在椭圆 $E$ 上且在第一象限内，$A F_2 perp F_1 F_2$，直线 $A F_1$ 与椭圆 $E$ 相交于另一点 $B$。],
  parts: (
    subquestion(
      stem: [求 $triangle A F_1 F_2$ 的周长；],
      answers: ([$6$。],),
      explanation: [椭圆的长半轴长为 $2$，焦半距为 $sqrt(4-3)=1$。由椭圆定义，$A F_1+A F_2=4$，故周长为 $4+F_1 F_2=6$。],
    ),
    subquestion(
      stem: [在 $x$ 轴上任取一点 $P$，直线 $A P$ 与椭圆 $E$ 的右准线相交于点 $Q$，求 $arrow(O P) dot arrow(Q P)$ 的最小值；],
      answers: ([$-4$。],),
      explanation: [由题意得 $A(1,3/2)$，右准线方程为 $x=4$。设 $P(u,0)$，因直线 $A P$ 与准线相交，故 $u != 1$。记 $Q(4,v)$，则
        $ arrow(O P) dot arrow(Q P)=(u,0) dot (u-4,-v)=(u-2)^2-4>=-4. $
        $u=2$ 时，直线 $A P$ 与准线确有交点且等号成立，故最小值为 $-4$。],
    ),
    subquestion(
      stem: [设点 $M$ 在椭圆 $E$ 上，记 $triangle O A B$ 与 $triangle M A B$ 的面积分别为 $S_1,S_2$，若 $S_2=3S_1$，求点 $M$ 的坐标。],
      answers: ([$(2,0)$ 或 $(-2/7,-12/7)$。],),
      explanation: [#step[将面积关系化为直线方程][由 $F_1(-1,0),A(1,3/2)$，得直线 $A B$ 的方程为 $3x-4y+3=0$。点 $O$ 到该直线的距离为 $3/5$，故 $M(x,y)$ 到该直线的距离为 $9/5$，即
          $ |3x-4y+3|=9. $
          因此 $3x-4y=6$ 或 $3x-4y=-12$。]
        #step[分别与椭圆联立][对椭圆上的点，柯西不等式给出
          $
            |3x-4y|=|6 times x/2-4sqrt(3) times y/sqrt(3)|<=sqrt(36+48)=2sqrt(21)<12.
          $
          故第二种情形不可能。将 $y=3/4(x-2)$ 代入椭圆方程，得 $7x^2-12x-4=0$，解得 $x=2$ 或 $-2/7$。对应 $y=0$ 或 $-12/7$，故所求点为 $(2,0)$ 或 $(-2/7,-12/7)$。]],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知关于 $x$ 的函数 $y=f(x),y=g(x)$ 与 $h(x)=k x+b$（$k,b in RR$）在区间 $D$ 上恒有 $f(x)>=h(x)>=g(x)$。],
  parts: (
    subquestion(
      stem: [若 $f(x)=x^2+2x,g(x)=-x^2+2x,D=(-infinity,+infinity)$，求 $h(x)$ 的表达式；],
      answers: ([$h(x)=2x$。],),
      explanation: [令 $x=0$，得 $0>=b>=0$，故 $b=0$。由 $f(x)>=h(x)$，得 $x^2+(2-k)x>=0$ 对所有实数 $x$ 成立，因此判别式 $(2-k)^2<=0$，得 $k=2$。此时 $f(x)-h(x)=h(x)-g(x)=x^2>=0$，故 $h(x)=2x$。],
    ),
    subquestion(
      stem: [若 $f(x)=x^2-x+1,g(x)=k ln x,h(x)=k x-k,D=(0,+infinity)$，求 $k$ 的取值范围；],
      answers: ([$[0,3]$。],),
      explanation: [#step[由下界确定 $k>=0$][令 $u(x)=x-1-ln x$，则 $u'(x)=(x-1)/x$，故 $u(x)>=u(1)=0$，且仅在 $x=1$ 时取等号。因此 $h(x)-g(x)=k u(x)>=0$ 对 $x>0$ 恒成立的充要条件为 $k>=0$。]
        #step[再检验上界][当 $k>=0$ 时，$f(x)-h(x)=x^2-(k+1)x+k+1$ 的对称轴 $x=(k+1)/2>0$，所以它在 $(0,+infinity)$ 上非负，当且仅当
          $ (k+1)^2-4(k+1)=(k+1)(k-3)<=0. $
          结合 $k>=0$，得 $k in [0,3]$。]],
    ),
    subquestion(
      stem: [若 $f(x)=x^4-2x^2,g(x)=4x^2-8,h(x)=4(t^3-t)x-3t^4+2t^2$（$0<|t|<=sqrt(2)$），$D=[m,n] subset.eq [-sqrt(2),sqrt(2)]$，求证：$n-m<=sqrt(7)$。],
      answers: ([证明见解析。],),
      explanation: [#step[当 $0<t^2<1$ 时，利用上界限制区间][恒等式
          $ f(x)-h(x)=(x-t)^2(x^2+2t x+3t^2-2) $
          给出 $f(-t)-h(-t)=8t^2(t^2-1)<0$。所以 $-t ∉ [m,n]$，即 $n< -t$ 或 $m>-t$。结合区间包含关系，得
          $ n-m<=sqrt(2)+|t|<sqrt(2)+1<sqrt(7). $]
        #step[当 $1<=t^2<=2$ 时，利用下界限制区间][由 $h(x)>=g(x)$，得
          $ 4x^2-4(t^3-t)x+3t^4-2t^2-8<=0. $
          其解集为两实根 $r_1<=r_2$ 之间的区间，故
          $ n-m<=r_2-r_1=sqrt(t^6-5t^4+3t^2+8). $
          令 $v=t^2 in [1,2]$，$F(v)=v^3-5v^2+3v+8$。因 $F'(v)=(3v-1)(v-3)<0$，故 $2=F(2)<=F(v)<=F(1)=7$，于是 $n-m<=sqrt(7)$。
          两种情形覆盖所有允许的 $t$，故结论成立。]],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知数列 $\{a_n\}$（$n in NN^*$）的首项 $a_1=1$，前 $n$ 项和为 $S_n$。设 $lambda$ 与 $k$ 是常数，若对一切正整数 $n$，均有 $S_(n+1)^(1/k)-S_n^(1/k)=lambda a_(n+1)^(1/k)$ 成立，则称此数列为“$lambda tilde k$”数列。],
  parts: (
    subquestion(
      stem: [若等差数列 $\{a_n\}$ 是“$lambda tilde 1$”数列，求 $lambda$ 的值；],
      answers: ([$1$。],),
      explanation: [由定义，$a_(n+1)=S_(n+1)-S_n=lambda a_(n+1)$。若 $lambda != 1$，则所有 $n>=2$ 的 $a_n$ 均为 $0$，这与 $a_1=1$ 且数列为等差数列矛盾。故 $lambda=1$，此时任意首项为 $1$ 的等差数列都符合定义。],
    ),
    subquestion(
      stem: [若数列 $\{a_n\}$ 是“$sqrt(3)/3 tilde 2$”数列，且 $a_n>0$，求数列 $\{a_n\}$ 的通项公式；],
      answers: ([$a_n=cases(1 & quad n=1, 3 times 4^(n-2) & quad n>=2)$。],),
      explanation: [令 $u=sqrt(S_(n+1)),v=sqrt(S_n)$，则 $u>v>0$，且 $u-v=sqrt(3)/3 sqrt(u^2-v^2)$。两边平方并约去 $u-v$，得 $3(u-v)=u+v$，即 $u=2v$。故 $S_(n+1)=4S_n$，由 $S_1=1$ 得 $S_n=4^(n-1)$。
        因此 $a_1=1$，$n>=2$ 时，$a_n=S_n-S_(n-1)=3 times 4^(n-2)$。],
    ),
    subquestion(
      stem: [对于给定的 $lambda$，是否存在三个不同的数列 $\{a_n\}$ 为“$lambda tilde 3$”数列，且 $a_n>=0$？若存在，求 $lambda$ 的取值范围；若不存在，说明理由。],
      answers: ([存在，$0<lambda<1$。],),
      explanation: [#step[证明必要性][∵ $a_1=1,a_n>=0$，∴ $S_n>=1$。若某一步 $a_(n+1)>0$，令 $r=(S_(n+1)/S_n)^(1/3)>1$，定义式给出
          $ lambda=(r-1)/(root(3, r^3-1)), quad lambda^3=(r-1)^2/(r^2+r+1). $
          因 $0<(r-1)^2<r^2+r+1$，故 $0<lambda<1$。若 $lambda$ 不在此范围内，则只能有 $a_n=0$（$n>=2$），满足条件的数列只有 $(1,0,0,dots)$，不可能有三个不同数列。]
        #step[对每个允许的 $lambda$ 构造三个数列][设 $0<lambda<1$。函数 $phi(r)=(r-1)^2/(r^2+r+1)$ 在 $(1,+infinity)$ 上连续，且
          $
            phi'(r)=(3(r^2-1))/(r^2+r+1)^2>0, quad phi(1)=0, quad lim_(r arrow +infinity) phi(r)=1.
          $
          所以存在 $r>1$ 使 $phi(r)=lambda^3$。取 $c=r^3-1>0$，则 $root(3, 1+c)-1=lambda root(3, c)$。
          现取三个不同数列：
          $ (1,0,0,0,dots), quad (1,c,0,0,dots), quad (1,0,c,0,dots). $
          在后项为零的每一步，定义式两端均为零；在出现 $c$ 的那一步，定义式恰为上述等式。因此三个数列均满足条件，故所求范围为 $(0,1)$。]],
    ),
  ),
)

#section[数学Ⅱ（附加题）：共 40 分。第 21 题选做，第 22、23 题必做。]
#question(
  "solution",
  score: 20,
  stem: [本题包括 A、B、C 三小题，请选定其中两小题作答，每小题 10 分。若多做，则按作答的前两小题评分。],
  parts: (
    subquestion(
      score: 10,
      stem: [【A】选修 4-2：矩阵与变换。平面上点 $A(2,-1)$ 在矩阵 $M=mat(a, 1; -1, b)$ 对应的变换作用下得到点 $B(3,-4)$。],
      parts: (
        subquestion(
          stem: [求实数 $a,b$ 的值；],
          answers: ([$a=b=2$。],),
          explanation: [$mat(a, 1; -1, b) mat(2; -1)=mat(3; -4)$，故 $2a-1=3,-2-b=-4$，解得 $a=b=2$。],
        ),
        subquestion(
          stem: [求矩阵 $M$ 的逆矩阵 $M^(-1)$。],
          answers: ([$M^(-1)=1/5 mat(2, -1; 1, 2)$。],),
          explanation: [由（i）得 $M=mat(2, 1; -1, 2)$，其行列式为 $2 times 2-1 times (-1)=5 != 0$。因此 $M^(-1)=1/5 mat(2, -1; 1, 2)$。],
        ),
      ),
    ),
    subquestion(
      score: 10,
      stem: [【B】选修 4-4：坐标系与参数方程。在极坐标系中，已知点 $A(rho_1,pi/3)$ 在直线 $l:rho cos theta=2$ 上，点 $B(rho_2,pi/6)$ 在圆 $C:rho=4sin theta$ 上（其中 $rho>=0,0<=theta<2pi$）。],
      parts: (
        subquestion(
          stem: [求 $rho_1,rho_2$ 的值；],
          answers: ([$rho_1=4,rho_2=2$。],),
          explanation: [将给定极角分别代入方程，得 $rho_1 cos(pi/3)=2,rho_2=4sin(pi/6)$，故 $rho_1=4,rho_2=2$。],
        ),
        subquestion(
          stem: [求出直线 $l$ 与圆 $C$ 的公共点的极坐标。],
          answers: ([$(2sqrt(2),pi/4)$。],),
          explanation: [以极点为原点、极轴为 $x$ 轴正半轴建立平面直角坐标系。直线和圆的方程分别为 $x=2$ 和 $x^2+(y-2)^2=4$。联立得唯一公共点 $(2,2)$。在指定的极坐标范围内，对应的极坐标为 $(2sqrt(2),pi/4)$。],
        ),
      ),
    ),
    subquestion(
      score: 10,
      stem: [【C】选修 4-5：不等式选讲。设 $x in RR$，解不等式 $2|x+1|+|x|<=4$。],
      answers: ([$[-2,2/3]$。],),
      explanation: [#step[按绝对值零点分段][当 $x< -1$ 时，原不等式为 $-3x-2<=4$，得 $-2<=x< -1$。
          当 $-1<=x<=0$ 时，原不等式为 $x+2<=4$，整个区间均满足。
          当 $x>0$ 时，原不等式为 $3x+2<=4$，得 $0<x<=2/3$。]
        合并得解集为 $[-2,2/3]$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [在三棱锥 $A-B C D$ 中，已知 $C B=C D=sqrt(5),B D=2$，$O$ 为 $B D$ 的中点，$A O perp "平面" B C D$，$A O=2$，$E$ 为 $A C$ 的中点。#figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [求直线 $A B$ 与 $D E$ 所成角的余弦值；],
      answers: ([$sqrt(15)/15$。],),
      explanation: [∵ $C B=C D$，$O$ 为 $B D$ 的中点，∴ $C O perp B D$，且 $C O=sqrt(5-1)=2$。以 $O$ 为原点，$O B,O C,O A$ 分别为三条坐标轴的正方向，则
        $ A(0,0,2),B(1,0,0),C(0,2,0),D(-1,0,0),E(0,1,1). $
        所以 $arrow(A B)=(1,0,-2),arrow(D E)=(1,1,1)$，直线夹角的余弦值为
        $
          (|arrow(A B) dot arrow(D E)|)/(|arrow(A B)| |arrow(D E)|)=1/(sqrt(5)sqrt(3))=sqrt(15)/15.
        $],
    ),
    subquestion(
      stem: [若点 $F$ 在 $B C$ 上，满足 $B F=1/4 B C$，设二面角 $F-D E-C$ 的大小为 $theta$，求 $sin theta$ 的值。],
      answers: ([$2sqrt(39)/13$。],),
      explanation: [沿用（1）的坐标系，$F(3/4,1/2,0)$，所以 $arrow(D C)=(1,2,0),arrow(D F)=(7/4,1/2,0)$。
        平面 $D E C$ 的一个法向量为 $bold(n)_1=(-2,1,1)$，平面 $D E F$ 的一个法向量为 $bold(n)_2=(2,-7,5)$，分别与所在平面的两条相交直线垂直。故
        $
          cos^2 theta=(bold(n)_1 dot bold(n)_2)^2/(|bold(n)_1|^2 |bold(n)_2|^2)=36/(6 times 78)=1/13.
        $
        ∴ $sin theta=sqrt(1-1/13)=2sqrt(39)/13$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [甲口袋中装有 2 个黑球和 1 个白球，乙口袋中装有 3 个白球。现从甲、乙两口袋中各任取一个球交换放入另一口袋，重复 $n$ 次这样的操作，记甲口袋中黑球个数为 $X_n$，恰有 2 个黑球的概率为 $p_n$，恰有 1 个黑球的概率为 $q_n$。],
  parts: (
    subquestion(
      stem: [求 $p_1,q_1$ 和 $p_2,q_2$；],
      answers: ([$p_1=1/3,q_1=2/3,p_2=7/27,q_2=16/27$。],),
      explanation: [第一次交换时，甲袋取出白球或黑球，分别得到 $X_1=2$ 或 $1$，故 $p_1=1/3,q_1=2/3$。
        若甲袋已有 2 个黑球，下一次仍有 2 个的概率为 $1/3$，变成 1 个的概率为 $2/3$。
        若甲袋已有 1 个黑球，则两袋都为 1 黑 2 白。下一次甲袋有 2 个黑球的概率为 $2/3 times 1/3=2/9$；仍有 1 个的概率为 $(1/3)^2+(2/3)^2=5/9$。
        因此 $p_2=1/3 times 1/3+2/3 times 2/9=7/27$，$q_2=1/3 times 2/3+2/3 times 5/9=16/27$。],
    ),
    subquestion(
      stem: [求 $2p_n+q_n$ 与 $2p_(n-1)+q_(n-1)$ 的递推关系式和 $X_n$ 的数学期望 $E(X_n)$（用 $n$ 表示）。],
      answers: (
        [$2p_n+q_n=1/3(2p_(n-1)+q_(n-1))+2/3$（$n>=2$），$E(X_n)=1+3^(-n)$。],
      ),
      explanation: [#step[列出状态转移关系][由（1），当 $n>=2$ 时，$p_n=1/3 p_(n-1)+2/9 q_(n-1)$。若甲袋没有黑球，下一次有 1 个黑球的概率为 $2/3$，所以
          $
            q_n=2/3 p_(n-1)+5/9 q_(n-1)+2/3(1-p_(n-1)-q_(n-1))=2/3-1/9 q_(n-1).
          $
          合并得 $2p_n+q_n=1/3(2p_(n-1)+q_(n-1))+2/3$。]
        #step[求期望通项][设 $u_n=2p_n+q_n$，则 $u_n-1=1/3(u_(n-1)-1)$，且 $u_1=4/3$，所以 $u_n=1+3^(-n)$。
          $X_n$ 的可能值为 $0,1,2$，对应概率为 $1-p_n-q_n,q_n,p_n$，故 $E(X_n)=q_n+2p_n=1+3^(-n)$。]],
    ),
  ),
)
