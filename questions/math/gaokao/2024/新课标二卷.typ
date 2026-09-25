#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2024,
  type: "普通高等学校招生全国统一考试",
  name: "新课标二卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2024/2024新高考2(辽宁,重庆,海南,吉林,黑龙江,山西,云南,广西,甘肃,贵州,新疆).pdf",
  regions: (
    "辽宁",
    "重庆",
    "海南",
    "吉林",
    "黑龙江",
    "山西",
    "云南",
    "广西",
    "甘肃",
    "贵州",
    "新疆",
  ),
)

#let fold-figure() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  let a = (-2 * calc.sqrt(3), 0, 0)
  let e = (0, 0, 0)
  let f = (0, 2, 0)
  let b = (2 * calc.sqrt(3), 4, 0)
  let c = (3 * calc.sqrt(3), 3, 0)
  let d = (3 * calc.sqrt(3), 0, 0)
  let p = (0, 0, 2 * calc.sqrt(3))
  oblique-project((1, 0), (-0.5, -0.65), (0, 1.2), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, d, p, f)
    line(p, b)
    line(p, c)
    line(a, d, stroke: (dash: figure-style.dash))
    line(p, e, f, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "north-west"),
      (d, $D$, "west"),
      (e, $E$, "south-west"),
      (f, $F$, "north-east"),
      (p, $P$, "south"),
    ) {
      content(point, label, anchor: anchor, padding: 0.15)
    }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [已知 $z=-1-i$，则 $abs(z)=$#choice-placeholder()。],
  choices: ([$0$], [$1$], [$sqrt(2)$], [$2$]),
  answers: ([C],),
  explanation: [$abs(z)=sqrt((-1)^2+(-1)^2)=sqrt(2)$，选 C。],
)
#question(
  "single-choice",
  stem: [已知命题 $p: forall x in RR, abs(x+1)>1$；命题 $q: exists x>0, x^3=x$。则#choice-placeholder()。],
  choices: (
    [$p$ 和 $q$ 都是真命题],
    [$not p$ 和 $q$ 都是真命题],
    [$p$ 和 $not q$ 都是真命题],
    [$not p$ 和 $not q$ 都是真命题],
  ),
  answers: ([B],),
  explanation: [取 $x=-1$，有 $abs(x+1)=0$，故 $p$ 为假；取 $x=1$，有 $x^3=x$，故 $q$ 为真。#linebreak()所以 $not p$ 和 $q$ 都是真命题，选 B。],
)
#question(
  "single-choice",
  stem: [已知向量 $bold(a),bold(b)$ 满足 $abs(bold(a))=1$，$abs(bold(a)+2bold(b))=2$，且 $(bold(b)-2bold(a)) perp bold(b)$，则 $abs(bold(b))=$#choice-placeholder()。],
  choices: ([$1/2$], [$sqrt(2)/2$], [$sqrt(3)/2$], [$1$]),
  answers: ([B],),
  explanation: [由垂直条件，得 $bold(a) dot bold(b)=abs(bold(b))^2/2$。#linebreak()将模长条件平方，得 $1+4bold(a) dot bold(b)+4abs(bold(b))^2=4$，故 $6abs(bold(b))^2=3$，所以 $abs(bold(b))=sqrt(2)/2$，选 B。],
)
#question(
  "single-choice",
  stem: [某农业研究部门在面积相等的 $100$ 块稻田上种植一种新型水稻，得到各块稻田的亩产量（单位：kg）并整理得下表：
    #table(
      columns: 4,
      align: center,
      [亩产量], [$[900,950)$], [$[950,1000)$], [$[1000,1050)$],
      [频数], [$6$], [$12$], [$18$],
      [亩产量], [$[1050,1100)$], [$[1100,1150)$], [$[1150,1200)$],
      [频数], [$30$], [$24$], [$10$],
    )
    根据表中数据，下列结论中正确的是#choice-placeholder()。],
  choices: (
    [100 块稻田亩产量的中位数小于 $1050$ kg],
    [100 块稻田中亩产量低于 $1100$ kg 的稻田所占比例超过 $80%$],
    [100 块稻田亩产量的极差介于 $200$ kg 至 $300$ kg 之间],
    [100 块稻田亩产量的平均值介于 $900$ kg 至 $1000$ kg 之间],
  ),
  answers: ([C],),
  explanation: [最低亩产量在 $[900,950)$，最高亩产量在 $[1150,1200)$，故极差严格大于 $200$ 且小于 $300$，C 正确。#linebreak()前 $36$ 个数据小于 $1050$，第 $37$ 至 $66$ 个数据在 $[1050,1100)$ 内，故中位数不小于 $1050$，A 错误。#linebreak()低于 $1100$ 的比例为 $66%$，B 错误；用各组下端点估计均值的下界，得
    $
      (6 times 900+12 times 950+18 times 1000+30 times 1050+24 times 1100+10 times 1150)/100=1042>1000.
    $
    D 错误。故选 C。],
)
#question(
  "single-choice",
  stem: [已知曲线 $C:x^2+y^2=16$（$y>0$），从 $C$ 上任意一点 $P$ 向 $x$ 轴作垂线段 $P P'$，$P'$ 为垂足，则线段 $P P'$ 的中点 $M$ 的轨迹方程为#choice-placeholder()。],
  choices: (
    [$x^2/16+y^2/4=1$（$y>0$）],
    [$x^2/16+y^2/8=1$（$y>0$）],
    [$y^2/16+x^2/4=1$（$y>0$）],
    [$y^2/16+x^2/8=1$（$y>0$）],
  ),
  answers: ([A],),
  explanation: [设 $M(x,y)$，则 $P(x,2y)$。代入 $C$ 的方程，得 $x^2+4y^2=16$，即 $x^2/16+y^2/4=1$（$y>0$），选 A。],
)
#question(
  "single-choice",
  stem: [设函数 $f(x)=a(x+1)^2-1$，$g(x)=cos x+2a x$。当 $x in (-1,1)$ 时，曲线 $y=f(x)$ 与 $y=g(x)$ 恰有一个交点，则 $a=$#choice-placeholder()。],
  choices: ([$-1$], [$1/2$], [$1$], [$2$]),
  answers: ([D],),
  explanation: [交点横坐标满足 $a(x^2+1)=1+cos x$，方程关于 $x$ 对称。若恰有一个解，该解只能是 $x=0$，故 $a=2$。#linebreak()反之，$a=2$ 时，$2(x^2+1)>=2>=1+cos x$，等号同时成立仅在 $x=0$，故确有唯一交点，选 D。],
)
#question(
  "single-choice",
  stem: [已知正三棱台 $A B C-A_1 B_1 C_1$ 的体积为 $52/3$，$A B=6$，$A_1 B_1=2$，则 $A_1 A$ 与平面 $A B C$ 所成角的正切值为#choice-placeholder()。],
  choices: ([$1/2$], [$1$], [$2$], [$3$]),
  answers: ([B],),
  explanation: [上下底面积分别为 $sqrt(3)$ 和 $9sqrt(3)$。设棱台高为 $h$，则
    $ 52/3=h/3(sqrt(3)+9sqrt(3)+3sqrt(3)), $
    故 $h=4sqrt(3)/3$。#linebreak()上下底面中心的连线垂直于底面，侧棱在底面上的射影长为两底外接圆半径之差，即 $(6-2)/sqrt(3)=4sqrt(3)/3$。#linebreak()所求正切值为高与射影长之比 $1$，选 B。],
)
#question(
  "single-choice",
  stem: [设函数 $f(x)=(x+a)ln(x+b)$。若 $f(x)>=0$，则 $a^2+b^2$ 的最小值为#choice-placeholder()。],
  choices: ([$1/8$], [$1/4$], [$1/2$], [$1$]),
  answers: ([C],),
  explanation: [定义域为 $x>-b$。$ln(x+b)$ 在 $x=1-b$ 两侧分别为负、正，要使乘积恒非负，线性因子 $x+a$ 必须在同一点变号，故 $a=b-1$。#linebreak()反之，此条件下两因子同号，符合题意。于是
    $ a^2+b^2=(b-1)^2+b^2=2(b-1/2)^2+1/2>=1/2. $
    当 $a=-1/2$、$b=1/2$ 时取等号，选 C。],
)

#section[选择题：本题共 3 小题，每小题 6 分，共 18 分。在每小题给出的选项中，有多项符合题目要求。全部选对的得 6 分，部分选对的得部分分，有选错的得 0 分。]
#question(
  "multiple-choice",
  stem: [对于函数 $f(x)=sin 2x$ 和 $g(x)=sin(2x-pi/4)$，下列说法中正确的有#choice-placeholder()。],
  choices: (
    [$f(x)$ 与 $g(x)$ 有相同的零点],
    [$f(x)$ 与 $g(x)$ 有相同的最大值],
    [$f(x)$ 与 $g(x)$ 有相同的最小正周期],
    [$f(x)$ 与 $g(x)$ 的图象有相同的对称轴],
  ),
  answers: ([BC],),
  explanation: [两函数的最大值均为 $1$，最小正周期均为 $pi$，B、C 正确。#linebreak()$f$ 的零点为 $k pi/2$，$g$ 的零点为 $k pi/2+pi/8$；对称轴分别为 $x=pi/4+k pi/2$ 和 $x=3pi/8+k pi/2$（$k in ZZ$），均不相同，A、D 错误。故选 BC。],
)
#question(
  "multiple-choice",
  stem: [抛物线 $C:y^2=4x$ 的准线为 $l$，$P$ 为 $C$ 上动点。过 $P$ 作 $circle A:x^2+(y-4)^2=1$ 的一条切线，$Q$ 为切点。过 $P$ 作 $l$ 的垂线，垂足为 $B$。则#choice-placeholder()。],
  choices: (
    [$l$ 与 $circle A$ 相切],
    [当 $P,A,B$ 三点共线时，$abs(P Q)=sqrt(15)$],
    [当 $abs(P B)=2$ 时，$P A perp A B$],
    [满足 $abs(P A)=abs(P B)$ 的点 $P$ 有且仅有 $2$ 个],
  ),
  answers: ([ABD],),
  explanation: [
    #step[选项 A、B][圆心 $A(0,4)$ 到准线 $x=-1$ 的距离为 $1$，等于半径，A 正确。#linebreak()$P B$ 水平，若 $P,A,B$ 共线，则 $P=(4,4)$，从而 $abs(P Q)=sqrt(abs(P A)^2-1)=sqrt(15)$，B 正确。]
    #step[选项 C、D][当 $abs(P B)=2$ 时，$x_P=1$。取 $P=(1,2)$、$B=(-1,2)$，有 $arrow(A P) dot arrow(A B)=(1,-2) dot (-1,-2)=3!=0$，C 错误。#linebreak()设 $P=(t^2/4,t)$，则
      $ abs(P A)^2-abs(P B)^2=t^2/2-8t+15. $
      方程 $t^2-16t+30=0$ 有两个不同实根，每个根对应一个 $P$。这些点均在圆外，因为 $abs(P A)=abs(P B)=t^2/4+1>1$，所以切线存在，D 正确。故选 ABD。]
  ],
)
#question(
  "multiple-choice",
  stem: [设函数 $f(x)=2x^3-3a x^2+1$，则#choice-placeholder()。],
  choices: (
    [当 $a>1$ 时，$f(x)$ 有三个零点],
    [当 $a<0$ 时，$x=0$ 是 $f(x)$ 的极大值点],
    [存在 $a,b$，使得 $x=b$ 为曲线 $y=f(x)$ 的对称轴],
    [存在 $a$，使得点 $(1,f(1))$ 为曲线 $y=f(x)$ 的对称中心],
  ),
  answers: ([AD],),
  explanation: [
    #step[选项 A、B][$f'(x)=6x(x-a)$。当 $a>1$ 时，$f$ 在 $0$ 处极大，在 $a$ 处极小，且 $f(0)=1>0$、$f(a)=1-a^3<0$，结合两端极限，恰有三个零点，A 正确。#linebreak()当 $a<0$ 时，$f'$ 在 $0$ 两侧由负变正，$0$ 是极小值点，B 错误。]
    #step[选项 C、D][若 $x=b$ 为对称轴，则 $f(b+t)-f(b-t)$ 应恒为零，但其三次项为 $4t^3$，不可能，C 错误。#linebreak()取 $a=2$，有 $f(1+t)+f(1-t)=-6=2f(1)$，故 $(1,f(1))$ 为对称中心，D 正确。选 AD。]
  ],
)

#section[填空题：本题共 3 小题，每小题 5 分，共 15 分。]
#question(
  "fill-in",
  stem: [记 $S_n$ 为等差数列 $lr({a_n})$ 的前 $n$ 项和。若 $a_3+a_4=7$，$3a_2+a_5=5$，则 $S_10=$#fill-placeholder()。],
  answers: ([$95$],),
  explanation: [设首项为 $a_1$、公差为 $d$，则 $2a_1+5d=7$、$4a_1+7d=5$，解得 $d=3$、$a_1=-4$。#linebreak()所以 $S_10=10times(-4)+45 times 3=95$。],
)
#question(
  "fill-in",
  stem: [已知 $alpha$ 为第一象限角，$beta$ 为第三象限角，$tan alpha+tan beta=4$，$tan alpha tan beta=sqrt(2)+1$，则 $sin(alpha+beta)=$#fill-placeholder()。],
  answers: ([$-2sqrt(2)/3$],),
  explanation: [$tan(alpha+beta)=4/(1-(sqrt(2)+1))=-2sqrt(2)$。#linebreak()两角分别取第一、第三象限的代表角时，和角在 $(pi,2pi)$ 内；又正切为负，故和角在第四象限。#linebreak()于是 $sin(alpha+beta)<0$，其平方为 $(tan(alpha+beta))^2/(1+(tan(alpha+beta))^2)=8/9$，所以 $sin(alpha+beta)=-2sqrt(2)/3$。],
)
#question(
  "fill-in",
  stem: [在如图的 $4 times 4$ 的方格表中选 $4$ 个方格，要求每行和每列均恰有一个方格被选中，则共有#fill-placeholder()种选法。在所有符合上述要求的选法中，选中方格中的 $4$ 个数之和的最大值是#fill-placeholder()。
    #table(
      columns: 4,
      align: center,
      [$11$], [$21$], [$31$], [$40$],
      [$12$], [$22$], [$33$], [$42$],
      [$13$], [$22$], [$33$], [$43$],
      [$15$], [$24$], [$34$], [$44$],
    )],
  answers: ([$24$], [$112$]),
  explanation: [每行选取的列号恰为 $1,2,3,4$ 的一个排列，故有 $4!=24$ 种选法。#linebreak()若第 $i$ 行第 $j$ 列的数均为 $10j+i$，任一选法的和均为 $10(1+2+3+4)+(1+2+3+4)=110$。#linebreak()实际表格仅有四处不同：第 $(1,4)$、$(3,2)$ 格各少 $1$，第 $(2,3)$、$(4,1)$ 格各多 $1$，所以总和至多为 $112$。#linebreak()选 $21,33,43,15$ 时每行每列恰有一个，且和为 $112$，故最大值为 $112$。],
)

#section[解答题：本题共 5 小题，共 77 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [记 $triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $sin A+sqrt(3)cos A=2$。],
  parts: (
    subquestion(
      stem: [求 $A$；],
      answers: ([$pi/6$],),
      explanation: [$2sin(A+pi/3)=2$，而 $A+pi/3 in (pi/3,4pi/3)$，故 $A+pi/3=pi/2$，所以 $A=pi/6$。],
    ),
    subquestion(
      stem: [若 $a=2$，$sqrt(2)b sin C=c sin 2B$，求 $triangle A B C$ 的周长。],
      answers: ([$2+3sqrt(2)+sqrt(6)$],),
      explanation: [由正弦定理，$b sin C=c sin B$。代入已知条件并约去正数 $c sin B$，得 $sqrt(2)=2cos B$，故 $B=pi/4$，$C=7pi/12$。#linebreak()又 $frac(a, sin A)=4$，所以 $b=4sin B=2sqrt(2)$、$c=4sin C=sqrt(6)+sqrt(2)$。#linebreak()故周长为 $2+3sqrt(2)+sqrt(6)$。],
    ),
  ),
)
#question("solution", score: 15, stem: [已知函数 $f(x)=e^x-a x-a^3$。], parts: (
  subquestion(
    stem: [当 $a=1$ 时，求曲线 $y=f(x)$ 在点 $(1,f(1))$ 处的切线方程；],
    answers: ([$y=(e-1)x-1$],),
    explanation: [当 $a=1$ 时，$f(1)=e-2$、$f'(1)=e-1$，故切线为 $y-(e-2)=(e-1)(x-1)$，即 $y=(e-1)x-1$。],
  ),
  subquestion(
    stem: [若 $f(x)$ 有极小值，且极小值小于 $0$，求 $a$ 的取值范围。],
    answers: ([$(1,+infinity)$],),
    explanation: [$f'(x)=e^x-a$。当 $a<=0$ 时，导数恒正，无极小值；当 $a>0$ 时，导数在 $x=ln a$ 两侧由负变正，极小值为
      $ f(ln a)=a-a ln a-a^3=a(1-ln a-a^2). $
      该值小于 $0$ 等价于 $ln a+a^2>1$。#linebreak()函数 $ln a+a^2$ 在 $a>0$ 上严格递增，且 $a=1$ 时等于 $1$，所以 $a>1$。],
  ),
))
#question(
  "solution",
  score: 15,
  stem: [如图，平面四边形 $A B C D$ 中，$A B=8$，$C D=3$，$A D=5sqrt(3)$，$angle A D C=90degree$，$angle B A D=30degree$，点 $E,F$ 满足 $arrow(A E)=2/5 arrow(A D)$，$arrow(A F)=1/2 arrow(A B)$，将 $triangle A E F$ 沿 $E F$ 翻折至 $triangle P E F$，使得 $P C=4sqrt(3)$。
    #figure(fold-figure())],
  parts: (
    subquestion(
      stem: [证明：$E F perp P D$；],
      answers: ([证明见解析。],),
      explanation: [由题设，$A E=2sqrt(3)$、$A F=4$，$angle E A F=30degree$。由余弦定理得 $E F=2$，故 $A E^2+E F^2=A F^2$，即 $A E perp E F$。#linebreak()翻折保持角度，故 $P E perp E F$。又 $E D$ 与 $A E$ 共线，$E D perp E F$，且 $P E$ 与 $E D$ 相交，所以 $E F perp$ 平面 $P E D$。#linebreak()∵ $P D subset$ 平面 $P E D$，∴ $E F perp P D$。],
    ),
    subquestion(
      stem: [求面 $P C D$ 与面 $P B F$ 所成的二面角的正弦值。],
      answers: ([$8sqrt(65)/65$],),
      explanation: [
        #step[确定翻折后的点位][以 $E$ 为原点，$E D$、$E F$ 分别为 $x$、$y$ 轴正方向，建立空间直角坐标系。由题设与上一问，
          $
            D(3sqrt(3),0,0), quad C(3sqrt(3),3,0), quad F(0,2,0), quad B(2sqrt(3),4,0).
          $
          设 $P=(u,0,w)$，取 $w>0$。因 $P E=2sqrt(3)$、$P C=4sqrt(3)$，有 $u^2+w^2=12$、$(u-3sqrt(3))^2+9+w^2=48$，故 $u=0$、$w=2sqrt(3)$。]
        #step[计算两平面夹角][平面 $P C D$ 的法向量可取 $bold(n)=(2,0,3)$，平面 $P B F$ 的法向量可取 $bold(m)=(1,-sqrt(3),-1)$。#linebreak()设二面角为 $theta$，则
          $
            cos^2 theta=(bold(n) dot bold(m))^2/(abs(bold(n))^2 abs(bold(m))^2)=1/65.
          $
          所以 $sin theta=sqrt(1-1/65)=8sqrt(65)/65$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 17,
  stem: [某投篮比赛分为两个阶段，每个参赛队由两名队员组成。比赛具体规则如下：第一阶段由参赛队中一名队员投篮 $3$ 次，若 $3$ 次都未投中，则该队被淘汰，比赛成绩为 $0$ 分；若至少投中 $1$ 次，则该队进入第二阶段。第二阶段由该队的另一名队员投篮 $3$ 次，每次投篮投中得 $5$ 分，未投中得 $0$ 分。该队的比赛成绩为第二阶段的得分总和。某参赛队由甲、乙两名队员组成，设甲每次投中的概率为 $p$，乙每次投中的概率为 $q$，各次投中与否相互独立。],
  parts: (
    subquestion(
      stem: [若 $p=0.4$，$q=0.5$，甲参加第一阶段比赛，求甲、乙所在队的比赛成绩不少于 $5$ 分的概率；],
      answers: ([$0.686$],),
      explanation: [成绩不少于 $5$ 分等价于甲在第一阶段至少投中一次，且乙在第二阶段至少投中一次。#linebreak()由独立性，所求概率为 $(1-0.6^3)(1-0.5^3)=0.784 times 0.875=0.686$。],
    ),
    subquestion(stem: [假设 $0<p<q$。], parts: (
      subquestion(
        stem: [为使得甲、乙所在队的比赛成绩为 $15$ 分的概率最大，应该由谁参加第一阶段比赛？],
        answers: ([甲。],),
        explanation: [甲先投时，得 $15$ 分的概率为 $U=(1-(1-p)^3)q^3$；乙先投时为 $V=(1-(1-q)^3)p^3$。#linebreak()作差得
          $ U-V=3p q(q-p)(p+q-p q)>0. $
          所以应由甲参加第一阶段比赛。],
      ),
      subquestion(
        stem: [为使得甲、乙所在队的比赛成绩的数学期望最大，应该由谁参加第一阶段比赛？],
        answers: ([甲。],),
        explanation: [甲先投时，成绩的数学期望为 $E_1=15q(1-(1-p)^3)$；乙先投时为 $E_2=15p(1-(1-q)^3)$。#linebreak()作差得
          $ E_1-E_2=15p q(q-p)(3-p-q)>0, $
          因为 $0<p<q<=1$。所以仍应由甲参加第一阶段比赛。],
      ),
    )),
  ),
)
#question(
  "solution",
  score: 17,
  stem: [已知双曲线 $C:x^2-y^2=m$（$m>0$），点 $P_1(5,4)$ 在 $C$ 上，$k$ 为常数，$0<k<1$。按照如下方式依次构造点 $P_n$（$n=2,3,dots$）：过点 $P_(n-1)$ 作斜率为 $k$ 的直线与 $C$ 的左支交于点 $Q_(n-1)$，令 $P_n$ 为 $Q_(n-1)$ 关于 $y$ 轴的对称点。记 $P_n$ 的坐标为 $(x_n,y_n)$。],
  parts: (
    subquestion(
      stem: [若 $k=1/2$，求 $x_2,y_2$；],
      answers: ([$x_2=3$，$y_2=0$。],),
      explanation: [由 $P_1(5,4)$ 在 $C$ 上，得 $m=9$。过 $P_1$ 的直线为 $y=x/2+3/2$。#linebreak()与 $x^2-y^2=9$ 联立，得 $(x-5)(x+3)=0$，取左支交点 $Q_1(-3,0)$，所以 $P_2(3,0)$。],
    ),
    subquestion(
      stem: [证明：数列 $lr({x_n-y_n})$ 是公比为 $(1+k)/(1-k)$ 的等比数列；],
      answers: ([证明见解析。],),
      explanation: [因 $Q_(n-1)=(-x_n,y_n)$，两点连线斜率为 $k$，故
        $ y_n-y_(n-1)=-k(x_n+x_(n-1)). $
        又两点都在 $C$ 上，$x_n^2-y_n^2=x_(n-1)^2-y_(n-1)^2=9$。作差并代入，约去正数 $x_n+x_(n-1)$，得
        $ x_n-x_(n-1)=-k(y_n+y_(n-1)). $
        两式相减整理，得 $(1-k)(x_n-y_n)=(1+k)(x_(n-1)-y_(n-1))$。#linebreak()由于 $x_1-y_1=1$，故该数列为首项 $1$、公比 $(1+k)/(1-k)$ 的等比数列。],
    ),
    subquestion(
      stem: [设 $S_n$ 为 $triangle P_n P_(n+1) P_(n+2)$ 的面积。证明：对于任意正整数 $n$，$S_n=S_(n+1)$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[表示顶点坐标][记 $r=(1+k)/(1-k)>1$、$u_n=x_n-y_n$、$v_n=x_n+y_n$。由上一问及双曲线方程，得 $u_n=r^(n-1)$、$v_n=9r^(-(n-1))$。#linebreak()又 $x_n=(u_n+v_n)/2$、$y_n=(v_n-u_n)/2$。]
        #step[计算面积][由三角形坐标面积公式，代入上述关系并展开，得
          $
            S_n=1/4 abs((u_(n+1)-u_n)(v_(n+2)-v_n)-(u_(n+2)-u_n)(v_(n+1)-v_n)).
          $
          记 $t=r^(n-1)$，则相邻三个 $u$ 值为 $t,r t,r^2 t$，三个 $v$ 值为 $9/t,9/(r t),9/(r^2 t)$，所以
          $
            S_n=9/4 abs((r-1)(r^(-2)-1)-(r^2-1)(r^(-1)-1))=(9(r-1)^2(r^2-1))/(4r^2).
          $
          右端与 $n$ 无关，故 $S_n=S_(n+1)$。]
      ],
    ),
  ),
)
