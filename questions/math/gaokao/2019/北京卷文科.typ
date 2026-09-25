#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019北京文.pdf",
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

#let circle-diagram() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let point(t) = (2 * calc.cos(t), 2 * calc.sin(t))
  let a = point(30deg)
  let b = point(-120deg)
  let p = point(180deg)
  let points = (p,) + range(0, 151).map(i => point((30 - i) * 1deg))
  line(..points, close: true, fill: luma(88%), stroke: none)
  circle((0, 0), radius: 2)
  line(a, p, b)
  content(a, $A$, anchor: "south-west", padding: 3pt)
  content(b, $B$, anchor: "north-east", padding: 3pt)
  content(p, $P$, anchor: "east", padding: 3pt)
})
#let pyramid-diagram(auxiliary: false) = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (calc.sqrt(3), -1, 0)
  let c = (calc.sqrt(3), 1, 0)
  let d = (0, 2, 0)
  let p = (0, 0, 2.2)
  let e = (calc.sqrt(3) / 2, 1.5, 0)
  let f = (calc.sqrt(3) / 2, -0.5, 1.1)
  let g = (0, 0, 1.1)
  oblique-project((-0.45, -0.4), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, b, c, d, p)
    line(p, c)
    line(p, e)
    line(b, a, d, stroke: (dash: figure-style.dash))
    line(p, a, c, stroke: (dash: figure-style.dash))
    line(b, d, stroke: (dash: figure-style.dash))
    line(a, e, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(c, f)
      line(f, g, e, stroke: (dash: figure-style.dash))
      content(f, $F$, anchor: "east", padding: 3pt)
      content(g, $G$, anchor: "south-east", padding: 4pt)
    }
    for (point, label, anchor) in (
      (p, $P$, "south"),
      (a, $A$, "south-east"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (e, $E$, "north-west"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x | -1<x<2}$，$B={x | x>1}$，则 $A union B=$#choice-placeholder()。],
  choices: ([$(-1,1)$], [$(1,2)$], [$(-1,+infinity)$], [$(1,+infinity)$]),
  answers: ([C],),
  explanation: [两区间 $(-1,2)$、$(1,+infinity)$ 的并集为 $(-1,+infinity)$。],
)
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
  stem: [下列函数中，在区间 $(0,+infinity)$ 上单调递增的是#choice-placeholder()。],
  choices: ([$y=x^(1/2)$], [$y=2^(-x)$], [$y=log_(1/2) x$], [$y=1/x$]),
  answers: ([A],),
  explanation: [$y=x^(1/2)=sqrt(x)$ 在 $(0,+infinity)$ 上单调递增，其余三个函数均在此区间上单调递减。],
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
  stem: [已知双曲线 $x^2/a^2-y^2=1$（$a>0$）的离心率是 $sqrt(5)$，则 $a=$#choice-placeholder()。],
  choices: ([$sqrt(6)$], [$4$], [$2$], [$1/2$]),
  answers: ([D],),
  explanation: [由 $c^2=a^2+1$、$c/a=sqrt(5)$ 得 $a^2+1=5a^2$，故 $a^2=1/4$。∵ $a>0$，∴ $a=1/2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=cos x+b sin x$（$b$ 为常数），则“$b=0$”是“$f(x)$ 为偶函数”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([C],),
  explanation: [若 $b=0$，则 $f(x)=cos x$ 为偶函数。
    反之，若 $f(-x)=f(x)$ 对所有实数 $x$ 成立，则 $2b sin x=0$ 恒成立，取 $x=pi/2$ 得 $b=0$。
    故两者互为充要条件。],
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
  stem: [如图，$A,B$ 是半径为 $2$ 的圆周上的定点，$P$ 为圆周上的动点，$angle A P B$ 是锐角，大小为 $beta$。图中阴影区域的面积的最大值为#choice-placeholder()。
    #figure(circle-diagram())],
  choices: (
    [$4beta+4cos beta$],
    [$4beta+4sin beta$],
    [$2beta+2cos beta$],
    [$2beta+2sin beta$],
  ),
  answers: ([B],),
  explanation: [#step[表示固定弓形的面积][设圆心为 $O$，则劣弧 $A B$ 所对圆心角为 $2beta$，弦长 $A B=4sin beta$，$O$ 到弦 $A B$ 的距离为 $2cos beta$。
      阴影由劣弧对应的弓形与三角形 $P A B$ 组成，前者面积固定，为 $1/2 times 2^2 times 2beta-1/2 times 2^2 sin 2beta=4beta-4sin beta cos beta$。]
    #step[使三角形面积最大][点 $P$ 到弦 $A B$ 的距离最大为 $2+2cos beta$，当 $P$ 为优弧 $A B$ 的中点时取得。
      ∴ $S_(triangle P A B)$ 的最大值为 $1/2 times 4sin beta times (2+2cos beta)=4sin beta+4sin beta cos beta$。
      两部分相加，得阴影面积最大值为 $4beta+4sin beta$。]],
)
#section[填空题：本题共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)=(-4,3)$，$bold(b)=(6,m)$，且 $bold(a) perp bold(b)$，则 $m=$#fill-placeholder()。],
  answers: ([$8$],),
  explanation: [由 $bold(a) dot bold(b)=0$ 得 $-24+3m=0$，故 $m=8$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足 $cases(x<=2, y>=-1, 4x-3y+1>=0)$，则 $y-x$ 的最小值为#fill-placeholder()，最大值为#fill-placeholder()。],
  answers: ([$-3$], [$1$]),
  explanation: [由 $y>=-1$、$x<=2$ 得 $y-x>=-3$，在 $(2,-1)$ 处取等。
    又 $y<=(4x+1)/3$，故 $y-x<=(x+1)/3<=1$，在 $(2,3)$ 处取等。
    两个取等点均满足全部约束，故最小值为 $-3$、最大值为 $1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设抛物线 $y^2=4x$ 的焦点为 $F$，准线为 $l$，则以 $F$ 为圆心，且与 $l$ 相切的圆的方程为#fill-placeholder()。],
  answers: ([$(x-1)^2+y^2=4$],),
  explanation: [焦点为 $F=(1,0)$，准线为 $x=-1$。圆的半径等于焦点到准线的距离，为 $2$，故方程为 $(x-1)^2+y^2=4$。],
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
      explanation: [由余弦定理，$b^2=9+c^2+3c$。代入 $b=c+2$ 得 $c^2+4c+4=c^2+3c+9$，故 $c=5$、$b=7$。],
    ),
    subquestion(
      stem: [求 $sin(B+C)$ 的值。],
      answers: ([$3sqrt(3)/14$],),
      explanation: [∵ $B=120 degree$，∴ $sin B=sqrt(3)/2$。
        由正弦定理，$sin A=(a sin B)/b=3sqrt(3)/14$。又 $B+C=pi-A$，故 $sin(B+C)=sin A=3sqrt(3)/14$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设 ${a_n}$ 是等差数列，$a_1=-10$，且 $a_2+10,a_3+8,a_4+6$ 成等比数列。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=2n-12$（$n in NN^*$）。],),
      explanation: [设公差为 $d$，题给三项依次为 $d,2d-2,3d-4$。
        由等比数列性质得 $(2d-2)^2=d(3d-4)$，即 $(d-2)^2=0$，故 $d=2$。
        此时三项均为 $2$，确成等比数列。故 $a_n=-10+2(n-1)=2n-12$。],
    ),
    subquestion(
      stem: [记 ${a_n}$ 的前 $n$ 项和为 $S_n$，求 $S_n$ 的最小值。],
      answers: ([$-30$],),
      explanation: [$S_n=n(a_1+a_n)/2=n(n-11)=(n-11/2)^2-121/4$。
        ∵ $n in NN^*$，∴ 当 $n=5$ 或 $6$ 时取得最小值 $-30$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [改革开放以来，人们的支付方式发生了巨大转变。近年来，移动支付已成为主要支付方式之一。为了解某校学生上个月 $A,B$ 两种移动支付方式的使用情况，从全校所有的 $1000$ 名学生中随机抽取了 $100$ 人，发现样本中 $A,B$ 两种支付方式都不使用的有 $5$ 人，样本中仅使用 $A$ 和仅使用 $B$ 的学生的支付金额分布情况如下：
    #table(
      columns: 3,
      align: center,
      [支付方式／支付金额], [不大于 $2000$ 元], [大于 $2000$ 元],
      [仅使用 $A$], [27 人], [3 人],
      [仅使用 $B$], [24 人], [1 人],
    )],
  parts: (
    subquestion(
      stem: [估计该校学生中上个月 $A,B$ 两种支付方式都使用的人数。],
      answers: ([400 人。],),
      explanation: [样本中两种支付方式都使用的有 $100-30-25-5=40$ 人，故估计全校有 $1000 times 40/100=400$ 人。],
    ),
    subquestion(
      stem: [从样本仅使用 $B$ 的学生中随机抽取 $1$ 人，求该学生上个月支付金额大于 $2000$ 元的概率。],
      answers: ([$1/25$],),
      explanation: [仅使用 $B$ 的共有 $25$ 人，其中支付金额大于 $2000$ 元的有 $1$ 人，故所求概率为 $1/25$。],
    ),
    subquestion(
      stem: [已知上个月样本学生的支付方式在本月没有变化。现从样本仅使用 $B$ 的学生中随机抽查 $1$ 人，发现他本月的支付金额大于 $2000$ 元。结合第（2）问的结果，能否认为样本仅使用 $B$ 的学生中本月支付金额大于 $2000$ 元的人数有变化？说明理由。],
      answers: ([可以认为人数有所增加，理由见解析。],),
      explanation: [若本月仍只有 $1$ 人支付金额大于 $2000$ 元，则抽中该人的概率为 $1/25=0.04$，较小。
        依据小概率原理，可认为本月人数比上个月增加。这是基于抽样的统计判断，不是必然性结论。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在四棱锥 $P-A B C D$ 中，$P A perp$ 平面 $A B C D$，底面 $A B C D$ 为菱形，$E$ 为 $C D$ 的中点。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [求证：$B D perp$ 平面 $P A C$。],
      answers: ([证明见解析。],),
      explanation: [菱形的两条对角线互相垂直，故 $B D perp A C$。由 $P A perp$ 平面 $A B C D$，得 $B D perp P A$。
        又 $P A inter A C=A$，故 $B D perp$ 平面 $P A C$。],
    ),
    subquestion(
      stem: [若 $angle A B C=60 degree$，求证：平面 $P A B perp$ 平面 $P A E$。],
      answers: ([证明见解析。],),
      explanation: [∵ $A B C D$ 为菱形，$angle A D C=angle A B C=60 degree$，∴ $triangle A C D$ 为等边三角形。
        $E$ 是 $C D$ 中点，故 $A E perp C D$。又 $A B parallel C D$，故 $A E perp A B$。
        由 $P A perp$ 平面 $A B C D$ 得 $A E perp P A$，故 $A E perp$ 平面 $P A B$。
        ∵ $A E subset$ 平面 $P A E$，∴ 平面 $P A B perp$ 平面 $P A E$。],
    ),
    subquestion(
      stem: [棱 $P B$ 上是否存在点 $F$，使得 $C F parallel$ 平面 $P A E$？说明理由。],
      answers: ([存在，取 $F$ 为 $P B$ 的中点。],),
      explanation: [取 $P B$、$P A$ 的中点分别为 $F$、$G$。
        在 $triangle P A B$ 中，$F G parallel B A$ 且 $F G=(B A)/2$。又 $C E parallel B A$ 且 $C E=(B A)/2$，故四边形 $C E G F$ 为平行四边形，$C F parallel E G$。
        ∵ $E G subset$ 平面 $P A E$，且平面 $P A E$ 与底面的交线为 $A E$，$C$ 不在 $A E$ 上，故 $C F$ 不在平面 $P A E$ 内。
        ∴ $C F parallel$ 平面 $P A E$。
        #figure(pyramid-diagram(auxiliary: true))],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1$ 的右焦点为 $(1,0)$，且经过点 $A(0,1)$。],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 的方程。],
      answers: ([$x^2/2+y^2=1$。],),
      explanation: [由右焦点及点 $A$ 得 $c=1$、$b=1$，故 $a^2=b^2+c^2=2$，方程为 $x^2/2+y^2=1$。],
    ),
    subquestion(
      stem: [设 $O$ 为原点，直线 $l:y=k x+t$（$t != ±1$）与椭圆 $C$ 交于两个不同点 $P,Q$，直线 $A P$ 与 $x$ 轴交于点 $M$，直线 $A Q$ 与 $x$ 轴交于点 $N$。若 $|O M| dot |O N|=2$，求证：直线 $l$ 经过定点。],
      answers: ([直线 $l$ 恒过定点 $(0,0)$。],),
      explanation: [#step[利用韦达定理][设 $P=(x_1,y_1)$、$Q=(x_2,y_2)$。联立直线与椭圆，得
          $ (1+2k^2)x^2+4k t x+2(t^2-1)=0. $
          ∴ $x_1+x_2=-(4k t)/(1+2k^2)$、$x_1 x_2=(2(t^2-1))/(1+2k^2)$。
          又 $y_j=k x_j+t$，故 $y_1+y_2=(2t)/(1+2k^2)$、$y_1 y_2=(t^2-2k^2)/(1+2k^2)$，从而
          $ (1-y_1)(1-y_2)=(t-1)^2/(1+2k^2). $]
        #step[保留长度中的绝对值][由两点式得 $M=(x_1/(1-y_1),0)$、$N=(x_2/(1-y_2),0)$，其中 $t != ±1$ 保证所用分母非零。
          所以 $|O M| |O N|=|x_1 x_2/((1-y_1)(1-y_2))|=2|(t+1)/(t-1)|$。
          由题意得 $|t+1|=|t-1|$，平方并化简得 $t=0$。
          故 $l:y=k x$，恒过原点。]],
    ),
  ),
)
#question(
  "solution",
  score: 14,
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
