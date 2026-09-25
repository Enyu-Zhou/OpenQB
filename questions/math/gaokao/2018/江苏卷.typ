#import "/src/lib.typ": (
  cetz, exam, figure-style, fill-placeholder, oblique-project, plot, question,
  section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "江苏卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018江苏.pdf",
  regions: ("江苏",),
)

#let octahedron() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  oblique-project((1, 0), (0.4, 0.4), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(
      (0, 0, 0),
      (2, 0, 0),
      (2, 2, 0),
      (2, 2, 2),
      (0, 2, 2),
      (0, 0, 2),
      (0, 0, 0),
    )
    line((0, 0, 2), (2, 0, 2), (2, 2, 2))
    line((2, 0, 0), (2, 0, 2))
    line((0, 0, 0), (0, 2, 0), (2, 2, 0), stroke: (dash: figure-style.dash))
    line((0, 2, 0), (0, 2, 2), stroke: (dash: figure-style.dash))
    let ring = ((1, 0, 1), (2, 1, 1), (1, 2, 1), (0, 1, 1))
    line(..ring, close: true, stroke: (dash: figure-style.dash))
    for p in ring {
      line((1, 1, 0), p, (1, 1, 2), stroke: (dash: figure-style.dash))
    }
  })
})
#let parallelepiped() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (2, 2, 0)
  let d = (0, 2, 0)
  let a1 = (1, 0, calc.sqrt(3))
  let b1 = (3, 0, calc.sqrt(3))
  let c1 = (3, 2, calc.sqrt(3))
  let d1 = (1, 2, calc.sqrt(3))
  oblique-project((1, 0), (0.65, 0.3), (-0.25, 1.2), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(a, b1)
    line(a1, b)
    line(a1, c, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "north-east"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "south"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})
#let farm() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let lo = calc.asin(0.25)
  let t = calc.sqrt(15)
  let h = calc.sqrt(16 - 2.8 * 2.8)
  arc((0, 0), start: -lo, stop: 180deg + lo, radius: 4, anchor: "origin")
  line((-t, -1), (t, -1))
  line((-2.8, -1), (-2.8, h), (2.8, h), (2.8, -1))
  line((-2.8, h), (0, 4), (2.8, h))
  line((0, 0), (2.8, h))
  line((-4, 0), (4, 0), stroke: (dash: figure-style.dash))
  line((0, -1), (0, 4), stroke: (dash: figure-style.dash))
  for (p, label, anchor) in (
    ((0, 0), $O$, "north-east"),
    ((0, 4), $P$, "south"),
    ((-t, -1), $M$, "north-east"),
    ((t, -1), $N$, "north-west"),
    ((-2.8, -1), $A$, "north"),
    ((2.8, -1), $B$, "north"),
    ((-2.8, h), $D$, "south-east"),
    ((2.8, h), $C$, "south-west"),
  ) { content(p, label, anchor: anchor, padding: 3pt) }
})
#let conics() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: $O$,
  ))
  plot.plot(
    size: (5.2, 4.4),
    axis-style: "school-book",
    x-min: -2.6,
    x-max: 2.6,
    y-min: -2.2,
    y-max: 2.2,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.annotate(resize: false, {
        circle((0, 0), radius: (2, 1))
        circle((0, 0), radius: calc.sqrt(3))
        content((-calc.sqrt(3), 0), $F_1$, anchor: "north-west", padding: 3pt)
        content((calc.sqrt(3), 0), $F_2$, anchor: "north-east", padding: 3pt)
      })
    },
  )
})
#let tangent-circle() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  circle((0, 0), radius: 2)
  line((-2, 0), (4, 0), (1, calc.sqrt(3)), (2, 0))
  for (p, label, anchor) in (
    ((-2, 0), $A$, "east"),
    ((0, 0), $O$, "north"),
    ((2, 0), $B$, "north"),
    ((4, 0), $P$, "west"),
    ((1, calc.sqrt(3)), $C$, "south"),
  ) { content(p, label, anchor: anchor, padding: 3pt) }
})
#let prism() = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  let a = (0, -1, 0)
  let b = (calc.sqrt(3), 0, 0)
  let c = (0, 1, 0)
  let a1 = (0, -1, 2)
  let b1 = (calc.sqrt(3), 0, 2)
  let c1 = (0, 1, 2)
  let p = (calc.sqrt(3) / 2, -0.5, 2)
  let q = (calc.sqrt(3) / 2, 0.5, 0)
  oblique-project((0.3, -0.3), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, c, stroke: (dash: figure-style.dash))
    line(b, p)
    line(q, c1)
    line(a, q, stroke: (dash: figure-style.dash))
    line(a, c1, stroke: (dash: figure-style.dash))
    for (v, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south-west"),
      (p, $P$, "north-east"),
      (q, $Q$, "west"),
    ) { content(v, label, anchor: anchor, padding: 3pt) }
  })
})

#section[填空题：本大题共 14 小题，每小题 5 分，共 70 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知集合 $A={0,1,2,8}$，$B={-1,1,6,8}$，那么 $A inter B=$#fill-placeholder()。],
  answers: ([${1,8}$],),
  explanation: [两集合的公共元素为 $1,8$，故交集为 ${1,8}$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若复数 $z$ 满足 $i dot z=1+2i$，其中 $i$ 是虚数单位，则 $z$ 的实部为#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [$z=(1+2i)/i=2-i$，实部为 $2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $5$ 位裁判给某运动员打出的分数的茎叶图如图所示，那么这 $5$ 位裁判打出的分数的平均数为#fill-placeholder()。
    #table(
      columns: 2,
      stroke: none,
      table.vline(x: 1, stroke: figure-style.thickness),
      [$8$],
      [$9 quad 9$],
      [$9$],
      [$0 quad 1 quad 1$],
    )],
  answers: ([$90$],),
  explanation: [分数为 $89,89,90,91,91$，平均数为 $(89+89+90+91+91)/5=90$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [一个算法的伪代码如图所示，执行此算法，最后输出的 $S$ 的值为#fill-placeholder()。
    #block(stroke: figure-style.thickness, inset: 6pt)[
      $I arrow.l 1$\
      $S arrow.l 1$\
      While $I<6$\
      #h(1em)$I arrow.l I+2$\
      #h(1em)$S arrow.l 2S$\
      End While\
      Print $S$
    ]],
  answers: ([$8$],),
  explanation: [三次循环后的 $(I,S)$ 依次为 $(3,2),(5,4),(7,8)$，此时 $I<6$ 不成立，输出 $8$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [函数 $f(x)=sqrt(log_2 x-1)$ 的定义域为#fill-placeholder()。],
  answers: ([$[2,+infinity)$],),
  explanation: [需 $x>0$ 且 $log_2 x-1>=0$，解得 $x>=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某兴趣小组有 $2$ 名男生和 $3$ 名女生，现从中任选 $2$ 名学生去参加活动，则恰好选中 $2$ 名女生的概率为#fill-placeholder()。],
  answers: ([$3/10$],),
  explanation: [等可能选法共 $C_5^2=10$ 种，选中两名女生有 $C_3^2=3$ 种，故概率为 $3/10$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $y=sin(2x+phi)$（$-pi/2<phi<pi/2$）的图象关于直线 $x=pi/3$ 对称，则 $phi$ 的值为#fill-placeholder()。],
  answers: ([$-pi/6$],),
  explanation: [$2pi/3+phi=pi/2+k pi$（$k in ZZ$），故 $phi=-pi/6+k pi$。结合范围得 $phi=-pi/6$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，若双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的右焦点 $F(c,0)$ 到一条渐近线的距离为 $sqrt(3)/2 c$，则其离心率的值是#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [焦点到渐近线 $b x-a y=0$ 的距离为 $(b c)/sqrt(a^2+b^2)=b$，故 $b=sqrt(3)c/2$，$a^2=c^2-b^2=c^2/4$，得 $e=c/a=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [函数 $f(x)$ 满足 $f(x+4)=f(x)$（$x in RR$），且在区间 $(-2,2]$ 上，$f(x)=cases(cos((pi x)/2) & quad 0<x<=2, |x+1/2| & quad -2<x<=0)$，则 $f(f(15))$ 的值为#fill-placeholder()。],
  answers: ([$sqrt(2)/2$],),
  explanation: [$f(15)=f(-1)=1/2$，故 $f(f(15))=f(1/2)=cos(pi/4)=sqrt(2)/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图所示，正方体的棱长为 $2$，以其所有面的中心为顶点的多面体的体积为#fill-placeholder()。#figure(octahedron())],
  answers: ([$4/3$],),
  explanation: [该多面体由两个全等的正四棱锥组成，每个锥的底面边长为 $sqrt(2)$，高为 $1$。故体积为 $2 times 1/3 times (sqrt(2))^2 times 1=4/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若函数 $f(x)=2x^3-a x^2+1$（$a in RR$）在 $(0,+infinity)$ 内有且只有一个零点，则 $f(x)$ 在 $[-1,1]$ 上的最大值与最小值的和为#fill-placeholder()。],
  answers: ([$-3$],),
  explanation: [若 $a<=0$，则正半轴上 $f(x)>0$。若 $a>0$，则 $f'(x)=2x(3x-a)$，函数先减后增，极小值为 $f(a/3)=1-a^3/27$。因 $f(0)=1$ 且右侧函数值最终为正，恰有一个正零点须极小值为 $0$，得 $a=3$。此时函数在 $[-1,0]$ 上递增，在 $[0,1]$ 上递减，最大值为 $f(0)=1$，最小值为 $f(-1)=-4$，和为 $-3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，$A$ 为直线 $l:y=2x$ 上在第一象限内的点，$B(5,0)$，以 $A B$ 为直径的圆 $C$ 与直线 $l$ 交于另一点 $D$。若 $arrow(A B) dot arrow(C D)=0$，则点 $A$ 的横坐标为#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [由圆周角定理，$B D perp l$，解 $y=2x$ 与 $y=-(x-5)/2$ 得 $D(1,2)$。设 $A(t,2t)$（$t>0$），则 $C((t+5)/2,t)$。数量积为零给出
    $ (5-t)(-(t+3)/2)-2t(2-t)=0, "即" t^2-2t-3=0. $
    舍去负根，得 $t=3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 所对的边分别为 $a,b,c$，$angle A B C=120 degree$，$angle A B C$ 的平分线交 $A C$ 于点 $D$，且 $B D=1$，则 $4a+c$ 的最小值为#fill-placeholder()。],
  answers: ([$9$],),
  explanation: [由 $S_(triangle A B C)=S_(triangle A B D)+S_(triangle B C D)$，得 $a c sin 120 degree=(a+c)sin 60 degree$，所以 $1/a+1/c=1$。于是
    $4a+c=(4a+c)(1/a+1/c)=5+c/a+(4a)/c>=9.$
    当 $a=3/2,c=3$ 时等号成立，故最小值为 $9$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知集合 $A={x|x=2n-1,n in NN^+}$，$B={x|x=2^n,n in NN^+}$。将 $A union B$ 的所有元素从小到大依次排列构成一个数列 $\{a_n\}$。记 $S_n$ 为数列 $\{a_n\}$ 的前 $n$ 项和，则使得 $S_n>12a_(n+1)$ 成立的 $n$ 的最小值为#fill-placeholder()。],
  answers: ([$27$],),
  explanation: [当 $n<=12$ 时，$S_n<n a_(n+1)<=12a_(n+1)$，不满足条件。
    当 $13<=n<=19$ 时，前 $n$ 项含 $2,4,8,16$ 及前 $n-4$ 个奇数，故
    $S_n-12a_(n+1)=(n-4)^2+30-12(2n-7)=n^2-32n+130<0.$
    当 $n=20$ 时，$S_20=286<12a_21=384$。
    当 $21<=n<=27$ 时，前 $n$ 项含 $2,4,8,16,32$ 及前 $n-5$ 个奇数，故
    $S_n-12a_(n+1)=(n-5)^2+62-12(2n-9)=n^2-34n+195.$
    此式在 $21<=n<=27$ 上递增，$n=26$ 时为 $-13$，$n=27$ 时为 $6$，故最小值为 $27$。],
)

#section[解答题：本大题共 6 小题，共 90 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [在平行六面体 $A B C D-A_1 B_1 C_1 D_1$ 中，$A A_1=A B$，$A B_1 perp B_1 C_1$。求证：#figure(parallelepiped())],
  parts: (
    subquestion(
      stem: [$A B parallel$ 平面 $A_1 B_1 C$；],
      answers: ([证明见解析。],),
      explanation: [平行六面体中 $A B parallel A_1 B_1$，且 $A B subset.not$ 平面 $A_1 B_1 C$，$A_1 B_1 subset$ 平面 $A_1 B_1 C$，故 $A B parallel$ 平面 $A_1 B_1 C$。],
    ),
    subquestion(
      stem: [平面 $A B B_1 A_1 perp$ 平面 $A_1 B C$。],
      answers: ([证明见解析。],),
      explanation: [四边形 $A B B_1 A_1$ 为菱形，故 $A B_1 perp A_1 B$。又 $B C parallel B_1 C_1$，由题设得 $A B_1 perp B C$。因 $A_1 B inter B C={B}$，得 $A B_1 perp$ 平面 $A_1 B C$。而 $A B_1 subset$ 平面 $A B B_1 A_1$，故两平面垂直。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知 $alpha,beta$ 为锐角，$tan alpha=4/3$，$cos(alpha+beta)=-sqrt(5)/5$。],
  parts: (
    subquestion(
      stem: [求 $cos 2alpha$ 的值；],
      answers: ([$-7/25$],),
      explanation: [$cos 2alpha=(1-tan^2 alpha)/(1+tan^2 alpha)=-7/25$。],
    ),
    subquestion(
      stem: [求 $tan(alpha-beta)$ 的值。],
      answers: ([$-2/11$],),
      explanation: [由 $0<alpha+beta<pi$，得 $sin(alpha+beta)=2sqrt(5)/5$，故 $tan(alpha+beta)=-2$。又 $tan 2alpha=-24/7$，所以
        $tan(alpha-beta)=tan(2alpha-(alpha+beta))=frac(-24/7+2, 1+(-24/7)(-2))=-2/11.$],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [某农场有一块农田，如图所示，它的边界由圆 $O$ 的一段圆弧 $overparen(M P N)$（$P$ 为此圆弧的中点）和线段 $M N$ 构成。已知圆 $O$ 的半径为 $40$ 米，点 $P$ 到 $M N$ 的距离为 $50$ 米。现规划在此农田上修建两个温室大棚，大棚Ⅰ内的地块形状为矩形 $A B C D$，大棚Ⅱ内的地块形状为 $triangle C D P$，要求 $A,B$ 均在线段 $M N$ 上，$C,D$ 均在圆弧上。设 $O C$ 与 $M N$ 所成的角为 $theta$。#figure(farm())],
  parts: (
    subquestion(
      stem: [用 $theta$ 分别表示矩形 $A B C D$ 和 $triangle C D P$ 的面积，并确定 $sin theta$ 的取值范围；],
      answers: (
        [$S_(A B C D)=800(4sin theta+1)cos theta$ 平方米，$S_(triangle C D P)=1600(1-sin theta)cos theta$ 平方米，$sin theta in [1/4,1)$。],
      ),
      explanation: [圆心到 $M N$ 的距离为 $50-40=10$ 米。矩形宽为 $80cos theta$，高为 $40sin theta+10$；三角形以 $C D$ 为底的高为 $40-40sin theta$，代入面积公式即得两式。因矩形底边不超出 $M N$，有 $40cos theta<=sqrt(40^2-10^2)$，结合非退化条件，得 $sin theta in [1/4,1)$。],
    ),
    subquestion(
      stem: [若大棚Ⅰ内种植甲种蔬菜，大棚Ⅱ内种植乙种蔬菜，且甲、乙两种蔬菜的单位面积年产值之比为 $4:3$。求当 $theta$ 为何值时，能使甲、乙两种蔬菜的年总产值最大。],
      answers: ([$pi/6$],),
      explanation: [设两种单位面积年产值为 $4k,3k$（$k>0$），总产值为 $8000k(sin theta+1)cos theta$。令 $h(theta)=(sin theta+1)cos theta$，则
        $h'(theta)=1-2sin^2 theta-sin theta=-2(sin theta-1/2)(sin theta+1).$
        故函数在 $theta=pi/6$ 左侧递增、右侧递减，该角符合取值范围，年总产值在此取最大值。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [如图，在平面直角坐标系 $x O y$ 中，椭圆 $C$ 过点 $(sqrt(3),1/2)$，焦点为 $F_1(-sqrt(3),0),F_2(sqrt(3),0)$，圆 $O$ 的直径为 $F_1 F_2$。#figure(conics())],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 及圆 $O$ 的方程；],
      answers: ([$C:x^2/4+y^2=1$，圆 $O:x^2+y^2=3$。],),
      explanation: [设椭圆长、短半轴分别为 $a,b$，则 $a^2-b^2=3$，$3/a^2+1/(4b^2)=1$，解得 $a^2=4,b^2=1$。圆心为原点，半径为 $sqrt(3)$，故得两方程。],
    ),
    subquestion(stem: [设直线 $l$ 与圆 $O$ 相切于第一象限内的点 $P$。], parts: (
      subquestion(
        stem: [若直线 $l$ 与椭圆 $C$ 有且只有一个公共点，求点 $P$ 的坐标；],
        answers: ([$(sqrt(2),1)$],),
        explanation: [设 $P(u,v)$，则 $u,v>0$，$u^2+v^2=3$，切线为 $u x+v y=3$。与椭圆联立消去 $y$，得
          $(4u^2+v^2)x^2-24u x+36-4v^2=0.$
          判别式 $Delta=48v^2(u^2-2)$。恰有一个公共点须 $u^2=2$，故 $P(sqrt(2),1)$。],
      ),
      subquestion(
        stem: [直线 $l$ 与椭圆 $C$ 交于 $A,B$ 两点。若 $triangle O A B$ 的面积为 $(2sqrt(6))/7$，求直线 $l$ 的方程。],
        answers: ([$y=-sqrt(5)x+3sqrt(2)$],),
        explanation: [沿用上一小问的记号和联立方程，有
          $A B^2=(1+u^2/v^2)Delta/(4u^2+v^2)^2=(16(u^2-2))/(u^2+1)^2.$
          又原点到 $l$ 的距离为 $sqrt(3)$，所以 $A B=(4sqrt(2))/7$。令 $t=u^2 in (2,3)$，得 $16(t-2)/(t+1)^2=32/49$，化简为 $(2t-5)(t-20)=0$，故 $t=5/2$。于是 $u=sqrt(10)/2,v=sqrt(2)/2$，切线为 $y=-sqrt(5)x+3sqrt(2)$。],
      ),
    )),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [记 $f'(x),g'(x)$ 分别为函数 $f(x),g(x)$ 的导函数。若存在 $x_0 in RR$，满足 $f(x_0)=g(x_0)$ 且 $f'(x_0)=g'(x_0)$，则称 $x_0$ 为函数 $f(x)$ 与 $g(x)$ 的一个“$S$ 点”。],
  parts: (
    subquestion(
      stem: [证明：函数 $f(x)=x$ 与 $g(x)=x^2+2x-2$ 不存在“$S$ 点”；],
      answers: ([证明见解析。],),
      explanation: [导数相等须 $1=2x_0+2$，得 $x_0=-1/2$。此时 $f(x_0)=-1/2$，$g(x_0)=-11/4$，函数值不等，故不存在“$S$ 点”。],
    ),
    subquestion(
      stem: [若函数 $f(x)=a x^2-1$ 与 $g(x)=ln x$ 存在“$S$ 点”，求实数 $a$ 的值；],
      answers: ([$e/2$],),
      explanation: [设“$S$ 点”为 $x_0>0$，则 $a x_0^2-1=ln x_0$，$2a x_0=1/x_0$。所以 $a x_0^2=1/2$，$ln x_0=-1/2$，得 $x_0=e^(-1/2),a=e/2$。代回两式均成立。],
    ),
    subquestion(
      stem: [已知函数 $f(x)=-x^2+a$，$g(x)=(b e^x)/x$。对任意 $a>0$，判断是否存在 $b>0$，使函数 $f(x)$ 与 $g(x)$ 在区间 $(0,+infinity)$ 内存在“$S$ 点”，并说明理由。],
      answers: ([存在，证明见解析。],),
      explanation: [令 $h(x)=x^3-3x^2-a x+a$。因 $h(0)=a>0$，$h(1)=-2<0$，存在 $x_0 in (0,1)$ 使 $h(x_0)=0$。取
        $b=(2x_0^3)/(e^(x_0)(1-x_0))>0.$
        由 $h(x_0)=0$，得 $(a-x_0^2)(1-x_0)=2x_0^2$，故
        $f(x_0)=a-x_0^2=(2x_0^2)/(1-x_0)=g(x_0).$
        同时 $g'(x)=(b e^x (x-1))/x^2$，代入得 $g'(x_0)=-2x_0=f'(x_0)$。因此该 $b$ 满足要求。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [设 $\{a_n\}$ 是首项为 $a_1$，公差为 $d$ 的等差数列，$\{b_n\}$ 是首项为 $b_1$，公比为 $q$ 的等比数列。],
  parts: (
    subquestion(
      stem: [设 $a_1=0,b_1=1,q=2$，若 $|a_n-b_n|<=b_1$ 对 $n=1,2,3,4$ 均成立，求 $d$ 的取值范围；],
      answers: ([$[7/3,5/2]$],),
      explanation: [$a_n=(n-1)d$，$b_n=2^(n-1)$。$n=1$ 时自动成立，$n=2,3,4$ 分别给出 $1<=d<=3$、$3<=2d<=5$、$7<=3d<=9$。取交集得 $d in [7/3,5/2]$。],
    ),
    subquestion(
      stem: [若 $a_1=b_1>0$，$m in NN^+$，$q in (1,root(m, 2)]$，证明：存在 $d in RR$，使得 $|a_n-b_n|<=b_1$ 对 $n=2,3,dots,m+1$ 均成立，并求 $d$ 的取值范围（用 $b_1,m,q$ 表示）。],
      answers: ([$[b_1(q^m-2)/m,(b_1 q^m)/m]$。],),
      explanation: [令 $j=n-1$，要求等价于
        $b_1(q^j-2)/j<=d<=(b_1 q^j)/j quad (1<=j<=m).$
        因 $1<q^j<=2$，取 $d=0$ 即满足，故所求 $d$ 存在。
        设 $L(x)=(q^x-2)/x$，$U(x)=q^x/x$。在 $1<=x<=m$ 上，$q^x<=2$，$x ln q<=ln 2<1$，因此
        $L'(x)=(q^x x ln q+2-q^x)/x^2>0, quad U'(x)=q^x (x ln q-1)/x^2<0.$
        故左端最大值、右端最小值均在 $j=m$ 取得，得到上述闭区间；$m=1$ 时直接代入也成立。],
    ),
  ),
)

#section[数学Ⅱ（附加题）：共 40 分。第 21 题选做，第 22、23 题必做。]
#question(
  "solution",
  score: 20,
  stem: [本题包括 A、B、C、D 四小题，请选定其中两小题作答，每小题 10 分。若多做，则按作答的前两小题评分。],
  parts: (
    subquestion(
      score: 10,
      stem: [【A】选修 4-1：几何证明选讲。如图，圆 $O$ 的半径为 $2$，$A B$ 为圆 $O$ 的直径，$P$ 为 $A B$ 延长线上一点，过 $P$ 作圆 $O$ 的切线，切点为 $C$。若 $P C=2sqrt(3)$，求 $B C$ 的长。#figure(tangent-circle())],
      answers: ([$2$],),
      explanation: [连接 $O C$，则 $O C perp P C$，$O P=sqrt(O C^2+P C^2)=4$。因 $O B=2$，$B$ 为直角三角形 $O C P$ 的斜边中点，故 $B C=(O P)/2=2$。],
    ),
    subquestion(
      score: 10,
      stem: [【B】选修 4-2：矩阵与变换。已知矩阵 $A=mat(2, 3; 1, 2)$。],
      parts: (
        subquestion(
          stem: [求 $A$ 的逆矩阵 $A^(-1)$；],
          answers: ([$mat(2, -3; -1, 2)$],),
          explanation: [因 $det A=2 times 2-3 times 1=1$，故 $A^(-1)=mat(2, -3; -1, 2)$。],
        ),
        subquestion(
          stem: [若点 $P$ 在矩阵 $A$ 对应的变换作用下得到点 $P'(3,1)$，求点 $P$ 的坐标。],
          answers: ([$(3,-1)$],),
          explanation: [设 $P(x,y)$，则 $mat(x; y)=A^(-1)mat(3; 1)=mat(3; -1)$，故 $P(3,-1)$。],
        ),
      ),
    ),
    subquestion(
      score: 10,
      stem: [【C】选修 4-4：坐标系与参数方程。在极坐标系中，直线 $l$ 的方程为 $rho sin(pi/6-theta)=2$，曲线 $C$ 的方程为 $rho=4cos theta$，求直线 $l$ 被曲线 $C$ 截得的弦长。],
      answers: ([$2sqrt(3)$],),
      explanation: [化为直角坐标方程，得 $l:x-sqrt(3)y=4$，$C:(x-2)^2+y^2=4$。圆心到直线的距离为 $frac(|2-4|, 2)=1$，故弦长为 $2sqrt(2^2-1^2)=2sqrt(3)$。],
    ),
    subquestion(
      score: 10,
      stem: [【D】选修 4-5：不等式选讲。若 $x,y,z$ 为实数，且 $x+2y+2z=6$，求 $x^2+y^2+z^2$ 的最小值。],
      answers: ([$4$],),
      explanation: [由柯西不等式，$36=(x+2y+2z)^2<=(1^2+2^2+2^2)(x^2+y^2+z^2)$，故 $x^2+y^2+z^2>=4$。当 $(x,y,z)=(2/3,4/3,4/3)$ 时等号成立，故最小值为 $4$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [如图，在正三棱柱 $A B C-A_1 B_1 C_1$ 中，$A B=A A_1=2$，点 $P,Q$ 分别为 $A_1 B_1,B C$ 的中点。#figure(prism())],
  parts: (
    subquestion(
      stem: [求异面直线 $B P$ 与 $A C_1$ 所成角的余弦值；],
      answers: ([$(3sqrt(10))/20$],),
      explanation: [以 $A C$ 中点为原点，指向 $B,C$ 的方向分别为 $x,y$ 轴正方向，垂直底面向上为 $z$ 轴正方向建系。则 $A(0,-1,0),B(sqrt(3),0,0),C(0,1,0),C_1(0,1,2),P(sqrt(3)/2,-1/2,2)$。
        所以 $arrow(B P)=(-sqrt(3)/2,-1/2,2)$，$arrow(A C_1)=(0,2,2)$，所求余弦值为 $frac(|-1+4|, sqrt(5) times 2sqrt(2))=(3sqrt(10))/20$。],
    ),
    subquestion(
      stem: [求直线 $C C_1$ 与平面 $A Q C_1$ 所成角的正弦值。],
      answers: ([$sqrt(5)/5$],),
      explanation: [由 $Q(sqrt(3)/2,1/2,0)$，得 $arrow(A Q)=(sqrt(3)/2,3/2,0)$。平面 $A Q C_1$ 的法向量可取 $bold(n)=(sqrt(3),-1,1)$，它与 $arrow(A Q),arrow(A C_1)$ 的数量积均为零。又 $arrow(C C_1)=(0,0,2)$，故所求正弦值为 $2/(2sqrt(5))=sqrt(5)/5$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [设 $n in NN^+$，对 $1,2,dots,n$ 的一个排列 $i_1 i_2 dots i_n$，如果当 $s<t$ 时，有 $i_s>i_t$，则称 $(i_s,i_t)$ 是排列 $i_1 i_2 dots i_n$ 的一个逆序，排列 $i_1 i_2 dots i_n$ 的所有逆序的总个数称为其逆序数。例如：对 $1,2,3$ 的一个排列 $231$，只有两个逆序 $(2,1),(3,1)$，则排列 $231$ 的逆序数为 $2$。记 $f_n (k)$ 为 $1,2,dots,n$ 的所有排列中逆序数为 $k$ 的全部排列的个数。],
  parts: (
    subquestion(
      stem: [求 $f_3 (2),f_4 (2)$ 的值；],
      answers: ([$f_3 (2)=2$，$f_4 (2)=5$。],),
      explanation: [三个数中逆序数为 $2$ 的排列为 $231,312$，故 $f_3 (2)=2$。同时 $f_3 (1)=2,f_3 (0)=1$。插入最大数 $4$ 时，它只能处在最后三个位置，分别新增 $0,1,2$ 个逆序，故 $f_4 (2)=2+2+1=5$。],
    ),
    subquestion(
      stem: [求 $f_n (2)$（$n>=5$）的表达式（用 $n$ 表示）。],
      answers: ([$f_n (2)=(n^2-n-2)/2$。],),
      explanation: [逆序数为 $0$ 的排列仅递增排列一个，故 $f_n (0)=1$。逆序数为 $1$ 的排列由递增排列交换一对相邻数得到，故 $f_n (1)=n-1$。
        插入最大数 $n+1$，按其处在末尾、倒数第二、倒数第三位分类，得
        $f_(n+1) (2)=f_n (2)+f_n (1)+f_n (0)=f_n (2)+n.$
        从 $f_4 (2)=5$ 累加，得 $f_n (2)=5+sum_(j=4)^(n-1) j=(n^2-n-2)/2$。],
    ),
  ),
)
