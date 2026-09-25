#import "/src/lib.typ": (
  cetz, exam, figure-style, fill-placeholder, oblique-project, plot, question,
  section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "江苏卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019江苏.pdf",
  regions: ("江苏",),
)

#let flowchart() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.85, 6.9), (0.85, 7.7), radius: 0.18)
  content((0, 7.3), [开始])
  rect((-1.6, 5.8), (1.6, 6.6))
  content((0, 6.2), [$x=1,S=0$])
  rect((-1.6, 3.9), (1.6, 5.1))
  content((0, 4.5), [$S=S+x/2$])
  line((0, 3.3), (1.4, 2.7), (0, 2.1), (-1.4, 2.7), close: true)
  content((0, 2.7), [$x>=4$？])
  rect((2.3, 4.1), (5.1, 4.9))
  content((3.7, 4.5), [$x=x+1$])
  line((-1.2, 0.6), (1, 0.6), (1.2, 1.4), (-1, 1.4), close: true)
  content((0, 1), [输出 $S$])
  rect((-0.85, -0.9), (0.85, -0.1), radius: 0.18)
  content((0, -0.5), [结束])
  for (a, b) in (
    ((0, 6.9), (0, 6.6)),
    ((0, 5.8), (0, 5.1)),
    ((0, 3.9), (0, 3.3)),
    ((0, 2.1), (0, 1.4)),
    ((0, 0.6), (0, -0.1)),
  ) { line(a, b, mark: (end: ">")) }
  line((1.4, 2.7), (3.7, 2.7), (3.7, 4.1), mark: (end: ">"))
  line((3.7, 4.9), (3.7, 5.45), (0, 5.45), mark: (end: ">"))
  content((1.7, 2.8), [否], anchor: "south")
  content((0.15, 1.75), [是], anchor: "west")
})

#let cuboid-diagram() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (4, 0, 0)
  let c = (4, 3, 0)
  let d = (0, 3, 0)
  let a1 = (0, 0, 10)
  let b1 = (4, 0, 10)
  let c1 = (4, 3, 10)
  let d1 = (0, 3, 10)
  let e = (4, 3, 5)
  oblique-project((1, 0), (0.3, 0.3), (0, 0.25), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(b, e)
    line(b, d, e, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "south-east"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south-east"),
      (e, $E$, "west"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})

#let triangle-diagram() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (3, calc.sqrt(3))
  let b = (0, 0)
  let c = (4, 0)
  let d = (2, 0)
  let e = (2, 2 * calc.sqrt(3) / 3)
  let o = (2.5, calc.sqrt(3) / 2)
  line(a, b, c, close: true)
  line(a, d)
  line(c, e)
  for (point, label, anchor) in (
    (a, $A$, "south"),
    (b, $B$, "north-east"),
    (c, $C$, "north-west"),
    (d, $D$, "north"),
    (e, $E$, "south-east"),
    (o, $O$, "west"),
  ) { content(point, label, anchor: anchor, padding: 3pt) }
})

#let prism-diagram() = cetz.canvas(length: 20mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (2, 2, 0)
  let a1 = (0, 0, 2)
  let b1 = (2, 0, 2)
  let c1 = (2, 2, 2)
  let d = (2, 1, 0)
  let e = (1, 1, 0)
  oblique-project((1, 0), (-0.35, -0.4), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, c, b, b1, a1, a)
    line(a1, c1, b1)
    line(c, c1)
    line(e, c1, d)
    line(a, b, e, d, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "west"),
      (c, $C$, "north"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "south-west"),
      (c1, $C_1$, "west"),
      (d, $D$, "north-west"),
      (e, $E$, "north-east"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})

#let ellipse-diagram() = cetz.canvas(length: 6mm, {
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
  plot.plot(
    size: (9, 9.2),
    axis-style: "school-book",
    x-min: -3.5,
    x-max: 5.5,
    y-min: -4.5,
    y-max: 4.7,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      let style = (stroke: (paint: black, thickness: figure-style.thickness))
      plot.add(
        range(181).map(i => {
          let t = i * 2 * calc.pi / 180
          (1 + 4 * calc.cos(t), 4 * calc.sin(t))
        }),
        style: style,
      )
      plot.add(
        range(181).map(i => {
          let t = i * 2 * calc.pi / 180
          (2 * calc.cos(t), calc.sqrt(3) * calc.sin(t))
        }),
        style: style,
      )
      plot.annotate(resize: false, {
        line((1, -0.3), (1, 4.5))
        line((1, 4), (-2.2, -2.4), (1, 0))
        line((-1, 0), (1, 1.5))
        for (point, label, anchor) in (
          ((1, 4), $A$, "south-west"),
          ((-2.2, -2.4), $B$, "north-east"),
          ((1, 1.5), $D$, "south-west"),
          ((-1, -1.5), $E$, "north"),
          ((-1, 0), $F_1$, "south-east"),
          ((1, 0), $F_2$, "north-west"),
          ((1, 3), $l$, "west"),
        ) { content(point, label, anchor: anchor, padding: 3pt) }
      })
    },
  )
})

#let lake-diagram(auxiliary: false) = cetz.canvas(
  length: if auxiliary { 2.2mm } else { 3mm },
  {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let a = (4, 3)
    let b = (-4, -3)
    let c = (4, 9)
    let d = (-4, 9)
    circle((0, 0), radius: 5)
    line(a, b)
    line(a, c, stroke: (dash: figure-style.dash))
    line(b, d, stroke: (dash: figure-style.dash))
    line(
      (if auxiliary { -15 } else { -8 }, 9),
      (if auxiliary { 21 } else { 10 }, 9),
    )
    circle((0, 0), radius: 0.07, fill: black, stroke: none)
    for (point, label, anchor) in (
      (a, $A$, "west"),
      (b, $B$, "north-east"),
      (c, $C$, "south"),
      (d, $D$, "south"),
      ((0, 0), $O$, "north-west"),
      ((if auxiliary { 21 } else { 10 }, 9), $l$, "south"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
    if auxiliary {
      let p = (-13, 9)
      let q = (4 + 3 * calc.sqrt(21), 9)
      line(p, b)
      line(q, a)
      content(p, $P$, anchor: "south", padding: 3pt)
      content(q, $Q$, anchor: "south", padding: 3pt)
    }
  },
)

#section[填空题：本大题共 14 小题，每小题 5 分，共 70 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知集合 $A={-1,0,1,6}$，$B={x | x>0,x in RR}$，则 $A inter B=$#fill-placeholder()。],
  answers: ([${1,6}$],),
  explanation: [$A$ 中的正数为 $1,6$，故 $A inter B={1,6}$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知复数 $(a+2i)(1+i)$ 的实部为 $0$，其中 $i$ 为虚数单位，则实数 $a$ 的值是#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [$(a+2i)(1+i)=(a-2)+(a+2)i$，故 $a-2=0$，即 $a=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图是一个算法流程图，则输出的 $S$ 的值是#fill-placeholder()。#figure(flowchart())],
  answers: ([$5$],),
  explanation: [循环依次取 $x=1,2,3,4$，累加后得到 $S=1/2+2/2+3/2+4/2=5$。此时 $x>=4$ 成立，输出 $5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [函数 $y=sqrt(7+6x-x^2)$ 的定义域是#fill-placeholder()。],
  answers: ([$[-1,7]$],),
  explanation: [由 $7+6x-x^2>=0$，得 $(x+1)(x-7)<=0$，即 $-1<=x<=7$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知一组数据 $6,7,8,8,9,10$，则该组数据的方差是#fill-placeholder()。],
  answers: ([$5/3$],),
  explanation: [平均数为 $8$，故方差为 $[(6-8)^2+(7-8)^2+(8-8)^2+(8-8)^2+(9-8)^2+(10-8)^2]/6=5/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [从 $3$ 名男同学和 $2$ 名女同学中任选 $2$ 名同学参加志愿者服务，则选出的 $2$ 名同学中至少有 $1$ 名女同学的概率是#fill-placeholder()。],
  answers: ([$7/10$],),
  explanation: [共有 $binom(5, 2)=10$ 种等可能取法。没有女生的取法有 $binom(3, 2)=3$ 种，故所求概率为 $1-3/10=7/10$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，若双曲线 $x^2-y^2/b^2=1$（$b>0$）经过点 $(3,4)$，则该双曲线的渐近线方程是#fill-placeholder()。],
  answers: ([$y=plus.minus sqrt(2)x$],),
  explanation: [将 $(3,4)$ 代入，得 $9-16/b^2=1$，故 $b^2=2$。渐近线方程为 $y=plus.minus b x=plus.minus sqrt(2)x$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知数列 ${a_n}$（$n in NN^+$）是等差数列，$S_n$ 是其前 $n$ 项和。若 $a_2a_5+a_8=0$，$S_9=27$，则 $S_8$ 的值是#fill-placeholder()。],
  answers: ([$16$],),
  explanation: [由 $S_9=9a_5=27$，得 $a_5=3$。设公差为 $d$，则 $a_2=3-3d$，$a_8=3+3d$。代入得 $3(3-3d)+3+3d=0$，解得 $d=2$，于是 $a_9=a_5+4d=11$，$S_8=S_9-a_9=16$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，长方体 $A B C D-A_1 B_1 C_1 D_1$ 的体积是 $120$，$E$ 为 $C C_1$ 的中点，则三棱锥 $E-B C D$ 的体积是#fill-placeholder()。#figure(cuboid-diagram())],
  answers: ([$10$],),
  explanation: [三棱锥底面积为长方体底面积的 $1/2$，高为长方体高的 $1/2$，故体积为 $1/3 times 1/2 times 1/2 times 120=10$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，$P$ 是曲线 $y=x+4/x$（$x>0$）上的一个动点，则点 $P$ 到直线 $x+y=0$ 的距离的最小值是#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [∵ $x>0$，∴ 距离为 $d=(2x+4/x)/sqrt(2)>=2sqrt(2x dot 4/x)/sqrt(2)=4$。当且仅当 $2x=4/x$，即 $x=sqrt(2)$ 时取等。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，点 $A$ 在曲线 $y=ln x$ 上，且该曲线在点 $A$ 处的切线经过点 $(-e,-1)$（$e$ 为自然对数的底数），则点 $A$ 的坐标是#fill-placeholder()。],
  answers: ([$(e,1)$],),
  explanation: [设 $A=(t,ln t)$，$t>0$，切线方程为 $y-ln t=(x-t)/t$。代入 $(-e,-1)$ 得 $t ln t=e$，从而 $t>1$。函数 $t ln t$ 在 $(1,+infinity)$ 上严格递增，且 $e ln e=e$，故唯一解为 $t=e$，即 $A=(e,1)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，在 $triangle A B C$ 中，$D$ 是 $B C$ 的中点，$E$ 在边 $A B$ 上，$B E=2E A$，$A D$ 与 $C E$ 交于点 $O$。若 $arrow(A B) dot arrow(A C)=6arrow(A O) dot arrow(E C)$，则 $(A B)/(A C)$ 的值是#fill-placeholder()。#figure(triangle-diagram())],
  answers: ([$sqrt(3)$],),
  explanation: [设 $arrow(A B)=bold(u)$、$arrow(A C)=bold(v)$。由两条线段的交点关系得 $arrow(A O)=(bold(u)+bold(v))/4$，又 $arrow(E C)=bold(v)-bold(u)/3$。故
    $
      6arrow(A O) dot arrow(E C)=3/2(bold(u)+bold(v)) dot (bold(v)-bold(u)/3)=bold(u) dot bold(v)-1/2|bold(u)|^2+3/2|bold(v)|^2.
    $
    与题设比较得 $|bold(u)|^2=3|bold(v)|^2$，即 $(A B)/(A C)=sqrt(3)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $(tan alpha)/(tan(alpha+pi/4))=-2/3$，则 $sin(2alpha+pi/4)$ 的值是#fill-placeholder()。],
  answers: ([$sqrt(2)/10$],),
  explanation: [令 $t=tan alpha$，由 $t(1-t)/(t+1)=-2/3$，得 $3t^2-5t-2=0$，故 $t=2$ 或 $t=-1/3$。两种情形均有
    $sin(2alpha+pi/4)=sqrt(2)/2 dot (2t+1-t^2)/(1+t^2)=sqrt(2)/10.$],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $f(x),g(x)$ 是定义在 $RR$ 上的两个周期函数，$f(x)$ 的周期为 $4$，$g(x)$ 的周期为 $2$，且 $f(x)$ 是奇函数。当 $x in (0,2]$ 时，$f(x)=sqrt(1-(x-1)^2)$，$g(x)=cases(k(x+2)&quad 0<x<=1, -1/2&quad 1<x<=2)$，其中 $k>0$。若在区间 $(0,9]$ 上，关于 $x$ 的方程 $f(x)=g(x)$ 有 $8$ 个不同的实数根，则 $k$ 的取值范围是#fill-placeholder()。],
  answers: ([$[1/3,sqrt(2)/4)$],),
  explanation: [
    #step[按周期统计交点][$f$ 在 $(0,2)$ 为上半圆，在 $(2,4)$ 为下半圆，并以 $4$ 为周期重复。$g=-1/2$ 的水平线段与 $f$ 在 $(0,9]$ 上共有两个交点，分别位于 $(3,4)$、$(7,8)$。$g>0$ 时只有 $(0,1]$、$(4,5]$、$(8,9]$ 上可能相交，这三段交点数相同。因此 $(0,1]$ 上须恰有两个交点。]
    #step[确定参数范围][在 $(0,1]$ 上，方程等价于 $h(x)=k$，其中 $h(x)=sqrt(2x-x^2)/(x+2)$。其导数为
      $ h'(x)=(2-3x)/((x+2)^2 sqrt(2x-x^2)). $
      故 $h$ 在 $(0,2/3)$ 上递增，在 $(2/3,1]$ 上递减，且 $lim_(x->0^+)h(x)=0$，$h(2/3)=sqrt(2)/4$，$h(1)=1/3$。恰有两个交点的充要条件为 $1/3<=k<sqrt(2)/4$。]
  ],
)

#section[解答题：本大题共 6 小题，共 90 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 的对边分别为 $a,b,c$。],
  parts: (
    subquestion(
      stem: [若 $a=3c$，$b=sqrt(2)$，$cos B=2/3$，求 $c$ 的值。],
      answers: ([$sqrt(3)/3$],),
      explanation: [由余弦定理得 $2=(3c)^2+c^2-2 dot 3c dot c dot 2/3=6c^2$。∵ $c>0$，∴ $c=sqrt(3)/3$。],
    ),
    subquestion(
      stem: [若 $(sin A)/a=(cos B)/(2b)$，求 $sin(B+pi/2)$ 的值。],
      answers: ([$(2sqrt(5))/5$],),
      explanation: [由正弦定理，$(sin A)/a=(sin B)/b$，故 $cos B=2sin B>0$。于是 $5cos^2 B=4$，得 $cos B=(2sqrt(5))/5$，从而 $sin(B+pi/2)=(2sqrt(5))/5$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在直三棱柱 $A B C-A_1 B_1 C_1$ 中，$D,E$ 分别为 $B C,A C$ 的中点，$A B=B C$。求证：#figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [$A_1 B_1 parallel$ 平面 $D E C_1$。],
      answers: ([证明见解析。],),
      explanation: [∵ $D,E$ 为两边中点，∴ $D E parallel A B$。又 $A B parallel A_1 B_1$，故 $D E parallel A_1 B_1$。∵ $D E subset$ 平面 $D E C_1$，$A_1 B_1$ 不在该平面内，∴ $A_1 B_1 parallel$ 平面 $D E C_1$。],
    ),
    subquestion(
      stem: [$B E perp C_1 E$。],
      answers: ([证明见解析。],),
      explanation: [∵ $A B=B C$，$E$ 为 $A C$ 中点，∴ $B E perp A C$。直三棱柱中 $C C_1 perp$ 平面 $A B C$，故 $B E perp C C_1$。又 $A C inter C C_1=C$，∴ $B E perp$ 平面 $A_1 A C C_1$。由 $C_1 E subset$ 该平面，得 $B E perp C_1 E$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在平面直角坐标系 $x O y$ 中，椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的焦点为 $F_1(-1,0),F_2(1,0)$。过 $F_2$ 作 $x$ 轴的垂线 $l$，在 $x$ 轴的上方，$l$ 与圆 $F_2:(x-1)^2+y^2=4a^2$ 交于点 $A$，与椭圆 $C$ 交于点 $D$。连接 $A F_1$ 并延长交圆 $F_2$ 于点 $B$，连接 $B F_2$ 交椭圆 $C$ 于点 $E$，连接 $D F_1$。已知 $D F_1=5/2$。#figure(ellipse-diagram())],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 的标准方程。],
      answers: ([$x^2/4+y^2/3=1$],),
      explanation: [$F_1 F_2=2$，故 $c=1$。在直角三角形 $D F_1 F_2$ 中，$D F_2=sqrt((5/2)^2-2^2)=3/2$。由椭圆定义，$2a=D F_1+D F_2=4$，得 $a=2$，$b^2=a^2-c^2=3$。],
    ),
    subquestion(
      stem: [求点 $E$ 的坐标。],
      answers: ([$(-1,-3/2)$],),
      explanation: [
        #step[求点 $B$][$A=(1,4)$，故直线 $A F_1$ 为 $y=2x+2$。与圆 $(x-1)^2+y^2=16$ 联立，得 $5x^2+6x-11=0$。除去 $A$ 的横坐标 $1$，得 $B=(-11/5,-12/5)$。]
        #step[确定线段上的交点][直线 $B F_2$ 为 $y=3/4(x-1)$。代入椭圆得 $7x^2-6x-13=0$，解得 $x=-1$ 或 $x=13/7$。∵ $E$ 在线段 $B F_2$ 上，横坐标不超过 $1$，∴ $E=(-1,-3/2)$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [如图，一个湖的边界是圆心为 $O$ 的圆，湖的一侧有一条直线型公路 $l$，湖上有桥 $A B$（$A B$ 是圆 $O$ 的直径）。规划在公路 $l$ 上选两个点 $P,Q$，并修建两段直线型道路 $P B,Q A$。规划要求：线段 $P B,Q A$ 上的所有点到点 $O$ 的距离均不小于圆 $O$ 的半径。已知点 $A,B$ 到直线 $l$ 的距离分别为 $A C$ 和 $B D$（$C,D$ 为垂足），测得 $A B=10$，$A C=6$，$B D=12$（单位：百米）。#figure(lake-diagram())],
  parts: (
    subquestion(
      stem: [若道路 $P B$ 与桥 $A B$ 垂直，求道路 $P B$ 的长。],
      answers: ([$15$ 百米。],),
      explanation: [以 $O$ 为原点、垂直于公路且指向公路的方向为 $y$ 轴正方向建系。圆半径为 $5$，圆心到公路的距离为 $(6+12)/2=9$。不妨取 $A=(4,3)$，$B=(-4,-3)$，则 $l:y=9$，$C=(4,9)$，$D=(-4,9)$。∵ $A B$ 的斜率为 $3/4$，∴ 垂直道路的方程为 $y+3=-4/3(x+4)$。与 $y=9$ 联立得 $P=(-13,9)$，故 $P B=sqrt(9^2+12^2)=15$（百米）。],
    ),
    subquestion(
      stem: [在规划要求下，$P$ 和 $Q$ 中能否有一个点选在 $D$ 处？并说明理由。],
      answers: ([均不能。],),
      explanation: [
        #step[将规划要求转为方向条件][从圆上点 $X$ 向点 $Y$ 作线段，线段上点的向量为 $bold(x)+t bold(v)$，其中 $bold(x)=arrow(O X)$、$bold(v)=arrow(X Y)$、$0<=t<=1$。其到圆心的距离平方为 $25+2t bold(x) dot bold(v)+t^2|bold(v)|^2$，全段不进入圆内当且仅当 $bold(x) dot bold(v)>=0$。]
        #step[分别检验两条道路][设 $P=(p,9)$，$Q=(q,9)$。对道路 $B P$，条件为 $(-4,-3) dot (p+4,12)=-4p-52>=0$，即 $p<=-13$。对道路 $A Q$，条件为 $(4,3) dot (q-4,6)=4q+2>=0$，即 $q>=-1/2$。$D$ 的横坐标为 $-4$，两条件均不满足，故 $P,Q$ 均不能取在 $D$ 处。]
      ],
    ),
    subquestion(
      stem: [在规划要求下，若道路 $P B$ 和 $Q A$ 的长度均为 $d$（单位：百米），求当 $d$ 最小时，$P,Q$ 两点间的距离。],
      answers: ([$17+3sqrt(21)$ 百米。],),
      explanation: [由第（2）问，$p<=-13$，故 $P B=sqrt((p+4)^2+144)>=15$，等号当且仅当 $p=-13$。要使 $Q A=15$，需 $(q-4)^2+36=225$，即 $q=4 plus.minus 3sqrt(21)$。其中仅 $q=4+3sqrt(21)$ 满足 $q>=-1/2$。因此 $d$ 的最小值为 $15$，此时
        $ P Q=(4+3sqrt(21))-(-13)=17+3sqrt(21) "（百米）". $
        #figure(lake-diagram(auxiliary: true))],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [设函数 $f(x)=(x-a)(x-b)(x-c)$，$a,b,c in RR$，$f'(x)$ 为 $f(x)$ 的导函数。],
  parts: (
    subquestion(
      stem: [若 $a=b=c$，$f(4)=8$，求 $a$ 的值。],
      answers: ([$2$],),
      explanation: [由 $(4-a)^3=8$，得 $4-a=2$，故 $a=2$。],
    ),
    subquestion(
      stem: [若 $a!=b$，$b=c$，且 $f(x)$ 和 $f'(x)$ 的零点均在集合 ${-3,1,3}$ 中，求 $f(x)$ 的极小值。],
      answers: ([$-32$],),
      explanation: [$f(x)=(x-a)(x-b)^2$，故 $f'(x)=3(x-b)(x-(2a+b)/3)$。数 $(2a+b)/3$ 严格介于 $a,b$ 之间，因而三数互异，只能有 $a,b$ 分别取端点 $-3,3$ 且 $(2a+b)/3=1$，解得 $a=3,b=-3$。于是 $f'(x)=3(x+3)(x-1)$，在 $x=1$ 处由负变正，故极小值为 $f(1)=(1-3)(1+3)^2=-32$。],
    ),
    subquestion(
      stem: [若 $a=0$，$0<b<=1$，$c=1$，且 $f(x)$ 的极大值为 $M$，求证：$M<=4/27$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[确定极大值点的位置][$f'(x)=3x^2-2(b+1)x+b$ 有两个不同实根。较小的根 $x_1=(b+1-sqrt(b^2-b+1))/3$ 是极大值点，且 $0<x_1<1$。]
        #step[构造不含参数的上界][在 $0<x<1$ 上，∵ $b<=1$，∴ $f(x)=x(b-x)(1-x)<=x(1-x)^2$。令 $h(x)=x(1-x)^2$，则 $h'(x)=(1-x)(1-3x)$，故其在 $(0,1)$ 上的最大值为 $h(1/3)=4/27$。因此 $M=f(x_1)<=h(x_1)<=4/27$。等号在 $b=1$ 时可以取到。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [定义首项为 $1$ 且公比为正数的等比数列为“$M$－数列”。],
  parts: (
    subquestion(
      stem: [已知等比数列 ${a_n}$（$n in NN^+$）满足：$a_2a_4=a_5$，$a_3-4a_2+4a_1=0$，求证：数列 ${a_n}$ 为“$M$－数列”。],
      answers: ([证明见解析。],),
      explanation: [设首项为 $a_1$，公比为 $q$，其中 $a_1q!=0$。由 $a_1^2q^4=a_1q^4$，得 $a_1=1$；再由 $a_1(q-2)^2=0$，得 $q=2>0$，故为“$M$－数列”。],
    ),
    subquestion(
      stem: [已知数列 ${b_n}$（$n in NN^+$）满足：$b_1=1$，$1/S_n=2/b_n-2/b_(n+1)$，其中 $S_n$ 为数列 ${b_n}$ 的前 $n$ 项和。],
      parts: (
        subquestion(
          stem: [求数列 ${b_n}$ 的通项公式。],
          answers: ([$b_n=n$],),
          explanation: [用数学归纳法。$b_1=1$ 成立。若 $b_j=j$ 对 $1<=j<=n$ 成立，则 $S_n=n(n+1)/2$，递推式给出
            $ 2/(n(n+1))=2/n-2/b_(n+1), $
            解得 $b_(n+1)=n+1$。故 $b_n=n$ 对所有正整数 $n$ 成立。],
        ),
        subquestion(
          stem: [设 $m$ 为正整数，若存在“$M$－数列”${c_n}$（$n in NN^+$），对任意正整数 $k$，当 $k<=m$ 时，都有 $c_k<=b_k<=c_(k+1)$ 成立，求 $m$ 的最大值。],
          answers: ([$5$],),
          explanation: [设 ${c_n}$ 的公比为 $q>0$，条件等价于 $q^(k-1)<=k<=q^k$（$1<=k<=m$）。
            #step[排除 $m>=6$][取 $k=3,6$，分别得 $q^3>=3$、$q^5<=6$，从而 $q^15>=243$ 且 $q^15<=216$，矛盾。因此 $m<=5$。]
            #step[证明 $m=5$ 可以实现][取 $q=root(3, 3)$。对 $k=1,2,3,4,5$，将不等式两边立方后，分别需要 $3^(k-1)<=k^3<=3^k$。依次为 $1<=1<=3$、$3<=8<=9$、$9<=27<=27$、$27<=64<=81$、$81<=125<=243$，全部成立。故最大值为 $5$。]
          ],
        ),
      ),
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
      stem: [【A】选修 4-2：矩阵与变换。已知矩阵 $A=mat(3, 1; 2, 2)$。],
      parts: (
        subquestion(
          stem: [求 $A^2$。],
          answers: ([$mat(11, 5; 10, 6)$],),
          explanation: [$A^2=mat(3 dot 3+1 dot 2, 3 dot 1+1 dot 2; 2 dot 3+2 dot 2, 2 dot 1+2 dot 2)=mat(11, 5; 10, 6)$。],
        ),
        subquestion(
          stem: [求矩阵 $A$ 的特征值。],
          answers: ([$1,4$],),
          explanation: [特征多项式为 $(lambda-3)(lambda-2)-2=lambda^2-5lambda+4=(lambda-1)(lambda-4)$，故特征值为 $1,4$。],
        ),
      ),
    ),
    subquestion(
      score: 10,
      stem: [【B】选修 4-4：坐标系与参数方程。在极坐标系中，已知两点 $A(3,pi/4)$，$B(sqrt(2),pi/2)$，直线 $l$ 的方程为 $rho sin(theta+pi/4)=3$。],
      parts: (
        subquestion(
          stem: [求 $A,B$ 两点间的距离。],
          answers: ([$sqrt(5)$],),
          explanation: [由余弦定理，$A B^2=3^2+(sqrt(2))^2-2 dot 3 dot sqrt(2) cos(pi/4)=5$，故 $A B=sqrt(5)$。],
        ),
        subquestion(
          stem: [求点 $B$ 到直线 $l$ 的距离。],
          answers: ([$2$],),
          explanation: [以极点为原点、极轴为 $x$ 轴正半轴建系，得 $B=(0,sqrt(2))$，$l:x+y=3sqrt(2)$。故距离为 $frac(|sqrt(2)-3sqrt(2)|, sqrt(2))=2$。],
        ),
      ),
    ),
    subquestion(
      score: 10,
      stem: [【C】选修 4-5：不等式选讲。设 $x in RR$，解不等式 $|x|+|2x-1|>2$。],
      answers: ([$(-infinity,-1/3) union (1,+infinity)$],),
      explanation: [当 $x<0$ 时，原不等式为 $1-3x>2$，得 $x< -1/3$；当 $0<=x<=1/2$ 时，原不等式为 $1-x>2$，无解；当 $x>1/2$ 时，原不等式为 $3x-1>2$，得 $x>1$。故解集为 $(-infinity,-1/3) union (1,+infinity)$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [设 $(1+x)^n=a_0+a_1x+a_2x^2+dots+a_n x^n$，$n>=4$，$n in NN^+$。已知 $a_3^2=2a_2a_4$。],
  parts: (
    subquestion(
      stem: [求 $n$ 的值。],
      answers: ([$5$],),
      explanation: [$a_k=binom(n, k)$，故
        $ ((n(n-1)(n-2))/6)^2=2 dot (n(n-1))/2 dot (n(n-1)(n-2)(n-3))/24. $
        ∵ $n>=4$，∴ 可约去公因子，得 $2(n-2)=3(n-3)$，即 $n=5$。],
    ),
    subquestion(
      stem: [设 $(1+sqrt(3))^n=a+b sqrt(3)$，其中 $a,b in NN^+$，求 $a^2-3b^2$ 的值。],
      answers: ([$-32$],),
      explanation: [由第（1）问知 $n=5$。二项展开式中，偶次幂给出有理部分，奇次幂给出 $sqrt(3)$ 的系数，因此 $(1-sqrt(3))^5=a-b sqrt(3)$。于是
        $a^2-3b^2=(a+b sqrt(3))(a-b sqrt(3))=[(1+sqrt(3))(1-sqrt(3))]^5=(-2)^5=-32.$],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [在平面直角坐标系 $x O y$ 中，设点集 $A_n={(0,0),(1,0),(2,0),dots,(n,0)}$，$B_n={(0,1),(n,1)}$，$C_n={(0,2),(1,2),(2,2),dots,(n,2)}$，$n in NN^+$。令 $M_n=A_n union B_n union C_n$。从集合 $M_n$ 中任取两个不同的点，用随机变量 $X$ 表示它们之间的距离。],
  parts: (
    subquestion(
      stem: [当 $n=1$ 时，求 $X$ 的概率分布。],
      answers: ([分布列见解析。],),
      explanation: [$M_1$ 有 $6$ 个点，共 $binom(6, 2)=15$ 对。距离为 $1,sqrt(2),2,sqrt(5)$ 的点对数依次为 $7,4,2,2$，故分布列为
        #table(
          columns: 5,
          align: center,
          [$X$], [$1$], [$sqrt(2)$], [$2$], [$sqrt(5)$],
          [$P$], [$7/15$], [$4/15$], [$2/15$], [$2/15$],
        )],
    ),
    subquestion(
      stem: [对给定的正整数 $n$（$n>=3$），求概率 $P(X<=n)$（用 $n$ 表示）。],
      answers: ([$1-6/binom(2n+4, 2)$],),
      explanation: [共有 $2n+4$ 个点，等可能点对数为 $binom(2n+4, 2)$。若两点横坐标之差不超过 $n-1$，则距离平方不超过 $(n-1)^2+4<=n^2$。因此 $X>n$ 当且仅当横坐标之差为 $n$、纵坐标不同。这只能从左侧三个点 $(0,0),(0,1),(0,2)$ 和右侧三个点 $(n,0),(n,1),(n,2)$ 中各取一个，除去同高的 $3$ 对，共 $3 times 3-3=6$ 对。故 $P(X<=n)=1-6/binom(2n+4, 2)$。],
    ),
  ),
)
