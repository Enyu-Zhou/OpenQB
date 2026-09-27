#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016天津文.pdf",
  regions: ("天津",),
)

#let loop-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 6mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    for (y, label) in ((0, [开始]), (-10.7, [结束])) {
      rect((-0.65, y - 0.3), (0.65, y + 0.3), radius: 0.15)
      content((0, y), label)
    }
    for (y, label) in (
      (-1.15, $S=4$),
      (-2.3, $n=1$),
      (-4.9, $S=S-6$),
      (-6.3, $n=n+1$),
    ) {
      rect((-1.2, y - 0.35), (1.2, y + 0.35))
      content((0, y), label)
    }
    for (y, label) in ((-3.6, $S>=6$), (-7.7, $n>3$)) {
      line((0, y + 0.5), (1.5, y), (0, y - 0.5), (-1.5, y), close: true)
      content((0, y), label)
    }
    rect((-4.2, -5.25), (-2, -4.55))
    content((-3.1, -4.9), $S=2S$)
    line((-1, -9.65), (0.8, -9.65), (1, -8.95), (-0.8, -8.95), close: true)
    content((0, -9.3), [输出 $S$])
    for (a, b) in (
      (-0.3, -0.8),
      (-1.5, -1.95),
      (-2.65, -3.1),
      (-4.1, -4.55),
      (-5.25, -5.95),
      (-6.65, -7.2),
      (-8.2, -8.95),
      (-9.65, -10.4),
    ) {
      line((0, a), (0, b), mark: (end: ">"))
    }
    line((-1.5, -3.6), (-3.1, -3.6), (-3.1, -4.55), mark: (end: ">"))
    line((-3.1, -5.25), (-3.1, -5.6), (0, -5.6), mark: (end: ">"))
    line((1.5, -7.7), (2.7, -7.7), (2.7, -2.85), (0, -2.85), mark: (end: ">"))
    for (p, label, anchor) in (
      ((-1.9, -3.5), [否], "south"),
      ((0.2, -4.3), [是], "west"),
      ((1.85, -7.6), [否], "south"),
      ((0.2, -8.5), [是], "west"),
    ) {
      content(p, label, anchor: anchor)
    }
  })
}
#let circle-diagram(auxiliary: false) = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (0, 0)
  let B = (3, 0)
  let E = (1, 0)
  let D = (2, -calc.sqrt(2))
  let C = (1 / 3, 2 * calc.sqrt(2) / 3)
  circle((1.5, 0), radius: 1.5)
  line(A, B, D)
  line(C, D)
  if auxiliary {
    line(A, D)
    line((2, 0), D, stroke: (dash: figure-style.dash))
    content((2, 0), $K$, anchor: "south", padding: 3pt)
  }
  for (p, label, anchor) in (
    (A, $A$, "east"),
    (B, $B$, "west"),
    (C, $C$, "south-east"),
    (D, $D$, "north-west"),
    (E, $E$, "south-west"),
  ) {
    content(p, label, anchor: anchor, padding: 3pt)
  }
})

#let view-rectangle(direction: -1, hidden: false, height: 2) = cetz.canvas(
  length: 11mm,
  {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((0, 0), (1, height))
    let a = if direction == -1 { (0, height) } else { (0, 0) }
    let b = if direction == -1 { (1, 0) } else { (1, height) }
    line(a, b, stroke: (dash: if hidden { figure-style.dash } else { "solid" }))
  },
)
#let given-views() = {
  set text(size: 9pt)
  cetz.canvas(length: 11mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((0, 0), (1, 2))
    line((0, 2), (1, 0))
    content((0.5, -0.15), [正视图], anchor: "north")
    rect((0, -1.75), (1, -0.75))
    line((0, -1.75), (1, -0.75))
    content((0.5, -1.9), [俯视图], anchor: "north")
  })
}
#let feasible-region() = {
  set text(size: 9pt)
  cetz.canvas(length: 11mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $O$,
      tick: (stroke: figure-style.thickness, length: 0),
    ))
    plot.plot(
      size: (6.6, 5.4),
      axis-style: "school-book",
      x-min: 0,
      x-max: 55,
      y-min: 0,
      y-max: 45,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (20, 40, 45, 50),
      y-ticks: (24, 30, 40),
      x-label: $x$,
      y-label: $y$,
      {
        plot.annotate(resize: false, {
          line(
            (0, 0),
            (45, 0),
            (40, 8),
            (20, 24),
            (0, 30),
            close: true,
            fill: luma(90%),
            stroke: none,
          )
          line((0, 40), (50, 0))
          line((135 / 8, 45), (45, 0))
          line((0, 30), (55, 13.5))
          for (p, label) in (
            ((33, 34), $8x+5y=360$),
            ((12, 40), $4x+5y=200$),
            ((46, 23), $3x+10y=300$),
            ((20, 28), $P(20,24)$),
          ) { content(p, label) }
          line((20, 0), (20, 24), (0, 24), stroke: (dash: figure-style.dash))
        })
      },
    )
  })
}
#let solid(auxiliary: false) = cetz.canvas(length: 14mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((-0.85, -0.6), (-0.95, 0.6 / calc.sqrt(3)), (0, 0.95), {
    let A = (0, 0, 0)
    let B = (1, calc.sqrt(3), 0)
    let C = (2, calc.sqrt(3), 0)
    let D = (1, 0, 0)
    let E = (-1, 0, calc.sqrt(5))
    let F = (-0.5, calc.sqrt(3) / 2, calc.sqrt(5))
    let G = (1.5, calc.sqrt(3), 0)
    let O = (1, calc.sqrt(3) / 2, 0)
    let H = (5 / 9, 0, 2 * calc.sqrt(5) / 9)
    line(C, D, A, E, F, C)
    line(D, E)
    for (a, b) in ((A, B), (B, C), (B, D), (B, E), (F, G)) {
      line(a, b, stroke: (dash: figure-style.dash))
    }
    if auxiliary {
      for (a, b) in ((O, E), (O, G), (A, H), (B, H)) {
        line(a, b, stroke: (dash: figure-style.dash))
      }
      content((1, calc.sqrt(3) / 2, -0.4), $O$, anchor: "north", padding: 3pt)
      content(H, $H$, anchor: "west", padding: 3pt)
    }
    for (p, label, anchor) in (
      (A, $A$, "west"),
      (B, $B$, "south"),
      (C, $C$, "north-east"),
      (D, $D$, "north"),
      (E, $E$, "south-west"),
      (F, $F$, "south-east"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
    content(G, $G$, anchor: "north", padding: 1pt)
  })
})

#section[选择题：共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题意。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={1,2,3}$，$B={y|y=2x-1,x in A}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${1,3}$], [${1,2}$], [${2,3}$], [${1,2,3}$]),
  answers: ([A],),
  explanation: [依次代入 $x=1,2,3$，得 $B={1,3,5}$，因此 $A inter B={1,3}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [甲、乙两人下棋，两人下成和棋的概率是 $1/2$，甲获胜的概率是 $1/3$，则甲不输的概率为#choice-placeholder()。],
  choices: ([$5/6$], [$2/5$], [$1/6$], [$1/3$]),
  answers: ([A],),
  explanation: [甲不输包含“和棋”和“甲获胜”两个互斥事件，因此概率为 $1/2+1/3=5/6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [将一个长方体沿相邻三个面的对角线截去一个棱锥，得到的几何体的正视图与俯视图如图所示，则该几何体的侧（左）视图为#choice-placeholder()。
    #figure(given-views())],
  choices: (
    [#view-rectangle()],
    [#view-rectangle(hidden: true)],
    [#view-rectangle(direction: 1)],
    [#view-rectangle(direction: 1, hidden: true)],
  ),
  answers: ([B],),
  explanation: [正视图中截面边从左上连向右下，俯视图中截面边从左下连向右上，说明截去的是长方体前右上方的顶点及其相邻部分。
    从左侧看，外轮廓仍为长方形；截面的对应边位于几何体背后，应画成从左上到右下的虚线，故选 B。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的焦距为 $2sqrt(5)$，且双曲线的一条渐近线与直线 $2x+y=0$ 垂直，则双曲线的方程为#choice-placeholder()。],
  choices: (
    [$x^2/4-y^2=1$],
    [$x^2-y^2/4=1$],
    [$(3x^2)/20-(3y^2)/5=1$],
    [$(3x^2)/5-(3y^2)/20=1$],
  ),
  answers: ([A],),
  explanation: [已知直线斜率为 $-2$，故与之垂直的渐近线斜率为 $1/2$，即 $b/a=1/2$。又 $a^2+b^2=c^2=5$，解得 $a^2=4,b^2=1$，故选 A。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $x>0$，$y in RR$，则“$x>y$”是“$x>abs(y)$”的#choice-placeholder()。],
  choices: (
    [充要条件],
    [充分而不必要条件],
    [必要而不充分条件],
    [既不充分也不必要条件],
  ),
  answers: ([C],),
  explanation: [若 $x>abs(y)$，由 $abs(y)>=y$ 得 $x>y$，故必要性成立。
    反之，取 $x=1,y=-2$，虽有 $x>y$，却不满足 $x>abs(y)$，故不充分，选 C。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $f(x)$ 是定义在 $RR$ 上的偶函数，且在区间 $(-infinity,0)$ 上单调递增。若实数 $a$ 满足 $f(2^(abs(a-1)))>f(-sqrt(2))$，则 $a$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$(-infinity,1/2)$],
    [$(-infinity,1/2) union (3/2,+infinity)$],
    [$(1/2,3/2)$],
    [$(3/2,+infinity)$],
  ),
  answers: ([C],),
  explanation: [由偶性，$f(2^(abs(a-1)))=f(-2^(abs(a-1)))$。两自变量均为负数，利用单调性，原不等式等价于
    $ -2^(abs(a-1))> -sqrt(2), quad abs(a-1)<1/2. $
    解得 $1/2<a<3/2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $triangle A B C$ 是边长为 $1$ 的等边三角形，点 $D,E$ 分别是边 $A B,B C$ 的中点，连接 $D E$ 并延长到点 $F$，使得 $D E=2E F$，则 $arrow(A F) dot arrow(B C)$ 的值为#choice-placeholder()。],
  choices: ([$-5/8$], [$1/8$], [$1/4$], [$11/8$]),
  answers: ([B],),
  explanation: [设 $bold(u)=arrow(B A)$，$bold(v)=arrow(B C)$，则 $abs(bold(u))=abs(bold(v))=1$，$bold(u) dot bold(v)=1/2$。
    由 $arrow(D E)=(bold(v)-bold(u))/2$，$arrow(D F)=3/2 arrow(D E)$，得
    $ arrow(A F)=-1/2 bold(u)+3/4 (bold(v)-bold(u))=-5/4 bold(u)+3/4 bold(v). $
    所以 $arrow(A F) dot arrow(B C)=-5/4 times 1/2+3/4=1/8$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=sin^2 ((omega x)/2)+1/2 sin omega x-1/2$（$omega>0$），$x in RR$。若 $f(x)$ 在区间 $(pi,2pi)$ 内没有零点，则 $omega$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$(0,1/8]$],
    [$(0,1/4] union [5/8,1)$],
    [$(0,5/8]$],
    [$(0,1/8] union [1/4,5/8]$],
  ),
  answers: ([D],),
  explanation: [由降幂公式，
    $ f(x)=1/2 (sin omega x-cos omega x)=sqrt(2)/2 sin(omega x-pi/4). $
    零点为 $x=(k+1/4)pi/omega$，$k in ZZ$。区间 $(pi,2pi)$ 不含零点，当且仅当它位于相邻两零点之间，即存在整数 $k$ 使
    $ (k+1/4)pi/omega<=pi<2pi<=(k+5/4)pi/omega. $
    等价于 $k+1/4<=omega<=k/2+5/8$。由 $omega>0$ 及左端不大于右端，得 $-1<=k<=0$。
    $k=-1$ 时得 $0<omega<=1/8$；$k=0$ 时得 $1/4<=omega<=5/8$，故选 D。],
)
#section[填空题：共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [$i$ 是虚数单位，复数 $z$ 满足 $(1+i)z=2$，则 $z$ 的实部为#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [$z=2/(1+i)=1-i$，故实部为 $1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=(2x+1)e^x$，$f'(x)$ 为 $f(x)$ 的导函数，则 $f'(0)$ 的值为#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [由乘积求导法则，$f'(x)=2e^x+(2x+1)e^x=(2x+3)e^x$，故 $f'(0)=3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [阅读如下的程序框图，运行相应的程序，则输出 $S$ 的值为#fill-placeholder()。
    #figure(loop-chart())],
  answers: ([$4$],),
  explanation: [初始 $S=4,n=1$。第一次循环得 $S=8,n=2$；第二次循环得 $S=2,n=3$；第三次循环得 $S=4,n=4$。此时 $n>3$，结束循环，输出 $4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知圆 $C$ 的圆心在 $x$ 轴的正半轴上，点 $M(0,sqrt(5))$ 在圆 $C$ 上，且圆心到直线 $2x-y=0$ 的距离为 $(4sqrt(5))/5$，则圆 $C$ 的方程为#fill-placeholder()。],
  answers: ([$(x-2)^2+y^2=9$],),
  explanation: [设圆心 $C=(t,0)$，$t>0$。由点到直线的距离公式，$(2t)/sqrt(5)=(4sqrt(5))/5$，得 $t=2$。
    半径的平方为 $abs(C M)^2=2^2+(sqrt(5))^2=9$，故圆的方程为 $(x-2)^2+y^2=9$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，$A B$ 是圆的直径，弦 $C D$ 与 $A B$ 相交于点 $E$，$B E=2A E=2$，$B D=E D$，则线段 $C E$ 的长为#fill-placeholder()。
    #figure(circle-diagram())],
  answers: ([$(2sqrt(3))/3$],),
  explanation: [过 $D$ 作 $D K perp A B$，垂足为 $K$，连接 $A D$。
    #figure(circle-diagram(auxiliary: true))
    由 $B D=E D$，得 $B K=E K=(B E)/2=1$，于是 $A K=2$。因 $A B$ 为直径，$angle A D B=90 degree$，由直角三角形斜边上的高的性质，$D K^2=A K dot B K=2$。
    故 $D E=sqrt(D K^2+E K^2)=sqrt(3)$。由相交弦定理，$C E dot D E=A E dot B E=2$，所以 $C E=2/sqrt(3)=(2sqrt(3))/3$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=cases(x^2+(4a-3)x+3a & quad x<0, log_a (x+1)+1 & quad x>=0)$（$a>0$，且 $a!=1$）在 $RR$ 上单调递减，且关于 $x$ 的方程 $abs(f(x))=2-x/3$ 恰有两个不相等的实数解，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$[1/3,2/3)$],),
  explanation: [
    #step[确定单调性条件][
      左段在 $(-infinity,0)$ 上递减要求 $4a-3<=0$；右段递减要求 $0<a<1$；两段衔接要求 $3a>=f(0)=1$。
      故 $1/3<=a<=3/4$。此时左段为正，右段的零点为 $r=1/a-1 in [1/3,2]$。
    ]
    #step[非负半轴上恰有一解][
      方程要求 $x<=6$。在 $[0,r]$ 上，令 $h(x)=log_a (1+x)-1+x/3$。其二阶导数为 $h''(x)=-1/((1+x)^2 ln a)>0$，故图像位于两端点连线下方。
      因 $h(0)=-1<0$、$h(r)=-2+r/3<0$，这一段无解。
      在 $[r,6]$ 上，方程等价于 $j(x)=-log_a (1+x)-3+x/3=0$。
      此函数严格递增，且 $j(r)=-2+r/3<0$、$j(6)=-f(6)>0$，故恰有一解。
    ]
    #step[负半轴上恰有一解][
      当 $x<0$ 时，方程化为
      $ x^2+(4a-8/3)x+3a-2=0. $
      若 $a<2/3$，常数项为负，两根异号，恰有一个负根。
      若 $a=2/3$，方程为 $x^2=0$，无负根。
      若 $2/3<a<=3/4$，判别式为
      $ Delta=16(a-2/3)(a-17/12)<0, $
      无实根。因此原方程恰有两解当且仅当 $1/3<=a<2/3$。
    ]
  ],
)
#section[解答题：共 6 小题，共 80 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [在 $triangle A B C$ 中，内角 $A,B,C$ 所对应的边分别为 $a,b,c$。已知 $a sin 2B=sqrt(3)b sin A$。],
  parts: (
    subquestion(
      stem: [求 $B$；],
      answers: ([$pi/6$],),
      explanation: [由正弦定理，$a sin B=b sin A$，代入已知等式得
        $ 2a sin B cos B=sqrt(3)a sin B. $
        因 $a>0$、$sin B>0$，得 $cos B=sqrt(3)/2$。结合 $0<B<pi$，得 $B=pi/6$。],
    ),
    subquestion(
      stem: [若 $cos A=1/3$，求 $sin C$ 的值。],
      answers: ([$(2sqrt(6)+1)/6$],),
      explanation: [因 $0<A<pi$，得 $sin A=sqrt(1-cos^2 A)=(2sqrt(2))/3$。于是
        $ sin C=sin(A+B)=sin A cos B+cos A sin B $
        $ =(2sqrt(2))/3 times sqrt(3)/2+1/3 times 1/2=(2sqrt(6)+1)/6. $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [某化肥厂生产甲、乙两种混合肥料，需要 $A,B,C$ 三种主要原料。生产 $1$ 车皮甲种肥料和生产 $1$ 车皮乙种肥料所需三种原料的吨数如下表所示：
    #table(
      columns: 4,
      align: center,
      [肥料／原料], [$A$], [$B$], [$C$],
      [甲], [4], [8], [3],
      [乙], [5], [5], [10],
    )
    现有 $A$ 种原料 $200$ 吨，$B$ 种原料 $360$ 吨，$C$ 种原料 $300$ 吨，在此基础上生产甲、乙两种肥料。
    已知生产 $1$ 车皮甲种肥料，产生的利润为 $2$ 万元；生产 $1$ 车皮乙种肥料，产生的利润为 $3$ 万元。分别用 $x,y$ 表示生产甲、乙两种肥料的车皮数。],
  parts: (
    subquestion(
      stem: [用 $x,y$ 列出满足生产条件的数学关系式，并画出相应的平面区域；],
      answers: (
        [$ cases(4x+5y<=200, 8x+5y<=360, 3x+10y<=300, x>=0, y>=0). $ 平面区域见解析。],
      ),
      explanation: [三种原料的用量均不能超过库存，且产量非负，故得答案中的不等式组。
        对应平面区域为图中的阴影部分（含边界），顶点依次为 $(0,0)$、$(45,0)$、$(40,8)$、$(20,24)$、$(0,30)$。
        #figure(feasible-region())],
    ),
    subquestion(
      stem: [问分别生产甲、乙两种肥料各多少车皮，能够产生最大的利润？并求出此最大利润。],
      answers: ([甲种 $20$ 车皮、乙种 $24$ 车皮，最大利润为 $112$ 万元。],),
      explanation: [设利润为 $z$ 万元，则 $z=2x+3y$。由约束条件，
        $ z=11/25 (4x+5y)+2/25 (3x+10y)<=11/25 times 200+2/25 times 300=112. $
        等号成立要求 $4x+5y=200$、$3x+10y=300$，解得 $x=20,y=24$。此时 $8x+5y=280<=360$，也满足其余约束。
        因此生产甲种肥料 $20$ 车皮、乙种肥料 $24$ 车皮时利润最大，为 $112$ 万元。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [如图，四边形 $A B C D$ 是平行四边形，平面 $A E D perp$ 平面 $A B C D$，$E F parallel A B$，$A B=2$，$B C=E F=1$，$A E=sqrt(6)$，$D E=3$，$angle B A D=60 degree$，$G$ 为 $B C$ 的中点。
    #figure(solid())],
  parts: (
    subquestion(
      stem: [求证：$F G parallel$ 平面 $B E D$；],
      answers: ([证明见解析。],),
      explanation: [取 $B D$ 的中点 $O$，连接 $O E,O G$。由三角形中位线定理，$O G parallel D C$ 且 $O G=1/2 D C=1$。
        又 $E F parallel A B parallel D C$ 且 $E F=1$，结合图中点的位置，四边形 $O G F E$ 为平行四边形，故 $F G parallel O E$。
        因 $O E subset$ 平面 $B E D$，$F G$ 不在平面 $B E D$ 内，故 $F G parallel$ 平面 $B E D$。
        #figure(solid(auxiliary: true))],
    ),
    subquestion(
      stem: [求证：平面 $B E D perp$ 平面 $A E D$；],
      answers: ([证明见解析。],),
      explanation: [由平行四边形性质，$A D=B C=1$。在 $triangle A B D$ 中，
        $ B D^2=A B^2+A D^2-2A B dot A D cos 60 degree=4+1-2=3. $
        从而 $A D^2+B D^2=A B^2$，得 $B D perp A D$。
        又平面 $A E D perp$ 平面 $A B C D$，交线为 $A D$，故 $B D perp$ 平面 $A E D$。
        因 $B D subset$ 平面 $B E D$，所以平面 $B E D perp$ 平面 $A E D$。],
    ),
    subquestion(
      stem: [求直线 $E F$ 与平面 $B E D$ 所成角的正弦值。],
      answers: ([$sqrt(5)/6$],),
      explanation: [过 $A$ 作 $A H perp D E$ 于 $H$，连接 $B H$。由第 (2) 问，两平面垂直且交线为 $D E$，故 $A H perp$ 平面 $B E D$，所以 $angle A B H$ 为 $A B$ 与该平面所成角。
        在 $triangle A D E$ 中，由余弦定理得
        $ cos angle A D E=(A D^2+D E^2-A E^2)/(2A D dot D E)=(1+9-6)/6=2/3. $
        因此 $A H=A D sin angle A D E=sqrt(5)/3$，从而
        $ sin angle A B H=(A H)/(A B)=sqrt(5)/6. $
        因 $E F parallel A B$，所求正弦值也为 $sqrt(5)/6$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知 ${a_n}$ 是等比数列，前 $n$ 项和为 $S_n$（$n in NN^*$），且 $1/a_1-1/a_2=2/a_3$，$S_6=63$。],
  parts: (
    subquestion(
      stem: [求数列 ${a_n}$ 的通项公式；],
      answers: ([$a_n=2^(n-1)$],),
      explanation: [设公比为 $q$。由 $1/a_1-1/(a_1 q)=2/(a_1 q^2)$，得 $q^2-q-2=0$，所以 $q=2$ 或 $q=-1$。
        若 $q=-1$，则相邻两项之和为零，$S_6=0$，不合题意。故 $q=2$。
        由 $S_6=a_1 (2^6-1)/(2-1)=63$，得 $a_1=1$，因此 $a_n=2^(n-1)$。],
    ),
    subquestion(
      stem: [若对任意的 $n in NN^*$，$b_n$ 是 $log_2 a_n$ 和 $log_2 a_(n+1)$ 的等差中项，求数列 ${(-1)^n b_n^2}$ 的前 $2n$ 项和。],
      answers: ([$2n^2$],),
      explanation: [由第 (1) 问，$b_n=1/2 ((n-1)+n)=n-1/2$。将相邻两项配对，得
        $ sum_(k=1)^(2n) (-1)^k b_k^2=sum_(j=1)^n ((2j-1/2)^2-(2j-3/2)^2) $
        $ =sum_(j=1)^n (4j-2)=2n(n+1)-2n=2n^2. $],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设椭圆 $x^2/a^2+y^2/3=1$（$a>sqrt(3)$）的右焦点为 $F$，右顶点为 $A$。已知 $1/abs(O F)+1/abs(O A)=(3e)/abs(F A)$，其中 $O$ 为原点，$e$ 为椭圆的离心率。],
  parts: (
    subquestion(
      stem: [求椭圆的方程；],
      answers: ([$x^2/4+y^2/3=1$],),
      explanation: [设半焦距为 $c>0$，则 $e=c/a$，题设等式为 $1/c+1/a=(3c)/(a(a-c))$。
        化简得 $a^2-c^2=3c^2$。又 $a^2-c^2=3$，故 $c=1,a=2$，椭圆方程为 $x^2/4+y^2/3=1$。],
    ),
    subquestion(
      stem: [设过点 $A$ 的直线 $l$ 与椭圆交于点 $B$（$B$ 不在 $x$ 轴上），垂直于 $l$ 的直线与 $l$ 交于点 $M$，与 $y$ 轴交于点 $H$。若 $B F perp H F$，且 $angle M O A=angle M A O$，求直线 $l$ 的斜率。],
      answers: ([$plus.minus sqrt(6)/4$],),
      explanation: [过 $A(2,0)$ 的竖直线为椭圆的切线，不能交于另一点 $B$，故 $l$ 的斜率存在；又 $B$ 不在 $x$ 轴上，故斜率 $k!=0$。设 $l:y=k(x-2)$，与椭圆联立，得
        $ (4k^2+3)x^2-16k^2 x+16k^2-12=0. $
        一根为 $2$，由另一根得
        $ B=((8k^2-6)/(4k^2+3),(-12k)/(4k^2+3)). $
        设 $H=(0,h)$。由 $F=(1,0)$ 及 $B F perp H F$，得
        $ (x_B-1,y_B) dot (-1,h)=0, quad h=(9-4k^2)/(12k). $
        故 $M H:y=-x/k+(9-4k^2)/(12k)$。与 $l$ 联立，得
        $ x_M=(20k^2+9)/(12(k^2+1)). $
        此值在 $0$ 与 $2$ 之间，且 $y_M=k(x_M-2)!=0$，故 $triangle M O A$ 非退化。
        由等角对等边，题设角条件等价于 $M A=M O$，即
        $ (x_M-2)^2+y_M^2=x_M^2+y_M^2, quad x_M=1. $
        代入得 $20k^2+9=12k^2+12$，即 $k^2=3/8$，所以 $k=plus.minus sqrt(6)/4$。
        两个值均非零，代回上述构造可得符合题意的 $B,H,M$，故所求斜率为 $plus.minus sqrt(6)/4$。],
    ),
  ),
)

#question(
  "solution",
  score: 14,
  stem: [设函数 $f(x)=x^3-a x-b$，$x in RR$，其中 $a,b in RR$。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的单调区间；],
      answers: (
        [当 $a<=0$ 时，在 $RR$ 上递增，无递减区间。
          当 $a>0$ 时，递增区间为 $(-infinity,-sqrt(a/3))$、$(sqrt(a/3),+infinity)$，递减区间为 $(-sqrt(a/3),sqrt(a/3))$。],
      ),
      explanation: [求导得 $f'(x)=3x^2-a$。
        当 $a<=0$ 时，导数非负且至多一处为零，故 $f$ 在 $RR$ 上严格递增。
        当 $a>0$ 时，导数在 $x=plus.minus sqrt(a/3)$ 处为零，在两零点外侧为正、内侧为负，故单调区间如答案。],
    ),
    subquestion(
      stem: [若 $f(x)$ 存在极值点 $x_0$，且 $f(x_1)=f(x_0)$，其中 $x_1!=x_0$，求证：$x_1+2x_0=0$；],
      answers: ([证明见解析。],),
      explanation: [由 $f'(x_0)=0$，得 $a=3x_0^2$。于是
        $ f(x)-f(x_0)=x^3-x_0^3-3x_0^2(x-x_0)=(x-x_0)^2(x+2x_0). $
        取 $x=x_1$，利用 $f(x_1)=f(x_0)$ 且 $x_1!=x_0$，得到 $x_1+2x_0=0$。],
    ),
    subquestion(
      stem: [设 $a>0$，函数 $g(x)=abs(f(x))$，求证：$g(x)$ 在区间 $[-1,1]$ 上的最大值不小于 $1/4$。],
      answers: ([证明见解析。],),
      explanation: [设 $M=max_(x in [-1,1]) abs(f(x))$，连续性保证最大值存在。直接计算得
        $ f(1)-f(-1)=2-2a, quad f(1/2)-f(-1/2)=1/4-a. $
        消去 $a$，得到
        $ f(1)-f(-1)-2f(1/2)+2f(-1/2)=3/2. $
        由三角不等式，
        $ 3/2<=abs(f(1))+abs(f(-1))+2abs(f(1/2))+2abs(f(-1/2))<=6M. $
        因此 $M>=1/4$，结论成立。],
    ),
  ),
)
