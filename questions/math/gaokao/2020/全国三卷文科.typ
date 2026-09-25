#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "全国三卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020全国3文(云南,广西,贵州,西藏,四川).pdf",
  regions: ("云南", "广西", "贵州", "西藏", "四川"),
)
#let views() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((0, 3), (2, 3), (2, 5), close: true)
  line((3, 3), (5, 3), (3, 5), close: true)
  line((0, 2), (2, 2), (2, 0), close: true)
  for (a, b, pos) in (
    ((0, 2.75), (2, 2.75), (1, 2.75)),
    ((2.25, 3), (2.25, 5), (2.25, 4)),
    ((2.25, 0), (2.25, 2), (2.25, 1)),
  ) {
    line(a, b, mark: (start: ">", end: ">"))
    content(pos, $2$, frame: "rect", fill: white, stroke: none, padding: 2pt)
  }
})
#let box-diagram() = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (1, 1, 3)
  let b = (0, 1, 3)
  let c = (0, 0, 3)
  let d = (1, 0, 3)
  let a1 = (1, 1, 0)
  let b1 = (0, 1, 0)
  let c1 = (0, 0, 0)
  let d1 = (1, 0, 0)
  let e = (1, 0, 2)
  let f = (0, 1, 1)
  oblique-project((-0.5, -0.5), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, d, a, a1, b1, b)
    line(d, d1, a1)
    line(e, a, f)
    line(a, c)
    line(c, c1, d1, stroke: (dash: figure-style.dash))
    line(c1, b1, stroke: (dash: figure-style.dash))
    line(e, f, stroke: (dash: figure-style.dash))

    for (point, label, anchor) in (
      (a, $A$, "west"),
      (b, $B$, "south-west"),
      (c, $C$, "south"),
      (d, $D$, "east"),
      (a1, $A_1$, "north"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south-east"),
      (d1, $D_1$, "north-east"),
      (e, $E$, "east"),
      (f, $F$, "west"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})
#section[选择题：本大题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项符合题目要求。]

#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A=\{1,2,3,5,7,11\},B=\{x | 3<x<15\}$，则 $A inter B$ 中元素的个数为#choice-placeholder()。],
  choices: ([2], [3], [4], [5]),
  answers: ([B],),
  explanation: [$A inter B=\{5,7,11\}$，共有 3 个元素。],
)

#question(
  "single-choice",
  score: 5,
  stem: [若 $overline(z)(1+i)=1-i$，则 $z=$#choice-placeholder()。],
  choices: ([$1-i$], [$1+i$], [$-i$], [$i$]),
  answers: ([D],),
  explanation: [$overline(z)=(1-i)/(1+i)=(1-i)^2/2=-i$，取共轭得 $z=i$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设一组样本数据 $x_1,x_2,dots,x_n$ 的方差为 $0.01$，则数据 $10x_1,10x_2,dots,10x_n$ 的方差为#choice-placeholder()。],
  choices: ([0.01], [0.1], [1], [10]),
  answers: ([C],),
  explanation: [所有数据扩大到原来的 10 倍，均值也扩大到原来的 10 倍，故每个离差的平方扩大到原来的 $10^2$ 倍。新方差为 $10^2 times 0.01=1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [Logistic 模型是常用数学模型之一，可应用于流行病学领域。有学者根据公布数据建立了某地区新冠肺炎累计确诊病例数 $I(t)$（$t$ 的单位：天）的 Logistic 模型：$I(t)=K/(1+e^(-0.23(t-53)))$，其中 $K$ 为最大确诊病例数。当 $I(t^*)=0.95K$ 时，标志着已初步遏制疫情，则 $t^*$ 约为（$ln 19 approx 3$）#choice-placeholder()。],
  choices: ([60], [63], [66], [69]),
  answers: ([C],),
  explanation: [由 $1/(1+e^(-0.23(t^*-53)))=0.95$，得 $e^(0.23(t^*-53))=19$。因此 $t^*=53+(ln 19)/0.23 approx 53+3/0.23 approx 66$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知 $sin theta+sin(theta+pi/3)=1$，则 $sin(theta+pi/6)=$#choice-placeholder()。],
  choices: ([$1/2$], [$sqrt(3)/3$], [$2/3$], [$sqrt(2)/2$]),
  answers: ([B],),
  explanation: [展开左边，得 $3/2 sin theta+sqrt(3)/2 cos theta=sqrt(3)sin(theta+pi/6)=1$，所以 $sin(theta+pi/6)=sqrt(3)/3$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [在平面内，$A,B$ 是两个定点，$C$ 是动点。若 $arrow(A C) dot arrow(B C)=1$，则点 $C$ 的轨迹为#choice-placeholder()。],
  choices: ([圆], [椭圆], [抛物线], [直线]),
  answers: ([A],),
  explanation: [以 $A B$ 的中点为原点，$A B$ 所在直线为 $x$ 轴，设 $A(-d,0),B(d,0),C(x,y)$。由数量积得 $(x+d)(x-d)+y^2=1$，即 $x^2+y^2=d^2+1$，因此轨迹是圆。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $O$ 为坐标原点，直线 $x=2$ 与抛物线 $C:y^2=2p x quad (p>0)$ 交于 $D,E$ 两点。若 $O D perp O E$，则 $C$ 的焦点坐标为#choice-placeholder()。],
  choices: ([$(1/4,0)$], [$(1/2,0)$], [$(1,0)$], [$(2,0)$]),
  answers: ([B],),
  explanation: [可设 $D(2,2sqrt(p)),E(2,-2sqrt(p))$。由 $arrow(O D) dot arrow(O E)=4-4p=0$，得 $p=1$，焦点为 $(p/2,0)=(1/2,0)$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [点 $(0,-1)$ 到直线 $y=k(x+1)$ 距离的最大值为#choice-placeholder()。],
  choices: ([$1$], [$sqrt(2)$], [$sqrt(3)$], [$2$]),
  answers: ([B],),
  explanation: [所有直线均经过定点 $P(-1,0)$，给定点 $A(0,-1)$ 到直线的距离不超过 $|A P|=sqrt(2)$。当直线垂直于 $A P$，即 $k=1$ 时取到此上界，故最大值为 $sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [下图为某几何体的三视图，则该几何体的表面积是#choice-placeholder()。#figure(views())],
  choices: ([$6+4sqrt(2)$], [$4+4sqrt(2)$], [$6+2sqrt(3)$], [$4+2sqrt(3)$]),
  answers: ([C],),
  explanation: [该几何体是三条两两垂直的棱长均为 2 的三棱锥。含这些棱的三个面都是等腰直角三角形，面积均为 $1/2 times 2 times 2=2$；第四个面是边长 $2sqrt(2)$ 的正三角形，面积为 $sqrt(3)/4 times (2sqrt(2))^2=2sqrt(3)$。总表面积为 $6+2sqrt(3)$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $a=log_3 2,b=log_5 3,c=2/3$，则#choice-placeholder()。],
  choices: ([$a<c<b$], [$a<b<c$], [$b<c<a$], [$c<a<b$]),
  answers: ([A],),
  explanation: [因 $2^3=8<9=3^2$，得 $a=1/3 log_3 8<2/3$；因 $3^3=27>25=5^2$，得 $b=1/3 log_5 27>2/3$。所以 $a<c<b$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [在 $triangle A B C$ 中，$cos C=2/3,A C=4,B C=3$，则 $tan B=$#choice-placeholder()。],
  choices: ([$sqrt(5)$], [$2sqrt(5)$], [$4sqrt(5)$], [$8sqrt(5)$]),
  answers: ([C],),
  explanation: [由余弦定理，$A B^2=4^2+3^2-2 times 4 times 3 times 2/3=9$，故 $A B=3$。再由余弦定理，$cos B=(3^2+3^2-4^2)/(2 times 3 times 3)=1/9$。因 $0<B<pi$，得 $sin B=4sqrt(5)/9$，故 $tan B=4sqrt(5)$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=sin x+1/(sin x)$，则#choice-placeholder()。],
  choices: (
    [$f(x)$ 的最小值为 2],
    [$f(x)$ 的图象关于 $y$ 轴对称],
    [$f(x)$ 的图象关于直线 $x=pi$ 对称],
    [$f(x)$ 的图象关于直线 $x=pi/2$ 对称],
  ),
  answers: ([D],),
  explanation: [由 $sin(pi-x)=sin x$，得 $f(pi-x)=f(x)$，故 D 正确。$f(-pi/2)=-2<2$，排除 A；$f(-x)=-f(x)$ 且函数不恒为 0，排除 B；$f(2pi-x)=-f(x)$，排除 C。],
)

#section[填空题：本大题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(x+y>=0, 2x-y>=0, x<=1)$，则 $z=3x+2y$ 的最大值为#fill-placeholder()。],
  answers: ([$7$],),
  explanation: [由 $y<=2x$ 和 $x<=1$，得 $z=3x+2y<=7x<=7$。当 $(x,y)=(1,2)$ 时满足所有约束且取等号，故最大值为 7。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设双曲线 $C:x^2/a^2-y^2/b^2=1 quad (a>0,b>0)$ 的一条渐近线为 $y=sqrt(2)x$，则 $C$ 的离心率为#fill-placeholder()。],
  answers: ([$sqrt(3)$],),
  explanation: [由渐近线斜率得 $b/a=sqrt(2)$，所以 $e=sqrt(1+b^2/a^2)=sqrt(3)$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设函数 $f(x)=e^x/(x+a)$。若 $f'(1)=e/4$，则 $a=$#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [$f'(x)=(e^x (x+a-1))/(x+a)^2$。由 $f'(1)=(a e)/(a+1)^2=e/4$，得 $(a+1)^2=4a$，即 $(a-1)^2=0$，所以 $a=1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知圆锥的底面半径为 1，母线长为 3，则该圆锥内半径最大的球的体积为#fill-placeholder()。],
  answers: ([$(sqrt(2)pi)/3$],),
  explanation: [最大球为圆锥的内切球，过轴截面中的内切圆半径即球半径。轴截面为腰长 3、底边长 2 的等腰三角形，高为 $2sqrt(2)$，面积为 $2sqrt(2)$，半周长为 4。因此球半径 $r=(2sqrt(2))/4=sqrt(2)/2$，体积 $V=4/3 pi r^3=(sqrt(2)pi)/3$。],
)

#section[解答题：共 70 分。第 17 至 21 题为必考题，每题 12 分；第 22、23 题为选考题。解答应写出文字说明、证明过程或演算步骤。]

#question(
  "solution",
  score: 12,
  stem: [设等比数列 $\{a_n\}$ 满足 $a_1+a_2=4,a_3-a_1=8$。],
  parts: (
    subquestion(
      stem: [求 $\{a_n\}$ 的通项公式。],
      answers: ([$a_n=3^(n-1)$。],),
      explanation: [设公比为 $q$，则 $a_1(1+q)=4$，$a_1(q^2-1)=8$。后式除以前式得 $q-1=2$，所以 $q=3,a_1=1$，通项为 $a_n=3^(n-1)$。],
    ),
    subquestion(
      stem: [记 $S_n$ 为数列 $\{log_3 a_n\}$ 的前 $n$ 项和。若 $S_m+S_(m+1)=S_(m+3)$，求 $m$。],
      answers: ([$6$。],),
      explanation: [由 $log_3 a_n=n-1$，得 $S_n=(n(n-1))/2$。代入题设，得 $(m(m-1))/2+(m(m+1))/2=((m+3)(m+2))/2$，整理为 $(m-6)(m+1)=0$。因 $m$ 为正整数，故 $m=6$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某学生兴趣小组随机调查了某市 100 天中每天的空气质量等级和当天到某公园锻炼的人次，整理数据得到下表（单位：天）：
    #block(breakable: false)[#table(
      columns: 4,
      align: center,
      [空气质量等级／锻炼人次], [$[0,200]$], [$(200,400]$], [$(400,600]$],
      [1（优）], [2], [16], [25],
      [2（良）], [5], [10], [12],
      [3（轻度污染）], [6], [7], [8],
      [4（中度污染）], [7], [2], [0],
    )]
  ],
  parts: (
    subquestion(
      stem: [分别估计该市一天的空气质量等级为 1，2，3，4 的概率。],
      answers: ([$0.43,0.27,0.21,0.09$。],),
      explanation: [各等级的天数分别为 $2+16+25=43$，$5+10+12=27$，$6+7+8=21$，$7+2+0=9$。分别除以样本量 100，得所求概率估计值。],
    ),
    subquestion(
      stem: [求一天中到该公园锻炼的平均人次的估计值（同一组中的数据用该组区间的中点值为代表）。],
      answers: ([350 人次。],),
      explanation: [三个区间的频数分别为 20，35，45，中点值分别为 100，300，500。故平均人次的估计值为 $(100 times 20+300 times 35+500 times 45)/100=350$。],
    ),
    subquestion(
      stem: [若某天的空气质量等级为 1 或 2，则称这天“空气质量好”；若某天的空气质量等级为 3 或 4，则称这天“空气质量不好”。根据所给数据，完成下面的 $2 times 2$ 列联表，并根据列联表，判断是否有 $95%$ 的把握认为一天中到该公园锻炼的人次与该市当天的空气质量有关？
        #block(breakable: false)[#table(
          columns: 3,
          align: center,
          [], [人次 $<=400$], [人次 $>400$],
          [空气质量好], [], [],
          [空气质量不好], [], [],
        )]
        附：$K^2=(n(a d-b c)^2)/((a+b)(c+d)(a+c)(b+d))$。
        #block(breakable: false)[#table(
          columns: 4,
          align: center,
          [$P(K^2>=k)$], [0.050], [0.010], [0.001],
          [$k$], [3.841], [6.635], [10.828],
        )]
      ],
      answers: ([列联表见解析；有 $95%$ 的把握认为二者有关。],),
      explanation: [#block(breakable: false)[#table(
          columns: 3,
          align: center,
          [], [人次 $<=400$], [人次 $>400$],
          [空气质量好], [33], [37],
          [空气质量不好], [22], [8],
        )]
        由此得到 $ K^2=(100(33 times 8-37 times 22)^2)/(70 times 30 times 55 times 45) approx 5.820>3.841. $
        因此有 $95%$ 的把握认为一天中到该公园锻炼的人次与当天的空气质量有关。],
    ),
  ),
)

#question(
  "solution",
  score: 12,
  stem: [如图，在长方体 $A B C D-A_1 B_1 C_1 D_1$ 中，点 $E,F$ 分别在棱 $D D_1,B B_1$ 上，且 $2D E=E D_1,B F=2F B_1$。证明：#figure(box-diagram())],
  parts: (
    subquestion(
      stem: [当 $A B=B C$ 时，$E F perp A C$。],
      answers: ([证明见解析。],),
      explanation: [由 $A B=B C$，知四边形 $A B C D$ 为正方形，故 $A C perp B D$。长方体的侧棱 $B B_1 perp$ 平面 $A B C D$，所以 $A C perp B B_1$。因 $B D,B B_1$ 是平面 $B B_1 D_1 D$ 内相交于 $B$ 的两条直线，故 $A C perp$ 平面 $B B_1 D_1 D$。又 $E F subset$ 该平面，因此 $A C perp E F$。],
    ),
    subquestion(
      stem: [点 $C_1$ 在平面 $A E F$ 内。],
      answers: ([证明见解析。],),
      explanation: [由题意，$D E=B_1 F$ 且 $D E parallel B_1 F$，故四边形 $D E B_1 F$ 为平行四边形，其对角线 $D B_1,E F$ 互相平分。长方体的体对角线 $A C_1,D B_1$ 也互相平分，所以 $A C_1$ 经过 $E F$ 的中点。该中点与 $A$ 均在平面 $A E F$ 内，因此直线 $A C_1$ 在此平面内，即点 $C_1$ 在平面 $A E F$ 内。],
    ),
  ),
)

#question("solution", score: 12, stem: [已知函数 $f(x)=x^3-k x+k^2$。], parts: (
  subquestion(
    stem: [讨论 $f(x)$ 的单调性。],
    answers: (
      [$k<=0$ 时，在 $RR$ 上单调递增；$k>0$ 时，在 $(-infinity,-sqrt(k/3))$ 和 $(sqrt(k/3),+infinity)$ 上单调递增，在 $(-sqrt(k/3),sqrt(k/3))$ 上单调递减。],
    ),
    explanation: [由 $f'(x)=3x^2-k$，当 $k<0$ 时导数恒正；当 $k=0$ 时 $f(x)=x^3$，也在 $RR$ 上单调递增。当 $k>0$ 时，令 $r=sqrt(k/3)$，导数在 $x< -r$ 或 $x>r$ 时为正，在 $-r<x<r$ 时为负，得到相应单调区间。],
  ),
  subquestion(
    stem: [若 $f(x)$ 有三个零点，求 $k$ 的取值范围。],
    answers: ([$(0,4/27)$。],),
    explanation: [#step[用极值刻画三个零点][由上一问，必须 $k>0$。令 $r=sqrt(k/3)$，则极大值 $f(-r)=k^2+(2k)/3 sqrt(k/3)>0$，极小值 $f(r)=k^2-(2k)/3 sqrt(k/3)$。结合三段严格单调性以及 $x$ 趋于正、负无穷时的函数变化，恰有三个零点当且仅当 $f(r)<0$。]
      #step[解参数不等式][因 $k>0$，$f(r)<0$ 等价于 $k<2/3 sqrt(k/3)$，两边平方并除以 $k$ 得 $k<4/27$。故所求范围为 $(0,4/27)$。端点 $k=0$ 仅有一个零点，$k=4/27$ 的极小值为 0、仅有两个不同零点，均不满足题意。]],
  ),
))
#question(
  "solution",
  score: 12,
  stem: [已知椭圆 $C:x^2/25+y^2/m^2=1 quad (0<m<5)$ 的离心率为 $sqrt(15)/4$，$A,B$ 分别为 $C$ 的左、右顶点。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程。],
      answers: ([$x^2/25+(16y^2)/25=1$。],),
      explanation: [$a=5,b=m$，故 $e^2=1-m^2/25=15/16$，得 $m=5/4$。因此椭圆方程为 $x^2/25+(16y^2)/25=1$。],
    ),
    subquestion(
      stem: [若点 $P$ 在 $C$ 上，点 $Q$ 在直线 $x=6$ 上，且 $|B P|=|B Q|,B P perp B Q$，求 $triangle A P Q$ 的面积。],
      answers: ([$5/2$。],),
      explanation: [#step[确定点的坐标][由 $A(-5,0),B(5,0)$，设 $P(u,v)$。两向量 $arrow(B P),arrow(B Q)$ 等长且垂直，故互为旋转 $90 degree$ 的结果；又 $Q$ 的横坐标为 6，得 $|v|=1$。由关于 $x$ 轴的对称性，只需考虑 $v=1$，此时 $Q=(6,5-u)$。代入椭圆方程得 $u^2=9$。]
        #step[统一计算面积][利用两向量构成的三角形面积公式，
          $ S_(triangle A P Q)=1/2 |(u+5)(5-u)-11|=1/2 |14-u^2|=5/2. $
          两种横坐标 $u=3$ 或 $u=-3$ 及关于 $x$ 轴对称的情形均给出此面积。]],
    ),
  ),
)

#section[选考题：第 22、23 题中任选一题作答，每题 10 分。如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4-4：坐标系与参数方程。在直角坐标系 $x O y$ 中，曲线 $C$ 的参数方程为 $cases(x=2-t-t^2, y=2-3t+t^2)$（$t$ 为参数且 $t!=1$），$C$ 与坐标轴交于 $A,B$ 两点。],
  parts: (
    subquestion(
      stem: [求 $|A B|$。],
      answers: ([$4sqrt(10)$。],),
      explanation: [令 $x=0$，得 $(t+2)(t-1)=0$。因 $t!=1$，故 $t=-2$，对应点 $(0,12)$。令 $y=0$，得 $(t-1)(t-2)=0$，故 $t=2$，对应点 $(-4,0)$。因此 $|A B|=sqrt(4^2+12^2)=4sqrt(10)$。],
    ),
    subquestion(
      stem: [以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，求直线 $A B$ 的极坐标方程。],
      answers: ([$3rho cos theta-rho sin theta+12=0$。],),
      explanation: [由两截距点，直线 $A B$ 为 $y=3x+12$。代入 $x=rho cos theta,y=rho sin theta$，得 $3rho cos theta-rho sin theta+12=0$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4-5：不等式选讲。设 $a,b,c in RR,a+b+c=0,a b c=1$。],
  parts: (
    subquestion(
      stem: [证明：$a b+b c+c a<0$。],
      answers: ([证明见解析。],),
      explanation: [由 $(a+b+c)^2=0$，得 $a b+b c+c a=-1/2(a^2+b^2+c^2)$。因 $a b c=1$，三数均非零，故 $a^2+b^2+c^2>0$，从而 $a b+b c+c a<0$。],
    ),
    subquestion(
      stem: [用 $max\{a,b,c\}$ 表示 $a,b,c$ 中的最大值，证明：$max\{a,b,c\}>=root(3, 4)$。],
      answers: ([证明见解析。],),
      explanation: [由 $a b c=1>0$ 且 $a+b+c=0$，三数必为一正两负。不妨设 $a=max\{a,b,c\}>0$，则 $b,c<0$ 且 $b c=1/a$。由基本不等式，$a=(-b)+(-c)>=2sqrt(b c)=2/sqrt(a)$，所以 $a^3>=4$，即 $max\{a,b,c\}>=root(3, 4)$。等号在 $b=c=-a/2$ 时成立。],
    ),
  ),
)
