#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020全国2文(甘肃,青海,内蒙古,黑龙江,吉林,辽宁.宁夏,新疆,陕西,重庆).pdf",
  regions: (
    "甘肃",
    "青海",
    "内蒙古",
    "黑龙江",
    "吉林",
    "辽宁",
    "宁夏",
    "新疆",
    "陕西",
    "重庆",
  ),
)
#let keyboard-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((0, 0), (7, 3.4))
  for x in range(1, 7) { line((x, 0), (x, 3.4)) }
  for (x, index) in ((1, 2), (2, 4), (4, 7), (5, 9), (6, 11)) {
    rect((x - 0.3, 1.4), (x + 0.3, 3.4), fill: black, stroke: none)
    content((x, 3.4), $a_#index$, anchor: "south", padding: 3pt)
  }
  for (i, index) in (1, 3, 5, 6, 8, 10, 12).enumerate() {
    content((i + 0.5, 0.65), $a_#index$)
  }
})
#let flowchart() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.6, 6.15), (0.6, 6.65), radius: 0.2)
  content((0, 6.4), [开始])
  line((-1.2, 5.15), (1, 5.15), (1.2, 5.65), (-1, 5.65), close: true)
  content((0, 5.4), [输入 $k,a$])
  for (y, label) in ((4.25, $a=2a+1$), (3.25, $k=k+1$)) {
    rect((-1.15, y - 0.25), (1.15, y + 0.25))
    content((0, y), label)
  }
  line((0, 2.7), (1.2, 2.25), (0, 1.8), (-1.2, 2.25), close: true)
  content((0, 2.25), [$a>10$])
  line((-0.95, 0.85), (0.75, 0.85), (0.95, 1.35), (-0.75, 1.35), close: true)
  content((0, 1.1), [输出 $k$])
  rect((-0.6, -0.05), (0.6, 0.45), radius: 0.2)
  content((0, 0.2), [结束])
  for (a, b) in (
    (6.15, 5.65),
    (5.15, 4.5),
    (4, 3.5),
    (3, 2.7),
    (1.8, 1.35),
    (0.85, 0.45),
  ) {
    line((0, a), (0, b), mark: (end: ">"))
  }
  line((-1.2, 2.25), (-1.7, 2.25), (-1.7, 4.8), (-0.3, 4.8), mark: (end: ">"))
  line((-0.3, 4.8), (0, 4.8))
  content((-1.4, 2.4), [否], anchor: "south")
  content((0.15, 1.57), [是], anchor: "west")
})
#let prism-diagram(auxiliary: false) = cetz.canvas(length: 5mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (3 * calc.sqrt(3), -3, 0)
  let c = (3 * calc.sqrt(3), 3, 0)
  let shift = 3 - 2 * calc.sqrt(3)
  let h = 3 * calc.sqrt(3)
  let a1 = (shift, 0, h)
  let b1 = (3 * calc.sqrt(3) + shift, -3, h)
  let c1 = (3 * calc.sqrt(3) + shift, 3, h)
  let m = (3 * calc.sqrt(3), 0, 0)
  let n = (3 * calc.sqrt(3) + shift, 0, h)
  let o = (3, 0, h)
  let p = (calc.sqrt(3), 0, 0)
  let e = (calc.sqrt(3), -1, 0)
  let f = (calc.sqrt(3), 1, 0)
  let foot = (1.5 * calc.sqrt(3), 0, 1.5)
  oblique-project((1, 0), (0.7, 0.65), (0, 1.2), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a1, n, m)
    line(e, b1)
    line(b, c1)
    line(a, c, stroke: (dash: figure-style.dash))
    line(a, m, stroke: (dash: figure-style.dash))
    line(e, f, c1, stroke: (dash: figure-style.dash))
    line(a, o, stroke: (dash: figure-style.dash))
    line(p, n, stroke: (dash: figure-style.dash))
    line(b, f, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(m, foot, stroke: (dash: figure-style.dash))
      content(foot, $H$, anchor: "east", padding: 5pt)
    }
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south"),
      (m, $M$, "north-west"),
      (n, $N$, "south"),
      (o, $O$, "south"),
      (p, $P$, "north"),
      (e, $E$, "north-east"),
      (f, $F$, "south-east"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})
#section[选择题：本大题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A=\{x | |x|<3,x in ZZ\},B=\{x | |x|>1,x in ZZ\}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([$emptyset$], [$\{-3,-2,2,3\}$], [$\{-2,0,2\}$], [$\{-2,2\}$]),
  answers: ([D],),
  explanation: [交集中的元素满足 $1<|x|<3$ 且为整数，故 $A inter B=\{-2,2\}$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [$(1-i)^4=$#choice-placeholder()。],
  choices: ([$-4$], [$4$], [$-4i$], [$4i$]),
  answers: ([A],),
  explanation: [$(1-i)^2=-2i$，故 $(1-i)^4=(-2i)^2=-4$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [如图，将钢琴上的 12 个键依次记为 $a_1,a_2,dots,a_12$。设 $1<=i<j<k<=12$。若 $k-j=3$ 且 $j-i=4$，则称 $a_i,a_j,a_k$ 为原位大三和弦；若 $k-j=4$ 且 $j-i=3$，则称 $a_i,a_j,a_k$ 为原位小三和弦。用这 12 个键可以构成的原位大三和弦与原位小三和弦的个数之和为#choice-placeholder()。#figure(keyboard-diagram())],
  choices: ([$5$], [$8$], [$10$], [$15$]),
  answers: ([C],),
  explanation: [两种和弦均满足 $k=i+7<=12$，故 $i$ 可取 $1,2,3,4,5$。大三和弦由 $(i,j,k)=(i,i+4,i+7)$ 唯一确定，有 5 个；小三和弦由 $(i,i+3,i+7)$ 唯一确定，也有 5 个。两类不重合，因此共有 $5+5=10$ 个。],
)

#question(
  "single-choice",
  score: 5,
  stem: [在新冠肺炎疫情防控期间，某超市开通网上销售业务，每天能完成 1200 份订单的配货，由于订单量大幅增加，导致订单积压。为解决困难，许多志愿者踊跃报名参加配货工作。已知该超市某日积压 500 份订单未配货，预计第二天的新订单超过 1600 份的概率为 $0.05$。志愿者每人每天能完成 50 份订单的配货，为使第二天完成积压订单及当日订单的配货的概率不小于 $0.95$，则至少需要志愿者#choice-placeholder()。],
  choices: ([10 名], [18 名], [24 名], [32 名]),
  answers: ([B],),
  explanation: [新订单不超过 1600 份的概率为 $1-0.05=0.95$。按此订单量配置人手，需满足 $1200+50n>=500+1600$，得 $n>=18$，故选 18 名。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知单位向量 $bold(a),bold(b)$ 的夹角为 $60degree$，则在下列向量中，与 $bold(b)$ 垂直的是#choice-placeholder()。],
  choices: (
    [$bold(a)+2bold(b)$],
    [$2bold(a)+bold(b)$],
    [$bold(a)-2bold(b)$],
    [$2bold(a)-bold(b)$],
  ),
  answers: ([D],),
  explanation: [$bold(a) dot bold(b)=cos 60degree=1/2$。四个选项分别与 $bold(b)$ 作数量积，依次得 $5/2,2,-3/2,0$，所以只有 $2bold(a)-bold(b)$ 与 $bold(b)$ 垂直。],
)

#question(
  "single-choice",
  score: 5,
  stem: [记 $S_n$ 为等比数列 $\{a_n\}$ 的前 $n$ 项和。若 $a_5-a_3=12,a_6-a_4=24$，则 $S_n/a_n=$#choice-placeholder()。],
  choices: ([$2^n-1$], [$2-2^(1-n)$], [$2-2^(n-1)$], [$2^(1-n)-1$]),
  answers: ([B],),
  explanation: [设公比为 $q$，则 $a_6-a_4=q(a_5-a_3)$，故 $q=2$。所以 $S_n=a_1(2^n-1)$，$a_n=a_1 2^(n-1)$，从而 $S_n/a_n=2-2^(1-n)$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [执行下面的程序框图，若输入的 $k=0,a=0$，则输出的 $k$ 为#choice-placeholder()。#figure(flowchart())],
  choices: ([$2$], [$3$], [$4$], [$5$]),
  answers: ([C],),
  explanation: [依次执行后，$(k,a)$ 为 $(1,1),(2,3),(3,7),(4,15)$。前三次均不满足 $a>10$，第四次满足并退出，因此输出 $k=4$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [若过点 $(2,1)$ 的圆与两坐标轴都相切，则圆心到直线 $2x-y-3=0$ 的距离为#choice-placeholder()。],
  choices: ([$sqrt(5)/5$], [$2sqrt(5)/5$], [$3sqrt(5)/5$], [$4sqrt(5)/5$]),
  answers: ([B],),
  explanation: [圆与两坐标轴相切，且经过第一象限内的点，故圆心也在第一象限。设圆心为 $(r,r)$，半径为 $r>0$，则 $(2-r)^2+(1-r)^2=r^2$，解得 $r=1$ 或 $5$。两种情况下，圆心到直线的距离均为 $frac(|2r-r-3|, sqrt(5))=2sqrt(5)/5$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $O$ 为坐标原点，直线 $x=a$ 与双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的两条渐近线分别交于 $D,E$ 两点。若 $triangle O D E$ 的面积为 $8$，则 $C$ 的焦距的最小值为#choice-placeholder()。],
  choices: ([$4$], [$8$], [$16$], [$32$]),
  answers: ([B],),
  explanation: [渐近线为 $y=plus.minus b/a x$，故可设 $D(a,b),E(a,-b)$。由面积 $1/2 times 2b times a=8$ 得 $a b=8$。焦距 $2c=2sqrt(a^2+b^2)>=2sqrt(2a b)=8$，当且仅当 $a=b=2sqrt(2)$ 时取等号，所以最小值为 $8$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=x^3-1/x^3$，则 $f(x)$#choice-placeholder()。],
  choices: (
    [是奇函数，且在 $(0,+infinity)$ 上单调递增],
    [是奇函数，且在 $(0,+infinity)$ 上单调递减],
    [是偶函数，且在 $(0,+infinity)$ 上单调递增],
    [是偶函数，且在 $(0,+infinity)$ 上单调递减],
  ),
  answers: ([A],),
  explanation: [定义域为 $RR without \{0\}$，关于原点对称，且 $f(-x)=-f(x)$，所以 $f$ 是奇函数。在 $(0,+infinity)$ 上，$x^3$ 与 $-1/x^3$ 均严格递增，故 $f$ 也严格递增。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知 $triangle A B C$ 是面积为 $9sqrt(3)/4$ 的等边三角形，且其顶点都在球 $O$ 的球面上。若球 $O$ 的表面积为 $16pi$，则 $O$ 到平面 $A B C$ 的距离为#choice-placeholder()。],
  choices: ([$sqrt(3)$], [$3/2$], [$1$], [$sqrt(3)/2$]),
  answers: ([C],),
  explanation: [由 $sqrt(3)/4 a^2=9sqrt(3)/4$ 得三角形边长为 $3$，其外接圆半径为 $r=3/sqrt(3)=sqrt(3)$。由 $4pi R^2=16pi$ 得球半径 $R=2$，故球心到截面平面的距离为 $sqrt(R^2-r^2)=1$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [若 $2^x-2^y<3^(-x)-3^(-y)$，则#choice-placeholder()。],
  choices: ([$ln(y-x+1)>0$], [$ln(y-x+1)<0$], [$ln|x-y|>0$], [$ln|x-y|<0$]),
  answers: ([A],),
  explanation: [令 $g(t)=2^t-3^(-t)$，它在 $RR$ 上严格递增。原不等式等价于 $g(x)<g(y)$，故 $x<y$。因此 $y-x+1>1$，得 $ln(y-x+1)>0$。而 $|x-y|$ 与 $1$ 的大小关系不能确定。],
)

#section[填空题：本大题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [若 $sin x=-2/3$，则 $cos 2x=$#fill-placeholder()。],
  answers: ([$1/9$],),
  explanation: [$cos 2x=1-2sin^2 x=1-2 times 4/9=1/9$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [记 $S_n$ 为等差数列 $\{a_n\}$ 的前 $n$ 项和。若 $a_1=-2,a_2+a_6=2$，则 $S_10=$#fill-placeholder()。],
  answers: ([$25$],),
  explanation: [设公差为 $d$，则 $a_2+a_6=2a_1+6d=-4+6d=2$，得 $d=1$。因此 $S_10=10a_1+(10 times 9)/2 d=-20+45=25$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(x+y>=-1, x-y>=-1, 2x-y<=1)$，则 $z=x+2y$ 的最大值是#fill-placeholder()。],
  answers: ([$8$],),
  explanation: [由 $2x-y<=1,x-y>=-1$，得 $z=3(2x-y)-5(x-y)<=3+5=8$。当 $(x,y)=(2,3)$ 时满足所有约束，且等号成立，所以最大值为 $8$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设有下列四个命题：

    $p_1$：两两相交且不过同一点的三条直线必在同一平面内；

    $p_2$：过空间中任意三点有且仅有一个平面；

    $p_3$：若空间两条直线不相交，则这两条直线平行；

    $p_4$：若直线 $l subset$ 平面 $alpha$，直线 $m perp$ 平面 $alpha$，则 $m perp l$。

    则下述命题中所有真命题的序号是#fill-placeholder()。

    ① $p_1 and p_4$；② $p_1 and p_2$；③ $not p_2 or p_3$；④ $not p_3 or not p_4$。],
  answers: ([①③④],),
  explanation: [#step[判断原命题][$p_1$ 为真：前两条相交直线确定一个平面，第三条直线与它们的两个不同交点均在该平面内，故第三条直线也在平面内。
      $p_2$ 为假：三点共线时，经过它们的平面不唯一。
      $p_3$ 为假：两条异面直线也不相交。
      $p_4$ 为真：垂直于平面的直线垂直于该平面内的任意直线。]
    #step[判断复合命题][由 $p_1,p_4$ 真、$p_2,p_3$ 假，得①真、②假、③真、④真，故填①③④。]],
)

#section[解答题：共 70 分。第 17 至 21 题为必考题，每题 12 分；第 22、23 题为选考题。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 12,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $cos^2(pi/2+A)+cos A=5/4$。],
  parts: (
    subquestion(
      stem: [求 $A$；],
      answers: ([$pi/3$。],),
      explanation: [由诱导公式，$sin^2 A+cos A=5/4$，即 $1-cos^2 A+cos A=5/4$。整理得 $(cos A-1/2)^2=0$，故 $cos A=1/2$。因 $0<A<pi$，所以 $A=pi/3$。],
    ),
    subquestion(
      stem: [若 $b-c=sqrt(3)/3 a$，证明：$triangle A B C$ 是直角三角形。],
      answers: ([$B=pi/2$，证明见解析。],),
      explanation: [由 $b-c=a/sqrt(3)>0$ 得 $b>c$ 且 $a^2=3(b-c)^2$。又 $A=pi/3$，由余弦定理得 $a^2=b^2+c^2-b c$。
        两式联立，得 $2b^2-5b c+2c^2=0$，即 $(2b-c)(b-2c)=0$。由 $b>c>0$，得 $b=2c$，进而 $a=sqrt(3)c$，所以 $a^2+c^2=b^2$。因此 $B=pi/2$，$triangle A B C$ 是直角三角形。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某沙漠地区经过治理，生态系统得到很大改善，野生动物数量有所增加。为调查该地区某种野生动物数量，将其分成面积相近的 200 个地块，从这些地块中用简单随机抽样的方法抽取 20 个作为样区，调查得到样本数据 $(x_i,y_i)$（$i=1,2,dots,20$），其中 $x_i$ 和 $y_i$ 分别表示第 $i$ 个样区的植物覆盖面积（单位：公顷）和这种野生动物的数量，并计算得
    $ sum_(i=1)^20 x_i=60, quad sum_(i=1)^20 y_i=1200, $
    $
      sum_(i=1)^20(x_i-overline(x))^2=80, quad sum_(i=1)^20(y_i-overline(y))^2=9000,
    $
    $ sum_(i=1)^20(x_i-overline(x))(y_i-overline(y))=800. $
    附：相关系数 $r=frac(sum_(i=1)^n (x_i-overline(x))(y_i-overline(y)), sqrt(sum_(i=1)^n (x_i-overline(x))^2 sum_(i=1)^n (y_i-overline(y))^2))$，$sqrt(2)approx 1.414$。],
  parts: (
    subquestion(
      stem: [求该地区这种野生动物数量的估计值（这种野生动物数量的估计值等于样区这种野生动物数量的平均数乘以地块数）；],
      answers: ([12000。],),
      explanation: [样区的平均数量为 $overline(y)=1200/20=60$，故总体数量的估计值为 $200 times 60=12000$。],
    ),
    subquestion(
      stem: [求样本 $(x_i,y_i)$（$i=1,2,dots,20$）的相关系数（精确到 $0.01$）；],
      answers: ([$0.94$。],),
      explanation: [$r=800/sqrt(80 times 9000)=2sqrt(2)/3 approx 0.94$。],
    ),
    subquestion(
      stem: [根据现有统计资料，各地块间植物覆盖面积差异很大。为提高样本的代表性以获得该地区这种野生动物数量更准确的估计，请给出一种你认为更合理的抽样方法，并说明理由。],
      answers: ([按植物覆盖面积分层，再按各层地块数的比例随机抽样。],),
      explanation: [可根据植物覆盖面积的大小，将 200 个地块划分为若干层，再按各层地块数占总体的比例，在各层内随机抽取地块。样本相关系数约为 $0.94$，说明植物覆盖面积与动物数量具有较强的正相关性。按覆盖面积分层能使不同类型的地块按比例进入样本，提高样本的代表性。],
    ),
  ),
)

#question(
  "solution",
  score: 12,
  stem: [已知椭圆 $C_1:x^2/a^2+y^2/b^2=1$（$a>b>0$）的右焦点 $F$ 与抛物线 $C_2$ 的焦点重合，$C_1$ 的中心与 $C_2$ 的顶点重合。过 $F$ 且与 $x$ 轴垂直的直线交 $C_1$ 于 $A,B$ 两点，交 $C_2$ 于 $C,D$ 两点，且 $|C D|=4/3|A B|$。],
  parts: (
    subquestion(
      stem: [求 $C_1$ 的离心率；],
      answers: ([$1/2$。],),
      explanation: [设 $F(c,0)$，其中 $c=sqrt(a^2-b^2)>0$，则 $C_2:y^2=4c x$。令 $x=c$，得 $|A B|=2b^2/a$，$|C D|=4c$。由题意，$4c=4/3 times 2b^2/a$，即 $3a c=2b^2=2(a^2-c^2)$。
        令 $e=c/a$，得 $2e^2+3e-2=0$，即 $(2e-1)(e+2)=0$。由 $0<e<1$，得 $e=1/2$。],
    ),
    subquestion(
      stem: [若 $C_1$ 的四个顶点到 $C_2$ 的准线距离之和为 12，求 $C_1$ 与 $C_2$ 的标准方程。],
      answers: ([$C_1:x^2/16+y^2/12=1$，$C_2:y^2=8x$。],),
      explanation: [由上一问，$a=2c,b=sqrt(3)c$，而 $C_2$ 的准线为 $x=-c$。椭圆的四个顶点为 $(2c,0),(-2c,0),(0,sqrt(3)c),(0,-sqrt(3)c)$，到准线的距离依次为 $3c,c,c,c$。
        故 $6c=12$，得 $c=2$。所以 $a=4,b^2=12$，所求标准方程为 $C_1:x^2/16+y^2/12=1$ 与 $C_2:y^2=8x$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，已知三棱柱 $A B C-A_1 B_1 C_1$ 的底面是正三角形，侧面 $B B_1 C_1 C$ 是矩形，$M,N$ 分别为 $B C,B_1 C_1$ 的中点，$P$ 为 $A M$ 上一点，过 $B_1 C_1$ 和 $P$ 的平面交 $A B$ 于 $E$，交 $A C$ 于 $F$。#figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [证明：$A A_1 parallel M N$，且平面 $A_1 A M N perp$ 平面 $E B_1 C_1 F$；],
      answers: ([证明见解析。],),
      explanation: [矩形中两对边中点的连线 $M N parallel B B_1$，而三棱柱的侧棱 $A A_1 parallel B B_1$，故 $A A_1 parallel M N$。
        正三角形中 $B C perp A M$；又 $B C perp B B_1$，故 $B C perp M N$。因 $A M inter M N=M$，得 $B C perp$ 平面 $A_1 A M N$。又 $B_1 C_1 parallel B C$，故 $B_1 C_1 perp$ 平面 $A_1 A M N$。由 $B_1 C_1 subset$ 平面 $E B_1 C_1 F$，得所证两平面垂直。],
    ),
    subquestion(
      stem: [设 $O$ 为 $triangle A_1 B_1 C_1$ 的中心，若 $A O=A B=6$，$A O parallel$ 平面 $E B_1 C_1 F$，且 $angle M P N=pi/3$，求四棱锥 $B-E B_1 C_1 F$ 的体积。],
      answers: ([$24$。],),
      explanation: [#step[求截面梯形的面积][记平面 $A_1 A M N$ 为 $alpha$，平面 $E B_1 C_1 F$ 为 $beta$。上下底面平行，故 $E F parallel B_1 C_1 parallel B C$，并且 $P$ 为 $E F$ 的中点。
          由 $A O parallel beta$、$A O subset alpha$ 及 $alpha inter beta=P N$，得 $A O parallel P N$。又 $O N parallel A P$，所以四边形 $A P N O$ 为平行四边形。因此
          $ P N=A O=6, quad A P=O N=frac(A_1 N, 3)=sqrt(3). $
          $A M=3sqrt(3)$，所以 $P M=2sqrt(3)$，且 $(E F)/(B C)=(A P)/(A M)=1/3$，得 $E F=2$。
          由第一问，$B_1 C_1 perp alpha$，故 $P N perp B_1 C_1$，是截面梯形的高。因此截面面积为
          $ S=1/2(E F+B_1 C_1)P N=1/2(2+6)times 6=24. $]
        #step[求棱锥的高][在 $alpha$ 内作 $M H perp P N$，垂足为 $H$。两平面 $alpha,beta$ 垂直，故 $M H perp beta$。
          又 $B M parallel B_1 C_1 subset beta$，因此 $B,M$ 到 $beta$ 的距离相同，四棱锥的高为
          $ M H=P M sin(angle M P N)=2sqrt(3)times sqrt(3)/2=3. $
          所以 $V_(B-E B_1 C_1 F)=1/3 times 24 times 3=24$。
          #figure(prism-diagram(auxiliary: true))]],
    ),
  ),
)
#question("solution", score: 12, stem: [已知函数 $f(x)=2ln x+1$。], parts: (
  subquestion(
    stem: [若 $f(x)<=2x+c$，求 $c$ 的取值范围；],
    answers: ([$[-1,+infinity)$。],),
    explanation: [定义域为 $(0,+infinity)$。令 $h(x)=f(x)-2x=2ln x+1-2x$，则 $h'(x)=2/x-2$。因此 $h$ 在 $(0,1)$ 上递增，在 $(1,+infinity)$ 上递减，最大值为 $h(1)=-1$。
      原不等式对定义域内所有 $x$ 成立，当且仅当 $c>=h(1)=-1$，故 $c in [-1,+infinity)$。],
  ),
  subquestion(
    stem: [设 $a>0$，讨论函数 $g(x)=(f(x)-f(a))/(x-a)$ 的单调性。],
    answers: (
      [在 $(0,a)$ 和 $(a,+infinity)$ 上均单调递减，没有单调递增区间。],
    ),
    explanation: [#step[求导并化简][定义域为 $(0,a) union (a,+infinity)$。由 $g(x)=2ln(x/a)/(x-a)$，得
        $ g'(x)=frac(2(1-a/x-ln(x/a)), (x-a)^2). $
        令 $t=a/x>0$，则分子括号内为 $1-t+ln t$。]
      #step[判断导数符号][设 $u(t)=ln t-t+1$，则 $u'(t)=1/t-1$，故 $u$ 在 $t=1$ 处取得唯一最大值 $u(1)=0$。由于 $x != a$，有 $t != 1$，所以 $u(t)<0$，从而 $g'(x)<0$。
        因此 $g$ 在 $(0,a)$ 和 $(a,+infinity)$ 上均单调递减，没有单调递增区间；$x=a$ 不属于定义域。]],
  ),
))
#section[选考题：第 22、23 题中任选一题作答，每题 10 分。如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4-4：坐标系与参数方程。已知曲线 $C_1,C_2$ 的参数方程分别为 $C_1:cases(x=4cos^2 theta, y=4sin^2 theta)$（$theta$ 为参数），$C_2:cases(x=t+1/t, y=t-1/t)$（$t$ 为参数）。],
  parts: (
    subquestion(
      stem: [将 $C_1,C_2$ 的参数方程化为普通方程；],
      answers: ([$C_1:x+y=4$（$0<=x<=4$）；$C_2:x^2-y^2=4$。],),
      explanation: [由 $cos^2 theta+sin^2 theta=1$，得 $C_1:x+y=4$，且 $0<=x<=4$；随 $theta$ 变化可取遍该线段。
        对 $C_2$，$t != 0$，由 $x+y=2t,x-y=2/t$ 得 $x^2-y^2=4$。反过来，双曲线上任一点均满足 $x+y != 0$，取 $t=(x+y)/2$ 即可恢复参数式，故没有遗漏或多出的点。],
    ),
    subquestion(
      stem: [以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系。设 $C_1,C_2$ 的交点为 $P$，求圆心在极轴上，且经过极点和 $P$ 的圆的极坐标方程。],
      answers: ([$rho=17/5 cos theta$。],),
      explanation: [联立 $x+y=4$ 与 $(x+y)(x-y)=4$，得 $x-y=1$，故 $P(5/2,3/2)$，位于所给线段上。
        设圆心为 $(d,0)$，$d>0$。圆过原点，故方程为 $(x-d)^2+y^2=d^2$。代入 $P$ 得 $25/4-5d+9/4=0$，即 $d=17/10$。
        圆的直角坐标方程为 $x^2+y^2=17/5 x$，化为极坐标得 $rho=17/5 cos theta$；极点也在此方程表示的圆上。],
    ),
  ),
)

#question(
  "solution",
  score: 10,
  stem: [选修 4-5：不等式选讲。已知函数 $f(x)=|x-a^2|+|x-2a+1|$。],
  parts: (
    subquestion(
      stem: [当 $a=2$ 时，求不等式 $f(x)>=4$ 的解集；],
      answers: ([$(-infinity,3/2] union [11/2,+infinity)$。],),
      explanation: [当 $a=2$ 时，
        $
          f(x)=|x-4|+|x-3|=cases(7-2x & quad x<=3, 1 & quad 3<x<4, 2x-7 & quad x>=4).
        $
        在第一段，$7-2x>=4$ 得 $x<=3/2$；中间一段无解；在第三段，$2x-7>=4$ 得 $x>=11/2$。故解集为 $(-infinity,3/2] union [11/2,+infinity)$。],
    ),
    subquestion(
      stem: [若 $f(x)>=4$，求 $a$ 的取值范围。],
      answers: ([$(-infinity,-1] union [3,+infinity)$。],),
      explanation: [要求不等式对任意实数 $x$ 成立。由绝对值三角不等式，
        $ f(x)>=|a^2-(2a-1)|=(a-1)^2. $
        因 $a^2>=2a-1$，当 $2a-1<=x<=a^2$ 时等号成立，所以 $f$ 的最小值恰为 $(a-1)^2$。因此所求条件等价于 $(a-1)^2>=4$，解得 $a<=-1$ 或 $a>=3$，即 $(-infinity,-1] union [3,+infinity)$。],
    ),
  ),
)

