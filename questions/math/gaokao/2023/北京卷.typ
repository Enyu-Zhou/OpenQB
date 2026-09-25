#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2023,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2023/2023北京.pdf",
  regions: ("北京",),
)

#let roof-diagram() = cetz.canvas(length: 2.8mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (25, 0, 0)
  let c = (25, 10, 0)
  let d = (0, 10, 0)
  let e = (20, 5, calc.sqrt(14))
  let f = (5, 5, calc.sqrt(14))
  oblique-project((1, 0), (0.4, 0.6), (0, 1.4), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, e, f, d, a)
    line(a, f)
    line(b, e)
    line(d, c, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "west"),
      (d, $D$, "east"),
      (e, $E$, "south"),
      (f, $F$, "south"),
    ) { content(point, label, anchor: anchor, padding: 0.45) }
  })
})

#let pyramid-diagram() = cetz.canvas(length: 28mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (1, 0, 0)
  let c = (1, 1, 0)
  let p = (0, 0, 1)
  oblique-project((0.8, -0.5), (0.8, 0.5), (0, 1.25), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, a, b, c, p, b)
    line(a, c, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (p, $P$, "south"),
    ) { content(point, label, anchor: anchor, padding: 0.08) }
  })
})

#section[选择题：本大题共 10 小题，每小题 4 分，共 40 分。在每小题列出的四个选项中，选出符合题目要求的一项。]
#question(
  "single-choice",
  stem: [已知集合 $M={x | x+2>=0}$，$N={x | x-1<0}$，则 $M inter N=$#choice-placeholder()。],
  choices: (
    [${x | -2<=x<1}$],
    [${x | -2<x<=1}$],
    [${x | x>=-2}$],
    [${x | x<1}$],
  ),
  answers: ([A],),
  explanation: [$M=[-2,+infinity)$，$N=(-infinity,1)$，所以 $M inter N=[-2,1)$。],
)
#question(
  "single-choice",
  stem: [在复平面内，复数 $z$ 对应的点的坐标是 $(-1,sqrt(3))$，则 $z$ 的共轭复数 $overline(z)=$#choice-placeholder()。],
  choices: (
    [$1+sqrt(3)"i"$],
    [$1-sqrt(3)"i"$],
    [$-1+sqrt(3)"i"$],
    [$-1-sqrt(3)"i"$],
  ),
  answers: ([D],),
  explanation: [$z=-1+sqrt(3)"i"$，取共轭时虚部变号，得 $overline(z)=-1-sqrt(3)"i"$。],
)
#question(
  "single-choice",
  stem: [已知向量 $bold(a),bold(b)$ 满足 $bold(a)+bold(b)=(2,3)$，$bold(a)-bold(b)=(-2,1)$，则 $abs(bold(a))^2-abs(bold(b))^2=$#choice-placeholder()。],
  choices: ([$-2$], [$-1$], [$0$], [$1$]),
  answers: ([B],),
  explanation: [$abs(bold(a))^2-abs(bold(b))^2=(bold(a)+bold(b)) dot (bold(a)-bold(b))=2 times (-2)+3 times 1=-1$。],
)
#question(
  "single-choice",
  stem: [下列函数中，在区间 $(0,+infinity)$ 上单调递增的是#choice-placeholder()。],
  choices: ([$f(x)=-ln x$], [$f(x)=1/2^x$], [$f(x)=-1/x$], [$f(x)=3^abs(x-1)$]),
  answers: ([C],),
  explanation: [A、B 在该区间均递减；C 的导数为 $1/x^2>0$，故递增；D 在 $(0,1)$ 上递减，在 $(1,+infinity)$ 上递增。故选 C。],
)
#question(
  "single-choice",
  stem: [在 $(2x-1/x)^5$ 的展开式中，$x$ 的系数为#choice-placeholder()。],
  choices: ([$-40$], [$40$], [$-80$], [$80$]),
  answers: ([D],),
  explanation: [通项为 $binom(5, k)(2x)^(5-k)(-1/x)^k=(-1)^k 2^(5-k)binom(5, k)x^(5-2k)$。令 $5-2k=1$，得 $k=2$，故所求系数为 $2^3 binom(5, 2)=80$。],
)
#question(
  "single-choice",
  stem: [已知抛物线 $C:y^2=8x$ 的焦点为 $F$，点 $M$ 在 $C$ 上。若 $M$ 到直线 $x=-3$ 的距离为 $5$，则 $abs(M F)=$#choice-placeholder()。],
  choices: ([$7$], [$6$], [$5$], [$4$]),
  answers: ([D],),
  explanation: [抛物线上点的横坐标非负，故 $x_M+3=5$，得 $x_M=2$。准线为 $x=-2$，由抛物线定义，$abs(M F)=x_M+2=4$。],
)
#question(
  "single-choice",
  stem: [在 $triangle A B C$ 中，$(a+c)(sin A-sin C)=b(sin A-sin B)$，则 $angle C=$#choice-placeholder()。],
  choices: ([$pi/6$], [$pi/3$], [$(2pi)/3$], [$(5pi)/6$]),
  answers: ([B],),
  explanation: [由正弦定理，$(a+c)(a-c)=b(a-b)$，整理得 $a^2+b^2-c^2=a b$。所以 $cos C=(a^2+b^2-c^2)/(2a b)=1/2$。因 $0<C<pi$，得 $C=pi/3$。],
)
#question(
  "single-choice",
  stem: [若 $x y!=0$，则“$x+y=0$”是“$y/x+x/y=-2$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([C],),
  explanation: [因 $x y!=0$，$y/x+x/y=-2$ 等价于 $x^2+y^2=-2x y$，即 $(x+y)^2=0$，也就是 $x+y=0$。故为充要条件。],
)
#question(
  "single-choice",
  stem: [坡屋顶是我国传统建筑造型之一，蕴含着丰富的数学元素。安装灯带可以勾勒出建筑轮廓，展现造型之美。如图，某坡屋顶可视为一个五面体，其中两个面是全等的等腰梯形，两个面是全等的等腰三角形。若 $A B=25$ m，$B C=A D=10$ m，且等腰梯形所在平面、等腰三角形所在平面与平面 $A B C D$ 的夹角的正切值均为 $sqrt(14)/5$，则该五面体的所有棱长之和为#choice-placeholder()。#figure(roof-diagram())],
  choices: ([$102$ m], [$112$ m], [$117$ m], [$125$ m]),
  answers: ([C],),
  explanation: [由屋顶的对称性，屋脊位于底面中线正上方。设屋脊到底面的高为 $h$，由梯形面与底面的夹角，得 $h/5=sqrt(14)/5$，故 $h=sqrt(14)$。
    两端三角形面的倾角与梯形面的倾角相同，所以屋脊两端在底面上的投影距相应短边均为 $5$，故屋脊长为 $25-2 times 5=15$。
    四条斜棱的长均为 $sqrt(5^2+5^2+h^2)=8$，所以所有棱长之和为 $2(25+10)+15+4 times 8=117$ m。],
)
#question(
  "single-choice",
  stem: [已知数列 $a_n$ 满足 $a_(n+1)=1/4(a_n-6)^3+6$（$n=1,2,3,dots.c$），则#choice-placeholder()。],
  choices: (
    [当 $a_1=3$ 时，$a_n$ 为递减数列，且存在常数 $M<=0$，使得 $a_n>M$ 恒成立],
    [当 $a_1=5$ 时，$a_n$ 为递增数列，且存在常数 $M<=6$，使得 $a_n<M$ 恒成立],
    [当 $a_1=7$ 时，$a_n$ 为递减数列，且存在常数 $M>6$，使得 $a_n>M$ 恒成立],
    [当 $a_1=9$ 时，$a_n$ 为递增数列，且存在常数 $M>0$，使得 $a_n<M$ 恒成立],
  ),
  answers: ([B],),
  explanation: [令 $t_n=(a_n-6)/2$，则 $t_(n+1)=t_n^3$，故 $t_n=t_1^(3^(n-1))$，$a_n=6+2t_1^(3^(n-1))$。
    $a_1=3$ 或 $9$ 时，$t_1$ 分别为 $-3/2$ 或 $3/2$，数列分别趋于 $-infinity$ 或 $+infinity$，不存在题述的界。
    $a_1=5$ 时，$t_1=-1/2$，$a_n$ 递增且恒小于 $6$，取 $M=6$ 即可。
    $a_1=7$ 时，$t_1=1/2$，$a_n$ 递减趋于 $6$，不存在大于 $6$ 的下界。故选 B。],
)

#section[填空题：本大题共 5 小题，每小题 5 分，共 25 分。]
#question(
  "fill-in",
  stem: [已知函数 $f(x)=4^x+log_2 x$，则 $f(1/2)=$#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [$f(1/2)=4^(1/2)+log_2(1/2)=2-1=1$。],
)
#question(
  "fill-in",
  stem: [已知双曲线 $C$ 的焦点为 $(-2,0)$ 和 $(2,0)$，离心率为 $sqrt(2)$，则 $C$ 的方程为#fill-placeholder()。],
  answers: ([$x^2/2-y^2/2=1$],),
  explanation: [焦点在 $x$ 轴上，且 $c=2$。由 $c/a=sqrt(2)$，得 $a^2=2$，$b^2=c^2-a^2=2$，故所求方程为 $x^2/2-y^2/2=1$。],
)
#question(
  "fill-in",
  stem: [已知命题 $p$：若 $alpha,beta$ 为第一象限角，且 $alpha>beta$，则 $tan alpha>tan beta$。能说明 $p$ 为假命题的一组 $alpha,beta$ 的值为 $alpha=$#fill-placeholder()，$beta=$#fill-placeholder()。],
  answers: ([$(9pi)/4$], [$pi/3$（答案不唯一）]),
  explanation: [取 $alpha=(9pi)/4$、$beta=pi/3$，两角均为第一象限角，且 $alpha>beta$，但 $tan alpha=1<sqrt(3)=tan beta$，故构成反例。],
)
#question(
  "fill-in",
  stem: [我国度量衡的发展有着悠久的历史，战国时期就已经出现了类似于砝码的、用来测量物体质量的“环权”。已知 $9$ 枚环权的质量（单位：铢）从小到大构成项数为 $9$ 的数列 $a_n$，该数列的前 $3$ 项成等差数列，后 $7$ 项成等比数列，且 $a_1=1$，$a_5=12$，$a_9=192$，则 $a_7=$#fill-placeholder()；数列 $a_n$ 所有项的和为#fill-placeholder()。],
  answers: ([$48$], [$384$]),
  explanation: [设后七项的公比为 $q>0$，由 $q^4=a_9/a_5=16$，得 $q=2$。于是 $a_3=a_5/q^2=3$，$a_7=a_5 q^2=48$。
    前三项成等差数列，故 $a_2=(a_1+a_3)/2=2$。所有项之和为 $1+2+3(2^7-1)/(2-1)=384$。],
)
#question(
  "fill-in",
  stem: [设 $a>0$，函数
    $
      f(x)=cases(x+2&quad x< -a, sqrt(a^2-x^2)&quad -a<=x<=a, -sqrt(x)-1&quad x>a).
    $
    给出下列四个结论：
    #parbreak()
    ① $f(x)$ 在区间 $(a-1,+infinity)$ 上单调递减；
    #parbreak()
    ② 当 $a>=1$ 时，$f(x)$ 存在最大值；
    #parbreak()
    ③ 设 $M(x_1,f(x_1))$（$x_1<=a$），$N(x_2,f(x_2))$（$x_2>a$），则 $abs(M N)>1$；
    #parbreak()
    ④ 设 $P(x_3,f(x_3))$（$x_3< -a$），$Q(x_4,f(x_4))$（$x_4>=-a$）。若 $abs(P Q)$ 存在最小值，则 $a$ 的取值范围是 $(0,1/2]$。
    #parbreak()
    其中所有正确结论的序号是#fill-placeholder()。],
  answers: ([②③],),
  explanation: [
    #step[判断①②][取 $a=1/2$，$f$ 在 $(-1/2,0)$ 上递增，该区间包含于 $(a-1,+infinity)$，故①错误。
      当 $a>=1$ 时，左段满足 $f(x)<2-a<=1<=a$，中段最大值为 $f(0)=a$，右段为负，故全局最大值为 $a$，②正确。]
    #step[判断③][若 $-a<=x_1<=a$，则 $f(x_1)>=0$，而 $f(x_2)=-sqrt(x_2)-1< -1$，所以 $abs(M N)>=abs(f(x_1)-f(x_2))>1$。
      若 $x_1< -a$，则 $M$ 在直线 $y=x+2$ 上，$abs(M N)$ 不小于 $N$ 到该直线的距离，即
      $ abs(M N)>=(x_2+sqrt(x_2)+3)/sqrt(2)>1. $
      故③正确。]
    #step[判断④][取 $a=3/4$。上半圆上任意一点 $Q=(x,y)$ 满足 $y-x<=sqrt(2)sqrt(x^2+y^2)=3sqrt(2)/4$，故其到直线 $y=x+2$ 的距离至少为 $sqrt(2)-3/4$。
      取 $Q=(-3sqrt(2)/8,3sqrt(2)/8)$，其在该直线上的垂足为 $P=(-1,1)$，满足 $x_P< -3/4$，所以这一下界可以取到。
      右段曲线到该直线的距离大于 $3/sqrt(2)$，不会给出更小距离。因此 $abs(P Q)$ 存在最小值 $sqrt(2)-3/4$，但 $a=3/4 in.not (0,1/2]$，故④错误。]
  ],
)

#section[解答题：本大题共 6 小题，共 85 分。解答应写出文字说明、演算步骤或证明过程。]
#question(
  "solution",
  stem: [如图，在三棱锥 $P-A B C$ 中，$P A perp "平面" A B C$，$P A=A B=B C=1$，$P C=sqrt(3)$。#figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [求证：$B C perp "平面" P A B$。],
      answers: ([证明见解析。],),
      explanation: [因 $P A perp "平面" A B C$，故 $P A perp A C$、$P A perp B C$。
        在直角三角形 $P A C$ 中，$A C^2=P C^2-P A^2=2=A B^2+B C^2$，所以 $A B perp B C$。
        又 $P A inter A B={A}$，故 $B C perp "平面" P A B$。],
    ),
    subquestion(
      stem: [求二面角 $A-P C-B$ 的大小。],
      answers: ([$60 degree$],),
      explanation: [由上一问，取 $A=(0,0,0)$，$B=(1,0,0)$，$C=(1,1,0)$，$P=(0,0,1)$。
        棱 $P C$ 的方向向量为 $bold(e)=(1,1,-1)$。将 $arrow(P A)$、$arrow(P B)$ 在垂直于 $bold(e)$ 的平面上投影，得
        $ bold(u)=(-1/3,-1/3,-2/3), quad bold(v)=(1/3,-2/3,-1/3). $
        两向量分别指向二面角的两个半平面内部，故所求角 $theta$ 满足
        $
          cos theta=(bold(u) dot bold(v))/(abs(bold(u))abs(bold(v)))=(1/3)/(2/3)=1/2.
        $
        所以二面角为 $60 degree$。],
    ),
  ),
)
#question(
  "solution",
  stem: [设函数 $f(x)=sin omega x cos phi+cos omega x sin phi$（$omega>0$，$abs(phi)<pi/2$）。],
  parts: (
    subquestion(
      stem: [若 $f(0)=-sqrt(3)/2$，求 $phi$ 的值。],
      answers: ([$phi=-pi/3$],),
      explanation: [$f(x)=sin(omega x+phi)$，故 $sin phi=-sqrt(3)/2$。由 $-pi/2<phi<pi/2$，得 $phi=-pi/3$。],
    ),
    subquestion(
      stem: [已知 $f(x)$ 在区间 $[-pi/3,(2pi)/3]$ 上单调递增，$f((2pi)/3)=1$，再从条件①、条件②、条件③这三个条件中选择一个作为已知，使函数 $f(x)$ 存在，求 $omega,phi$ 的值。
        #parbreak()
        条件①：$f(pi/3)=sqrt(2)$；
        #parbreak()
        条件②：$f(-pi/3)=-1$；
        #parbreak()
        条件③：$f(x)$ 在区间 $[-pi/2,-pi/3]$ 上单调递减。
        #parbreak()
        注：如果选择的条件不符合要求，第（2）问得 0 分；如果选择多个符合要求的条件分别解答，按第一个解答计分。],
      answers: ([选择条件②或③，$omega=1$，$phi=-pi/6$；条件①不符合要求。],),
      explanation: [
        #step[选择条件②][函数在所给区间从最小值 $-1$ 单调增加到最大值 $1$，故这段区间恰为半个周期，$pi/omega=pi$，得 $omega=1$。
          由 $f((2pi)/3)=1$，有 $2pi/3+phi=pi/2+2k pi$，所以 $phi=-pi/6+2k pi$。结合 $abs(phi)<pi/2$，得 $phi=-pi/6$。
          此时 $f(x)=sin(x-pi/6)$，确实满足各条件。]
        #step[其余条件][若选③，则 $f$ 在 $-pi/3$ 左侧递减、右侧递增，所以在此处取得极小值 $-1$，转化为条件②，所得参数相同。
          条件①要求函数值为 $sqrt(2)>1$，超出正弦函数值域，不符合要求。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [为研究某种农产品价格变化的规律，收集得到了该农产品连续 $40$ 天的价格变化数据，如下表所示。在描述价格变化时，用“+”表示“上涨”，即当天价格比前一天价格高；用“−”表示“下跌”，即当天价格比前一天价格低；用“0”表示“不变”，即当天价格与前一天价格相同。
    #block[
      #set text(size: 9pt)
      #table(
        columns: (9em, ..range(20).map(_ => 1fr)),
        align: center + horizon,
        inset: 2pt,
        [时段], table.cell(colspan: 20)[价格变化],
        [第 1 天到第 20 天],
        .."-++0---++0+0--+-+00+"
          .clusters()
          .map(s => if s == "-" { [$-$] } else if s == "+" { [$+$] } else {
            [$0$]
          }),
        [第 21 天到第 40 天],
        .."0++0---++0+0+---+0-+"
          .clusters()
          .map(s => if s == "-" { [$-$] } else if s == "+" { [$+$] } else {
            [$0$]
          }),
      )
    ]
    用频率估计概率。],
  parts: (
    subquestion(
      stem: [试估计该农产品价格“上涨”的概率。],
      answers: ([$0.4$],),
      explanation: [$40$ 天中“上涨”共 $16$ 天，所以所求概率估计值为 $16/40=0.4$。],
    ),
    subquestion(
      stem: [假设该农产品每天的价格变化是相互独立的。在未来的日子里任取 $4$ 天，试估计该农产品价格在这 $4$ 天中 $2$ 天“上涨”、$1$ 天“下跌”、$1$ 天“不变”的概率。],
      answers: ([$0.168$],),
      explanation: [“下跌”和“不变”分别出现 $14$ 次、$10$ 次，概率估计值为 $0.35$、$0.25$。
        由独立性，所求概率估计值为 $binom(4, 2)binom(2, 1) times 0.4^2 times 0.35 times 0.25=0.168$。],
    ),
    subquestion(
      stem: [假设该农产品每天的价格变化只受前一天价格变化的影响。判断第 $41$ 天该农产品价格“上涨”“下跌”和“不变”的概率估计值哪个最大。（结论不要求证明）],
      answers: ([“不变”的概率估计值最大。],),
      explanation: [第 $40$ 天为“上涨”。在前 $39$ 天中，作为前一天的“上涨”共 $15$ 次，其后分别出现“上涨”$4$ 次、“下跌”$2$ 次、“不变”$9$ 次。
        所以第 $41$ 天三种变化的概率估计值分别为 $4/15,2/15,9/15$，“不变”最大。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $E:x^2/a^2+y^2/b^2=1$（$a>b>0$）的离心率为 $sqrt(5)/3$，$A,C$ 分别是 $E$ 的上、下顶点，$B,D$ 分别是 $E$ 的左、右顶点，$abs(A C)=4$。],
  parts: (
    subquestion(
      stem: [求 $E$ 的方程。],
      answers: ([$x^2/9+y^2/4=1$],),
      explanation: [由 $2b=4$，得 $b=2$。又 $b^2/a^2=1-e^2=4/9$，所以 $a=3$，故方程为 $x^2/9+y^2/4=1$。],
    ),
    subquestion(
      stem: [设 $P$ 为第一象限内 $E$ 上的动点，直线 $P D$ 与直线 $B C$ 交于点 $M$，直线 $P A$ 与直线 $y=-2$ 交于点 $N$。求证：$M N parallel C D$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[用参数表示动点][由上一问，$A=(0,2)$，$B=(-3,0)$，$C=(0,-2)$，$D=(3,0)$。
          设 $P=(u,v)$，令 $t=(2u)/(3(v+2))$。由 $0<u<3$、$0<v<2$ 及 $u^2/9+v^2/4=1$，得 $0<t<1$，且
          $ u=(6t)/(1+t^2), quad v=(2(1-t^2))/(1+t^2). $]
        #step[计算两交点][直线 $B C$ 为 $y=-2/3 x-2$。由上述坐标可得直线 $P D$、$P A$ 分别为
          $ y=-(2(1+t))/(3(1-t))(x-3), quad y=2-(2t)/3 x. $
          因 $0<t<1$，联立相应直线，得
          $ M=(3/t,-2-2/t), quad N=(6/t,-2). $
          所以 $k_(M N)=(2/t)/(3/t)=2/3=k_(C D)$。又 $N!=C$，故两直线不重合，$M N parallel C D$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [设函数 $f(x)=x-x^3 "e"^(a x+b)$，曲线 $y=f(x)$ 在点 $(1,f(1))$ 处的切线方程为 $y=-x+1$。],
  parts: (
    subquestion(
      stem: [求 $a,b$ 的值。],
      answers: ([$a=-1$，$b=1$],),
      explanation: [切点在切线上，且切线斜率为 $-1$，所以 $f(1)=0$、$f'(1)=-1$。
        由 $f'(x)=1-(3x^2+a x^3)"e"^(a x+b)$，得
        $ "e"^(a+b)=1, quad 1-(3+a)"e"^(a+b)=-1. $
        故 $a=-1$，$b=1$。],
    ),
    subquestion(
      stem: [设函数 $g(x)=f'(x)$，求 $g(x)$ 的单调区间。],
      answers: (
        [递增区间为 $(-infinity,0)$、$(3-sqrt(3),3+sqrt(3))$；递减区间为 $(0,3-sqrt(3))$、$(3+sqrt(3),+infinity)$。],
      ),
      explanation: [由上一问，$g(x)=1-(3x^2-x^3)"e"^(1-x)$，故
        $ g'(x)=-x(x^2-6x+6)"e"^(1-x)=-x(x-3+sqrt(3))(x-3-sqrt(3))"e"^(1-x). $
        因 $"e"^(1-x)>0$，由各因子符号得 $g'>0$ 的区间为 $(-infinity,0)$、$(3-sqrt(3),3+sqrt(3))$，$g'<0$ 的区间为 $(0,3-sqrt(3))$、$(3+sqrt(3),+infinity)$，即所求区间。],
    ),
    subquestion(
      stem: [求 $f(x)$ 的极值点个数。],
      answers: ([$3$ 个],),
      explanation: [记 $alpha=3-sqrt(3)$，$beta=3+sqrt(3)$，则 $0<1<alpha<3<beta$。
        在 $(-infinity,0)$ 上，$g$ 严格递增，且 $g(-1)=1-4"e"^2<0$、$g(0)=1>0$，故有唯一零点，且由负变正。
        在 $(0,alpha)$ 上，$g$ 严格递减，$g(0)>0$、$g(alpha)<g(1)=-1<0$，故有唯一零点，且由正变负。
        在 $(alpha,beta)$ 上，$g$ 严格递增，$g(alpha)<0$、$g(beta)>g(3)=1>0$，故有唯一零点，且由负变正。
        当 $x>=beta>3$ 时，$g(x)=1+x^2(x-3)"e"^(1-x)>0$，无零点。三个分界点 $0,alpha,beta$ 也都不是零点。
        因此 $f'=g$ 恰有三个变号零点，$f$ 有两个极小值点和一个极大值点，共 $3$ 个极值点。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知数列 $a_n,b_n$ 的项数均为 $m$（$m>2$），且 $a_n,b_n in {1,2,dots.c,m}$，$a_n,b_n$ 的前 $n$ 项和分别为 $A_n,B_n$，并规定 $A_0=B_0=0$。对于 $k in {0,1,2,dots.c,m}$，定义
    $ r_k=max {i | B_i<=A_k, i in {0,1,2,dots.c,m}}, $
    其中，$max M$ 表示数集 $M$ 中最大的数。],
  parts: (
    subquestion(
      stem: [若 $a_1=2$，$a_2=1$，$a_3=3$，$b_1=1$，$b_2=3$，$b_3=3$，求 $r_0,r_1,r_2,r_3$ 的值。],
      answers: ([$r_0=0$，$r_1=1$，$r_2=1$，$r_3=2$],),
      explanation: [由题意，$(A_0,A_1,A_2,A_3)=(0,2,3,6)$，$(B_0,B_1,B_2,B_3)=(0,1,4,7)$。
        对每个 $A_k$ 查找不超过它的最大 $B_i$，分别得到 $r_0=0$，$r_1=1$，$r_2=1$，$r_3=2$。],
    ),
    subquestion(
      stem: [若 $a_1>=b_1$，且 $2r_j<=r_(j+1)+r_(j-1)$（$j=1,2,dots.c,m-1$），求 $r_n$。],
      answers: ([$r_n=n$（$n=0,1,dots.c,m$）],),
      explanation: [因为所有项均为正整数，所以 $r_0=0$，由 $a_1>=b_1$ 得 $r_1>=1$。
        令 $d_j=r_j-r_(j-1)$，题设不等式说明 $d_(j+1)>=d_j$。因此 $d_j>=d_1=r_1>=1$。
        又 $r_m=sum_(j=1)^m d_j<=m$，故每个 $d_j$ 必须等于 $1$。于是 $r_n=n$。],
    ),
    subquestion(
      stem: [证明：存在 $p,q,s,t in {0,1,2,dots.c,m}$，满足 $p>q$，$s>t$，使得 $A_p+B_t=A_q+B_s$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[控制前缀和的差值][若 $A_m=B_m$，取 $p=s=m$、$q=t=0$ 即可。
          若总和不相等，由两列在本问中的对称性，不妨设 $A_m<B_m$。对每个 $k=0,1,dots.c,m$，均有 $A_k<B_m$，故 $r_k<m$，且
          $ B_(r_k)<=A_k<B_(r_k+1). $
          令 $d_k=A_k-B_(r_k)$，则 $0<=d_k<b_(r_k+1)<=m$。因此 $d_k$ 只能取 $0,1,dots.c,m-1$ 这 $m$ 个整数。]
        #step[应用抽屉原理][$d_0,d_1,dots.c,d_m$ 共 $m+1$ 个数，必有 $p>q$ 使 $d_p=d_q$。于是
          $ A_p-A_q=B_(r_p)-B_(r_q)>0. $
          因 $B_i$ 随 $i$ 严格递增，故 $r_p>r_q$。取 $s=r_p$、$t=r_q$，便有 $p>q$、$s>t$，且 $A_p+B_t=A_q+B_s$。]
      ],
    ),
  ),
)
