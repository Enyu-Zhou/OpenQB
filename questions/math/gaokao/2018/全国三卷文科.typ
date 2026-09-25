#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "全国三卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018全国3文(云南,广西,贵州,西藏,四川).pdf",
  regions: ("云南", "广西", "贵州", "西藏", "四川"),
)

#let tenon() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((1, 0), (0.4, 0.4), (0, 1), {
    let a = (0, 0, 0)
    let b = (4, 0, 0)
    let c = (4, 2, 0)
    let d = (0, 2, 0)
    let aa = (0, 0, 1.6)
    let bb = (4, 0, 1.6)
    let cc = (4, 2, 1.6)
    let dd = (0, 2, 1.6)
    line(a, b, c, cc, dd, aa, a)
    line(aa, bb, cc)
    line(b, bb)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, dd, stroke: (dash: figure-style.dash))
    let e = (4, 0.5, 0.4)
    let f = (5.6, 0.5, 0.4)
    let g = (5.6, 1.5, 0.4)
    let h = (4, 1.5, 0.4)
    let ee = (4, 0.5, 1.2)
    let ff = (5.6, 0.5, 1.2)
    let gg = (5.6, 1.5, 1.2)
    let hh = (4, 1.5, 1.2)
    line(e, f, g, gg, hh, ee, e)
    line(ee, ff, gg)
    line(f, ff)
    line(e, h, g, stroke: (dash: figure-style.dash))
    line(h, hh, stroke: (dash: figure-style.dash))
  })
  line((5.5, 3.1), (5.5, 1.6), mark: (end: ">"))
  content((5.65, 2.4), [俯视方向], anchor: "west")
})
#let mortise(kind) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  if kind == "D" {
    line(
      (0, 0),
      (4, 0),
      (4, 1.6),
      (0, 1.6),
      (0, 1.2),
      (1.6, 1.2),
      (1.6, 0.4),
      (0, 0.4),
      close: true,
    )
  } else {
    rect((0, 0), (4, 1.6))
    if kind == "C" {
      line((0, 0.8), (1.6, 0.8), (1.6, 0), stroke: (dash: figure-style.dash))
    } else {
      line((0, 1.2), (1.6, 1.2), (1.6, 0.4), (0, 0.4), stroke: (
        dash: if kind == "A" { figure-style.dash } else { "solid" },
      ))
    }
  }
})
#let quartic(kind) = cetz.canvas(length: 9mm, {
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
    x: (label: (anchor: "west", offset: 0.15)),
    y: (label: (anchor: "south", offset: 0.15)),
  ))
  plot.plot(
    size: (4.4, 4.4),
    axis-style: "school-book",
    x-min: -2,
    x-max: 2,
    y-min: -3.2,
    y-max: 3.2,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (1,),
    y-ticks: (1,),
    x-label: $x$,
    y-label: $y$,
    {
      let f(x) = if kind == "A" { calc.pow(x, 4) - 2 } else if kind == "B" {
        calc.pow(x, 4) - x * x - 2
      } else if kind == "C" { -calc.pow(x, 4) + 2 } else {
        -calc.pow(x, 4) + x * x + 2
      }
      plot.add(f, domain: (-1.65, 1.65), style: (
        stroke: (paint: black, thickness: figure-style.thickness),
      ))
    },
  )
})
#let semicircle-solid(auxiliary: false) = cetz.canvas(length: 20mm, {
  import cetz.draw: *
  let a = (0, 2, 0)
  let b = (2, 2, 0)
  let c = (2, 0, 0)
  let d = (0, 0, 0)
  let m = (1.5, 0, calc.sqrt(3) / 2)
  let o = (1, 1, 0)
  let p = (0.75, 1, calc.sqrt(3) / 4)
  oblique-project((1, 0), (-0.35, -0.35), (0, 1.3), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    let arc-points = range(91).map(i => (
      1 + calc.cos(i * 2deg),
      0,
      calc.sin(i * 2deg),
    ))
    line(..arc-points)
    line(d, a, b, c)
    line(a, m, b)
    line(d, m, c)
    line(d, c, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(a, c, stroke: (dash: figure-style.dash))
      line(b, d, stroke: (dash: figure-style.dash))
      line(p, o, stroke: (dash: figure-style.dash))
      content(o, $O$, anchor: "north", padding: 3pt)
      content(p, $P$, anchor: "west", padding: 8pt)
    }
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "west"),
      (d, $D$, "east"),
      (m, $M$, "south-west"),
    ) {
      content(point, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let absolute-graph(answer: false) = cetz.canvas(length: 10mm, {
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
    grid: (stroke: (paint: luma(70%), thickness: figure-style.thickness)),
    x: (label: (anchor: "west", offset: 0.15)),
    y: (label: (anchor: "south", offset: 0.15)),
  ))
  plot.plot(
    size: (6, 8),
    axis-style: "school-book",
    x-min: -3,
    x-max: 3,
    y-min: -2,
    y-max: 6,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: range(-3, 4)
      .filter(x => x != 0)
      .map(x => (x, if x == 1 { $1$ } else { [] })),
    y-ticks: range(-2, 7)
      .filter(y => y != 0)
      .map(y => (y, if y == 1 { $1$ } else { [] })),
    x-grid: true,
    y-grid: true,
    x-label: $x$,
    y-label: $y$,
    {
      plot.annotate(resize: false, {
        if answer {
          line((-2, 6), (-0.5, 1.5), (1, 3), (2, 6))
          content((-0.5, 1.5), $(-1/2,3/2)$, anchor: "east", padding: 4pt)
          content((1, 3), $(1,3)$, anchor: "west", padding: 4pt)
        }
      })
    },
  )
})
#let work-times() = table(
  columns: (auto, auto, auto),
  align: (right, center, left),
  stroke: none,
  table.vline(x: 1, stroke: figure-style.thickness),
  table.vline(x: 2, stroke: figure-style.thickness),
  [第一种生产方式],
  [],
  [第二种生产方式],
  table.hline(stroke: figure-style.thickness),
  [$8$], [$6$], [$5 quad 5 quad 6 quad 8 quad 9$],
  [$9 quad 7 quad 6 quad 2$],
  [$7$],
  [$0 quad 1 quad 2 quad 2 quad 3 quad 4 quad 5 quad 6 quad 6 quad 8$],
  [$9 quad 8 quad 7 quad 7 quad 6 quad 5 quad 4 quad 3 quad 3 quad 2$],
  [$8$],
  [$1 quad 4 quad 4 quad 5$],
  [$2 quad 1 quad 1 quad 0 quad 0$], [$9$], [$0$],
)

#section[选择题：共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x|x-1>=0}$，$B={0,1,2}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${0}$], [${1}$], [${1,2}$], [${0,1,2}$]),
  answers: ([C],),
  explanation: [$A=[1,+infinity)$，∴ $A inter B={1,2}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$(1+i)(2-i)=$#choice-placeholder()。],
  choices: ([$-3-i$], [$-3+i$], [$3-i$], [$3+i$]),
  answers: ([D],),
  explanation: [$(1+i)(2-i)=2+i-i^2=3+i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [中国古建筑借助榫卯将木构件连接起来，构件的凸出部分叫榫头，凹进部分叫卯眼，图中木构件右边的小长方体是榫头。若如图摆放的木构件与某一带卯眼的木构件咬合成长方体，则咬合时带卯眼的木构件的俯视图可以是#choice-placeholder()。
    #figure(tenon())],
  choices: (
    [#figure(mortise("A"))],
    [#figure(mortise("B"))],
    [#figure(mortise("C"))],
    [#figure(mortise("D"))],
  ),
  answers: ([A],),
  explanation: [卯眼从左侧开口，与榫头的位置对应，在俯视方向上被木构件的上表面遮挡，轮廓应画为虚线；凹槽位于宽度方向的中部，故选 A。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $sin alpha=1/3$，则 $cos 2alpha=$#choice-placeholder()。],
  choices: ([$8/9$], [$7/9$], [$-7/9$], [$-8/9$]),
  answers: ([B],),
  explanation: [$cos 2alpha=1-2sin^2 alpha=1-2/9=7/9$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若某群体中的成员只用现金支付的概率为 $0.45$，既用现金支付也用非现金支付的概率为 $0.15$，则不用现金支付的概率为#choice-placeholder()。],
  choices: ([$0.3$], [$0.4$], [$0.6$], [$0.7$]),
  answers: ([B],),
  explanation: [“不用现金”与“使用现金”互为对立事件；后者由“只用现金”和“两种方式都用”两个互斥事件构成。故所求概率为 $1-0.45-0.15=0.4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $f(x)=frac(tan x, 1+tan^2 x)$ 的最小正周期为#choice-placeholder()。],
  choices: ([$pi/4$], [$pi/2$], [$pi$], [$2pi$]),
  answers: ([C],),
  explanation: [在定义域 $x!=pi/2+k pi$（$k in ZZ$）内，$f(x)=sin x cos x=1/2 sin 2x$。函数值和定义域均以 $pi$ 为周期；定义域排除点的集合在平移 $T$ 后保持不变要求 $T$ 为 $pi$ 的整数倍，故最小正周期为 $pi$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [下列函数中，其图象与函数 $y=ln x$ 的图象关于直线 $x=1$ 对称的是#choice-placeholder()。],
  choices: ([$y=ln(1-x)$], [$y=ln(2-x)$], [$y=ln(1+x)$], [$y=ln(2+x)$]),
  answers: ([B],),
  explanation: [点 $(x,y)$ 关于直线 $x=1$ 的对称点为 $(2-x,y)$，故对称图象的方程为 $y=ln(2-x)$（$x<2$）。],
)
#question(
  "single-choice",
  score: 5,
  stem: [直线 $x+y+2=0$ 分别与 $x$ 轴、$y$ 轴交于 $A,B$ 两点，点 $P$ 在圆 $(x-2)^2+y^2=2$ 上，则 $triangle A B P$ 面积的取值范围是#choice-placeholder()。],
  choices: (
    [$[2,6]$],
    [$[4,8]$],
    [$[sqrt(2),3sqrt(2)]$],
    [$[2sqrt(2),3sqrt(2)]$],
  ),
  answers: ([A],),
  explanation: [$A(-2,0)$、$B(0,-2)$，故 $|A B|=2sqrt(2)$。圆心 $(2,0)$ 到直线的距离为 $2sqrt(2)$，半径为 $sqrt(2)$，故 $P$ 到直线的距离 $d in [sqrt(2),3sqrt(2)]$。面积 $S=1/2 times 2sqrt(2)d in [2,6]$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $y=-x^4+x^2+2$ 的图象大致为#choice-placeholder()。],
  choices: (
    [#figure(quartic("A"))],
    [#figure(quartic("B"))],
    [#figure(quartic("C"))],
    [#figure(quartic("D"))],
  ),
  answers: ([D],),
  explanation: [函数为偶函数，且 $f(0)=2>0$，排除 A、B。又 $f'(x)=2x(1-2x^2)$，在 $(0,sqrt(2)/2)$ 上为正，故原点右侧先递增，排除 C，选 D。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的离心率为 $sqrt(2)$，则点 $(4,0)$ 到 $C$ 的渐近线的距离为#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$2$], [$(3sqrt(2))/2$], [$2sqrt(2)$]),
  answers: ([D],),
  explanation: [由 $e^2=1+b^2/a^2=2$，得 $b/a=1$，故渐近线为 $y=plus.minus x$。点 $(4,0)$ 到两条渐近线的距离均为 $4/sqrt(2)=2sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，若 $triangle A B C$ 的面积为 $(a^2+b^2-c^2)/4$，则 $C=$#choice-placeholder()。],
  choices: ([$pi/2$], [$pi/3$], [$pi/4$], [$pi/6$]),
  answers: ([C],),
  explanation: [由面积公式和余弦定理，$1/2 a b sin C=1/2 a b cos C$，故 $tan C=1$。∵ $0<C<pi$，∴ $C=pi/4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $A,B,C,D$ 是同一个半径为 4 的球的球面上四点，$triangle A B C$ 为等边三角形且其面积为 $9sqrt(3)$，则三棱锥 $D-A B C$ 体积的最大值为#choice-placeholder()。],
  choices: ([$12sqrt(3)$], [$18sqrt(3)$], [$24sqrt(3)$], [$54sqrt(3)$]),
  answers: ([B],),
  explanation: [等边三角形的边长为 6，外接圆半径为 $2sqrt(3)$。球心到平面 $A B C$ 的距离为 $sqrt(4^2-(2sqrt(3))^2)=2$，故棱锥的高最大为 $4+2=6$，此时体积为 $1/3 times 9sqrt(3) times 6=18sqrt(3)$。],
)
#section[填空题：共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)=(1,2)$，$bold(b)=(2,-2)$，$bold(c)=(1,lambda)$。若 $bold(c) parallel (2bold(a)+bold(b))$，则 $lambda=$#fill-placeholder()。],
  answers: ([$1/2$],),
  explanation: [$2bold(a)+bold(b)=(4,2)$，由平行条件得 $4lambda-2=0$，故 $lambda=1/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某公司有大量客户，且不同龄段客户对其服务的评价有较大差异。为了解客户的评价，该公司准备进行抽样调查，可供选择的抽样方法有简单随机抽样、分层抽样和系统抽样，则最合适的抽样方法是#fill-placeholder()。],
  answers: ([分层抽样],),
  explanation: [总体可按年龄段分层，层间评价有明显差异。按各年龄段人数比例抽样，能使各层均有适当代表，故宜用分层抽样。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若变量 $x,y$ 满足约束条件 $cases(2x+y+3>=0, x-2y+4>=0, x-2<=0)$，则 $z=x+1/3 y$ 的最大值是#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [由 $y<=(x+4)/2$、$x<=2$，得 $z<=x+(x+4)/6=(7x+4)/6<=3$。点 $(2,3)$ 满足全部约束条件，且使两次不等式同时取等号，故最大值为 3。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=ln(sqrt(1+x^2)-x)+1$，$f(a)=4$，则 $f(-a)=$#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [对任意实数 $x$，$sqrt(1+x^2)>|x|$，两对数的真数均为正。又 $(sqrt(1+x^2)-x)(sqrt(1+x^2)+x)=1$，故 $f(x)+f(-x)=ln 1+2=2$。于是 $f(-a)=2-4=-2$。],
)
#section[解答题：共 70 分。第 17～21 题为必考题，每题 12 分。]
#question(
  "solution",
  score: 12,
  stem: [等比数列 ${a_n}$ 中，$a_1=1$，$a_5=4a_3$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=2^(n-1)$ 或 $a_n=(-2)^(n-1)$。],),
      explanation: [设公比为 $q!=0$，则 $q^4=4q^2$，故 $q=plus.minus 2$，从而通项公式如上。],
    ),
    subquestion(
      stem: [记 $S_n$ 为 ${a_n}$ 的前 $n$ 项和。若 $S_m=63$，求 $m$。],
      answers: ([$6$],),
      explanation: [若 $q=2$，则 $S_m=2^m-1=63$，得 $m=6$。若 $q=-2$，则 $S_m=(1-(-2)^m)/3=63$，要求 $(-2)^m=-188$，没有正整数解。故 $m=6$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某工厂为提高生产效率，开展技术创新活动，提出了完成某项生产任务的两种新的生产方式。为比较两种生产方式的效率，选取 40 名工人，将他们随机分成两组，每组 20 人，第一组工人用第一种生产方式，第二组工人用第二种生产方式。根据工人完成生产任务的工作时间（单位：min）绘制了如图茎叶图：
    #work-times()
    附：$K^2=frac(n(a d-b c)^2, (a+b)(c+d)(a+c)(b+d))$。
    #table(
      columns: 4,
      [$P(K^2>=k)$], [$0.050$], [$0.010$], [$0.001$],
      [$k$], [$3.841$], [$6.635$], [$10.828$],
    )],
  parts: (
    subquestion(
      stem: [根据茎叶图判断哪种生产方式的效率更高？并说明理由。],
      answers: ([第二种生产方式的效率更高。],),
      explanation: [第一组完成任务所需时间的中位数为 $85.5$ 分钟，第二组为 $73.5$ 分钟，第二组用时总体更短，故第二种生产方式的效率更高。],
    ),
    subquestion(
      stem: [求 40 名工人完成生产任务所需时间的中位数 $m$，并将完成生产任务所需时间超过 $m$ 和不超过 $m$ 的工人数填入下面的列联表：
        #table(
          columns: 3,
          [], [超过 $m$], [不超过 $m$],
          [第一种生产方式], [], [],
          [第二种生产方式], [], [],
        )],
      answers: ([$m=80$，列联表见解析。],),
      explanation: [合并数据后，第 20 个数为 79，第 21 个数为 81，故 $m=(79+81)/2=80$。列联表为：
        #table(
          columns: 3,
          [], [超过 $m$], [不超过 $m$],
          [第一种生产方式], [$15$], [$5$],
          [第二种生产方式], [$5$], [$15$],
        )],
    ),
    subquestion(
      stem: [根据第（2）问中的列联表，能否有 $99%$ 的把握认为两种生产方式的效率有差异？],
      answers: ([能。],),
      explanation: [$K^2=frac(40(15 times 15-5 times 5)^2, 20 times 20 times 20 times 20)=10>6.635$，故能有 $99%$ 的把握认为两种生产方式的效率有差异。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，矩形 $A B C D$ 所在平面与半圆弧 $overparen(C D)$ 所在平面垂直，$M$ 是 $overparen(C D)$ 上异于 $C,D$ 的点。
    #figure(semicircle-solid())],
  parts: (
    subquestion(
      stem: [证明：平面 $A M D perp$ 平面 $B M C$。],
      answers: ([证明见解析。],),
      explanation: [∵ 平面 $C M D perp$ 平面 $A B C D$，交线为 $C D$，且 $B C perp C D$，∴ $B C perp$ 平面 $C M D$，从而 $B C perp D M$。又 $C D$ 是半圆的直径，∴ $C M perp D M$。∵ $B C inter C M={C}$，∴ $D M perp$ 平面 $B M C$。由 $D M subset$ 平面 $A M D$，得平面 $A M D perp$ 平面 $B M C$。],
    ),
    subquestion(
      stem: [在线段 $A M$ 上是否存在点 $P$，使得 $M C parallel$ 平面 $P B D$？说明理由。],
      answers: ([存在，取 $P$ 为 $A M$ 的中点。],),
      explanation: [取 $P$ 为 $A M$ 的中点，连接 $A C,B D$，交于点 $O$。矩形的对角线互相平分，故 $O$ 为 $A C$ 的中点。在 $triangle A M C$ 中，$P O$ 为中位线，故 $P O parallel M C$。又平面 $P B D$ 与底面交于 $B D$，而 $C in.not B D$，故 $M C$ 不在平面 $P B D$ 内。由 $P O subset$ 平面 $P B D$，得 $M C parallel$ 平面 $P B D$。
        #figure(semicircle-solid(auxiliary: true))],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知斜率为 $k$ 的直线 $l$ 与椭圆 $C:x^2/4+y^2/3=1$ 交于 $A,B$ 两点。线段 $A B$ 的中点为 $M(1,m)$（$m>0$）。],
  parts: (
    subquestion(
      stem: [证明：$k< -1/2$。],
      answers: ([证明见解析。],),
      explanation: [设 $A(x_1,y_1)$、$B(x_2,y_2)$。将两点坐标代入椭圆方程后相减，得
        $ (x_1+x_2)/4+k(y_1+y_2)/3=0. $
        ∵ $x_1+x_2=2$、$y_1+y_2=2m$，∴ $k=-3/(4m)$。中点在椭圆内部，故 $1/4+m^2/3<1$，得 $0<m<3/2$。于是 $k< -1/2$。],
    ),
    subquestion(
      stem: [设 $F$ 为 $C$ 的右焦点，$P$ 为 $C$ 上一点，且 $arrow(F P)+arrow(F A)+arrow(F B)=bold(0)$。证明：$2|arrow(F P)|=|arrow(F A)|+|arrow(F B)|$。],
      answers: ([证明见解析。],),
      explanation: [焦点为 $F(1,0)$。由向量等式及 $x_1+x_2=2$，得 $P$ 的横坐标为 1。椭圆上任一点 $(x,y)$ 到右焦点的距离为
        $ sqrt((x-1)^2+y^2)=sqrt((x-1)^2+3(1-x^2/4))=2-x/2. $
        故 $|F P|=3/2$，且 $|F A|+|F B|=4-(x_1+x_2)/2=3=2|F P|$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=(a x^2+x-1)/e^x$。],
  parts: (
    subquestion(
      stem: [求曲线 $y=f(x)$ 在点 $(0,-1)$ 处的切线方程。],
      answers: ([$y=2x-1$],),
      explanation: [$f'(x)=(-a x^2+(2a-1)x+2)/e^x$，故 $f'(0)=2$。切线方程为 $y+1=2x$，即 $y=2x-1$。],
    ),
    subquestion(
      stem: [证明：当 $a>=1$ 时，$f(x)+e>=0$。],
      answers: ([证明见解析。],),
      explanation: [令 $g(t)=e^t-t-1$，则 $g'(t)=e^t-1$，故 $g(t)>=g(0)=0$，即 $e^t>=1+t$。取 $t=x+1$，得 $e^(x+1)>=x+2$。∵ $a>=1$，∴
        $
          f(x)+e=frac(a x^2+x-1+e^(x+1), e^x)>=frac(x^2+x-1+x+2, e^x)=frac((x+1)^2, e^x)>=0.
        $
        当 $a=1,x=-1$ 时取等号。],
    ),
  ),
)
#section[选考题：共 10 分。请考生在第 22、23 题中任选一题作答，如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。
    在平面直角坐标系 $x O y$ 中，$circle O$ 的参数方程为 $cases(x=cos theta, y=sin theta)$（$theta$ 为参数），过点 $(0,-sqrt(2))$ 且倾斜角为 $alpha$ 的直线 $l$ 与 $circle O$ 交于 $A,B$ 两点。],
  parts: (
    subquestion(
      stem: [求 $alpha$ 的取值范围。],
      answers: ([$(pi/4,(3pi)/4)$],),
      explanation: [圆为 $x^2+y^2=1$，直线可写为 $x sin alpha-(y+sqrt(2))cos alpha=0$。圆心到直线的距离为 $sqrt(2)|cos alpha|$，由相交于两点得 $sqrt(2)|cos alpha|<1$。结合 $0<=alpha<pi$，得 $pi/4<alpha<3pi/4$。],
    ),
    subquestion(
      stem: [求 $A B$ 中点 $P$ 的轨迹的参数方程。],
      answers: (
        [$cases(x=sqrt(2)/2 sin 2alpha, y=-sqrt(2)/2-sqrt(2)/2 cos 2alpha)$（$alpha$ 为参数，$pi/4<alpha<3pi/4$）。],
      ),
      explanation: [设直线参数方程为 $cases(x=t cos alpha, y=-sqrt(2)+t sin alpha)$。代入圆，得 $t^2-2sqrt(2)t sin alpha+1=0$，两根之和为 $2sqrt(2)sin alpha$。中点对应参数 $t_P=sqrt(2)sin alpha$，代回并用二倍角公式，即得所求参数方程。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。
    设函数 $f(x)=|2x+1|+|x-1|$。],
  parts: (
    subquestion(
      stem: [画出 $y=f(x)$ 的图象。
        #figure(absolute-graph())],
      answers: ([图见解析。],),
      explanation: [以 $-1/2,1$ 为分界点，得
        $
          f(x)=cases(-3x & quad x< -1/2, x+2 & quad -1/2<=x<1, 3x & quad x>=1).
        $
        图象为依次经过 $(-1/2,3/2)$、$(1,3)$ 的三段折线：
        #figure(absolute-graph(answer: true))],
    ),
    subquestion(
      stem: [当 $x in [0,+infinity)$ 时，$f(x)<=a x+b$，求 $a+b$ 的最小值。],
      answers: ([$5$],),
      explanation: [取 $x=0$，得 $b>=2$。当 $x>=1$ 时，要求 $(a-3)x+b>=0$ 恒成立，故必须 $a>=3$。反之，若 $a>=3,b>=2$，则当 $0<=x<1$ 时，$a x+b-(x+2)>=(3x+2)-(x+2)=2x>=0$；当 $x>=1$ 时，$a x+b-3x>=2>0$。故条件等价于 $a>=3,b>=2$，$a+b$ 的最小值为 5，在 $a=3,b=2$ 时取得。],
    ),
  ),
)
