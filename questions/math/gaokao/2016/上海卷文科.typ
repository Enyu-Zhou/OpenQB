#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016上海文.pdf",
  regions: ("上海",),
)

#let cube() = cetz.canvas(length: 30mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (0, 0, 0)
  let B = (1, 0, 0)
  let C = (1, 1, 0)
  let D = (0, 1, 0)
  let A1 = (0, 0, 1)
  let B1 = (1, 0, 1)
  let C1 = (1, 1, 1)
  let D1 = (0, 1, 1)
  let E = (1, 0.5, 0)
  let F = (1, 0, 0.5)
  oblique-project((0.9, 0), (0.32, 0.32), (0, 1), {
    line(A, B, C, C1, D1, A1, A)
    line(A1, B1, C1)
    line(B, B1)
    line(A, D, C, stroke: (dash: figure-style.dash))
    line(D, D1, stroke: (dash: figure-style.dash))
    for p in (E, F) { circle(p, radius: 0.018, fill: black, stroke: none) }
    for (p, label, anchor) in (
      (A, $A$, "north-east"),
      (B, $B$, "north"),
      (C, $C$, "west"),
      (D, $D$, "east"),
      (A1, $A_1$, "east"),
      (B1, $B_1$, "south-east"),
      (C1, $C_1$, "south-west"),
      (D1, $D_1$, "south"),
      (E, $E$, "north-west"),
      (F, $F$, "west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})
#let semicircle() = cetz.canvas(length: 16mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    shared-zero: $O$,
  ))
  plot.plot(
    size: (3, 2.8),
    axis-style: "school-book",
    x-min: -1.5,
    x-max: 1.5,
    y-min: -1.4,
    y-max: 1.4,
    x-tick-step: none,
    y-tick-step: none,
    x-label: $x$,
    y-label: $y$,
    {
      plot.annotate(resize: false, {
        line(..range(181).map(i => (calc.cos(i * 1deg), calc.sin(i * 1deg))))
        line((0, 0), (-calc.sqrt(2) / 2, calc.sqrt(2) / 2), mark: (end: ">"))
        line((0, -1), (1, 0), mark: (end: ">"))
        content((-0.93, 0.83), $P$)
        content((1.15, -0.16), $A$)
        content((-0.18, -1.05), $B$)
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
  let C = (-calc.sqrt(3) / 2, 0.5, 0)
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
    line(O, C, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(O, B, stroke: (dash: figure-style.dash))
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
  stem: [设 $z=(3+2i)/i$，其中 $i$ 为虚数单位，则 $z$ 的虚部等于#fill-placeholder()。],
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
  stem: [某次体检，5 位同学的身高（单位：米）分别为 1.72，1.78，1.80，1.69，1.76，则这组数据的中位数是#fill-placeholder()（米）。],
  answers: ([$1.76$],),
  explanation: [从小到大排列为 $1.69,1.72,1.76,1.78,1.80$，中间的第 $3$ 个数为 $1.76$，即中位数。],
)
#question(
  "fill-in",
  score: 4,
  stem: [若函数 $f(x)=4 sin x+a cos x$ 的最大值为 $5$，则常数 $a=$#fill-placeholder()。],
  answers: ([$plus.minus 3$],),
  explanation: [由辅助角公式，可将 $f(x)$ 写为 $sqrt(16+a^2) sin(x+phi)$，所以最大值为 $sqrt(16+a^2)$。

    ∴ $16+a^2=25$，解得 $a=plus.minus 3$。],
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
  stem: [若 $x,y$ 满足 $cases(x>=0, y>=0, y>=x+1)$，则 $x-2y$ 的最大值为#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [∵ $y>=x+1$ 且 $x>=0$，∴ $x-2y<=x-2(x+1)=-x-2<=-2$。

    当 $x=0,y=1$ 时等号成立，且满足全部约束，故最大值为 $-2$。],
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
  stem: [某食堂规定，每份午餐可以在四种水果中任选两种，则甲、乙两同学各自所选的两种水果相同的概率为#fill-placeholder()。],
  answers: ([$1/6$],),
  explanation: [每人有 $C_4^2=6$ 种选法，两人独立选择共有 $6^2=36$ 种等可能结果，其中两人所选相同的有 $6$ 种，故概率为 $6/36=1/6$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [如图，已知点 $O(0,0),A(1,0),B(0,-1)$，$P$ 是曲线 $y=sqrt(1-x^2)$ 上一个动点，则 $arrow(O P) dot arrow(B A)$ 的取值范围是#fill-placeholder()。
    #figure(semicircle())
  ],
  answers: ([$[-1,sqrt(2)]$],),
  explanation: [设 $P(cos theta,sin theta)$，$theta in [0,pi]$，则
    $
      arrow(O P) dot arrow(B A)=(cos theta,sin theta) dot (1,1)=sqrt(2) sin(theta+pi/4).
    $
    ∵ $theta+pi/4 in [pi/4,(5pi)/4]$，∴ 所求范围为 $[-1,sqrt(2)]$。],
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
  stem: [如图，在正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$E,F$ 分别为 $B C,B B_1$ 的中点，则下列直线中与直线 $E F$ 相交的是#choice-placeholder()。
    #figure(cube())
  ],
  choices: (
    [直线 $A A_1$],
    [直线 $A_1 B_1$],
    [直线 $A_1 D_1$],
    [直线 $B_1 C_1$],
  ),
  answers: ([D],),
  explanation: [在平面 $B C C_1 B_1$ 内，$E F$ 是 $triangle B B_1 C$ 的中位线，故 $E F parallel B_1 C$。

    ∵ $B_1 C$ 与 $B_1 C_1$ 不平行，∴ 共面的直线 $E F$ 与 $B_1 C_1$ 也不平行，必相交。

    $A A_1,A_1 D_1$ 均平行于平面 $B C C_1 B_1$，不能与其中的 $E F$ 相交；$A_1 B_1$ 与该平面只交于 $B_1$，而 $B_1$ 不在 $E F$ 上，也不相交。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $a in RR,b in [0,2pi)$。若对任意实数 $x$ 都有 $sin(3x-pi/3)=sin(a x+b)$，则满足条件的有序实数对 $(a,b)$ 的对数为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([B],),
  explanation: [由最小正周期相同，得 $abs(a)=3$。

    当 $a=3$ 时，$b=(5pi)/3$；当 $a=-3$ 时，由 $sin u=sin(pi-u)$ 得 $b=(4pi)/3$。

    结合 $b in [0,2pi)$，只有 $(3,(5pi)/3)$ 与 $(-3,(4pi)/3)$ 两组。],
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
  stem: [将边长为 $1$ 的正方形 $A A_1 O_1 O$（及其内部）绕 $O O_1$ 旋转一周形成圆柱，如图，$overparen(A C)$ 长为 $(5pi)/6$，$overparen(A_1 B_1)$ 长为 $pi/3$，其中 $B_1$ 与 $C$ 在平面 $A A_1 O_1 O$ 的同侧。
    #figure(cylinder())
  ],
  parts: (
    subquestion(
      score: 6,
      stem: [求圆柱的体积与侧面积。],
      answers: ([体积为 $pi$，侧面积为 $2pi$。],),
      explanation: [圆柱的底面半径 $r=1$，高 $h=1$，所以体积 $V=pi r^2 h=pi$，侧面积 $S=2pi r h=2pi$。],
    ),
    subquestion(
      score: 6,
      stem: [求异面直线 $O_1 B_1$ 与 $O C$ 所成的角的大小。],
      answers: ([$pi/2$],),
      explanation: [设 $B$ 为 $B_1$ 在下底面的射影，连接 $O B$。
        #figure(cylinder(auxiliary: true))
        ∵ $O_1 B_1 parallel O B$，∴ 可用 $angle B O C$ 或其补角表示所求异面直线的夹角。

        由半径为 $1$ 及弧长条件，得 $angle A O C=(5pi)/6$，$angle A O B=angle A_1 O_1 B_1=pi/3$。

        ∵ $B,C$ 在平面 $A A_1 O_1 O$ 的同侧，∴ $angle B O C=(5pi)/6-pi/3=pi/2$。

        故所求角为 $pi/2$。],
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
      stem: [设 $b=sqrt(3)$，若 $l$ 的斜率存在，且 $abs(A B)=4$，求 $l$ 的斜率。],
      answers: ([$plus.minus sqrt(15)/5$],),
      explanation: [此时 $F_2(2,0)$。设 $l:y=k(x-2)$，交点为 $A(x_1,y_1),B(x_2,y_2)$。
        #step[求弦长表达式][
          将直线方程代入双曲线方程，得
          $ (3-k^2)x^2+4k^2 x-4k^2-3=0. $
          ∵ 有两个不同交点，∴ $k^2!=3$。方程的判别式为 $Delta=36(1+k^2)>0$，故
          $ abs(x_1-x_2)=sqrt(Delta)/abs(3-k^2)=(6 sqrt(1+k^2))/abs(3-k^2). $
          ∴ $abs(A B)=sqrt(1+k^2) abs(x_1-x_2)=(6(1+k^2))/abs(3-k^2)$。
        ]
        #step[解斜率方程][
          令弦长等于 $4$，得 $3(1+k^2)=2 abs(3-k^2)$。

          当 $k^2<3$ 时，$3+3k^2=6-2k^2$，解得 $k^2=3/5$。

          当 $k^2>3$ 时，$3+3k^2=2k^2-6$，无解。

          因此 $k=plus.minus sqrt(15)/5$。这两个值均使交点方程有两个不同实根，并满足弦长条件。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [对于无穷数列 $\{a_n\}$ 与 $\{b_n\}$，记 $A={x | x=a_n,n in NN^*}$，$B={x | x=b_n,n in NN^*}$，若同时满足条件：① $\{a_n\},\{b_n\}$ 均单调递增；② $A inter B=emptyset$ 且 $A union B=NN^*$，则称 $\{a_n\}$ 与 $\{b_n\}$ 是无穷互补数列。],
  parts: (
    subquestion(
      score: 4,
      stem: [若 $a_n=2n-1,b_n=4n-2$，判断 $\{a_n\}$ 与 $\{b_n\}$ 是否为无穷互补数列，并说明理由。],
      answers: ([不是无穷互补数列。],),
      explanation: [∵ $4 in.not A$，且 $4 in.not B$，∴ $4 in.not A union B$，不满足 $A union B=NN^*$，故不是无穷互补数列。],
    ),
    subquestion(
      score: 6,
      stem: [若 $a_n=2^n$ 且 $\{a_n\}$ 与 $\{b_n\}$ 是无穷互补数列，求数列 $\{b_n\}$ 的前 $16$ 项的和。],
      answers: ([$180$],),
      explanation: [在 $1$ 至 $20$ 中，属于 $A$ 的恰有 $2,4,8,16$ 四个数，其余 $16$ 个数按递增顺序排列，就是 $\{b_n\}$ 的前 $16$ 项。

        ∴ 所求和为 $sum_(n=1)^16 b_n=(20 times 21)/2-(2+4+8+16)=180$。],
    ),
    subquestion(
      score: 6,
      stem: [若 $\{a_n\}$ 与 $\{b_n\}$ 是无穷互补数列，$\{a_n\}$ 为等差数列且 $a_16=36$，求 $\{a_n\}$ 与 $\{b_n\}$ 的通项公式。],
      answers: (
        [$a_n=2n+4$，$b_n=cases(n & quad 1<=n<=5, 2n-5 & quad n>=6)$。],
      ),
      explanation: [由互补条件，$a_n,b_n$ 都是正整数。设 $\{a_n\}$ 的公差为 $d$，由严格递增性得 $d in NN^*$。

        ∵ $a_1+15d=36$ 且 $a_1>=1$，∴ $d=1$ 或 $d=2$。
        #step[排除公差为 1][
          若 $d=1$，则 $a_1=21$，$A={21,22,23,dots}$。

          于是 $B={1,2,dots,20}$，无法排成无穷严格递增数列，与题设矛盾。
        ]
        #step[确定两列的通项][
          若 $d=2$，则 $a_1=6$，$a_n=2n+4$，$A$ 是所有不小于 $6$ 的偶数构成的集合。

          其补集按递增顺序排列为 $1,2,3,4,5,7,9,11,dots$，故
          $ b_n=cases(n & quad 1<=n<=5, 2n-5 & quad n>=6). $
          这两列均严格递增，项的集合不相交且并集为 $NN^*$，符合全部条件。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知 $a in RR$，函数 $f(x)=log_2 (1/x+a)$。],
  parts: (
    subquestion(
      score: 4,
      stem: [当 $a=1$ 时，解不等式 $f(x)>1$。],
      answers: ([$(0,1)$],),
      explanation: [由 $log_2 (1/x+1)>1$，得 $1/x+1>2$，即 $(1-x)/x>0$。

        解得 $0<x<1$，此时对数真数为正，故解集为 $(0,1)$。],
    ),
    subquestion(
      score: 6,
      stem: [若关于 $x$ 的方程 $f(x)+log_2 (x^2)=0$ 的解集中恰有一个元素，求 $a$ 的值。],
      answers: ([$0$ 或 $-1/4$],),
      explanation: [原方程要求 $x!=0$ 且 $1/x+a>0$。合并对数得 $(1/x+a)x^2=1$，即 $a x^2+x-1=0$。

        反过来，这个方程的任何实根都不为 $0$，且满足 $1/x+a=1/x^2>0$，所以均为原方程的解。

        当 $a=0$ 时，方程为 $x-1=0$，恰有一解。

        当 $a!=0$ 时，二次方程恰有一个实根等价于 $Delta=1+4a=0$，得 $a=-1/4$。

        综上，$a=0$ 或 $a=-1/4$。],
    ),
    subquestion(
      score: 8,
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
