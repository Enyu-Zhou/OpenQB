#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2023,
  type: "普通高等学校春季招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2023/2023春季上海.pdf",
  regions: ("上海",),
)

#let trade-chart() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
    x: (label: (anchor: "west", offset: 0.3)),
    y: (label: (anchor: "south", offset: 0.2)),
  ))
  plot.plot(
    size: (6.2, 4.4),
    axis-style: "school-book",
    x-min: 0,
    x-max: 4.7,
    y-min: 0,
    y-max: 42,
    x-ticks: ((0.7, [2018]), (1.7, [2019]), (2.7, [2020]), (3.7, [2021])),
    x-tick-step: none,
    y-tick-step: 10,
    x-label: [年份],
    y-label: [万亿元],
    {
      plot.annotate(resize: false, {
        for (i, (exports, imports)) in (
          (16.41, 14.09),
          (17.24, 14.33),
          (17.93, 14.29),
          (21.73, 17.37),
        ).enumerate() {
          let x = i + 0.7
          rect(
            (x - 0.32, 0),
            (x + 0.32, exports),
            fill: luma(75%),
            stroke: none,
          )
          rect(
            (x - 0.32, exports),
            (x + 0.32, exports + imports),
            fill: luma(93%),
            stroke: none,
          )
          line(
            (x - 0.32, 0),
            (x - 0.32, exports + imports),
            (x + 0.32, exports + imports),
            (x + 0.32, 0),
          )
          line((x - 0.32, exports), (x + 0.32, exports))
          content((x, exports / 2), text(size: 8pt, str(exports)))
          content((x, exports + imports / 2), text(size: 8pt, str(imports)))
        }
      })
    },
  )
  rect((6.7, 3.2), (7.05, 3.5), fill: luma(93%))
  content((7.15, 3.35), [进口], anchor: "west")
  rect((6.7, 2.6), (7.05, 2.9), fill: luma(75%))
  content((7.15, 2.75), [出口], anchor: "west")
})

#let cube-diagram() = cetz.canvas(length: 31mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (1, 0, 0)
  let c = (1, 1, 0)
  let d = (0, 1, 0)
  let a1 = (0, 0, 1)
  let b1 = (1, 0, 1)
  let c1 = (1, 1, 1)
  let d1 = (0, 1, 1)
  oblique-project((1, 0), (0.36, 0.32), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a1, c1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "north-west"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
    ) { content(p, label, anchor: anchor, padding: 0.07) }
  })
})

#let pyramid-diagram() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (3, 0, 0)
  let c = (0, 4, 0)
  let p = (0, 0, 3)
  let m = (1.5, 2, 0)
  let e = (0, 2, 0)
  let f = (0, 2, 1.5)
  oblique-project((-0.35, -0.45), (0.9, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, b, c, p)
    line(p, m, f)
    line(a, b, stroke: (dash: figure-style.dash))
    line(a, c, stroke: (dash: figure-style.dash))
    line(p, a, m, e, f, stroke: (dash: figure-style.dash))
    for (q, label, anchor) in (
      (a, $A$, "south-east"),
      (b, $B$, "north-east"),
      (c, $C$, "west"),
      (p, $P$, "south"),
      (m, $M$, "north"),
      (e, $E$, "south-east"),
      (f, $F$, "south-west"),
    ) { content(q, label, anchor: anchor, padding: 0.08) }
  })
})

#section[填空题。本大题共 12 小题，满分 54 分，第 1—6 题每题 4 分，第 7—12 题每题 5 分。]
#question(
  "fill-in",
  score: 4,
  stem: [已知集合 $A={1,2}$，$B={1,a}$，且 $A=B$，则 $a=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [由集合相等，$B$ 中必须含有元素 $2$，故 $a=2$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知向量 $arrow(a)=(3,4)$，$arrow(b)=(1,2)$，则 $arrow(a)-2arrow(b)=$#fill-placeholder()。],
  answers: ([$(1,0)$],),
  explanation: [$arrow(a)-2arrow(b)=(3-2,4-4)=(1,0)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [不等式 $abs(x-1)<=2$ 的解集为#fill-placeholder()。（结果用集合或区间表示）],
  answers: ([$[-1,3]$],),
  explanation: [$-2<=x-1<=2$，即 $-1<=x<=3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知圆 $C$ 的一般方程为 $x^2+2x+y^2=0$，则圆 $C$ 的半径为#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [配方得 $(x+1)^2+y^2=1$，故半径为 $1$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知事件 $A$ 的对立事件为 $overline(A)$，若 $P(A)=0.5$，则 $P(overline(A))=$#fill-placeholder()。],
  answers: ([$0.5$],),
  explanation: [$P(overline(A))=1-P(A)=0.5$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知正实数 $a,b$ 满足 $a+4b=1$，则 $a b$ 的最大值为#fill-placeholder()。],
  answers: ([$1/16$],),
  explanation: [$a b=1/4 dot a dot 4b<=1/4((a+4b)/2)^2=1/16$。
    当且仅当 $a=4b$，即 $a=1/2,b=1/8$ 时等号成立。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某校抽取 100 名学生测身高，其中身高最大值为 $186 "cm"$，最小值为 $154 "cm"$。根据身高数据绘制频率分布直方图，组距为 $5 "cm"$，且第一组下限为 $153.5 "cm"$，则组数为#fill-placeholder()。],
  answers: ([$7$],),
  explanation: [六组的上限为 $153.5+6 times 5=183.5<186$，七组的上限为 $188.5>186$，故分为 $7$ 组。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $(1-2x)^4=a_0+a_1 x+a_2 x^2+a_3 x^3+a_4 x^4$，则 $a_0+a_4=$#fill-placeholder()。],
  answers: ([$17$],),
  explanation: [常数项 $a_0=1$，最高次项系数 $a_4=(-2)^4=16$，故和为 $17$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=2^(-x)+1$，且 $g(x)=cases(log_2(x+1)&quad x>=0, f(-x)&quad x<0)$，则方程 $g(x)=2$ 的解为#fill-placeholder()。],
  answers: ([$x=3$],),
  explanation: [当 $x>=0$ 时，$log_2(x+1)=2$，解得 $x=3$。
    当 $x<0$ 时，$g(x)=2^x+1<2$，没有解。],
)
#question(
  "fill-in",
  score: 5,
  stem: [为了学习宣传党的二十大精神，某校学生理论宣讲团赴社区宣讲。已知有 4 名男生、6 名女生，从 10 人中任选 3 人，则恰有 1 名男生、2 名女生的概率为#fill-placeholder()。],
  answers: ([$1/2$],),
  explanation: [所有选法共有 $binom(10, 3)=120$ 种，符合条件的有 $binom(4, 1)binom(6, 2)=60$ 种，故概率为 $60/120=1/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $z_1,z_2 in CC$，且 $z_1="i" overline(z_2)$（$"i"$ 为虚数单位），满足 $abs(z_1-1)=1$，则 $abs(z_1-z_2)$ 的取值范围为#fill-placeholder()。],
  answers: ([$[0,2+sqrt(2)]$],),
  explanation: [设 $z_1=x+y"i"$，则 $z_2=y+x"i"$，且 $(x-1)^2+y^2=1$。
    令 $x=1+cos theta,y=sin theta$，得
    $ abs(z_1-z_2)=sqrt(2)abs(x-y)=sqrt(2)abs(1+sqrt(2)cos(theta+pi/4)). $
    括号中的式子取遍 $[1-sqrt(2),1+sqrt(2)]$，故所求范围为 $[0,2+sqrt(2)]$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $arrow(O A),arrow(O B),arrow(O C)$ 为空间中的三个单位向量，且 $arrow(O A) perp arrow(O B)$，$arrow(O A) perp arrow(O C)$，$arrow(O B)$ 与 $arrow(O C)$ 的夹角为 $60 degree$。点 $P$ 为空间任意一点，且 $abs(arrow(O P))=1$，满足 $abs(arrow(O P) dot arrow(O C))<=abs(arrow(O P) dot arrow(O B))<=abs(arrow(O P) dot arrow(O A))$，则 $abs(arrow(O P) dot arrow(O C))$ 的最大值为#fill-placeholder()。],
  answers: ([$sqrt(21)/7$],),
  explanation: [取 $arrow(O A)=(0,0,1)$，$arrow(O B)=(0,1,0)$，$arrow(O C)=(sqrt(3)/2,1/2,0)$，设 $arrow(O P)=(x,y,z)$。
    记 $s=abs(y)$，$t=abs((sqrt(3)x+y)/2)$，则 $abs(z)>=s>=t$。由 $sqrt(3)x=2((sqrt(3)x+y)/2)-y$，得
    $ x^2+y^2>=4/3(s^2-s t+t^2). $
    因此
    $ 1=x^2+y^2+z^2>=s^2+4/3(s^2-s t+t^2)=7/3 t^2+1/3(s-t)(7s+3t)>=7/3 t^2. $
    故 $t<=sqrt(21)/7$。取 $arrow(O P)=(1,sqrt(3),sqrt(3))/sqrt(7)$ 时三个数量积的绝对值均为 $sqrt(21)/7$，等号成立。],
)

#section[选择题。本大题共 4 小题，满分 18 分，第 13—14 题每题 4 分，第 15—16 题每题 5 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 4,
  stem: [下列函数是偶函数的是#choice-placeholder()。],
  choices: ([$y=sin x$], [$y=cos x$], [$y=x^3$], [$y=2^x$]),
  answers: ([B],),
  explanation: [$cos(-x)=cos x$，故 B 为偶函数。A、C 为奇函数，D 既不是奇函数也不是偶函数。],
)
#question(
  "single-choice",
  score: 4,
  stem: [如图为 2018—2021 年中国货物进出口总额的条形统计图，则下列对于进出口贸易额描述错误的是#choice-placeholder()。
    #figure(trade-chart())],
  choices: (
    [从 2018 年开始，2021 年的进出口总额增长率最大],
    [从 2018 年开始，进出口总额逐年增大],
    [从 2018 年开始，进口总额逐年增大],
    [从 2018 年开始，2020 年的进出口总额增长率最小],
  ),
  answers: ([C],),
  explanation: [四年的进出口总额依次为 $30.50,31.57,32.22,39.10$ 万亿元，逐年增大。
    2019—2021 年的同比增长率分别约为 $3.51%,2.06%,21.35%$，故 A、B、D 正确。
    2020 年进口总额 $14.29$ 万亿元小于 2019 年的 $14.33$ 万亿元，故 C 错误。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，在正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，点 $P$ 为线段 $A_1 C_1$ 上的动点，则下列直线中，始终与直线 $B P$ 异面的是#choice-placeholder()。
    #figure(cube-diagram())],
  choices: ([$D D_1$], [$A C$], [$A D_1$], [$B_1 C$]),
  answers: ([B],),
  explanation: [直线 $B P$ 与平面 $A B C D$ 仅交于 $B$，而 $B in.not A C$，故 $B P$ 与 $A C$ 不相交。
    又 $B P$ 不平行于底面内的 $A C$，所以二者始终异面。
    当 $P$ 为 $A_1 C_1$ 的中点时，$B P$ 与 $D D_1$ 的延长线相交；当 $P=C_1$ 时，$B P parallel A D_1$，且 $B P$ 与 $B_1 C$ 相交。故其余选项均不成立。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知无穷数列 ${a_n}$ 的各项均为实数，$S_n$ 为其前 $n$ 项和。若对任意正整数 $k>2022$ 都有 $abs(S_k)>abs(S_(k+1))$，则下列各项中可能成立的是#choice-placeholder()。],
  choices: (
    [$a_1,a_3,a_5,dots.c,a_(2n-1),dots.c$ 为等差数列，$a_2,a_4,a_6,dots.c,a_(2n),dots.c$ 为等比数列],
    [$a_1,a_3,a_5,dots.c,a_(2n-1),dots.c$ 为等比数列，$a_2,a_4,a_6,dots.c,a_(2n),dots.c$ 为等差数列],
    [$a_1,a_2,dots.c,a_2022$ 为等差数列，$a_2022,a_2023,dots.c,a_n,dots.c$ 为等比数列],
    [$a_1,a_2,dots.c,a_2022$ 为等比数列，$a_2022,a_2023,dots.c,a_n,dots.c$ 为等差数列],
  ),
  answers: ([C],),
  explanation: [#step[构造满足 C 的数列][
      取 $a_n=2024-2n$（$1<=n<=2022$），$a_n=-2020 dot 2^(2022-n)$（$n>=2022$）。两段在 $n=2022$ 处一致，且
      $ S_k=2+2020 dot 2^(2022-k)>0 quad (k>=2022). $
      因此 $abs(S_k)$ 严格递减，C 可以成立。
    ]
    #step[排除其余选项][
      由题意，${S_n}$ 有界，故 $a_n=S_n-S_(n-1)$ 也有界。
      对 A、B，等差子列有界，必为常数 $d$；设等比子列首项为 $b$、公比为 $q$。其有界性给出 $abs(q)<=1$。
      若 $q=1$，则 $S_(2n)=n(d+b)$，有界要求 $d+b=0$，与严格递减矛盾。
      若 $-1<=q<1$，等比子列的部分和有界，从 $S_(2n)$ 有界得 $d=0$，于是无穷多个相邻部分和相等，也矛盾。
      对 D，从第 $2022$ 项起为等差数列，有界迫使公差为零；其常数项非零会使 $S_n$ 无界，为零则 $S_n$ 不再变化。故 D 不成立。
    ]],
)

#section[解答题。本大题共 5 小题，满分 78 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [已知三棱锥 $P-A B C$ 中，$P A perp$ 平面 $A B C$，$A B perp A C$，$P A=A B=3$，$A C=4$。$M$ 为 $B C$ 中点，过点 $M$ 分别作平行于平面 $P A B$ 的直线交 $A C,P C$ 于点 $E,F$。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [求直线 $P M$ 与平面 $A B C$ 所成角的大小。],
      answers: ([$arctan(6/5)$],),
      explanation: [由 $P A perp$ 平面 $A B C$，$A M$ 为 $P M$ 在底面内的射影，故所求角为 $angle P M A$。
        在直角三角形 $A B C$ 中，$B C=5$，$A M=(B C)/2=5/2$，故 $tan angle P M A=(P A)/(A M)=6/5$。],
    ),
    subquestion(
      stem: [证明：平面 $M E F parallel$ 平面 $P A B$，并求直线 $M E$ 到平面 $P A B$ 的距离。],
      answers: ([证明见解析；距离为 $2$。],),
      explanation: [平面 $M E F$ 内两条相交直线 $M E,M F$ 都平行于平面 $P A B$，故两平面平行。
        平面 $A B C$ 与平面 $P A B$ 的交线为 $A B$，由 $M E parallel$ 平面 $P A B$ 得 $M E parallel A B$，故 $E$ 为 $A C$ 中点。
        又 $A C perp A B$，$A C perp P A$，故 $A C perp$ 平面 $P A B$。所求距离为 $A E=(A C)/2=2$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 所对应的边分别为 $a,b,c$，其中 $b=2$。],
  parts: (
    subquestion(
      stem: [若 $A+C=120 degree$，$a=2c$，求边长 $c$。],
      answers: ([$(2sqrt(3))/3$],),
      explanation: [由 $B=60 degree$ 及余弦定理，
        $ 4=a^2+c^2-2a c cos B=4c^2+c^2-2c^2=3c^2. $
        因为 $c>0$，故 $c=(2sqrt(3))/3$。],
    ),
    subquestion(
      stem: [若 $A-C=15 degree$，$a=sqrt(2)c sin A$，求 $triangle A B C$ 的面积。],
      answers: ([$3-sqrt(3)$],),
      explanation: [由正弦定理，$a/c=(sin A)/(sin C)=sqrt(2)sin A$，故 $sin C=1/sqrt(2)$。
        若 $C=135 degree$，则 $A=150 degree$，不符合三角形内角和，故 $C=45 degree,A=60 degree,B=75 degree$。
        于是 $a=(2sin 60 degree)/(sin 75 degree)$，$c=(2sin 45 degree)/(sin 75 degree)$，面积
        $
          S=1/2 b c sin A=(2sin 45 degree sin 60 degree)/(sin 75 degree)=3-sqrt(3).
        $
      ],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [为了节能环保、节约材料，定义建筑物的“体形系数” $S=F_0/V_0$，其中 $F_0$ 为建筑物暴露在空气中的面积（单位：平方米），$V_0$ 为建筑物的体积（单位：立方米）。],
  parts: (
    subquestion(
      stem: [若有一个圆柱体建筑的底面半径为 $R$，高度为 $H$，暴露在空气中的部分为上底面和侧面，求该建筑体的“体形系数” $S$。（结果用含 $R,H$ 的代数式表示）],
      answers: ([$2/R+1/H$],),
      explanation: [$F_0=pi R^2+2pi R H$，$V_0=pi R^2 H$，故 $S=(pi R^2+2pi R H)/(pi R^2 H)=2/R+1/H$。],
    ),
    subquestion(
      stem: [定义建筑物的“形状因子”为 $f=L^2/A$，其中 $A$ 为建筑物底面面积，$L$ 为建筑物底面周长。又定义 $T$ 为总建筑面积，即每层建筑面积之和（每层建筑面积为每一层的底面面积）。设 $n$ 为某宿舍楼的层数，层高为 $3$ 米，则可以推导出该宿舍楼的“体形系数”为 $S=sqrt((f n)/T)+1/(3n)$。当 $f=18,T=10000$ 时，求当该宿舍楼的层数 $n$ 为多少时，“体形系数” $S$ 最小。],
      answers: ([$6$ 层。],),
      explanation: [令 $s(x)=(3sqrt(2))/100 sqrt(x)+1/(3x)$（$x>0$），则
        $ s'(x)=(9sqrt(2)x^(3/2)-200)/(600x^2). $
        导数分子严格递增，其零点 $x_0$ 满足 $x_0^3=20000/81$，故 $6<x_0<7$。
        因此只需比较 $s(6)$ 与 $s(7)$。有
        $ s(7)-s(6)=3/(50(sqrt(14)+sqrt(12)))-1/126>0, $
        其中 $sqrt(14)<15/4$，$sqrt(12)<7/2$，故 $50(sqrt(14)+sqrt(12))<725/2<378$。
        所以取 $n=6$ 时 $S$ 最小。],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知椭圆 $Gamma:x^2/m^2+y^2/3=1$（$m>0$ 且 $m!=sqrt(3)$）。],
  parts: (
    subquestion(
      stem: [若 $m=2$，求椭圆 $Gamma$ 的离心率。],
      answers: ([$1/2$],),
      explanation: [长半轴为 $2$，短半轴为 $sqrt(3)$，半焦距为 $sqrt(4-3)=1$，故离心率为 $1/2$。],
    ),
    subquestion(
      stem: [设 $A_1,A_2$ 为椭圆 $Gamma$ 的左右顶点，椭圆 $Gamma$ 上一点 $E$ 的纵坐标为 $1$，且 $arrow(E A_1) dot arrow(E A_2)=-2$，求实数 $m$ 的值。],
      answers: ([$3$],),
      explanation: [设 $E=(x,1)$，则 $x^2=(2m^2)/3$，且 $A_1=(-m,0),A_2=(m,0)$。
        由 $arrow(E A_1) dot arrow(E A_2)=x^2-m^2+1=-2$，得 $m^2=9$，故 $m=3$。],
    ),
    subquestion(
      stem: [过椭圆 $Gamma$ 上一点 $P$ 作斜率为 $sqrt(3)$ 的直线 $l$。若直线 $l$ 与双曲线 $y^2/(5m^2)-x^2/5=1$ 有且仅有一个公共点，求实数 $m$ 的取值范围。],
      answers: ([$(sqrt(3),3]$],),
      explanation: [#step[直线与双曲线只有一个交点][
          设 $l:y=sqrt(3)x+b$，代入双曲线方程，得
          $ (3-m^2)x^2+2sqrt(3)b x+b^2-5m^2=0. $
          ∵ $m!=sqrt(3)$，∴ 二次项系数非零。恰有一个交点等价于
          $ Delta=4m^2(b^2+15-5m^2)=0, quad b^2=5m^2-15. $
          因而 $m>sqrt(3)$。
        ]
        #step[直线经过椭圆上的点][
          设 $P=(m cos t,sqrt(3)sin t)$，则 $b=sqrt(3)(sin t-m cos t)$ 取遍 $[-sqrt(3+3m^2),sqrt(3+3m^2)]$。
          故还须且只须 $b^2<=3+3m^2$，即 $5m^2-15<=3+3m^2$，得 $m<=3$。
          合并得 $m in (sqrt(3),3]$。
        ]],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知函数 $f(x)=a x^3-(a+1)x^2+x$，$g(x)=k x+m$（其中 $a>=0$，$k,m in RR$）。若任意 $x in [0,1]$ 均有 $f(x)<=g(x)$，则称函数 $y=g(x)$ 是函数 $y=f(x)$ 的“控制函数”，且对所有满足条件的函数 $y=g(x)$ 在 $x$ 处取得的最小值记为 $overline(f)(x)$。],
  parts: (
    subquestion(
      stem: [若 $a=2$，$g(x)=x$，判断函数 $y=g(x)$ 是否为函数 $y=f(x)$ 的“控制函数”，并说明理由。],
      answers: ([是。],),
      explanation: [在 $[0,1]$ 上，$g(x)-f(x)=x^2(3-2x)>=0$，故 $y=g(x)$ 是“控制函数”。],
    ),
    subquestion(
      stem: [若 $a=0$，曲线 $y=f(x)$ 在 $x=1/4$ 处的切线为直线 $y=h(x)$，证明：函数 $y=h(x)$ 为函数 $y=f(x)$ 的“控制函数”，并求 $overline(f)(1/4)$ 的值。],
      answers: ([证明见解析；$overline(f)(1/4)=3/16$。],),
      explanation: [$f(x)=-x^2+x$，$f'(1/4)=1/2$，$f(1/4)=3/16$，故 $h(x)=x/2+1/16$。
        对任意 $x in [0,1]$，$h(x)-f(x)=(x-1/4)^2>=0$，故 $h$ 是控制函数。
        所有控制函数在 $1/4$ 处的值均不小于 $f(1/4)$，而 $h(1/4)=f(1/4)$，故 $overline(f)(1/4)=3/16$。],
    ),
    subquestion(
      stem: [若曲线 $y=f(x)$ 在 $x=x_0$（$x_0 in (0,1)$）处的切线过点 $(1,0)$，且 $c in [x_0,1]$，证明：当且仅当 $c=x_0$ 或 $c=1$ 时，$overline(f)(c)=f(c)$。],
      answers: ([证明见解析。],),
      explanation: [#step[确定切线并证明它是控制函数][
          记切线为 $y=t(x)$。因 $t(x_0)=f(x_0)$、$t(1)=f(1)=0$，切点条件给出
          $ f(x_0)+(1-x_0)f'(x_0)=(1-x_0)^2(1-2a x_0)=0. $
          由 $0<x_0<1$ 得 $a=1/(2x_0)>0$。因此
          $ t(x)=(1-x)/(4a), quad t(x)-f(x)=a(1-x)(x-x_0)^2>=0 quad (0<=x<=1). $
          故 $t$ 是控制函数。
        ]
        #step[求指定区间上的最小值][
          任取控制函数 $g$，有 $g(x_0)>=t(x_0)$，$g(1)>=t(1)$。由于 $g-t$ 为一次函数或常数函数，故在 $[x_0,1]$ 上恒有 $g(x)>=t(x)$。
          又 $t$ 本身就是控制函数，因此 $overline(f)(c)=t(c)$。
          于是
          $ overline(f)(c)-f(c)=a(1-c)(c-x_0)^2. $
          由 $a>0$ 及 $x_0<=c<=1$，上式等于零当且仅当 $c=x_0$ 或 $c=1$，命题得证。
        ]],
    ),
  ),
)
