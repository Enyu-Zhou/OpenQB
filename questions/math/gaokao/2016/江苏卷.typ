#import "/src/lib.typ": (
  cetz, exam, figure-style, fill-placeholder, oblique-project, plot, question,
  section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "江苏卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016江苏.pdf",
  regions: ("江苏",),
)
#let algorithm() = {
  set text(size: 9pt)
  cetz.canvas(length: 7mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    for (y, label) in ((0, [开始]), (-7.8, [结束])) {
      rect((-0.7, y - 0.3), (0.7, y + 0.3), radius: 0.15)
      content((0, y), label)
    }
    for (x, y, label) in (
      (0, -1.3, $a arrow.l 1$),
      (0, -2.6, $b arrow.l 9$),
      (3.4, -4.8, $a arrow.l a+4$),
      (3.4, -3.45, $b arrow.l b-2$),
    ) {
      rect((x - 1, y - 0.35), (x + 1, y + 0.35))
      content((x, y), label)
    }
    line((0, -4.25), (1.4, -4.8), (0, -5.35), (-1.4, -4.8), close: true)
    content((0, -4.8), $a>b$)
    line((-1.1, -6.6), (0.9, -6.6), (1.1, -5.9), (-0.9, -5.9), close: true)
    content((0, -6.25), [输出 $a$])
    for (a, b) in (
      (-0.3, -0.95),
      (-1.65, -2.25),
      (-2.95, -4.25),
      (-5.35, -5.9),
      (-6.6, -7.5),
    ) {
      line((0, a), (0, b), mark: (end: ">"))
    }
    line((1.4, -4.8), (2.4, -4.8), mark: (end: ">"))
    line((3.4, -4.45), (3.4, -3.8), mark: (end: ">"))
    line((2.4, -3.45), (0, -3.45), mark: (end: ">"))
    content((1.8, -4.6), [N], anchor: "south")
    content((0.2, -5.65), [Y], anchor: "west")
  })
}
#let ellipse-diagram() = {
  set text(size: 9pt)
  cetz.canvas(length: 13mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $O$,
      tick: (length: 0),
    ))
    plot.plot(
      size: (4.2, 2.7),
      x-min: -2,
      x-max: 2.2,
      y-min: -1.3,
      y-max: 1.4,
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "school-book",
      {
        plot.annotate(resize: false, {
          line(
            ..range(181).map(i => (
              calc.sqrt(3) * calc.cos(i * 2deg),
              calc.sin(i * 2deg),
            )),
          )
          let b = (-1.5, 0.5)
          let c = (1.5, 0.5)
          let f = (calc.sqrt(2), 0)
          line(b, c, f, b)
          content(b, $B$, anchor: "south-east", padding: 0.06)
          content(c, $C$, anchor: "south-west", padding: 0.06)
          content(f, $F$, anchor: "north", padding: 0.07)
        })
      },
    )
  })
}
#let trisection-diagram() = {
  set text(size: 9pt)
  cetz.canvas(length: 17mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let a = (0.4, calc.sqrt(45 / 8 - 0.16))
    let d = (0, 0)
    let b = (-calc.sqrt(13 / 8), 0)
    let c = (calc.sqrt(13 / 8), 0)
    let e = (a.at(0) * 2 / 3, a.at(1) * 2 / 3)
    let f = (a.at(0) / 3, a.at(1) / 3)
    line(a, b, c, a, d)
    line(b, e, c)
    line(b, f, c)
    for (pt, label, anchor) in (
      (a, $A$, "south"),
      (b, $B$, "north-east"),
      (c, $C$, "north-west"),
      (d, $D$, "north"),
      (e, $E$, "west"),
      (f, $F$, "west"),
    ) {
      content(pt, label, anchor: anchor, padding: 0.09)
    }
  })
}
#let prism-diagram() = {
  set text(size: 9pt)
  cetz.canvas(length: 14mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    oblique-project((1, 0), (0.45, 0.5), (0, 1), {
      let a = (0, 0, 0)
      let b = (3, 0, 0)
      let c = (0, 2, 0)
      let a1 = (0, 0, 3)
      let b1 = (3, 0, 3)
      let c1 = (0, 2, 3)
      let d = (1.5, 0, 0)
      let e = (1.5, 1, 0)
      let f = (3, 0, 1.5)
      line(a, b, b1, a1, a)
      line(a1, c1, b1, d)
      line(a1, f)
      line(a, c, b, stroke: (dash: figure-style.dash))
      line(c, c1, f, stroke: (dash: figure-style.dash))
      line(d, e, b1, stroke: (dash: figure-style.dash))
      for (pt, label, anchor) in (
        (a, $A$, "north-east"),
        (b, $B$, "north-west"),
        (c, $C$, "south-east"),
        (a1, $A_1$, "east"),
        (b1, $B_1$, "west"),
        (c1, $C_1$, "south"),
        (d, $D$, "north"),
        (e, $E$, "west"),
        (f, $F$, "west"),
      ) {
        content(pt, label, anchor: anchor, padding: 0.1)
      }
    })
  })
}
#let warehouse() = {
  set text(size: 9pt)
  cetz.canvas(length: 5.5mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    oblique-project((1, 0), (0.4, 0.35), (0, 1), {
      let a = (0, 0, 0)
      let b = (6, 0, 0)
      let c = (6, 6, 0)
      let d = (0, 6, 0)
      let a1 = (0, 0, 8)
      let b1 = (6, 0, 8)
      let c1 = (6, 6, 8)
      let d1 = (0, 6, 8)
      let p = (3, 3, 10)
      let o = (3, 3, 0)
      let o1 = (3, 3, 8)
      line(a, b, c, c1, b1, a1, a)
      line(b, b1, p, c1)
      line(a1, p, d1, a1)
      line(a, d, c, stroke: (dash: figure-style.dash))
      line(d, d1, c1, stroke: (dash: figure-style.dash))
      line(p, o, stroke: (dash: figure-style.dash))
      for (pt, label, anchor) in (
        (a, $A$, "north-east"),
        (b, $B$, "north"),
        (c, $C$, "west"),
        (d, $D$, "east"),
        (a1, $A_1$, "east"),
        (b1, $B_1$, "west"),
        (c1, $C_1$, "west"),
        (d1, $D_1$, "east"),
        (p, $P$, "south"),
        (o, $O$, "north-east"),
        (o1, $O_1$, "east"),
      ) {
        content(pt, label, anchor: anchor, padding: 0.15)
      }
      for pt in (o, o1) { circle(pt, radius: 0.06, fill: black, stroke: none) }
    })
  })
}
#let circle-diagram() = {
  set text(size: 9pt)
  cetz.canvas(length: 4mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $O$,
      tick: (length: 0),
    ))
    plot.plot(
      size: (14, 15),
      x-min: -1,
      x-max: 13,
      y-min: -1,
      y-max: 14,
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "school-book",
      {
        plot.annotate(resize: false, {
          circle((6, 7), radius: 5)
          for (pt, label, anchor) in (
            ((6, 7), $M$, "south-west"),
            ((2, 4), $A$, "north-east"),
          ) {
            circle(pt, radius: 0.1, fill: black, stroke: none)
            content(pt, label, anchor: anchor, padding: 0.3)
          }
        })
      },
    )
  })
}
#let right-triangle() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let a = (0, 0)
    let b = (1, 2)
    let c = (5, 0)
    let d = (1, 0)
    let e = (3, 1)
    line(a, b, c, a)
    line(b, d, e)
    for (pt, label, anchor) in (
      (a, $A$, "north"),
      (b, $B$, "south"),
      (c, $C$, "north"),
      (d, $D$, "north"),
      (e, $E$, "south-west"),
    ) {
      content(pt, label, anchor: anchor, padding: 0.1)
    }
  })
}
#let parabola-diagram() = {
  set text(size: 9pt)
  cetz.canvas(length: 5mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $O$,
      tick: (length: 0),
    ))
    plot.plot(
      size: (8, 9),
      x-min: -0.7,
      x-max: 7.3,
      y-min: -4.2,
      y-max: 4.8,
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "school-book",
      {
        plot.annotate(resize: false, {
          line(
            ..range(161).map(i => {
              let y = -4 + i / 20
              (y * y / 2.6, y)
            }),
          )
          line((-0.4, -2.4), (6.4, 4.4))
          content((6.4, 4.4), $l$, anchor: "south", padding: 0.1)
          content((6.2, 4), $C$, anchor: "west", padding: 0.1)
        })
      },
    )
  })
}
#section[填空题：共 14 小题，每小题 5 分，共 70 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知集合 $A={-1,2,3,6}$，$B={x | -2<x<3}$，则 $A inter B=$#fill-placeholder()。],
  answers: ([${-1,2}$],),
  explanation: [集合 $A$ 中满足 $-2<x<3$ 的元素为 $-1,2$，故 $A inter B={-1,2}$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [复数 $z=(1+2i)(3-i)$，其中 $i$ 为虚数单位，则 $z$ 的实部是#fill-placeholder()。],
  answers: ([$5$],),
  explanation: [$z=3-i+6i-2i^2=5+5i$，故实部为 $5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，双曲线 $x^2/7-y^2/3=1$ 的焦距是#fill-placeholder()。],
  answers: ([$2sqrt(10)$],),
  explanation: [由 $a^2=7,b^2=3$，得 $c^2=a^2+b^2=10$，故焦距 $2c=2sqrt(10)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知一组数据 $4.7,4.8,5.1,5.4,5.5$，则该组数据的方差是#fill-placeholder()。],
  answers: ([$0.1$],),
  explanation: [平均数为 $overline(x)=5.1$，故方差
    $ s^2=1/5 ((-0.4)^2+(-0.3)^2+0^2+0.3^2+0.4^2)=0.1. $],
)
#question(
  "fill-in",
  score: 5,
  stem: [函数 $y=sqrt(3-2x-x^2)$ 的定义域是#fill-placeholder()。],
  answers: ([$[-3,1]$],),
  explanation: [由 $3-2x-x^2>=0$，得 $(x+3)(x-1)<=0$，解得 $-3<=x<=1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图是一个算法的流程图，则输出的 $a$ 的值是#fill-placeholder()。
    #figure(algorithm())],
  answers: ([$9$],),
  explanation: [初始 $a=1,b=9$，条件 $a>b$ 不成立，执行后得 $a=5,b=7$；条件仍不成立，再执行得 $a=9,b=5$。此时 $a>b$ 成立，输出 $a=9$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [将一颗质地均匀的骰子（一种各个面上分别标有 $1,2,3,4,5,6$ 个点的正方体玩具）先后抛掷 2 次，则出现向上的点数之和小于 $10$ 的概率是#fill-placeholder()。],
  answers: ([$5/6$],),
  explanation: [共有 $6 times 6=36$ 个等可能结果，点数和为 $10,11,12$ 的结果分别有 $3,2,1$ 个。因此所求概率为 $1-(3+2+1)/36=5/6$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 ${a_n}$ 是等差数列，$S_n$ 是其前 $n$ 项和。若 $a_1+a_2^2=-3$，$S_5=10$，则 $a_9$ 的值是#fill-placeholder()。],
  answers: ([$20$],),
  explanation: [设公差为 $d$，由 $S_5=5a_3=10$，得 $a_3=2$，故 $a_1=2-2d,a_2=2-d$。代入得 $2-2d+(2-d)^2=-3$，即 $(d-3)^2=0$。所以 $d=3$，$a_9=a_3+6d=20$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [定义在区间 $[0,3pi]$ 上的函数 $y=sin 2x$ 的图象与 $y=cos x$ 的图象的交点个数是#fill-placeholder()。],
  answers: ([$7$],),
  explanation: [方程 $sin 2x=cos x$ 等价于 $cos x(2sin x-1)=0$。在 $[0,3pi]$ 上，$cos x=0$ 有 $3$ 个解 $pi/2,3pi/2,5pi/2$；$sin x=1/2$ 有 $4$ 个解 $pi/6,5pi/6,13pi/6,17pi/6$。两组解互不重复，故共有 $7$ 个交点。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，在平面直角坐标系 $x O y$ 中，$F$ 是椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的右焦点，直线 $y=b/2$ 与椭圆交于 $B,C$ 两点，且 $angle B F C=90 degree$，则该椭圆的离心率是#fill-placeholder()。
    #figure(ellipse-diagram())],
  answers: ([$sqrt(6)/3$],),
  explanation: [设 $F(c,0)$，则 $B(-sqrt(3)a/2,b/2),C(sqrt(3)a/2,b/2)$。由 $arrow(F B) dot arrow(F C)=0$，得
    $ c^2-3a^2/4+b^2/4=0. $
    结合 $b^2=a^2-c^2$，得 $3c^2=2a^2$，故 $e=c/a=sqrt(6)/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $f(x)$ 是定义在 $RR$ 上且周期为 $2$ 的函数，在区间 $[-1,1)$ 上 $f(x)=cases(x+a & quad -1<=x<0, abs(2/5-x) & quad 0<=x<1)$，其中 $a in RR$。若 $f(-5/2)=f(9/2)$，则 $f(5a)$ 的值是#fill-placeholder()。],
  answers: ([$-2/5$],),
  explanation: [由周期性，$f(-5/2)=f(-1/2)=a-1/2$，$f(9/2)=f(1/2)=1/10$，故 $a=3/5$。因此 $f(5a)=f(3)=f(-1)=-1+3/5=-2/5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知实数 $x,y$ 满足 $cases(x-2y+4>=0, 2x+y-2>=0, 3x-y-3<=0)$，则 $x^2+y^2$ 的取值范围是#fill-placeholder()。],
  answers: ([$[4/5,13]$],),
  explanation: [可行域是顶点为 $(0,2),(1,0),(2,3)$ 的三角形。由 $2x+y>=2$ 及柯西不等式，得 $5(x^2+y^2)>=(2x+y)^2>=4$；等号在可行点 $(4/5,2/5)$ 处取得。
    任意可行点是三个顶点的凸组合，其到原点的距离不超过三个顶点到原点距离的最大值 $sqrt(13)$，故 $x^2+y^2<=13$，在 $(2,3)$ 处取等号。可行域连通且函数连续，所求范围为 $[4/5,13]$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，在 $triangle A B C$ 中，$D$ 是 $B C$ 的中点，$E,F$ 是 $A D$ 上的两个三等分点，$arrow(B A) dot arrow(C A)=4$，$arrow(B F) dot arrow(C F)=-1$，则 $arrow(B E) dot arrow(C E)$ 的值是#fill-placeholder()。
    #figure(trisection-diagram())],
  answers: ([$7/8$],),
  explanation: [以 $D$ 为起点，设 $arrow(D A)=bold(u),arrow(D B)=bold(v)$，则 $arrow(D C)=-bold(v)$，$arrow(D E)=2/3 bold(u)$，$arrow(D F)=1/3 bold(u)$。于是
    $
      abs(bold(u))^2-abs(bold(v))^2=4, quad 1/9 abs(bold(u))^2-abs(bold(v))^2=-1.
    $
    解得 $abs(bold(u))^2=45/8,abs(bold(v))^2=13/8$，所以
    $ arrow(B E) dot arrow(C E)=4/9 abs(bold(u))^2-abs(bold(v))^2=7/8. $],
)
#question(
  "fill-in",
  score: 5,
  stem: [在锐角 $triangle A B C$ 中，$sin A=2sin B sin C$，则 $tan A tan B tan C$ 的最小值是#fill-placeholder()。],
  answers: ([$8$],),
  explanation: [由 $sin A=sin(B+C)$，两边除以 $cos B cos C>0$，得 $tan B+tan C=2tan B tan C$。设 $q=tan B tan C$。又 $tan A=-(tan B+tan C)/(1-q)>0$，故 $q>1$，从而
    $ tan A tan B tan C=(2q^2)/(q-1)=2(q-1)+4+2/(q-1)>=8. $
    等号要求 $q=2$，此时可取 $tan B=2+sqrt(2),tan C=2-sqrt(2)$。两角均锐，且 $B+C in (pi/2,pi)$，$tan A=4$，对应锐角三角形满足题设。因此最小值为 $8$。],
)

#section[解答题：共 6 小题，共 90 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [在 $triangle A B C$ 中，$A C=6$，$cos B=4/5$，$C=pi/4$。],
  parts: (
    subquestion(
      stem: [求 $A B$ 的长；],
      answers: ([$5sqrt(2)$],),
      explanation: [因 $0<B<pi$，有 $sin B=sqrt(1-cos^2 B)=3/5$。由正弦定理，
        $ A B=(A C sin C)/(sin B)=(6 dot sqrt(2)/2)/(3/5)=5sqrt(2). $],
    ),
    subquestion(
      stem: [求 $cos(A-pi/6)$ 的值。],
      answers: ([$(7sqrt(2)-sqrt(6))/20$],),
      explanation: [由 $A=pi-(B+pi/4)$，得
        $ cos A=-cos(B+pi/4)=-sqrt(2)/10, quad sin A=sin(B+pi/4)=7sqrt(2)/10. $
        因此
        $ cos(A-pi/6)=cos A cos(pi/6)+sin A sin(pi/6)=(7sqrt(2)-sqrt(6))/20. $],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在直三棱柱 $A B C-A_1 B_1 C_1$ 中，$D,E$ 分别为 $A B,B C$ 的中点，点 $F$ 在侧棱 $B_1 B$ 上，且 $B_1 D perp A_1 F$，$A_1 C_1 perp A_1 B_1$。求证：
    #figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [直线 $D E parallel$ 平面 $A_1 C_1 F$；],
      answers: ([证明见解析。],),
      explanation: [由三角形中位线定理，$D E parallel A C$。又棱柱中 $A C parallel A_1 C_1$，故 $D E parallel A_1 C_1$。
        因 $D E$ 不在平面 $A_1 C_1 F$ 内，且 $A_1 C_1$ 在该平面内，故 $D E parallel$ 平面 $A_1 C_1 F$。],
    ),
    subquestion(
      stem: [平面 $B_1 D E perp$ 平面 $A_1 C_1 F$。],
      answers: ([证明见解析。],),
      explanation: [直棱柱中 $A A_1 perp$ 平面 $A_1 B_1 C_1$，所以 $A A_1 perp A_1 C_1$。结合 $A_1 C_1 perp A_1 B_1$，得 $A_1 C_1 perp$ 平面 $A B B_1 A_1$，故 $A_1 C_1 perp B_1 D$。
        又已知 $B_1 D perp A_1 F$，且 $A_1 C_1,A_1 F$ 相交于 $A_1$，故 $B_1 D perp$ 平面 $A_1 C_1 F$。
        因 $B_1 D$ 在平面 $B_1 D E$ 内，故平面 $B_1 D E perp$ 平面 $A_1 C_1 F$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [现需要设计一个仓库，它由上下两部分组成，上部分的形状是正四棱锥 $P-A_1 B_1 C_1 D_1$，下部分的形状是正四棱柱 $A B C D-A_1 B_1 C_1 D_1$（如图所示），并要求正四棱柱的高 $O_1 O$ 是正四棱锥的高 $P O_1$ 的 $4$ 倍。
    #figure(warehouse())],
  parts: (
    subquestion(
      stem: [若 $A B=6$ m，$P O_1=2$ m，则仓库的容积是多少？],
      answers: ([$312$ $"m"^3$],),
      explanation: [由 $O_1 O=4P O_1=8$ m，得
        $ V=6^2 times 8+1/3 times 6^2 times 2=312 ("m"^3). $
        所以仓库的容积为 $312$ $"m"^3$。],
    ),
    subquestion(
      stem: [若正四棱锥的侧棱长为 $6$ m，则当 $P O_1$ 为多少时，仓库的容积最大？],
      answers: ([$P O_1=2sqrt(3)$ m],),
      explanation: [设 $P O_1=h$ m，底面边长为 $a$ m，则 $0<h<6$。由正四棱锥的几何关系，
        $ h^2+a^2/2=36, quad a^2=2(36-h^2). $
        因而
        $ V(h)=a^2 dot 4h+1/3 a^2 h=26/3 (36h-h^3), quad V'(h)=26(12-h^2). $
        当 $0<h<2sqrt(3)$ 时，$V'(h)>0$；当 $2sqrt(3)<h<6$ 时，$V'(h)<0$。因此当 $P O_1=2sqrt(3)$ m 时，仓库的容积最大。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [如图，在平面直角坐标系 $x O y$ 中，已知以 $M$ 为圆心的圆 $M:x^2+y^2-12x-14y+60=0$ 及其上一点 $A(2,4)$。
    #figure(circle-diagram())],
  parts: (
    subquestion(
      stem: [设圆 $N$ 与 $x$ 轴相切，与圆 $M$ 外切，且圆心 $N$ 在直线 $x=6$ 上，求圆 $N$ 的标准方程；],
      answers: ([$(x-6)^2+(y-1)^2=1$],),
      explanation: [圆 $M$ 的标准方程为 $(x-6)^2+(y-7)^2=25$，故 $M(6,7)$、半径为 $5$。
        设 $N(6,k)$，其半径为 $abs(k)>0$。由两圆外切，$abs(k-7)=5+abs(k)$。当 $k<=0$ 或 $k>=7$ 时均无解；当 $0<k<7$ 时，$7-k=5+k$，得 $k=1$。
        故所求方程为 $(x-6)^2+(y-1)^2=1$。],
    ),
    subquestion(
      stem: [设平行于 $O A$ 的直线 $l$ 与圆 $M$ 相交于 $B,C$ 两点，且 $B C=O A$，求直线 $l$ 的方程；],
      answers: ([$2x-y+5=0$ 或 $2x-y-15=0$],),
      explanation: [由 $k_(O A)=2$，设 $l:2x-y+k=0$。圆心到直线的距离为 $d=abs(k+5)/sqrt(5)$，而 $B C=O A=2sqrt(5)$，故
        $ d^2+((B C)/2)^2=25, quad (k+5)^2/5+5=25. $
        解得 $k=5$ 或 $k=-15$，因此所求直线为 $2x-y+5=0$ 或 $2x-y-15=0$。],
    ),
    subquestion(
      stem: [设点 $T(t,0)$ 满足：存在圆 $M$ 上的两点 $P,Q$，使得 $arrow(T A)+arrow(T P)=arrow(T Q)$，求实数 $t$ 的取值范围。],
      answers: ([$[2-2sqrt(21),2+2sqrt(21)]$],),
      explanation: [向量等式等价于 $arrow(P Q)=arrow(T A)$。半径为 $5$ 的圆中能作出给定向量作为弦向量，当且仅当其长度不超过直径 $10$：可取弦的中点在过圆心且垂直于该向量的直线上，使半弦长与中点到圆心的距离满足勾股关系。
        因此题设等价于
        $ abs(arrow(T A))=sqrt((t-2)^2+16)<=10. $
        解得 $(t-2)^2<=84$，即 $t in [2-2sqrt(21),2+2sqrt(21)]$。这里 $T A>=4>0$，构造出的 $P,Q$ 始终不同，端点对应直径，也可取得。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知函数 $f(x)=a^x+b^x$（$a>0,b>0,a!=1,b!=1$）。],
  parts: (
    subquestion(stem: [设 $a=2,b=1/2$。], parts: (
      subquestion(
        stem: [求方程 $f(x)=2$ 的根；],
        answers: ([$x=0$],),
        explanation: [$2^x+2^(-x)=2$ 等价于 $(2^x-1)^2=0$，故 $x=0$。],
      ),
      subquestion(
        stem: [若对于任意 $x in RR$，不等式 $f(2x)>=m f(x)-6$ 恒成立，求实数 $m$ 的最大值。],
        answers: ([$4$],),
        explanation: [令 $u=f(x)=2^x+2^(-x)>=2$，则 $f(2x)=u^2-2$。原不等式等价于 $m<=u+4/u$ 对一切 $u>=2$ 成立。
          由 $u+4/u>=4$，且 $x=0$ 时 $u=2$、等号成立，得 $m<=4$，最大值为 $4$。],
      ),
    )),
    subquestion(
      stem: [若 $0<a<1,b>1$，函数 $g(x)=f(x)-2$ 有且只有 $1$ 个零点，求 $a b$ 的值。],
      answers: ([$a b=1$],),
      explanation: [显然 $g(0)=0$。又
        $ g''(x)=a^x dot (ln a)^2+b^x dot (ln b)^2>0, $
        所以 $g'$ 严格递增。因 $x$ 趋于负无穷、正无穷时 $g'$ 分别趋于负无穷、正无穷，故存在唯一极小值点 $x_0$。同时 $g(x)$ 在两端均趋于正无穷。
        若 $x_0!=0$，则最小值 $g(x_0)<g(0)=0$，连续性保证在 $x_0$ 两侧各有一个零点，与题意矛盾。因此 $x_0=0$，从而 $g'(0)=ln a+ln b=0$，即 $a b=1$。
        反之，$a b=1$ 时，$g(x)=a^x+a^(-x)-2>=0$，等号仅在 $x=0$ 时成立，确有唯一零点。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [记 $U={1,2,dots,100}$。对数列 ${a_n}$（$n in NN^*$）和 $U$ 的子集 $T$，若 $T=emptyset$，定义 $S_T=0$；若 $T={t_1,t_2,dots,t_k}$，定义 $S_T=a_(t_1)+a_(t_2)+dots+a_(t_k)$。例如：$T={1,3,66}$ 时，$S_T=a_1+a_3+a_66$。现设 ${a_n}$（$n in NN^*$）是公比为 $3$ 的等比数列，且当 $T={2,4}$ 时，$S_T=30$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式；],
      answers: ([$a_n=3^(n-1)$],),
      explanation: [由 $a_2+a_4=3a_1+27a_1=30$，得 $a_1=1$，故 $a_n=3^(n-1)$。],
    ),
    subquestion(
      stem: [对任意正整数 $k$（$1<=k<=100$），若 $T subset.eq {1,2,dots,k}$，求证：$S_T<a_(k+1)$；],
      answers: ([证明见解析。],),
      explanation: [因各项均为正，
        $ S_T<=sum_(j=1)^k 3^(j-1)=(3^k-1)/2<3^k=a_(k+1). $
        当 $T=emptyset$ 时，上述不等式同样成立。],
    ),
    subquestion(
      stem: [设 $C subset.eq U$，$D subset.eq U$，$S_C>=S_D$，求证：$S_C+S_(C inter D)>=2S_D$。],
      answers: ([证明见解析。],),
      explanation: [令 $E=C without D$，$F=D without C$，$H=C inter D$。则 $E,F$ 不交，且
        $ S_C=S_E+S_H, quad S_D=S_F+S_H, quad S_E>=S_F. $
        只需证明 $S_E>=2S_F$。若 $F=emptyset$，结论显然成立；若 $F!=emptyset$，则 $E!=emptyset$。
        设 $k$ 为 $E union F$ 的最大元素。若 $k in F$，由第 (2) 问得 $S_E<a_k<=S_F$，矛盾，故 $k in E$。于是 $F subset.eq {1,2,dots,k-1}$，从而
        $ 2S_F<=2sum_(j=1)^(k-1) 3^(j-1)=3^(k-1)-1<a_k<=S_E. $
        因此总有 $S_E>=2S_F$，加上 $2S_H$ 即得所证结论。],
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
      stem: [【A】选修 4-1：几何证明选讲。如图，在 $triangle A B C$ 中，$angle A B C=90 degree$，$B D perp A C$，$D$ 为垂足，$E$ 是 $B C$ 的中点。求证：$angle E D C=angle A B D$。
        #figure(right-triangle())],
      answers: ([证明见解析。],),
      explanation: [在直角三角形 $B D C$ 中，$E$ 为斜边中点，所以 $E D=E C$，故 $angle E D C=angle D C E=angle A C B$。
        又 $angle A B D=90 degree-angle B A D=90 degree-angle B A C=angle A C B$，因此 $angle E D C=angle A B D$。],
    ),
    subquestion(
      score: 10,
      stem: [【B】选修 4-2：矩阵与变换。已知矩阵 $A=mat(1, 2; 0, -2)$，矩阵 $B$ 的逆矩阵 $B^(-1)=mat(1, -1/2; 0, 2)$，求矩阵 $A B$。],
      answers: ([$mat(1, 5/4; 0, -1)$],),
      explanation: [由二阶矩阵求逆公式，
        $ B=1/2 mat(2, 1/2; 0, 1)=mat(1, 1/4; 0, 1/2). $
        因此
        $ A B=mat(1, 2; 0, -2) mat(1, 1/4; 0, 1/2)=mat(1, 5/4; 0, -1). $],
    ),
    subquestion(
      score: 10,
      stem: [【C】选修 4-4：坐标系与参数方程。在平面直角坐标系 $x O y$ 中，已知直线 $l$ 的参数方程为 $cases(x=1+1/2 t, y=sqrt(3)/2 t)$（$t$ 为参数），椭圆 $C$ 的参数方程为 $cases(x=cos theta, y=2sin theta)$（$theta$ 为参数）。设直线 $l$ 与椭圆 $C$ 相交于 $A,B$ 两点，求线段 $A B$ 的长。],
      answers: ([$16/7$],),
      explanation: [椭圆的普通方程为 $x^2+y^2/4=1$。将直线参数方程代入，得
        $ (1+t/2)^2+3t^2/16=1, quad 7t^2+16t=0. $
        两根为 $t_1=0,t_2=-16/7$。由于参数方向向量 $(1/2,sqrt(3)/2)$ 的长度为 $1$，故 $A B=abs(t_1-t_2)=16/7$。],
    ),
    subquestion(
      score: 10,
      stem: [【D】选修 4-5：不等式选讲。设 $a>0$，$abs(x-1)<a/3$，$abs(y-2)<a/3$，求证：$abs(2x+y-4)<a$。],
      answers: ([证明见解析。],),
      explanation: [由绝对值的三角不等式，
        $ abs(2x+y-4)=abs(2(x-1)+(y-2))<=2abs(x-1)+abs(y-2)<2a/3+a/3=a. $],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [如图，在平面直角坐标系 $x O y$ 中，已知直线 $l:x-y-2=0$，抛物线 $C:y^2=2p x$（$p>0$）。
    #figure(parabola-diagram())],
  parts: (
    subquestion(
      stem: [若直线 $l$ 过抛物线 $C$ 的焦点，求抛物线 $C$ 的方程；],
      answers: ([$y^2=8x$],),
      explanation: [焦点为 $(p/2,0)$，代入 $x-y-2=0$，得 $p/2-2=0$，故 $p=4$，抛物线方程为 $y^2=8x$。],
    ),
    subquestion(
      stem: [已知抛物线 $C$ 上存在关于直线 $l$ 对称的相异两点 $P,Q$。],
      parts: (
        subquestion(
          stem: [求证：线段 $P Q$ 的中点坐标为 $(2-p,-p)$；],
          answers: ([证明见解析。],),
          explanation: [设 $P(x_1,y_1),Q(x_2,y_2)$，中点为 $M(x_0,y_0)$。由对称性，$P Q perp l$，故 $k_(P Q)=-1$，且 $M$ 在 $l$ 上。
            两点的抛物线方程相减，得 $(y_1-y_2)(y_1+y_2)=2p(x_1-x_2)$。由于两点不同且弦的斜率为 $-1$，得 $y_1+y_2=-2p$，故 $y_0=-p$。由 $x_0-y_0-2=0$，得 $x_0=2-p$。],
        ),
        subquestion(
          stem: [求 $p$ 的取值范围。],
          answers: ([$(0,4/3)$],),
          explanation: [由中点坐标与弦的斜率，得 $P Q:y=-x+2-2p$。代入 $y^2=2p x$，得
            $ y^2+2p y+4p^2-4p=0. $
            两相异交点要求判别式 $Delta=4p(4-3p)>0$，结合 $p>0$ 得 $0<p<4/3$。
            反之，此范围内有两相异交点，且由韦达定理知其中点在 $l$ 上、弦垂直于 $l$，故两点确实关于 $l$ 对称。],
        ),
      ),
    ),
  ),
)
#question("solution", score: 10, parts: (
  subquestion(
    stem: [求 $7C_6^3-4C_7^4$ 的值；],
    answers: ([$0$],),
    explanation: [$C_6^3=20,C_7^4=35$，故 $7C_6^3-4C_7^4=140-140=0$。],
  ),
  subquestion(
    stem: [设 $m,n in NN^*$，$n>=m$，求证：
      $
        (m+1)C_m^m+(m+2)C_(m+1)^m+(m+3)C_(m+2)^m+dots+n C_(n-1)^m+(n+1)C_n^m=(m+1)C_(n+2)^(m+2).
      $],
    answers: ([证明见解析。],),
    explanation: [由阶乘公式，对 $k>=m$ 有
      $ (k+1)C_k^m=(m+1)C_(k+1)^(m+1). $
      又由帕斯卡恒等式逐项相加，得
      $ sum_(k=m)^n C_(k+1)^(m+1)=C_(n+2)^(m+2). $
      具体而言，$n=m$ 时两边均为 $1$；若结论对 $n$ 成立，则增加下一项后，由 $C_(n+2)^(m+2)+C_(n+2)^(m+1)=C_(n+3)^(m+2)$，知结论对 $n+1$ 也成立。
      因此
      $
        sum_(k=m)^n (k+1)C_k^m=(m+1)sum_(k=m)^n C_(k+1)^(m+1)=(m+1)C_(n+2)^(m+2).
      $],
  ),
))
