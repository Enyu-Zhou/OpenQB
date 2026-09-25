#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020全国2理(甘肃,青海,内蒙古,黑龙江,吉林,辽宁.宁夏,新疆,陕西,重庆).pdf",
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
#let altar-diagram() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  oblique-project((1, 0), (0, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    for (r, z) in ((3.5, 0), (2.4, 0.4), (1.3, 0.8)) {
      let arc(radius, height, start, end) = range(0, 81).map(i => {
        let t = (start + (end - start) * i / 80) * 1deg
        (radius * calc.cos(t), radius * calc.sin(t), height)
      })
      line(
        ..arc(r, z + 0.4, 0, 180),
        ..arc(r, z, 180, 360),
        close: true,
        fill: white,
        stroke: none,
      )
      line(..arc(r, z + 0.4, 0, 360), close: true, fill: white)
      line((-r, 0, z + 0.4), ..arc(r, z, 180, 360), (r, 0, z + 0.4))
    }
  })
})
#let three-views() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  line(
    (0, 2.3),
    (0, 4),
    (1.4, 4),
    (1.4, 3.5),
    (2.8, 3.5),
    (2.8, 1.8),
    (1.4, 1.8),
    (1.4, 2.3),
    close: true,
  )
  rect((0, -0.3), (2.8, 0.9))
  line((1.4, -0.3), (1.4, 0.9))
  rect((3.7, 1.8), (4.9, 4))
  line((3.7, 3.5), (4.9, 3.5))
  line((3.7, 2.3), (4.9, 2.3))
  for (p, label, anchor) in (
    ((1.4, 3.5), $M$, "north"),
    ((1.4, 0.9), $N$, "north-east"),
    ((3.7, 3.5), $E$, "north-west"),
    ((4.9, 3.5), $F$, "north-east"),
    ((3.7, 2.3), $G$, "south-west"),
    ((4.9, 2.3), $H$, "south-east"),
  ) { content(p, label, anchor: anchor, padding: 2pt) }
  content((1.4, 1.5), [正视图])
  content((4.3, 1.5), [侧视图])
  content((1.4, -0.6), [俯视图])
})
#let prism-diagram() = cetz.canvas(length: 14mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (calc.sqrt(3), -1, 0)
  let c = (calc.sqrt(3), 1, 0)
  let shift = -0.4
  let h = calc.sqrt(4 - calc.pow(shift + 2 * calc.sqrt(3) / 3, 2))
  let a1 = (shift, 0, h)
  let b1 = (calc.sqrt(3) + shift, -1, h)
  let c1 = (calc.sqrt(3) + shift, 1, h)
  let m = (calc.sqrt(3), 0, 0)
  let n = (calc.sqrt(3) + shift, 0, h)
  let o = (2 * calc.sqrt(3) / 3 + shift, 0, h)
  let p = (calc.sqrt(3) / 3, 0, 0)
  let e = (calc.sqrt(3) / 3, -1 / 3, 0)
  let f = (calc.sqrt(3) / 3, 1 / 3, 0)
  oblique-project((1, 0), (0.7, 0.65), (0, 1.2), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a1, n, m)
    line(e, b1)
    line(a, c, stroke: (dash: figure-style.dash))
    line(a, m, stroke: (dash: figure-style.dash))
    line(e, f, c1, stroke: (dash: figure-style.dash))
    line(a, o, stroke: (dash: figure-style.dash))
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
  stem: [已知集合 $U=\{-2,-1,0,1,2,3\},A=\{-1,0,1\},B=\{1,2\}$，则 $complement_U (A union B)=$#choice-placeholder()。],
  choices: (
    [$\{-2,3\}$],
    [$\{-2,2,3\}$],
    [$\{-2,-1,0,3\}$],
    [$\{-2,-1,0,2,3\}$],
  ),
  answers: ([A],),
  explanation: [$A union B=\{-1,0,1,2\}$，故 $complement_U (A union B)=\{-2,3\}$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [若 $alpha$ 为第四象限角，则#choice-placeholder()。],
  choices: (
    [$cos 2alpha>0$],
    [$cos 2alpha<0$],
    [$sin 2alpha>0$],
    [$sin 2alpha<0$],
  ),
  answers: ([D],),
  explanation: [第四象限角满足 $sin alpha<0,cos alpha>0$，故 $sin 2alpha=2sin alpha cos alpha<0$。],
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
  stem: [北京天坛的圜丘坛为古代祭天的场所，分上、中、下三层，上层中心有一块圆形石板（称为天心石），环绕天心石砌 9 块扇面形石板构成第一环，向外每环依次增加 9 块，下一层的第一环比上一层的最后一环多 9 块，向外每环依次也增加 9 块。已知每层环数相同，且下层比中层多 729 块，则三层共有扇面形石板（不含天心石）#choice-placeholder()。#figure(altar-diagram())],
  choices: ([3699 块], [3474 块], [3402 块], [3339 块]),
  answers: ([C],),
  explanation: [设每层有 $n$ 环，将三层的各环从内到外连续编号，第 $k$ 环有 $9k$ 块。下层各环分别比中层对应环多 $9n$ 块，故 $9n^2=729$，解得 $n=9$。三层共有 $27$ 环，石板总数为 $9(1+2+dots+27)=9 times (27 times 28)/2=3402$ 块。],
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
  stem: [数列 $\{a_n\}$ 中，$a_1=2,a_(m+n)=a_m a_n$。若 $a_(k+1)+a_(k+2)+dots+a_(k+10)=2^15-2^5$，则 $k=$#choice-placeholder()。],
  choices: ([$2$], [$3$], [$4$], [$5$]),
  answers: ([C],),
  explanation: [令 $m=1$ 得 $a_(n+1)=2a_n$，所以 $a_n=2^n$。由等比数列求和公式，$2^(k+1)(2^10-1)=2^5(2^10-1)$，故 $k+1=5$，得 $k=4$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [如图是一个多面体的三视图，这个多面体某条棱的一个端点在正视图中对应的点为 $M$，在俯视图中对应的点为 $N$，则该端点在侧视图中对应的点为#choice-placeholder()。#figure(three-views())],
  choices: ([$E$], [$F$], [$G$], [$H$]),
  answers: ([A],),
  explanation: [由正视图中 $M$ 的高度，侧视图中的对应点应在 $E,F$ 所在的水平线上；由俯视图中 $N$ 的前后位置，对应点应在侧视图的左边线上。两者共同确定该点为 $E$。],
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
  stem: [设函数 $f(x)=ln|2x+1|-ln|2x-1|$，则 $f(x)$#choice-placeholder()。],
  choices: (
    [是偶函数，且在 $(1/2,+infinity)$ 上单调递增],
    [是奇函数，且在 $(-1/2,1/2)$ 上单调递减],
    [是偶函数，且在 $(-infinity,-1/2)$ 上单调递增],
    [是奇函数，且在 $(-infinity,-1/2)$ 上单调递减],
  ),
  answers: ([D],),
  explanation: [定义域为 $RR without \{-1/2,1/2\}$，关于原点对称，且 $f(-x)=-f(x)$，故为奇函数。求导得 $f'(x)=2/(2x+1)-2/(2x-1)=4/(1-4x^2)$。它在 $(-infinity,-1/2)$ 上为负，在 $(-1/2,1/2)$ 上为正，故选 D。],
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

#question(
  "single-choice",
  score: 5,
  stem: [0-1 周期序列在通信技术中有着重要应用。若序列 $a_1 a_2 dots a_n dots$ 满足 $a_i in \{0,1\}$（$i=1,2,dots$），且存在正整数 $m$，使得 $a_(i+m)=a_i$（$i=1,2,dots$）成立，则称其为 0-1 周期序列，并称满足 $a_(i+m)=a_i$（$i=1,2,dots$）的最小正整数 $m$ 为这个序列的周期。对于周期为 $m$ 的 0-1 序列 $a_1 a_2 dots a_n dots$，
    $ C(k)=1/m sum_(i=1)^m a_i a_(i+k) quad (k=1,2,dots,m-1) $
    是描述其性质的重要指标，下列周期为 5 的 0-1 序列中，满足 $C(k)<=1/5$（$k=1,2,3,4$）的序列是#choice-placeholder()。],
  choices: ([$11010 dots$], [$11011 dots$], [$10001 dots$], [$11001 dots$]),
  answers: ([C],),
  explanation: [计算时下标按周期循环。
    #step[选项 A][$5C(2)=a_1 a_3+a_2 a_4+a_3 a_5+a_4 a_1+a_5 a_2=2$，不满足。]
    #step[选项 B][$5C(1)=a_1 a_2+a_2 a_3+a_3 a_4+a_4 a_5+a_5 a_1=3$，不满足。]
    #step[选项 C][四个相关量分别为 $C(1)=1/5,C(2)=0,C(3)=0,C(4)=1/5$，均符合要求。]
    #step[选项 D][$5C(1)=a_1 a_2+a_2 a_3+a_3 a_4+a_4 a_5+a_5 a_1=2$，不满足。]],
)

#section[填空题：本大题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知单位向量 $bold(a),bold(b)$ 的夹角为 $45degree$，$k bold(a)-bold(b)$ 与 $bold(a)$ 垂直，则 $k=$#fill-placeholder()。],
  answers: ([$sqrt(2)/2$],),
  explanation: [由垂直关系，$0=(k bold(a)-bold(b)) dot bold(a)=k|bold(a)|^2-bold(a) dot bold(b)=k-cos 45degree$，故 $k=sqrt(2)/2$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [4 名同学到 3 个小区参加垃圾分类宣传活动，每名同学只去 1 个小区，每个小区至少安排 1 名同学，则不同的安排方法共有#fill-placeholder()种。],
  answers: ([$36$],),
  explanation: [人数分配只能为 $2,1,1$。先选出同去一个小区的两人，有 $binom(4, 2)=6$ 种；再将这组与另外两人分配到三个小区，有 $3!=6$ 种，共 $6 times 6=36$ 种。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设复数 $z_1,z_2$ 满足 $|z_1|=|z_2|=2,z_1+z_2=sqrt(3)+i$，则 $|z_1-z_2|=$#fill-placeholder()。],
  answers: ([$2sqrt(3)$],),
  explanation: [利用恒等式 $|z_1+z_2|^2+|z_1-z_2|^2=2|z_1|^2+2|z_2|^2$，得 $|z_1-z_2|^2=16-|sqrt(3)+i|^2=12$，故 $|z_1-z_2|=2sqrt(3)$。],
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
  stem: [$triangle A B C$ 中，$sin^2 A-sin^2 B-sin^2 C=sin B sin C$。],
  parts: (
    subquestion(
      stem: [求 $A$；],
      answers: ([$2pi/3$。],),
      explanation: [设 $A,B,C$ 的对边依次为 $a,b,c$，由正弦定理得 $a^2-b^2-c^2=b c$。所以 $cos A=(b^2+c^2-a^2)/(2b c)=-1/2$。∵ $0<A<pi$，∴ $A=2pi/3$。],
    ),
    subquestion(
      stem: [若 $B C=3$，求 $triangle A B C$ 周长的最大值。],
      answers: ([$3+2sqrt(3)$。],),
      explanation: [由余弦定理，$9=b^2+c^2+b c=(b+c)^2-b c$。利用 $b c<=(b+c)^2/4$，得 $9>=3/4(b+c)^2$，所以 $b+c<=2sqrt(3)$。当且仅当 $b=c=sqrt(3)$ 时取等号，且此时能构成三角形。因此周长的最大值为 $3+2sqrt(3)$。],
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
      stem: [设 $M$ 是 $C_1$ 与 $C_2$ 的公共点，若 $|M F|=5$，求 $C_1$ 与 $C_2$ 的标准方程。],
      answers: ([$C_1:x^2/36+y^2/27=1$，$C_2:y^2=12x$。],),
      explanation: [由上一问，$a=2c,b^2=3c^2$，故 $C_1:x^2/(4c^2)+y^2/(3c^2)=1$。代入 $y^2=4c x$，得
        $ 3x^2+16c x-12c^2=0, quad (3x-2c)(x+6c)=0. $
        因抛物线上的点满足 $x>=0$，故 $x_M=2c/3$。由抛物线定义，$|M F|=x_M+c=5c/3=5$，得 $c=3$。因此 $C_1:x^2/36+y^2/27=1$，$C_2:y^2=12x$。],
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
      stem: [设 $O$ 为 $triangle A_1 B_1 C_1$ 的中心，若 $A O parallel$ 平面 $E B_1 C_1 F$，且 $A O=A B$，求直线 $B_1 E$ 与平面 $A_1 A M N$ 所成角的正弦值。],
      answers: ([$sqrt(10)/10$。],),
      explanation: [#step[利用平行条件确定截面位置][记平面 $A_1 A M N$ 为 $alpha$，平面 $E B_1 C_1 F$ 为 $beta$。三棱柱的上下底面平行，故截线 $E F parallel B_1 C_1 parallel B C$。由正三角形的对称性，$P$ 为 $E F$ 的中点。
          ∵ $alpha inter beta=P N$，$A O subset alpha$ 且 $A O parallel beta$，∴ $A O parallel P N$。又 $O N parallel A P$，故四边形 $A P N O$ 为平行四边形。
          因此 $P N=A O=A B$，$A P=O N=(A_1 N)/3=(A M)/3$，从而 $E F=(B C)/3$。]
        #step[求投影与垂直分量][设 $A B=a$。由 $B C perp alpha$，可知 $E$ 与 $B_1$ 在 $alpha$ 上的正投影分别为 $P,N$，故 $E B_1$ 在 $alpha$ 上的投影长度为 $P N=a$。
          $E,B_1$ 位于 $alpha$ 的同侧，到平面的距离分别为 $E P=a/6$、$B_1 N=a/2$。因此 $E B_1$ 的垂直分量长度为 $a/2-a/6=a/3$，得
          $ E B_1=sqrt(a^2+(a/3)^2)=sqrt(10)/3 a. $
          所求线面角 $theta$ 满足 $sin theta=(a/3)/(sqrt(10)a/3)=sqrt(10)/10$。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=sin^2 x sin 2x$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 在区间 $(0,pi)$ 的单调性；],
      answers: (
        [在 $(0,pi/3)$、$(2pi/3,pi)$ 上单调递增，在 $(pi/3,2pi/3)$ 上单调递减。],
      ),
      explanation: [$f(x)=2sin^3 x cos x$，所以
        $ f'(x)=2sin^2 x(3cos^2 x-sin^2 x)=2sin^2 x(4cos^2 x-1). $
        在 $(0,pi)$ 内，$sin^2 x>0$。当 $x in (0,pi/3)$ 或 $x in (2pi/3,pi)$ 时，$f'(x)>0$；当 $x in (pi/3,2pi/3)$ 时，$f'(x)<0$。由此得到上述单调区间。],
    ),
    subquestion(
      stem: [证明：$|f(x)|<=3sqrt(3)/8$；],
      answers: ([证明见解析。],),
      explanation: [$f(x+pi)=f(x)$，故只需研究 $[0,pi]$。由上一问的单调性及
        $ f(0)=f(pi)=0, quad f(pi/3)=3sqrt(3)/8, quad f(2pi/3)=-3sqrt(3)/8, $
        可知 $-3sqrt(3)/8<=f(x)<=3sqrt(3)/8$，即 $|f(x)|<=3sqrt(3)/8$。],
    ),
    subquestion(
      stem: [设 $n in NN^*$，证明：$sin^2 x sin^2 2x sin^2 4x dots sin^2 2^n x<=3^n/4^n$。],
      answers: ([证明见解析。],),
      explanation: [令 $s_j=|sin(2^j x)|$（$j=0,1,dots,n$），则 $0<=s_j<=1$，且由上一问
        $ s_j^2 s_(j+1)=|f(2^j x)|<=3sqrt(3)/8. $
        记 $Q=product_(j=0)^n s_j^2$，则
        $
          Q^(3/2)=s_0 s_n^2 product_(j=0)^(n-1)(s_j^2 s_(j+1))
          <= (3sqrt(3)/8)^n.
        $
        两边均非负，取 $2/3$ 次方，得 $Q<=(3sqrt(3)/8)^(2n/3)=(3/4)^n$，即所证不等式。],
    ),
  ),
)
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
