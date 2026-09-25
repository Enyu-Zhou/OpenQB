#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018全国2理(甘肃,青海,内蒙古,黑龙江,吉林,辽宁,海南.宁夏,新疆,陕西,重庆).pdf",
  regions: (
    "甘肃",
    "青海",
    "内蒙古",
    "黑龙江",
    "吉林",
    "辽宁",
    "海南",
    "宁夏",
    "新疆",
    "陕西",
    "重庆",
  ),
)

#let graph-choice(kind) = cetz.canvas(length: 9mm, {
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
    x: (label: (anchor: "west", offset: 0.12)),
    y: (label: (anchor: "south", offset: 0.12)),
  ))
  plot.plot(
    size: (4, 4.2),
    axis-style: "school-book",
    x-min: -4.6,
    x-max: 4.6,
    y-min: -6.5,
    y-max: 6.5,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (1,),
    y-ticks: (1,),
    x-label: $x$,
    y-label: $y$,
    {
      let f(x) = {
        let value = (calc.exp(x) - calc.exp(-x)) / (x * x)
        if kind == "A" { calc.abs(value) } else if kind == "D" {
          -value
        } else if kind == "C" { 2 / x } else { value }
      }
      for domain in ((-4.5, -0.33), (0.33, 4.5)) {
        plot.add(f, domain: domain, style: (
          stroke: (paint: black, thickness: figure-style.thickness),
        ))
      }
    },
  )
})
#let sum-flowchart() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.6, 8.2), (0.6, 8.9), radius: 0.15)
  content((0, 8.55), [开始])
  rect((-1.45, 6.9), (1.45, 7.65))
  content((0, 7.275), [$N=0,T=0$])
  rect((-0.7, 5.6), (0.7, 6.35))
  content((0, 5.975), [$i=1$])
  line((0, 5), (1.5, 4.5), (0, 4), (-1.5, 4.5), close: true)
  content((0, 4.5), [$i<100$])
  rect((-3.6, 2.75), (-1, 3.65))
  content((-2.3, 3.2), [$N=N+1/i$])
  rect((-3.75, 1.1), (-0.85, 2.2))
  content((-2.3, 1.65), [$T=T+1/(i+1)$])
  rect((-3.3, -0.3), (-1.3, 0.5))
  rect((1.1, 2.8), (3.5, 3.6))
  content((2.3, 3.2), [$S=N-T$])
  line((1.2, 1.25), (3.2, 1.25), (3.4, 2.05), (1.4, 2.05), close: true)
  content((2.3, 1.65), [输出 $S$])
  rect((1.7, -0.2), (2.9, 0.5), radius: 0.15)
  content((2.3, 0.15), [结束])
  for (a, b) in (
    ((0, 8.2), (0, 7.65)),
    ((0, 6.9), (0, 6.35)),
    ((0, 5.6), (0, 5)),
    ((-2.3, 2.75), (-2.3, 2.2)),
    ((-2.3, 1.1), (-2.3, 0.5)),
    ((2.3, 2.8), (2.3, 2.05)),
    ((2.3, 1.25), (2.3, 0.5)),
  ) {
    line(a, b, mark: (end: ">"))
  }
  line((-1.5, 4.5), (-2.3, 4.5), (-2.3, 3.65), mark: (end: ">"))
  line((1.5, 4.5), (2.3, 4.5), (2.3, 3.6), mark: (end: ">"))
  line((-3.3, 0.1), (-4.3, 0.1), (-4.3, 5.3), (0, 5.3), mark: (end: ">"))
  content((-2.3, 4.5), [是], anchor: "south", padding: 3pt)
  content((2.3, 4.5), [否], anchor: "south", padding: 3pt)
})
#let investment() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.15,
    shared-zero: [$0$],
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
    x: (
      label: (anchor: "west", offset: 0.2),
      tick: (label: (angle: -55deg, anchor: "north-west")),
    ),
    y: (label: (anchor: "south", offset: 0.2)),
  ))
  let values = (
    11,
    19,
    25,
    35,
    37,
    42,
    42,
    47,
    53,
    56,
    122,
    129,
    148,
    171,
    184,
    209,
    220,
  )
  plot.plot(
    size: (12, 6),
    axis-style: "school-book",
    x-min: 0,
    x-max: 17,
    y-min: 0,
    y-max: 240,
    x-label: [年份],
    y-label: [投资额/亿元],
    x-tick-step: none,
    y-tick-step: 20,
    x-ticks: range(1, 18).map(i => (i, text(size: 8pt, str(1999 + i)))),
    {
      plot.annotate(resize: false, {
        let points = values.enumerate().map(((i, y)) => (i + 1, y))
        line(..points)
        for (i, y) in values.enumerate() {
          circle((i + 1, y), radius: (0.055, 1.55), fill: black, stroke: none)
          content(
            (i + 1, y + if i == 9 { -10 } else { 10 }),
            text(size: 8pt, str(y)),
            anchor: if i == 9 { "north" } else { "south" },
            padding: 0pt,
          )
        }
      })
    },
  )
})
#let pyramid(auxiliary: false) = cetz.canvas(length: 14mm, {
  import cetz.draw: *
  let a = (-2, 0, 0)
  let c = (2, 0, 0)
  let b = (0, 2, 0)
  let o = (0, 0, 0)
  let p = (0, 0, 2 * calc.sqrt(3))
  let m = (2 / 3, 4 / 3, 0)
  let h = (-1, 0, calc.sqrt(3))
  let t = (5 / 4, 3 / 2, calc.sqrt(3) / 4)
  oblique-project((1, 0), (-0.35, -0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, a, b, c, p)
    line(p, b)
    line(p, m)
    line(a, c, stroke: (dash: figure-style.dash))
    line(p, o, stroke: (dash: figure-style.dash))
    line(a, m, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(c, h, t, c, stroke: (dash: figure-style.dash))
      content(h, $H$, anchor: "east", padding: 3pt)
      content(t, $T$, anchor: "south-west", padding: 4pt)
    }
    for (point, label, anchor) in (
      (p, $P$, "south"),
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (o, $O$, "south-east"),
      (m, $M$, "north"),
    ) {
      content(point, label, anchor: anchor, padding: 3pt)
    }
  })
})

#section[选择题：共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [$(1+2i)/(1-2i)=$#choice-placeholder()。],
  choices: ([$-4/5-3/5 i$], [$-4/5+3/5 i$], [$-3/5-4/5 i$], [$-3/5+4/5 i$]),
  answers: ([D],),
  explanation: [$(1+2i)/(1-2i)=(1+2i)^2/5=(-3+4i)/5=-3/5+4/5 i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={(x,y)|x^2+y^2<=3,x in ZZ,y in ZZ}$，则 $A$ 中元素的个数为#choice-placeholder()。],
  choices: ([$9$], [$8$], [$5$], [$4$]),
  answers: ([A],),
  explanation: [必有 $x,y in {-1,0,1}$，且这两个集合中的任意搭配都满足 $x^2+y^2<=2<3$，故共有 $3 times 3=9$ 个元素。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $f(x)=(e^x-e^(-x))/x^2$ 的图象大致为#choice-placeholder()。],
  choices: (
    [#figure(graph-choice("A"))],
    [#figure(graph-choice("B"))],
    [#figure(graph-choice("C"))],
    [#figure(graph-choice("D"))],
  ),
  answers: ([B],),
  explanation: [定义域为 $RR without {0}$，且 $f(-x)=-f(x)$，故图象关于原点对称。$x>0$ 时 $f(x)>0$，排除 A、D；当 $x->+infinity$ 时，$f(x)->+infinity$，排除趋近于 $x$ 轴的 C，故选 B。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知向量 $bold(a),bold(b)$ 满足 $|bold(a)|=1$，$bold(a) dot bold(b)=-1$，则 $bold(a) dot (2bold(a)-bold(b))=$#choice-placeholder()。],
  choices: ([$4$], [$3$], [$2$], [$0$]),
  answers: ([B],),
  explanation: [$bold(a) dot (2bold(a)-bold(b))=2|bold(a)|^2-bold(a) dot bold(b)=2+1=3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的离心率为 $sqrt(3)$，则其渐近线方程为#choice-placeholder()。],
  choices: (
    [$y=plus.minus sqrt(2)x$],
    [$y=plus.minus sqrt(3)x$],
    [$y=plus.minus sqrt(2)/2 x$],
    [$y=plus.minus sqrt(3)/2 x$],
  ),
  answers: ([A],),
  explanation: [$b^2/a^2=c^2/a^2-1=3-1=2$，故渐近线为 $y=plus.minus b/a x=plus.minus sqrt(2)x$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在 $triangle A B C$ 中，$cos(C/2)=sqrt(5)/5$，$B C=1$，$A C=5$，则 $A B=$#choice-placeholder()。],
  choices: ([$4sqrt(2)$], [$sqrt(30)$], [$sqrt(29)$], [$2sqrt(5)$]),
  answers: ([A],),
  explanation: [$cos C=2cos^2(C/2)-1=-3/5$。由余弦定理，$A B^2=1^2+5^2-2 times 1 times 5 times (-3/5)=32$，故 $A B=4sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [为计算 $S=1-1/2+1/3-1/4+dots+1/99-1/100$，设计了如图的程序框图，则在空白框中应填入#choice-placeholder()。
    #figure(sum-flowchart())],
  choices: ([$i=i+1$], [$i=i+2$], [$i=i+3$], [$i=i+4$]),
  answers: ([B],),
  explanation: [$N$ 累加奇数分母项，$T$ 累加紧随其后的偶数分母项，故 $i$ 应依次取 $1,3,dots,99$，每次增加 2。],
)
#question(
  "single-choice",
  score: 5,
  stem: [我国数学家陈景润在哥德巴赫猜想的研究中取得了世界领先的成果。哥德巴赫猜想是“每个大于 2 的偶数可以表示为两个素数的和”，如 $30=7+23$。在不超过 30 的素数中，随机选取两个不同的数，其和等于 30 的概率是#choice-placeholder()。],
  choices: ([$1/12$], [$1/14$], [$1/15$], [$1/18$]),
  answers: ([C],),
  explanation: [不超过 30 的素数为 $2,3,5,7,11,13,17,19,23,29$，共 10 个。任选两个有 $C_10^2=45$ 种，其中和为 30 的有 $(7,23)$、$(11,19)$、$(13,17)$ 三组，故概率为 $3/45=1/15$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在长方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$A B=B C=1$，$A A_1=sqrt(3)$，则异面直线 $A D_1$ 与 $D B_1$ 所成角的余弦值为#choice-placeholder()。],
  choices: ([$1/5$], [$sqrt(5)/6$], [$sqrt(5)/5$], [$sqrt(2)/2$]),
  answers: ([C],),
  explanation: [以 $D$ 为原点，$D A,D C,D D_1$ 的方向分别为坐标轴正方向，则 $arrow(A D_1)=(-1,0,sqrt(3))$、$arrow(D B_1)=(1,1,sqrt(3))$。所求余弦值为 $frac(|-1+3|, sqrt(1+3) sqrt(1+1+3))=sqrt(5)/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $f(x)=cos x-sin x$ 在 $[-a,a]$ 是减函数，则 $a$ 的最大值是#choice-placeholder()。],
  choices: ([$pi/4$], [$pi/2$], [$(3pi)/4$], [$pi$]),
  answers: ([A],),
  explanation: [$f(x)=sqrt(2)cos(x+pi/4)$，包含 0 的最大单调递减区间为 $[-pi/4,3pi/4]$。要使 $[-a,a]$ 包含在该区间中，须 $a<=pi/4$，最大值为 $pi/4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $f(x)$ 是定义域为 $(-infinity,+infinity)$ 的奇函数，满足 $f(1-x)=f(1+x)$。若 $f(1)=2$，则 $f(1)+f(2)+f(3)+dots+f(50)=$#choice-placeholder()。],
  choices: ([$-50$], [$0$], [$2$], [$50$]),
  answers: ([C],),
  explanation: [由对称性和奇性，$f(x+2)=f(-x)=-f(x)$，故 $f(x+4)=f(x)$。又 $f(0)=0$，每连续四个整数处的函数值之和为 0，∴ 所求和为 $f(49)+f(50)=f(1)+f(2)=2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $F_1,F_2$ 是椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的左、右焦点，$A$ 是 $C$ 的左顶点，点 $P$ 在过 $A$ 且斜率为 $sqrt(3)/6$ 的直线上，$triangle P F_1 F_2$ 为等腰三角形，$angle F_1 F_2 P=120 degree$，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$2/3$], [$1/2$], [$1/3$], [$1/4$]),
  answers: ([D],),
  explanation: [设半焦距为 $c$。等腰三角形的钝角必为顶角，故 $F_2 P=F_2 F_1=2c$。由 $angle F_1 F_2 P=120 degree$，得 $P=(2c,plus.minus sqrt(3)c)$。直线 $A P$ 的斜率为正，故取正号，且 $frac(sqrt(3)c, a+2c)=sqrt(3)/6$，得 $a=4c$，离心率为 $1/4$。],
)
#section[填空题：共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [曲线 $y=2ln(x+1)$ 在点 $(0,0)$ 处的切线方程为#fill-placeholder()。],
  answers: ([$y=2x$],),
  explanation: [$y'=2/(x+1)$，在 $x=0$ 处的斜率为 2，故切线为 $y=2x$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若变量 $x,y$ 满足约束条件 $cases(x+2y-5>=0, x-2y+3>=0, x-5<=0)$，则 $z=x+y$ 的最大值为#fill-placeholder()。],
  answers: ([$9$],),
  explanation: [$y<=(x+3)/2$、$x<=5$，故 $z<=3/2 x+3/2<=9$。点 $(5,4)$ 满足全部约束，故最大值为 9。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $sin alpha+cos beta=1$，$cos alpha+sin beta=0$，则 $sin(alpha+beta)=$#fill-placeholder()。],
  answers: ([$-1/2$],),
  explanation: [将两式平方相加，得 $2+2(sin alpha cos beta+cos alpha sin beta)=1$，∴ $sin(alpha+beta)=-1/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知圆锥的顶点为 $S$，母线 $S A,S B$ 所成角的余弦值为 $7/8$，$S A$ 与圆锥底面所成角为 $45 degree$，若 $triangle S A B$ 的面积为 $5sqrt(15)$，则该圆锥的侧面积为#fill-placeholder()。],
  answers: ([$40sqrt(2)pi$],),
  explanation: [设母线长为 $l$，则 $sin angle A S B=sqrt(15)/8$，由 $1/2 l^2 times sqrt(15)/8=5sqrt(15)$ 得 $l^2=80$。底面半径为 $r=l cos 45 degree=l/sqrt(2)$，故侧面积 $pi r l=40sqrt(2)pi$。],
)
#section[解答题：共 70 分。第 17～21 题为必考题，每题 12 分。]
#question(
  "solution",
  score: 12,
  stem: [记 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和，已知 $a_1=-7$，$S_3=-15$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=2n-9$],),
      explanation: [设公差为 $d$，则 $-21+3d=-15$，解得 $d=2$，故 $a_n=-7+2(n-1)=2n-9$。],
    ),
    subquestion(
      stem: [求 $S_n$，并求 $S_n$ 的最小值。],
      answers: ([$S_n=n^2-8n$，最小值为 $-16$。],),
      explanation: [$S_n=n(-7+2n-9)/2=n^2-8n=(n-4)^2-16$，当 $n=4$ 时取得最小值 $-16$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图是某地区 2000 年至 2016 年环境基础设施投资额 $y$（单位：亿元）的折线图。为了预测该地区 2018 年的环境基础设施投资额，建立了 $y$ 与时间变量 $t$ 的两个线性回归模型。根据 2000 年至 2016 年的数据（时间变量 $t$ 的值依次为 $1,2,dots,17$）建立模型①：$hat(y)=-30.4+13.5t$；根据 2010 年至 2016 年的数据（时间变量 $t$ 的值依次为 $1,2,dots,7$）建立模型②：$hat(y)=99+17.5t$。
    #figure(investment())],
  parts: (
    subquestion(
      stem: [分别利用这两个模型，求该地区 2018 年的环境基础设施投资额的预测值。],
      answers: ([模型①为 226.1 亿元，模型②为 256.5 亿元。],),
      explanation: [模型①中 2018 年对应 $t=19$，故预测值为 $-30.4+13.5 times 19=226.1$；模型②中对应 $t=9$，预测值为 $99+17.5 times 9=256.5$（亿元）。],
    ),
    subquestion(
      stem: [你认为用哪个模型得到的预测值更可靠？并说明理由。],
      answers: ([模型②更可靠。],),
      explanation: [折线图显示，2010 年投资额相较 2009 年有明显跃升，前后两阶段的变化趋势不同，整体线性模型难以准确刻画。2010～2016 年各点近似位于一条直线上，模型②更贴近近期的增长趋势，因而其预测更可靠。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设抛物线 $C:y^2=4x$ 的焦点为 $F$，过 $F$ 且斜率为 $k$（$k>0$）的直线 $l$ 与 $C$ 交于 $A,B$ 两点，$|A B|=8$。],
  parts: (
    subquestion(
      stem: [求 $l$ 的方程。],
      answers: ([$y=x-1$],),
      explanation: [$F(1,0)$，设 $l:y=k(x-1)$。联立得 $k^2 x^2-(2k^2+4)x+k^2=0$，故两交点横坐标之和为 $2+4/k^2$。由抛物线定义，$|A B|=|A F|+|B F|=x_A+x_B+2=4+4/k^2=8$，结合 $k>0$ 得 $k=1$。],
    ),
    subquestion(
      stem: [求过点 $A,B$ 且与 $C$ 的准线相切的圆的方程。],
      answers: ([$(x-3)^2+(y-2)^2=16$ 或 $(x-11)^2+(y+6)^2=144$。],),
      explanation: [由（1）知弦中点为 $(3,2)$，圆心在弦的垂直平分线 $y=-x+5$ 上，可设圆心为 $(u,5-u)$。圆与准线 $x=-1$ 相切，半径为 $|u+1|$。弦长为 8，故
        $ (u+1)^2=(u-3)^2+(5-u-2)^2+4^2=2(u-3)^2+16. $
        化简得 $(u-3)(u-11)=0$。分别得到圆心 $(3,2)$、半径 4，以及圆心 $(11,-6)$、半径 12，圆方程如上。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在三棱锥 $P-A B C$ 中，$A B=B C=2sqrt(2)$，$P A=P B=P C=A C=4$，$O$ 为 $A C$ 的中点。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [证明：$P O perp$ 平面 $A B C$。],
      answers: ([证明见解析。],),
      explanation: [由 $P A=P C$、$B A=B C$ 及 $O$ 为 $A C$ 中点，知 $P O perp A C$、$B O perp A C$，且 $P O=2sqrt(3)$、$B O=2$。∵ $P O^2+B O^2=16=P B^2$，∴ $P O perp B O$。由 $A C inter B O={O}$，得 $P O perp$ 平面 $A B C$。],
    ),
    subquestion(
      stem: [若点 $M$ 在棱 $B C$ 上，且二面角 $M-P A-C$ 为 $30 degree$，求 $P C$ 与平面 $P A M$ 所成角的正弦值。],
      answers: ([$sqrt(3)/4$],),
      explanation: [取 $P A$ 的中点 $H$。∵ $triangle P A C$ 为边长 4 的等边三角形，∴ $C H perp P A$，$C H=2sqrt(3)$。
        作 $C T perp$ 平面 $P A M$，垂足为 $T$，则 $C T perp P A$，从而 $H T perp P A$。在垂直于 $P A$ 的截面内，两平面的夹角为 $30 degree$，故
        $ C T=C H sin 30 degree=sqrt(3). $
        所求线面角的正弦值为 $(C T)/(P C)=sqrt(3)/4$。
        #figure(pyramid(auxiliary: true))],
    ),
  ),
)
#question("solution", score: 12, stem: [已知函数 $f(x)=e^x-a x^2$。], parts: (
  subquestion(
    stem: [若 $a=1$，证明：当 $x>=0$ 时，$f(x)>=1$。],
    answers: ([证明见解析。],),
    explanation: [令 $g(x)=x-ln(1+x^2)$，则 $g'(x)=1-(2x)/(1+x^2)=(x-1)^2/(1+x^2)>=0$。故 $x>=0$ 时 $g(x)>=g(0)=0$，即 $e^x>=1+x^2$，从而 $f(x)>=1$。],
  ),
  subquestion(
    stem: [若 $f(x)$ 在 $(0,+infinity)$ 只有一个零点，求 $a$。],
    answers: ([$a=e^2/4$],),
    explanation: [对 $x>0$，$f(x)=0$ 等价于 $a=e^x/x^2$。令 $h(x)=e^x/x^2$，则 $h'(x)=e^x (x-2)/x^3$，故 $h$ 在 $(0,2)$ 上单调递减，在 $(2,+infinity)$ 上单调递增，最小值为 $h(2)=e^2/4$。又 $x->0^+$ 和 $x->+infinity$ 时，$h(x)$ 均趋于 $+infinity$。因此当且仅当 $a=e^2/4$ 时，方程有唯一正根。],
  ),
))
#section[选考题：共 10 分。请考生在第 22、23 题中任选一题作答，如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。
    在直角坐标系 $x O y$ 中，曲线 $C$ 的参数方程为 $cases(x=2cos theta, y=4sin theta)$（$theta$ 为参数），直线 $l$ 的参数方程为 $cases(x=1+t cos alpha, y=2+t sin alpha)$（$t$ 为参数）。],
  parts: (
    subquestion(
      stem: [求 $C$ 和 $l$ 的直角坐标方程。],
      answers: ([$C:x^2/4+y^2/16=1$；$l:(x-1)sin alpha-(y-2)cos alpha=0$。],),
      explanation: [将 $cos theta=x/2$、$sin theta=y/4$ 代入平方和等于 1 的恒等式，即得椭圆方程。直线方程通过两式分别乘 $sin alpha$、$cos alpha$ 后相减消去 $t$；该形式也包含 $cos alpha=0$ 时的竖直直线。],
    ),
    subquestion(
      stem: [若曲线 $C$ 截直线 $l$ 所得线段的中点坐标为 $(1,2)$，求 $l$ 的斜率。],
      answers: ([$-2$],),
      explanation: [将直线参数方程代入椭圆，得
        $ (4cos^2 alpha+sin^2 alpha)t^2+4(2cos alpha+sin alpha)t-8=0. $
        中点对应参数 0，故两根之和为 0，得 $2cos alpha+sin alpha=0$。此时 $cos alpha!=0$，故直线斜率为 $tan alpha=-2$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。
    设函数 $f(x)=5-|x+a|-|x-2|$。],
  parts: (
    subquestion(
      stem: [当 $a=1$ 时，求不等式 $f(x)>=0$ 的解集。],
      answers: ([$[-2,3]$],),
      explanation: [此时 $f(x)=cases(2x+4 & quad x<=-1, 2 & quad -1<x<=2, 6-2x & quad x>2)$，逐段解得 $-2<=x<=3$。],
    ),
    subquestion(
      stem: [若 $f(x)<=1$，求 $a$ 的取值范围。],
      answers: ([$(-infinity,-6] union [2,+infinity)$],),
      explanation: [要求对任意实数 $x$ 均有 $|x+a|+|x-2|>=4$。由三角不等式，$|x+a|+|x-2|>=|a+2|$，且 $x=2$ 时取等号，故须有 $|a+2|>=4$，即 $a<=-6$ 或 $a>=2$。],
    ),
  ),
)
