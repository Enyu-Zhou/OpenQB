#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校招生全国统一考试",
  name: "新高考一卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2021/2021新高考1(山东,广东,湖南,湖北,河北,江苏,福建).pdf",
  regions: ("山东", "广东", "湖南", "湖北", "河北", "江苏", "福建"),
)

#let pyramid() = cetz.canvas(length: 25mm, {
  import cetz.draw: *
  let o = (0, 0, 0)
  let a = (0, 0, 1)
  let b = (-1, 0, 0)
  let d = (1, 0, 0)
  let c = (0.5, calc.sqrt(3) / 2, 0)
  let e = (1 / 3, 0, 2 / 3)
  oblique-project((1, 0), (-0.35, -0.6), (0, 1.2), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(b, a, d, c, b)
    line(a, c, e)
    line(b, d, stroke: (dash: figure-style.dash))
    line(a, o, c, stroke: (dash: figure-style.dash))
    line(b, e, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "south"),
      (b, $B$, "east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (o, $O$, "south-east"),
      (e, $E$, "south-west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[单项选择题]
#question(
  "single-choice",
  stem: [设集合 $A={x | -2<x<4}$，$B={2,3,4,5}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${2}$], [${2,3}$], [${3,4}$], [${2,3,4}$]),
  answers: ([B],),
  explanation: [$B$ 中满足 $-2<x<4$ 的元素为 $2,3$，所以 $A inter B={2,3}$。],
)
#question(
  "single-choice",
  stem: [已知 $z=2-"i"$，则 $z(overline(z)+"i")=$#choice-placeholder()。],
  choices: ([$6-2"i"$], [$4-2"i"$], [$6+2"i"$], [$4+2"i"$]),
  answers: ([C],),
  explanation: [$overline(z)=2+"i"$，所以 $z(overline(z)+"i")=(2-"i")(2+2"i")=6+2"i"$。],
)
#question(
  "single-choice",
  stem: [已知圆锥的底面半径为 $sqrt(2)$，其侧面展开图为一个半圆，则该圆锥的母线长为#choice-placeholder()。],
  choices: ([$2$], [$2sqrt(2)$], [$4$], [$4sqrt(2)$]),
  answers: ([B],),
  explanation: [设母线长为 $l$，侧面展开图的弧长等于底面周长，故 $pi l=2pi sqrt(2)$，得 $l=2sqrt(2)$。],
)
#question(
  "single-choice",
  stem: [下列区间中，函数 $f(x)=7sin(x-pi/6)$ 单调递增的区间是#choice-placeholder()。],
  choices: ([$(0,pi/2)$], [$(pi/2,pi)$], [$(pi,3pi/2)$], [$(3pi/2,2pi)$]),
  answers: ([A],),
  explanation: [由 $-pi/2+2k pi<=x-pi/6<=pi/2+2k pi$，得递增区间为 $[-pi/3+2k pi,2pi/3+2k pi](k in ZZ)$。只有 A 给出的区间包含在其中一个递增区间内。],
)
#question(
  "single-choice",
  stem: [已知 $F_1,F_2$ 是椭圆 $C:x^2/9+y^2/4=1$ 的两个焦点，点 $M$ 在 $C$ 上，则 $abs(M F_1) dot abs(M F_2)$ 的最大值为#choice-placeholder()。],
  choices: ([$13$], [$12$], [$9$], [$6$]),
  answers: ([C],),
  explanation: [由椭圆定义，$abs(M F_1)+abs(M F_2)=6$，所以 $abs(M F_1) dot abs(M F_2)<=((abs(M F_1)+abs(M F_2))/2)^2=9$。当 $M=(0,plus.minus 2)$ 时，两段焦半径均为 $3$，取等号。],
)
#question(
  "single-choice",
  stem: [若 $tan theta=-2$，则 $(sin theta(1+sin 2theta))/(sin theta+cos theta)=$#choice-placeholder()。],
  choices: ([$-6/5$], [$-2/5$], [$2/5$], [$6/5$]),
  answers: ([C],),
  explanation: [由 $1+sin 2theta=(sin theta+cos theta)^2$，原式化为
    $
      sin theta(sin theta+cos theta)=(tan^2 theta+tan theta)/(1+tan^2 theta)=(4-2)/(1+4)=2/5.
    $],
)
#question(
  "single-choice",
  stem: [若过点 $(a,b)$ 可以作曲线 $y="e"^x$ 的两条切线，则#choice-placeholder()。],
  choices: ([$"e"^b<a$], [$"e"^a<b$], [$0<a<"e"^b$], [$0<b<"e"^a$]),
  answers: ([D],),
  explanation: [设切点横坐标为 $t$，切线方程为 $y="e"^t (x-t+1)$，过 $(a,b)$ 等价于 $b=(a+1-t)"e"^t$。
    令 $g(t)=(a+1-t)"e"^t$，则 $g'(t)=(a-t)"e"^t$，故 $g$ 在 $(-infinity,a)$ 递增，在 $(a,+infinity)$ 递减，最大值为 $g(a)="e"^a$。
    又 $lim_(t->-infinity)g(t)=0$，$lim_(t->+infinity)g(t)=-infinity$，所以方程恰有两个不同实根当且仅当 $0<b<"e"^a$。],
)
#question(
  "single-choice",
  stem: [有 6 个相同的球，分别标有数字 $1,2,3,4,5,6$，从中有放回地随机取两次，每次取 1 个球。甲表示事件“第一次取出的球的数字是 1”，乙表示事件“第二次取出的球的数字是 2”，丙表示事件“两次取出的球的数字之和是 8”，丁表示事件“两次取出的球的数字之和是 7”，则#choice-placeholder()。],
  choices: (
    [甲与丙相互独立],
    [甲与丁相互独立],
    [乙与丙相互独立],
    [丙与丁相互独立],
  ),
  answers: ([B],),
  explanation: [共有 $36$ 个等可能的有序结果。记四个事件为 $A,B,C,D$，则 $P(A)=P(B)=P(D)=1/6$、$P(C)=5/36$。
    $P(A inter D)=1/36=P(A)P(D)$，故甲与丁相互独立。
    而 $P(A inter C)=P(C inter D)=0$，均不等于对应概率的乘积；$P(B inter C)=1/36!=5/216=P(B)P(C)$。故其余三项均不成立。],
)

#section[多项选择题]
#question(
  "multiple-choice",
  stem: [有一组样本数据 $x_1,x_2,dots,x_n$，由这组数据得到新样本数据 $y_1,y_2,dots,y_n$，其中 $y_i=x_i+c(i=1,2,dots,n)$，$c$ 为非零常数，则#choice-placeholder()。],
  choices: (
    [两组样本数据的样本平均数相同],
    [两组样本数据的样本中位数相同],
    [两组样本数据的样本标准差相同],
    [两组样本数据的样本极差相同],
  ),
  answers: ([CD],),
  explanation: [所有数据同时加上 $c$，平均数和中位数也都增加 $c$，因此 A、B 错误。
    由 $y_i-overline(y)=x_i-overline(x)$，知方差及标准差不变，C 正确。最大值与最小值都增加 $c$，它们的差不变，D 正确。],
)
#question(
  "multiple-choice",
  stem: [已知 $O$ 为坐标原点，点 $P_1(cos alpha,sin alpha)$，$P_2(cos beta,-sin beta)$，$P_3(cos(alpha+beta),sin(alpha+beta))$，$A(1,0)$，则#choice-placeholder()。],
  choices: (
    [$abs(arrow(O P_1))=abs(arrow(O P_2))$],
    [$abs(arrow(A P_1))=abs(arrow(A P_2))$],
    [$arrow(O A) dot arrow(O P_3)=arrow(O P_1) dot arrow(O P_2)$],
    [$arrow(O A) dot arrow(O P_1)=arrow(O P_2) dot arrow(O P_3)$],
  ),
  answers: ([AC],),
  explanation: [
    #step[选项 A][两向量的模均为 $1$，正确。]
    #step[选项 B][两向量的模的平方分别为 $2-2cos alpha$、$2-2cos beta$，不一定相等，错误。]
    #step[选项 C][左侧为 $cos(alpha+beta)$，右侧为 $cos alpha cos beta-sin alpha sin beta=cos(alpha+beta)$，正确。]
    #step[选项 D][左侧为 $cos alpha$，右侧为 $cos beta cos(alpha+beta)-sin beta sin(alpha+beta)=cos(alpha+2beta)$，不一定相等，错误。]
  ],
)
#question(
  "multiple-choice",
  stem: [已知点 $P$ 在圆 $(x-5)^2+(y-5)^2=16$ 上，点 $A(4,0)$，$B(0,2)$，则#choice-placeholder()。],
  choices: (
    [点 $P$ 到直线 $A B$ 的距离小于 $10$],
    [点 $P$ 到直线 $A B$ 的距离大于 $2$],
    [当 $angle P B A$ 最小时，$abs(P B)=3sqrt(2)$],
    [当 $angle P B A$ 最大时，$abs(P B)=3sqrt(2)$],
  ),
  answers: ([ACD],),
  explanation: [
    #step[选项 A、B][圆心为 $M=(5,5)$，半径为 $4$。直线 $A B$ 的方程为 $x+2y-4=0$，圆心到直线的距离为 $d=11/sqrt(5)>4$。所以点 $P$ 到直线的距离范围为 $[11/sqrt(5)-4,11/sqrt(5)+4]$，最小值小于 $2$，最大值小于 $10$。A 正确，B 错误。]
    #step[选项 C、D][圆完全位于直线 $A B$ 的同一侧，故从射线 $B A$ 转向圆上各点的角度，在两条切线方向分别取得最小值和最大值。此时 $M P perp B P$，所以 $abs(B P)=sqrt(abs(B M)^2-abs(M P)^2)=sqrt(34-16)=3sqrt(2)$，C、D 正确。]
  ],
)
#question(
  "multiple-choice",
  stem: [在正三棱柱 $A B C-A_1 B_1 C_1$ 中，$A B=A A_1=1$，点 $P$ 满足 $arrow(B P)=lambda arrow(B C)+mu arrow(B B_1)$，其中 $lambda in [0,1]$，$mu in [0,1]$，则#choice-placeholder()。],
  choices: (
    [当 $lambda=1$ 时，$triangle A B_1 P$ 的周长为定值],
    [当 $mu=1$ 时，三棱锥 $P-A_1 B C$ 的体积为定值],
    [当 $lambda=1/2$ 时，有且仅有一个点 $P$，使得 $A_1 P perp B P$],
    [当 $mu=1/2$ 时，有且仅有一个点 $P$，使得 $A_1 B perp$ 平面 $A B_1 P$],
  ),
  answers: ([BD],),
  explanation: [取 $B=(0,0,0)$，$C=(1,0,0)$，$A=(1/2,sqrt(3)/2,0)$，$B_1=(0,0,1)$，$A_1=(1/2,sqrt(3)/2,1)$，则 $P=(lambda,0,mu)$。
    #step[选项 A][当 $lambda=1$ 时，周长为 $sqrt(2)+sqrt(1+mu^2)+sqrt(1+(mu-1)^2)$。取 $mu=0$ 与 $mu=1/2$，分别得 $1+2sqrt(2)$ 与 $sqrt(2)+sqrt(5)$，两者不同，错误。]
    #step[选项 B][此时 $P$ 在线段 $B_1 C_1$ 上，而 $B_1 C_1 parallel B C$ 且不在平面 $A_1 B C$ 内，故 $P$ 到该平面的距离不变，三棱锥体积为定值，正确。]
    #step[选项 C][当 $lambda=1/2$ 时，$arrow(A_1 P) dot arrow(B P)=mu(mu-1)$，其为零时 $mu=0$ 或 $1$，有两个点满足条件，错误。]
    #step[选项 D][当 $mu=1/2$ 时，$arrow(B A_1) dot arrow(A B_1)=0$，且 $arrow(B A_1) dot arrow(A P)=(lambda-1)/2$。两条相交直线 $A B_1,A P$ 同时垂直于 $A_1 B$ 当且仅当 $lambda=1$，此时 $P$ 为 $C C_1$ 的中点，唯一，正确。]
  ],
)

#section[填空题]
#question(
  "fill-in",
  stem: [已知函数 $f(x)=x^3(a dot 2^x-2^(-x))$ 是偶函数，则 $a=$#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [由 $f(1)=f(-1)$，得 $2a-1/2=2-a/2$，所以 $a=1$。代回得 $f(x)=x^3(2^x-2^(-x))$，为两个奇函数之积，确为偶函数。],
)
#question(
  "fill-in",
  stem: [已知 $O$ 为坐标原点，抛物线 $C:y^2=2p x(p>0)$ 的焦点为 $F$，$P$ 为 $C$ 上一点，$P F$ 与 $x$ 轴垂直，$Q$ 为 $x$ 轴上一点，且 $P Q perp O P$。若 $abs(F Q)=6$，则 $C$ 的准线方程为#fill-placeholder()。],
  answers: ([$x=-3/2$],),
  explanation: [$F=(p/2,0)$，不妨取 $P=(p/2,p)$，设 $Q=(q,0)$。由 $arrow(O P) dot arrow(P Q)=0$，得 $p/2(q-p/2)-p^2=0$，所以 $q=5p/2$。
    于是 $abs(F Q)=2p=6$，得 $p=3$，准线方程为 $x=-p/2=-3/2$。],
)
#question(
  "fill-in",
  stem: [函数 $f(x)=abs(2x-1)-2ln x$ 的最小值为#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [定义域为 $(0,+infinity)$。当 $0<x<1/2$ 时，$f'(x)=-2-2/x<0$；当 $x>1/2$ 时，$f'(x)=2-2/x$，在 $(1/2,1)$ 上为负，在 $(1,+infinity)$ 上为正。
    结合 $f$ 在 $x=1/2$ 处连续，知 $f$ 在 $(0,1)$ 递减，在 $(1,+infinity)$ 递增，所以最小值为 $f(1)=1$。],
)
#question(
  "fill-in",
  stem: [某校学生在研究民间剪纸艺术时，发现剪纸时经常会沿纸的某条对称轴把纸对折。规格为 $20 "dm" times 12 "dm"$ 的长方形纸，对折 1 次共可以得到 $10 "dm" times 12 "dm"$，$20 "dm" times 6 "dm"$ 两种规格的图形，它们的面积之和 $S_1=240 "dm"^2$，对折 2 次共可以得到 $5 "dm" times 12 "dm"$，$10 "dm" times 6 "dm"$，$20 "dm" times 3 "dm"$ 三种规格的图形，它们的面积之和 $S_2=180 "dm"^2$，以此类推。则对折 4 次共可以得到不同规格图形的种数为#fill-placeholder()；如果对折 $n$ 次，那么 $sum_(k=1)^n S_k=$#fill-placeholder()$"dm"^2$。],
  answers: ([$5$], [$720-(240(n+3))/2^n$]),
  explanation: [
    #step[求图形种数与面积和][设沿长边方向折半 $j$ 次、沿短边方向折半 $n-j$ 次，则边长为 $20/2^j$ 与 $12/2^(n-j)$，其中 $j=0,1,dots,n$。这些规格互不相同，且不会出现正方形，故每次只需考虑长方形的两条对称轴。
      所以共 $n+1$ 种，每种面积为 $240/2^n$，得 $S_n=240(n+1)/2^n$。当 $n=4$ 时共有 $5$ 种。]
    #step[错位相减求和][令 $T_n=sum_(k=1)^n (k+1)/2^k$，则
      $ T_n-1/2 T_n=1+sum_(k=2)^n 1/2^k-(n+1)/2^(n+1)=3/2-(n+3)/2^(n+1). $
      因此 $T_n=3-(n+3)/2^n$，从而 $sum_(k=1)^n S_k=720-(240(n+3))/2^n$。]
  ],
)

#section[解答题]
#question(
  "solution",
  stem: [已知数列 ${a_n}$ 满足 $a_1=1$，$a_(n+1)=cases(a_n+1 & quad n "为奇数", a_n+2 & quad n "为偶数")$。],
  parts: (
    subquestion(
      stem: [记 $b_n=a_(2n)$，写出 $b_1,b_2$，并求数列 ${b_n}$ 的通项公式；],
      answers: ([$b_1=2,b_2=5,b_n=3n-1$。],),
      explanation: [由递推式，$a_2=2,a_3=4,a_4=5$，故 $b_1=2,b_2=5$。
        又 $a_(2n+2)=a_(2n+1)+1=a_(2n)+3$，所以 $b_(n+1)=b_n+3$。因此 ${b_n}$ 是首项为 $2$、公差为 $3$ 的等差数列，$b_n=2+3(n-1)=3n-1$。],
    ),
    subquestion(
      stem: [求 ${a_n}$ 的前 20 项和。],
      answers: ([$300$],),
      explanation: [由 $a_(2n-1)=a_(2n)-1=b_n-1$，得
        $
          sum_(k=1)^20 a_k=sum_(n=1)^10 (2b_n-1)=2 times ((2+29) times 10)/2-10=300.
        $],
    ),
  ),
)
#question(
  "solution",
  stem: [某学校组织“一带一路”知识竞赛，有 $A,B$ 两类问题。每位参加比赛的同学先在两类问题中选择一类并从中随机抽取一个问题回答，若回答错误则该同学比赛结束；若回答正确则从另一类问题中再随机抽取一个问题回答，无论回答正确与否，该同学比赛结束。$A$ 类问题中的每个问题回答正确得 20 分，否则得 0 分；$B$ 类问题中的每个问题回答正确得 80 分，否则得 0 分。已知小明能正确回答 $A$ 类问题的概率为 $0.8$，能正确回答 $B$ 类问题的概率为 $0.6$，且能正确回答问题的概率与回答次序无关。],
  parts: (
    subquestion(
      stem: [若小明先回答 $A$ 类问题，记 $X$ 为小明的累计得分，求 $X$ 的分布列；],
      answers: (
        [#block(breakable: false)[#table(
          columns: 4,
          align: center,
          [$X$], [$0$], [$20$], [$100$],
          [$P$], [$0.2$], [$0.32$], [$0.48$],
        )]],
      ),
      explanation: [$X$ 的可能取值为 $0,20,100$。由答题规则，
        $ P(X=0)=1-0.8=0.2, $
        $ P(X=20)=0.8 times (1-0.6)=0.32, $
        $ P(X=100)=0.8 times 0.6=0.48. $
        据此得到分布列。],
    ),
    subquestion(
      stem: [为使累计得分的期望最大，小明应选择先回答哪类问题？并说明理由。],
      answers: ([先回答 $B$ 类问题。],),
      explanation: [先回答 $A$ 类时，$E(X)=20 times 0.32+100 times 0.48=54.4$。
        先回答 $B$ 类时，得分 $Y$ 的取值为 $0,80,100$，相应概率为 $0.4,0.6 times 0.2=0.12,0.6 times 0.8=0.48$。
        所以 $E(Y)=80 times 0.12+100 times 0.48=57.6>54.4$，应先回答 $B$ 类问题。],
    ),
  ),
)
#question(
  "solution",
  stem: [记 $triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$。已知 $b^2=a c$，点 $D$ 在边 $A C$ 上，$B D sin angle A B C=a sin C$。],
  parts: (
    subquestion(
      stem: [证明：$B D=b$；],
      answers: ([证明见解析。],),
      explanation: [由正弦定理，$frac(sin C, sin B)=c/b$。因此 $B D=frac(a sin C, sin B)=(a c)/b=b$。],
    ),
    subquestion(
      stem: [若 $A D=2D C$，求 $cos angle A B C$。],
      answers: ([$7/12$],),
      explanation: [由 $D C=b/3$，分别在 $triangle A B C$ 和 $triangle D B C$ 中用余弦定理，得
        $ cos C=(a^2+b^2-c^2)/(2a b)=(a^2+b^2/9-b^2)/(2a b/3). $
        整理得 $6a^2-11b^2+3c^2=0$。代入 $b^2=a c$，得 $(3a-c)(2a-3c)=0$。
        若 $a=c/3$，则 $b=c/sqrt(3)$，有 $a+b<c$，不构成三角形，舍去。因此 $a=3c/2$，$b^2=3c^2/2$，所以
        $ cos angle A B C=(a^2+c^2-b^2)/(2a c)=7/12. $],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在三棱锥 $A-B C D$ 中，平面 $A B D perp$ 平面 $B C D$，$A B=A D$，$O$ 为 $B D$ 的中点。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [证明：$O A perp C D$；],
      answers: ([证明见解析。],),
      explanation: [由 $A B=A D$ 且 $O$ 为 $B D$ 的中点，得 $O A perp B D$。又两平面 $A B D$、$B C D$ 垂直，交线为 $B D$，故 $O A perp$ 平面 $B C D$。因 $C D subset$ 平面 $B C D$，所以 $O A perp C D$。],
    ),
    subquestion(
      stem: [若 $triangle O C D$ 是边长为 $1$ 的等边三角形，点 $E$ 在棱 $A D$ 上，$D E=2E A$，且二面角 $E-B C-D$ 的大小为 $45 degree$，求三棱锥 $A-B C D$ 的体积。],
      answers: ([$sqrt(3)/6$],),
      explanation: [
        #step[作出二面角的平面角][作 $E G perp B D$，垂足为 $G$；在底面内作 $G H perp B C$，垂足为 $H$，连接 $E H$。
          由 $E G parallel A O$，知 $E G perp$ 平面 $B C D$，所以 $B C perp E G$。结合 $B C perp G H$，得 $B C perp$ 平面 $E G H$，从而 $B C perp E H$。因此 $angle E H G$ 是所给二面角的平面角，等于 $45 degree$，故 $E G=G H$。]
        #step[求高与体积][由 $O B=O D=O C=1$，得 $B D=2$、$angle O B C=30 degree$。
          又 $(D E)/(D A)=2/3$，由相似三角形得 $D G=2/3$，$B G=4/3$，所以 $G H=B G sin 30 degree=2/3$。因此 $E G=2/3$，$A O=3/2 E G=1$。
          底面面积为 $S_(triangle B C D)=1/2 times 2 times sqrt(3)/2=sqrt(3)/2$，故
          $ V_(A-B C D)=1/3 S_(triangle B C D) dot A O=sqrt(3)/6. $]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [在平面直角坐标系 $x O y$ 中，已知点 $F_1(-sqrt(17),0)$，$F_2(sqrt(17),0)$，点 $M$ 满足 $abs(M F_1)-abs(M F_2)=2$。记 $M$ 的轨迹为 $C$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程；],
      answers: ([$x^2-y^2/16=1(x>=1)$。],),
      explanation: [由双曲线定义，$C$ 为以 $F_1,F_2$ 为焦点的双曲线右支。半实轴长 $a=1$，半焦距 $c=sqrt(17)$，故 $b^2=c^2-a^2=16$。因此方程为 $x^2-y^2/16=1(x>=1)$。],
    ),
    subquestion(
      stem: [设点 $T$ 在直线 $x=1/2$ 上，过 $T$ 的两条直线分别交 $C$ 于 $A,B$ 两点和 $P,Q$ 两点，且 $abs(T A) dot abs(T B)=abs(T P) dot abs(T Q)$，求直线 $A B$ 的斜率与直线 $P Q$ 的斜率之和。],
      answers: ([$0$],),
      explanation: [
        #step[用斜率表示距离乘积][设 $T=(1/2,t)$。竖直线 $x=1/2$ 与 $C$ 不相交，故两条直线的斜率均存在。
          对任一斜率 $k$，直线为 $y=t+k(x-1/2)$。令 $u=x-1/2$，代入双曲线方程，得
          $ (16-k^2)u^2+(16-2k t)u-(12+t^2)=0. $
          因有两个不同交点，$k^2!=16$。两交点在右支上，故对应的 $u_1,u_2>=1/2$，于是
          $ u_1u_2=(12+t^2)/(k^2-16)>0. $
          从而距离乘积为 $(1+k^2)u_1u_2=((12+t^2)(1+k^2))/(k^2-16)$。]
        #step[比较两条直线][设两斜率为 $k_1,k_2$，由距离乘积相等，约去 $12+t^2>0$，得
          $ (1+k_1^2)/(k_1^2-16)=(1+k_2^2)/(k_2^2-16), $
          即 $1+17/(k_1^2-16)=1+17/(k_2^2-16)$，所以 $k_1^2=k_2^2$。
          两条直线不同且同过 $T$，故 $k_1!=k_2$，于是 $k_1+k_2=0$。]
      ],
    ),
  ),
)
#question("solution", stem: [已知函数 $f(x)=x(1-ln x)$。], parts: (
  subquestion(
    stem: [讨论 $f(x)$ 的单调性；],
    answers: ([在 $(0,1)$ 上递增，在 $(1,+infinity)$ 上递减。],),
    explanation: [定义域为 $(0,+infinity)$，$f'(x)=-ln x$。当 $0<x<1$ 时导数为正，当 $x>1$ 时导数为负，故分别在上述两个区间递增、递减。],
  ),
  subquestion(
    stem: [设 $a,b$ 为两个不相等的正数，且 $b ln a-a ln b=a-b$，证明：$2<1/a+1/b<"e"$。],
    answers: ([证明见解析。],),
    explanation: [
      #step[转化为同一函数的等值点][将条件除以 $a b$，得 $(ln a+1)/a=(ln b+1)/b$。令 $u=1/a,v=1/b$，则 $f(u)=f(v)$ 且 $u!=v$。
        不妨设 $u<v$，由第（1）问知 $0<u<1<v$。因 $f(u)>0$，故 $f(v)>0$，进一步有 $v<"e"$。]
      #step[证明下界][令 $g(x)=f(2-x)-f(x)$，$0<x<1$，则
        $ g'(x)=ln(2-x)+ln x=ln(1-(x-1)^2)<0. $
        所以 $g(u)>g(1)=0$，即 $f(2-u)>f(u)=f(v)$。因 $2-u,v$ 均大于 $1$，而 $f$ 在 $(1,+infinity)$ 上递减，故 $2-u<v$，即 $u+v>2$。]
      #step[证明上界][令 $h(x)=x+f(x)$，则在 $(1,"e")$ 上有 $h'(x)=1-ln x>0$，故 $h(v)<h("e")="e"$。
        又 $0<u<1$，所以 $f(u)=u(1-ln u)>u$。因此
        $ u+v<f(u)+v=f(v)+v=h(v)<"e". $
        综上，$2<1/a+1/b<"e"$。]
    ],
  ),
))
