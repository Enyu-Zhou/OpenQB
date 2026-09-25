#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "全国三卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020全国3理(云南,广西,贵州,西藏,四川).pdf",
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
#let box-diagram(auxiliary: false) = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (2, 1, 3)
  let b = (0, 1, 3)
  let c = (0, 0, 3)
  let d = (2, 0, 3)
  let a1 = (2, 1, 0)
  let b1 = (0, 1, 0)
  let c1 = (0, 0, 0)
  let d1 = (2, 0, 0)
  let e = (2, 0, 2)
  let f = (0, 1, 1)
  let m = (1, 0.5, 1.5)
  let n = (1, 1, 2)
  oblique-project((-0.35, -0.35), (1.3, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, d, a, a1, b1, b)
    line(d, d1, a1)
    line(e, a, f, a1, e)
    line(c, c1, d1, stroke: (dash: figure-style.dash))
    line(c1, b1, stroke: (dash: figure-style.dash))
    line(e, f, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(a1, m, n, a1, stroke: (dash: figure-style.dash))
      content(m, $M$, anchor: "north-east", padding: 1pt)
      content(n, $N$, anchor: "west", padding: 4pt)
    }
    for (point, label, anchor) in (
      (a, $A$, "south-east"),
      (b, $B$, "south-west"),
      (c, $C$, "south"),
      (d, $D$, "east"),
      (a1, $A_1$, "north"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "east"),
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
  stem: [已知集合 $A=\{(x,y) | x,y in NN^*,y>=x\},B=\{(x,y) | x+y=8\}$，则 $A inter B$ 中元素的个数为#choice-placeholder()。],
  choices: ([2], [3], [4], [6]),
  answers: ([C],),
  explanation: [由 $x+y=8$ 且 $y>=x$，得 $1<=x<=4$。交集为 $\{(1,7),(2,6),(3,5),(4,4)\}$，共有 4 个元素。],
)

#question(
  "single-choice",
  score: 5,
  stem: [复数 $1/(1-3i)$ 的虚部是#choice-placeholder()。],
  choices: ([$-3/10$], [$-1/10$], [$1/10$], [$3/10$]),
  answers: ([D],),
  explanation: [$1/(1-3i)=(1+3i)/10=1/10+3/10 i$，虚部为 $3/10$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [在一组样本数据中，1，2，3，4 出现的频率分别为 $p_1,p_2,p_3,p_4$，且 $sum_(i=1)^4 p_i=1$，则下面四种情形中，对应样本的标准差最大的一组是#choice-placeholder()。],
  choices: (
    [$p_1=p_4=0.1,p_2=p_3=0.4$],
    [$p_1=p_4=0.4,p_2=p_3=0.1$],
    [$p_1=p_4=0.2,p_2=p_3=0.3$],
    [$p_1=p_4=0.3,p_2=p_3=0.2$],
  ),
  answers: ([B],),
  explanation: [四组频率均关于 $2.5$ 对称，平均数都是 $2.5$。设 $p_1=p_4=p$，则 $p_2=p_3=0.5-p$，方差为 $2p times 1.5^2+2(0.5-p) times 0.5^2=4p+0.25$。它随 $p$ 增大，故 $p=0.4$ 时标准差最大。],
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
  stem: [设 $O$ 为坐标原点，直线 $x=2$ 与抛物线 $C:y^2=2p x quad (p>0)$ 交于 $D,E$ 两点。若 $O D perp O E$，则 $C$ 的焦点坐标为#choice-placeholder()。],
  choices: ([$(1/4,0)$], [$(1/2,0)$], [$(1,0)$], [$(2,0)$]),
  answers: ([B],),
  explanation: [可设 $D(2,2sqrt(p)),E(2,-2sqrt(p))$。由 $arrow(O D) dot arrow(O E)=4-4p=0$，得 $p=1$，焦点为 $(p/2,0)=(1/2,0)$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知向量 $bold(a),bold(b)$ 满足 $|bold(a)|=5,|bold(b)|=6,bold(a) dot bold(b)=-6$，则 $cos chevron.l bold(a),bold(a)+bold(b) chevron.r=$#choice-placeholder()。],
  choices: ([$-31/35$], [$-19/35$], [$17/35$], [$19/35$]),
  answers: ([D],),
  explanation: [$|bold(a)+bold(b)|=sqrt(25+36-12)=7$，且 $bold(a) dot (bold(a)+bold(b))=25-6=19$，故所求余弦为 $19/(5 times 7)=19/35$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [在 $triangle A B C$ 中，$cos C=2/3,A C=4,B C=3$，则 $cos B=$#choice-placeholder()。],
  choices: ([$1/9$], [$1/3$], [$1/2$], [$2/3$]),
  answers: ([A],),
  explanation: [由余弦定理，$A B^2=4^2+3^2-2 times 4 times 3 times 2/3=9$，所以 $A B=3$。再由余弦定理，$cos B=(3^2+3^2-4^2)/(2 times 3 times 3)=1/9$。],
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
  stem: [已知 $2tan theta-tan(theta+pi/4)=7$，则 $tan theta=$#choice-placeholder()。],
  choices: ([$-2$], [$-1$], [$1$], [$2$]),
  answers: ([D],),
  explanation: [令 $t=tan theta$，由题意 $t!=1$。正切和角公式给出 $2t-(t+1)/(1-t)=7$，整理得 $(t-2)^2=0$，故 $tan theta=2$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [若直线 $l$ 与曲线 $y=sqrt(x)$ 和 $x^2+y^2=1/5$ 都相切，则 $l$ 的方程为#choice-placeholder()。],
  choices: ([$y=2x+1$], [$y=2x+1/2$], [$y=1/2 x+1$], [$y=1/2 x+1/2$]),
  answers: ([D],),
  explanation: [设与 $y=sqrt(x)$ 的切点横坐标为 $u>0$，切线为 $x-2sqrt(u)y+u=0$。它与圆相切，故 $u/sqrt(1+4u)=1/sqrt(5)$，得 $5u^2-4u-1=0$。正根为 $u=1$，所以 $l:y=1/2 x+1/2$。（端点处的竖直切线 $x=0$ 经过圆心，不与圆相切。）],
)

#question(
  "single-choice",
  score: 5,
  stem: [设双曲线 $C:x^2/a^2-y^2/b^2=1 quad (a>0,b>0)$ 的左、右焦点分别为 $F_1,F_2$，离心率为 $sqrt(5)$。$P$ 是 $C$ 上一点，且 $F_1 P perp F_2 P$。若 $triangle P F_1 F_2$ 的面积为 4，则 $a=$#choice-placeholder()。],
  choices: ([1], [2], [4], [8]),
  answers: ([A],),
  explanation: [记 $r_1=|P F_1|,r_2=|P F_2|$。面积给出 $r_1 r_2=8$，直角三角形给出 $r_1^2+r_2^2=4c^2$，双曲线定义给出 $|r_1-r_2|=2a$。故 $4a^2=4c^2-16$。又 $c^2=5a^2$，解得 $a=1$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知 $5^5<8^4,13^4<8^5$。设 $a=log_5 3,b=log_8 5,c=log_13 8$，则#choice-placeholder()。],
  choices: ([$a<b<c$], [$b<a<c$], [$b<c<a$], [$c<a<b$]),
  answers: ([A],),
  explanation: [由换底公式和基本不等式，$a/b=(ln 3 ln 8)/(ln 5)^2<=((ln 3+ln 8)/(2ln 5))^2=((ln 24)/(ln 25))^2<1$，故 $a<b$。另外，$5^5<8^4$ 给出 $b<4/5$，$13^4<8^5$ 给出 $c>4/5$，所以 $a<b<c$。],
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
  stem: [$(x^2+2/x)^6$ 的展开式中常数项是（用数字作答）#fill-placeholder()。],
  answers: ([$240$],),
  explanation: [通项为 $binom(6, r)2^r x^(12-3r)$。令 $12-3r=0$，得 $r=4$，常数项为 $binom(6, 4)2^4=240$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知圆锥的底面半径为 1，母线长为 3，则该圆锥内半径最大的球的体积为#fill-placeholder()。],
  answers: ([$(sqrt(2)pi)/3$],),
  explanation: [最大球为圆锥的内切球，过轴截面中的内切圆半径即球半径。轴截面为腰长 3、底边长 2 的等腰三角形，高为 $2sqrt(2)$，面积为 $2sqrt(2)$，半周长为 4。因此球半径 $r=(2sqrt(2))/4=sqrt(2)/2$，体积 $V=4/3 pi r^3=(sqrt(2)pi)/3$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [关于函数 $f(x)=sin x+1/(sin x)$ 有如下四个命题：\
    ① $f(x)$ 的图象关于 $y$ 轴对称；\
    ② $f(x)$ 的图象关于原点对称；\
    ③ $f(x)$ 的图象关于直线 $x=pi/2$ 对称；\
    ④ $f(x)$ 的最小值为 2。\
    其中所有真命题的序号是#fill-placeholder()。],
  answers: ([②③],),
  explanation: [定义域为 $\{x | x!=k pi,k in ZZ\}$，关于原点对称，且 $f(-x)=-f(x)$，故②正确。因 $f(pi/2)=2!=f(-pi/2)=-2$，①错误。由 $sin(pi-x)=sin x$，得 $f(pi-x)=f(x)$，故③正确。又 $f(-pi/2)=-2<2$，④错误。],
)

#section[解答题：共 70 分。第 17 至 21 题为必考题，每题 12 分；第 22、23 题为选考题。解答应写出文字说明、证明过程或演算步骤。]

#question(
  "solution",
  score: 12,
  stem: [设数列 $\{a_n\}$ 满足 $a_1=3,a_(n+1)=3a_n-4n$。],
  parts: (
    subquestion(
      stem: [计算 $a_2,a_3$，猜想 $\{a_n\}$ 的通项公式并加以证明。],
      answers: ([$a_2=5,a_3=7,a_n=2n+1$。],),
      explanation: [由递推式得 $a_2=3 times 3-4=5$，$a_3=3 times 5-8=7$，猜想 $a_n=2n+1$。当 $n=1$ 时成立；若 $a_k=2k+1$，则 $a_(k+1)=3(2k+1)-4k=2(k+1)+1$，故由数学归纳法，猜想对所有正整数 $n$ 成立。],
    ),
    subquestion(
      stem: [求数列 $\{2^n a_n\}$ 的前 $n$ 项和 $S_n$。],
      answers: ([$S_n=(2n-1)2^(n+1)+2$。],),
      explanation: [由上一问，$2^k a_k=(2k+1)2^k=(2k-1)2^(k+1)-(2k-3)2^k$。从 $k=1$ 至 $n$ 累加，中间项相消，得 $S_n=(2n-1)2^(n+1)-(-2)=(2n-1)2^(n+1)+2$。],
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
  stem: [如图，在长方体 $A B C D-A_1 B_1 C_1 D_1$ 中，点 $E,F$ 分别在棱 $D D_1,B B_1$ 上，且 $2D E=E D_1,B F=2F B_1$。#figure(box-diagram())],
  parts: (
    subquestion(
      stem: [证明：点 $C_1$ 在平面 $A E F$ 内。],
      answers: ([证明见解析。],),
      explanation: [由题意，$D E=B_1 F$ 且 $D E parallel B_1 F$，故四边形 $D E B_1 F$ 为平行四边形，其对角线 $D B_1,E F$ 互相平分。长方体的体对角线 $A C_1,D B_1$ 也互相平分，所以 $A C_1$ 经过 $E F$ 的中点。该中点与 $A$ 均在平面 $A E F$ 内，因此直线 $A C_1$ 在此平面内，即点 $C_1$ 在平面 $A E F$ 内。],
    ),
    subquestion(
      stem: [若 $A B=2,A D=1,A A_1=3$，求二面角 $A-E F-A_1$ 的正弦值。],
      answers: ([$sqrt(42)/7$。],),
      explanation: [#step[作出二面角的平面角][由已知尺寸，$D E=F B_1=1$，可得 $A E=sqrt(2),A F=2sqrt(2),E F=sqrt(6)$，所以 $A E perp E F$。取 $E F,A F$ 的中点分别为 $M,N$，则 $M N parallel E A$，故 $M N perp E F$。又 $A_1 E=A_1 F=sqrt(5)$，所以 $A_1 M perp E F$。射线 $M N$ 位于含 $A$ 的半平面内，故 $angle A_1 M N$ 为所求二面角的平面角。]
        #step[计算正弦][由中位线及勾股定理，$M N=sqrt(2)/2,A_1 M=sqrt(14)/2,A_1 N=sqrt(5)$。余弦定理给出
          $
            cos angle A_1 M N=(1/2+7/2-5)/(2 times sqrt(2)/2 times sqrt(14)/2)=-sqrt(7)/7.
          $
          因此所求正弦为 $sqrt(1-1/7)=sqrt(42)/7$。]
        #figure(box-diagram(auxiliary: true))],
    ),
  ),
)

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

#question(
  "solution",
  score: 12,
  stem: [设函数 $f(x)=x^3+b x+c$，曲线 $y=f(x)$ 在点 $(1/2,f(1/2))$ 处的切线与 $y$ 轴垂直。],
  parts: (
    subquestion(
      stem: [求 $b$。],
      answers: ([$-3/4$。],),
      explanation: [切线斜率为 0，而 $f'(x)=3x^2+b$，所以 $f'(1/2)=3/4+b=0$，得 $b=-3/4$。],
    ),
    subquestion(
      stem: [若 $f(x)$ 有一个绝对值不大于 1 的零点，证明：$f(x)$ 所有零点的绝对值都不大于 1。],
      answers: ([证明见解析。],),
      explanation: [#step[由已知零点限制参数][设已知零点为 $x_0 in [-1,1]$，则 $c=-x_0^3+3/4 x_0$。令 $h(x)=-x^3+3/4 x$，其导数为 $h'(x)=3/4-3x^2$。比较区间端点与驻点 $-1/2,1/2$ 处的值，得 $h([-1,1])=[-1/4,1/4]$，因此 $-1/4<=c<=1/4$。]
        #step[排除区间外的零点][当 $x>1$ 时，
          $ f(x)>=x^3-3/4 x-1/4=1/4(x-1)(2x+1)^2>0. $
          当 $x< -1$ 时，
          $ f(x)<=x^3-3/4 x+1/4=1/4(x+1)(2x-1)^2<0. $
          所以 $[-1,1]$ 外没有零点，结论成立。]],
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
