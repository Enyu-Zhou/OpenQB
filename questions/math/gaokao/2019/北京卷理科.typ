#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019北京理.pdf",
  regions: ("北京",),
)

#let flowchart() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.6, 6.5), (0.6, 7), radius: 0.18)
  content((0, 6.75), [开始])
  rect((-1.1, 5.45), (1.1, 5.95))
  content((0, 5.7), [$k=1,s=1$])
  rect((-1.15, 3.9), (1.15, 4.9))
  content((0, 4.4), [$s=(2s^2)/(3s-2)$])
  line((0, 3.3), (1.25, 2.85), (0, 2.4), (-1.25, 2.85), close: true)
  content((0, 2.85), [$k>=3?$])
  line((-0.9, 1.4), (0.7, 1.4), (0.9, 1.9), (-0.7, 1.9), close: true)
  content((0, 1.65), [输出 $s$])
  rect((-0.6, 0.3), (0.6, 0.8), radius: 0.18)
  content((0, 0.55), [结束])
  for (a, b) in ((6.5, 5.95), (5.45, 4.9), (3.9, 3.3), (2.4, 1.9), (1.4, 0.8)) {
    line((0, a), (0, b), mark: (end: ">"))
  }
  rect((1.5, 4.05), (3.3, 4.55))
  content((2.4, 4.3), [$k=k+1$])
  line((1.25, 2.85), (2.4, 2.85), (2.4, 4.05), mark: (end: ">"))
  line((2.4, 4.55), (2.4, 5.2), (0.25, 5.2), mark: (end: ">"))
  line((0.25, 5.2), (0, 5.2))
  content((1.65, 3.05), [否], anchor: "south")
  content((0.2, 2.15), [是], anchor: "west")
})
#let heart-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: move(dx: -5pt)[$O$],
  ))
  plot.plot(
    size: (4, 4),
    axis-style: "school-book",
    x-min: -1.7,
    x-max: 1.7,
    y-min: -1.5,
    y-max: 1.9,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.add(
        range(0, 361).map(i => {
          let theta = i * 1deg
          let r = 1 / calc.sqrt(1 - calc.abs(calc.cos(theta)) * calc.sin(theta))
          (r * calc.cos(theta), r * calc.sin(theta))
        }),
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
    },
  )
})
#let views() = cetz.canvas(length: 4mm, {
  import cetz.draw: *
  let segments = (
    ((2, 9), (6, 9)),
    ((2, 11), (6, 11)),
    ((2, 13), (6, 13)),
    ((2, 9), (2, 13)),
    ((6, 9), (6, 13)),
    ((9, 9), (13, 9)),
    ((9, 9), (9, 13)),
    ((13, 9), (13, 11)),
    ((11, 11), (13, 11)),
    ((2, 2), (6, 2)),
    ((2, 6), (6, 6)),
    ((2, 2), (2, 6)),
    ((6, 2), (6, 6)),
    ((2, 4), (6, 4)),
  )
  for x in range(0, 15) {
    for y in range(0, 15) {
      let covered = segments.any(s => (
        s.at(0).at(0) == x
          and s.at(1).at(0) == x
          and s.at(0).at(1) <= y
          and y < s.at(1).at(1)
      ))
      if not covered {
        line((x, y), (x, y + 1), stroke: (
          paint: luma(75%),
          thickness: figure-style.thickness,
        ))
      }
    }
  }
  for y in range(0, 16) {
    for x in range(0, 14) {
      let covered = segments.any(s => (
        s.at(0).at(1) == y
          and s.at(1).at(1) == y
          and s.at(0).at(0) <= x
          and x < s.at(1).at(0)
      ))
      if not covered {
        line((x, y), (x + 1, y), stroke: (
          paint: luma(75%),
          thickness: figure-style.thickness,
        ))
      }
    }
  }
  set-style(stroke: figure-style.thickness)
  for (a, b) in segments { line(a, b) }
  line((9, 13), (11, 11))
  for (pos, label) in (
    ((4, 8), [正（主）视图]),
    ((11, 8), [侧（左）视图]),
    ((4, 1), [俯视图]),
  ) {
    content(
      pos,
      text(size: 9pt, label),
      frame: "rect",
      fill: white,
      stroke: none,
      padding: 1pt,
    )
  }
})
#let pyramid-diagram() = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let p = (0, 0, 2)
  let b = (2, -1, 0)
  let c = (2, 2, 0)
  let d = (0, 2, 0)
  let e = (0, 1, 1)
  let f = (2 / 3, 2 / 3, 4 / 3)
  let g = (4 / 3, -2 / 3, 2 / 3)
  oblique-project((-0.7, -0.4), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, b, c, d, p)
    line(p, c)
    line(e, f)
    line(b, a, d, stroke: (dash: figure-style.dash))
    line(p, a, e, stroke: (dash: figure-style.dash))
    line(f, a, g, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (p, $P$, "south"),
      (a, $A$, "north"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (e, $E$, "south-west"),
      (f, $F$, "south-west"),
      (g, $G$, "east"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [已知复数 $z=2+"i"$，则 $z dot overline(z)=$#choice-placeholder()。],
  choices: ([$sqrt(3)$], [$sqrt(5)$], [$3$], [$5$]),
  answers: ([D],),
  explanation: [$z overline(z)=(2+"i")(2-"i")=4-"i"^2=5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图所示的程序框图，输出的 $s$ 值为#choice-placeholder()。
    #figure(flowchart())],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([B],),
  explanation: [初始 $k=1$、$s=1$，第一次更新得 $s=(2 times 1^2)/(3 times 1-2)=2$。
    此后每次更新均有 $s=(2 times 2^2)/(3 times 2-2)=2$。当 $k=3$ 时退出循环，故输出 $2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知直线 $l$ 的参数方程为 $cases(x=1+3t, y=2+4t)$（$t$ 为参数），则点 $(1,0)$ 到直线 $l$ 的距离是#choice-placeholder()。],
  choices: ([$1/5$], [$2/5$], [$4/5$], [$6/5$]),
  answers: ([D],),
  explanation: [消去参数得 $4x-3y+2=0$，故距离为 $frac(|4 times 1-3 times 0+2|, sqrt(4^2+(-3)^2))=6/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的离心率为 $1/2$，则#choice-placeholder()。],
  choices: ([$a^2=2b^2$], [$3a^2=4b^2$], [$a=2b$], [$3a=4b$]),
  answers: ([B],),
  explanation: [由 $c/a=1/2$、$c^2=a^2-b^2$ 得 $a^2/4=a^2-b^2$，即 $3a^2=4b^2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $x,y$ 满足 $|x|<=1-y$，且 $y>=-1$，则 $3x+y$ 的最大值为#choice-placeholder()。],
  choices: ([$-7$], [$1$], [$5$], [$7$]),
  answers: ([C],),
  explanation: [由 $x<=1-y$、$y>=-1$ 得 $3x+y<=3(1-y)+y=3-2y<=5$。
    当 $(x,y)=(2,-1)$ 时满足条件且取等，故最大值为 $5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在天文学中，天体的明暗程度可以用星等或亮度来描述。两颗星的星等与亮度满足 $m_2-m_1=5/2 lg(E_1/E_2)$，其中星等为 $m_k$ 的星的亮度为 $E_k$（$k=1,2$）。已知太阳的星等是 $-26.7$，天狼星的星等是 $-1.45$，则太阳与天狼星的亮度的比值为#choice-placeholder()。],
  choices: ([$10^10.1$], [$10.1$], [$lg 10.1$], [$10^(-10.1)$]),
  answers: ([A],),
  explanation: [分别用下标 $1$、$2$ 表示太阳、天狼星，则 $lg(E_1/E_2)=2/5(-1.45+26.7)=10.1$，故 $E_1/E_2=10^10.1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设点 $A,B,C$ 不共线，则“$arrow(A B)$ 与 $arrow(A C)$ 的夹角为锐角”是“$|arrow(A B)+arrow(A C)|>|arrow(B C)|$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([C],),
  explanation: [∵ $arrow(B C)=arrow(A C)-arrow(A B)$，∴
    $ |arrow(A B)+arrow(A C)|^2-|arrow(B C)|^2=4arrow(A B) dot arrow(A C). $
    模长均非负，故题给不等式等价于数量积为正，也就等价于两向量的夹角为锐角。],
)
#question(
  "single-choice",
  score: 5,
  stem: [数学中有许多形状优美、寓意美好的曲线，曲线 $C:x^2+y^2=1+|x|y$ 就是其中之一（如图）。给出下列三个结论：
    ① 曲线 $C$ 恰好经过 $6$ 个整点（即横、纵坐标均为整数的点）；
    ② 曲线 $C$ 上任意一点到原点的距离都不超过 $sqrt(2)$；
    ③ 曲线 $C$ 所围成的“心形”区域的面积小于 $3$。
    其中，所有正确结论的序号是#choice-placeholder()。
    #figure(heart-diagram())],
  choices: ([①], [②], [①②], [①②③]),
  answers: ([C],),
  explanation: [#step[结论①][方程可化为 $(y-|x|/2)^2+3x^2/4=1$，故 $|x|<=2/sqrt(3)$。
      整点的横坐标只能为 $-1,0,1$，代入可得 $(-1,0)$、$(-1,1)$、$(0,-1)$、$(0,1)$、$(1,0)$、$(1,1)$，恰有 $6$ 个，故①正确。]
    #step[结论②][由 $|x|y<=|x y|<=(x^2+y^2)/2$ 得 $x^2+y^2<=1+(x^2+y^2)/2$，即 $x^2+y^2<=2$，故②正确。]
    #step[结论③][在 $0<x<1$ 时，两支曲线为 $y=(x±sqrt(4-3x^2))/2$。
      ∵ $4-3x^2>(2-x)^2$，∴ 上支高于 $y=1$，下支低于 $y=x-1$。
      所以右半区域严格包含顶点为 $(0,-1)$、$(1,0)$、$(1,1)$、$(0,1)$ 的四边形，其面积为 $1+1/2=3/2$。
      由关于 $y$ 轴的对称性，总面积大于 $3$，故③错误。]],
)

#section[填空题：本题共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [函数 $f(x)=sin^2 2x$ 的最小正周期是#fill-placeholder()。],
  answers: ([$pi/2$],),
  explanation: [$sin^2 2x=(1-cos 4x)/2$，故最小正周期为 $(2pi)/4=pi/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设等差数列 ${a_n}$ 的前 $n$ 项和为 $S_n$，若 $a_2=-3$，$S_5=-10$，则 $a_5=$#fill-placeholder()，$S_n$ 的最小值为#fill-placeholder()。],
  answers: ([$0$], [$-10$]),
  explanation: [由 $S_5=5a_3=-10$ 得 $a_3=-2$，公差 $d=1$，故 $a_n=n-5$，$a_5=0$。
    前四项为负，第五项为零，此后各项为正，故 $S_n$ 的最小值为 $S_4=S_5=-10$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某几何体是由一个正方体去掉一个四棱柱所得，其三视图如图所示。如果网格纸上小正方形的边长为 $1$，那么该几何体的体积为#fill-placeholder()。
    #figure(views())],
  answers: ([$40$],),
  explanation: [正方体的棱长为 $4$。由侧视图可知，去掉的四棱柱以一个上、下底为 $2$、$4$，高为 $2$ 的梯形为底面，棱柱高为 $4$。
    故剩余体积为 $4^3-1/2(2+4) times 2 times 4=40$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $l,m$ 是平面 $alpha$ 外的两条不同直线。给出下列三个论断：① $l perp m$；② $m parallel alpha$；③ $l perp alpha$。
    以其中的两个论断作为条件，余下的一个论断作为结论，写出一个正确的命题：#fill-placeholder()。],
  answers: ([若②③成立，则①成立。（或：若①③成立，则②成立。）],),
  explanation: [若 $m parallel alpha$，则平面 $alpha$ 内存在直线 $m'$ 与 $m$ 平行。由 $l perp alpha$ 得 $l perp m'$，故 $l perp m$。
    另一个正确命题可由方向关系说明：若 $l perp alpha$、$m perp l$，则 $m$ 的方向平行于 $alpha$；又 $m$ 在平面 $alpha$ 外，故 $m parallel alpha$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设函数 $f(x)=e^x+a e^(-x)$（$a$ 为常数）。若 $f(x)$ 为奇函数，则 $a=$#fill-placeholder()；若 $f(x)$ 是 $RR$ 上的增函数，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$-1$], [$(-infinity,0]$]),
  explanation: [奇函数满足 $f(0)=0$，故 $1+a=0$，即 $a=-1$；此时 $e^x-e^(-x)$ 确为奇函数。
    又 $f'(x)=e^(-x)(e^(2x)-a)$。若 $a<=0$，则导数恒正；若 $a>0$，则在 $x<(ln a)/2$ 时导数为负。
    故在 $RR$ 上递增的充要条件为 $a<=0$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [李明自主创业，在网上经营一家水果店，销售的水果中有草莓、京白梨、西瓜、桃，价格依次为 $60$ 元/盒、$65$ 元/盒、$80$ 元/盒、$90$ 元/盒。为增加销量，李明对这四种水果进行促销：一次购买水果的总价达到 $120$ 元，顾客就少付 $x$ 元。每笔订单顾客网上支付成功后，李明会得到支付款的 $80%$。
    ① 当 $x=10$ 时，顾客一次购买草莓和西瓜各 $1$ 盒，需要支付#fill-placeholder()元；
    ② 在促销活动中，为保证李明每笔订单得到的金额均不低于促销前总价的七折，则 $x$ 的最大值为#fill-placeholder()。],
  answers: ([$130$], [$15$]),
  explanation: [① 需支付 $60+80-10=130$ 元。
    ② 设促销前总价为 $T$。若 $T<120$，则李明得到 $0.8T>=0.7T$，满足要求。
    若 $T>=120$，需 $0.8(T-x)>=0.7T$，即 $x<=T/8$。总价 $120$ 元可由两盒草莓取得，故 $x<=120/8=15$。
    当 $x=15$ 时所有订单均满足要求，故最大值为 $15$。],
)

#section[解答题：本题共 6 小题，共 80 分。解答应写出文字说明、演算步骤或证明过程。]
#question(
  "solution",
  score: 13,
  stem: [在 $triangle A B C$ 中，$a=3$，$b-c=2$，$cos B=-1/2$。],
  parts: (
    subquestion(
      stem: [求 $b,c$ 的值。],
      answers: ([$b=7$，$c=5$。],),
      explanation: [由余弦定理，$b^2=a^2+c^2-2a c cos B=9+c^2+3c$。
        代入 $b=c+2$，得 $c^2+4c+4=c^2+3c+9$，故 $c=5$、$b=7$。],
    ),
    subquestion(
      stem: [求 $sin(B-C)$ 的值。],
      answers: ([$4sqrt(3)/7$],),
      explanation: [∵ $B=120 degree$，∴ $sin B=sqrt(3)/2$，且 $C<60 degree$。
        由正弦定理得 $sin C=(c sin B)/b=5sqrt(3)/14$，故 $cos C=sqrt(1-sin^2 C)=11/14$。
        ∴ $sin(B-C)=sin B cos C-cos B sin C=(sqrt(3)/2)(11/14)+(1/2)(5sqrt(3)/14)=4sqrt(3)/7$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在四棱锥 $P-A B C D$ 中，$P A perp$ 平面 $A B C D$，$A D perp C D$，$A D parallel B C$，$P A=A D=C D=2$，$B C=3$。$E$ 为 $P D$ 的中点，点 $F$ 在 $P C$ 上，且 $(P F)/(P C)=1/3$。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [求证：$C D perp$ 平面 $P A D$。],
      answers: ([证明见解析。],),
      explanation: [由 $P A perp$ 平面 $A B C D$ 得 $P A perp C D$。
        又 $A D perp C D$，$P A inter A D=A$，故 $C D perp$ 平面 $P A D$。],
    ),
    subquestion(
      stem: [求二面角 $F-A E-P$ 的余弦值。],
      answers: ([$sqrt(3)/3$],),
      explanation: [#step[确定二面角的平面角][在等腰直角三角形 $P A D$ 中，$E$ 是 $P D$ 中点，故 $A E perp P D$。
          由第（1）问，$C D perp A E$。∵ $P D inter C D=D$，∴ $A E perp$ 平面 $P C D$。
          故 $A E perp E F$、$A E perp E P$，二面角的平面角为 $angle F E P$。]
        #step[计算余弦][取 $A=(0,0,0)$、$P=(0,0,2)$、$D=(0,2,0)$、$C=(2,2,0)$，则 $E=(0,1,1)$、$F=(2/3,2/3,4/3)$。
          ∴ $arrow(E F)=(2/3,-1/3,1/3)$、$arrow(E P)=(0,-1,1)$，于是
          $
            cos angle F E P=(arrow(E F) dot arrow(E P))/(|arrow(E F)| |arrow(E P)|)=(2/3)/((sqrt(6)/3)sqrt(2))=sqrt(3)/3.
          $]],
    ),
    subquestion(
      stem: [设点 $G$ 在 $P B$ 上，且 $(P G)/(P B)=2/3$。判断直线 $A G$ 是否在平面 $A E F$ 内，说明理由。],
      answers: ([直线 $A G$ 在平面 $A E F$ 内。],),
      explanation: [沿用第（2）问的坐标系，由 $B C=3$、$A D parallel B C$ 得 $B=(2,-1,0)$，故 $G=(4/3,-2/3,2/3)$。
        由 $A,E,F$ 的坐标，平面 $A E F$ 的方程为 $x+y-z=0$。
        ∵ $4/3-2/3-2/3=0$，∴ $G$ 在该平面内；$A$ 也在该平面内，故直线 $A G$ 在平面 $A E F$ 内。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [改革开放以来，人们的支付方式发生了巨大转变。近年来，移动支付已成为主要支付方式之一。为了解某校学生上个月 $A,B$ 两种移动支付方式的使用情况，从全校学生中随机抽取了 $100$ 人，发现样本中 $A,B$ 两种支付方式都不使用的有 $5$ 人，样本中仅使用 $A$ 和仅使用 $B$ 的学生的支付金额分布情况如下：
    #table(
      columns: 4,
      align: center,
      [支付方式／支付金额（元）], [$(0,1000]$], [$(1000,2000]$], [大于 $2000$],
      [仅使用 $A$], [18 人], [9 人], [3 人],
      [仅使用 $B$], [10 人], [14 人], [1 人],
    )],
  parts: (
    subquestion(
      stem: [从全校学生中随机抽取 $1$ 人，估计该学生上个月 $A,B$ 两种支付方式都使用的概率。],
      answers: ([$2/5$],),
      explanation: [仅使用 $A$ 的有 $30$ 人，仅使用 $B$ 的有 $25$ 人，故两种都使用的有 $100-30-25-5=40$ 人。
        以样本频率估计概率，得 $40/100=2/5$。],
    ),
    subquestion(
      stem: [从样本仅使用 $A$ 和仅使用 $B$ 的学生中各随机抽取 $1$ 人，以 $X$ 表示这 $2$ 人中上个月支付金额大于 $1000$ 元的人数，求 $X$ 的分布列和数学期望。],
      answers: (
        [#table(
            columns: 4,
            align: center,
            [$X$], [$0$], [$1$], [$2$],
            [$P$], [$6/25$], [$13/25$], [$6/25$],
          )
          $E(X)=1$。],
      ),
      explanation: [两组学生中支付金额大于 $1000$ 元的比例分别为 $12/30=2/5$、$15/25=3/5$，两次抽取相互独立。
        $P(X=0)=(3/5)(2/5)=6/25$，$P(X=2)=(2/5)(3/5)=6/25$，$P(X=1)=1-12/25=13/25$。
        ∴ $E(X)=0 times 6/25+1 times 13/25+2 times 6/25=1$。],
    ),
    subquestion(
      stem: [已知上个月样本学生的支付方式在本月没有变化。现从样本仅使用 $A$ 的学生中，随机抽查 $3$ 人，发现他们本月的支付金额都大于 $2000$ 元。根据抽查结果，能否认为样本仅使用 $A$ 的学生中本月支付金额大于 $2000$ 元的人数有变化？说明理由。],
      answers: ([有理由认为人数有所增加，理由见解析。],),
      explanation: [上个月这 $30$ 人中支付金额大于 $2000$ 元的只有 $3$ 人。
        若本月仍只有 $3$ 人，则随机抽取的 $3$ 人恰好都是这 $3$ 人的概率为 $1/binom(30, 3)=1/4060$，极小。
        现在这一小概率事件发生，有理由认为本月人数已增加。这是依据小概率原理作出的统计判断，并非由一次抽样作出的必然性结论。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知抛物线 $C:x^2=-2p y$ 经过点 $(2,-1)$。],
  parts: (
    subquestion(
      stem: [求抛物线 $C$ 的方程及其准线方程。],
      answers: ([$x^2=-4y$，准线为 $y=1$。],),
      explanation: [代入 $(2,-1)$ 得 $4=2p$，故 $p=2$。抛物线方程为 $x^2=-4y$，准线为 $y=p/2=1$。],
    ),
    subquestion(
      stem: [设 $O$ 为原点，过抛物线 $C$ 的焦点作斜率不为 $0$ 的直线 $l$ 交抛物线 $C$ 于两点 $M,N$，直线 $y=-1$ 分别交直线 $O M,O N$ 于点 $A$ 和点 $B$。求证：以 $A B$ 为直径的圆经过 $y$ 轴上的两个定点。],
      answers: ([两个定点为 $(0,1)$、$(0,-3)$，证明见解析。],),
      explanation: [#step[求交点的关系][焦点为 $(0,-1)$，设 $l:y=k x-1$（$k != 0$）。联立得 $x^2+4k x-4=0$。
          设 $M,N$ 的横坐标为 $x_1,x_2$，则 $x_1 x_2=-4$，两者均非零。
          由 $M=(x_1,-x_1^2/4)$ 得直线 $O M:y=-x_1 x/4$，故 $A=(4/x_1,-1)$。同理 $B=(4/x_2,-1)$。]
        #step[确定圆上的定点][记 $u=4/x_1$、$v=4/x_2$，则 $u v=-4$。
          以 $A B$ 为直径的圆上点 $(x,y)$ 满足 $((x,y)-A) dot ((x,y)-B)=0$，即 $(x-u)(x-v)+(y+1)^2=0$。
          令 $x=0$，得 $-4+(y+1)^2=0$，故 $y=1$ 或 $-3$，与直线 $l$ 无关。
          ∴ 圆恒过 $(0,1)$、$(0,-3)$ 两个定点。]],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知函数 $f(x)=1/4 x^3-x^2+x$。],
  parts: (
    subquestion(
      stem: [求曲线 $y=f(x)$ 的斜率为 $1$ 的切线方程。],
      answers: ([$y=x$ 或 $y=x-64/27$。],),
      explanation: [$f'(x)=3/4 x^2-2x+1$。令 $f'(x)=1$，得 $x=0$ 或 $x=8/3$。
        对应切点为 $(0,0)$、$(8/3,8/27)$，故切线方程为 $y=x$、$y=x-64/27$。],
    ),
    subquestion(
      stem: [当 $x in [-2,4]$ 时，求证：$x-6<=f(x)<=x$。],
      answers: ([证明见解析。],),
      explanation: [令 $g(x)=f(x)-x=1/4 x^3-x^2$，则 $g'(x)=x(3x-8)/4$。
        故 $g$ 在 $[-2,0]$、$[8/3,4]$ 上递增，在 $[0,8/3]$ 上递减。
        又 $g(-2)=-6$、$g(0)=g(4)=0$、$g(8/3)=-64/27$，故 $-6<=g(x)<=0$。
        加上 $x$，即得 $x-6<=f(x)<=x$。],
    ),
    subquestion(
      stem: [设 $F(x)=|f(x)-(x+a)|$（$a in RR$），记 $F(x)$ 在区间 $[-2,4]$ 上的最大值为 $M(a)$。当 $M(a)$ 最小时，求 $a$ 的值。],
      answers: ([$a=-3$。],),
      explanation: [由第（2）问，$g(x)=f(x)-x$ 的值域为 $[-6,0]$，故
        $ M(a)=max(|a+6|, |a|)>=(|a+6|+|a|)/2>=3. $
        当 $a=-3$ 时，$M(a)=3$。若 $M(a)=3$，必须同时有 $|a|<=3$、$|a+6|<=3$，解得 $a=-3$。
        因此所求 $a=-3$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知数列 ${a_n}$，从中选取第 $i_1$ 项、第 $i_2$ 项、$dots$、第 $i_m$ 项（$i_1<i_2<dots<i_m$），若 $a_(i_1)<a_(i_2)<dots<a_(i_m)$，则称新数列 $a_(i_1),a_(i_2),dots,a_(i_m)$ 为 ${a_n}$ 的长度为 $m$ 的递增子列。规定：数列 ${a_n}$ 的任意一项都是 ${a_n}$ 的长度为 $1$ 的递增子列。],
  parts: (
    subquestion(
      stem: [写出数列 $1,8,3,7,5,6,9$ 的一个长度为 $4$ 的递增子列。],
      answers: ([$1,3,5,6$（答案不唯一）。],),
      explanation: [选取第 $1,3,5,6$ 项，所得 $1<3<5<6$，符合要求。],
    ),
    subquestion(
      stem: [已知数列 ${a_n}$ 的长度为 $p$ 的递增子列的末项的最小值为 $a_(m_0)$，长度为 $q$ 的递增子列的末项的最小值为 $a_(n_0)$。若 $p<q$，求证：$a_(m_0)<a_(n_0)$。],
      answers: ([证明见解析。],),
      explanation: [取一个长度为 $q$、末项为 $a_(n_0)$ 的递增子列。它的前 $p$ 项构成长度为 $p$ 的递增子列，设其末项为 $b$。
        由最小值定义，$a_(m_0)<=b$；由 $p<q$ 及严格递增，$b<a_(n_0)$。
        ∴ $a_(m_0)<a_(n_0)$。],
    ),
    subquestion(
      stem: [设无穷数列 ${a_n}$ 的各项均为正整数，且任意两项均不相等。若 ${a_n}$ 的长度为 $s$ 的递增子列末项的最小值为 $2s-1$，且长度为 $s$、末项为 $2s-1$ 的递增子列恰有 $2^(s-1)$ 个（$s=1,2,dots$），求数列 ${a_n}$ 的通项公式。],
      answers: (
        [$a_n=cases(n+1 & quad n "为奇数", n-1 & quad n "为偶数")$，即 $2,1,4,3,6,5,dots$。],
      ),
      explanation: [#step[确定每对相邻整数的次序][对每个正整数 $j$，$2j-1$ 都是某个长度为 $j$ 的递增子列的末项，因而所有正奇数均在原数列中出现。
          若 $2j$ 出现于 $2j-1$ 之后，就可将它接在上述子列末尾，得到长度为 $j+1$、末项为 $2j$ 的递增子列，与最小末项为 $2j+1$ 矛盾。
          故只要 $2j$ 出现，就必在 $2j-1$ 之前。]
        #step[利用子列个数确定整体次序][固定 $s>=2$。长度为 $s$、末项为 $2s-1$ 的递增子列，其前 $s-1$ 项取自
          $ {1,2},quad {3,4},quad dots,quad {2s-3,2s-2}. $
          每对中的偶数先于奇数，故递增子列每对至多选一项；总共 $s-1$ 项，必须每对恰选一项，最多有 $2^(s-1)$ 种。
          题设恰好达到此上界，说明每一种选择都存在且可按数值递增排列成子列。因此这些偶数都已出现，且任意前一对中的数都在后一对中的数之前。
          由于 $s$ 可任意大，所有正整数均出现，整体次序只能为 $2,1,4,3,6,5,dots$。]
        #step[写出通项并验证][$
            a_n=cases(n+1 & quad n "为奇数", n-1 & quad n "为偶数").
          $
          此数列每对内部递减，不同对之间递增。长度为 $s$ 的递增子列至少涉及 $s$ 对，故末项至少为 $2s-1$，且该值可达到。
          末项固定为 $2s-1$ 时，前 $s-1$ 对各任选一项，恰有 $2^(s-1)$ 个递增子列。故上述通项满足全部条件。]],
    ),
  ),
)
