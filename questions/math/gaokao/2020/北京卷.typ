#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020北京.pdf",
  regions: ("北京",),
)

#let three-views() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  rect((0, 0), (2, 2))
  line((1, 0), (1, 2), stroke: (dash: figure-style.dash))
  rect((3, 0), (3 + calc.sqrt(3), 2))
  line((0, -3.1), (2, -3.1), (1, -3.1 + calc.sqrt(3)), close: true)
  for (a, b, p, label) in (
    ((-0.25, 0), (-0.25, 2), (-0.25, 1), $2$),
    ((0, -0.22), (1, -0.22), (0.5, -0.22), $1$),
    ((1, -0.22), (2, -0.22), (1.5, -0.22), $1$),
  ) {
    line(a, b, mark: (start: ">", end: ">"))
    content(p, label, frame: "rect", fill: white, stroke: none, padding: 1pt)
  }
  content((1, -0.55), [正（主）视图], anchor: "north")
  content((3 + calc.sqrt(3) / 2, -0.55), [侧（左）视图], anchor: "north")
  content((1, -3.25), [俯视图], anchor: "north")
})
#let discharge-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: $O$,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
    grid: (
      stroke: (
        paint: black,
        thickness: figure-style.thickness,
        dash: figure-style.dash,
      ),
    ),
  ))
  let first(t) = 0.45 + 2.5 / (1 + calc.exp(2 * (t - 2)))
  let second(t) = (
    0.65
      + 1.6 / (1 + calc.exp(1.2 * (t - 2.5)) * (1.6 / (first(2.5) - 0.65) - 1))
  )
  plot.plot(
    size: (7, 3.8),
    axis-style: "school-book",
    x-min: 0,
    x-max: 4.5,
    y-min: 0,
    y-max: 3.4,
    x-label: $t$,
    y-label: $W$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((1, $t_1$), (2.5, $t_2$), (4, $t_3$)),
    y-ticks: ((0.95, text(size: 10pt)[污水达标排放量]),),
    y-grid: true,
    {
      plot.add(first, domain: (0, 4.1), samples: 100, style: (
        stroke: (paint: black, thickness: figure-style.thickness),
      ))
      plot.add(second, domain: (0, 4.1), samples: 100, style: (
        stroke: (paint: black, thickness: figure-style.thickness),
      ))
      plot.annotate({
        for (x, y) in ((1, first(1)), (2.5, first(2.5)), (4, 0.95)) {
          line((x, 0), (x, y), stroke: (dash: figure-style.dash))
        }
        content((0.1, 3.02), [甲企业], anchor: "south-west")
        content((-0.05, 2.15), [乙企业], anchor: "south-west")
        content((3.6, 1.15), [乙企业], anchor: "south")
        content((3.6, 0.35), [甲企业], anchor: "north")
      })
    },
  )
})
#let cube-diagram() = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (0, 2, 0)
  let c = (2, 2, 0)
  let d = (2, 0, 0)
  let a1 = (0, 0, 2)
  let b1 = (0, 2, 2)
  let c1 = (2, 2, 2)
  let d1 = (2, 0, 2)
  let e = (0, 2, 1)
  oblique-project((-0.35, -0.35), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(d, c, b, b1, a1, d1, d)
    line(d1, c1, b1)
    line(c, c1)
    line(b, c1)
    line(d, a, b, stroke: (dash: figure-style.dash))
    line(a, a1, stroke: (dash: figure-style.dash))
    line(d1, a, e, d1, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-west"),
      (b, $B$, "west"),
      (c, $C$, "north-west"),
      (d, $D$, "north-east"),
      (a1, $A_1$, "south"),
      (b1, $B_1$, "south-west"),
      (c1, $C_1$, "south-east"),
      (d1, $D_1$, "east"),
      (e, $E$, "west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：本题共 10 小题，每小题 4 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 4,
  stem: [已知集合 $A={-1,0,1,2}$，$B={x | 0<x<3}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${-1,0,1}$], [${0,1}$], [${-1,1,2}$], [${1,2}$]),
  answers: ([D],),
  explanation: [$A$ 中满足 $0<x<3$ 的元素为 $1$、$2$，故 $A inter B={1,2}$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [在复平面内，复数 $z$ 对应的点的坐标是 $(1,2)$，则 $"i" dot z=$#choice-placeholder()。],
  choices: ([$1+2"i"$], [$-2+"i"$], [$1-2"i"$], [$-2-"i"$]),
  answers: ([B],),
  explanation: [$z=1+2"i"$，故 $"i" z="i"+2"i"^2=-2+"i"$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [在 $(sqrt(x)-2)^5$ 的展开式中，$x^2$ 的系数为#choice-placeholder()。],
  choices: ([$-5$], [$5$], [$-10$], [$10$]),
  answers: ([C],),
  explanation: [通项为 $binom(5, r)(-2)^r x^((5-r)/2)$。令 $(5-r)/2=2$，得 $r=1$，故系数为 $binom(5, 1)(-2)=-10$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [某三棱柱的底面为正三角形，其三视图如图所示，该三棱柱的表面积为#choice-placeholder()。
    #figure(three-views())],
  choices: ([$6+sqrt(3)$], [$6+2sqrt(3)$], [$12+sqrt(3)$], [$12+2sqrt(3)$]),
  answers: ([D],),
  explanation: [由三视图可知，该几何体为底面边长 $2$、高 $2$ 的直三棱柱。
    三个侧面的总面积为 $3 times 2 times 2=12$；两个等边三角形底面的总面积为 $2 times sqrt(3)/4 times 2^2=2sqrt(3)$。
    ∴ 表面积为 $12+2sqrt(3)$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [已知半径为 $1$ 的圆经过点 $(3,4)$，则其圆心到原点的距离的最小值为#choice-placeholder()。],
  choices: ([$4$], [$5$], [$6$], [$7$]),
  answers: ([A],),
  explanation: [记 $P=(3,4)$，圆心为 $C$，则 $C P=1$，$O P=5$。由三角不等式，$O C>=O P-C P=4$。
    当 $C$ 在线段 $O P$ 上且 $C P=1$ 时取等，故最小值为 $4$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [已知函数 $f(x)=2^x-x-1$，则不等式 $f(x)>0$ 的解集是#choice-placeholder()。],
  choices: (
    [$(-1,1)$],
    [$(-infinity,-1) union (1,+infinity)$],
    [$(0,1)$],
    [$(-infinity,0) union (1,+infinity)$],
  ),
  answers: ([D],),
  explanation: [$f'(x)=2^x ln 2-1$ 严格递增，且 $f'(0)<0<f'(1)$，故存在唯一 $c in (0,1)$，使 $f$ 在 $(-infinity,c)$ 递减、在 $(c,+infinity)$ 递增。
    结合 $f(0)=f(1)=0$，得 $f(x)>0$ 当且仅当 $x<0$ 或 $x>1$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [设抛物线的顶点为 $O$，焦点为 $F$，准线为 $l$。$P$ 是抛物线上异于 $O$ 的一点，过 $P$ 作 $P Q perp l$ 于 $Q$，则线段 $F Q$ 的垂直平分线#choice-placeholder()。],
  choices: ([经过点 $O$], [经过点 $P$], [平行于直线 $O P$], [垂直于直线 $O P$]),
  answers: ([B],),
  explanation: [由抛物线定义，$P F=P Q$，故点 $P$ 在线段 $F Q$ 的垂直平分线上。],
)
#question(
  "single-choice",
  score: 4,
  stem: [在等差数列 ${a_n}$ 中，$a_1=-9$，$a_5=-1$。记 $T_n=a_1 a_2 dots a_n$（$n=1,2,dots$），则数列 ${T_n}$#choice-placeholder()。],
  choices: (
    [有最大项，有最小项],
    [有最大项，无最小项],
    [无最大项，有最小项],
    [无最大项，无最小项],
  ),
  answers: ([B],),
  explanation: [公差为 $2$，故 $a_n=2n-11$。
    前六个乘积依次为 $-9,63,-315,945,-945,-945$。当 $n>=7$ 时，$a_n>=3$，故 $T_n$ 为负数且严格递减，绝对值趋于无穷大。
    ∴ 最大项为 $T_4=945$，无最小项。],
)
#question(
  "single-choice",
  score: 4,
  stem: [已知 $alpha,beta in RR$，则“存在 $k in ZZ$ 使得 $alpha=k pi+(-1)^k beta$”是“$sin alpha=sin beta$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([C],),
  explanation: [当 $k=2m$ 时，$alpha=2m pi+beta$；当 $k=2m+1$ 时，$alpha=(2m+1)pi-beta$。两种情形均有 $sin alpha=sin beta$。
    反之，$sin alpha=sin beta$ 的全部解恰为 $alpha=2m pi+beta$ 或 $alpha=(2m+1)pi-beta$（$m in ZZ$），均可写成所给形式，故为充分必要条件。],
)
#question(
  "single-choice",
  score: 4,
  stem: [$2020$ 年 $3$ 月 $14$ 日是全球首个国际圆周率日（π Day）。历史上，求圆周率 $pi$ 的方法有多种，与中国传统数学中的“割圆术”相似，数学家阿尔·卡西的方法是：当正整数 $n$ 充分大时，计算单位圆的内接正 $6n$ 边形的周长和外切正 $6n$ 边形（各边均与圆相切的正 $6n$ 边形）的周长，将它们的算术平均数作为 $2pi$ 的近似值。按照阿尔·卡西的方法，$pi$ 的近似值的表达式是#choice-placeholder()。],
  choices: (
    [$3n(sin((30 degree)/n)+tan((30 degree)/n))$],
    [$6n(sin((30 degree)/n)+tan((30 degree)/n))$],
    [$3n(sin((60 degree)/n)+tan((60 degree)/n))$],
    [$6n(sin((60 degree)/n)+tan((60 degree)/n))$],
  ),
  answers: ([A],),
  explanation: [每条边所对的圆心角为 $(60 degree)/n$。将其平分，内接边长为 $2sin((30 degree)/n)$，外切边长为 $2tan((30 degree)/n)$。
    两周长之和为 $12n(sin((30 degree)/n)+tan((30 degree)/n))$。先取算术平均数，再除以 $2$，即得选项 A。],
)

#section[填空题：本题共 5 小题，每小题 5 分，共 25 分。]
#question(
  "fill-in",
  score: 5,
  stem: [函数 $f(x)=1/(x+1)+ln x$ 的定义域是#fill-placeholder()。],
  answers: ([$(0,+infinity)$],),
  explanation: [须有 $x+1 != 0$ 且 $x>0$，合并得 $x>0$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知双曲线 $C:x^2/6-y^2/3=1$，则 $C$ 的右焦点的坐标为#fill-placeholder()；$C$ 的焦点到其渐近线的距离是#fill-placeholder()。],
  answers: ([$(3,0)$], [$sqrt(3)$]),
  explanation: [$c=sqrt(6+3)=3$，故右焦点为 $(3,0)$。渐近线为 $x plus.minus sqrt(2)y=0$。
    由对称性，各焦点到各渐近线的距离相同，均为 $3/sqrt(1+2)=sqrt(3)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知正方形 $A B C D$ 的边长为 $2$，点 $P$ 满足 $arrow(A P)=1/2(arrow(A B)+arrow(A C))$，则 $|arrow(P D)|=$#fill-placeholder()；$arrow(P B) dot arrow(P D)=$#fill-placeholder()。],
  answers: ([$sqrt(5)$], [$-1$]),
  explanation: [取 $A=(0,0)$，$B=(2,0)$，$C=(2,2)$，$D=(0,2)$，则 $P=(2,1)$。
    ∴ $arrow(P D)=(-2,1)$，$arrow(P B)=(0,-1)$，从而 $|arrow(P D)|=sqrt(5)$，$arrow(P B) dot arrow(P D)=-1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若函数 $f(x)=sin(x+phi)+cos x$ 的最大值为 $2$，则常数 $phi$ 的一个取值为#fill-placeholder()。],
  answers: ([$pi/2$（$phi=pi/2+2k pi$，$k in ZZ$ 均可）],),
  explanation: [$f(x)=cos phi sin x+(1+sin phi)cos x$，其最大值为 $sqrt(cos^2 phi+(1+sin phi)^2)=sqrt(2+2sin phi)$。
    令其等于 $2$，得 $sin phi=1$，故可取 $phi=pi/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [为满足人民对美好生活的向往，环保部门要求相关企业加强污水治理，排放未达标的企业要限期整改。设企业的污水排放量 $W$ 与时间 $t$ 的关系为 $W=f(t)$，用 $-(f(b)-f(a))/(b-a)$ 的大小评价在 $[a,b]$ 这段时间内企业污水治理能力的强弱。已知整改期内，甲、乙两企业的污水排放量与时间的关系如图所示。
    #figure(discharge-diagram())
    给出下列四个结论：#linebreak()
    ① 在 $[t_1,t_2]$ 这段时间内，甲企业的污水治理能力比乙企业强；#linebreak()
    ② 在 $t_2$ 时刻，甲企业的污水治理能力比乙企业强；#linebreak()
    ③ 在 $t_3$ 时刻，甲、乙两企业的污水排放都已达标；#linebreak()
    ④ 甲企业在 $[0,t_1]$、$[t_1,t_2]$、$[t_2,t_3]$ 这三段时间中，在 $[0,t_1]$ 的污水治理能力最强。#linebreak()
    其中所有正确结论的序号是#fill-placeholder()。],
  answers: ([①②③],),
  explanation: [#step[结论①][在同一时间段 $[t_1,t_2]$ 内，甲企业排放量的减少量比乙企业大，故甲的平均治理能力更强，正确。]
    #step[结论②][在 $t_2$ 处，甲曲线切线的斜率更小，其相反数更大，故瞬时治理能力更强，正确。]
    #step[结论③][在 $t_3$ 处，两条曲线均低于污水达标排放量的水平线，正确。]
    #step[结论④][甲曲线在 $[t_1,t_2]$ 上的平均下降速度大于在 $[0,t_1]$ 上的平均下降速度，故错误。]],
)

#section[解答题：本题共 6 小题，共 85 分。解答应写出文字说明、演算步骤或证明过程。]
#question(
  "solution",
  score: 13,
  stem: [如图，在正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$E$ 为 $B B_1$ 的中点。
    #figure(cube-diagram())],
  parts: (
    subquestion(
      stem: [求证：$B C_1 parallel$ 平面 $A D_1 E$。],
      answers: ([证明见解析。],),
      explanation: [∵ $A B parallel D_1 C_1$ 且 $A B=D_1 C_1$，∴ 四边形 $A B C_1 D_1$ 为平行四边形，故 $B C_1 parallel A D_1$。
        平面 $A D_1 E$ 与平面 $A B B_1 A_1$ 的交线为 $A E$，而 $B ∉ A E$，故 $B ∉$ 平面 $A D_1 E$。
        又 $A D_1$ 在平面 $A D_1 E$ 内，∴ $B C_1 parallel$ 平面 $A D_1 E$。],
    ),
    subquestion(
      stem: [求直线 $A A_1$ 与平面 $A D_1 E$ 所成角的正弦值。],
      answers: ([$2/3$],),
      explanation: [不妨设棱长为 $2$，以 $A$ 为原点，分别沿 $A D$、$A B$、$A A_1$ 建立空间直角坐标系。
        则 $D_1=(2,0,2)$，$E=(0,2,1)$，平面 $A D_1 E$ 的法向量可取 $bold(n)=(2,1,-2)$，直线 $A A_1$ 的方向向量为 $bold(v)=(0,0,1)$。
        设所求角为 $theta$，则 $sin theta=(|bold(n) dot bold(v)|)/(|bold(n)||bold(v)|)=2/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [在 $triangle A B C$ 中，$a+b=11$，再从条件①、条件②这两个条件中选择一个作为已知。#linebreak()
    条件①：$c=7$，$cos A=-1/7$；#linebreak()
    条件②：$cos A=1/8$，$cos B=9/16$。#linebreak()
    注：如果选择条件①和条件②分别解答，按第一个解答计分。],
  parts: (
    subquestion(
      stem: [求 $a$ 的值。],
      answers: ([选①：$a=8$；选②：$a=6$。],),
      explanation: [#step[选条件①][由余弦定理，$a^2=b^2+49+2b$。代入 $b=11-a$，得 $a^2=(11-a)^2+49+2(11-a)$，解得 $a=8$、$b=3$。]
        #step[选条件②][$sin A=3sqrt(7)/8$，$sin B=5sqrt(7)/16$。由正弦定理，$a/b=(sin A)/(sin B)=6/5$，结合 $a+b=11$，得 $a=6$、$b=5$。]],
    ),
    subquestion(
      stem: [求 $sin C$ 和 $triangle A B C$ 的面积。],
      answers: (
        [选①：$sin C=sqrt(3)/2$，面积 $6sqrt(3)$；选②：$sin C=sqrt(7)/4$，面积 $(15sqrt(7))/4$。],
      ),
      explanation: [#step[选条件①][$sin A=4sqrt(3)/7$，由正弦定理，$sin C=c/a sin A=sqrt(3)/2$。
          ∴ $S=1/2 a b sin C=1/2 times 8 times 3 times sqrt(3)/2=6sqrt(3)$。]
        #step[选条件②][$sin C=sin(A+B)=sin A cos B+cos A sin B=sqrt(7)/4$。
          ∴ $S=1/2 times 6 times 5 times sqrt(7)/4=(15sqrt(7))/4$。]],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [某校为举办甲、乙两项不同活动，分别设计了相应的活动方案：方案一、方案二。为了解该校学生对活动方案是否支持，对学生进行简单随机抽样，获得数据如下表：
    #table(
      columns: 5,
      align: center,
      table.cell(rowspan: 2)[],
      table.cell(colspan: 2)[男生],
      table.cell(colspan: 2)[女生],
      [支持], [不支持], [支持], [不支持],
      [方案一], [$200$ 人], [$400$ 人], [$300$ 人], [$100$ 人],
      [方案二], [$350$ 人], [$250$ 人], [$150$ 人], [$250$ 人],
    )
    假设所有学生对活动方案是否支持相互独立。],
  parts: (
    subquestion(
      stem: [分别估计该校男生支持方案一的概率、该校女生支持方案一的概率。],
      answers: ([分别为 $1/3$、$3/4$。],),
      explanation: [男生支持方案一的频率为 $200/(200+400)=1/3$；女生支持方案一的频率为 $300/(300+100)=3/4$，分别用其估计对应概率。],
    ),
    subquestion(
      stem: [从该校全体男生中随机抽取 $2$ 人，全体女生中随机抽取 $1$ 人，估计这 $3$ 人中恰有 $2$ 人支持方案一的概率。],
      answers: ([$13/36$],),
      explanation: [分为“两名男生支持，女生不支持”及“一名男生支持，女生支持”两种互斥情形。由独立性，所求概率估计为
        $
          (1/3)^2 times (1-3/4)+binom(2, 1) times 1/3 times 2/3 times 3/4=13/36.
        $],
    ),
    subquestion(
      stem: [将该校学生支持方案二的概率估计值记为 $p_0$，假设该校一年级有 $500$ 名男生和 $300$ 名女生，除一年级外其他年级学生支持方案二的概率估计值记为 $p_1$，试比较 $p_0$ 与 $p_1$ 的大小。（结论不要求证明）],
      answers: ([$p_0>p_1$],),
      explanation: [全校男生比例估计为 $600/1000=3/5$，而一年级男生比例为 $500/800=5/8>3/5$，故除一年级外其他年级的男生比例较低。
        男、女生支持方案二的概率估计分别为 $350/600=7/12$、$150/400=3/8$，前者较大。
        按同一组分性别概率估计，男生比例降低使总体支持率降低，故 $p_1<p_0$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知函数 $f(x)=12-x^2$。],
  parts: (
    subquestion(
      stem: [求曲线 $y=f(x)$ 的斜率等于 $-2$ 的切线方程。],
      answers: ([$2x+y-13=0$],),
      explanation: [$f'(x)=-2x$，令 $f'(x)=-2$，得切点为 $(1,11)$。
        故切线为 $y-11=-2(x-1)$，即 $2x+y-13=0$。],
    ),
    subquestion(
      stem: [设曲线 $y=f(x)$ 在点 $(t,f(t))$ 处的切线与坐标轴围成的三角形的面积为 $S(t)$，求 $S(t)$ 的最小值。],
      answers: ([$32$],),
      explanation: [切线为 $y=-2t x+t^2+12$。要与坐标轴围成三角形，须 $t != 0$。
        横、纵截距分别为 $(t^2+12)/(2t)$、$t^2+12$，故 $S(t)=(t^2+12)^2/(4|t|)$。
        令 $u=|t|>0$，记 $g(u)=(u^2+12)^2/(4u)$，则
        $ g'(u)=(3(u^2-4)(u^2+12))/(4u^2). $
        ∴ $g$ 在 $(0,2)$ 递减，在 $(2,+infinity)$ 递增，最小值为 $g(2)=32$，在 $t=plus.minus 2$ 时取得。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1$ 过点 $A(-2,-1)$，且 $a=2b$。],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 的方程。],
      answers: ([$x^2/8+y^2/2=1$],),
      explanation: [代入 $A$ 及 $a^2=4b^2$，得 $4/(4b^2)+1/b^2=1$，故 $b^2=2$、$a^2=8$。
        ∴ $C:x^2/8+y^2/2=1$。],
    ),
    subquestion(
      stem: [过点 $B(-4,0)$ 的直线 $l$ 交椭圆 $C$ 于点 $M$、$N$，直线 $M A$、$N A$ 分别交直线 $x=-4$ 于点 $P$、$Q$，求 $(|P B|)/(|B Q|)$ 的值。],
      answers: ([$1$],),
      explanation: [直线 $x=-4$ 与椭圆不相交，故 $l$ 的斜率存在，设 $l:y=k(x+4)$，$M=(x_1,y_1)$、$N=(x_2,y_2)$。
        联立椭圆方程，得 $(1+4k^2)x^2+32k^2 x+64k^2-8=0$，故
        $ x_1+x_2=(-32k^2)/(1+4k^2), quad x_1 x_2=(64k^2-8)/(1+4k^2). $
        由题意，$M A$、$N A$ 均能与 $x=-4$ 相交，故 $x_1,x_2 != -2$。由直线方程得
        $ y_P=-1-2(y_1+1)/(x_1+2)=-((2k+1)(x_1+4))/(x_1+2), $
        $ y_Q=-((2k+1)(x_2+4))/(x_2+2). $
        从而
        $ y_P+y_Q=-(2k+1)(2x_1 x_2+6(x_1+x_2)+16)/((x_1+2)(x_2+2))=0. $
        又 $P$、$Q$ 不等于 $B$，否则 $A$ 在直线 $l$ 上，使 $M A$ 或 $N A$ 无法确定。故 $y_P=-y_Q != 0$，
        $ (|P B|)/(|B Q|)=(|y_P|)/(|y_Q|)=1. $],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知 ${a_n}$ 是无穷数列。给出两个性质：#linebreak()
    ① 对于 ${a_n}$ 中任意两项 $a_i,a_j$（$i>j$），在 ${a_n}$ 中都存在一项 $a_m$，使得 $a_i^2/a_j=a_m$；#linebreak()
    ② 对于 ${a_n}$ 中任意项 $a_n$（$n>=3$），在 ${a_n}$ 中都存在两项 $a_k,a_l$（$k>l$），使得 $a_n=a_k^2/a_l$。],
  parts: (
    subquestion(
      stem: [若 $a_n=n$（$n=1,2,dots$），判断数列 ${a_n}$ 是否满足性质①，说明理由。],
      answers: ([不满足。],),
      explanation: [取 $i=3$、$j=2$，则 $a_3^2/a_2=9/2$ 不是正整数，不在该数列中，故不满足性质①。],
    ),
    subquestion(
      stem: [若 $a_n=2^(n-1)$（$n=1,2,dots$），判断数列 ${a_n}$ 是否同时满足性质①和性质②，说明理由。],
      answers: ([同时满足性质①和性质②。],),
      explanation: [对任意 $i>j>=1$，有 $a_i^2/a_j=2^(2i-j-1)=a_(2i-j)$，且 $2i-j$ 为正整数，故满足①。
        对任意 $n>=3$，取 $k=n-1$、$l=n-2$，则 $k>l>=1$，且 $a_k^2/a_l=2^(n-1)=a_n$，故满足②。],
    ),
    subquestion(
      stem: [若 ${a_n}$ 是递增数列，且同时满足性质①和性质②，证明：${a_n}$ 为等比数列。],
      answers: ([证明见解析。],),
      explanation: [#step[证明所有项同号且非零][由性质①中的分母可知，每一项均非零。
          若有正项和负项，由递增性，负项恰为前 $r$ 项。若 $r>=2$，则 $a_1<a_r<0$，而性质①要求 $a_r^2/a_1$ 是数列中的一项。它却满足 $a_r<a_r^2/a_1<0$，与 $a_r$ 为最后一项负数矛盾。
          若 $r=1$，则 $0<a_2<a_3$，性质①要求 $a_2^2/a_1$、$a_3^2/a_1$ 是两个不同的负项，也矛盾。
          ∴ 所有项同号。]
        #step[用对数将两个性质化为加法关系][若所有项为正，令 $b_n=ln a_n$；若所有项为负，令 $b_n=-ln(-a_n)$。两种情况下 ${b_n}$ 均严格递增。
          两个性质分别变为：对任意 $i>j$，$2b_i-b_j$ 是数列中的一项；对任意 $n>=3$，存在 $k>l$ 使 $b_n=2b_k-b_l$。
          由于 $2b_k-b_l>b_k$，后一性质中的下标必满足 $l<k<n$。]
        #step[归纳证明新数列为等差数列][记 $d=b_2-b_1>0$。当 $n=3$ 时，第二个性质只能取 $k=2,l=1$，故 $b_3=b_1+2d$。
          假设 $b_j=b_1+(j-1)d$ 对 $1<=j<=n$ 成立，其中 $n>=3$。由第一个性质，$2b_n-b_(n-1)=b_1+n d$ 是大于 $b_n$ 的一项，故
          $ b_n<b_(n+1)<=b_1+n d. $
          由第二个性质，存在 $l<k<=n$，使
          $ b_(n+1)=2b_k-b_l=b_1+(2k-l-1)d. $
          合并得 $n-1<2k-l-1<=n$。中间量为整数，故必等于 $n$，从而 $b_(n+1)=b_1+n d$。
          由数学归纳法，$b_n=b_1+(n-1)d$ 对所有正整数 $n$ 成立。]
        #step[还原原数列][若所有项为正，则 $a_n=a_1 "e"^((n-1)d)$；若所有项为负，则 $a_n=a_1 "e"^(-(n-1)d)$。
          两种情况下 ${a_n}$ 都是等比数列，证毕。]],
    ),
  ),
)
