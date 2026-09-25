#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2024,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2024/2024上海.pdf",
  regions: ("上海",),
)

#let lighthouse() = cetz.canvas(length: 25mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let o = (0, 0)
  let a = (1, 0)
  let b = (0, 1)
  let t = (0.197864, 1.437458)
  line(o, a, t, b, o, t)
  for (point, label, anchor) in (
    (o, $O$, "north-east"),
    (a, $A$, "north-west"),
    (b, $B$, "east"),
    (t, $T$, "south"),
  ) { content(point, label, anchor: anchor, padding: 0.1) }
})
#let square-pyramid() = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (-1, -1, 0)
  let b = (1, -1, 0)
  let c = (1, 1, 0)
  let d = (-1, 1, 0)
  let o = (0, 0, 0)
  let p = (0, 0, calc.sqrt(2))
  oblique-project((1, 0), (0.4, 0.4), (0, 1.2), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, p, a)
    line(p, b)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(p, d, stroke: (dash: figure-style.dash))
    line(a, c, stroke: (dash: figure-style.dash))
    line(b, d, stroke: (dash: figure-style.dash))
    line(p, o, stroke: (dash: figure-style.dash))
    content(d, $D$, anchor: "east", padding: 0.4)
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "west"),
      (p, $P$, "south"),
      (o, $O$, "north"),
    ) { content(point, label, anchor: anchor, padding: 0.12) }
  })
})

#section[填空题。]
#question(
  "fill-in",
  stem: [已知全集 $U={1,2,3,4,5}$，若集合 $A={2,4}$，则 $complement_U A=$#fill-placeholder()。],
  answers: ([${1,3,5}$],),
  explanation: [从全集 $U$ 中去掉 $A$ 的元素 $2$，$4$，得 $complement_U A={1,3,5}$。],
)
#question(
  "fill-in",
  stem: [已知函数 $y=f(x)$ 的表达式为 $f(x)=cases(sqrt(x) & quad x>0, 1 & quad x<=0)$，则 $f(3)=$#fill-placeholder()。],
  answers: ([$sqrt(3)$],),
  explanation: [∵ $3>0$，∴ $f(3)=sqrt(3)$。],
)
#question(
  "fill-in",
  stem: [设 $x in RR$，不等式 $x^2-2x-3<0$ 的解集为#fill-placeholder()。],
  answers: ([$(-1,3)$],),
  explanation: [原不等式等价于 $(x+1)(x-3)<0$，解得 $-1<x<3$。],
)
#question(
  "fill-in",
  stem: [设 $a$ 为常数，若函数 $y=x^3+a$ 是奇函数，则 $a=$#fill-placeholder()。],
  answers: ([$0$],),
  explanation: [奇函数在原点处的函数值为 $0$，故 $a=0$；此时 $y=x^3$ 确为奇函数。],
)
#question(
  "fill-in",
  stem: [设 $k in RR$，向量 $arrow(a)=(2,5)$，$arrow(b)=(6,k)$，若 $arrow(a) parallel arrow(b)$，则 $k=$#fill-placeholder()。],
  answers: ([$15$],),
  explanation: [由平面向量平行的坐标条件，$2k-5 times 6=0$，解得 $k=15$。],
)
#question(
  "fill-in",
  stem: [在 $(x+1)^n$ 的二项展开式中，若各项系数和为 $32$，则 $x^2$ 项的系数为#fill-placeholder()。],
  answers: ([$10$],),
  explanation: [令 $x=1$，得各项系数和为 $2^n=32$，故 $n=5$。
    ∴ $x^2$ 项的系数为 $binom(5, 2)=10$。],
)
#question(
  "fill-in",
  stem: [若抛物线 $y^2=4x$ 上一点 $P$ 到其准线的距离为 $9$，则点 $P$ 到 $x$ 轴的距离为#fill-placeholder()。],
  answers: ([$4sqrt(2)$],),
  explanation: [准线为 $x=-1$。设 $P=(x_0,y_0)$，则 $x_0>=0$，$x_0+1=9$，得 $x_0=8$。
    ∴ 所求距离为 $abs(y_0)=sqrt(4 times 8)=4sqrt(2)$。],
)
#question(
  "fill-in",
  stem: [小王参加知识竞赛，题库中 $A$ 组题有 $5000$ 道，$B$ 组题有 $4000$ 道，$C$ 组题有 $3000$ 道。若小王做对这三组题的概率依次为 $0.92$、$0.86$、$0.72$，则随机从题库中抽取一道题，小王做对的概率是#fill-placeholder()。],
  answers: ([$0.85$],),
  explanation: [由全概率公式，所求概率为
    $
      5000/12000 times 0.92+4000/12000 times 0.86+3000/12000 times 0.72=0.85.
    $],
)
#question(
  "fill-in",
  stem: [设 $m in RR$，若虚数 $z$ 的实部为 $1$，且满足 $z+2/z=m$，则 $m=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [设 $z=1+t"i"$，其中 $t in RR$，$t!=0$。则
    $ z+2/z=1+2/(1+t^2)+t(1-2/(1+t^2))"i". $
    虚部为零，故 $1+t^2=2$，从而 $m=1+2/2=2$。],
)
#question(
  "fill-in",
  stem: [已知某集合中的元素是不重复的数字组成的三位正整数，若该集合中任意两个数的积均为偶数，则该集合的元素个数的最大值为#fill-placeholder()。],
  answers: ([$329$],),
  explanation: [集合中至多有一个奇数，可取全部符合要求的偶数及任意一个符合要求的奇数。
    个位为 $0$ 时，有 $9 times 8=72$ 个；个位为 $2,4,6,8$ 之一时，有 $4 times 8 times 8=256$ 个。
    因此最大元素个数为 $72+256+1=329$。],
)
#question(
  "fill-in",
  stem: [海上有灯塔 $O$、$A$、$B$ 和船只 $T$，$A$ 在 $O$ 的正东方向，$B$ 在 $O$ 的正北方向，$A$、$B$ 到 $O$ 的距离相等，$O$、$A$、$T$、$B$ 按逆时针排列。若 $angle A T O=37 degree$，$angle B T O=16.5 degree$，则 $angle B O T=$#fill-placeholder()。（结果精确到 $0.1$ 度）
    #figure(lighthouse())],
  answers: ([$7.8 degree$],),
  explanation: [设 $theta=angle B O T$，$O A=O B=1$。由图中位置关系，
    $ angle A O T=90 degree-theta, quad angle O A T=53 degree+theta, $
    $ angle O B T=180 degree-16.5 degree-theta. $
    分别在 $triangle O A T$ 和 $triangle O B T$ 中用正弦定理，得
    $
      O T=sin(53 degree+theta)/(sin 37 degree)=sin(16.5 degree+theta)/(sin 16.5 degree).
    $
    展开两角和的正弦并整理，得
    $
      tan theta=(sin 16.5 degree (cos 37 degree-sin 37 degree))/(sin 37 degree (cos 16.5 degree-sin 16.5 degree)).
    $
    ∴ $theta approx 7.8 degree$。],
)
#question(
  "fill-in",
  stem: [等比数列 ${a_n}$ 满足首项 $a_1>0$，公比 $q>1$，$I_n={x-y | x,y in [a_1,a_2] union [a_n,a_(n+1)]}$。若对任意正整数 $n$，$I_n$ 都是闭区间，则 $q$ 的取值范围是#fill-placeholder()。],
  answers: ([$[2,+infinity)$],),
  explanation: [当 $n=1$ 时，$I_1=[a_1-a_2,a_2-a_1]$，总是闭区间。
    当 $n>=2$ 时，$I_n$ 关于 $0$ 对称，其非负部分为
    $ [0,a_(n+1)-a_n] union [a_n-a_2,a_(n+1)-a_1]. $
    两区间相接或重叠，等价于 $a_n-a_2<=a_(n+1)-a_n$，即
    $ (2-q)q^(n-1)<=q. $
    若 $q>=2$，该式对所有 $n>=2$ 成立；若 $1<q<2$，左边随 $n$ 增大而无界，不能恒成立。
    故 $q in [2,+infinity)$。],
)

#section[选择题。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [若气温（单位：摄氏度）和海水表层温度（单位：摄氏度）的相关系数为正数，则下列关于两者关系的说法正确的是#choice-placeholder()。],
  choices: (
    [随着气温由低变高，海水表层温度由低变高],
    [随着气温由低变高，海水表层温度由高变低],
    [随着气温由低变高，海水表层温度有由低变高的趋势],
    [随着气温由低变高，海水表层温度有由高变低的趋势],
  ),
  answers: ([C],),
  explanation: [相关系数为正，表示两个变量正相关，即气温升高时海水表层温度整体呈升高趋势，并不意味着每次都同时升高。],
)
#question(
  "single-choice",
  stem: [下列函数中，最小正周期是 $2pi$ 的是#choice-placeholder()。],
  choices: (
    [$y=sin x+cos x$],
    [$y=sin x cos x$],
    [$y=sin^2 x+cos^2 x$],
    [$y=sin^2 x-cos^2 x$],
  ),
  answers: ([A],),
  explanation: [选项 A 为 $y=sqrt(2)sin(x+pi/4)$，最小正周期为 $2pi$。
    选项 B 为 $y=1/2 sin 2x$，选项 D 为 $y=-cos 2x$，最小正周期均为 $pi$。
    选项 C 为常函数 $y=1$，没有最小正周期。],
)
#question(
  "single-choice",
  stem: [已知空间直角坐标系 $O x y z$ 中的点集 $Omega$，对任意的 $P_1,P_2,P_3 in Omega$，均存在不全为 $0$ 的实数 $lambda_1,lambda_2,lambda_3$ 满足 $lambda_1 arrow(O P_1)+lambda_2 arrow(O P_2)+lambda_3 arrow(O P_3)=arrow(0)$。若 $(1,0,0) in Omega$，则 $(0,0,1) in.not Omega$ 的一个充分条件是#choice-placeholder()。],
  choices: (
    [$(0,0,0) in Omega$],
    [$(-1,0,0) in Omega$],
    [$(0,-1,0) in Omega$],
    [$(0,0,-1) in Omega$],
  ),
  answers: ([C],),
  explanation: [若 $(0,-1,0) in Omega$ 且 $(0,0,1) in Omega$，则题设线性组合变为 $(lambda_1,-lambda_2,lambda_3)=(0,0,0)$，迫使三个系数全为 $0$，矛盾。
    对其他选项，取 $Omega$ 为整个 $x O z$ 平面上的点集：任意三个对应向量均线性相关，且各选项的点及 $(0,0,1)$ 都在其中，故都不是充分条件。],
)
#question(
  "single-choice",
  stem: [已知定义在 $RR$ 上的函数 $y=f(x)$，$M={x_0 | "对任意" x in (-infinity,x_0),f(x)<f(x_0)}$。对于使得 $M=[-1,1]$ 的函数 $y=f(x)$，以下说法正确的是#choice-placeholder()。],
  choices: (
    [存在 $y=f(x)$ 是偶函数],
    [存在 $y=f(x)$ 在 $x=2$ 处取得最大值],
    [存在 $y=f(x)$ 是严格增函数],
    [存在 $y=f(x)$ 在 $x=-1$ 处取得极小值],
  ),
  answers: ([B],),
  explanation: [
    #step[选项 B][取 $f(x)=cases(0 & quad x< -1, x+2 & quad -1<=x<=1, 3 & quad x>1)$。
      当 $x_0 in [-1,1]$ 时，其函数值严格大于左侧所有函数值；其他 $x_0$ 均不满足此条件，故 $M=[-1,1]$。
      函数最大值为 $3$，在 $x=2$ 处也取得，故 B 正确。]
    #step[其他选项][由 $1 in M$，得 $f(-1)<f(1)$，不可能为偶函数。
      严格增函数必有 $M=RR$，不符合要求。
      由 $-1 in M$，知 $-1$ 左侧的函数值都小于 $f(-1)$，因此 $-1$ 不可能为极小值点。]
  ],
)

#section[解答题。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  stem: [如图，在正四棱锥 $P-A B C D$ 中，$O$ 为底面 $A B C D$ 的中心。
    #figure(square-pyramid())],
  parts: (
    subquestion(
      stem: [若 $A P=5$，$A D=3sqrt(2)$，将 $triangle P O A$ 绕直线 $P O$ 旋转一周，求所得旋转体的体积；],
      answers: ([$12pi$。],),
      explanation: [正四棱锥中 $P O perp$ 底面 $A B C D$，且 $O A=(sqrt(2))/2 A D=3$。
        ∴ $P O=sqrt(P A^2-O A^2)=4$。
        旋转体为底面半径 $3$、高 $4$ 的圆锥，体积为 $1/3 pi times 3^2 times 4=12pi$。],
    ),
    subquestion(
      stem: [若 $A P=A D$，$E$ 为 $P B$ 的中点，求直线 $B D$ 与平面 $A E C$ 所成角的大小。],
      answers: ([$45 degree$。],),
      explanation: [以 $O$ 为原点，平行于 $A B$、$A D$ 的方向及 $O P$ 的方向为坐标轴正方向。设正方形边长为 $2$，则
        $ A=(-1,-1,0), quad B=(1,-1,0), quad C=(1,1,0), quad D=(-1,1,0). $
        由 $P A=2$，得 $P=(0,0,sqrt(2))$，故 $E=(1/2,-1/2,sqrt(2)/2)$。
        平面 $A E C$ 的一个法向量为 $arrow(n)=(1,-1,-sqrt(2))$，而 $arrow(B D)=(-2,2,0)$。
        设所求角为 $theta$，则
        $
          sin theta=abs(arrow(B D) dot arrow(n))/(abs(arrow(B D)) abs(arrow(n)))=4/(2sqrt(2) times 2)=sqrt(2)/2.
        $
        ∴ $theta=45 degree$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知 $f(x)=log_a x$（$a>0$ 且 $a!=1$）。],
  parts: (
    subquestion(
      stem: [若函数 $y=f(x)$ 的图象过点 $(4,2)$，求 $f(2x-2)<f(x)$ 的解集；],
      answers: ([$(1,2)$。],),
      explanation: [由 $log_a 4=2$，得 $a=2$。
        ∵ $log_2 x$ 严格递增，∴ 原不等式等价于 $0<2x-2<x$，解得 $1<x<2$。],
    ),
    subquestion(
      stem: [若存在 $x$ 使 $f(x+1)$、$f(a x)$、$f(x+2)$ 依次成等差数列，求 $a$ 的取值范围。],
      answers: ([$(1,+infinity)$。],),
      explanation: [三个对数有意义，要求 $x>0$。等差数列条件等价于
        $ 2log_a (a x)=log_a (x+1)+log_a (x+2), $
        即 $a^2 x^2=(x+1)(x+2)$，整理得
        $ a^2=1+3/x+2/x^2. $
        右边在 $(0,+infinity)$ 上连续、严格递减，值域为 $(1,+infinity)$。
        又 $a>0$，故存在这样的 $x$ 的充要条件为 $a>1$。],
    ),
  ),
)
#question(
  "solution",
  stem: [某地区为调查初中学生体育锻炼时长与学业成绩的关系，从该地区 $29000$ 名初中生中抽取 $580$ 人，得到日均体育锻炼时长（表中简称时长，单位：小时）与学业成绩的数据如下表所示：
    #table(
      columns: 7,
      align: center,
      [时长],
      [$[0,0.5)$],
      [$[0.5,1)$],
      [$[1,1.5)$],
      [$[1.5,2)$],
      [$[2,2.5)$],
      [合计],

      [优秀], [$5$], [$44$], [$42$], [$3$], [$1$], [$95$],
      [不优秀], [$134$], [$147$], [$137$], [$40$], [$27$], [$485$],
      [合计], [$139$], [$191$], [$179$], [$43$], [$28$], [$580$],
    )],
  parts: (
    subquestion(
      stem: [估计该地区 $29000$ 名初中生中体育锻炼时长不少于 $1$ 小时的人数；],
      answers: ([$12500$ 人。],),
      explanation: [所求人数的估计值为 $29000 times (179+43+28)/580=12500$（人）。],
    ),
    subquestion(
      stem: [估计该地区初中生平均日均体育锻炼时长。（结果精确到 $0.1$ 小时）],
      answers: ([$0.9$ 小时。],),
      explanation: [以各组区间中点作为代表值，平均时长估计为
        $
          (0.25 times 139+0.75 times 191+1.25 times 179+1.75 times 43+2.25 times 28)/580 approx 0.9
        $
        （小时）。],
    ),
    subquestion(
      stem: [判断是否有 $95%$ 的把握认为该地区初中生学业成绩优秀与日均体育锻炼时长不小于 $1$ 小时且小于 $2$ 小时有关。
        #table(
          columns: 4,
          align: center,
          [时长], [$[1,2)$], [其他], [合计],
          [优秀], [$a$], [$b$], [$a+b$],
          [不优秀], [$c$], [$d$], [$c+d$],
          [合计], [$a+c$], [$b+d$], [$a+b+c+d$],
        )
        附：$chi^2=(n(a d-b c)^2)/((a+b)(c+d)(a+c)(b+d))$，其中 $n=a+b+c+d$，$P(chi^2>=3.841) approx 0.05$。],
      answers: ([有 $95%$ 的把握认为二者有关。],),
      explanation: [由题中数据，得 $a=45$，$b=50$，$c=177$，$d=308$，从而
        $
          chi^2=(580(45 times 308-50 times 177)^2)/(95 times 485 times 222 times 358) approx 3.976>3.841.
        $
        因此有 $95%$ 的把握认为二者有关。],
    ),
  ),
)
#question(
  "solution",
  stem: [双曲线 $Gamma:x^2-y^2/b^2=1$（$b>0$），左、右顶点分别为 $A_1$、$A_2$，过点 $M(-2,0)$ 的直线交 $Gamma$ 于 $P$、$Q$ 两点。],
  parts: (
    subquestion(
      stem: [若离心率 $e=2$，求 $b$ 的值；],
      answers: ([$sqrt(3)$。],),
      explanation: [实半轴长为 $1$，半焦距为 $sqrt(1+b^2)$，故 $sqrt(1+b^2)=2$，解得 $b=sqrt(3)$。],
    ),
    subquestion(
      stem: [若 $b=(2sqrt(6))/3$，点 $P$ 在第一象限，$triangle M A_2 P$ 为等腰三角形，求点 $P$ 的坐标；],
      answers: ([$(2,2sqrt(2))$。],),
      explanation: [设 $P=(x,y)$，则 $x>1$，$y>0$，故 $angle M A_2 P$ 为钝角。
        等腰三角形的钝角必为顶角，∴ $A_2 P=M A_2=3$。
        联立 $(x-1)^2+y^2=9$ 与 $y^2=8/3(x^2-1)$，得
        $ 11x^2-6x-32=(x-2)(11x+16)=0. $
        由 $x>1$，得 $x=2$，继而 $y=2sqrt(2)$。],
    ),
    subquestion(
      stem: [连接 $Q O$（$O$ 为坐标原点）并延长交 $Gamma$ 于点 $R$，若 $arrow(A_1 R) dot arrow(A_2 P)=1$，求 $b$ 的取值范围。],
      answers: ([$(0,sqrt(3)) union (sqrt(3),sqrt(30)/3]$。],),
      explanation: [
        #step[设直线并保留两交点条件][若直线为 $y=0$，其交点为双曲线两顶点，题设数量积为 $0$，不符合条件。
          因此可设直线为 $x=m y-2$。设 $P=(x_1,y_1)$，$Q=(x_2,y_2)$，代入双曲线得
          $ (b^2 m^2-1)y^2-4b^2 m y+3b^2=0. $
          有两个交点要求 $b^2 m^2!=1$；此时判别式为 $4b^4 m^2+12b^2>0$。
          由韦达定理，
          $ y_1+y_2=(4b^2 m)/(b^2 m^2-1), quad y_1 y_2=(3b^2)/(b^2 m^2-1). $]
        #step[化简数量积条件][由双曲线关于原点对称，$R=(-x_2,-y_2)$。
          数量积条件为 $(1-x_2)(x_1-1)-y_1 y_2=1$。
          代入 $x_i=m y_i-2$，整理为
          $ (m^2+1)y_1 y_2-3m(y_1+y_2)+10=0. $
          代入根与系数关系，得 $b^2(m^2+3)=10$。]
        #step[确定范围并验证可取][由 $m^2>=0$，得 $0<b^2<=10/3$。
          又 $b^2 m^2=10-3b^2!=1$，须排除 $b^2=3$。
          反之，对上述范围内的任意 $b$，取 $m^2=10/b^2-3$，所得直线均有两个不同交点，且满足数量积条件。
          故 $b in (0,sqrt(3)) union (sqrt(3),sqrt(30)/3]$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [设 $D$ 是 $RR$ 的一个非空子集，$y=f(x)$ 是定义在 $D$ 上的函数。对于点 $M(a,b)$，记 $s(x)=(x-a)^2+(f(x)-b)^2$。若对于点 $P(x_0,f(x_0))$，满足函数 $y=s(x)$ 在 $x=x_0$ 处取得最小值，则称 $P$ 是 $M$ 的 $f$ 最近点。],
  parts: (
    subquestion(
      stem: [$f(x)=1/x$，$M(0,0)$，$D=(0,+infinity)$，求证：存在 $M$ 的 $f$ 最近点；],
      answers: ([存在，最近点为 $(1,1)$。],),
      explanation: [对 $x>0$，$s(x)=x^2+1/x^2>=2$，等号当且仅当 $x=1$ 时成立。
        因此存在最近点 $P=(1,1)$。],
    ),
    subquestion(
      stem: [$f(x)=e^x$，$M(1,0)$，$D=RR$。若曲线 $y=f(x)$ 上一点 $P$ 满足 $M P$ 垂直于 $y=f(x)$ 在点 $P(x_0,f(x_0))$ 处的切线，则 $P$ 是否为 $M$ 的 $f$ 最近点？],
      answers: ([是，$P=(0,1)$。],),
      explanation: [切线方向向量为 $(1,e^(x_0))$，$arrow(M P)=(x_0-1,e^(x_0))$，故垂直条件为 $x_0-1+e^(2x_0)=0$。
        令 $h(x)=x-1+e^(2x)$，则 $h'(x)=1+2e^(2x)>0$，且 $h(0)=0$，从而 $x_0=0$。
        又 $s(x)=(x-1)^2+e^(2x)$，$s'(x)=2h(x)$。
        故 $s$ 在 $(-infinity,0)$ 上严格递减，在 $(0,+infinity)$ 上严格递增，在 $x=0$ 处取得最小值。
        因此 $P=(0,1)$ 是 $M$ 的 $f$ 最近点。],
    ),
    subquestion(
      stem: [已知 $D=RR$，$y=f(x)$ 的导函数为 $y=f'(x)$，$y=g(x)$ 在 $RR$ 上的函数值恒正。对任意 $t in RR$，点 $M_1$ 的坐标为 $(t-1,f(t)-g(t))$，点 $M_2$ 的坐标为 $(t+1,f(t)+g(t))$。若对任意的 $t in RR$，总存在 $y=f(x)$ 上一点 $P$，使得 $P$ 既是 $M_1$ 的 $f$ 最近点，又是 $M_2$ 的 $f$ 最近点，试求 $y=f(x)$ 的单调性。],
      answers: ([在 $RR$ 上严格递减。],),
      explanation: [
        #step[确定共同最近点][固定任意 $t$，记 $H=(t,f(t))$，共同最近点为 $P=(x_0,f(x_0))$。
          令 $u=x_0-t$，$v=f(x_0)-f(t)$，$g=g(t)>0$。
          ∵ $H$ 也在曲线上，∴ $P M_i^2<=H M_i^2$（$i=1,2$）。两式相加，得
          $ 2(u^2+v^2+1+g^2)<=2(1+g^2). $
          ∴ $u^2+v^2<=0$，所以 $P=H$。]
        #step[利用极值的必要条件][点 $M_1$ 到曲线上点的距离平方为
          $ s_1(x)=(x-t+1)^2+(f(x)-f(t)+g(t))^2. $
          由 $s_1$ 在 $x=t$ 处取得最小值，得 $s_1'(t)=2(1+g(t)f'(t))=0$，故 $f'(t)=-1/g(t)<0$。
          由于 $t$ 任意，$f$ 在 $RR$ 上严格递减。]
      ],
    ),
  ),
)
