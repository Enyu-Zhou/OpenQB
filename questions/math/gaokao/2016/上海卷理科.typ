#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016上海理.pdf",
  regions: ("上海",),
)

#let prism() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let h = 2 * calc.sqrt(2)
  let A = (0, 0, 0)
  let B = (3, 0, 0)
  let C = (3, 3, 0)
  let D = (0, 3, 0)
  let A1 = (0, 0, h)
  let B1 = (3, 0, h)
  let C1 = (3, 3, h)
  let D1 = (0, 3, h)
  oblique-project((0.85, 0), (0.3, 0.3), (0, 1), {
    line(A, B, C, C1, D1, A1, A)
    line(A1, B1, C1)
    line(B, B1)
    line(A, D, C, stroke: (dash: figure-style.dash))
    line(D, D1, B, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (A, $A$, "north-east"),
      (B, $B$, "north"),
      (C, $C$, "west"),
      (D, $D$, "east"),
      (A1, $A_1$, "east"),
      (B1, $B_1$, "south-east"),
      (C1, $C_1$, "south-west"),
      (D1, $D_1$, "south"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})
#let octagon() = cetz.canvas(length: 14mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    shared-zero: $O$,
  ))
  let vertices = range(8).map(i => (calc.cos(i * 45deg), calc.sin(i * 45deg)))
  plot.plot(
    size: (3.1, 3.1),
    axis-style: "school-book",
    x-min: -1.55,
    x-max: 1.55,
    y-min: -1.55,
    y-max: 1.55,
    x-tick-step: none,
    y-tick-step: none,
    x-label: $x$,
    y-label: $y$,
    {
      plot.annotate(resize: false, {
        line(..vertices, close: true)
        for (i, p) in vertices.enumerate() {
          let position = if i == 0 { (1.17, 0.15) } else if i == 2 {
            (0.27, 1.14)
          } else if i == 4 { (-1.18, 0.15) } else if i == 6 {
            (0.27, -1.14)
          } else { (p.at(0) * 1.28, p.at(1) * 1.28) }
          content(position, $A_#(i + 1)$)
        }
      })
      plot.add(
        vertices,
        style: (stroke: none),
        mark: "o",
        mark-size: 0.06,
        mark-style: (fill: black, stroke: none),
      )
    },
  )
})
#let polar-curve() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    shared-zero: $O$,
    padding: 0,
    y: (stroke: none, mark: (end: none)),
  ))
  plot.plot(
    size: (2.7, 4.05),
    axis-style: "school-book",
    x-min: 0,
    x-max: 10,
    y-min: -12,
    y-max: 3,
    x-tick-step: none,
    y-tick-step: none,
    x-label: $x$,
    y-label: none,
    {
      plot.annotate(resize: false, {
        let points = range(361).map(i => {
          let t = i * 1deg
          let r = 6 - 5 * calc.sin(t)
          (r * calc.cos(t), r * calc.sin(t))
        })
        line(..points, close: true)
      })
    },
  )
})
#let cylinder(auxiliary: false) = cetz.canvas(length: 23mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let O = (0, 0, 0)
  let O1 = (0, 0, 1)
  let A = (1, 0, 0)
  let A1 = (1, 0, 1)
  let B = (0.5, calc.sqrt(3) / 2, 0)
  let B1 = (0.5, calc.sqrt(3) / 2, 1)
  let C = (-0.5, calc.sqrt(3) / 2, 0)
  let arc-points(start, end, z) = range(start, end + 1, step: 2).map(i => (
    calc.cos(i * 1deg),
    calc.sin(i * 1deg),
    z,
  ))
  oblique-project((1, 0), (0, -0.35), (0, 1.05), {
    line(..arc-points(0, 360, 1), close: true)
    line(..arc-points(0, 180, 0))
    line(..arc-points(180, 360, 0), stroke: (dash: figure-style.dash))
    line((-1, 0, 0), (-1, 0, 1))
    line(A, A1, O1, B1)
    line(A, O, O1, stroke: (dash: figure-style.dash))
    line(C, B1, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(O, C, B, O, stroke: (dash: figure-style.dash))
      line(B, B1, stroke: (dash: figure-style.dash))
      content(B, $B$, anchor: "north-west", padding: 3pt)
    }
    for (p, label, anchor) in (
      (O, $O$, "north"),
      (O1, $O_1$, "south"),
      (A, $A$, "west"),
      (A1, $A_1$, "west"),
      (B1, $B_1$, "north-west"),
      (C, $C$, "north-east"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})
#let vegetable-field(auxiliary: false) = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    shared-zero: $O$,
  ))
  plot.plot(
    size: (3, 3),
    axis-style: "school-book",
    x-min: -1.5,
    x-max: 1.5,
    y-min: -0.35,
    y-max: 2.65,
    x-tick-step: none,
    y-tick-step: none,
    x-label: $x$,
    y-label: $y$,
    {
      plot.annotate(resize: false, {
        line((-1, 0), (-1, 2), (1, 2), (1, 0))
        line(
          ..range(101).map(i => {
            let y = i / 50
            (y * y / 4, y)
          }),
        )
        if auxiliary {
          line((0.25, 0), (0.25, 2), stroke: (dash: figure-style.dash))
          line((0, 0), (0.25, 1), (1, 2), stroke: (dash: figure-style.dash))
        }
        for (p, label) in (
          ((-1.13, -0.17), $E$),
          ((1.12, -0.17), $F$),
          ((1.15, 2.15), $G$),
          ((-1.15, 2.15), $H$),
          ((0.47, 0.94), $M$),
          ((-0.55, 1.3), $S_1$),
          ((0.7, 0.5), $S_2$),
        ) { content(p, label) }
      })
      plot.add(
        ((0.25, 1),),
        style: (stroke: none),
        mark: "o",
        mark-size: 0.06,
        mark-style: (fill: black, stroke: none),
      )
    },
  )
})

#section[填空题：本大题共 14 题，每题 4 分，共 56 分。]
#question(
  "fill-in",
  score: 4,
  stem: [设 $x in RR$，则不等式 $abs(x-3)<1$ 的解集为#fill-placeholder()。],
  answers: ([$(2,4)$],),
  explanation: [由 $-1<x-3<1$，得 $2<x<4$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设 $z=(3+2i)/i$，其中 $i$ 为虚数单位，则 $op("Im") z=$#fill-placeholder()。],
  answers: ([$-3$],),
  explanation: [$z=(3+2i)(-i)=2-3i$，故虚部为 $-3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知平行直线 $l_1:2x+y-1=0$，$l_2:2x+y+1=0$，则 $l_1$ 与 $l_2$ 的距离是#fill-placeholder()。],
  answers: ([$(2 sqrt(5))/5$],),
  explanation: [两平行直线的距离为 $abs(1-(-1))/sqrt(2^2+1^2)=2/sqrt(5)=(2 sqrt(5))/5$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [某次体检，6 位同学的身高（单位：米）分别为 1.72，1.78，1.75，1.80，1.69，1.77，则这组数据的中位数是#fill-placeholder()（米）。],
  answers: ([$1.76$],),
  explanation: [从小到大排列为 $1.69,1.72,1.75,1.77,1.78,1.80$，中位数为 $(1.75+1.77)/2=1.76$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知点 $(3,9)$ 在函数 $f(x)=1+a^x$ 的图象上，则 $f(x)$ 的反函数 $f^(-1)(x)=$#fill-placeholder()。],
  answers: ([$log_2 (x-1)$，$x>1$],),
  explanation: [由 $9=1+a^3$ 得 $a=2$。

    ∵ $y=1+2^x$ 等价于 $x=log_2 (y-1)$，∴ 反函数为 $f^(-1)(x)=log_2 (x-1)$，定义域为 $(1,+infinity)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [如图，在正四棱柱 $A B C D-A_1 B_1 C_1 D_1$ 中，底面 $A B C D$ 的边长为 $3$，$B D_1$ 与底面所成角的大小为 $arctan 2/3$，则该正四棱柱的高等于#fill-placeholder()。
    #figure(prism())
  ],
  answers: ([$2 sqrt(2)$],),
  explanation: [连接 $B D$。∵ $D_1 D perp "平面" A B C D$，∴ $angle D_1 B D$ 为所给线面角。

    底面对角线 $B D=3 sqrt(2)$，故高 $D D_1=B D tan angle D_1 B D=3 sqrt(2) times 2/3=2 sqrt(2)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [方程 $3 sin x=1+cos 2x$ 在区间 $[0,2pi]$ 上的解为#fill-placeholder()。],
  answers: ([$x=pi/6$ 或 $x=(5pi)/6$],),
  explanation: [原方程等价于 $2 sin^2 x+3 sin x-2=0$，即 $(2 sin x-1)(sin x+2)=0$。

    ∵ $-1<=sin x<=1$，∴ $sin x=1/2$。在 $[0,2pi]$ 上得 $x=pi/6$ 或 $x=(5pi)/6$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [在 $(root(3, x)-2/x)^n$ 的二项展开式中，所有项的二项式系数之和为 $256$，则常数项等于#fill-placeholder()。],
  answers: ([$112$],),
  explanation: [由 $2^n=256$ 得 $n=8$。展开式的通项为
    $ T_(r+1)=C_8^r (x^(1/3))^(8-r)(-2/x)^r=C_8^r (-2)^r x^((8-4r)/3). $
    令 $8-4r=0$，得 $r=2$，故常数项为 $C_8^2 times 4=112$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知 $triangle A B C$ 的三边长为 $3,5,7$，则该三角形的外接圆半径等于#fill-placeholder()。],
  answers: ([$(7 sqrt(3))/3$],),
  explanation: [设长度为 $7$ 的边所对角为 $C$，则
    $ cos C=(3^2+5^2-7^2)/(2 times 3 times 5)=-1/2. $
    ∴ $C=(2pi)/3$，由正弦定理得外接圆半径 $R=7/(2 sin C)=(7 sqrt(3))/3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设 $a>0,b>0$，若关于 $x,y$ 的方程组 $cases(a x+y=1, x+b y=1)$ 无解，则 $a+b$ 的取值范围是#fill-placeholder()。],
  answers: ([$(2,+infinity)$],),
  explanation: [将第二式乘以 $a$ 再减去第一式，得 $(a b-1)y=a-1$。

    方程组无解等价于 $a b=1$ 且 $a!=1$，所以 $a+b=a+1/a>2$。

    反之，对任意 $s>2$，方程 $t^2-s t+1=0$ 有两个不同的正根。取其为 $a,b$，便有 $a b=1$、$a!=1$、$a+b=s$，故范围为 $(2,+infinity)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [无穷数列 $\{a_n\}$ 由 $k$ 个不同的数组成，$S_n$ 为 $\{a_n\}$ 的前 $n$ 项和，若对任意 $n in NN^*$，$S_n in {2,3}$，则 $k$ 的最大值为#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [∵ $a_1=S_1 in {2,3}$，当 $n>=2$ 时，$a_n=S_n-S_(n-1) in {-1,0,1}$，∴ $k<=4$。

    数列 $2,1,0,-1,0,0,dots$ 的前 $n$ 项和依次为 $2,3,3,2,2,2,dots$，符合条件且恰有 $4$ 个不同的数，故最大值为 $4$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [在平面直角坐标系中，已知 $A(1,0),B(0,-1)$，$P$ 是曲线 $y=sqrt(1-x^2)$ 上一个动点，则 $arrow(B P) dot arrow(B A)$ 的取值范围是#fill-placeholder()。],
  answers: ([$[0,1+sqrt(2)]$],),
  explanation: [设 $P(cos theta,sin theta)$，$theta in [0,pi]$，则
    $
      arrow(B P) dot arrow(B A)=(cos theta,sin theta+1) dot (1,1)=1+sqrt(2) sin(theta+pi/4).
    $
    ∵ $theta+pi/4 in [pi/4,(5pi)/4]$，∴ 所求范围为 $[0,1+sqrt(2)]$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设 $a,b in RR,c in [0,2pi)$，若对任意实数 $x$ 都有 $2 sin(3x-pi/3)=a sin(b x+c)$，则满足条件的有序实数组 $(a,b,c)$ 的组数为#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [由两边值域和最小正周期相同，得 $abs(a)=2$，$abs(b)=3$。

    分别取 $a=plus.minus 2$、$b=plus.minus 3$，利用诱导公式及 $c in [0,2pi)$，得到四组：
    $ (2,3,(5pi)/3), quad (-2,3,(2pi)/3), $
    $ (2,-3,(4pi)/3), quad (-2,-3,pi/3). $
    故共有 $4$ 组。],
)
#question(
  "fill-in",
  score: 4,
  stem: [如图，在平面直角坐标系 $x O y$ 中，$O$ 为正八边形 $A_1 A_2 dots A_8$ 的中心，$A_1(1,0)$，任取不同的两点 $A_i,A_j$，点 $P$ 满足 $arrow(O P)+arrow(O A_i)+arrow(O A_j)=arrow(0)$，则点 $P$ 落在第一象限的概率是#fill-placeholder()。
    #figure(octagon())
  ],
  answers: ([$5/28$],),
  explanation: [任取两个不同顶点共有 $C_8^2=28$ 种等可能取法。

    ∵ $arrow(O P)=-(arrow(O A_i)+arrow(O A_j))$，∴ $P$ 在第一象限等价于两顶点的横坐标之和、纵坐标之和都小于 $0$。

    符合条件的点对为 $(A_4,A_7),(A_5,A_6),(A_5,A_7),(A_5,A_8),(A_6,A_7)$，共 $5$ 对，故概率为 $5/28$。],
)

#section[选择题：本大题共 4 题，每题 5 分，共 20 分。每题只有一个选项符合题意。]
#question(
  "single-choice",
  score: 5,
  stem: [设 $a in RR$，则“$a>1$”是“$a^2>1$”的#choice-placeholder()。],
  choices: (
    [充分非必要条件],
    [必要非充分条件],
    [充要条件],
    [既非充分也非必要条件],
  ),
  answers: ([A],),
  explanation: [由 $a>1$ 能推出 $a^2>1$；反之，$a^2>1$ 还允许 $a< -1$，不能推出 $a>1$，故为充分非必要条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [下列极坐标方程中，对应的曲线为下图的是#choice-placeholder()。
    #figure(polar-curve())
  ],
  choices: (
    [$rho=6+5 cos theta$],
    [$rho=6+5 sin theta$],
    [$rho=6-5 cos theta$],
    [$rho=6-5 sin theta$],
  ),
  answers: ([D],),
  explanation: [图中曲线关于过极点且垂直于极轴的直线对称，且下方离极点更远。

    当 $theta=(3pi)/2$ 时，选项 D 中 $rho=11$，达到最大值；当 $theta=pi/2$ 时，$rho=1$，达到最小值，与图形一致。

    选项 A、C 关于极轴对称，选项 B 的最大极径出现在上方，均不符合。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知无穷等比数列 $\{a_n\}$ 的公比为 $q$，前 $n$ 项和为 $S_n$，且 $lim_(n->infinity) S_n=S$，下列条件中，使得 $2S_n<S quad (n in NN^*)$ 恒成立的是#choice-placeholder()。],
  choices: (
    [$a_1>0,0.6<q<0.7$],
    [$a_1<0,-0.7<q< -0.6$],
    [$a_1>0,0.7<q<0.8$],
    [$a_1<0,-0.8<q< -0.7$],
  ),
  answers: ([B],),
  explanation: [各选项均有 $abs(q)<1$，所以 $S=a_1/(1-q)$，$S_n=S(1-q^n)$。
    #step[排除正首项的情况][
      当 $a_1>0$ 时，$S>0$，原不等式等价于 $q^n>1/2$。∵ $q^n->0$，∴ 不可能对所有正整数 $n$ 成立，排除 A、C。
    ]
    #step[判断负首项的情况][
      当 $a_1<0$ 时，$S<0$，原不等式等价于 $q^n<1/2$。

      对 B，奇数次幂为负数；偶数次幂不超过 $q^2<0.49<1/2$，故恒成立。

      对 D，取 $q=-3/4$、$n=2$，有 $q^2=9/16>1/2$，故不能保证恒成立。
    ]
  ],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $f(x),g(x),h(x)$ 是定义域为 $RR$ 的三个函数，对于命题：

    ① 若 $f(x)+g(x),f(x)+h(x),g(x)+h(x)$ 均为增函数，则 $f(x),g(x),h(x)$ 中至少有一个为增函数；

    ② 若 $f(x)+g(x),f(x)+h(x),g(x)+h(x)$ 均是以 $T$ 为周期的函数，则 $f(x),g(x),h(x)$ 均是以 $T$ 为周期的函数。

    下列判断正确的是#choice-placeholder()。
  ],
  choices: (
    [①和②均为真命题],
    [①和②均为假命题],
    [①为真命题，②为假命题],
    [①为假命题，②为真命题],
  ),
  answers: ([D],),
  explanation: [
    #step[命题①是假命题][
      构造 $f(x)=x+2 sin x$，$g(x)=x+2 sin(x+(2pi)/3)$，$h(x)=x+2 sin(x+(4pi)/3)$。

      三者的导函数均具有 $1+2 cos u$ 的形式，在相应的区间内取负值，所以三者都不是 $RR$ 上的增函数。

      ∵ $f(x)+g(x)+h(x)=3x$，∴ 任意两者之和均具有 $2x-2 sin(x+alpha)$ 的形式，

      其导数为 $2-2 cos(x+alpha)>=0$，且零点孤立，故任意两者之和都严格递增。
    ]
    #step[命题②是真命题][
      记 $u=f+g,v=f+h,w=g+h$，则 $f=(u+v-w)/2$。

      ∵ $u,v,w$ 均以 $T$ 为周期，∴ $f(x+T)=f(x)$。同理，$g,h$ 也均以 $T$ 为周期。
    ]
  ],
)

#section[解答题：本大题共 5 题，共 74 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 12,
  stem: [将边长为 $1$ 的正方形 $A A_1 O_1 O$（及其内部）绕 $O O_1$ 旋转一周形成圆柱，如图，$overparen(A C)$ 长为 $(2pi)/3$，$overparen(A_1 B_1)$ 长为 $pi/3$，其中 $B_1$ 与 $C$ 在平面 $A A_1 O_1 O$ 的同侧。
    #figure(cylinder())
  ],
  parts: (
    subquestion(
      score: 6,
      stem: [求三棱锥 $C-O_1 A_1 B_1$ 的体积。],
      answers: ([$sqrt(3)/12$],),
      explanation: [圆柱的底面半径与高均为 $1$，由弧长得 $angle A_1 O_1 B_1=pi/3$。

        ∴ $S_(triangle O_1 A_1 B_1)=1/2 times 1 times 1 times sin pi/3=sqrt(3)/4$。

        点 $C$ 到上底面的距离为 $1$，所以三棱锥的体积为 $V=1/3 times sqrt(3)/4 times 1=sqrt(3)/12$。],
    ),
    subquestion(
      score: 6,
      stem: [求异面直线 $B_1 C$ 与 $A A_1$ 所成角的大小。],
      answers: ([$pi/4$],),
      explanation: [设 $B$ 为 $B_1$ 在下底面的射影，连接 $B C,O B,O C$。
        #figure(cylinder(auxiliary: true))
        ∵ $B B_1 parallel A A_1$，∴ 可用 $angle B B_1 C$ 表示所求异面直线的夹角。

        由两条弧的长度及同侧条件，得 $angle A O C=(2pi)/3$，$angle A O B=pi/3$，故 $angle B O C=pi/3$。

        ∵ $O B=O C=1$，∴ $triangle O B C$ 为等边三角形，$B C=1$。

        又 $B B_1=1$ 且 $B B_1 perp B C$，故 $triangle B B_1 C$ 为等腰直角三角形，所求角为 $pi/4$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [有一块正方形菜地 $E F G H$，$E H$ 所在直线是一条小河，收获的蔬菜可送到 $F$ 点或河边运走。于是，菜地分为两个区域 $S_1$ 和 $S_2$，其中 $S_1$ 中的蔬菜运到河边较近，$S_2$ 中的蔬菜运到 $F$ 点较近，而菜地内 $S_1$ 和 $S_2$ 的分界线 $C$ 上的点到河边与到 $F$ 点的距离相等，现建立平面直角坐标系，其中原点 $O$ 为 $E F$ 的中点，点 $F$ 的坐标为 $(1,0)$，如图。
    #figure(vegetable-field())
  ],
  parts: (
    subquestion(
      score: 6,
      stem: [求菜地内的分界线 $C$ 的方程。],
      answers: ([$y^2=4x quad (0<y<2)$],),
      explanation: [正方形的顶点为 $E(-1,0),F(1,0),G(1,2),H(-1,2)$，河边所在直线为 $x=-1$。

        设分界线上一点为 $(x,y)$，则 $x+1=sqrt((x-1)^2+y^2)$。

        两边平方化简，得 $y^2=4x$。取菜地内部的部分，分界线方程为 $y^2=4x quad (0<y<2)$。

        若将边界端点 $O,G$ 也计入，则范围写为 $0<=y<=2$。],
    ),
    subquestion(
      score: 8,
      stem: [菜农从蔬菜运量估计出 $S_1$ 面积是 $S_2$ 面积的两倍，由此得到 $S_1$ 面积的“经验值”为 $8/3$。设 $M$ 是 $C$ 上纵坐标为 $1$ 的点，请计算以 $E H$ 为一边，另一边过点 $M$ 的矩形的面积，及五边形 $E O M G H$ 的面积，并判断哪一个更接近于 $S_1$ 面积的经验值。],
      answers: (
        [矩形面积为 $5/2$，五边形面积为 $11/4$，五边形面积更接近经验值。],
      ),
      explanation: [由 $y_M=1$ 得 $M(1/4,1)$。
        #figure(vegetable-field(auxiliary: true))

        所求矩形的长为 $2$，宽为 $1+1/4=5/4$，面积为 $2 times 5/4=5/2$。

        从正方形中去掉三角形 $O F M$ 和 $M F G$，得到五边形 $E O M G H$，其面积为
        $ 4-1/2 times 1 times 1-1/2 times 2 times (1-1/4)=11/4. $
        ∵ $abs(5/2-8/3)=1/6$，$abs(11/4-8/3)=1/12<1/6$，∴ 五边形的面积更接近经验值。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [双曲线 $x^2-y^2/b^2=1 quad (b>0)$ 的左、右焦点分别为 $F_1,F_2$，直线 $l$ 过 $F_2$ 且与双曲线交于 $A,B$ 两点。],
  parts: (
    subquestion(
      score: 6,
      stem: [若 $l$ 的倾斜角为 $pi/2$，$triangle F_1 A B$ 是等边三角形，求双曲线的渐近线方程。],
      answers: ([$y=plus.minus sqrt(2)x$],),
      explanation: [设半焦距为 $c$，则 $c^2=1+b^2$，直线 $l$ 的方程为 $x=c$。

        代入双曲线方程，得 $y^2=b^2(c^2-1)=b^4$，所以可设 $A(c,b^2),B(c,-b^2)$。

        等边三角形的边长 $A B=2b^2$，其对应高为 $F_1 F_2=2c$，故 $sqrt(3)b^2=2c$。

        ∴ $3b^4=4(1+b^2)$，即 $(3b^2+2)(b^2-2)=0$。

        ∵ $b>0$，∴ $b=sqrt(2)$，渐近线为 $y=plus.minus sqrt(2)x$。],
    ),
    subquestion(
      score: 8,
      stem: [设 $b=sqrt(3)$，若 $l$ 的斜率存在，且 $(arrow(F_1 A)+arrow(F_1 B)) dot arrow(A B)=0$，求 $l$ 的斜率。],
      answers: ([$plus.minus sqrt(15)/5$],),
      explanation: [此时 $F_1(-2,0),F_2(2,0)$。设 $l:y=k(x-2)$，$A(x_1,y_1),B(x_2,y_2)$。
        #step[求弦的中点][
          联立直线与双曲线，得
          $ (3-k^2)x^2+4k^2 x-4k^2-3=0. $
          当 $k^2=3$ 时只有一个交点，不符合题意，故 $k^2!=3$。

          由韦达定理，$x_1+x_2=-(4k^2)/(3-k^2)$。设 $M$ 为 $A B$ 中点，则
          $ M lr((- (2k^2)/(3-k^2),- (6k)/(3-k^2))). $
        ]
        #step[利用垂直条件][
          ∵ $arrow(F_1 A)+arrow(F_1 B)=2 arrow(F_1 M)$，且 $(1,k)$ 是 $A B$ 的方向向量，∴
          $ -(2k^2)/(3-k^2)+2-(6k^2)/(3-k^2)=0. $
          化简得 $6-10k^2=0$，所以 $k=plus.minus sqrt(15)/5$。

          此时 $3-k^2!=0$，且交点方程的判别式 $Delta=36(1+k^2)>0$，确有两个不同交点，故两值均符合题意。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知 $a in RR$，函数 $f(x)=log_2 (1/x+a)$。],
  parts: (
    subquestion(
      score: 4,
      stem: [当 $a=5$ 时，解不等式 $f(x)>0$。],
      answers: ([$(-infinity,-1/4) union (0,+infinity)$],),
      explanation: [∵ 对数底数 $2>1$，∴ 原不等式等价于 $1/x+5>1$，即 $(4x+1)/x>0$。

        解得 $x< -1/4$ 或 $x>0$，此时真数均大于 $1$，故解集为 $(-infinity,-1/4) union (0,+infinity)$。],
    ),
    subquestion(
      score: 6,
      stem: [若关于 $x$ 的方程 $f(x)-log_2 [(a-4)x+2a-5]=0$ 的解集中恰有一个元素，求 $a$ 的取值范围。],
      answers: ([$(1,2] union {3,4}$],),
      explanation: [原方程等价于 $1/x+a=(a-4)x+2a-5>0$，其中 $x!=0$。

        整理等式，得 $(x+1)[(a-4)x-1]=0$。
        #step[检查两个候选根的定义域][
          $x=-1$ 是原方程的解，当且仅当 $a-1>0$，即 $a>1$。

          当 $a!=4$ 时，另一个候选根为 $x=1/(a-4)$；它是原方程的解，当且仅当 $2a-4>0$，即 $a>2$。
        ]
        #step[区分重根和降次情况][
          当 $a=3$ 时，两个候选根重合于 $-1$，且满足定义域，故恰有一解。

          当 $a=4$ 时，等式降为一次方程，也只有解 $x=-1$。

          当 $a in.not {3,4}$ 时，恰有一解当且仅当 $1<a<=2$：此时只有 $x=-1$ 有效；$a<=1$ 时无解，$a>2$ 时两根都有效且不同。

          综上，$a in (1,2] union {3,4}$。
        ]
      ],
    ),
    subquestion(
      score: 6,
      stem: [设 $a>0$，若对任意 $t in [1/2,1]$，函数 $f(x)$ 在区间 $[t,t+1]$ 上的最大值和最小值的差不超过 $1$，求 $a$ 的取值范围。],
      answers: ([$[2/3,+infinity)$],),
      explanation: [当 $x>0$ 时，$1/x+a>0$ 且随 $x$ 增大而减小，故 $f(x)$ 严格递减。

        所给最值之差为 $f(t)-f(t+1)$，于是
        $ f(t)-f(t+1)<=1 <=> (a+1/t)/(a+1/(t+1))<=2 <=> a>=(1-t)/(t(t+1)). $
        在 $[1/2,1]$ 上，分子 $1-t$ 非负且递减，分母 $t(t+1)$ 为正且递增，所以右端最大值在 $t=1/2$ 处取得，等于 $2/3$。

        因此所求范围为 $[2/3,+infinity)$。],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [若无穷数列 $\{a_n\}$ 满足：只要 $a_p=a_q quad (p,q in NN^*)$，必有 $a_(p+1)=a_(q+1)$，则称 $\{a_n\}$ 具有性质 $P$。],
  parts: (
    subquestion(
      score: 4,
      stem: [若 $\{a_n\}$ 具有性质 $P$，且 $a_1=1,a_2=2,a_4=3,a_5=2,a_6+a_7+a_8=21$，求 $a_3$。],
      answers: ([$16$],),
      explanation: [由 $a_2=a_5$ 及性质 $P$，依次得到 $a_3=a_6$，$a_4=a_7$，$a_5=a_8$。

        所以 $a_3+3+2=21$，即 $a_3=16$。],
    ),
    subquestion(
      score: 6,
      stem: [若无穷数列 $\{b_n\}$ 是等差数列，无穷数列 $\{c_n\}$ 是公比为正数的等比数列，$b_1=c_5=1,b_5=c_1=81,a_n=b_n+c_n$，判断 $\{a_n\}$ 是否具有性质 $P$，并说明理由。],
      answers: ([不具有性质 $P$。],),
      explanation: [设公差为 $d$、公比为 $q$，则 $1+4d=81$，$81q^4=1$。

        ∵ $q>0$，∴ $d=20$，$q=1/3$，从而
        $ b_n=20n-19, quad c_n=3^(5-n), quad a_n=20n-19+3^(5-n). $
        于是 $a_1=a_5=82$，但 $a_2=48$，$a_6=101+1/3=304/3$，即 $a_2!=a_6$。

        故 $\{a_n\}$ 不具有性质 $P$。],
    ),
    subquestion(
      score: 8,
      stem: [设 $\{b_n\}$ 是无穷数列，已知 $a_(n+1)=b_n+sin a_n quad (n in NN^*)$，求证：“对任意 $a_1$，$\{a_n\}$ 都具有性质 $P$”的充要条件为“$\{b_n\}$ 是常数列”。],
      answers: ([证明见解析。],),
      explanation: [
        #step[充分性][
          若 $b_n=b$ 对所有 $n in NN^*$ 成立，则只要 $a_p=a_q$，就有
          $ a_(p+1)=b+sin a_p=b+sin a_q=a_(q+1). $
          因而无论首项为何值，$\{a_n\}$ 都具有性质 $P$。
        ]
        #step[必要性][
          先说明存在实数 $u$ 使 $u=b_1+sin u$。

          令 $F(x)=x-sin x-b_1$，它是连续函数，且
          $ F(b_1-1)=-1-sin(b_1-1)<=0, $
          $ F(b_1+1)=1-sin(b_1+1)>=0. $
          由连续函数的零点存在性，可取 $u in [b_1-1,b_1+1]$ 使 $F(u)=0$。

          现在取 $a_1=u$，则 $a_2=b_1+sin u=u=a_1$。由题设，这个首项对应的数列也具有性质 $P$。

          由 $a_1=a_2$ 逐次推出 $a_2=a_3,a_3=a_4,dots$，所以对任意 $n$，均有 $a_n=u$。

          代入递推式，得 $b_n=a_(n+1)-sin a_n=u-sin u=b_1$，故 $\{b_n\}$ 是常数列。
        ]
        综上，充要条件得证。
      ],
    ),
  ),
)
