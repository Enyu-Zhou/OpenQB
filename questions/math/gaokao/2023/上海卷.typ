#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2023,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2023/2023上海.pdf",
  regions: ("上海",),
)

#let height-weight-scatter() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let points = (
      (165, 50),
      (166, 54),
      (166, 52),
      (167, 54),
      (168, 52),
      (169, 56),
      (170, 56),
      (170, 62),
      (170, 58),
      (171, 62),
      (171, 60),
      (171, 58),
      (172, 62),
      (172, 60),
      (173, 58),
      (173, 60),
      (174, 62),
      (174, 60),
      (175, 58),
      (175, 60),
      (175, 78),
      (176, 62),
      (177, 64),
      (178, 66),
      (179, 66),
      (179, 68),
      (180, 68),
      (181, 68),
      (182, 70),
      (182, 72),
      (182, 84),
      (183, 72),
      (183, 74),
      (184, 76),
      (185, 78),
      (186, 78),
      (186, 80),
      (187, 82),
      (188, 84),
      (189, 86),
      (190, 88),
    )
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.15,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      x: (label: (anchor: "west", offset: 0.2)),
      y: (label: (anchor: "south-west", offset: 0.15)),
    ))
    plot.plot(
      size: (7.4, 5.3),
      axis-style: "school-book",
      x-min: 160,
      x-max: 195,
      y-min: 0,
      y-max: 100,
      x-tick-step: 5,
      y-tick-step: 20,
      x-label: move(dx: 4pt, dy: -8pt)[身高],
      y-label: [体重],
      {
        plot.annotate(resize: false, {
          for point in points {
            circle(point, radius: (0.2, 0.8), fill: black, stroke: none)
          }
        })
      },
    )
  })
}

#let prism-diagram() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (4, 3, 0)
  let d = (0, 3, 0)
  let a1 = (0, 0, 4)
  let b1 = (2, 0, 4)
  let c1 = (4, 3, 4)
  let d1 = (0, 3, 4)
  oblique-project((1, 0), (0.25, 0.4), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a1, b)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(a1, d, b, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "north-west"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
    ) { content(point, label, anchor: anchor, padding: 0.1) }
  })
})

#section[填空题：本大题共 12 题，满分 54 分，第 1—6 题每题 4 分，第 7—12 题每题 5 分。]
#question(
  "fill-in",
  stem: [设 $x in RR$，不等式 $abs(x-2)<1$ 的解集为#fill-placeholder()。],
  answers: ([$(1,3)$],),
  explanation: [$abs(x-2)<1$ 等价于 $-1<x-2<1$，即 $1<x<3$。],
)
#question(
  "fill-in",
  stem: [若向量 $bold(a)=(-2,3)$，$bold(b)=(1,2)$，则 $bold(a) dot bold(b)=$#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [$bold(a) dot bold(b)=(-2) times 1+3 times 2=4$。],
)
#question(
  "fill-in",
  stem: [若数列 ${a_n}$ 是首项为 $3$，公比为 $2$ 的等比数列，其前 $n$ 项和为 $S_n$，则 $S_6=$#fill-placeholder()。],
  answers: ([$189$],),
  explanation: [由等比数列求和公式，$S_6=(3(2^6-1))/(2-1)=189$。],
)
#question(
  "fill-in",
  stem: [若 $tan A=3$，则 $tan 2A=$#fill-placeholder()。],
  answers: ([$-3/4$],),
  explanation: [$tan 2A=(2 tan A)/(1-tan^2 A)=6/(1-9)=-3/4$。],
)
#question(
  "fill-in",
  stem: [函数 $y=cases(2^x & quad x>0, 1 & quad x<=0)$ 的值域为#fill-placeholder()。],
  answers: ([$[1,+infinity)$],),
  explanation: [$x>0$ 时，$2^x$ 的值域为 $(1,+infinity)$；$x<=0$ 时，$y=1$。合并得值域 $[1,+infinity)$。],
)
#question(
  "fill-in",
  stem: [若复数 $z=1+"i"$（$"i"$ 为虚数单位），则 $abs(1-"i"z)=$#fill-placeholder()。],
  answers: ([$sqrt(5)$],),
  explanation: [$1-"i"z=1-"i"(1+"i")=2-"i"$，所以 $abs(1-"i"z)=sqrt(2^2+(-1)^2)=sqrt(5)$。],
)
#question(
  "fill-in",
  stem: [设 $m in RR$，若圆 $x^2+y^2-4y-m=0$ 的面积为 $pi$，则 $m=$#fill-placeholder()。],
  answers: ([$-3$],),
  explanation: [配方得 $x^2+(y-2)^2=m+4$，由面积为 $pi$ 知半径平方为 $1$，故 $m+4=1$，即 $m=-3$。],
)
#question(
  "fill-in",
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 所对边的边长分别为 $a,b,c$。若 $a=4$，$b=5$，$c=6$，则 $sin A=$#fill-placeholder()。],
  answers: ([$sqrt(7)/4$],),
  explanation: [由余弦定理，$cos A=(b^2+c^2-a^2)/(2b c)=(25+36-16)/60=3/4$。因 $0<A<pi$，所以 $sin A=sqrt(1-cos^2 A)=sqrt(7)/4$。],
)
#question(
  "fill-in",
  stem: [国内生产总值（GDP）是衡量该地区经济状况的最佳指标。根据统计数据显示，某市在 2020 年间经济高质量增长，GDP 稳定增长，第一季度和第四季度的 GDP 分别为 231 亿元和 242 亿元，且四个季度的 GDP 逐季度增长。若这四个季度的 GDP 的中位数与平均数相等，则该市 2020 年的 GDP 为#fill-placeholder()亿元。],
  answers: ([$946$],),
  explanation: [设第二、三季度的 GDP 分别为 $b,c$，由中位数等于平均数，得 $(b+c)/2=(231+b+c+242)/4$，故 $b+c=473$。全年 GDP 为 $231+473+242=946$ 亿元。],
)
#question(
  "fill-in",
  stem: [已知对任意给定的实数 $x$，都有 $(1+2023x)^100+(2023-x)^100=a_0+a_1 x+a_2 x^2+dots.c+a_100 x^100$。当 $a_k<0$ 时，其中 $k in {0,1,2,3,dots.c,100}$，正整数 $k$ 的最大值为#fill-placeholder()。],
  answers: ([$49$],),
  explanation: [由二项式定理，$a_k=binom(100, k)(2023^k+(-1)^k 2023^(100-k))$。偶数 $k$ 对应的系数为正；当 $k$ 为奇数时，$a_k<0$ 等价于 $2023^k<2023^(100-k)$，即 $k<50$。所以 $k$ 的最大值为 $49$。],
)
#question(
  "fill-in",
  stem: [某公园欲建设一段斜坡，斜坡面是一平面，坡面与水平地面所成角为 $theta$，坡顶距水平地面的高度为 $4"m"$。游客从坡底沿着斜坡面向上直行，每走 $1"m"$ 消耗的体力为 $1.025-cos theta$。当 $theta=$#fill-placeholder()时，游客走斜坡所消耗的体力最小。],
  answers: ([$arccos(40/41)$],),
  explanation: [
    走过的坡长为 $4/(sin theta)$，故总体力为 $F(theta)=(4.1-4cos theta)/(sin theta)$，其中 $0<theta<pi/2$。
    $ F'(theta)=(4-4.1cos theta)/(sin^2 theta). $
    令 $F'(theta)=0$，得 $cos theta=40/41$。在此角之前 $F'<0$，之后 $F'>0$，故 $theta=arccos(40/41)$ 时总体力最小。
  ],
)
#question(
  "fill-in",
  stem: [空间中有三个定点 $A,B,C$，且 $A B=B C=C A=1$。若在空间中任取 $2$ 个不同的点，使得它们与 $A,B,C$ 恰好成为一个正四棱锥的五个顶点，则不同的取法共有#fill-placeholder()种。],
  answers: ([$9$],),
  explanation: [
    正方形的任意三个顶点不构成等边三角形，所以 $A,B,C$ 中恰有一个是锥顶，有 $3$ 种选择。不妨固定 $A$ 为锥顶，记 $H$ 为 $B C$ 的中点，$O$ 为底面正方形的中心。
    #step[$B,C$ 为底面相邻顶点][
      底面边长为 $1$，所以 $O H=1/2$，$O B=1/sqrt(2)$。由 $A B=1$，得锥高 $A O=1/sqrt(2)$。
      点 $O$ 位于过 $H$ 且垂直于 $B C$ 的平面上。在这个平面内，$A H=sqrt(3)/2$，而 $O$ 是以 $H$ 为圆心、$1/2$ 为半径的圆与以 $A$ 为圆心、$1/sqrt(2)$ 为半径的圆的交点。
      两圆相交于两点；每个 $O$ 唯一确定底面正方形，故有 $2$ 种取法。
    ]
    #step[$B,C$ 为底面对角顶点][
      此时 $O=H$，底面是过 $H$ 且垂直于 $A H$ 的平面。该平面内以 $B C$ 为对角线的正方形唯一，故有 $1$ 种取法。
    ]
    合计 $3 times (2+1)=9$ 种。
  ],
)

#section[选择题：本大题共 4 题，满分 18 分，第 13—14 题每题 4 分，第 15—16 题每题 5 分。每题只有一个正确选项。]
#question(
  "single-choice",
  stem: [已知集合 $P={1,2}$，$Q={2,3}$，若 $M={x | x in P "且" x in.not Q}$，则 $M=$#choice-placeholder()。],
  choices: ([${1}$], [${2}$], [${3}$], [${1,2,3}$]),
  answers: ([A],),
  explanation: [$P$ 中只有元素 $1$ 不属于 $Q$，故 $M={1}$。],
)
#question(
  "single-choice",
  stem: [为了解某校高中男生身高与体重的关系，随机选取男生的身高与体重数据，绘制散点图如图所示。下列说法正确的是#choice-placeholder()。
    #figure(height-weight-scatter())
  ],
  choices: (
    [身高越高，体重越重],
    [身高越高，体重越轻],
    [身高与体重之间呈正相关],
    [身高与体重之间呈负相关],
  ),
  answers: ([C],),
  explanation: [散点整体由左下向右上分布，反映身高与体重呈正相关。但这是一种统计相关关系，并不意味着任意两人之间都满足“身高越高，体重越重”。],
)
#question(
  "single-choice",
  stem: [已知 $a>0$，函数 $y=sin x$ 在区间 $[a,2a]$ 上的最小值为 $s$，在区间 $[2a,3a]$ 上的最小值为 $t$。当 $a$ 变化时，下列一定不成立的是#choice-placeholder()。],
  choices: ([$s>0,t>0$], [$s>0,t<0$], [$s<0,t<0$], [$s<0,t>0$]),
  answers: ([D],),
  explanation: [
    #step[排除可成立的情形][
      取 $a=pi/6$，两区间都落在 $(0,pi)$ 内，故 $s>0,t>0$。
      取 $a=(2pi)/5$，则 $s>0$，而 $sin 3a=sin((6pi)/5)<0$，故 $t<0$。
      取 $a=2pi$，两区间都含有正弦值为 $-1$ 的点，故 $s=t=-1$。
    ]
    #step[证明 D 不成立][
      若 $t>0$，则 $[2a,3a]$ 必须包含在某个正弦函数的正值区间 $(2k pi,(2k+1)pi)$ 中，且 $k>=0$。
      于是 $a>k pi$，$a<((2k+1)pi)/3$。若 $k>=1$，这两个不等式矛盾；故 $k=0$，得到 $0<a<pi/3$。
      此时 $[a,2a] subset (0,pi)$，必有 $s>0$，不可能 $s<0$。
    ]
  ],
)
#question(
  "single-choice",
  stem: [对于曲线 $C$，若存在点 $M$，使得对任意的点 $P in C$，都存在 $Q in C$，且 $abs(P M) dot abs(Q M)=1$，则称曲线 $C$ 为“自相关曲线”。有以下结论：

    ① 任何椭圆都是“自相关曲线”；

    ② 存在双曲线是“自相关曲线”。

    关于上述两个结论，说法正确的是#choice-placeholder()。
  ],
  choices: (
    [①成立，②成立],
    [①成立，②不成立],
    [①不成立，②成立],
    [①不成立，②不成立],
  ),
  answers: ([B],),
  explanation: [
    #step[证明①成立][
      不妨设椭圆为 $x^2/a^2+y^2/b^2=1$，其中 $a>=b>0$。取 $M(d,0)$，$d=sqrt(a^2+1)>a$。
      对椭圆上的点 $P(x,y)$，有
      $ abs(P M)^2=(1-b^2/a^2)x^2-2d x+d^2+b^2. $
      右端关于 $x$ 在 $[-a,a]$ 上严格递减，故点到 $M$ 的距离能取遍 $[d-a,d+a]$。
      因 $(d-a)(d+a)=1$，任意距离 $r in [d-a,d+a]$ 的倒数也在此区间内，因此总能找到 $Q$ 使 $abs(Q M)=1/abs(P M)$。
    ]
    #step[证明②不成立][
      若 $M$ 在双曲线上，取 $P=M$ 即与乘积为 $1$ 矛盾。
      若 $M$ 不在双曲线上，因双曲线方程的两边在 $M$ 处不相等，由连续性可知，存在以 $M$ 为圆心、半径 $delta>0$ 的小圆，其内部不含双曲线上的点。
      双曲线是无界曲线，可取 $P$ 使 $abs(P M)>1/delta$。此时要求的 $Q$ 须满足 $abs(Q M)=1/abs(P M)<delta$，仍矛盾。
      因而不存在符合条件的双曲线。
    ]
  ],
)

#section[解答题：本大题共 5 题，满分 78 分。解答须写出必要的步骤。]
#question(
  "solution",
  stem: [在四棱柱 $A B C D-A_1 B_1 C_1 D_1$ 中，$A B parallel D C$，$A B perp A D$，$A B=2$，$A D=3$，$D C=4$。
    #figure(prism-diagram())
  ],
  parts: (
    subquestion(
      stem: [求证：$A_1 B parallel$ 平面 $D C C_1 D_1$；],
      answers: ([证明见解析。],),
      explanation: [由棱柱性质，$A A_1 parallel D D_1$，又 $A B parallel D C$，且两组直线分别相交，故平面 $A B B_1 A_1 parallel$ 平面 $D C C_1 D_1$。因为 $A_1 B subset$ 平面 $A B B_1 A_1$，所以 $A_1 B parallel$ 平面 $D C C_1 D_1$。],
    ),
    subquestion(
      stem: [若直四棱柱 $A B C D-A_1 B_1 C_1 D_1$ 的体积为 $36$，求二面角 $A_1-B D-A$ 的大小。],
      answers: ([$arctan((2sqrt(13))/3)$],),
      explanation: [
        #step[求棱柱的高][
          底面是直角梯形，面积为 $1/2(2+4) times 3=9$，故 $A A_1=36/9=4$。
        ]
        #step[确定二面角的平面角][
          过 $A$ 作 $A E perp B D$，垂足为 $E$，连接 $A_1 E$。
          因 $A A_1 perp$ 平面 $A B C D$，故 $B D perp A A_1$。结合 $B D perp A E$，得 $B D perp$ 平面 $A A_1 E$，从而 $B D perp A_1 E$。
          因此 $angle A_1 E A$ 就是所求二面角的平面角。
          在直角三角形 $A B D$ 中，$B D=sqrt(13)$，$A E=(A B dot A D)/(B D)=6/sqrt(13)$。
          在直角三角形 $A A_1 E$ 中，$tan angle A_1 E A=(A A_1)/(A E)=(2sqrt(13))/3$。
          故二面角的大小为 $arctan((2sqrt(13))/3)$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [设 $a,c in RR$，$f(x)=(x^2+(3a+1)x+c)/(x+a)$。],
  parts: (
    subquestion(
      stem: [当 $a=0$ 时，是否存在实数 $c$，使得 $y=f(x)$ 为奇函数？请说明理由；],
      answers: ([不存在。],),
      explanation: [当 $a=0$ 时，定义域为 $RR without {0}$，$f(x)=x+1+c/x$。对任何 $x != 0$，均有 $f(x)+f(-x)=2 != 0$，所以不存在这样的 $c$。],
    ),
    subquestion(
      stem: [若函数 $y=f(x)$ 的图象过点 $(1,3)$，且其与 $x$ 轴的负半轴有两个不同的交点，求 $c$ 的值及 $a$ 的取值范围。],
      answers: ([$c=1$，$a in (1/3,1/2) union (1/2,+infinity)$。],),
      explanation: [
        由 $f(1)=3$，且 $a != -1$，得 $(3a+c+2)/(a+1)=3$，解得 $c=1$。
        图象与 $x$ 轴负半轴有两个不同交点，要求 $x^2+(3a+1)x+1=0$ 有两个不同负根，且它们都不等于 $-a$。
        由判别式及韦达定理，得 $(3a+1)^2-4>0$，$3a+1>0$，即 $a>1/3$。
        还须 $(-a)^2+(3a+1)(-a)+1 != 0$，即 $(2a-1)(a+1) != 0$。
        所以 $c=1$，$a>1/3$ 且 $a != 1/2$。
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [2023 年 6 月 7 日，21 世纪汽车博览会在上海举行。已知某汽车模型公司共有 $25$ 个汽车模型，其外观和内饰的颜色分布如下表所示：
    #table(
      columns: 3,
      align: center + horizon,
      [], [红色外观], [蓝色外观],
      [棕色内饰], [$12$], [$8$],
      [米色内饰], [$2$], [$3$],
    )
  ],
  parts: (
    subquestion(
      stem: [小明从这些汽车模型中随机取出一个，记事件 $A$ 为取到红色外观的汽车模型，事件 $B$ 为取到棕色内饰的汽车模型，求 $P(B)$ 和 $P(B|A)$，并据此判断事件 $A$ 和 $B$ 是否独立；],
      answers: ([$P(B)=4/5$，$P(B|A)=6/7$，$A$ 与 $B$ 不独立。],),
      explanation: [棕色内饰共有 $20$ 个模型，故 $P(B)=20/25=4/5$。红色外观共有 $14$ 个，其中棕色内饰有 $12$ 个，故 $P(B|A)=12/14=6/7$。因为 $P(B|A) != P(B)$，所以 $A$ 与 $B$ 不独立。],
    ),
    subquestion(
      stem: [该公司举行抽奖活动，规定在一次抽奖中，每人可以从这些汽车模型中随机取出两个汽车模型，并给出以下假设：

        假设 1：取出的两个汽车模型会出现三种结果，即外观和内饰均为同色、外观和内饰均不为同色及仅外观或仅内饰为同色；

        假设 2：按出现结果的可能性大小，概率越小奖项越高；

        假设 3：抽奖活动的奖金额为一等奖 600 元、二等奖 300 元、三等奖 150 元。

        请你分析各奖项对应的结果，设 $X$ 为奖金额，写出 $X$ 的分布并求其数学期望。
      ],
      answers: (
        [一等奖对应外观和内饰均不同色，二等奖对应外观和内饰均同色，三等奖对应仅外观或仅内饰同色。分布列见解析，$E(X)=277$ 元。],
      ),
      explanation: [
        #step[计算三种结果的概率][
          从 $25$ 个不同模型中取出两个，共有 $binom(25, 2)=300$ 种等可能结果。
          外观和内饰均同色的取法有 $binom(12, 2)+binom(8, 2)+binom(2, 2)+binom(3, 2)=98$ 种，概率为 $49/150$。
          外观和内饰均不同色的取法有 $12 times 3+8 times 2=52$ 种，概率为 $13/75$。
          仅外观或仅内饰同色的概率为 $1-49/150-13/75=1/2$。
          因 $13/75<49/150<1/2$，三种结果按概率由小到大依次对应一等奖、二等奖、三等奖。
        ]
        #step[写出分布列并求期望][
          #table(
            columns: 4,
            align: center + horizon,
            [$X$], [$600$], [$300$], [$150$],
            [$P$], [$13/75$], [$49/150$], [$1/2$],
          )
          $ E(X)=600 times 13/75+300 times 49/150+150 times 1/2=277. $
          所以奖金额的数学期望为 $277$ 元。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知抛物线 $Gamma:y^2=4x$，$A$ 为第一象限内 $Gamma$ 上的一点，设点 $A$ 的纵坐标为 $a$。],
  parts: (
    subquestion(
      stem: [若点 $A$ 到 $Gamma$ 的准线的距离为 $3$，求 $a$ 的值；],
      answers: ([$2sqrt(2)$],),
      explanation: [抛物线的准线为 $x=-1$，点 $A(a^2/4,a)$ 到准线的距离为 $a^2/4+1=3$。又 $a>0$，故 $a=2sqrt(2)$。],
    ),
    subquestion(
      stem: [若 $a=4$，$B$ 为 $x$ 轴上的一点，且线段 $A B$ 的中点在 $Gamma$ 上，求点 $B$ 的坐标及原点 $O$ 到直线 $A B$ 的距离；],
      answers: ([$B(-2,0)$，距离为 $(4sqrt(13))/13$。],),
      explanation: [此时 $A(4,4)$。设 $B(b,0)$，则 $A B$ 中点为 $((4+b)/2,2)$。代入抛物线方程，得 $4=2(4+b)$，解得 $b=-2$。直线 $A B$ 的方程为 $2x-3y+4=0$，故原点到该直线的距离为 $4/sqrt(2^2+(-3)^2)=(4sqrt(13))/13$。],
    ),
    subquestion(
      stem: [直线 $l:x=-3$，$P$ 是第一象限内 $Gamma$ 上异于点 $A$ 的动点，直线 $A P$ 与 $l$ 交于点 $Q$，点 $H$ 为点 $P$ 在 $l$ 上的投影。若点 $A$ 满足：$abs(H Q)>4$ 对任意的点 $P$ 成立，求 $a$ 的取值范围。],
      answers: ([$(0,2]$],),
      explanation: [
        #step[将距离条件化为不等式][
          设 $P(t^2/4,t)$，其中 $t>0,t != a$。由两点式，直线 $A P$ 为 $y-a=4/(t+a)(x-a^2/4)$。
          令 $x=-3$，得 $Q(-3,(a t-12)/(a+t))$，又 $H(-3,t)$，所以
          $ abs(H Q)=abs(t-(a t-12)/(a+t))=(t^2+12)/(a+t). $
          因 $a+t>0$，条件等价于 $(t-2)^2+8-4a>0$ 对所有 $t>0,t != a$ 成立。
        ]
        #step[讨论参数与被排除的点][
          当 $0<a<2$ 时，$8-4a>0$，不等式恒成立。
          当 $a=2$ 时，条件变为 $(t-2)^2>0$；因 $t != a=2$，仍恒成立。
          当 $a>2$ 时，可以取 $t=2 != a$，此时左端为 $8-4a<0$，不满足条件。
          故 $a$ 的取值范围为 $(0,2]$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知 $f(x)=ln x$。曲线 $y=f(x)$ 在点 $(a_1,f(a_1))$ 处的切线交 $y$ 轴于点 $(0,a_2)$，且 $a_2>0$；曲线 $y=f(x)$ 在点 $(a_2,f(a_2))$ 处的切线交 $y$ 轴于点 $(0,a_3)$，以此类推，直至 $a_m<=0$ 时停止操作，得到数列 ${a_n}$，其中 $m,n$ 为正整数，$1<n<=m$。],
  parts: (
    subquestion(
      stem: [证明：当 $n>=2$ 时，$a_n=ln a_(n-1)-1$；],
      answers: ([证明见解析。],),
      explanation: [由 $f'(x)=1/x$，在 $(a_(n-1),ln a_(n-1))$ 处的切线方程为 $y-ln a_(n-1)=1/a_(n-1)(x-a_(n-1))$。令 $x=0$，得纵截距 $a_n=ln a_(n-1)-1$。],
    ),
    subquestion(
      stem: [当 $n>=2$ 时，试比较 $a_n$ 和 $a_(n-1)-2$ 的大小，请说明理由；],
      answers: ([$a_n<=a_(n-1)-2$，当且仅当 $a_(n-1)=1$ 时取等号。],),
      explanation: [令 $g(x)=ln x-x+1$（$x>0$），则 $g'(x)=1/x-1$。所以 $g$ 在 $(0,1)$ 上递增，在 $(1,+infinity)$ 上递减，故 $g(x)<=g(1)=0$，等号仅在 $x=1$ 时成立。于是 $a_n-(a_(n-1)-2)=ln a_(n-1)-a_(n-1)+1<=0$。],
    ),
    subquestion(
      stem: [是否存在不小于 $3$ 的正整数 $k$，使得 $a_1,a_2,a_3,dots.c,a_k$ 成等差数列？若存在，求出 $k$ 的所有取值；若不存在，请说明理由。],
      answers: ([存在，只有 $k=3$。],),
      explanation: [
        #step[排除 $k>=4$][
          由上一问，数列严格递减。若前 $k$ 项成等差数列，记公差为 $d$，则 $d<=-2$。
          当 $k>=4$ 时，$a_1,a_2,a_3$ 都为正。由递推式，
          $ d=a_3-a_2=ln(a_2/a_1), quad d=a_4-a_3=ln(a_3/a_2). $
          因此 $a_2^2=a_1 a_3$。而 $a_2=a_1+d$，$a_3=a_1+2d$，代入得 $d^2=0$，与 $d<=-2$ 矛盾。
        ]
        #step[证明 $k=3$ 可以实现][
          设 $a_2=t>0$，则 $a_1=e^(t+1)$，$a_3=ln t-1$。三项成等差数列等价于
          $ H(t)=e^(t+1)+ln t-1-2t=0. $
          函数 $H$ 在 $(0,+infinity)$ 上连续，且 $H(0.01) approx -2.88<0$，$H(1)=e^2-3>0$。
          由零点存在定理，存在 $t_0 in (0.01,1)$ 使 $H(t_0)=0$。取 $a_1=e^(t_0+1)$，则 $a_2=t_0>0$，$a_3=ln t_0-1<0$，操作恰在第三项停止，且这三项成等差数列。
          故所求 $k$ 的所有取值为 $3$。
        ]
      ],
    ),
  ),
)
