#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2022/2022北京.pdf",
  regions: ("北京",),
)

#let phase-diagram() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.15,
      shared-zero: false,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
    ))
    plot.plot(
      size: (7.6, 6.3),
      axis-style: "school-book",
      x-min: 200,
      x-max: 430,
      y-min: 0,
      y-max: 4.6,
      x-tick-step: none,
      x-ticks: (200, 250, 300, 350, 400),
      y-tick-step: none,
      y-ticks: (0, 1, 2, 3, 4),
      x-label: $T$,
      y-label: $lg P$,
      {
        plot.annotate(resize: false, {
          line((200, 4), (400, 4), (400, 0))
          bezier((200, 0.3), (215, 0.7), (203, 0.41), (209, 0.58))
          bezier((215, 0.7), (300, 2), (240, 1.25), (275, 1.77))
          line((215, 0.7), (215, 2.2))
          bezier((215, 2.2), (300, 3.82), (217, 3.15), (263, 3.55))
          bezier((300, 3.82), (340, 4), (315, 3.95), (330, 4))
          line((300, 3.82), (300, 2), (400, 2), stroke: (
            dash: figure-style.dash,
          ))
          content((227, 3.55), [固态])
          content((257, 2.5), [液态])
          content((310, 1.05), [气态])
          content((351, 3), [超临界状态])
        })
      },
    )
  })
}

#let section-diagram() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  let r = calc.sqrt(3)
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  line((-3, -r), (3, -r), (0, 2 * r), close: true)
  circle((0, 0), radius: 1)
  line((0, 0), (0, -r), stroke: (dash: figure-style.dash))
  content((0, 0), $O$, anchor: "south-east", padding: 0.08)
  content((0, -r), $D$, anchor: "north", padding: 0.08)
  content((-3, -r), $A$, anchor: "north-east", padding: 0.1)
  content((3, -r), $B$, anchor: "north-west", padding: 0.1)
  content((0, 2 * r), $C$, anchor: "south", padding: 0.1)
})

#let prism-diagram() = cetz.canvas(length: 19mm, {
  import cetz.draw: *
  let b = (0, 0, 0)
  let a = (0, 2, 0)
  let c = (2, 0, 0)
  let b1 = (0, 0, 2)
  let a1 = (0, 2, 2)
  let c1 = (2, 0, 2)
  let m = (0, 1, 2)
  let n = (1, 1, 0)
  oblique-project((-0.55, -0.45), (1, 0), (0, 1.1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(c, a, a1, b1, c1, c)
    line(c1, a1)
    line(a, b, c, stroke: (dash: figure-style.dash))
    line(b1, b, m, n, b, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "west"),
      (b, $B$, "south-east"),
      (c, $C$, "north-east"),
      (a1, $A_1$, "west"),
      (b1, $B_1$, "south"),
      (c1, $C_1$, "east"),
      (m, $M$, "south"),
      (n, $N$, "north"),
    ) { content(p, label, anchor: anchor, padding: 0.1) }
  })
})

#section[选择题。本大题共 10 小题，每小题 4 分，共 40 分。在每小题列出的四个选项中，选出符合题目要求的一项。]
#question(
  "single-choice",
  stem: [已知全集 $U={x | -3<x<3}$，集合 $A={x | -2<x<=1}$，则 $complement_U A=$#choice-placeholder()。],
  choices: (
    [$(-2,1]$],
    [$(-3,-2) union [1,3)$],
    [$[-2,1)$],
    [$(-3,-2] union (1,3)$],
  ),
  answers: ([D],),
  explanation: [从 $U=(-3,3)$ 中去掉 $A=(-2,1]$，剩余 $(-3,-2] union (1,3)$。注意 $-2$ 属于补集，而 1 不属于补集。],
)
#question(
  "single-choice",
  stem: [若复数 $z$ 满足 $i dot z=3-4i$，则 $|z|=$#choice-placeholder()。],
  choices: ([$1$], [$5$], [$7$], [$25$]),
  answers: ([B],),
  explanation: [取模得 $|i| |z|=|3-4i|=sqrt(3^2+4^2)=5$，而 $|i|=1$，故 $|z|=5$。],
)
#question(
  "single-choice",
  stem: [若直线 $2x+y-1=0$ 是圆 $(x-a)^2+y^2=1$ 的一条对称轴，则 $a=$#choice-placeholder()。],
  choices: ([$1/2$], [$-1/2$], [$1$], [$-1$]),
  answers: ([A],),
  explanation: [圆的对称轴过圆心 $(a,0)$，代入直线方程得 $2a-1=0$，故 $a=1/2$。],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x)=1/(1+2^x)$，则对任意实数 $x$，有#choice-placeholder()。],
  choices: (
    [$f(-x)+f(x)=0$],
    [$f(-x)-f(x)=0$],
    [$f(-x)+f(x)=1$],
    [$f(-x)-f(x)=1/3$],
  ),
  answers: ([C],),
  explanation: [$f(-x)=1/(1+2^(-x))=2^x/(1+2^x)$，所以 $f(-x)+f(x)=1$ 恒成立。],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x)=cos^2 x-sin^2 x$，则#choice-placeholder()。],
  choices: (
    [$f(x)$ 在 $(-pi/2,-pi/6)$ 上单调递减],
    [$f(x)$ 在 $(-pi/4,pi/12)$ 上单调递增],
    [$f(x)$ 在 $(0,pi/3)$ 上单调递减],
    [$f(x)$ 在 $(pi/4,(7pi)/12)$ 上单调递增],
  ),
  answers: ([C],),
  explanation: [$f(x)=cos 2x$。A 所给区间内 $2x in (-pi,-pi/3)$，函数递增；B 所给区间跨过极大值点 0，先增后减；C 所给区间内 $2x in (0,(2pi)/3)$，函数递减；D 所给区间跨过极小值点 $pi/2$，先减后增。故选 C。],
)
#question(
  "single-choice",
  stem: [设 ${a_n}$ 是公差不为 0 的无穷等差数列，则“${a_n}$ 为递增数列”是“存在正整数 $N_0$，当 $n>N_0$ 时，$a_n>0$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([C],),
  explanation: [设公差为 $d!=0$。数列递增等价于 $d>0$，此时 $a_n=a_1+(n-1)d$ 最终为正；若 $d<0$，则 $a_n$ 最终为负，不可能满足后一条件。因此两条件等价。],
)
#question(
  "single-choice",
  stem: [在北京冬奥会上，国家速滑馆“冰丝带”使用高效环保的二氧化碳跨临界直冷制冰技术，为实现绿色冬奥作出了贡献。如图描述了一定条件下二氧化碳所处的状态与 $T$ 和 $lg P$ 的关系，其中 $T$ 表示温度，单位是 K；$P$ 表示压强，单位是 bar。下列结论中正确的是#choice-placeholder()。
    #figure(phase-diagram())
  ],
  choices: (
    [当 $T=220$，$P=1026$ 时，二氧化碳处于液态],
    [当 $T=270$，$P=128$ 时，二氧化碳处于气态],
    [当 $T=300$，$P=9987$ 时，二氧化碳处于超临界状态],
    [当 $T=360$，$P=729$ 时，二氧化碳处于超临界状态],
  ),
  answers: ([D],),
  explanation: [图中纵坐标是 $lg P$。四个选项对应的纵坐标分别约为 3.01、2.11、4.00、2.86，结合温度在图中定位，依次落在固态、液态、固态、超临界状态区域。因此只有 D 正确。],
)
#question(
  "single-choice",
  stem: [若 $(2x-1)^4=a_4 x^4+a_3 x^3+a_2 x^2+a_1 x+a_0$，则 $a_0+a_2+a_4=$#choice-placeholder()。],
  choices: ([$40$], [$41$], [$-40$], [$-41$]),
  answers: ([B],),
  explanation: [分别令 $x=1$、$x=-1$ 并将两式相加，奇次项抵消，得 $2(a_0+a_2+a_4)=1+81=82$，故所求为 41。],
)
#question(
  "single-choice",
  stem: [已知正三棱锥 $P-A B C$ 的六条棱长均为 6，$S$ 是 $triangle A B C$ 及其内部的点构成的集合。设集合 $T={Q in S | P Q<=5}$，则 $T$ 表示的区域的面积为#choice-placeholder()。],
  choices: ([$(3pi)/4$], [$pi$], [$2pi$], [$3pi$]),
  answers: ([B],),
  explanation: [设 $O$ 为底面中心，则 $O A=6/sqrt(3)=2sqrt(3)$，棱锥高 $P O=sqrt(6^2-O A^2)=2sqrt(6)$。对底面上的点 $Q$，有 $P Q^2=P O^2+O Q^2=24+O Q^2$，所以 $P Q<=5$ 等价于 $O Q<=1$。
    底面正三角形的内切圆半径为 $sqrt(3)>1$，故半径为 1 的整个圆盘都在底面内，所求面积为 $pi$。
    #figure(section-diagram())
  ],
)
#question(
  "single-choice",
  stem: [在 $triangle A B C$ 中，$A C=3$，$B C=4$，$angle C=90 degree$。$P$ 为 $triangle A B C$ 所在平面内的动点，且 $P C=1$，则 $arrow(P A) dot arrow(P B)$ 的取值范围是#choice-placeholder()。],
  choices: ([$[-5,3]$], [$[-3,5]$], [$[-6,4]$], [$[-4,6]$]),
  answers: ([D],),
  explanation: [以 $C$ 为原点，$C A$、$C B$ 为坐标轴正方向，则 $A=(3,0)$、$B=(0,4)$，可设 $P=(cos theta,sin theta)$。于是
    $
      arrow(P A) dot arrow(P B)=cos^2 theta+sin^2 theta-3cos theta-4sin theta=1-3cos theta-4sin theta.
    $
    因 $3cos theta+4sin theta$ 的取值范围为 $[-5,5]$，故所求范围为 $[-4,6]$。
  ],
)

#section[填空题。本大题共 5 小题，每小题 5 分，共 25 分。]
#question(
  "fill-in",
  stem: [函数 $f(x)=1/x+sqrt(1-x)$ 的定义域是#fill-placeholder()。],
  answers: ([$(-infinity,0) union (0,1]$],),
  explanation: [需同时满足 $x!=0$、$1-x>=0$，故定义域为 $(-infinity,0) union (0,1]$。],
)
#question(
  "fill-in",
  stem: [已知双曲线 $y^2+x^2/m=1$ 的渐近线方程为 $y=+-sqrt(3)/3 x$，则 $m=$#fill-placeholder()。],
  answers: ([$-3$],),
  explanation: [双曲线要求 $m<0$，方程为 $y^2-x^2/(-m)=1$，渐近线为 $y=+-x/sqrt(-m)$。所以 $1/sqrt(-m)=sqrt(3)/3$，解得 $m=-3$。],
)
#question(
  "fill-in",
  stem: [若函数 $f(x)=A sin x-sqrt(3)cos x$ 的一个零点为 $pi/3$，则 $A=$#fill-placeholder()；$f(pi/12)=$#fill-placeholder()。],
  answers: ([$1$], [$-sqrt(2)$]),
  explanation: [由 $f(pi/3)=0$ 得 $(sqrt(3))/2 A-sqrt(3)/2=0$，所以 $A=1$。因此 $f(x)=2sin(x-pi/3)$，$f(pi/12)=2sin(-pi/4)=-sqrt(2)$。],
)
#question(
  "fill-in",
  stem: [设函数 $f(x)=cases(-a x+1 & quad x<a, (x-2)^2 & quad x>=a)$，若 $f(x)$ 存在最小值，则 $a$ 的一个取值为#fill-placeholder()；$a$ 的最大值为#fill-placeholder()。],
  answers: ([$0$（答案不唯一，$[0,1]$ 内任一实数均可）], [$1$]),
  explanation: [
    #step[讨论 $a<=0$][
      若 $a<0$，左侧分支随 $x$ 趋于负无穷而趋于负无穷，无最小值。若 $a=0$，左侧恒为 1，右侧在 $x=2$ 处取最小值 0，符合题意。
    ]
    #step[讨论 $a>0$][
      左侧分支的值域为 $(1-a^2,+infinity)$，下界无法取到。
      当 $0<a<=2$ 时，右侧最小值为 0，全函数存在最小值当且仅当 $1-a^2>=0$，即 $0<a<=1$。
      当 $a>2$ 时，右侧最小值为 $(a-2)^2>=0$，而左侧下界 $1-a^2<0$，全函数没有最小值。
      综上，$a in [0,1]$，可取 $a=0$，最大值为 1。
    ]
  ],
)
#question(
  "fill-in",
  stem: [已知数列 ${a_n}$ 的各项均为正数，其前 $n$ 项和 $S_n$ 满足 $a_n dot S_n=9$（$n=1,2,dots.c$）。给出下列四个结论：

    ① ${a_n}$ 的第 2 项小于 3；② ${a_n}$ 为等比数列；

    ③ ${a_n}$ 为递减数列；④ ${a_n}$ 中存在小于 $1/100$ 的项。

    其中所有正确结论的序号是#fill-placeholder()。
  ],
  answers: ([①③④],),
  explanation: [
    #step[判断①③][
      $a_1^2=9$ 且 $a_1>0$，所以 $a_1=3$。因各项为正，${S_n}$ 严格递增，故 $a_n=9/S_n$ 严格递减，特别地 $a_2<a_1=3$。①③正确。
    ]
    #step[判断②][
      若为等比数列，设公比 $q>0$。由 $a_2^2=a_1 a_3$ 及 $a_n=9/S_n$ 得 $S_2^2=S_1 S_3$，即 $9(1+q)^2=9(1+q+q^2)$，整理得 $q=0$，矛盾。②错误。
    ]
    #step[判断④][
      若所有项均不小于 $1/100$，则 $S_100000>=1000$，从而 $a_100000=9/S_100000<=9/1000<1/100$，矛盾。④正确。
    ]
  ],
)

#section[解答题。本大题共 6 小题，共 85 分。解答应写出文字说明、演算步骤或证明过程。]
#question(
  "solution",
  stem: [在 $triangle A B C$ 中，$sin 2C=sqrt(3)sin C$。],
  parts: (
    subquestion(
      stem: [求 $angle C$；],
      answers: ([$pi/6$],),
      explanation: [因 $0<C<pi$，有 $sin C>0$，由 $2sin C cos C=sqrt(3)sin C$ 得 $cos C=sqrt(3)/2$，所以 $C=pi/6$。],
    ),
    subquestion(
      stem: [若 $b=6$，且 $triangle A B C$ 的面积为 $6sqrt(3)$，求 $triangle A B C$ 的周长。],
      answers: ([$6+6sqrt(3)$],),
      explanation: [由 $1/2 a b sin C=6sqrt(3)$ 得 $a=4sqrt(3)$。再由余弦定理，$c^2=a^2+b^2-2a b cos C=48+36-72=12$，得 $c=2sqrt(3)$。所以周长为 $a+b+c=6+6sqrt(3)$。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在三棱柱 $A B C-A_1 B_1 C_1$ 中，侧面 $B C C_1 B_1$ 为正方形，平面 $B C C_1 B_1 perp$ 平面 $A B B_1 A_1$，$A B=B C=2$，$M$、$N$ 分别为 $A_1 B_1$、$A C$ 的中点。
    #figure(prism-diagram())
  ],
  parts: (
    subquestion(
      stem: [求证：$M N parallel$ 平面 $B C C_1 B_1$；],
      answers: ([证明见解析。],),
      explanation: [取 $A B$ 中点 $K$，连接 $K M$、$K N$。由棱柱性质和中位线定理，$K M parallel B B_1$、$K N parallel B C$，且这两组直线各自相交，故平面 $K M N parallel$ 平面 $B C C_1 B_1$。又 $M N subset$ 平面 $K M N$，所以 $M N parallel$ 平面 $B C C_1 B_1$。],
    ),
    subquestion(
      stem: [再从条件①、条件②这两个条件中选择一个作为已知，求直线 $A B$ 与平面 $B M N$ 所成角的正弦值。

        条件①：$A B perp M N$；

        条件②：$B M=M N$。

        注：如果选择条件①和条件②分别解答，按第一个解答计分。
      ],
      answers: ([$2/3$],),
      explanation: [
        #step[选择条件①，证明可建立直角坐标系][
          正方形中 $B C perp B B_1$，结合两侧面垂直，得 $B C perp$ 平面 $A B B_1 A_1$，特别地 $B C perp A B$。
          沿用第（1）问的 $K$，由 $K N parallel B C$ 得 $A B perp K N$。结合条件①，$A B perp$ 平面 $K M N$，所以 $A B perp K M$，进而 $A B perp B B_1$。因此 $B A$、$B C$、$B B_1$ 两两垂直。
        ]
        #step[求线面角][
          以 $B$ 为原点，$B C$、$B A$、$B B_1$ 为三个坐标轴正方向，则 $A=(0,2,0)$，$M=(0,1,2)$，$N=(1,1,0)$。平面 $B M N$ 的法向量可取 $bold(n)=(-2,2,-1)$，$arrow(B A)=(0,2,0)$。
          设所求角为 $theta$，则
          $
            sin theta=(abs(bold(n) dot arrow(B A)))/(abs(bold(n))abs(arrow(B A)))=4/(3 times 2)=2/3.
          $
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [在校运动会上，只有甲、乙、丙三名同学参加铅球比赛，比赛成绩达到 $9.50 "m"$ 以上（含 $9.50 "m"$）的同学将获得优秀奖。为预测获得优秀奖的人数及冠军得主，收集了甲、乙、丙以往的比赛成绩，并整理得到如下数据（单位：m）：

    甲：9.80，9.70，9.55，9.54，9.48，9.42，9.40，9.35，9.30，9.25；

    乙：9.78，9.56，9.51，9.36，9.32，9.23；

    丙：9.85，9.65，9.20，9.16。

    假设用频率估计概率，且甲、乙、丙的比赛成绩相互独立。
  ],
  parts: (
    subquestion(
      stem: [估计甲在校运动会铅球比赛中获得优秀奖的概率；],
      answers: ([$0.4$],),
      explanation: [甲的 10 次成绩中有 4 次达到 $9.50 "m"$，故所求概率估计为 $4/10=0.4$。],
    ),
    subquestion(
      stem: [设 $X$ 是甲、乙、丙在校运动会铅球比赛中获得优秀奖的总人数，估计 $X$ 的数学期望 $E X$；],
      answers: ([$7/5$],),
      explanation: [乙、丙获得优秀奖的概率分别估计为 $3/6=0.5$、$2/4=0.5$。设 $X_1,X_2,X_3$ 分别表示三人是否获奖，获奖取 1，否则取 0，则 $X=X_1+X_2+X_3$。由期望的可加性，$E X=0.4+0.5+0.5=1.4=7/5$。],
    ),
    subquestion(
      stem: [在校运动会铅球比赛中，甲、乙、丙谁获得冠军的概率估计值最大？（结论不要求证明）],
      answers: ([丙。],),
      explanation: [将每人的历史成绩作为其比赛成绩的等可能取值。由独立性，共有 $10 times 6 times 4=240$ 组等可能组合；三人历史成绩互不相同，不会出现并列。逐一比较可得甲、乙、丙夺冠的组合数分别为 75、65、100，所以丙夺冠的概率估计值 $100/240=5/12$ 最大。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $E:x^2/a^2+y^2/b^2=1$（$a>b>0$）的一个顶点为 $A(0,1)$，焦距为 $2sqrt(3)$。],
  parts: (
    subquestion(
      stem: [求椭圆 $E$ 的方程；],
      answers: ([$x^2/4+y^2=1$],),
      explanation: [由顶点坐标得 $b=1$，由焦距得 $c=sqrt(3)$，所以 $a^2=b^2+c^2=4$。故椭圆方程为 $x^2/4+y^2=1$。],
    ),
    subquestion(
      stem: [过点 $P(-2,1)$ 作斜率为 $k$ 的直线与椭圆 $E$ 交于不同的两点 $B$、$C$，直线 $A B$、$A C$ 分别与 $x$ 轴交于点 $M$、$N$。当 $|M N|=2$ 时，求 $k$ 的值。],
      answers: ([$-4$],),
      explanation: [
        #step[用横轴截距表示椭圆上的点][
          设 $M=(m,0)$，则直线 $A M$ 可写为 $x=m(1-y)$，此式也包括 $m=0$ 的情形。代入椭圆并排除交点 $A$，得
          $ B=((8m)/(m^2+4),(m^2-4)/(m^2+4)). $
          同理，若 $N=(n,0)$，则 $C$ 由上式将 $m$ 换为 $n$ 得到。
        ]
        #step[利用两点均在过 $P$ 的直线上][
          直线 $B C$ 为 $y-1=k(x+2)$。代入 $B$ 的坐标，得 $-8=2k(m+2)^2$；同理，$-8=2k(n+2)^2$。因此 $k<0$，且 $m,n$ 是方程 $(t+2)^2=-4/k$ 的两个不同实根。
          所以 $|M N|=|m-n|=4/sqrt(-k)=2$，得 $k=-4$。此时 $m,n$ 分别为 $-1,-3$，对应两个不同的椭圆点，满足题意。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知函数 $f(x)=e^x ln(1+x)$。],
  parts: (
    subquestion(
      stem: [求曲线 $y=f(x)$ 在点 $(0,f(0))$ 处的切线方程；],
      answers: ([$y=x$],),
      explanation: [$f(0)=0$，$f'(x)=e^x (ln(1+x)+1/(1+x))$，故 $f'(0)=1$。切线方程为 $y=x$。],
    ),
    subquestion(
      stem: [设 $g(x)=f'(x)$，讨论函数 $g(x)$ 在 $[0,+infinity)$ 上的单调性；],
      answers: ([在 $[0,+infinity)$ 上单调递增。],),
      explanation: [求导得
        $ g'(x)=e^x (ln(1+x)+2/(1+x)-1/(1+x)^2)=e^x (ln(1+x)+(1+2x)/(1+x)^2). $
        当 $x>=0$ 时，$ln(1+x)>=0$，$(1+2x)/(1+x)^2>0$，故 $g'(x)>0$。因此 $g$ 在 $[0,+infinity)$ 上单调递增。
      ],
    ),
    subquestion(
      stem: [证明：对任意的 $s,t in (0,+infinity)$，有 $f(s+t)>f(s)+f(t)$。],
      answers: ([证明见解析。],),
      explanation: [固定 $t>0$，令 $h(x)=f(x+t)-f(x)$（$x>=0$）。由第（2）问，$h'(x)=g(x+t)-g(x)>0$，所以 $h(s)>h(0)$。又 $f(0)=0$，故 $f(s+t)-f(s)>f(t)$，即得所证不等式。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知 $Q:a_1,a_2,dots.c,a_k$ 为有穷整数数列。给定正整数 $m$，若对任意的 $n in {1,2,dots.c,m}$，在 $Q$ 中存在 $a_i,a_(i+1),a_(i+2),dots.c,a_(i+j)$（$j>=0$），使得 $a_i+a_(i+1)+a_(i+2)+dots.c+a_(i+j)=n$，则称 $Q$ 为 $m$-连续可表数列。],
  parts: (
    subquestion(
      stem: [判断 $Q:2,1,4$ 是否为 5-连续可表数列？是否为 6-连续可表数列？说明理由；],
      answers: ([是 5-连续可表数列，不是 6-连续可表数列。],),
      explanation: [所有连续段的和为 $2,1,4,2+1=3,1+4=5,2+1+4=7$，包含 $1,2,3,4,5$，但不包含 6，所以结论如上。],
    ),
    subquestion(
      stem: [若 $Q:a_1,a_2,dots.c,a_k$ 为 8-连续可表数列，求证：$k$ 的最小值为 4；],
      answers: ([证明见解析。],),
      explanation: [长度为 $k$ 的数列共有 $(k(k+1))/2$ 个非空连续段。若 $k<=3$，至多只有 6 个段和，不足以表示 $1,2,dots.c,8$，故 $k>=4$。
        当 $k=4$ 时，取数列 $1,4,1,2$，数 $1,2,3,4,5,6,7,8$ 可分别写成 $1,2,1+2,4,1+4,1+4+1,4+1+2,1+4+1+2$，均为连续段和。因此最小值为 4。
      ],
    ),
    subquestion(
      stem: [若 $Q:a_1,a_2,dots.c,a_k$ 为 20-连续可表数列，且 $a_1+a_2+dots.c+a_k<20$，求证：$k>=7$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[排除 $k<=5$，分析 $k=6$ 的段和][
          若 $k<=5$，非空连续段最多 15 个，不可能表示 20 个不同的正整数。以下反设 $k=6$，此时恰有 21 个非空连续段。
          若所有项非负，则所有段和都不超过总和，无法表示 20。因此至少有一项为负。要使剩下的段表示 $1,2,dots.c,20$，必须恰有一项为负，其余五项为正，且除该负项外的 20 个段和恰好是 $1,2,dots.c,20$，没有重复。
        ]
        #step[负项只能在端点][
          任一包含负项的段，向两端扩展到整个数列时只增加正项，其和不超过总和，因而小于 20。故表示 20 的段只能位于负项一侧，且必须包含这一侧的全部正项，否则扩展后会超过 20。
          若负项在内部，则另一侧的正项连同负项构成一个连续段，其和为总和减去 20，小于 0。这是负项自身以外的第二个负段和，矛盾。因此负项在端点。不妨将数列倒序，使 $a_1=-d$（$d>0$），则
          $ a_2+a_3+a_4+a_5+a_6=20. $
        ]
        #step[利用奇偶性和相邻间隔确定候选数列][
          记前缀和 $S_0=0$、$S_j=a_1+dots.c+a_j$。每个连续段和为 $S_j-S_i$（$i<j$）。若这 7 个前缀和中有 $r$ 个奇数，则奇数段和共有 $r(7-r)$ 个，是偶数。20 个正段和中恰有 10 个奇数，故唯一负段和 $-d$ 必为偶数，即 $d$ 为正偶数。
          前缀和按大小排列为 $S_1<S_0<S_2<dots.c<S_6$，首尾之差为 20，相邻的六个正间隔为
          $ d, quad a_2-d, quad a_3, quad a_4, quad a_5, quad a_6. $
          任意两前缀和的正距离，恰好由 $1,2,dots.c,20$ 再加一个 $d$ 构成。因此这六个间隔中只有 $d$ 可能重复。若六个间隔互异，其和至少为 $1+2+3+4+5+6=21$，矛盾，故 $d$ 必重复。
          若某个 $a_j=d$（$j>=3$），则 $a_1+dots.c+a_j=a_2+dots.c+a_(j-1)$，产生重复的正段和，也不可能。因此只能 $a_2-d=d$，即 $a_2=2d$。
          其余四项为互异的正整数，且均不等于 $d$、$2d$。若 $d>=6$，则 $a_2+dots.c+a_6>=12+1+2+3+4=22$，矛盾，故只有以下两类：
          #table(
            columns: 3,
            align: center + horizon,
            [$d$], [$a_2$], [${a_3,a_4,a_5,a_6}$],
            [2], [4], [${1,3,5,7}$],
            [4], [8], [${1,2,3,6}$],
          )
          这里用到了四项之和分别为 16、12，结合互异及排除值即可确定表中的集合。
        ]
        #step[排除 $d=4$][
          此时数列为 $-4,8,a_3,a_4,a_5,a_6$，总和为 16。包含负项的段和不超过 16，不含 $a_2$ 的正段和不超过 12。因此表示 19 的段必须从 $a_2$ 开始，即从总和为 20 的正数段末尾删去和为 1 的部分，故 $a_6=1$。
          同理，若要表示 18，必须从该正数段末尾删去和为 2 的部分。但末项为 1，倒数第二项至少为 2，没有后缀的和为 2，矛盾。
        ]
        #step[排除 $d=2$][
          此时数列为 $-2,4,a_3,a_4,a_5,a_6$，总和为 18；同理，由必须表示 19 可得 $a_6=1$，其余三项为 $3,5,7$。
          若 $a_3=3$ 或 5，则 $a_1+a_2+a_3=2+a_3$ 分别等于另一单项 5 或 7，出现重复。因此 $a_3=7$。
          若 $a_5=3$，则 $a_5+a_6=4=a_2$，矛盾；否则 $a_4=3,a_5=5$，又有 $a_4+a_5+a_6=9=a_1+a_2+a_3$，仍然矛盾。
          两类均不可能，故 $k!=6$。结合前面的计数，得到 $k>=7$。
        ]
      ],
    ),
  ),
)
