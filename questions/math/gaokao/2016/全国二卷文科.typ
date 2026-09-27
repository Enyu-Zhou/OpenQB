#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016全国2文(甘肃,青海,内蒙古,黑龙江,吉林,辽宁,海南,宁夏,新疆,西藏,陕西,重庆).pdf",
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
  oblique-project((0.5, -0.25), (1, 0.1875), (1 / (2 * calc.sqrt(2)), 1.4), {
    let A = (-3, 0, 0)
    let B = (0, -4, 0)
    let C = (3, 0, 0)
    let D = (0, 4, 0)
    let O = (0, 0, 0)
    let E = (-2.25, 1, 0)
    let F = (2.25, 1, 0)
    let H = (0, 1, 0)
    let P = (0, 0, 2 * calc.sqrt(2))
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
      (H, $H$, "north"),
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


#let sine-graph() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    shared-zero: $O$,
    x: (tick: (label: (offset: 0.25cm))),
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
      length: 0,
    ),
  ))
  plot.plot(
    size: (5, 5.4),
    axis-style: "school-book",
    x-min: -1.2,
    x-max: 2.2,
    y-min: -2.5,
    y-max: 2.5,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((-calc.pi / 6, move(dy: -26pt, $-pi/6$)), (calc.pi / 3, $pi/3$)),
    y-ticks: ((-2, move(dx: 21pt, $-2$)), 2),
    {
      plot.annotate(resize: false, {
        for (x, y) in ((-calc.pi / 6, -2), (calc.pi / 3, 2)) {
          line((x, 0), (x, y), (0, y), stroke: (dash: figure-style.dash))
        }
      })
      plot.add(
        x => 2 * calc.sin(2 * x - calc.pi / 6),
        domain: (-0.95, 1.5),
        samples: 161,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
    },
  )
})

#section[选择题：共 12 题，每题 5 分，共 60 分。每题只有一个选项符合题意。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={1,2,3}$，$B={x|x^2<9}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${-2,-1,0,1,2,3}$], [${-2,-1,0,1,2}$], [${1,2,3}$], [${1,2}$]),
  answers: ([D],),
  explanation: [$B=(-3,3)$，集合 $A$ 中只有 $1,2$ 属于 $B$，故 $A inter B={1,2}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设复数 $z$ 满足 $z+upright(i)=3-upright(i)$，则 $overline(z)=$#choice-placeholder()。],
  choices: (
    [$-1+2upright(i)$],
    [$1-2upright(i)$],
    [$3+2upright(i)$],
    [$3-2upright(i)$],
  ),
  answers: ([C],),
  explanation: [由条件得 $z=3-2upright(i)$，所以其共轭复数 $overline(z)=3+2upright(i)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $y=A sin(omega x+phi)$ 的部分图象如图所示，则#choice-placeholder()。
    #figure(sine-graph())],
  choices: (
    [$y=2sin(2x-pi/6)$],
    [$y=2sin(2x-pi/3)$],
    [$y=2sin(x+pi/6)$],
    [$y=2sin(x+pi/3)$],
  ),
  answers: ([A],),
  explanation: [图中最大值为 $2$、最小值为 $-2$，相邻最低点、最高点的横坐标之差为 $pi/3-(-pi/6)=pi/2$，所以周期为 $pi$，排除 C、D。
    将 $x=pi/3$ 代入 A、B，分别得 $2$、$sqrt(3)$，故选 A。],
)
#question(
  "single-choice",
  score: 5,
  stem: [体积为 $8$ 的正方体的顶点都在同一球面上，则该球面的表面积为#choice-placeholder()。],
  choices: ([$12pi$], [$(32pi)/3$], [$8pi$], [$4pi$]),
  answers: ([A],),
  explanation: [正方体棱长为 $2$，体对角线长为 $2sqrt(3)$。外接球的直径等于体对角线，故半径为 $sqrt(3)$，表面积为 $4pi times (sqrt(3))^2=12pi$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $F$ 为抛物线 $C:y^2=4x$ 的焦点，曲线 $y=k/x$（$k>0$）与 $C$ 交于点 $P$，$P F perp x$ 轴，则 $k=$#choice-placeholder()。],
  choices: ([$1/2$], [$1$], [$3/2$], [$2$]),
  answers: ([D],),
  explanation: [$F=(1,0)$，由 $P F perp x$ 轴知 $P$ 的横坐标为 $1$。代入抛物线得纵坐标为 $plus.minus 2$，又 $k>0$，故 $P=(1,2)$，从而 $k=2$。],
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
  stem: [某路口人行横道的信号灯为红灯和绿灯交替出现，红灯持续时间为 $40$ 秒。若一名行人来到该路口遇到红灯，则至少需要等待 $15$ 秒才出现绿灯的概率为#choice-placeholder()。],
  choices: ([$7/10$], [$5/8$], [$3/8$], [$3/10$]),
  answers: ([B],),
  explanation: [按等可能到达模型，遇到红灯时的剩余等待时间在 $[0,40]$ 上均匀分布。至少等待 $15$ 秒对应区间 $[15,40]$，故概率为 $(40-15)/40=5/8$。],
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
  stem: [下列函数中，其定义域和值域分别与函数 $y=10^(lg x)$ 的定义域和值域相同的是#choice-placeholder()。],
  choices: ([$y=x$], [$y=lg x$], [$y=2^x$], [$y=1/sqrt(x)$]),
  answers: ([D],),
  explanation: [函数 $y=10^(lg x)=x$ 的定义域受 $lg x$ 限制，为 $(0,+infinity)$，值域也为 $(0,+infinity)$。
    A 的定义域、值域均为 $RR$；B 的值域为 $RR$；C 的定义域为 $RR$；只有 D 的定义域和值域均为 $(0,+infinity)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $f(x)=cos 2x+6cos(pi/2-x)$ 的最大值为#choice-placeholder()。],
  choices: ([$4$], [$5$], [$6$], [$7$]),
  answers: ([B],),
  explanation: [令 $t=sin x in [-1,1]$，则 $f(x)=-2t^2+6t+1$。此二次函数在 $[-1,1]$ 上单调递增，所以当 $t=1$ 时取得最大值 $-2+6+1=5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)$（$x in RR$）满足 $f(x)=f(2-x)$，若函数 $y=abs(x^2-2x-3)$ 与 $y=f(x)$ 图象的交点为 $(x_1,y_1),(x_2,y_2),dots,(x_m,y_m)$，则 $sum_(i=1)^m x_i=$#choice-placeholder()。],
  choices: ([$0$], [$m$], [$2m$], [$4m$]),
  answers: ([B],),
  explanation: [由条件，$y=f(x)$ 的图象关于直线 $x=1$ 对称；$y=abs((x-1)^2-4)$ 的图象也关于该直线对称。
    因而所有交点关于 $x=1$ 对称，$2-x_1,dots,2-x_m$ 恰为 $x_1,dots,x_m$ 的一个排列。所以 $sum_(i=1)^m x_i=sum_(i=1)^m (2-x_i)=2m-sum_(i=1)^m x_i$，得所求和为 $m$。],
)
#section[填空题：共 4 题，每题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $arrow(a)=(m,4)$，$arrow(b)=(3,-2)$，且 $arrow(a) parallel arrow(b)$，则 $m=$#fill-placeholder()。],
  answers: ([$-6$],),
  explanation: [由向量平行的坐标条件，$-2m-4 times 3=0$，解得 $m=-6$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(x-y+1>=0, x+y-3>=0, x-3<=0)$，则 $z=x-2y$ 的最小值为#fill-placeholder()。],
  answers: ([$-5$],),
  explanation: [由 $y<=x+1$、$x<=3$，有 $z=x-2y>=x-2(x+1)=-x-2>= -5$。
    当 $(x,y)=(3,4)$ 时满足全部约束，且 $z=-5$，故最小值为 $-5$。],
)
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
  stem: [有三张卡片，分别写有 $1$ 和 $2$，$1$ 和 $3$，$2$ 和 $3$。甲、乙、丙三人各取走一张卡片，甲看了乙的卡片后说：“我与乙的卡片上相同的数字不是 $2$”，乙看了丙的卡片后说：“我与丙的卡片上相同的数字不是 $1$”，丙说：“我的卡片上的数字之和不是 $5$”，则甲的卡片上的数字是#fill-placeholder()。],
  answers: ([$1$ 和 $3$],),
  explanation: [丙的卡片只能是 $(1,2)$ 或 $(1,3)$。若丙为 $(1,3)$，由乙的话可知乙为 $(2,3)$，于是甲为 $(1,2)$，甲、乙的相同数字为 $2$，矛盾。
    所以丙为 $(1,2)$，乙为 $(2,3)$，甲为 $(1,3)$，满足所有条件。],
)
#section[解答题：共 70 分。第 17～21 题为必考题，每题 12 分；第 22～24 题为选考题，任选一题作答，满分 10 分。]
#question(
  "solution",
  score: 12,
  stem: [等差数列 ${a_n}$ 中，$a_3+a_4=4,a_5+a_7=6$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=(2n+3)/5$],),
      explanation: [设首项为 $a_1$、公差为 $d$。由条件得 $cases(2a_1+5d=4, 2a_1+10d=6)$，解得 $d=2/5,a_1=1$，所以 $a_n=1+(n-1) dot 2/5=(2n+3)/5$。],
    ),
    subquestion(
      stem: [设 $b_n=[a_n]$，求数列 ${b_n}$ 的前 $10$ 项和，其中 $[x]$ 表示不超过 $x$ 的最大整数，如 $[0.9]=0,[2.6]=2$。],
      answers: ([$24$],),
      explanation: [由 $a_n=(2n+3)/5$，知 $b_1,b_2,dots,b_10$ 依次为
        $1,1,1,2,2,3,3,3,4,4$，故前 $10$ 项和为 $3 times 1+2 times 2+3 times 3+2 times 4=24$。],
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
    随机调查了该险种的 $200$ 名续保人在一年内的出险情况，得到如下统计表：
    #table(
      columns: 7,
      align: center,
      [上年度出险次数], [$0$], [$1$], [$2$], [$3$], [$4$], [$>=5$],
      [频数], [$60$], [$50$], [$30$], [$30$], [$20$], [$10$],
    )],
  parts: (
    subquestion(
      stem: [记 $A$ 为事件：“一续保人本年度的保费不高于基本保费”，求 $P(A)$ 的估计值。],
      answers: ([$0.55$],),
      explanation: [事件 $A$ 对应上年度出险次数为 $0$ 或 $1$，故以频率估计概率，得 $P(A)$ 的估计值为 $(60+50)/200=0.55$。],
    ),
    subquestion(
      stem: [记 $B$ 为事件：“一续保人本年度的保费高于基本保费但不高于基本保费的 $160%$”，求 $P(B)$ 的估计值。],
      answers: ([$0.3$],),
      explanation: [事件 $B$ 对应保费为 $1.25a$ 或 $1.5a$，即上年度出险 $2$ 次或 $3$ 次，故 $P(B)$ 的估计值为 $(30+30)/200=0.3$。],
    ),
    subquestion(
      stem: [求续保人本年度的平均保费估计值。],
      answers: ([$1.1925a$ 元],),
      explanation: [用样本中各档保费的加权平均数估计总体平均保费，得
        $
          (0.85a times 60+a times 50+1.25a times 30+1.5a times 30+1.75a times 20+2a times 10)/200=1.1925a.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，菱形 $A B C D$ 的对角线 $A C$ 与 $B D$ 交于点 $O$，点 $E,F$ 分别在 $A D,C D$ 上，$A E=C F$，$E F$ 交 $B D$ 于点 $H$，将三角形 $D E F$ 沿 $E F$ 折到三角形 $D' E F$ 的位置。
    #figure(folded-rhombus())],
  parts: (
    subquestion(
      stem: [证明：$A C perp H D'$。],
      answers: ([证明见解析。],),
      explanation: [菱形中 $A D=C D$，又 $A E=C F$，故 $(D E)/(D A)=(D F)/(D C)$，所以 $E F parallel A C$。
        因为 $A C perp B D$，所以折叠前 $E F perp H D$；折叠保持夹角，故折叠后仍有 $E F perp H D'$，从而 $A C perp H D'$。],
    ),
    subquestion(
      stem: [若 $A B=5,A C=6,A E=5/4,O D'=2sqrt(2)$，求五棱锥 $D'-A B C F E$ 的体积。],
      answers: ([$(23sqrt(2))/2$],),
      explanation: [#step[确定锥高][
          $A O=3$，$D O=B O=sqrt(5^2-3^2)=4$。由 $E F parallel A C$ 及 $(A E)/(A D)=1/4$，得 $O H=1$、$D H=3$。折叠后 $D'H=3$，于是
          $O D'^2+O H^2=8+1=9=D'H^2$，故 $O D' perp O H$。
          又 $A C perp B D$、$A C perp H D'$，且 $B D inter H D'=H$，所以 $A C perp$ 平面 $B H D'$，进而 $A C perp O D'$。
          因 $A C inter O H=O$，得 $O D' perp$ 平面 $A B C$，故锥高为 $2sqrt(2)$。
        ]
        #step[计算底面积与体积][
          $E F=(D H)/(D O) dot A C=9/2$，因此五边形底面积为
          $ S=1/2 times 6 times 8-1/2 times 9/2 times 3=69/4. $
          所求体积为 $V=1/3 times 69/4 times 2sqrt(2)=(23sqrt(2))/2$。
        ]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=(x+1)ln x-a(x-1)$。],
  parts: (
    subquestion(
      stem: [当 $a=4$ 时，求曲线 $y=f(x)$ 在 $(1,f(1))$ 处的切线方程。],
      answers: ([$2x+y-2=0$],),
      explanation: [当 $a=4$ 时，$f'(x)=ln x+1/x-3$，所以 $f'(1)=-2$，又 $f(1)=0$。故切线方程为 $y=-2(x-1)$，即 $2x+y-2=0$。],
    ),
    subquestion(
      stem: [若当 $x in (1,+infinity)$ 时，$f(x)>0$，求 $a$ 的取值范围。],
      answers: ([$(-infinity,2]$],),
      explanation: [求导得 $f'(x)=ln x+1+1/x-a$、$f''(x)=(x-1)/x^2$。当 $x>1$ 时，$f''(x)>0$，故 $f'$ 在 $(1,+infinity)$ 上严格递增。
        若 $a<=2$，则对一切 $x>1$，有 $f'(x)>f'(1)=2-a>=0$，从而 $f(x)>f(1)=0$，符合题意。
        若 $a>2$，则 $f'(1)=2-a<0$。由 $f'$ 的连续性，存在 $delta>0$，使 $f'$ 在 $(1,1+delta)$ 上为负，故该区间内 $f(x)<f(1)=0$，不符合题意。
        综上，$a$ 的取值范围为 $(-infinity,2]$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知点 $A$ 是椭圆 $E:x^2/4+y^2/3=1$ 的左顶点，斜率为 $k$（$k>0$）的直线交椭圆 $E$ 于 $A,M$ 两点，点 $N$ 在 $E$ 上，$M A perp N A$。],
  parts: (
    subquestion(
      stem: [当 $abs(A M)=abs(A N)$ 时，求三角形 $A M N$ 的面积。],
      answers: ([$144/49$],),
      explanation: [$A=(-2,0)$。令 $u=x+2$，将直线 $A M$ 的方程 $y=k u$ 代入椭圆，得 $(3+4k^2)u^2-12u=0$。非零根给出
        $ abs(A M)=(12sqrt(1+k^2))/(3+4k^2). $
        同理由直线 $A N$ 的斜率为 $-1/k$，且 $k>0$，得
        $ abs(A N)=(12k sqrt(1+k^2))/(3k^2+4). $
        由两弦等长，得 $3k^2+4=k(3+4k^2)$，即 $(k-1)(4k^2+k+4)=0$。故 $k=1$，$abs(A M)=abs(A N)=(12sqrt(2))/7$。
        又 $A M perp A N$，所以面积为 $1/2 times ((12sqrt(2))/7)^2=144/49$。],
    ),
    subquestion(
      stem: [当 $2abs(A M)=abs(A N)$ 时，证明：$sqrt(3)<k<2$。],
      answers: ([证明见解析。],),
      explanation: [沿用第 (1) 问得到的弦长公式，由 $2abs(A M)=abs(A N)$，得
        $ 2/(3+4k^2)=k/(3k^2+4), $
        即 $4k^3-6k^2+3k-8=0$。
        令 $g(t)=4t^3-6t^2+3t-8$，则 $g'(t)=3(2t-1)^2>=0$，仅在 $t=1/2$ 处为零，故 $g$ 严格递增。
        又 $g(sqrt(3))=15sqrt(3)-26<0$（因为 $675<676$），$g(2)=6>0$，所以其零点 $k$ 满足 $sqrt(3)<k<2$。],
    ),
  ),
)
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
