#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016北京文.pdf",
  regions: ("北京",),
)

#let loop-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    for (y, label) in ((0, [开始]), (-7.5, [结束])) {
      rect((-0.65, y - 0.3), (0.65, y + 0.3), radius: 0.15)
      content((0, y), label)
    }
    rect((-1.3, -1.7), (1.3, -1))
    content((0, -1.35), $k=0,s=0$)
    line((0, -4.2), (1.4, -4.7), (0, -5.2), (-1.4, -4.7), close: true)
    content((0, -4.7), $k<=2$)
    for (y, label) in ((-3.7, $s=s+k^3$), (-2.5, $k=k+1$)) {
      rect((-4.3, y - 0.35), (-2, y + 0.35))
      content((-3.15, y), label)
    }
    line((-1, -6.35), (0.8, -6.35), (1, -5.65), (-0.8, -5.65), close: true)
    content((0, -6), [输出 $s$])
    for (a, b) in ((-0.3, -1), (-1.7, -4.2), (-5.2, -5.65), (-6.35, -7.2)) {
      line((0, a), (0, b), mark: (end: ">"))
    }
    line((-1.4, -4.7), (-3.15, -4.7), (-3.15, -4.05), mark: (end: ">"))
    line((-3.15, -3.35), (-3.15, -2.85), mark: (end: ">"))
    line((-3.15, -2.15), (-3.15, -1.95), (0, -1.95), mark: (end: ">"))
    content((-1.8, -4.6), [是], anchor: "south")
    content((0.2, -5.4), [否], anchor: "west")
  })
}
#let three-views() = {
  set text(size: 9pt)
  cetz.canvas(length: 15mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((0, 0), (2, 1))
    for x in (0.5, 1.5) {
      line((x, 0), (x, 1), stroke: (dash: figure-style.dash))
    }
    rect((3, 0), (4, 1))
    content((1, -0.4), [正（主）视图])
    content((3.5, -0.4), [侧（左）视图])
    line((0, -2.3), (2, -2.3), (1.5, -1.3), (0.5, -1.3), close: true)
    content((1, -2.95), [俯视图])
    for (a, b, label) in (
      ((0, -2.55), (2, -2.55), $2$),
      ((0.5, -1.05), (1.5, -1.05), $1$),
      ((2.25, -2.3), (2.25, -1.3), $1$),
      ((4.25, 0), (4.25, 1), $1$),
    ) {
      line(a, b, mark: (start: ">", end: ">"))
      for p in (a, b) {
        if a.at(1) == b.at(1) {
          line((p.at(0), p.at(1) - 0.08), (p.at(0), p.at(1) + 0.08))
        } else {
          line((p.at(0) - 0.08, p.at(1)), (p.at(0) + 0.08, p.at(1)))
        }
      }
      content(
        ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2),
        label,
        frame: "rect",
        fill: white,
        stroke: none,
        padding: 1pt,
      )
    }
  })
}
#let water-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $0$,
      x: (label: (anchor: "south-west", offset: 0.2)),
      y: (label: (anchor: "south", offset: 0.2)),
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
    ))
    plot.plot(
      size: (8, 4.6),
      axis-style: "school-book",
      x-min: 0,
      x-max: 4.8,
      y-min: 0,
      y-max: 0.58,
      x-label: [用水量（立方米）],
      y-label: [$"频率"/"组距"$],
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: range(1, 10).map(i => i / 2),
      y-ticks: (0.1, 0.2, 0.3, 0.4, 0.5),
      {
        plot.annotate(resize: false, {
          let heights = (0.2, 0.3, 0.4, 0.5, 0.3, 0.1, 0.1, 0.1)
          for (i, h) in heights.enumerate() {
            let x = (i + 1) / 2
            line((x, h), (x + 0.5, h))
            line(
              (x, 0),
              (x, calc.max(h, if i == 0 { 0 } else { heights.at(i - 1) })),
            )
          }
          line((4.5, 0), (4.5, 0.1))
          for (y, x) in (
            (0.1, 0.5),
            (0.2, 0.5),
            (0.3, 1),
            (0.4, 1.5),
            (0.5, 2),
          ) {
            line((0, y), (x, y), stroke: (dash: figure-style.dash))
          }
        })
      },
    )
  })
}
#let pyramid(auxiliary: false) = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((1, 0.25), (0.75, -0.65), (0, 1), {
    let C = (0, 0, 0)
    let A = (0, 1, 0)
    let B = (2, 1, 0)
    let D = (-1, 0, 0)
    let P = (0, 0, 2)
    let E = (1, 1, 0)
    let F = (1, 0.5, 1)
    line(P, D, A, B, P)
    line(P, A)
    for p in (P, D, A, B) { line(C, p, stroke: (dash: figure-style.dash)) }
    circle(E, radius: 0.025, fill: black, stroke: none)
    if auxiliary {
      line(E, F)
      line(E, C, F, stroke: (dash: figure-style.dash))
      content(F, $F$, anchor: "south-west", padding: 3pt)
    }
    for (p, label, anchor) in (
      (P, $P$, "south"),
      (D, $D$, "east"),
      (C, $C$, "south-east"),
      (A, $A$, "north"),
      (B, $B$, "west"),
      (E, $E$, "north"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题意。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x|2<x<4}$，$B={x|x<3 "或" x>5}$，则 $A inter B=$#choice-placeholder()。],
  choices: (
    [${x|2<x<5}$],
    [${x|x<4 "或" x>5}$],
    [${x|2<x<3}$],
    [${x|x<2 "或" x>5}$],
  ),
  answers: ([C],),
  explanation: [$A=(2,4)$，$B=(-infinity,3) union (5,+infinity)$，故 $A inter B=(2,3)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [复数 $(1+2i)/(2-i)=$#choice-placeholder()。],
  choices: ([$i$], [$1+i$], [$-i$], [$1-i$]),
  answers: ([A],),
  explanation: [$(1+2i)/(2-i)=((1+2i)(2+i))/((2-i)(2+i))=(5i)/5=i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图所示的程序框图，输出的 $s$ 值为#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$8$], [$9$], [$27$], [$36$]),
  answers: ([B],),
  explanation: [初始 $k=0,s=0$。每次满足 $k<=2$ 时，先执行 $s=s+k^3$，再执行 $k=k+1$。
    三次循环后的 $(k,s)$ 依次为 $(1,0)$、$(2,1)$、$(3,9)$，随后退出循环，输出 $s=9$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [下列函数中，在区间 $(-1,1)$ 上为减函数的是#choice-placeholder()。],
  choices: ([$y=1/(1-x)$], [$y=cos x$], [$y=ln(x+1)$], [$y=2^(-x)$]),
  answers: ([D],),
  explanation: [函数 $y=2^(-x)=(1/2)^x$ 在 $RR$ 上严格递减，故选 D。
    选项 A、C 中的函数在 $(-1,1)$ 上递增；$y=cos x$ 在此区间内先增后减。],
)
#question(
  "single-choice",
  score: 5,
  stem: [圆 $(x+1)^2+y^2=2$ 的圆心到直线 $y=x+3$ 的距离为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$sqrt(2)$], [$2sqrt(2)$]),
  answers: ([C],),
  explanation: [圆心为 $(-1,0)$，直线方程为 $x-y+3=0$，故距离为 $abs(-1-0+3)/sqrt(1^2+(-1)^2)=sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [从甲、乙等 5 名学生中随机选出 2 人，则甲被选中的概率为#choice-placeholder()。],
  choices: ([$1/5$], [$2/5$], [$8/25$], [$9/25$]),
  answers: ([B],),
  explanation: [共有 $C_5^2=10$ 种等可能的选法。甲被选中时，另一人可从其余 4 人中任选，故概率为 $4/10=2/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $A(2,5),B(4,1)$。若点 $P(x,y)$ 在线段 $A B$ 上，则 $2x-y$ 的最大值为#choice-placeholder()。],
  choices: ([$-1$], [$3$], [$7$], [$8$]),
  answers: ([C],),
  explanation: [线段 $A B$ 上的点满足 $y=-2x+9$，$2<=x<=4$。于是 $2x-y=4x-9<=7$，当 $P=B$ 时等号成立。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某学校运动会的立定跳远和 30 秒跳绳两个单项比赛分成预赛和决赛两个阶段，下表为 10 名学生的预赛成绩，其中有三个数据模糊。
    #table(
      columns: 6,
      align: center,
      [学生序号], [1], [2], [3], [4], [5],
      [立定跳远（单位：米）], [1.96], [1.92], [1.82], [1.80], [1.78],
      [30 秒跳绳（单位：次）], [63], [$a$], [75], [60], [63],
      [学生序号], [6], [7], [8], [9], [10],
      [立定跳远（单位：米）], [1.76], [1.74], [1.72], [1.68], [1.60],
      [30 秒跳绳（单位：次）], [72], [70], [$a-1$], [$b$], [65],
    )
    在这 10 名学生中，进入立定跳远决赛的有 8 人，同时进入立定跳远决赛和 30 秒跳绳决赛的有 6 人，则#choice-placeholder()。],
  choices: (
    [2 号学生进入 30 秒跳绳决赛],
    [5 号学生进入 30 秒跳绳决赛],
    [8 号学生进入 30 秒跳绳决赛],
    [9 号学生进入 30 秒跳绳决赛],
  ),
  answers: ([B],),
  explanation: [按立定跳远成绩，进入决赛的是 1 至 8 号。若 5 号的跳绳成绩 63 次未达到决赛要求，则同为 63 次的 1 号、只有 60 次的 4 号也不能进入，前 8 人中至多 5 人同时进入两项决赛，与题意矛盾。因此 5 号必进入跳绳决赛。
    例如取 $a=59,b=58$，跳绳决赛要求不低于 60 次，则前 8 人中恰有 6 人进入跳绳决赛，而 2、8、9 号均未进入，故其余选项不一定成立。],
)
#section[填空题：共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)=(1,sqrt(3))$，$bold(b)=(sqrt(3),1)$，则 $bold(a)$ 与 $bold(b)$ 夹角的大小为#fill-placeholder()。],
  answers: ([$pi/6$],),
  explanation: [设夹角为 $theta in [0,pi]$。由 $abs(bold(a))=abs(bold(b))=2$，$bold(a) dot bold(b)=2sqrt(3)$，得 $cos theta=(2sqrt(3))/(2 times 2)=sqrt(3)/2$，故 $theta=pi/6$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [函数 $f(x)=x/(x-1)$（$x>=2$）的最大值为#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [因 $x>=2$，有 $f(x)=1+1/(x-1)<=2$，当 $x=2$ 时等号成立，故最大值为 $2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某四棱柱的三视图如图所示，则该四棱柱的体积为#fill-placeholder()。
    #figure(three-views())],
  answers: ([$3/2$],),
  explanation: [该四棱柱的底面是上、下底长分别为 $1,2$，高为 $1$ 的梯形，棱柱的高为 $1$。故体积 $V=((1+2) times 1)/2 times 1=3/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的一条渐近线为 $2x+y=0$，一个焦点为 $(sqrt(5),0)$，则 $a=$#fill-placeholder()；$b=$#fill-placeholder()。],
  answers: ([$1$], [$2$]),
  explanation: [由渐近线斜率得 $b/a=2$。又 $a^2+b^2=5$，故 $5a^2=5$。结合 $a,b>0$，得 $a=1,b=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $triangle A B C$ 中，$angle A=(2pi)/3$，$a=sqrt(3)c$，则 $b/c=$#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [由正弦定理，$sin C=(c sin A)/a=1/2$。因 $0<C<pi-A=pi/3$，得 $C=pi/6$，进而 $B=pi/6$。于是 $b=c$，即 $b/c=1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某网店统计了连续三天售出商品的种类情况：第一天售出 19 种商品，第二天售出 13 种商品，第三天售出 18 种商品；前两天都售出的商品有 3 种，后两天都售出的商品有 4 种，则该网店

    ① 第一天售出但第二天未售出的商品有#fill-placeholder()种；

    ② 这三天售出的商品最少有#fill-placeholder()种。],
  answers: ([$16$], [$29$]),
  explanation: [① 第一天售出而第二天未售出的商品有 $19-3=16$ 种。

    ② 前两天共售出 $19+13-3=29$ 种，故三天合计至少有 29 种。
    让第三天的 18 种商品由第二天售出的任意 4 种，以及第一天售出而第二天未售出的 16 种中的任意 14 种组成，即可达到 29 种。因此最少为 29 种。],
)
#section[解答题：共 6 小题，共 80 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [已知 ${a_n}$ 是等差数列，${b_n}$ 是等比数列，且 $b_2=3,b_3=9,a_1=b_1,a_14=b_4$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式；],
      answers: ([$a_n=2n-1$],),
      explanation: [设 ${b_n}$ 的公比为 $q$，则 $q=b_3/b_2=3$，$b_1=1,b_4=27$。于是 $a_1=1,a_14=27$，公差 $d=(27-1)/(14-1)=2$，故 $a_n=1+2(n-1)=2n-1$。],
    ),
    subquestion(
      stem: [设 $c_n=a_n+b_n$，求数列 ${c_n}$ 的前 $n$ 项和。],
      answers: ([$n^2+(3^n-1)/2$],),
      explanation: [由 $b_n=3^(n-1)$，分组求和得
        $ sum_(k=1)^n c_k=(n(1+2n-1))/2+(1-3^n)/(1-3)=n^2+(3^n-1)/2. $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知函数 $f(x)=2sin omega x cos omega x+cos 2omega x$（$omega>0$）的最小正周期为 $pi$。],
  parts: (
    subquestion(
      stem: [求 $omega$ 的值；],
      answers: ([$omega=1$],),
      explanation: [由二倍角公式及辅助角公式，
        $ f(x)=sin 2omega x+cos 2omega x=sqrt(2)sin(2omega x+pi/4). $
        最小正周期为 $T=(2pi)/(2omega)=pi/omega$。由 $T=pi$，得 $omega=1$。],
    ),
    subquestion(
      stem: [求 $f(x)$ 的单调递增区间。],
      answers: ([$[k pi-(3pi)/8,k pi+pi/8]$（$k in ZZ$）。],),
      explanation: [由第 (1) 问，$f(x)=sqrt(2)sin(2x+pi/4)$。令
        $ 2k pi-pi/2<=2x+pi/4<=2k pi+pi/2 quad (k in ZZ), $
        解得 $k pi-(3pi)/8<=x<=k pi+pi/8$。故递增区间为 $[k pi-(3pi)/8,k pi+pi/8]$（$k in ZZ$）。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [某市居民用水拟实行阶梯水价，每人每月用水量中不超过 $w$ 立方米的部分按 4 元/立方米收费，超出 $w$ 立方米的部分按 10 元/立方米收费。从该市随机调查了 10000 位居民，获得了他们某月的用水量数据，整理得到如图频率分布直方图。
    #figure(water-chart())],
  parts: (
    subquestion(
      stem: [如果 $w$ 为整数，那么根据此次调查，为使 80% 以上居民在该月的用水价格为 4 元/立方米，$w$ 至少定为多少？],
      answers: ([$3$],),
      explanation: [组距为 $0.5$，各组频率依次为 $0.10,0.15,0.20,0.25,0.15,0.05,0.05,0.05$。
        用水量不超过 2 立方米的比例为 $0.10+0.15+0.20=45%$，不超过 3 立方米的比例为 $45%+25%+15%=85%$。
        因 $w$ 为整数，至少应定为 3。],
    ),
    subquestion(
      stem: [假设同组中的每个数据用该组区间的右端点值代替，当 $w=3$ 时，估计该市居民该月的人均水费。],
      answers: ([10.5 元。],),
      explanation: [当 $w=3$ 时，用水量为 $x$ 立方米的水费为
        $ g(x)=cases(4x & quad 0<=x<=3, 12+10(x-3) & quad x>3). $
        取各组右端点 $1,1.5,2,2.5,3,3.5,4,4.5$，对应水费为 $4,6,8,10,12,17,22,27$ 元。因此人均水费估计为
        $ 4 times 0.10+6 times 0.15+8 times 0.20+10 times 0.25 $
        $ quad +12 times 0.15+(17+22+27) times 0.05=10.5 "（元）". $],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在四棱锥 $P-A B C D$ 中，$P C perp$ 平面 $A B C D$，$A B parallel D C$，$D C perp A C$。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [求证：$D C perp$ 平面 $P A C$；],
      answers: ([证明见解析。],),
      explanation: [因 $P C perp$ 平面 $A B C D$，且 $D C subset$ 平面 $A B C D$，得 $D C perp P C$。又 $D C perp A C$，$P C inter A C={C}$，两直线均在平面 $P A C$ 内，故 $D C perp$ 平面 $P A C$。],
    ),
    subquestion(
      stem: [求证：平面 $P A B perp$ 平面 $P A C$；],
      answers: ([证明见解析。],),
      explanation: [由 $A B parallel D C$ 及第 (1) 问，得 $A B perp$ 平面 $P A C$。又 $A B subset$ 平面 $P A B$，故平面 $P A B perp$ 平面 $P A C$。],
    ),
    subquestion(
      stem: [设点 $E$ 为 $A B$ 的中点。在棱 $P B$ 上是否存在点 $F$，使得 $P A parallel$ 平面 $C E F$？说明理由。],
      answers: ([存在，取 $F$ 为 $P B$ 的中点。],),
      explanation: [取 $P B$ 的中点 $F$，连接 $E F,C E,C F$。
        #figure(pyramid(auxiliary: true))
        在 $triangle P A B$ 中，$E,F$ 分别为 $A B,P B$ 的中点，故 $E F parallel P A$。
        因 $C$ 不在平面 $P A B$ 内，平面 $C E F$ 与平面 $P A B$ 的交线为 $E F$；$P A$ 与 $E F$ 是两条不同的平行直线，故 $P A$ 不在平面 $C E F$ 内。
        又 $E F subset$ 平面 $C E F$，所以 $P A parallel$ 平面 $C E F$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1$ 过点 $A(2,0),B(0,1)$ 两点。],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 的方程及离心率；],
      answers: ([$x^2/4+y^2=1$，$e=sqrt(3)/2$。],),
      explanation: [代入两点得 $a^2=4,b^2=1$，故椭圆方程为 $x^2/4+y^2=1$，离心率为 $e=sqrt(4-1)/2=sqrt(3)/2$。],
    ),
    subquestion(
      stem: [设 $P$ 为第三象限内一点且在椭圆 $C$ 上，直线 $P A$ 与 $y$ 轴交于点 $M$，直线 $P B$ 与 $x$ 轴交于点 $N$，求证：四边形 $A B N M$ 的面积为定值。],
      answers: ([面积为定值 $2$。],),
      explanation: [设 $P(u,v)$，则 $u<0,v<0$，且 $u^2+4v^2=4$。两条直线的方程为
        $ P A: y=v/(u-2)(x-2), quad P B: y=(v-1)/u x+1. $
        因此 $M=(0,(2v)/(2-u))$，$N=(u/(1-v),0)$。由 $u,v<0$，$M$ 在 $y$ 轴负半轴上，$N$ 在 $x$ 轴负半轴上。
        四边形的两条对角线 $A N,B M$ 互相垂直，且交于其内部的原点，故
        $ S=1/2 abs(A N)abs(B M)=1/2 (2-u/(1-v))(1-(2v)/(2-u)) $
        $ quad =(u+2v-2)^2/(2(1-v)(2-u)). $
        利用 $u^2+4v^2=4$，有
        $ (u+2v-2)^2=8+4u v-4u-8v=4(1-v)(2-u). $
        所以 $S=2$，为定值。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设函数 $f(x)=x^3+a x^2+b x+c$。],
  parts: (
    subquestion(
      stem: [求曲线 $y=f(x)$ 在点 $(0,f(0))$ 处的切线方程；],
      answers: ([$y=b x+c$],),
      explanation: [由 $f'(x)=3x^2+2a x+b$，得 $f'(0)=b$，且 $f(0)=c$，故切线方程为 $y=b x+c$。],
    ),
    subquestion(
      stem: [设 $a=b=4$，若函数 $f(x)$ 有三个不同零点，求 $c$ 的取值范围；],
      answers: ([$(0,32/27)$],),
      explanation: [此时 $f'(x)=3x^2+8x+4=(3x+2)(x+2)$。因此 $f$ 在 $(-infinity,-2)$、$(-2/3,+infinity)$ 上递增，在 $(-2,-2/3)$ 上递减，极大值为 $f(-2)=c$，极小值为 $f(-2/3)=c-32/27$。
        又 $x$ 趋于正、负无穷时，$f(x)$ 分别趋于正、负无穷。故有三个不同零点当且仅当极大值为正且极小值为负，即
        $ c>0, quad c-32/27<0. $
        解得 $0<c<32/27$；端点情形有重根，不满足三个不同零点。],
    ),
    subquestion(
      stem: [求证：$a^2-3b>0$ 是 $f(x)$ 有三个不同零点的必要而不充分条件。],
      answers: ([证明见解析。],),
      explanation: [#step[必要性][若 $a^2-3b<=0$，则
          $ f'(x)=3(x+a/3)^2+(3b-a^2)/3>=0. $
          当 $a^2-3b<0$ 时导数处处为正；当 $a^2-3b=0$ 时，导数仅在 $x=-a/3$ 处为零，其余各点为正。两种情形下 $f$ 均在 $RR$ 上严格递增，至多有一个零点。因此，若有三个不同零点，必有 $a^2-3b>0$。]
        #step[不充分性][取 $a=b=4,c=0$，则 $a^2-3b=4>0$，但 $f(x)=x(x+2)^2$ 只有 $0,-2$ 两个不同零点。因此该条件不充分。]
        综上，所给条件是必要而不充分条件。],
    ),
  ),
)
