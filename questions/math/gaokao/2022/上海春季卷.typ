#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校春季招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2022/2022春季上海.pdf",
  regions: ("上海",),
)

#let cylinder-diagram() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  oblique-project((1, 0), (0, 0.28), (0, 0.6), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    let ring(z, start, end) = range(start, end + 1, step: 3).map(i => (
      calc.cos(i * 1deg),
      calc.sin(i * 1deg),
      z,
    ))
    line(..ring(4, 0, 360))
    line(..ring(0, 0, 180), stroke: (dash: figure-style.dash))
    line(..ring(0, 180, 360))
    line((-1, 0, 0), (-1, 0, 4), (1, 0, 4), (1, 0, 0))
    line((-1, 0, 0), (1, 0, 0), stroke: (dash: figure-style.dash))
    line((0, 0, 0), (0, 0, 4), (1, 0, 2), stroke: (dash: figure-style.dash))
    content((1.1, 0, 0), $A$, anchor: "west")
    content((1.1, 0, 4), $A_1$, anchor: "west")
    content((1.1, 0, 2), $M$, anchor: "west")
    content((0, -0.15, -0.1), $O$, anchor: "north")
    content((-0.1, 0, 3.9), $O_1$, anchor: "north-east")
  })
})
#let land-diagram() = cetz.canvas(length: 2mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let x = 15 * calc.tan(20deg)
  let y = (x * x + 225) / (2 * x)
  line((0, 0), (30, 0), (30, 15), (0, 15), close: true)
  line(
    ..range(-90, 1, step: 2).map(i => (
      15 * calc.cos(i * 1deg),
      15 + 15 * calc.sin(i * 1deg),
    )),
  )
  line((x, 0), (y, 15))
  for (p, label, anchor) in (
    ((0, -0.6), $A$, "north"),
    ((30, -0.6), $B$, "north"),
    ((30, 15.6), $C$, "south"),
    ((0, 15.6), $D$, "south"),
    ((x, -0.6), $E$, "north"),
    ((y, 15.6), $F$, "south"),
  ) { content(p, label, anchor: anchor) }
})

#section[填空题：本大题共 12 小题，满分 54 分，其中第 1～6 题每题 4 分，第 7～12 题每题 5 分。]
#question(
  "fill-in",
  score: 4,
  stem: [已知 $z=2+"i"$（其中 $"i"$ 为虚数单位），则 $overline(z)=$#fill-placeholder()。],
  answers: ([$2-"i"$],),
  explanation: [共轭复数的实部不变，虚部变号，故 $overline(z)=2-"i"$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知集合 $A=(-1,2)$，$B=(1,3)$，则 $A inter B=$#fill-placeholder()。],
  answers: ([$(1,2)$],),
  explanation: [同时满足 $-1<x<2$ 与 $1<x<3$，即 $1<x<2$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [不等式 $(x-1)/x<0$ 的解集为#fill-placeholder()。],
  answers: ([$(0,1)$],),
  explanation: [分子与分母异号，得 $x>0$ 且 $x-1<0$，即 $0<x<1$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [若 $tan alpha=3$，则 $tan(alpha+pi/4)=$#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [$tan(alpha+pi/4)=(tan alpha+1)/(1-tan alpha)=4/(-2)=-2$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设函数 $f(x)=x^3$ 的反函数为 $f^(-1)(x)$，则 $f^(-1)(27)=$#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [$f^(-1)(x)=root(3, x)$，故 $f^(-1)(27)=3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [在 $(x^3+1/x)^12$ 的展开式中，含 $1/x^4$ 项的系数为#fill-placeholder()。],
  answers: ([$66$],),
  explanation: [通项为 $T_(r+1)=C_12^r x^(36-4r)$。令 $36-4r=-4$，得 $r=10$，故所求系数为 $C_12^10=66$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若关于 $x,y$ 的方程组 $cases(x+m y=2, m x+16y=8)$ 有无穷多解，则实数 $m$ 的值为#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [两个方程的系数与常数项对应成比例。常数项之比为 $4$，故 $m=4$，且 $16=4m$，满足要求。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $triangle A B C$ 中，$angle A=pi/3$，$A B=2$，$A C=3$，则 $triangle A B C$ 的外接圆半径为#fill-placeholder()。],
  answers: ([$sqrt(21)/3$],),
  explanation: [由余弦定理，$B C^2=2^2+3^2-2 times 2 times 3 cos(pi/3)=7$。
    由正弦定理，$R=(B C)/(2sin A)=sqrt(7)/sqrt(3)=sqrt(21)/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [用数字 1、2、3、4 组成没有重复数字的四位数，其中比 2134 大的四位数的个数为#fill-placeholder()。（用数字作答）],
  answers: ([$17$],),
  explanation: [千位为 $3$ 或 $4$ 时，共 $2 times 3!=12$ 个。千位为 $2$ 时，其余三位的最小排列是 $134$，故有 $3!-1=5$ 个符合要求。合计 $17$ 个。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $triangle A B C$ 中，$angle C=pi/2$，$A C=B C=2$，$M$ 为 $A C$ 的中点，$P$ 在线段 $A B$ 上，则 $arrow(M P) dot arrow(C P)$ 的最小值为#fill-placeholder()。],
  answers: ([$7/8$],),
  explanation: [取 $C=(0,0)$，$A=(2,0)$，$B=(0,2)$，则 $M=(1,0)$。设 $P=(2t,2-2t)$，$0<=t<=1$，得
    $ arrow(M P) dot arrow(C P)=(2t-1)2t+(2-2t)^2=8(t-5/8)^2+7/8. $
    当 $t=5/8$ 时取到最小值 $7/8$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $P_1(x_1,y_1)$，$P_2(x_2,y_2)$ 是双曲线 $Gamma:x^2/a^2-y^2=1(a>0)$ 右支上的任意两点。若 $x_1 x_2>y_1 y_2$ 恒成立，则 $a$ 的取值范围为#fill-placeholder()。],
  answers: ([$[1,+infinity)$],),
  explanation: [#step[充分性][
      若 $a>=1$，则 $x_1 x_2=a^2 sqrt((1+y_1^2)(1+y_2^2))>abs(y_1 y_2)>=y_1 y_2$。
    ]
    #step[必要性][
      若 $0<a<1$，取充分大的 $Y>0$，使 $a^2+(a^2-1)Y^2<0$。当 $y_1=y_2=Y$ 时，$x_1 x_2-y_1 y_2<0$；若要求两点不同，将 $y_2$ 略作改变，由连续性仍有该不等式，均与条件矛盾。故 $a>=1$。
    ]],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知定义域为 $RR$ 的奇函数 $f(x)$ 的图像关于直线 $x=1$ 对称，当 $x in (0,1]$ 时，$f(x)=ln x$。将方程 $f(x)=x+1$ 的正实数根从小到大依次记为 $x_1,x_2,dots.c,x_n,dots.c$，则 $lim_(n arrow infinity)(x_(n+1)-x_n)=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [
    #step[确定函数的周期和根的分布][
      由对称性与奇性，$f(x+2)=f(-x)=-f(x)$，故 $f(x+4)=f(x)$。
      在 $(0,2)$ 上，$f(x)<=0$，因此正根只能出现在 $(4n-2,4n)$ 内，其中 $n in NN^*$。
      在 $(4n-2,4n-1)$ 上，$f(x)=-ln(x-4n+2)$；在 $(4n-1,4n)$ 上，$f(x)=-ln(4n-x)$。
      前一段的 $f(x)-x-1$ 严格递减，由 $+infinity$ 降到负值；后一段严格递增，由负值升到 $+infinity$，故各有一个根。
    ]
    #step[估计根的位置][
      设 $x_(2n-1)=4n-2+s_n$，$x_(2n)=4n-t_n$，其中 $0<s_n,t_n<1$。
      代入方程，得 $-ln s_n=4n-1+s_n$，$-ln t_n=4n+1-t_n$。
      ∴ $0<s_n<e^(-4n+1)$，$0<t_n<e^(-4n)$，两者均趋于 $0$。
      ∴ $x_(2n)-x_(2n-1)=2-s_n-t_n arrow 2$，$x_(2n+1)-x_(2n)=2+s_(n+1)+t_n arrow 2$，故所求极限为 $2$。
    ]],
)

#section[选择题：本大题共 4 小题，每小题 5 分，满分 20 分。每题有且只有一个正确选项。]
#question(
  "single-choice",
  score: 5,
  stem: [下列函数定义域为 $RR$ 的是#choice-placeholder()。],
  choices: ([$y=x^(-1/2)$], [$y=x^(-1)$], [$y=x^(1/3)$], [$y=x^(1/2)$]),
  answers: ([C],),
  explanation: [四个函数的定义域依次为 $(0,+infinity)$、$RR without {0}$、$RR$、$[0,+infinity)$，故选 C。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $a>b>c>d$，则下列不等式恒成立的是#choice-placeholder()。],
  choices: ([$a+d>b+c$], [$a+c>b+d$], [$a c>b d$], [$a d>b c$]),
  answers: ([B],),
  explanation: [由 $a>b$ 与 $c>d$ 相加，得 $a+c>b+d$，故 B 正确。
    取 $(a,b,c,d)=(3,2,1,0)$，A、D 均不成立；取 $(-1,-2,-3,-4)$，C 不成立。],
)
#question(
  "single-choice",
  score: 5,
  stem: [上海海关大楼的顶部为逐级收拢的四面钟楼，如图，四个大钟分布在正四棱柱的四个侧面。每天 0 点至 12 点（包含 0 点，不含 12 点），相邻两钟面上的时针相互垂直的次数为#choice-placeholder()。
    #figure(image("assets/上海春季卷-钟楼.png", width: 28mm))],
  choices: ([0], [2], [4], [12]),
  answers: ([B],),
  explanation: [取两钟面内的水平方向及竖直方向为三条坐标轴。时针从竖直向上方向转过 $theta$ 后，两个方向向量可写为 $(sin theta,0,cos theta)$ 与 $(0,plus.minus sin theta,cos theta)$。
    数量积为 $cos^2 theta$，故垂直等价于 $cos theta=0$。
    在 $0<=theta<2pi$ 内，对应 $theta=pi/2,3pi/2$，即 3 点和 9 点，共 $2$ 次。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知等比数列 $\{a_n\}$ 的前 $n$ 项和为 $S_n$，前 $n$ 项积为 $T_n$，则下列判断正确的是#choice-placeholder()。],
  choices: (
    [若 $S_2022>S_2021$，则 $\{a_n\}$ 是递增数列],
    [若 $T_2022>T_2021$，则 $\{a_n\}$ 是递增数列],
    [若 $\{S_n\}$ 是递增数列，则 $a_2022>=a_2021$],
    [若 $\{T_n\}$ 是递增数列，则 $a_2022>=a_2021$],
  ),
  answers: ([D],),
  explanation: [
    #step[排除 A、B、C][取 $a_n=2^(-n)$，则 $S_n$ 递增，而 $a_n$ 递减，A、C 错误。取 $a_n=2$，则 $T_2022>T_2021$，但 $a_n$ 为常数列，B 错误。]
    #step[证明 D][设首项为 $a_1$，公比为 $q$。∵ $T_6>T_4>0$，而 $T_6=a_1^6 q^15$，故 $q>0$。
      又 $T_3>T_2>0$，故 $a_1>0$，从而各项及各 $T_n$ 均为正。
      由 $T_(n+1)>T_n$，得 $a_(n+1)>1$。若 $0<q<1$，则 $a_n arrow 0$，矛盾。
      ∴ $q>=1$，所以 $a_2022>=a_2021$。]
  ],
)

#section[解答题：本大题共 5 小题，满分 76 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [如图，圆柱下底面与上底面的圆心分别为 $O,O_1$，$A A_1$ 为圆柱的母线，底面半径长为 $1$。
    #figure(cylinder-diagram())],
  parts: (
    subquestion(
      score: 6,
      stem: [若 $A A_1=4$，$M$ 为 $A A_1$ 的中点，求直线 $M O_1$ 与上底面所成角的大小。（结果用反三角函数值表示）],
      answers: ([$arctan 2$],),
      explanation: [∵ $M A_1$ 垂直于上底面，故 $O_1 A_1$ 是 $O_1 M$ 在上底面内的射影，所求角为 $angle M O_1 A_1$。
        在直角三角形 $M A_1 O_1$ 中，$M A_1=2$，$O_1 A_1=1$，故该角的正切为 $2$，所求角为 $arctan 2$。],
    ),
    subquestion(
      score: 8,
      stem: [若圆柱过 $O O_1$ 的截面为正方形，求圆柱的体积与侧面积。],
      answers: ([体积为 $2pi$，侧面积为 $4pi$。],),
      explanation: [轴截面为正方形，故高等于底面直径 $2$。因此体积 $V=pi times 1^2 times 2=2pi$，侧面积 $S=2pi times 1 times 2=4pi$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知数列 $\{a_n\}$ 中，$a_2=1$，其前 $n$ 项和为 $S_n$。],
  parts: (
    subquestion(
      score: 6,
      stem: [若 $\{a_n\}$ 是等比数列，$S_2=3$，求 $lim_(n arrow infinity) S_n$。],
      answers: ([$4$],),
      explanation: [由 $a_1+a_2=3$，得 $a_1=2$，公比 $q=1/2$。
        ∴ $S_n=(2(1-(1/2)^n))/(1-1/2)=4(1-2^(-n))$，故 $lim_(n arrow infinity) S_n=4$。],
    ),
    subquestion(
      score: 8,
      stem: [若 $\{a_n\}$ 是等差数列，对任意 $n in NN^*$ 均有 $S_(2n)>=n$，求其公差 $d$ 的取值范围。],
      answers: ([$[0,1]$],),
      explanation: [∵ $a_1=1-d$，故 $S_(2n)=n(2+(2n-3)d)$，条件等价于 $1+(2n-3)d>=0$ 对所有正整数 $n$ 成立。
        取 $n=1$，得 $d<=1$；若 $d<0$，当 $n$ 充分大时左边为负，故必须有 $d>=0$。
        反之，$0<=d<=1$ 时，$n=1$ 满足条件；$n>=2$ 时，$1+(2n-3)d>=1>0$。
        ∴ $d in [0,1]$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [为推进架空线入地工程，某矩形地块 $A B C D$ 的边长为 $A B=30 "m"$，$A D=15 "m"$。为保护 $D$ 处的古树，划定以 $D$ 为圆心、$D A$ 为半径的四分之一圆区域为封闭区。如图，入线口 $E$ 在线段 $A B$ 上，出线口 $F$ 在线段 $C D$ 上，要求 $E F$ 与封闭区边界相切，四边形 $B C F E$ 将作为绿地保护生态区。（长度精确到 $0.1 "m"$，面积精确到 $0.01 "m"^2$）
    #figure(land-diagram())],
  parts: (
    subquestion(
      score: 6,
      stem: [若 $angle A D E=20 degree$，求 $E F$ 的长。],
      answers: ([$23.3 "m"$],),
      explanation: [以 $A$ 为原点，$A B,A D$ 的方向为坐标轴正方向。令 $A E=x$，$D F=y$，则 $E=(x,0)$，$F=(y,15)$，$D=(0,15)$。
        直线 $E F$ 的方程为 $15X-(y-x)Y-15x=0$。由相切条件，圆心 $D$ 到该直线的距离为 $15$，即
        $ (15y)/sqrt((y-x)^2+225)=15. $
        ∴ $E F=sqrt((y-x)^2+225)=y$，且 $y=(x^2+225)/(2x)$。
        由 $x=15tan 20 degree$，得 $E F=15/(sin 40 degree) approx 23.3 "m"$。],
    ),
    subquestion(
      score: 8,
      stem: [入线口 $E$ 在 $A B$ 上的什么位置时，生态区的面积最大？最大面积是多少？],
      answers: (
        [当 $A E=5sqrt(3) "m" approx 8.7 "m"$ 时，最大面积为 $450-225sqrt(3)/2 "m"^2 approx 255.14 "m"^2$。],
      ),
      explanation: [由第（1）问，$y=(x^2+225)/(2x)$。生态区的面积为
        $ S=450-15/2(x+y)=450-15/4(3x+225/x). $
        ∵ $x>0$，由基本不等式，$3x+225/x>=2sqrt(675)=30sqrt(3)$。
        当且仅当 $3x=225/x$，即 $x=5sqrt(3)$ 时等号成立。此时 $y=10sqrt(3)<30$，$E,F$ 均在对应边上，切点也在线段 $E F$ 内，符合条件。
        因此 $A E approx 8.7 "m"$ 时，$S$ 的最大值为 $450-225sqrt(3)/2 approx 255.14 "m"^2$。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知椭圆 $Gamma:x^2/a^2+y^2=1(a>1)$，$A,B$ 分别为其左顶点、下顶点。$C,D$ 两点均在直线 $l:x=a$ 上，且 $C$ 在第一象限。],
  parts: (
    subquestion(
      score: 4,
      stem: [设 $F$ 是椭圆 $Gamma$ 的右焦点，且 $angle A F B=pi/6$，求 $Gamma$ 的标准方程。],
      answers: ([$x^2/4+y^2=1$],),
      explanation: [右焦点为 $F=(sqrt(a^2-1),0)$，$B=(0,-1)$。由 $tan angle A F B=1/sqrt(a^2-1)=1/sqrt(3)$，得 $a^2=4$，故椭圆方程为 $x^2/4+y^2=1$。],
    ),
    subquestion(
      score: 6,
      stem: [若 $C,D$ 两点的纵坐标分别为 $2,1$，判断直线 $A D$ 与直线 $B C$ 的交点是否在椭圆 $Gamma$ 上，并说明理由。],
      answers: ([在椭圆上。],),
      explanation: [$A=(-a,0)$，$B=(0,-1)$，$C=(a,2)$，$D=(a,1)$。
        两直线方程分别为 $y=(x+a)/(2a)$，$y=3x/a-1$，联立得交点 $(3a/5,4/5)$。
        ∵ $(3a/5)^2/a^2+(4/5)^2=9/25+16/25=1$，故交点在椭圆上。],
    ),
    subquestion(
      score: 6,
      stem: [设直线 $A D,B C$ 分别与椭圆 $Gamma$ 交于另一点 $P,Q$。若 $P,Q$ 关于原点对称，求 $abs(C D)$ 的最小值。],
      answers: ([$6$],),
      explanation: [
        #step[用一个参数表示点位][设 $C=(a,c)$，$D=(a,d)$，其中 $c>0$。令 $k=c+1>1$，则 $B C$ 的方程为 $y=k x/a-1$。
          将 $u=x/a$ 代入椭圆方程，得 $u^2+(k u-1)^2=1$。除去对应于 $B$ 的根 $u=0$，得
          $ Q=(a dot (2k)/(1+k^2), (k^2-1)/(1+k^2)). $
          记 $Q=(a u,v)$，则 $P=(-a u,-v)$。]
        #step[求长度的最小值][∵ $A,P,D$ 共线，故 $d=-2v/(1-u)=-2(k+1)/(k-1)=-2(c+2)/c<0$。
          ∴ $abs(C D)=c-d=c+2+4/c>=6$。
          当且仅当 $c=2$ 时等号成立，此时 $d=-4$，满足所有条件，故最小值为 $6$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知函数 $f(x)$ 的定义域为 $RR$。对 $f(x)$ 定义两种变换：$phi$ 变换得到 $f(x)-f(x-t)$，$omega$ 变换得到 $abs(f(x+t)-f(x))$，其中 $t>0$。],
  parts: (
    subquestion(
      score: 4,
      stem: [设 $f(x)=2^x$，$t=1$，$g(x)$ 为 $f(x)$ 作 $phi$ 变换后的结果，解方程 $g(x)=2$。],
      answers: ([$x=2$],),
      explanation: [$g(x)=2^x-2^(x-1)=2^(x-1)$。由 $2^(x-1)=2$，得 $x=2$。],
    ),
    subquestion(
      score: 6,
      stem: [设 $f(x)=x^2$，$h(x)$ 为 $f(x)$ 作 $omega$ 变换后的结果，解不等式 $f(x)>=h(x)$。],
      answers: ([$(-infinity,(1-sqrt(2))t] union [(1+sqrt(2))t,+infinity)$],),
      explanation: [$h(x)=abs((x+t)^2-x^2)=t abs(2x+t)$。
        当 $x< -t/2$ 时，不等式化为 $(x+t)^2>=0$，恒成立。
        当 $x>=-t/2$ 时，不等式化为 $(x-t)^2>=2t^2$，即 $x<=(1-sqrt(2))t$ 或 $x>=(1+sqrt(2))t$。
        合并得解集 $(-infinity,(1-sqrt(2))t] union [(1+sqrt(2))t,+infinity)$。],
    ),
    subquestion(
      score: 8,
      stem: [设 $f(x)$ 在 $(-infinity,0)$ 上单调递增。将 $f(x)$ 先作 $phi$ 变换得到 $u(x)$，再将 $u(x)$ 作 $omega$ 变换得到 $h_1(x)$；将 $f(x)$ 先作 $omega$ 变换得到 $v(x)$，再将 $v(x)$ 作 $phi$ 变换得到 $h_2(x)$。若对任意 $t>0$，$h_1(x)=h_2(x)$ 恒成立，证明 $f(x)$ 在 $RR$ 上单调递增。],
      answers: ([证明见解析。],),
      explanation: [
        #step[将变换关系写成相邻增量的关系][记 $A=f(x+t)-f(x)$，$B=f(x)-f(x-t)$。则 $h_1(x)=abs(A-B)$，$h_2(x)=abs(A)-abs(B)$。
          若 $B>0$，恒等式给出 $abs(A-B)=abs(A)-B$。若 $A<0$，左边为 $B-A$，右边为 $-A-B$，将推出 $B=0$，矛盾；故 $A>=0$。
          进而 $abs(A-B)=A-B$，所以 $A>=B>0$。即一个正增量可沿步长 $t$ 向右逐段传递。]
        #step[从负半轴传递到任意两点][任取 $x_1<x_2$，令 $t=x_2-x_1>0$。取充分大的正整数 $k$，使 $x_2-k t<0$。
          ∵ $f$ 在负半轴上严格递增，故 $f(x_2-k t)-f(x_1-k t)>0$。
          反复应用上一步的结论，将该区间向右平移 $t$ 共 $k$ 次，得 $f(x_2)-f(x_1)>0$。
          因此 $f(x)$ 在 $RR$ 上单调递增。]
      ],
    ),
  ),
)
