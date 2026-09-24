#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2025,
  type: "普通高等学校春季招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2025/2025春季上海.pdf",
  regions: ("上海",),
)

#let material-figure() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let x = (4 + calc.sqrt(7)) / 3
  let y = x * x / 3 + 1
  let curve = range(61).map(i => {
    let t = i / 20
    (t, t * t / 3 + 1)
  })
  line(
    (0, 4),
    ..curve,
    (3, 4),
    close: true,
    fill: gray.lighten(65%),
    stroke: none,
  )
  line((0, 0), (4, 0), (4, 4), (0, 4), close: true)
  line(..curve)
  line((x, 0), (x, y), (4, y))
  for (p, label, anchor) in (
    ((0, 0), $A$, "north-east"),
    ((4, 0), $B$, "north-west"),
    ((4, 4), $C$, "south-west"),
    ((0, 4), $D$, "south-east"),
    ((0, 1), $M$, "east"),
    ((3, 4), $N$, "south"),
    ((x, y), $P$, "north-west"),
    ((x, 0), $Q$, "north"),
    ((4, y), $R$, "west"),
  ) { content(p, label, anchor: anchor, padding: 0.08) }
})
#let frustum-figure() = cetz.canvas(length: 11mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (4, 0, 0)
  let c = (4, 4, 0)
  let d = (0, 4, 0)
  let ap = (1, 1, 2.5)
  let bp = (3, 1, 2.5)
  let cp = (3, 3, 2.5)
  let dp = (1, 3, 2.5)
  oblique-project((1, 0), (0.5, 0.4), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, cp, dp, ap, a)
    line(ap, bp, cp)
    line(b, bp)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, dp, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (ap, $A_1$, "east"),
      (bp, $B_1$, "north-west"),
      (cp, $C_1$, "south-west"),
      (dp, $D_1$, "south-east"),
    ) { content(p, label, anchor: anchor, padding: 0.1) }
  })
})
#let pyramid-figure(auxiliary: false) = cetz.canvas(length: 23mm, {
  import cetz.draw: *
  let a = (0, -1, 0)
  let c = (0, 1, 0)
  let b = (1, 0, 0)
  let o = (0, 0, 0)
  let p = (0, 0, calc.sqrt(3))
  oblique-project((-0.35, -0.6), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, p, c, b, a)
    line(p, b)
    line(a, c, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(p, o, b, stroke: (dash: figure-style.dash))
      content(o, $O$, anchor: "south-west", padding: 0.08)
    }
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (p, $P$, "south"),
    ) { content(point, label, anchor: anchor, padding: 0.1) }
  })
})
#let ellipse-figure() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  set-style(axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.15,
    shared-zero: $O$,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (5, 2.5),
    axis-style: "school-book",
    x-min: -2.5,
    x-max: 2.5,
    y-min: -0.8,
    y-max: 1.7,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.annotate(resize: false, {
        let points = range(101).map(i => {
          let t = i * 180deg / 100
          (2 * calc.cos(t), calc.sin(t))
        })
        line(..points)
      })
    },
  )
})
#let stem-leaf-figure() = cetz.canvas(length: 6mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((-0.4, 0.6), (-0.4, -3.8))
  line((0.4, 0.6), (0.4, -3.8))
  line((-6.5, 0), (8.5, 0))
  content((-0.6, 0.35), [甲队], anchor: "east")
  content((0.6, 0.35), [乙队], anchor: "west")
  for (i, (stem, left, right)) in (
    (15, (), (9,)),
    (16, (7, 7, 5, 5, 4), (0, 3, 5, 5, 6, 7, 8, 8)),
    (17, (8, 5, 4, 3, 2, 2), (2,)),
    (18, (3,), ()),
  ).enumerate() {
    let y = -0.6 - i
    content((0, y), [#stem])
    for (j, leaf) in left.enumerate() {
      content((j - left.len() + 0.05, y), [#leaf])
    }
    for (j, leaf) in right.enumerate() { content((j + 0.9, y), [#leaf]) }
  }
})

#section[填空题：本题共 12 小题，第 1—6 题每小题 4 分，第 7—12 题每小题 5 分，共 54 分。]
#question(
  "fill-in",
  stem: [已知集合 $A={x | x>0}$，$B={-1,0,1,2}$，则 $A inter B$ 等于#fill-placeholder()。],
  answers: ([${1,2}$],),
  explanation: [$B$ 中大于 $0$ 的元素为 $1,2$，故 $A inter B={1,2}$。],
)
#question(
  "fill-in",
  stem: [不等式 $x/(x-1)<0$ 的解集为#fill-placeholder()。],
  answers: ([$(0,1)$],),
  explanation: [分子与分母异号，得 $0<x<1$。],
)
#question(
  "fill-in",
  stem: [已知复数 $z=(2+i)/i$，其中 $i$ 为虚数单位，则 $abs(z)=$#fill-placeholder()。],
  answers: ([$sqrt(5)$],),
  explanation: [$z=1-2i$，故 $abs(z)=sqrt(1+4)=sqrt(5)$。],
)
#question(
  "fill-in",
  stem: [已知 $bold(a)=(2,1)$，$bold(b)=(1,x)$，若 $bold(a) parallel bold(b)$，则 $x=$#fill-placeholder()。],
  answers: ([$1/2$],),
  explanation: [由向量平行，$2x-1=0$，故 $x=1/2$。],
)
#question(
  "fill-in",
  stem: [已知 $tan alpha=1$，则 $cos(alpha+pi/4)=$#fill-placeholder()。],
  answers: ([$0$],),
  explanation: [∵ $sin alpha=cos alpha$，∴ $cos(alpha+pi/4)=sqrt(2)/2(cos alpha-sin alpha)=0$。],
)
#question(
  "fill-in",
  stem: [已知 $(x+m/x)^6$ 的展开式中常数项为 $20$，则实数 $m$ 的值为#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [展开式通项为 $binom(6, k)m^k x^(6-2k)$，令 $6-2k=0$，得 $k=3$。#linebreak()∴ $binom(6, 3)m^3=20$，解得 $m=1$。],
)
#question(
  "fill-in",
  stem: [已知 $lr({a_n})$ 是首项为 $1$、公差为 $1$ 的等差数列，$lr({b_n})$ 是首项为 $1$、公比为 $q$（$q>0$）的等比数列。若数列 $lr({a_n dot b_n})$ 的前三项和为 $2$，则 $q=$#fill-placeholder()。],
  answers: ([$1/3$],),
  explanation: [$a_n=n$，$b_n=q^(n-1)$，故 $1+2q+3q^2=2$，即 $(3q-1)(q+1)=0$。#linebreak()结合 $q>0$，得 $q=1/3$。],
)
#question(
  "fill-in",
  stem: [关于 $x$ 的方程 $abs(x-1)+abs(pi-x)=pi-1$ 的解集为#fill-placeholder()。],
  answers: ([$[1,pi]$],),
  explanation: [数轴上点 $x$ 到 $1$，$pi$ 的距离之和等于两点间距离，当且仅当 $x in [1,pi]$ 时成立。],
)
#question(
  "fill-in",
  stem: [已知 $P$ 是一个圆锥的顶点，$P A$ 是母线，$P A=2$，该圆锥的底面半径是 $1$。$B$，$C$ 分别在圆锥的底面上，则异面直线 $P A$ 与 $B C$ 所成角的最小值为#fill-placeholder()。],
  answers: ([$pi/3$],),
  explanation: [设底面圆心为 $O$，则 $A O=1$，$P O perp$ 底面，母线与底面的夹角为 $arccos(A O/P A)=pi/3$。#linebreak()母线与底面内直线所成角不小于它与底面的夹角；取 $B C parallel A O$ 且 $A in.not B C$，可取等号且两直线异面，故最小值为 $pi/3$。],
)
#question(
  "fill-in",
  stem: [已知双曲线 $x^2/a^2-y^2/(6-a^2)=1$（$a>0$）的左、右焦点分别为 $F_1$，$F_2$。通过 $F_2$ 且倾斜角为 $pi/3$ 的直线与双曲线交于第一象限的点 $A$，延长 $A F_2$ 至 $B$ 使得 $A B=A F_1$。若 $triangle B F_1 F_2$ 的面积为 $3sqrt(6)$，则 $a$ 的值为#fill-placeholder()。],
  answers: ([$sqrt(3)$],),
  explanation: [焦半距 $c=sqrt(6)$。由双曲线定义与点的顺序，$F_2 B=A B-A F_2=A F_1-A F_2=2a$。#linebreak()点 $B$ 到 $x$ 轴的距离为 $2a sin(pi/3)=sqrt(3)a$，故
    $ S_(triangle B F_1 F_2)=1/2 times 2sqrt(6) times sqrt(3)a=3sqrt(6). $
    解得 $a=sqrt(3)$。],
)
#question(
  "fill-in",
  stem: [如图所示，正方形 $A B C D$ 是一块边长为 $4$ 的工程用料，阴影部分所示是被腐蚀的区域，其余部分完好，曲线 $M N$ 为以 $A D$ 为对称轴的抛物线的一部分，$D M=D N=3$。工人师傅现要从完好的部分中截取一块矩形原料 $B Q P R$，当其面积有最大值时，$A Q$ 的长为#fill-placeholder()。
    #figure(material-figure())],
  answers: ([$(4+sqrt(7))/3$],),
  explanation: [以 $A$ 为原点，$A B$，$A D$ 为坐标轴，则 $M(0,1)$，$N(3,4)$，抛物线为 $y=x^2/3+1$。#linebreak()记 $A Q=x$。若 $3<=x<4$，面积至多为 $4(4-x)<=4$。若 $0<=x<=3$，在固定 $x$ 时，将矩形上边移到抛物线上可使面积最大，此时
    $ S(x)=(4-x)(x^2/3+1), quad S'(x)=-x^2+8x/3-1. $
    两个驻点为 $x_-=(4-sqrt(7))/3$，$x_+=(4+sqrt(7))/3$；导数在两根之间为正，两侧为负。#linebreak()因 $S(0)=S(3)=4$，而 $S(2)=14/3>4$，故全局最大值在 $x=x_+$ 处取得，所求为 $(4+sqrt(7))/3$。],
)
#question(
  "fill-in",
  stem: [在平面中，$bold(e)_1$ 和 $bold(e)_2$ 是互相垂直的单位向量，向量 $bold(a)$ 满足 $abs(bold(a)-4bold(e)_1)=2$，向量 $bold(b)$ 满足 $abs(bold(b)-6bold(e)_2)=1$，求 $bold(b)$ 在 $bold(a)$ 方向上的数量投影的最大值#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [以两单位向量为基底，$bold(a)$ 的终点在圆 $(x-4)^2+y^2=4$ 上。原点到该圆的切线与正 $x$ 轴夹角为 $pi/6$，故单位方向向量 $bold(u)=bold(a)/abs(bold(a))$ 的纵坐标至多为 $1/2$。#linebreak()写成 $bold(b)=6bold(e)_2+bold(v)$，其中 $abs(bold(v))=1$，则
    $ bold(b) dot bold(u)=6bold(e)_2 dot bold(u)+bold(v) dot bold(u)<=3+1=4. $
    取 $bold(a)=(3,sqrt(3))$，$bold(u)=(sqrt(3)/2,1/2)$，$bold(b)=6bold(e)_2+bold(u)$ 时等号成立，故最大值为 $4$。],
)

#section[选择题：本题共 4 小题，第 13、14 题每小题 4 分，第 15、16 题每小题 5 分，共 18 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [如图，$A B C D-A_1 B_1 C_1 D_1$ 是正四棱台，则下列各组直线中属于异面直线的是#choice-placeholder()。
    #figure(frustum-figure())],
  choices: (
    [$A B$ 和 $C_1 D_1$],
    [$A A_1$ 和 $C C_1$],
    [$B D_1$ 和 $B_1 D$],
    [$A_1 D_1$ 和 $A B$],
  ),
  answers: ([D],),
  explanation: [A 中两直线平行；B 中两侧棱所在直线交于原棱锥顶点；C 中两直线同在对角截面 $B D D_1 B_1$ 内并相交。#linebreak()D 中两直线不平行，且分别位于两个平行的底面内，不可能相交，故为异面直线，选 D。],
)
#question(
  "single-choice",
  stem: [幂函数 $y=x^a$ 在 $(0,+infinity)$ 上是严格减函数，且经过 $(-1,-1)$，则 $a$ 的值可能是#choice-placeholder()。],
  choices: ([$-2/3$], [$-1/3$], [$1/3$], [$3$]),
  answers: ([B],),
  explanation: [严格递减要求 $a<0$。$a=-2/3$ 时，$(-1)^(-2/3)=1$；$a=-1/3$ 时，$(-1)^(-1/3)=-1$，满足条件，选 B。],
)
#question(
  "single-choice",
  stem: [有一四边形 $A B C D$，对于其四边 $A B$，$B C$，$C D$，$D A$，按顺序分别抛掷一枚质量均匀的硬币：如硬币正面朝上，则将其擦去；如硬币反面朝上，则不擦去。最后，以 $A$ 为起点沿着尚未擦去的边出发，可以到达 $C$ 点的概率为#choice-placeholder()。],
  choices: ([$1/2$], [$7/16$], [$1/4$], [$3/16$]),
  answers: ([B],),
  explanation: [沿 $A B C$ 可达要求前两边均保留，概率为 $1/4$；沿 $A D C$ 可达的概率也为 $1/4$。两条路径同时可达要求四边均保留，概率为 $1/16$。#linebreak()∴ 所求概率为 $1/4+1/4-1/16=7/16$，选 B。],
)
#question(
  "single-choice",
  stem: [已知 $a in RR$，不等式 $(tan(pi/6 x)-a)(tan(pi/6 x)-a-1)<0$ 在 $(0,2025)$ 中的整数解有 $m$ 个。关于 $m$ 的个数，以下不可能的是#choice-placeholder()。],
  choices: ([$0$], [$338$], [$674$], [$1012$]),
  answers: ([D],),
  explanation: [不等式等价于 $a<tan(pi x/6)<a+1$。整数 $x$ 按模 $6$ 分类：
    #table(
      columns: 7,
      align: center,
      [$x mod 6$], [$0$], [$1$], [$2$], [$3$], [$4$], [$5$],
      [$tan(pi x/6)$],
      [$0$],
      [$1/sqrt(3)$],
      [$sqrt(3)$],
      [无定义],
      [$-sqrt(3)$],
      [$-1/sqrt(3)$],

      [个数], [$337$], [$338$], [$338$], [$337$], [$337$], [$337$],
    )
    这五个实数中，任意三个的跨度均大于 $1$，故长度为 $1$ 的开区间至多包含两个值，整数解至多 $676$ 个，$1012$ 不可能。#linebreak()取 $a=2$，$a=0.4$，$a=-0.8$，可分别得到 $m=0,338,674$，故选 D。],
)

#section[解答题：本题共 5 小题，共 78 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [在三棱锥 $P-A B C$ 中，平面 $P A C perp$ 平面 $A B C$，$P A=A C=C P=2$，$A B=B C=sqrt(2)$。
    #figure(pyramid-figure())],
  parts: (
    subquestion(
      stem: [若 $O$ 是棱 $A C$ 的中点，证明：$B O perp$ 平面 $P A C$，并求三棱锥 $B-O P A$ 的体积；],
      answers: ([$B O perp$ 平面 $P A C$，体积为 $sqrt(3)/6$。],),
      explanation: [∵ $A B=B C$，$O$ 为 $A C$ 中点，∴ $B O perp A C$。#linebreak()又两平面垂直，交线为 $A C$，$B O subset$ 平面 $A B C$，故 $B O perp$ 平面 $P A C$。#linebreak()$A O=1$，$B O=sqrt(2-1)=1$，$P O=sqrt(4-1)=sqrt(3)$。#linebreak()∴ $V_(B-O P A)=1/3 times (1/2 times 1 times sqrt(3)) times 1=sqrt(3)/6$。],
    ),
    subquestion(
      stem: [求二面角 $B-P C-A$ 的大小。],
      answers: ([$arccos(sqrt(21)/7)$。],),
      explanation: [
        #figure(pyramid-figure(auxiliary: true))
        以 $O$ 为原点，$O B$，$O C$，$O P$ 所在直线为坐标轴，得 $B(1,0,0)$，$C(0,1,0)$，$A(0,-1,0)$，$P(0,0,sqrt(3))$。#linebreak()平面 $B P C$ 的法向量可取 $bold(n)=(sqrt(3),sqrt(3),1)$，平面 $A P C$ 的法向量可取 $bold(m)=(1,0,0)$。#linebreak()为确定二面角的锐钝，将 $arrow(C A)$，$arrow(C B)$ 分别正交投影到垂直于 $C P$ 的平面，所得向量的数量积为 $3/2>0$，故所求二面角为锐角。#linebreak()∴ 其余弦为 $abs(bold(m) dot bold(n))/(abs(bold(m))abs(bold(n)))=sqrt(21)/7$，大小为 $arccos(sqrt(21)/7)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [在 $triangle A B C$ 中，角 $A$，$B$，$C$ 所对的边分别为 $a$，$b$，$c$，且 $c=5$。],
  parts: (
    subquestion(
      stem: [若 $a/(4b)=sin B/sin A$，$C=pi/2$，求 $a$；],
      answers: ([$2sqrt(5)$。],),
      explanation: [由正弦定理，$a/(4b)=b/a$，故 $a=2b$。#linebreak()又 $a^2+b^2=c^2=25$，得 $b=sqrt(5)$，$a=2sqrt(5)$。],
    ),
    subquestion(
      stem: [若 $a b=20$，求 $triangle A B C$ 的面积的最大值。],
      answers: ([$(5sqrt(55))/4$。],),
      explanation: [由余弦定理，$cos C=(a^2+b^2-25)/40>=(2a b-25)/40=3/8$，等号在 $a=b=2sqrt(5)$ 时成立。#linebreak()因此 $sin C<=sqrt(1-9/64)=sqrt(55)/8$，故面积 $S=1/2 a b sin C<=5sqrt(55)/4$。等号可取得，故最大值为 $5sqrt(55)/4$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [甲、乙是两个体育社团的小组。如下是两组组员身高的茎叶图（单位：厘米），以身高的百位数和十位数作为“茎”排列在中间，个位数作为“叶”分列在两边。
    #figure(stem-leaf-figure())],
  parts: (
    subquestion(
      stem: [分别求甲、乙两组组员身高的第 60 百分位数；],
      answers: ([甲组为 $173$ 厘米，乙组为 $166.5$ 厘米。],),
      explanation: [甲组有 12 人，$12 times 60%=7.2$，取升序排列的第 8 个数据，得 $173$。#linebreak()乙组有 10 人，$10 times 60%=6$，取第 6、7 个数据的平均值，得 $(166+167)/2=166.5$。],
    ),
    subquestion(
      stem: [从甲、乙两组各选取一个组员，求两人身高均在 170 厘米以上的概率；],
      answers: ([$7/120$。],),
      explanation: [甲组有 7 人高于 170 厘米，乙组有 1 人高于 170 厘米，故概率为 $7/12 times 1/10=7/120$。],
    ),
    subquestion(
      stem: [为使两组人数相同，从甲组中调派一个队员到乙组。是否存在甲组的一个组员，将他调派至乙组后，甲、乙两组的平均身高都增大？],
      answers: ([存在，将甲组中一名身高 167 厘米的组员调往乙组即可。],),
      explanation: [两组原平均身高分别为 $overline(x)_甲=2055/12=171.25$，$overline(x)_乙=1653/10=165.3$。#linebreak()设调派组员身高为 $h$，甲组平均身高增大等价于 $h<171.25$，乙组平均身高增大等价于 $h>165.3$。#linebreak()甲组中有两名身高 167 厘米的组员，任取其中一名调派即可。],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [在平面直角坐标系中，已知曲线 $Gamma:x^2/4+y^2=1$（$y>=0$），点 $P$，$Q$ 分别为 $Gamma$ 上不同的两点，$T(t,0)$。
    #figure(ellipse-figure())],
  parts: (
    subquestion(
      stem: [求 $Gamma$ 所在椭圆的离心率；],
      answers: ([$sqrt(3)/2$。],),
      explanation: [$a=2$，$b=1$，$c=sqrt(3)$，故 $e=c/a=sqrt(3)/2$。],
    ),
    subquestion(
      stem: [若 $T(1,0)$，$Q$ 在 $y$ 轴上，若 $T$ 到直线 $P Q$ 的距离为 $sqrt(5)/5$，求 $P$ 的坐标；],
      answers: ([$P(2,0)$。],),
      explanation: [$Q(0,1)$，直线 $P Q$ 不可能竖直，设其为 $y=k x+1$。#linebreak()由距离公式，$abs(k+1)/sqrt(k^2+1)=sqrt(5)/5$，得 $2k^2+5k+2=0$，故 $k=-1/2$ 或 $k=-2$。#linebreak()$k=-1/2$ 时，与椭圆的另一交点为 $(2,0)$；$k=-2$ 时，另一交点为 $(16/17,-15/17)$，不在上半椭圆上，应舍去。#linebreak()∴ $P(2,0)$。],
    ),
    subquestion(
      stem: [是否存在 $t$，使得 $triangle T P Q$ 是以 $T$ 为直角顶点的等腰直角三角形？若存在，求 $t$ 的取值范围；若不存在，请说明理由。],
      answers: ([存在，$t in [-6/5,6/5]$。],),
      explanation: [
        #step[用旋转关系表示两点][交换 $P$，$Q$ 的名称后，可设 $arrow(T Q)$ 是 $arrow(T P)$ 逆时针旋转 $90 degree$ 所得。因两点纵坐标非负，可写为
          $ P(t+u,v), quad Q(t-v,u), quad u,v>=0, quad u+v>0. $
          两点均在椭圆上，故 $(t+u)^2+4v^2=4$，$(t-v)^2+4u^2=4$。#linebreak()两式相减得 $(u+v)(2t-3(u-v))=0$，故 $t=3/2(u-v)$。]
        #step[求范围并验证可达][记 $d=u-v$，$s=u+v$，则 $s>0$，$s>=abs(d)$。代回椭圆方程得 $s^2+4d^2=16/5$，故 $5d^2<=16/5$，即 $abs(d)<=4/5$。#linebreak()∴ $abs(t)<=6/5$。反之，对任意 $t in [-6/5,6/5]$，取 $d=2t/3$，$s=sqrt(16/5-4d^2)$，则 $s>=abs(d)$，$s>0$。令 $u=(s+d)/2$，$v=(s-d)/2$，可构造上式中的两点；它们不同，且满足 $T P=T Q$，$T P perp T Q$。#linebreak()故所求范围为 $[-6/5,6/5]$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知函数 $y=f(x)$ 的定义域是 $D$。对于 $t in D$，定义集合 $S_(f(t))={x | f(x)>=f(t)}$。],
  parts: (
    subquestion(
      stem: [$f(x)=log_2 x$，求 $S_(f(16))$；],
      answers: ([$[16,+infinity)$。],),
      explanation: [由 $log_2 x>=log_2 16$，得 $x>=16$，故 $S_(f(16))=[16,+infinity)$。],
    ),
    subquestion(
      stem: [对于集合 $A$，若对任意 $x in A$ 都有 $-x in A$，则称 $A$ 是对称集。若 $D$ 是对称集，证明：“函数 $y=f(x)$ 是偶函数”的充要条件是“对任意 $t in D$，$S_(f(t))$ 是对称集”；],
      answers: ([证明见解析。],),
      explanation: [必要性：若 $f$ 是偶函数，对任意 $x in S_(f(t))$，有 $f(-x)=f(x)>=f(t)$，故 $-x in S_(f(t))$，所以该集合是对称集。#linebreak()充分性：由 $t in S_(f(t))$ 及对称性，得 $-t in S_(f(t))$，故 $f(-t)>=f(t)$。同理，将 $t$ 换为 $-t$，可得 $f(t)>=f(-t)$。#linebreak()∴ $f(t)=f(-t)$ 对任意 $t in D$ 成立，故 $f$ 是偶函数。],
    ),
    subquestion(
      stem: [若 $x in RR$，$f(x)=upright(e)^x-1/2 m x^2$，求 $m$ 的取值范围，使得对于任意 $t_1<t_2$（$t_1,t_2 in D$），都有 $S_(f(t_2)) subset.eq S_(f(t_1))$。],
      answers: ([$[0,upright(e)]$。],),
      explanation: [
        #step[转化为单调性][由 $t_2 in S_(f(t_2)) subset.eq S_(f(t_1))$，得 $f(t_2)>=f(t_1)$。反之，若 $f$ 单调不减，则 $f(x)>=f(t_2)$ 必能推出 $f(x)>=f(t_1)$。#linebreak()因此原条件等价于 $f$ 在 $RR$ 上单调不减，即 $f'(x)=upright(e)^x-m x>=0$ 恒成立。]
        #step[确定参数范围][若 $m<0$，当 $x$ 趋于 $-infinity$ 时，$upright(e)^x-m x<0$，不满足条件，故必须 $m>=0$；此时 $x<=0$ 的导数恒为正。#linebreak()当 $x>0$ 时，要求 $m<=upright(e)^x/x$ 恒成立。函数 $g(x)=upright(e)^x/x$ 的导数为 $g'(x)=upright(e)^x(x-1)/x^2$，最小值在 $x=1$ 处取得，为 $upright(e)$。#linebreak()∴ $0<=m<=upright(e)$。]
      ],
    ),
  ),
)
