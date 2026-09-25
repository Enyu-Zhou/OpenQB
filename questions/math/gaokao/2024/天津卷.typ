#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2024,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2024/2024天津.pdf",
  regions: ("天津",),
)

#let scatter-data = (
  (
    (0.423, 0.646),
    (0.615, 1.15),
    (1.117, 0.994),
    (1.317, 1.532),
    (1.863, 1.843),
    (2.435, 1.653),
    (2.556, 2.026),
    (2.989, 2.328),
    (3.328, 2.276),
    (3.648, 2.641),
  ),
  (
    (0.598, 2.138),
    (0.909, 2.77),
    (1.049, 2.095),
    (1.361, 1.57),
    (1.447, 1.858),
    (1.237, 2.496),
    (1.415, 3.032),
    (2.99, 2.328),
    (1.554, 3.664),
    (1.501, 2.116),
    (1.505, 1.329),
    (1.783, 0.986),
    (1.779, 1.436),
    (1.655, 1.623),
    (1.783, 2.218),
    (2.03, 2.24),
    (1.736, 2.528),
    (1.714, 2.85),
    (2.165, 2.931),
    (2.196, 3.509),
    (2.438, 3.316),
    (2.491, 2.936),
    (2.421, 2.438),
    (2.325, 2.116),
    (2.148, 1.961),
    (2.159, 1.671),
    (2.159, 1.473),
    (2.572, 0.98),
    (3.085, 0.82),
    (3.627, 0.594),
    (2.925, 1.302),
    (2.862, 1.554),
    (2.577, 1.618),
    (3.054, 1.72),
    (2.866, 1.982),
    (2.7, 2.196),
    (2.679, 2.524),
    (2.893, 2.765),
    (3.139, 2.48),
    (3.166, 2.116),
    (3.444, 2.69),
    (3.66, 2.642),
    (3.515, 2.266),
    (3.648, 1.881),
    (3.831, 2.003),
    (3.429, 1.602),
    (3.911, 1.575),
    (3.396, 1.275),
    (3.526, 1.045),
    (3.9, 1.167),
  ),
  (
    (0.605, 0.978),
    (0.787, 0.703),
    (0.921, 1.005),
    (1.037, 1.782),
    (0.921, 2.117),
    (1.116, 2.475),
    (1.396, 2.441),
    (1.256, 1.916),
    (1.094, 1.457),
    (1.357, 1.306),
    (1.317, 1.519),
    (1.603, 1.681),
    (1.408, 2.033),
    (2.03, 2.239),
    (1.519, 2.313),
    (1.675, 2.234),
    (1.955, 2.794),
    (1.553, 2.642),
    (1.871, 2.375),
    (2.106, 2.687),
    (2.106, 2.424),
    (2.245, 1.944),
    (2.049, 1.636),
    (1.641, 1.927),
    (1.876, 1.882),
    (2.252, 1.516),
    (2.877, 1.334),
    (2.61, 1.882),
    (2.525, 1.709),
    (2.441, 1.989),
    (2.386, 2.213),
    (2.38, 2.581),
    (2.245, 2.866),
    (2.301, 3.039),
    (2.648, 2.162),
    (2.648, 2.587),
    (2.811, 2.788),
    (2.933, 2.514),
    (2.698, 2.424),
    (3.05, 3.095),
    (3.185, 2.681),
    (2.721, 3.039),
    (3.341, 3.274),
    (3.543, 3.067),
    (2.877, 1.609),
    (2.871, 1.888),
    (0.719, 1.363),
  ),
  (
    (0.456, 1.411),
    (1.716, 0.801),
    (0.794, 1.551),
    (2.424, 1.016),
    (2.362, 2.431),
    (0.96, 3.261),
    (1.329, 2.794),
    (2.154, 1.434),
    (2.035, 3.575),
    (1.593, 1.471),
    (0.794, 2.369),
    (1.575, 2.104),
    (2.011, 2.953),
    (3.242, 2.922),
    (3.771, 3.015),
    (2.258, 1.883),
    (3.684, 1.281),
    (3.61, 1.748),
    (3.057, 1.182),
    (3.333, 2.031),
    (2.731, 1.723),
    (3.574, 2.148),
    (3.574, 2.701),
    (2.712, 3.334),
    (3.481, 3.113),
    (3.543, 3.378),
    (3.161, 2.424),
    (2.787, 2.763),
  ),
)

#let scatter-option(points) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0,
    shared-zero: $O$,
  ))
  plot.plot(
    size: (3.3, 3.3),
    axis-style: "school-book",
    x-min: 0,
    x-max: 4.4,
    y-min: 0,
    y-max: 4.4,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.annotate(resize: false, {
        for point in points {
          circle(point, radius: 0.06, fill: black, stroke: none)
        }
      })
    },
  )
})
#let truncated-prism() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (0.5, calc.sqrt(3) / 2, 0)
  let c = (1, 0, 0)
  let d = (0, 0, 1)
  let e = (0.5, calc.sqrt(3) / 2, 2)
  let f = (1, 0, 3)
  oblique-project((2, 0), (0, -0.7), (0.15, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, f, e, d, a)
    line(b, e)
    line(d, f)
    line(a, c, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "east"),
      (e, $E$, "west"),
      (f, $F$, "south-west"),
    ) { content(point, label, anchor: anchor, padding: 0.12) }
  })
})
#let trapezoid-prism() = cetz.canvas(length: 14mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (1, 1, 0)
  let d = (0, 1, 0)
  let a1 = (0, 0, 2)
  let b1 = (2, 0, 2)
  let c1 = (1, 1, 2)
  let d1 = (0, 1, 2)
  let m = (0, 1, 1)
  let n = (1.5, 0.5, 2)
  oblique-project((-0.65, -0.45), (1.5, 0), (0, 1.7), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a1, b1, c1, d1, a1)
    line(b1, b, c, d, d1)
    line(c, c1)
    line(d1, n)
    line(b1, c, m)
    line(b, a, d, stroke: (dash: figure-style.dash))
    line(a, a1, stroke: (dash: figure-style.dash))
    line(b1, m, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "north-west"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "east"),
      (c1, $C_1$, "west"),
      (d1, $D_1$, "south-west"),
      (m, $M$, "west"),
      (n, $N$, "south-east"),
    ) { content(point, label, anchor: anchor, padding: 0.12) }
  })
})

#section[选择题：本题共 9 小题，每小题 5 分，共 45 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [已知集合 $A={1,2,3,4}$，$B={2,3,4,5}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${1,2,3,4}$], [${2,3,4}$], [${2,4}$], [${1}$]),
  answers: ([B],),
  explanation: [两集合的公共元素为 $2,3,4$，故 $A inter B={2,3,4}$。],
)
#question(
  "single-choice",
  stem: [已知 $a,b in RR$，则“$a^3=b^3$”是“$3^a=3^b$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([C],),
  explanation: [函数 $y=x^3$ 与 $y=3^x$ 在实数集上均严格递增，两个条件都等价于 $a=b$，故为充要条件。],
)
#question(
  "single-choice",
  stem: [下列图中，线性相关系数最大的是#choice-placeholder()。],
  choices: (
    [#figure(scatter-option(scatter-data.at(0)))],
    [#figure(scatter-option(scatter-data.at(1)))],
    [#figure(scatter-option(scatter-data.at(2)))],
    [#figure(scatter-option(scatter-data.at(3)))],
  ),
  answers: ([A],),
  explanation: [A 中散点最接近一条斜率为正的直线，呈较强正相关；C 的正相关程度较弱，B 呈负相关，D 的线性相关程度较弱。因此 A 的相关系数最大。],
)
#question(
  "single-choice",
  stem: [下列函数是偶函数的为#choice-placeholder()。],
  choices: (
    [$y=(e^x-x^2)/(e^x+x^2)$],
    [$y=(cos x-x^2)/(x^2+1)$],
    [$y=(e^x-x)/(e^x+x)$],
    [$y=(sin x-x)/(x^2+1)$],
  ),
  answers: ([B],),
  explanation: [B 的定义域为 $RR$，且 $f(-x)=(cos(-x)-(-x)^2)/((-x)^2+1)=f(x)$，故为偶函数。],
)
#question(
  "single-choice",
  stem: [设 $a=4.2^(-0.2)$，$b=4.2^0.2$，$c=log_(4.2) 0.2$，则 $a,b,c$ 的大小关系为#choice-placeholder()。],
  choices: ([$a<b<c$], [$a<c<b$], [$c<b<a$], [$c<a<b$]),
  answers: ([D],),
  explanation: [∵ $4.2>1$，∴ $0<a<1<b$，且 $c<0$，故 $c<a<b$。],
)
#question(
  "single-choice",
  stem: [已知 $m,n$ 是两条直线，$alpha$ 是一个平面。下列命题正确的是#choice-placeholder()。],
  choices: (
    [若 $m parallel alpha$，$m perp n$，则 $n perp alpha$],
    [若 $m perp alpha$，$m perp n$，则 $n perp alpha$],
    [若 $m parallel alpha$，$n perp alpha$，则 $m perp n$],
    [若 $m perp alpha$，$n perp alpha$，则 $m perp n$],
  ),
  answers: ([C],),
  explanation: [
    #step[选项 A][取 $alpha:z=0$，$m$ 的方向为 $(1,0,0)$ 且位于 $z=1$，$n$ 的方向为 $(0,1,0)$，则条件成立而结论不成立。]
    #step[选项 B][与平面的垂线垂直的直线可在平面内或与平面平行，故错误。]
    #step[选项 C][在 $alpha$ 内取直线 $l parallel m$。由 $n perp alpha$ 得 $n perp l$，从而 $n perp m$，正确。]
    #step[选项 D][同一平面的两条垂线互相平行，故错误。]
  ],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x)=3sin(omega x+pi/3)$（$omega>0$）的最小正周期为 $pi$，则 $f(x)$ 在区间 $[-pi/12,pi/6]$ 上的最小值为#choice-placeholder()。],
  choices: ([$-(3sqrt(3))/2$], [$-3/2$], [$0$], [$3/2$]),
  answers: ([D],),
  explanation: [由 $(2pi)/omega=pi$ 得 $omega=2$。
    当 $x in [-pi/12,pi/6]$ 时，$2x+pi/3 in [pi/6,(2pi)/3]$，该区间上正弦的最小值为 $1/2$，故 $f(x)$ 的最小值为 $3/2$。],
)
#question(
  "single-choice",
  stem: [双曲线 $x^2/a^2-y^2/b^2=1$（$a>0$，$b>0$）的左、右焦点分别为 $F_1,F_2$，点 $P$ 在双曲线右支上，直线 $P F_2$ 的斜率为 $2$。若 $triangle P F_1 F_2$ 是直角三角形，且面积为 $8$，则双曲线的方程为#choice-placeholder()。],
  choices: (
    [$x^2/2-y^2/8=1$],
    [$x^2/4-y^2/8=1$],
    [$x^2/8-y^2/2=1$],
    [$x^2/8-y^2/4=1$],
  ),
  answers: ([A],),
  explanation: [直角不可能在 $F_1$ 或 $F_2$，故 $P F_1 perp P F_2$。
    设 $F_1=(-c,0)$，$F_2=(c,0)$，则两直线分别为 $y=-1/2(x+c)$ 与 $y=2(x-c)$，交点为 $P=((3c)/5,-(4c)/5)$。
    ∵ 三角形面积为 $c times (4c)/5=8$，∴ $c^2=10$。
    又 $P F_1=(4c)/sqrt(5)$，$P F_2=(2c)/sqrt(5)$，故 $2a=P F_1-P F_2=(2c)/sqrt(5)$，$a^2=2$，$b^2=8$。],
)
#question(
  "single-choice",
  stem: [在如图五面体中，棱 $A D,B E,C F$ 互相平行，且两两之间的距离均为 $1$。若 $A D=1$，$B E=2$，$C F=3$，则该五面体的体积为#choice-placeholder()。
    #figure(truncated-prism())],
  choices: (
    [$sqrt(3)/6$],
    [$sqrt(3)/4+1/2$],
    [$sqrt(3)/2$],
    [$(3sqrt(3))/4-1/2$],
  ),
  answers: ([C],),
  explanation: [沿三条平行棱的方向，将立体投影到与棱垂直的平面，三条棱投影为边长 $1$ 的正三角形的三个顶点，面积为 $S=sqrt(3)/4$。
    把五面体分为四面体 $A B C F$、$A B E F$、$A D E F$。以各自所含的平行棱计算体积，分别为 $1/3 S dot C F$、$1/3 S dot B E$、$1/3 S dot A D$。
    故 $V=S/3(A D+B E+C F)=sqrt(3)/2$。],
)

#section[填空题：本题共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  stem: [$"i"$ 是虚数单位，复数 $(sqrt(5)+"i")(sqrt(5)-2"i")=$#fill-placeholder()。],
  answers: ([$7-sqrt(5)"i"$],),
  explanation: [展开得 $5-2sqrt(5)"i"+sqrt(5)"i"-2"i"^2=7-sqrt(5)"i"$。],
)
#question(
  "fill-in",
  stem: [在 $(x^2/3+3/x^2)^6$ 的展开式中，常数项为#fill-placeholder()。],
  answers: ([$20$],),
  explanation: [通项为 $T_(r+1)=binom(6, r)3^(2r-6)x^(12-4r)$。
    令 $12-4r=0$ 得 $r=3$，常数项为 $binom(6, 3)=20$。],
)
#question(
  "fill-in",
  stem: [已知圆 $(x-1)^2+y^2=25$ 的圆心与抛物线 $y^2=2p x$ 的焦点 $F$ 重合，且两曲线在第一象限的交点为 $A$，则原点到直线 $A F$ 的距离为#fill-placeholder()。],
  answers: ([$4/5$],),
  explanation: [由 $F=(1,0)$ 得 $p=2$。将 $y^2=4x$ 代入圆的方程，得 $(x+1)^2=25$。
    ∵ $A$ 在第一象限，∴ $A=(4,4)$，直线 $A F$ 为 $4x-3y-4=0$。
    故原点到该直线的距离为 $4/sqrt(4^2+(-3)^2)=4/5$。],
)
#question(
  "fill-in",
  stem: [某校组织学生参加农业实践活动，期间安排了劳动技能比赛，比赛共 $5$ 个项目，分别为整地做畦、旱田播种、作物移栽、田间灌溉、藤架搭建，规定每人参加其中 $3$ 个项目。假设每人参加每个项目的可能性相同，则甲同学参加“整地做畦”项目的概率为#fill-placeholder()；已知乙同学参加的 $3$ 个项目中有“整地做畦”，则他还参加“田间灌溉”项目的概率为#fill-placeholder()。],
  answers: ([$3/5$], [$1/2$]),
  explanation: [第一个概率为 $binom(4, 2)/binom(5, 3)=3/5$。
    已知乙参加整地做畦，剩余两个项目从另外四个中选取，故条件概率为 $binom(3, 1)/binom(4, 2)=1/2$。],
)
#question(
  "fill-in",
  stem: [已知正方形 $A B C D$ 的边长为 $1$，$arrow(D E)=2arrow(E C)$。若 $arrow(B E)=lambda arrow(B A)+mu arrow(B C)$，其中 $lambda,mu$ 为实数，则 $lambda+mu=$#fill-placeholder()；设 $F$ 是线段 $B E$ 上的动点，$G$ 为线段 $A F$ 的中点，则 $arrow(A F) dot arrow(D G)$ 的最小值为#fill-placeholder()。],
  answers: ([$4/3$], [$-5/18$]),
  explanation: [以 $B$ 为原点，$B A$，$B C$ 为坐标轴正方向，则 $A=(1,0)$，$C=(0,1)$，$D=(1,1)$，$E=(1/3,1)$，故 $lambda+mu=1/3+1=4/3$。
    设 $F=(t/3,t)$，$0<=t<=1$，则 $G=(1/2+t/6,t/2)$，
    $ arrow(A F) dot arrow(D G)=(t/3-1)(t/6-1/2)+t(t/2-1)=5/9 t^2-4/3 t+1/2. $
    该二次函数的对称轴为 $t=6/5>1$，故在 $[0,1]$ 上递减，最小值为 $5/9-4/3+1/2=-5/18$。],
)
#question(
  "fill-in",
  stem: [设 $a in RR$，函数 $f(x)=2sqrt(x^2-a x)-abs(a x-2)+1$。若 $f(x)$ 恰有一个零点，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$(-sqrt(3),-1) union (1,sqrt(3))$],),
  explanation: [
    #step[利用对称性][将 $a,x$ 同时变为 $-a,-x$，函数值不变，因此只需讨论 $a>=0$。
      当 $a=0$ 时，$f(x)=2abs(x)-1$ 有两个零点，不符合题意。]
    #step[讨论非正半轴][设 $a>0$，定义域为 $(-infinity,0] union [a,+infinity)$。
      在 $x<=0$ 上，零点方程为 $2sqrt(x^2-a x)=1-a x$。两边非负，平方等价于
      $ ((2+a)x+1)((2-a)x-1)=0. $
      总有一个负根 $x=-1/(2+a)$；当 $a>2$ 时还有另一个负根 $x=1/(2-a)$，因此必须 $0<a<=2$。]
    #step[排除正半轴的零点][当 $0<a<=2$ 时，令 $g(x)=2sqrt(x^2-a x)$，则在 $x>a$ 上
      $ g'(x)=(2x-a)/sqrt(x^2-a x)>2>=a. $
      于是 $g(x)-abs(a x-2)+1$ 在 $[a,+infinity)$ 上严格递增。若 $a<2$，其极限为 $+infinity$；若 $a=2$，其极限为 $1$。
      因而正半轴无零点当且仅当 $f(a)=1-abs(a^2-2)>0$，即 $1<a<sqrt(3)$。
      再由对称性，得 $a in (-sqrt(3),-1) union (1,sqrt(3))$。]
  ],
)

#section[解答题：本题共 5 小题，共 75 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 所对的边分别为 $a,b,c$。已知 $cos B=9/16$，$b=5$，$a/c=2/3$。],
  parts: (
    subquestion(
      stem: [求 $a$ 的值；],
      answers: ([$4$。],),
      explanation: [设 $a=2t$，$c=3t$（$t>0$）。由余弦定理，$25=4t^2+9t^2-12t^2 times 9/16=25/4 t^2$，得 $t=2$，所以 $a=4$，$c=6$。],
    ),
    subquestion(
      stem: [求 $sin A$ 的值；],
      answers: ([$sqrt(7)/4$。],),
      explanation: [$sin B=sqrt(1-(9/16)^2)=(5sqrt(7))/16$。
        由正弦定理，$sin A=a/b sin B=4/5 times (5sqrt(7))/16=sqrt(7)/4$。],
    ),
    subquestion(
      stem: [求 $cos(B-2A)$ 的值。],
      answers: ([$57/64$。],),
      explanation: [由余弦定理，$cos A=(25+36-16)/(2 times 5 times 6)=3/4$。
        ∴ $cos 2A=1/8$，$sin 2A=(3sqrt(7))/8$。
        ∴ $cos(B-2A)=cos B cos 2A+sin B sin 2A=9/16 times 1/8+(5sqrt(7))/16 times (3sqrt(7))/8=57/64$。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在四棱柱 $A B C D-A_1 B_1 C_1 D_1$ 中，$A A_1 perp$ 平面 $A B C D$，$A B perp A D$，$A B parallel D C$，$A B=A A_1=2$，$A D=D C=1$，$M,N$ 分别为 $D D_1,B_1 C_1$ 的中点。
    #figure(trapezoid-prism())],
  parts: (
    subquestion(
      stem: [求证：$D_1 N parallel$ 平面 $C B_1 M$；],
      answers: ([证明见解析。],),
      explanation: [取 $C B_1$ 的中点 $P$，连接 $N P$，$M P$。
        在 $triangle B_1 C C_1$ 中，$N P parallel C C_1$ 且 $N P=1/2 C C_1$。
        又 $D_1 M parallel C C_1$ 且 $D_1 M=1/2 C C_1$，故四边形 $D_1 N P M$ 为平行四边形，$D_1 N parallel M P$。
        ∵ $M P subset$ 平面 $C B_1 M$，$D_1 N cancel(subset)$ 平面 $C B_1 M$，∴ $D_1 N parallel$ 平面 $C B_1 M$。],
    ),
    subquestion(
      stem: [求平面 $C B_1 M$ 与平面 $B B_1 C_1 C$ 夹角的余弦值；],
      answers: ([$(2sqrt(22))/11$。],),
      explanation: [以 $A$ 为原点，$A B,A D,A A_1$ 的方向为 $x,y,z$ 轴正方向，建立空间直角坐标系。
        则 $B=(2,0,0)$，$C=(1,1,0)$，$B_1=(2,0,2)$，$M=(0,1,1)$。
        由 $arrow(C B_1)=(1,-1,2)$，$arrow(C M)=(-1,0,1)$，可取平面 $C B_1 M$ 的法向量为 $arrow(n)=(1,3,1)$。
        平面 $B B_1 C_1 C$ 的法向量可取 $arrow(m)=(1,1,0)$。
        所求夹角的余弦值为 $abs(arrow(m) dot arrow(n))/(abs(arrow(m)) abs(arrow(n)))=4/sqrt(22)=(2sqrt(22))/11$。],
    ),
    subquestion(
      stem: [求点 $B$ 到平面 $C B_1 M$ 的距离。],
      answers: ([$(2sqrt(11))/11$。],),
      explanation: [沿用（2）的坐标系与法向量，$arrow(C B)=(1,-1,0)$。
        故所求距离为 $d=abs(arrow(C B) dot arrow(n))/abs(arrow(n))=2/sqrt(11)=(2sqrt(11))/11$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的离心率为 $1/2$。左顶点为 $A$，下顶点为 $B$，点 $C$ 为线段 $O B$ 的中点（$O$ 为原点），$triangle A B C$ 的面积为 $(3sqrt(3))/2$。],
  parts: (
    subquestion(
      stem: [求椭圆的方程；],
      answers: ([$x^2/12+y^2/9=1$。],),
      explanation: [由离心率为 $1/2$，得 $b^2=3/4 a^2$。
        又 $S_(triangle A B C)=1/2 times b/2 times a=(a b)/4=(3sqrt(3))/2$。
        ∴ $a^2=12$，$b^2=9$，椭圆方程为 $x^2/12+y^2/9=1$，且 $C=(0,-3/2)$。],
    ),
    subquestion(
      stem: [过点 $C$ 的动直线与椭圆相交于 $P,Q$ 两点。在 $y$ 轴上是否存在点 $T$，使得 $arrow(T P) dot arrow(T Q)<=0$ 恒成立？若存在，求出点 $T$ 纵坐标的取值范围；若不存在，请说明理由。],
      answers: ([存在，纵坐标的取值范围为 $[-3,3/2]$。],),
      explanation: [设 $T=(0,t)$。
        #step[斜率不存在时][此时弦在 $y$ 轴上，$P,Q$ 为 $(0,3)$，$(0,-3)$，故要求 $t^2-9<=0$。]
        #step[斜率存在时][设直线为 $y=k x-3/2$，交点为 $P=(x_1,y_1)$，$Q=(x_2,y_2)$。
          联立椭圆，得 $(3+4k^2)x^2-12k x-27=0$，所以
          $ x_1+x_2=(12k)/(3+4k^2), quad x_1 x_2=-27/(3+4k^2). $
          ∴
          $
            arrow(T P) dot arrow(T Q)
            =x_1 x_2+(k x_1-3/2-t)(k x_2-3/2-t)
            =(3((t+3/2)^2-9)+4k^2(t^2-9))/(3+4k^2).
          $
          分母为正，分子对所有实数 $k$ 非正，当且仅当
          $ (t+3/2)^2<=9, quad t^2<=9. $
          与斜率不存在的情形合并，得到 $-3<=t<=3/2$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知 ${a_n}$ 为公比大于 $0$ 的等比数列，其前 $n$ 项和为 $S_n$，且 $a_1=1$，$S_2=a_3-1$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式及 $S_n$；],
      answers: ([$a_n=2^(n-1)$，$S_n=2^n-1$。],),
      explanation: [设公比为 $q>0$。由 $1+q=q^2-1$，得 $(q-2)(q+1)=0$，故 $q=2$。
        ∴ $a_n=2^(n-1)$，$S_n=2^n-1$。],
    ),
    subquestion(
      stem: [设数列 ${b_n}$ 满足 $b_n=cases(k & quad n=a_k, b_(n-1)+2k & quad a_k<n<a_(k+1))$，其中 $k in NN^*$。],
      parts: (
        subquestion(
          stem: [求证：当 $n=a_(k+1)$（$k in NN^*$，且 $k>1$）时，$b_(n-1)>=a_k b_n$；],
          answers: ([证明见解析。],),
          explanation: [在第 $k$ 组下标 $2^(k-1)<=i<=2^k-1$ 内，$b_i$ 是首项 $k$、公差 $2k$ 的等差数列，共 $2^(k-1)$ 项。
            当 $n=2^k$ 时，$b_n=k+1$，$b_(n-1)=k+2k(2^(k-1)-1)=k(2^k-1)$。
            ∴
            $ b_(n-1)-a_k b_n=(k-1)2^(k-1)-k>=2(k-1)-k=k-2>=0. $
            故结论成立。],
        ),
        subquestion(
          stem: [求 $sum_(i=1)^(S_n) b_i$。],
          answers: ([$((3n-1)4^n+1)/9$。],),
          explanation: [第 $k$ 组的和为
            $ (2^(k-1)(k+k(2^k-1)))/2=k 4^(k-1). $
            ∵ $S_n=2^n-1$，∴ 所求和恰为前 $n$ 组之和。
            利用
            $ k 4^(k-1)=((3k-1)4^k-(3k-4)4^(k-1))/9 $
            裂项相消，得
            $ sum_(i=1)^(S_n) b_i=sum_(k=1)^n k 4^(k-1)=((3n-1)4^n+1)/9. $],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  stem: [已知函数 $f(x)=x ln x$。],
  parts: (
    subquestion(
      stem: [求曲线 $y=f(x)$ 在点 $(1,f(1))$ 处的切线方程；],
      answers: ([$y=x-1$。],),
      explanation: [$f'(x)=ln x+1$，故 $f(1)=0$，$f'(1)=1$，切线方程为 $y=x-1$。],
    ),
    subquestion(
      stem: [若 $f(x)>=a(x-sqrt(x))$ 对任意 $x in (0,+infinity)$ 成立，求实数 $a$ 的值；],
      answers: ([$a=2$。],),
      explanation: [
        #step[必要性][令 $g(x)=x ln x-a(x-sqrt(x))$。由 $g(x)>=0$ 且 $g(1)=0$，知 $x=1$ 为极小值点，故 $g'(1)=1-a/2=0$，即 $a=2$。]
        #step[充分性][设 $t=sqrt(x)>0$，则
          $ x ln x-2(x-sqrt(x))=2t(t ln t-t+1). $
          函数 $t ln t-t+1$ 的导数为 $ln t$，在 $t=1$ 处取得最小值 $0$，故上式非负，$a=2$ 满足题意。]
      ],
    ),
    subquestion(
      stem: [若 $x_1,x_2 in (0,1)$，求证：$abs(f(x_1)-f(x_2))<=abs(x_1-x_2)^(1/2)$。],
      answers: ([证明见解析。],),
      explanation: [若 $x_1=x_2$，结论显然。否则不妨设 $0<x_1<x_2<1$，记 $h=x_2-x_1 in (0,1)$，$D=f(x_2)-f(x_1)$。
        #step[估计上界][函数 $f(x)-x$ 的导数为 $ln x<0$（$0<x<1$），故
          $ D<=x_2-x_1=h<=sqrt(h). $]
        #step[估计下界][由对数运算，
          $ D-h ln h=x_1 ln(1+h/x_1)+h ln(1+x_1/h)>0. $
          又 $f'(x)=ln x+1$，故 $f(x)$ 在 $x=1/e$ 处取得最小值 $-1/e$。
          ∴ $h ln h=2sqrt(h)f(sqrt(h))>=-2/e sqrt(h)>-sqrt(h)$。
          从而 $D>=-sqrt(h)$。]
        综上，$-sqrt(h)<=D<=sqrt(h)$，即 $abs(f(x_1)-f(x_2))<=abs(x_1-x_2)^(1/2)$。],
    ),
  ),
)
