#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016全国2理(甘肃,青海,内蒙古,黑龙江,吉林,辽宁,海南,宁夏,新疆,西藏,陕西,重庆).pdf",
  regions: (
    "甘肃",
    "青海",
    "内蒙古",
    "黑龙江",
    "吉林",
    "辽宁",
    "海南",
    "宁夏",
    "新疆",
    "西藏",
    "陕西",
    "重庆",
  ),
)

#let streets() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for x in (0, 1.4, 3.4, 4.25, 5) { line((x, 0), (x, 2.1)) }
  for y in (0, 0.7, 1.4, 2.1) { line((0, y), (5, y)) }
  for (p, label, anchor) in (
    ((0, 0), $E$, "east"),
    ((3.4, 1.4), $F$, "south-west"),
    ((5, 2.1), $G$, "west"),
  ) {
    circle(p, radius: 1pt, fill: black)
    content(p, label, anchor: anchor, padding: 3pt)
  }
})
#let views() = cetz.canvas(length: 6mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let h = 2 * calc.sqrt(3)
  for x in (0, 6) {
    line((x, 0), (x + 4, 0), (x + 4, 4), (x + 2, 4 + h), (x, 4), close: true)
    line((x, 4), (x + 4, 4))
    for a in (x, x + 4) { line((a, -0.1), (a, -0.7)) }
    line((x, -0.5), (x + 1.5, -0.5), mark: (start: "<"))
    line((x + 2.5, -0.5), (x + 4, -0.5), mark: (end: ">"))
    content((x + 2, -0.5), $4$)
  }
  for y in (0, 4, 4 + h) { line((-0.7, y), (-0.1, y)) }
  for (lo, hi, label) in ((0, 4, $4$), (4, 4 + h, $2sqrt(3)$)) {
    let mid = (lo + hi) / 2
    line((-0.5, lo), (-0.5, mid - 0.5), mark: (start: "<"))
    line((-0.5, mid + 0.5), (-0.5, hi), mark: (end: ">"))
    content((-0.5, mid), label)
  }
  circle((2, -4), radius: 2)
  circle((2, -4), radius: 1pt, fill: black)
})
#let algorithm() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((-0.7, -0.3), (0.7, 0.3), radius: 0.15)
    content((0, 0), [开始])
    for (y, label) in (
      (-1.4, [输入 $x,n$]),
      (-4.2, [输入 $a$]),
      (-8.7, [输出 $s$]),
    ) {
      line(
        (-1.2, y - 0.35),
        (1, y - 0.35),
        (1.2, y + 0.35),
        (-1, y + 0.35),
        close: true,
      )
      content((0, y), label)
    }
    rect((-1.4, -3.1), (1.4, -2.5))
    content((0, -2.8), $k=0,s=0$)
    rect((-1.4, -6.4), (1.4, -5.2))
    content((0, -5.6), $s=s dot x+a$)
    content((0, -6.05), $k=k+1$)
    line((0, -6.9), (1.5, -7.4), (0, -7.9), (-1.5, -7.4), close: true)
    content((0, -7.4), $k>n$)
    rect((-0.7, -10.2), (0.7, -9.6), radius: 0.15)
    content((0, -9.9), [结束])
    for (a, b) in (
      (-0.3, -1.05),
      (-1.75, -2.5),
      (-3.1, -3.85),
      (-4.55, -5.2),
      (-6.4, -6.9),
      (-7.9, -8.35),
      (-9.05, -9.6),
    ) { line((0, a), (0, b), mark: (end: ">")) }
    line((1.5, -7.4), (2.7, -7.4), (2.7, -3.5), (0, -3.5), mark: (end: ">"))
    content((1.65, -7.2), [否], anchor: "south")
    content((0.3, -8.12), [是], anchor: "west")
  })
}
#let folded-rhombus() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((0.5, -0.25), (0.8, 0.2), (0, 1.2), {
    let A = (-3, 0, 0)
    let B = (0, -4, 0)
    let C = (3, 0, 0)
    let D = (0, 4, 0)
    let O = (0, 0, 0)
    let E = (-2.25, 1, 0)
    let F = (2.25, 1, 0)
    let H = (0, 1, 0)
    let P = (0, 1, 3)
    line(A, B, C, F, P, A)
    line(P, B)
    line(P, C)
    line(A, C)
    line(B, O)
    line(O, P)
    for (a, b) in ((A, D), (F, D), (O, D), (E, F), (P, E), (P, H)) {
      line(a, b, stroke: (dash: figure-style.dash))
    }
    for (p, label, anchor) in (
      (A, $A$, "south-east"),
      (B, $B$, "east"),
      (C, $C$, "north"),
      (D, $D$, "west"),
      (O, $O$, "north-east"),
      (E, $E$, "south-east"),
      (F, $F$, "north-west"),
      (H, $H$, "north-west"),
      (P, $D'$, "south"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})
#let square-figure() = cetz.canvas(length: 45mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (0, 0)
  let B = (1, 0)
  let C = (1, 1)
  let D = (0, 1)
  let E = (0, 0.5)
  let G = (0.5, 1)
  let F = (0.2, 0.6)
  line(A, B, C, D, close: true)
  line(E, C)
  line(D, F)
  line(G, F, B)
  for (p, label, anchor) in (
    (A, $A$, "north-east"),
    (B, $B$, "north-west"),
    (C, $C$, "south-west"),
    (D, $D$, "south-east"),
    (E, $E$, "east"),
    (G, $G$, "south"),
    (F, $F$, "north"),
  ) { content(p, label, anchor: anchor, padding: 3pt) }
})

#section[选择题：共 12 题，每题 5 分，共 60 分。每题只有一个选项符合题意。]
#question(
  "single-choice",
  score: 5,
  stem: [已知 $z=(m+3)+(m-1)upright(i)$ 在复平面内对应的点在第四象限，则实数 $m$ 的取值范围是#choice-placeholder()。],
  choices: ([$(-3,1)$], [$(-1,3)$], [$(1,+infinity)$], [$(-infinity,-3)$]),
  answers: ([A],),
  explanation: [第四象限要求实部为正、虚部为负，即 $m+3>0$、$m-1<0$，所以 $-3<m<1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={1,2,3}$，$B={x|(x+1)(x-2)<0,x in ZZ}$，则 $A union B=$#choice-placeholder()。],
  choices: ([${1}$], [${1,2}$], [${0,1,2,3}$], [${-1,0,1,2,3}$]),
  answers: ([C],),
  explanation: [$B={x|-1<x<2,x in ZZ}={0,1}$，所以 $A union B={0,1,2,3}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知向量 $arrow(a)=(1,m)$，$arrow(b)=(3,-2)$，且 $(arrow(a)+arrow(b)) perp arrow(b)$，则 $m=$#choice-placeholder()。],
  choices: ([$-8$], [$-6$], [$6$], [$8$]),
  answers: ([D],),
  explanation: [$arrow(a)+arrow(b)=(4,m-2)$。由垂直条件，$12-2(m-2)=0$，解得 $m=8$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [圆 $x^2+y^2-2x-8y+13=0$ 的圆心到直线 $a x+y-1=0$ 的距离为 $1$，则 $a=$#choice-placeholder()。],
  choices: ([$-4/3$], [$-3/4$], [$sqrt(3)$], [$2$]),
  answers: ([A],),
  explanation: [圆的标准方程为 $(x-1)^2+(y-4)^2=4$，圆心为 $(1,4)$。由距离公式，$abs(a+3)/sqrt(a^2+1)=1$，所以 $(a+3)^2=a^2+1$，解得 $a=-4/3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，小明从街道的 $E$ 处出发，先到 $F$ 处与小红会合，再一起到位于 $G$ 处的老年公寓参加志愿者活动，则小明到老年公寓可以选择的最短路径条数为#choice-placeholder()。
    #figure(streets())],
  choices: ([$24$], [$18$], [$12$], [$9$]),
  answers: ([B],),
  explanation: [从 $E$ 到 $F$ 的最短路径必须向右走两段、向上走两段，共 $C_4^2=6$ 种；从 $F$ 到 $G$ 必须向右走两段、向上走一段，共 $C_3^1=3$ 种。由分步乘法计数原理，共有 $6 times 3=18$ 种。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图是由圆柱与圆锥组合而成的几何体的三视图，则该几何体的表面积为#choice-placeholder()。
    #figure(views())],
  choices: ([$20pi$], [$24pi$], [$28pi$], [$32pi$]),
  answers: ([C],),
  explanation: [圆柱与圆锥的底面半径均为 $2$，圆柱高为 $4$，圆锥高为 $2sqrt(3)$，故圆锥母线长为 $sqrt(2^2+(2sqrt(3))^2)=4$。外表面积包括圆柱侧面、圆锥侧面和圆柱下底面，故
    $ S=2pi times 2 times 4+pi times 2 times 4+pi times 2^2=28pi. $],
)
#question(
  "single-choice",
  score: 5,
  stem: [若将函数 $y=2sin 2x$ 的图象向左平移 $pi/12$ 个单位长度，则平移后图象的对称轴为#choice-placeholder()。],
  choices: (
    [$x=(k pi)/2-pi/6$（$k in ZZ$）],
    [$x=(k pi)/2+pi/6$（$k in ZZ$）],
    [$x=(k pi)/2-pi/12$（$k in ZZ$）],
    [$x=(k pi)/2+pi/12$（$k in ZZ$）],
  ),
  answers: ([B],),
  explanation: [平移后的函数为 $y=2sin(2x+pi/6)$。令 $2x+pi/6=pi/2+k pi$，得对称轴 $x=(k pi)/2+pi/6$（$k in ZZ$）。],
)
#question(
  "single-choice",
  score: 5,
  stem: [中国古代有计算多项式值的秦九韶算法，如图是实现该算法的程序框图。执行该程序框图，若输入的 $x=2,n=2$，依次输入的 $a$ 为 $2,2,5$，则输出的 $s=$#choice-placeholder()。
    #figure(algorithm())],
  choices: ([$7$], [$12$], [$17$], [$34$]),
  answers: ([C],),
  explanation: [初始 $s=0,k=0$。三次循环后，$(s,k)$ 依次为 $(2,1)$、$(6,2)$、$(17,3)$。第三次满足 $k>n$，输出 $s=17$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $cos(pi/4-alpha)=3/5$，则 $sin 2alpha=$#choice-placeholder()。],
  choices: ([$7/25$], [$1/5$], [$-1/5$], [$-7/25$]),
  answers: ([D],),
  explanation: [$sin 2alpha=cos(2(pi/4-alpha))=2cos^2(pi/4-alpha)-1=2 times (3/5)^2-1=-7/25$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [从区间 $[0,1]$ 随机抽取 $2n$ 个数 $x_1,x_2,dots.c,x_n,y_1,y_2,dots.c,y_n$，构成 $n$ 个数对 $(x_1,y_1),(x_2,y_2),dots.c,(x_n,y_n)$，其中两数的平方和小于 $1$ 的数对共有 $m$ 个，则用随机模拟的方法得到的圆周率的近似值为#choice-placeholder()。],
  choices: ([$(4n)/m$], [$(2n)/m$], [$(4m)/n$], [$(2m)/n$]),
  answers: ([C],),
  explanation: [点 $(x_i,y_i)$ 均匀落在单位正方形内，其中 $x_i^2+y_i^2<1$ 对应第一象限内的四分之一单位圆，面积为 $pi/4$。因此 $m/n approx pi/4$，即 $pi approx (4m)/n$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $F_1,F_2$ 是双曲线 $E:x^2/a^2-y^2/b^2=1$ 的左、右焦点，点 $M$ 在 $E$ 上，$M F_1$ 与 $x$ 轴垂直，$sin angle M F_2 F_1=1/3$，则 $E$ 的离心率为#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$3/2$], [$sqrt(3)$], [$2$]),
  answers: ([A],),
  explanation: [设半焦距为 $c$，由 $M$ 的横坐标为 $-c$，代入双曲线方程可得 $abs(M F_1)=b^2/a$。直角三角形中 $abs(M F_1)/abs(M F_2)=1/3$，故 $abs(M F_2)=3b^2/a$。
    $M$ 在左支上，由双曲线定义，$abs(M F_2)-abs(M F_1)=2a$，所以 $2b^2/a=2a$，得 $b=a$。因此 $e=c/a=sqrt(a^2+b^2)/a=sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)$（$x in RR$）满足 $f(-x)=2-f(x)$，若函数 $y=(x+1)/x$ 与 $y=f(x)$ 图象的交点为 $(x_1,y_1),(x_2,y_2),dots.c,(x_m,y_m)$，则 $sum_(i=1)^m (x_i+y_i)=$#choice-placeholder()。],
  choices: ([$0$], [$m$], [$2m$], [$4m$]),
  answers: ([B],),
  explanation: [两个图象均关于 $(0,1)$ 中心对称，故交点也成对出现：若 $(x,y)$ 是交点，则 $(-x,2-y)$ 也是交点。由于交点横坐标不为零，每对由两个不同点组成，每对的横、纵坐标总和为 $2$。因此总和为 $m/2 times 2=m$。],
)

#section[填空题：共 4 题，每题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，若 $cos A=4/5$，$cos C=5/13$，$a=1$，则 $b=$#fill-placeholder()。],
  answers: ([$21/13$],),
  explanation: [因为 $A,C$ 为三角形内角，$sin A=3/5$、$sin C=12/13$。故 $sin B=sin(A+C)=3/5 times 5/13+4/5 times 12/13=63/65$。由正弦定理，$b=(a sin B)/(sin A)=21/13$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [$alpha,beta$ 是两个平面，$m,n$ 是两条直线，有下列四个命题：
    #enum(
      numbering: "①",
      [如果 $m perp n,m perp alpha,n parallel beta$，那么 $alpha perp beta$；],
      [如果 $m perp alpha,n parallel alpha$，那么 $m perp n$；],
      [如果 $alpha parallel beta,m subset alpha$，那么 $m parallel beta$；],
      [如果 $m parallel n,alpha parallel beta$，那么 $m$ 与 $alpha$ 所成的角和 $n$ 与 $beta$ 所成的角相等。],
    )
    则上述四个命题中真命题的是#fill-placeholder()。],
  answers: ([②③④],),
  explanation: [① 错误。例如取两个不同的水平面为 $alpha,beta$，$m$ 为竖直直线，$n$ 为第三个水平面内的直线，即满足三个条件，但 $alpha$ 与 $beta$ 平行。
    ② 正确。在 $alpha$ 内取与 $n$ 平行的直线，利用线面垂直的性质即可得到 $m perp n$。
    ③ 正确。平行平面没有公共点，故 $m$ 与 $beta$ 没有公共点，即 $m parallel beta$。
    ④ 正确。平行移动直线或平面不改变线面角。],
)
#question(
  "fill-in",
  score: 5,
  stem: [有三张卡片，分别写有 $1$ 和 $2$，$1$ 和 $3$，$2$ 和 $3$。甲、乙、丙三人各取走一张卡片，甲看了乙的卡片后说：“我与乙的卡片上相同的数字不是 $2$”，乙看了丙的卡片后说：“我与丙的卡片上相同的数字不是 $1$”，丙说：“我的卡片上的数字之和不是 $5$”，则甲的卡片上的数字是#fill-placeholder()。],
  answers: ([$1$ 和 $3$],),
  explanation: [丙的卡片只能是 $(1,2)$ 或 $(1,3)$。若丙为 $(1,3)$，由乙的话可知乙为 $(2,3)$，于是甲为 $(1,2)$，甲、乙的相同数字为 $2$，矛盾。
    所以丙为 $(1,2)$，乙为 $(2,3)$，甲为 $(1,3)$，满足所有条件。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若直线 $y=k x+b$ 是曲线 $y=ln x+2$ 的切线，也是曲线 $y=ln(x+1)$ 的切线，则 $b=$#fill-placeholder()。],
  answers: ([$1-ln 2$],),
  explanation: [设两个切点的横坐标分别为 $u>0$、$v> -1$。由斜率相同，$1/u=1/(v+1)$，故 $v=u-1$。两条切线的纵截距分别为 $ln u+1$、$ln u-1+1/u$。令它们相等，得 $u=1/2$，所以 $b=1-ln 2$。],
)

#section[解答题：第 17～21 题为必考题，每题 12 分；第 22～24 题为选考题，每题 10 分，任选一题作答。]
#question(
  "solution",
  score: 12,
  stem: [$S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和，且 $a_1=1,S_7=28$。记 $b_n=[lg a_n]$，其中 $[x]$ 表示不超过 $x$ 的最大整数，如 $[0.9]=0,[lg 99]=1$。],
  parts: (
    subquestion(
      stem: [求 $b_1,b_11,b_101$。],
      answers: ([$b_1=0,b_11=1,b_101=2$],),
      explanation: [设公差为 $d$，由 $S_7=7+21d=28$ 得 $d=1$，所以 $a_n=n$。因此 $b_1=[lg 1]=0$，$b_11=[lg 11]=1$，$b_101=[lg 101]=2$。],
    ),
    subquestion(
      stem: [求数列 ${b_n}$ 的前 $1000$ 项和。],
      answers: ([$1893$],),
      explanation: [当 $1<=n<=9$ 时 $b_n=0$；当 $10<=n<=99$ 时 $b_n=1$；当 $100<=n<=999$ 时 $b_n=2$；$b_1000=3$。故所求和为 $9 times 0+90 times 1+900 times 2+3=1893$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某险种的基本保费为 $a$（单位：元），继续购买该险种的投保人称为续保人，续保人本年度的保费与其上年度出险次数的关联如下：
    #table(
      columns: 7,
      align: center,
      [上年度出险次数], [$0$], [$1$], [$2$], [$3$], [$4$], [$>=5$],
      [保费], [$0.85a$], [$a$], [$1.25a$], [$1.5a$], [$1.75a$], [$2a$],
    )
    设该险种一续保人一年内出险次数与相应概率如下：
    #table(
      columns: 7,
      align: center,
      [一年内出险次数], [$0$], [$1$], [$2$], [$3$], [$4$], [$>=5$],
      [概率], [$0.30$], [$0.15$], [$0.20$], [$0.20$], [$0.10$], [$0.05$],
    )],
  parts: (
    subquestion(
      stem: [求一续保人本年度的保费高于基本保费的概率。],
      answers: ([$0.55$],),
      explanation: [记该事件为 $A$，它对应上年度出险次数至少为 $2$，故 $P(A)=0.20+0.20+0.10+0.05=0.55$。],
    ),
    subquestion(
      stem: [若一续保人本年度的保费高于基本保费，求其保费比基本保费高出 $60%$ 的概率。],
      answers: ([$3/11$],),
      explanation: [记保费超过 $1.6a$ 的事件为 $B$，它对应上年度出险次数至少为 $4$，所以 $P(B)=0.10+0.05=0.15$。又 $B subset A$，故条件概率为 $P(B|A)=P(B)/P(A)=0.15/0.55=3/11$。],
    ),
    subquestion(
      stem: [求续保人本年度的平均保费与基本保费的比值。],
      answers: ([$1.23$],),
      explanation: [设本年度保费为 $X$，由各档保费及其概率，所求比值为
        $
          E(X)/a=0.85 times 0.30+1 times 0.15+1.25 times 0.20+1.5 times 0.20+1.75 times 0.10+2 times 0.05=1.23.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，菱形 $A B C D$ 的对角线 $A C$ 与 $B D$ 交于点 $O$，$A B=5,A C=6$，点 $E,F$ 分别在 $A D,C D$ 上，$A E=C F=5/4$，$E F$ 交 $B D$ 于点 $H$。将三角形 $D E F$ 沿 $E F$ 折到三角形 $D' E F$ 的位置，$O D'=sqrt(10)$。
    #figure(folded-rhombus())],
  parts: (
    subquestion(
      stem: [证明：$D' H perp$ 平面 $A B C D$。],
      answers: ([证明见解析。],),
      explanation: [菱形中 $A C perp B D$，$D O=sqrt(5^2-3^2)=4$。因为 $(A E)/(A D)=(C F)/(C D)=1/4$，所以 $E F parallel A C$，且 $O H=1$、$D H=3$。
        折叠前 $D H perp E F$，折叠后仍有 $D' H perp E F$，$D' H=3$。由 $D' H^2+O H^2=9+1=O D'^2$，得 $D' H perp O H$。又 $O H inter E F=H$，所以 $D' H perp$ 平面 $A B C D$。],
    ),
    subquestion(
      stem: [求二面角 $B-D' A-C$ 的正弦值。],
      answers: ([$(2sqrt(95))/25$],),
      explanation: [#step[建立坐标并求法向量][
          以 $O$ 为原点，$O C,O D$ 分别为 $x,y$ 轴正向，$z$ 轴正向取 $H D'$ 的方向。则
          $ A=(-3,0,0),quad B=(0,-4,0),quad C=(3,0,0),quad D'=(0,1,3). $
          于是 $arrow(A B)=(3,-4,0)$、$arrow(A C)=(6,0,0)$、$arrow(A D')=(3,1,3)$。
          可分别取平面 $A B D'$、$A C D'$ 的法向量为 $arrow(m)=(4,3,-5)$、$arrow(n)=(0,-3,1)$，它们各自与所在平面的两条相交方向向量垂直。
        ]
        #step[求二面角的正弦][
          法向量夹角的余弦为 $(arrow(m) dot arrow(n))/(abs(arrow(m))abs(arrow(n)))=-14/sqrt(500)=-(7sqrt(5))/25$。二面角与该夹角相等或互补，正弦相同，故所求值为
          $ sqrt(1-((7sqrt(5))/25)^2)=(2sqrt(95))/25. $
        ]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知椭圆 $E:x^2/t+y^2/3=1$ 的焦点在 $x$ 轴上，$A$ 是 $E$ 的左顶点，斜率为 $k$（$k>0$）的直线交 $E$ 于 $A,M$ 两点，点 $N$ 在 $E$ 上，$M A perp N A$。],
  parts: (
    subquestion(
      stem: [当 $t=4,abs(A M)=abs(A N)$ 时，求三角形 $A M N$ 的面积。],
      answers: ([$144/49$],),
      explanation: [$A=(-2,0)$。设 $A M=A N=L$，$A M$ 的倾斜角为 $theta in (0,pi/2)$。则 $M=(-2+L cos theta,L sin theta)$，$N=(-2+L sin theta,-L cos theta)$。
        分别代入椭圆方程，得
        $
          L=(12cos theta)/(3cos^2 theta+4sin^2 theta)=(12sin theta)/(3sin^2 theta+4cos^2 theta).
        $
        整理得 $(cos theta-sin theta)(4+sin theta cos theta)=0$，故 $theta=pi/4$、$k=1$。
        将 $y=x+2$ 代入椭圆，得 $M=(-2/7,12/7)$，由对称性 $N=(-2/7,-12/7)$。
        故面积为 $1/2 times (24/7) times (12/7)=144/49$。],
    ),
    subquestion(
      stem: [当 $2abs(A M)=abs(A N)$ 时，求 $k$ 的取值范围。],
      answers: ([$(root(3, 2),2)$],),
      explanation: [#step[用斜率表示两条弦长][
          由焦点条件，$t>3$，且 $A=(-sqrt(t),0)$。令 $u=x+sqrt(t)$，将 $y=k u$ 代入椭圆，可得
          $ (3+t k^2)u^2-6sqrt(t)u=0. $
          非零根给出 $abs(A M)=(6sqrt(t)sqrt(1+k^2))/(3+t k^2)$。
          同理由直线 $A N$ 的斜率为 $-1/k$，得 $abs(A N)=(6k sqrt(t)sqrt(1+k^2))/(3k^2+t)$。
        ]
        #step[利用 $t>3$ 求范围][
          由 $2abs(A M)=abs(A N)$，得 $2/(3+t k^2)=k/(3k^2+t)$，即
          $ (k^3-2)t=3k(2k-1). $
          $k=root(3, 2)$ 不满足此式。其余情形有 $t=(3k(2k-1))/(k^3-2)$，所以
          $ t-3=(-3(k-2)(k^2+1))/(k^3-2)>0. $
          结合 $k>0$，得 $root(3, 2)<k<2$。反之，该区间内每个 $k$ 都对应一个满足条件的 $t>3$，故所求范围为 $(root(3, 2),2)$。
        ]],
    ),
  ),
)
#question("solution", score: 12, parts: (
  subquestion(
    stem: [讨论函数 $f(x)=(x-2)/(x+2) dot upright(e)^x$ 的单调性，并证明当 $x>0$ 时，$(x-2)upright(e)^x+x+2>0$。],
    answers: (
      [$f$ 在 $(-infinity,-2)$、$(-2,+infinity)$ 上分别单调递增；证明见解析。],
    ),
    explanation: [定义域为 $RR without {-2}$，求导得 $f'(x)=(x^2 upright(e)^x)/(x+2)^2>=0$，且仅在 $x=0$ 为零。因此 $f$ 在 $(-infinity,-2)$、$(-2,+infinity)$ 上分别严格递增。
      当 $x>0$ 时，$f(x)>f(0)=-1$。乘以正数 $x+2$，得 $(x-2)upright(e)^x+x+2>0$。],
  ),
  subquestion(
    stem: [证明：当 $a in [0,1)$ 时，函数 $g(x)=(upright(e)^x-a x-a)/x^2$（$x>0$）有最小值。设 $g(x)$ 的最小值为 $h(a)$，求函数 $h(a)$ 的值域。],
    answers: ([有最小值，$h(a)$ 的值域为 $(1/2,upright(e)^2/4]$。],),
    explanation: [#step[证明存在唯一最小值点][
        求导得
        $ g'(x)=((x-2)upright(e)^x+a(x+2))/x^3=(x+2)/x^3 (f(x)+a). $
        由第 (1) 问，$f(x)+a$ 在 $(0,+infinity)$ 上严格递增，且 $f(0)+a=a-1<0$、$f(2)+a=a>=0$。故存在唯一 $x_0 in (0,2]$ 使 $f(x_0)+a=0$。
        当 $0<x<x_0$ 时 $g'(x)<0$；当 $x>x_0$ 时 $g'(x)>0$。因此 $g$ 在 $x_0$ 处取得唯一最小值。
      ]
      #step[消去参数并确定值域][
        利用 $a=-f(x_0)$，化简得
        $
          h(a)=g(x_0)=(upright(e)^(x_0)-a(x_0+1))/x_0^2=upright(e)^(x_0)/(x_0+2).
        $
        当 $x_0$ 遍历 $(0,2]$ 时，$a=-f(x_0)$ 恰好遍历 $[0,1)$。
        令 $q(x)=upright(e)^x/(x+2)$，则 $q'(x)=((x+1)upright(e)^x)/(x+2)^2>0$（$x>0$）。故 $h$ 的值域为 $(q(0),q(2)]=(1/2,upright(e)^2/4]$。
      ]],
  ),
))
#question(
  "solution",
  score: 10,
  stem: [选修 4-1：几何证明选讲。如图，在正方形 $A B C D$ 中，$E,G$ 分别在边 $D A,D C$ 上（不与端点重合），且 $D E=D G$，过 $D$ 点作 $D F perp C E$，垂足为 $F$。
    #figure(square-figure())],
  parts: (
    subquestion(
      stem: [证明：$B,C,G,F$ 四点共圆。],
      answers: ([证明见解析。],),
      explanation: [由 $D F perp C E$、$D E perp D C$，有 $triangle D E F ∽ triangle C D F$，所以 $(D F)/(C F)=(D E)/(C D)=(D G)/(C B)$，且 $angle G D F=angle D E F=angle F C B$。
        由两边成比例且夹角相等，得 $triangle D G F ∽ triangle C B F$，从而 $angle D G F=angle C B F$。
        因 $D,G,C$ 共线，$angle C G F+angle C B F=180 degree$，故 $B,C,G,F$ 四点共圆。],
    ),
    subquestion(
      stem: [若 $A B=1$，$E$ 为 $D A$ 的中点，求四边形 $B C G F$ 的面积。],
      answers: ([$1/2$],),
      explanation: [此时 $G$ 为 $D C$ 的中点，$G C=1/2$。在直角三角形 $D F C$ 中，斜边中点 $G$ 满足 $G F=G C$。
        又由四点共圆及 $angle G C B=90 degree$，得 $angle G F B=90 degree$。直角三角形 $B C G$ 与 $B F G$ 斜边 $B G$ 相同、一条直角边相等，故两三角形全等。
        因而四边形面积为 $2S_(triangle B C G)=2 times 1/2 times 1 times 1/2=1/2$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4-4：坐标系与参数方程。在直角坐标系 $x O y$ 中，圆 $C$ 的方程为 $(x+6)^2+y^2=25$。],
  parts: (
    subquestion(
      stem: [以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，求圆 $C$ 的极坐标方程。],
      answers: ([$rho^2+12rho cos theta+11=0$],),
      explanation: [展开圆方程，得 $x^2+y^2+12x+11=0$。代入 $x=rho cos theta$、$y=rho sin theta$，得 $rho^2+12rho cos theta+11=0$。],
    ),
    subquestion(
      stem: [直线 $l$ 的参数方程是 $cases(x=t cos alpha, y=t sin alpha)$（$t$ 为参数），直线 $l$ 与圆 $C$ 交于 $A,B$ 两点，$abs(A B)=sqrt(10)$，求 $l$ 的斜率。],
      answers: ([$plus.minus sqrt(15)/3$],),
      explanation: [将参数方程代入圆方程，得 $t^2+12t cos alpha+11=0$。由于方向向量 $(cos alpha,sin alpha)$ 为单位向量，弦长等于两根之差的绝对值，故
        $ abs(A B)^2=(t_1-t_2)^2=144cos^2 alpha-44=10. $
        得 $cos^2 alpha=3/8$，所以 $tan^2 alpha=(1-cos^2 alpha)/cos^2 alpha=5/3$。故斜率为 $plus.minus sqrt(15)/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4-5：不等式选讲。已知函数 $f(x)=abs(x-1/2)+abs(x+1/2)$，$M$ 为不等式 $f(x)<2$ 的解集。],
  parts: (
    subquestion(stem: [求 $M$。], answers: ([$M=(-1,1)$],), explanation: [分段得
      $
        f(x)=cases(-2x & quad x<= -1/2, 1 & quad -1/2<x<1/2, 2x & quad x>=1/2).
      $
      分别解 $f(x)<2$，得到 $(-1,-1/2]$、$(-1/2,1/2)$、$[1/2,1)$，取并集得 $M=(-1,1)$。]),
    subquestion(
      stem: [证明：当 $a,b in M$ 时，$abs(a+b)<abs(1+a b)$。],
      answers: ([证明见解析。],),
      explanation: [由 $a,b in (-1,1)$，有 $1-a^2>0$、$1-b^2>0$，于是
        $ (1+a b)^2-(a+b)^2=(1-a^2)(1-b^2)>0. $
        对两边的平方根比较，得到 $abs(a+b)<abs(1+a b)$。],
    ),
  ),
)
