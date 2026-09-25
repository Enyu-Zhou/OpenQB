#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "新高考一卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020新高考1(山东).pdf",
  regions: ("山东",),
)

#let sundial() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  oblique-project((0.95, -0.22), (0.25, 0.45), (0.4, 0.9), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    let rim(r) = range(121).map(i => (
      r * calc.cos(i * 3deg),
      r * calc.sin(i * 3deg),
      0,
    ))
    line(..rim(1.5), close: true, fill: luma(95%))
    line(..rim(1.25), close: true)
    for i in range(24) {
      let t = i * 15deg
      line(
        (1.25 * calc.cos(t), 1.25 * calc.sin(t), 0),
        (1.43 * calc.cos(t), 1.43 * calc.sin(t), 0),
      )
    }
    line((0, 0, 0), (0, 0, 1.65))
    content((0, 0, 1.65), [晷针], anchor: "south-west", padding: 3pt)
    content((1.5, 0, 0), [晷面], anchor: "west", padding: 3pt)
  })
})
#let sine-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.13,
    shared-zero: $O$,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (5.4, 2.8),
    axis-style: "school-book",
    x-min: -0.65,
    x-max: 3.05,
    y-min: -1.25,
    y-max: 1.3,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (
      (calc.pi / 6, move(dx: -6pt)[$pi/6$]),
      (2 * calc.pi / 3, move(dx: 6pt)[$2pi/3$]),
    ),
    y-ticks: ((1, move(dx: 18pt, dy: -5pt)[$1$]),),
    {
      plot.add(
        x => calc.sin(calc.pi / 3 * 1rad - 2 * x * 1rad),
        domain: (-0.55, 2.9),
        samples: 150,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
    },
  )
})
#let component-diagram() = cetz.canvas(length: 4mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let r = 2 * calc.sqrt(2)
  let a = (7, 7)
  let b = (5 - r, 5)
  let c = (5 - r, 2)
  let d = (0, 2)
  let e = (0, 0)
  let f = (12, 0)
  let g = (12, 2)
  let h = (9, 5)
  let o = (5, 5)
  let arc = range(91).map(i => {
    let t = (45 + i * 1.5) * 1deg
    (5 + r * calc.cos(t), 5 + r * calc.sin(t))
  })
  line(..arc, h, close: true, fill: luma(88%), stroke: none)
  circle(o, radius: 1, fill: white, stroke: none)
  line(e, f, g, ..arc, c, d, close: true)
  circle(o, radius: 1)
  line(d, g, stroke: (dash: figure-style.dash))
  line(b, h, stroke: (dash: figure-style.dash))
  line(d, o, stroke: (dash: figure-style.dash))
  line((5, 2), (5, 5 + r), stroke: (dash: figure-style.dash))
  for (p, label, anchor) in (
    (a, $A$, "south-west"),
    (b, $B$, "east"),
    (c, $C$, "north-east"),
    (d, $D$, "south-east"),
    (e, $E$, "north-east"),
    (f, $F$, "north-west"),
    (g, $G$, "west"),
    (h, $H$, "south-west"),
    ((6.2, 4.7), $O$, "north-west"),
  ) {
    content(p, label, anchor: anchor, padding: 2pt)
  }
})
#let face-diagram() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-1, 0), (1, 2))
  let e = (0, 2)
  let f = (-1, 1)
  let g = (1, 1)
  line(
    ..range(91).map(i => {
      let t = (225 + i) * 1deg
      (calc.sqrt(2) * calc.cos(t), 2 + calc.sqrt(2) * calc.sin(t))
    }),
  )
  line(f, e, g, stroke: (dash: figure-style.dash))
  for (p, label, anchor) in (
    ((-1, 0), $B$, "north-east"),
    ((1, 0), $C$, "north-west"),
    ((-1, 2), $B_1$, "south-east"),
    ((1, 2), $C_1$, "south-west"),
    (e, $E$, "south"),
    (f, $F$, "east"),
    (g, $G$, "west"),
  ) { content(p, label, anchor: anchor, padding: 3pt) }
})
#let pyramid-diagram() = cetz.canvas(length: 30mm, {
  import cetz.draw: *
  let d = (0, 0, 0)
  let a = (1, 0, 0)
  let c = (0, 1, 0)
  let b = (1, 1, 0)
  let p = (0, 0, 1)
  oblique-project((-0.35, -0.45), (1, 0.2), (0, 1.25), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, a, b, c, p)
    line(p, b)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, p, stroke: (dash: figure-style.dash))
    for (q, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "west"),
      (d, $D$, "south-west"),
      (p, $P$, "south"),
    ) { content(q, label, anchor: anchor, padding: 3pt) }
  })
})
#let contingency(completed: false) = table(
  columns: 3,
  align: center,
  [PM2.5 $backslash$ SO₂], [$[0,150]$], [$(150,475]$],
  [$[0,75]$],
  if completed { [$64$] } else { [] },
  if completed { [$16$] } else { [] },

  [$(75,115]$],
  if completed { [$10$] } else { [] },
  if completed { [$10$] } else { [] },
)

#section[单项选择题：本题共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={x | 1<=x<=3}$，$B={x | 2<x<4}$，则 $A union B=$#choice-placeholder()。],
  choices: (
    [${x | 2<x<=3}$],
    [${x | 2<=x<=3}$],
    [${x | 1<=x<4}$],
    [${x | 1<x<4}$],
  ),
  answers: ([C],),
  explanation: [$A=[1,3]$，$B=(2,4)$，∴ $A union B=[1,4)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$(2-"i")/(1+2"i")=$#choice-placeholder()。],
  choices: ([$1$], [$-1$], [$"i"$], [$-"i"$]),
  answers: ([D],),
  explanation: [$(2-"i")/(1+2"i")=((2-"i")(1-2"i"))/5=(-5"i")/5=-"i"$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$6$ 名同学到甲、乙、丙三个场馆做志愿者，每名同学只去 $1$ 个场馆，甲场馆安排 $1$ 名，乙场馆安排 $2$ 名，丙场馆安排 $3$ 名，则不同的安排方法共有#choice-placeholder()。],
  choices: ([$120$ 种], [$90$ 种], [$60$ 种], [$30$ 种]),
  answers: ([C],),
  explanation: [先选甲场馆的 $1$ 人，再从其余 $5$ 人中选乙场馆的 $2$ 人，其余人去丙场馆。
    ∴ 方法数为 $binom(6, 1)binom(5, 2)=6 times 10=60$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [日晷是中国古代用来测定时间的仪器，利用与晷面垂直的晷针投射到晷面的影子来测定时间。把地球看成一个球（球心记为 $O$），地球上一点 $A$ 的纬度是指 $O A$ 与地球赤道所在平面所成角，点 $A$ 处的水平面是指过点 $A$ 且与 $O A$ 垂直的平面。在点 $A$ 处放置一个日晷，若晷面与赤道所在平面平行，点 $A$ 处的纬度为北纬 $40 degree$，则晷针与点 $A$ 处的水平面所成角为#choice-placeholder()。
    #figure(sundial())],
  choices: ([$20 degree$], [$40 degree$], [$50 degree$], [$90 degree$]),
  answers: ([B],),
  explanation: [晷针垂直于赤道所在平面，而 $O A$ 与赤道所在平面所成角为 $40 degree$，∴ 晷针与 $O A$ 所成锐角为 $50 degree$。
    又 $O A$ 是点 $A$ 处水平面的法线，∴ 晷针与水平面所成角为 $90 degree-50 degree=40 degree$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某中学的学生积极参加体育锻炼，其中有 $96%$ 的学生喜欢足球或游泳，$60%$ 的学生喜欢足球，$82%$ 的学生喜欢游泳，则该中学既喜欢足球又喜欢游泳的学生数占该校学生总数的比例是#choice-placeholder()。],
  choices: ([$62%$], [$56%$], [$46%$], [$42%$]),
  answers: ([C],),
  explanation: [由容斥原理，所求比例为 $60%+82%-96%=46%$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [基本再生数 $R_0$ 与世代间隔 $T$ 是新冠肺炎的流行病学基本参数。基本再生数指一个感染者传染的平均人数，世代间隔指相邻两代间传染所需的平均时间。在新冠肺炎疫情初始阶段，可以用指数模型 $I(t)="e"^(r t)$ 描述累计感染病例数 $I(t)$ 随时间 $t$（单位：天）的变化规律，指数增长率 $r$ 与 $R_0$、$T$ 近似满足 $R_0=1+r T$。有学者基于已有数据估计出 $R_0=3.28$，$T=6$。据此，在新冠肺炎疫情初始阶段，累计感染病例数增加 $1$ 倍需要的时间约为（$ln 2 approx 0.69$）#choice-placeholder()。],
  choices: ([$1.2$ 天], [$1.8$ 天], [$2.5$ 天], [$3.5$ 天]),
  answers: ([B],),
  explanation: [$r=(3.28-1)/6=0.38$。设翻倍所需时间为 $Delta t$，则 $"e"^(0.38 Delta t)=2$。
    ∴ $Delta t=(ln 2)/0.38 approx 0.69/0.38 approx 1.8$（天）。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $P$ 是边长为 $2$ 的正六边形 $A B C D E F$ 内的一点，则 $arrow(A P) dot arrow(A B)$ 的取值范围是#choice-placeholder()。],
  choices: ([$(-2,6)$], [$(-6,2)$], [$(-2,4)$], [$(-4,6)$]),
  answers: ([A],),
  explanation: [取 $A=(0,0)$、$B=(2,0)$，则其余顶点依次为 $(3,sqrt(3))$、$(2,2sqrt(3))$、$(0,2sqrt(3))$、$(-1,sqrt(3))$。
    若 $P=(x,y)$ 在六边形内部，则 $-1<x<3$，且此范围内每个横坐标均能取到。
    ∴ $arrow(A P) dot arrow(A B)=2x in (-2,6)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若定义在 $RR$ 的奇函数 $f(x)$ 在 $(-infinity,0)$ 单调递减，且 $f(2)=0$，则满足 $x f(x-1)>=0$ 的 $x$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$[-1,1] union [3,+infinity)$],
    [$[-3,-1] union [0,1]$],
    [$[-1,0] union [1,+infinity)$],
    [$[-1,0] union [1,3]$],
  ),
  answers: ([D],),
  explanation: [由奇性，$f(-2)=f(0)=0$，且 $f$ 在 $(0,+infinity)$ 也单调递减。
    故 $f(t)>0$ 当且仅当 $t in (-infinity,-2) union (0,2)$；$f(t)<0$ 当且仅当 $t in (-2,0) union (2,+infinity)$。
    当 $x<0$ 时需 $f(x-1)<=0$，得 $-1<=x<0$；当 $x>0$ 时需 $f(x-1)>=0$，得 $1<=x<=3$；$x=0$ 也成立。
    ∴ 解集为 $[-1,0] union [1,3]$。],
)

#section[多项选择题：本题共 4 小题，每小题 5 分，共 20 分。每小题有多项符合题目要求。]
#question(
  "multiple-choice",
  score: 5,
  stem: [已知曲线 $C:m x^2+n y^2=1$，下列结论正确的是#choice-placeholder()。],
  choices: (
    [若 $m>n>0$，则 $C$ 是椭圆，其焦点在 $y$ 轴上],
    [若 $m=n>0$，则 $C$ 是圆，其半径为 $sqrt(n)$],
    [若 $m n<0$，则 $C$ 是双曲线，其渐近线方程为 $y=plus.minus sqrt(-m/n)x$],
    [若 $m=0$，$n>0$，则 $C$ 是两条直线],
  ),
  answers: ([ACD],),
  explanation: [#step[选项 A][$m>n>0$ 时，两半轴平方为 $1/m<1/n$，故焦点在 $y$ 轴上，正确。]
    #step[选项 B][圆的方程为 $x^2+y^2=1/n$，半径为 $1/sqrt(n)$，错误。]
    #step[选项 C][$m$、$n$ 异号时为双曲线，由 $m x^2+n y^2=0$ 得渐近线 $y=plus.minus sqrt(-m/n)x$，正确。]
    #step[选项 D][此时 $y=plus.minus 1/sqrt(n)$，为两条平行直线，正确。]],
)
#question(
  "multiple-choice",
  score: 5,
  stem: [下图是函数 $y=sin(omega x+phi)$ 的部分图象，则 $sin(omega x+phi)=$#choice-placeholder()。
    #figure(sine-diagram())],
  choices: (
    [$sin(x+pi/3)$],
    [$sin(pi/3-2x)$],
    [$cos(2x+pi/6)$],
    [$cos(5pi/6-2x)$],
  ),
  answers: ([BC],),
  explanation: [图中相邻零点为 $pi/6$、$2pi/3$，间距为半个周期，∴ 周期为 $pi$，排除 A。
    在 $x=pi/6$ 处图象向下穿过 $x$ 轴，B 符合，且 $sin(pi/3-2x)=cos(2x+pi/6)$，故 C 也符合。
    D 在 $x=0$ 时函数值为 $-sqrt(3)/2<0$，与图象不符。],
)
#question(
  "multiple-choice",
  score: 5,
  stem: [已知 $a>0$，$b>0$，且 $a+b=1$，则#choice-placeholder()。],
  choices: (
    [$a^2+b^2>=1/2$],
    [$2^(a-b)>1/2$],
    [$log_2 a+log_2 b>=-2$],
    [$sqrt(a)+sqrt(b)<=sqrt(2)$],
  ),
  answers: ([ABD],),
  explanation: [#step[选项 A][$a^2+b^2>=(a+b)^2/2=1/2$，正确。]
    #step[选项 B][$a-b=2a-1>-1$，∴ $2^(a-b)>2^(-1)=1/2$，正确。]
    #step[选项 C][$a b<=1/4$，∴ $log_2 a+log_2 b=log_2(a b)<=-2$，仅在 $a=b=1/2$ 时取等，故所给不等式不恒成立。]
    #step[选项 D][$(sqrt(a)+sqrt(b))^2=1+2sqrt(a b)<=2$，故正确。]],
)
#question(
  "multiple-choice",
  score: 5,
  stem: [信息熵是信息论中的一个重要概念。设随机变量 $X$ 所有可能的取值为 $1,2,dots,n$，且 $P(X=i)=p_i>0$（$i=1,2,dots,n$），$sum_(i=1)^n p_i=1$，定义 $X$ 的信息熵 $H(X)=-sum_(i=1)^n p_i log_2 p_i$。下列结论正确的是#choice-placeholder()。],
  choices: (
    [若 $n=1$，则 $H(X)=0$],
    [若 $n=2$，则 $H(X)$ 随着 $p_1$ 的增大而增大],
    [若 $p_i=1/n$（$i=1,2,dots,n$），则 $H(X)$ 随着 $n$ 的增大而增大],
    [若 $n=2m$，随机变量 $Y$ 所有可能的取值为 $1,2,dots,m$，且 $P(Y=j)=p_j+p_(2m+1-j)$（$j=1,2,dots,m$），则 $H(X)<=H(Y)$],
  ),
  answers: ([AC],),
  explanation: [#step[选项 A][$n=1$ 时 $p_1=1$，故 $H(X)=-log_2 1=0$，正确。]
    #step[选项 B][令 $p=p_1$，则 $H=-p log_2 p-(1-p)log_2(1-p)$，导数为 $log_2((1-p)/p)$，在 $(1/2,1)$ 上为负，故错误。]
    #step[选项 C][此时 $H(X)=-n times 1/n log_2(1/n)=log_2 n$，随 $n$ 增大而增大，正确。]
    #step[选项 D][取 $m=1$、$p_1=p_2=1/2$，则 $H(X)=1$，而 $Y$ 只取 $1$，$H(Y)=0$，故错误。]],
)

#section[填空题：本题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [斜率为 $sqrt(3)$ 的直线过抛物线 $C:y^2=4x$ 的焦点，且与 $C$ 交于 $A$、$B$ 两点，则 $|A B|=$#fill-placeholder()。],
  answers: ([$16/3$],),
  explanation: [焦点为 $(1,0)$，直线为 $y=sqrt(3)(x-1)$。联立得 $3x^2-10x+3=0$，两交点横坐标之和为 $10/3$。
    焦点在弦 $A B$ 内，由抛物线定义，$|A B|=|A F|+|B F|=x_A+x_B+2=16/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [将数列 ${2n-1}$ 与 ${3n-2}$ 的公共项从小到大排列得到数列 ${a_n}$，则 ${a_n}$ 的前 $n$ 项和为#fill-placeholder()。],
  answers: ([$3n^2-2n$],),
  explanation: [公共项恰为除以 $6$ 余 $1$ 的正整数，故 $a_n=6n-5$。
    ∴ $S_n=n+6 times (n(n-1))/2=3n^2-2n$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某中学开展劳动实习，学生加工制作零件，零件的截面如图所示。$O$ 为圆孔及轮廓圆弧 $A B$ 所在圆的圆心，$A$ 是圆弧 $A B$ 与直线 $A G$ 的切点，$B$ 是圆弧 $A B$ 与直线 $B C$ 的切点，四边形 $D E F G$ 为矩形，$B C perp D G$，垂足为 $C$，$tan angle O D C=3/5$，$B H parallel D G$，$E F=12$ cm，$D E=2$ cm，$A$ 到直线 $D E$ 和 $E F$ 的距离均为 $7$ cm，圆孔半径为 $1$ cm，则图中阴影部分的面积为#fill-placeholder()$"cm"^2$。
    #figure(component-diagram())],
  answers: ([$4+5pi/2$],),
  explanation: [取 $E=(0,0)$，$F=(12,0)$，则 $D=(0,2)$，$G=(12,2)$，$A=(7,7)$，故 $A G$ 的斜率为 $-1$。
    设外圆半径为 $r$。由切线性质，$O A perp A G$，且 $O B parallel D G$，从而
    $ O=(7-r/sqrt(2),7-r/sqrt(2)). $
    由 $tan angle O D C=3/5$ 得 $(5-r/sqrt(2))/(7-r/sqrt(2))=3/5$，解得 $r=2sqrt(2)$。
    ∴ $angle A O B=3pi/4$，$triangle O A H$ 为等腰直角三角形，面积为 $r^2/2=4$。
    阴影面积等于扇形 $A O B$ 加 $triangle O A H$ 再减去半个圆孔：
    $ S=1/2 times r^2 times 3pi/4+4-pi/2=4+5pi/2. $],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知直四棱柱 $A B C D-A_1 B_1 C_1 D_1$ 的棱长均为 $2$，$angle B A D=60 degree$。以 $D_1$ 为球心、$sqrt(5)$ 为半径的球面与侧面 $B C C_1 B_1$ 的交线长为#fill-placeholder()。],
  answers: ([$sqrt(2)pi/2$],),
  explanation: [取 $B_1 C_1$ 的中点为 $E$，$B B_1$、$C C_1$ 的中点分别为 $F$、$G$。
    $triangle D_1 B_1 C_1$ 为边长 $2$ 的等边三角形，故 $D_1 E=sqrt(3)$，且 $D_1 E perp$ 平面 $B C C_1 B_1$。
    球与该平面相交所得圆的圆心为 $E$，半径为 $sqrt(5-3)=sqrt(2)$。
    在有限的矩形侧面内，仅保留下图中的弧 $F G$。∵ $E F=E G=sqrt(2)$，$F G=2$，∴ $angle F E G=pi/2$。
    ∴ 弧长为 $sqrt(2) times pi/2=sqrt(2)pi/2$。
    #figure(face-diagram())],
)

#section[解答题：本题共 6 小题，共 70 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 10,
  stem: [在① $a c=sqrt(3)$，② $c sin A=3$，③ $c=sqrt(3)b$ 这三个条件中任选一个，补充在下面问题中。若问题中的三角形存在，求 $c$ 的值；若问题中的三角形不存在，说明理由。
    问题：是否存在 $triangle A B C$，它的内角 $A$、$B$、$C$ 的对边分别为 $a$、$b$、$c$，且 $sin A=sqrt(3)sin B$，$C=pi/6$，#underline[　　　　　　　　]？
    注：如果选择多个条件分别解答，按第一个解答计分。],
  answers: ([选①：存在，$c=1$；选②：存在，$c=2sqrt(3)$；选③：不存在。],),
  explanation: [由正弦定理，$a=sqrt(3)b$。由余弦定理，$c^2=3b^2+b^2-2sqrt(3)b^2 cos(pi/6)=b^2$，故 $c=b$。
    进而 $cos A=(b^2+c^2-a^2)/(2b c)=-1/2$，∴ $A=2pi/3$。
    #step[选条件①][$a c=sqrt(3)c^2=sqrt(3)$，得 $c=1$。三边为 $sqrt(3),1,1$，满足三角形三边关系，故存在。]
    #step[选条件②][$c sin(2pi/3)=3$，得 $c=2sqrt(3)$。此时三边为 $6,2sqrt(3),2sqrt(3)$，满足三边关系，故存在。]
    #step[选条件③][$c=b$ 与 $c=sqrt(3)b$ 矛盾，故不存在。]],
)
#question(
  "solution",
  score: 12,
  stem: [已知公比大于 $1$ 的等比数列 ${a_n}$ 满足 $a_2+a_4=20$，$a_3=8$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=2^n$],),
      explanation: [设公比为 $q>1$，则 $8/q+8q=20$，即 $2q^2-5q+2=0$。
        解得 $q=2$ 或 $1/2$，故 $q=2$，$a_1=a_3/q^2=2$，∴ $a_n=2^n$。],
    ),
    subquestion(
      stem: [记 $b_m$ 为 ${a_n}$ 在区间 $(0,m]$（$m in NN^*$）中的项的个数，求数列 ${b_m}$ 的前 $100$ 项和 $S_100$。],
      answers: ([$480$],),
      explanation: [将每个 $2^k$ 对总计数的贡献分别相加：它在 $m=2^k,2^k+1,dots,100$ 中各计一次，共计 $101-2^k$ 次。
        ∵ $2^6=64<=100<128=2^7$，∴
        $ S_100=sum_(k=1)^6 (101-2^k)=606-(2^7-2)=480. $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [为加强环境保护、治理空气污染，环境监测部门对某市空气质量进行调研，随机抽查了 $100$ 天空气中的 PM2.5 和 SO₂ 浓度（单位：$mu "g"/"m"^3$），得下表：
    #table(
      columns: 4,
      align: center,
      [PM2.5 $backslash$ SO₂], [$[0,50]$], [$(50,150]$], [$(150,475]$],
      [$[0,35]$], [$32$], [$18$], [$4$],
      [$(35,75]$], [$6$], [$8$], [$12$],
      [$(75,115]$], [$3$], [$7$], [$10$],
    )
    附：$K^2=(n(a d-b c)^2)/((a+b)(c+d)(a+c)(b+d))$。
    #table(
      columns: 4,
      align: center,
      [$P(K^2>=k)$], [$0.050$], [$0.010$], [$0.001$],
      [$k$], [$3.841$], [$6.635$], [$10.828$],
    )],
  parts: (
    subquestion(
      stem: [估计事件“该市一天空气中 PM2.5 浓度不超过 $75$，且 SO₂ 浓度不超过 $150$”的概率。],
      answers: ([$0.64$],),
      explanation: [满足要求的天数为 $32+18+6+8=64$，故所求概率估计为 $64/100=0.64$。],
    ),
    subquestion(
      stem: [根据所给数据，完成下面的 $2 times 2$ 列联表：
        #contingency()],
      answers: ([#contingency(completed: true)],),
      explanation: [第一行为 $32+18+6+8=64$、$4+12=16$；第二行为 $3+7=10$、$10$。],
    ),
    subquestion(
      stem: [根据（2）中的列联表，判断是否有 $99%$ 的把握认为该市一天空气中 PM2.5 浓度与 SO₂ 浓度有关。],
      answers: ([有 $99%$ 的把握认为两者有关。],),
      explanation: [$
          K^2=(100(64 times 10-16 times 10)^2)/(80 times 20 times 74 times 26)=3600/481 approx 7.484>6.635.
        $
        由临界值表可知，有 $99%$ 的把握认为两者有关。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，四棱锥 $P-A B C D$ 的底面为正方形，$P D perp$ 底面 $A B C D$。设平面 $P A D$ 与平面 $P B C$ 的交线为 $l$。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [证明：$l perp$ 平面 $P D C$。],
      answers: ([证明见解析。],),
      explanation: [过 $P$ 作直线平行于 $A D$。∵ $A D parallel B C$，∴ 该直线同时在平面 $P A D$ 和平面 $P B C$ 内，即为 $l$，故 $l parallel A D$。
        ∵ $A D perp D C$，且 $P D perp$ 底面 $A B C D$，∴ $A D perp P D$。
        $D C$ 与 $P D$ 相交于 $D$，∴ $A D perp$ 平面 $P D C$，从而 $l perp$ 平面 $P D C$。],
    ),
    subquestion(
      stem: [已知 $P D=A D=1$，$Q$ 为 $l$ 上的点，求 $P B$ 与平面 $Q C D$ 所成角的正弦值的最大值。],
      answers: ([$sqrt(6)/3$],),
      explanation: [以 $D$ 为原点，分别沿 $D A$、$D C$、$D P$ 建立空间直角坐标系，则 $P=(0,0,1)$，$B=(1,1,0)$，$C=(0,1,0)$。
        由 $l parallel D A$ 可设 $Q=(t,0,1)$（$t in RR$）。平面 $Q C D$ 的法向量可取 $bold(n)=(1,0,-t)$，且 $arrow(P B)=(1,1,-1)$。
        设所求角为 $alpha$，则
        $ sin^2 alpha=(1+t)^2/(3(1+t^2))=2/3-(t-1)^2/(3(1+t^2))<=2/3. $
        当且仅当 $t=1$ 时取等，∴ 正弦值的最大值为 $sqrt(6)/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=a "e"^(x-1)-ln x+ln a$。],
  parts: (
    subquestion(
      stem: [当 $a="e"$ 时，求曲线 $y=f(x)$ 在点 $(1,f(1))$ 处的切线与两坐标轴围成的三角形的面积。],
      answers: ([$2/("e"-1)$],),
      explanation: [此时 $f(x)="e"^x-ln x+1$，$f'(1)="e"-1$，$f(1)="e"+1$，故切线为 $y=("e"-1)x+2$。
        与两轴交点分别为 $(-2/("e"-1),0)$、$(0,2)$，∴ 面积为 $1/2 times 2 times 2/("e"-1)=2/("e"-1)$。],
    ),
    subquestion(
      stem: [若 $f(x)>=1$，求 $a$ 的取值范围。],
      answers: ([$[1,+infinity)$],),
      explanation: [由定义知 $a>0$、$x>0$。若 $0<a<1$，则 $f(1)=a+ln a<1$，不符合题意，故必须 $a>=1$。
        当 $a>=1$ 时，$f(x)>= "e"^(x-1)-ln x$。
        利用 $"e"^u>=1+u$（$u in RR$）及 $ln x<=x-1$（$x>0$），得
        $ "e"^(x-1)-ln x>=x-(x-1)=1. $
        上述两个基本不等式均可由作差后求导、在 $u=0$ 或 $x=1$ 处取最小值证明。
        ∴ 所求范围为 $[1,+infinity)$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的离心率为 $sqrt(2)/2$，且过点 $A(2,1)$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程。],
      answers: ([$x^2/6+y^2/3=1$],),
      explanation: [由 $1-b^2/a^2=1/2$ 得 $a^2=2b^2$。代入点 $A$，$4/(2b^2)+1/b^2=1$，解得 $b^2=3$、$a^2=6$。
        ∴ $C:x^2/6+y^2/3=1$。],
    ),
    subquestion(
      stem: [点 $M$、$N$ 在 $C$ 上，且 $A M perp A N$，$A D perp M N$，$D$ 为垂足。证明：存在定点 $Q$，使得 $|D Q|$ 为定值。],
      answers: ([存在定点 $Q(4/3,1/3)$，使 $|D Q|=2sqrt(2)/3$。],),
      explanation: [#step[证明弦所在直线过定点][先设直线 $M N:y=k x+h$，$M=(x_1,y_1)$、$N=(x_2,y_2)$。联立椭圆方程，得
          $ (1+2k^2)x^2+4k h x+2h^2-6=0, $
          故 $x_1+x_2=-4k h/(1+2k^2)$，$x_1 x_2=(2h^2-6)/(1+2k^2)$。
          由 $arrow(A M) dot arrow(A N)=0$ 得
          $ (1+k^2)x_1 x_2+(k h-k-2)(x_1+x_2)+(h-1)^2+4=0. $
          代入根与系数关系并化简，得 $(2k+3h+1)(2k+h-1)=0$。
          ∵ $M N$ 不经过 $A$，∴ $2k+h-1 != 0$，故 $2k+3h+1=0$。
          ∴ $M N$ 经过定点 $T(2/3,-1/3)$。
          若 $M N$ 竖直，设 $M=(u,v)$、$N=(u,-v)$，则由垂直条件和椭圆方程，得 $(u-2)^2+1-v^2=0$、$u^2+2v^2=6$。
          消去 $v$，得 $3u^2-8u+4=0$，即 $u=2/3$ 或 $2$。$u=2$ 会使其中一点为 $A$，舍去；故仍经过 $T$。]
        #step[确定定点与定值][取 $Q$ 为 $A T$ 的中点，即 $Q=(4/3,1/3)$。
          由 $A D perp M N$ 且 $D,T in M N$，得 $(arrow(D A)) dot (arrow(D T))=0$。
          令 $bold(v)=arrow(Q D)$、$bold(w)=arrow(Q A)$，则上式为 $(bold(w)-bold(v)) dot (-bold(w)-bold(v))=0$，即 $|bold(v)|^2=|bold(w)|^2$。
          因而无论 $D$ 是否与 $T$ 重合，均有
          $ |D Q|=|A Q|=1/2 |A T|=2sqrt(2)/3. $
          ∴ 存在所求定点 $Q$。]],
    ),
  ),
)
