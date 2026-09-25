#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "全国三卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018全国3理(云南,广西,贵州,西藏,四川).pdf",
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
  let m = if auxiliary { (1, 0, 1) } else { (1.5, 0, calc.sqrt(3) / 2) }
  let o = (1, 0, 0)
  let n = (1, 2, 0)
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
    line(a, c, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(m, o, n, m, stroke: (dash: figure-style.dash))
      content(o, $O$, anchor: "south-east", padding: 3pt)
      content(n, $N$, anchor: "north", padding: 3pt)
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
  stem: [$(x^2+2/x)^5$ 的展开式中 $x^4$ 的系数为#choice-placeholder()。],
  choices: ([$10$], [$20$], [$40$], [$80$]),
  answers: ([C],),
  explanation: [通项为 $T_(r+1)=C_5^r (x^2)^(5-r)(2/x)^r=C_5^r 2^r x^(10-3r)$。令 $10-3r=4$，得 $r=2$，故系数为 $C_5^2 times 2^2=40$。],
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
  stem: [某群体中的每位成员使用移动支付的概率都为 $p$，各成员的支付方式相互独立。设 $X$ 为该群体的 10 位成员中使用移动支付的人数，$D X=2.4$，$P(X=4)<P(X=6)$，则 $p=$#choice-placeholder()。],
  choices: ([$0.7$], [$0.6$], [$0.4$], [$0.3$]),
  answers: ([B],),
  explanation: [$X tilde B(10,p)$，故 $10p(1-p)=2.4$，得 $p=0.4$ 或 $0.6$。由 $C_10^4=C_10^6$ 及概率不等式，得 $(1-p)^2<p^2$，即 $p>1/2$，故 $p=0.6$。],
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
#question(
  "single-choice",
  score: 5,
  stem: [设 $F_1,F_2$ 是双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的左、右焦点，$O$ 是坐标原点。过 $F_2$ 作 $C$ 的一条渐近线的垂线，垂足为 $P$。若 $|P F_1|=sqrt(6)|O P|$，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$sqrt(5)$], [$2$], [$sqrt(3)$], [$sqrt(2)$]),
  answers: ([C],),
  explanation: [设 $c=sqrt(a^2+b^2)$，取渐近线 $y=(b/a)x$，则 $P(a^2/c,a b/c)$，所以 $|O P|=a$。又
    $ |P F_1|^2=(a^2/c+c)^2+(a b/c)^2=c^2+3a^2. $
    由题意 $c^2+3a^2=6a^2$，得离心率 $e=c/a=sqrt(3)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $a=log_(0.2) 0.3$，$b=log_2 0.3$，则#choice-placeholder()。],
  choices: ([$a+b<a b<0$], [$a b<a+b<0$], [$a+b<0<a b$], [$a b<0<a+b$]),
  answers: ([B],),
  explanation: [∵ $a>0,b<0$，∴ $a b<0$。由换底公式，$1/a+1/b=log_(0.3) 0.4 in (0,1)$，即 $0<(a+b)/(a b)<1$。乘以负数 $a b$，得 $a b<a+b<0$。],
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
  stem: [曲线 $y=(a x+1)e^x$ 在点 $(0,1)$ 处的切线的斜率为 $-2$，则 $a=$#fill-placeholder()。],
  answers: ([$-3$],),
  explanation: [$y'=(a x+a+1)e^x$，故在 $x=0$ 处的导数为 $a+1=-2$，得 $a=-3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [函数 $f(x)=cos(3x+pi/6)$ 在 $[0,pi]$ 的零点个数为#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [令 $3x+pi/6=pi/2+k pi$（$k in ZZ$），得 $x=pi/9+(k pi)/3$。在 $[0,pi]$ 内有 $pi/9,4pi/9,7pi/9$ 三个零点。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知点 $M(-1,1)$ 和抛物线 $C:y^2=4x$，过 $C$ 的焦点且斜率为 $k$ 的直线与 $C$ 交于 $A,B$ 两点。若 $angle A M B=90 degree$，则 $k=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [焦点为 $(1,0)$，且 $k!=0$，否则仅有一个交点。设直线为 $y=k(x-1)$，交点为 $(x_1,y_1)$、$(x_2,y_2)$。联立得 $x_1+x_2=2+4/k^2$、$x_1x_2=1$、$y_1+y_2=4/k$、$y_1y_2=-4$。由垂直条件，
    $ 0=(x_1+1)(x_2+1)+(y_1-1)(y_2-1)=1+4/k^2-4/k=(k-2)^2/k^2. $
    故 $k=2$。],
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
  stem: [如图，边长为 2 的正方形 $A B C D$ 所在平面与半圆弧 $overparen(C D)$ 所在平面垂直，$M$ 是 $overparen(C D)$ 上异于 $C,D$ 的点。
    #figure(semicircle-solid())],
  parts: (
    subquestion(
      stem: [证明：平面 $A M D perp$ 平面 $B M C$。],
      answers: ([证明见解析。],),
      explanation: [∵ 平面 $C M D perp$ 平面 $A B C D$，交线为 $C D$，且 $B C perp C D$，∴ $B C perp$ 平面 $C M D$，从而 $B C perp D M$。又 $C D$ 是半圆的直径，∴ $C M perp D M$。∵ $B C inter C M={C}$，∴ $D M perp$ 平面 $B M C$。由 $D M subset$ 平面 $A M D$，得平面 $A M D perp$ 平面 $B M C$。],
    ),
    subquestion(
      stem: [当三棱锥 $M-A B C$ 体积最大时，求面 $M A B$ 与面 $M C D$ 所成二面角的正弦值。],
      answers: ([$frac(2sqrt(5), 5)$],),
      explanation: [底面面积固定，故体积最大时，$M$ 为半圆弧的中点。取 $C D,A B$ 的中点分别为 $O,N$，则 $M O=1$、$O N=2$，且 $M O perp O N$。两平面的交线过 $M$ 且平行于 $A B$，因此同时垂直于 $M O,M N$，$angle O M N$ 为所求二面角的平面角。故其正弦值为 $(O N)/(M N)=2/sqrt(5)=2sqrt(5)/5$。
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
      stem: [设 $F$ 为 $C$ 的右焦点，$P$ 为 $C$ 上一点，且 $arrow(F P)+arrow(F A)+arrow(F B)=bold(0)$。证明：$|arrow(F A)|,|arrow(F P)|,|arrow(F B)|$ 成等差数列，并求该数列的公差。],
      answers: ([证明见解析；公差为 $plus.minus (3sqrt(21))/28$。],),
      explanation: [
        #step[确定点与直线][焦点为 $F(1,0)$。由向量等式及中点坐标，得 $P(1,-2m)$。代入椭圆，得 $m=3/4$，故 $P(1,-3/2)$，$|F P|=3/2$，且 $l:y=-x+7/4$。]
        #step[证明等差并求公差][椭圆上任一点 $(x,y)$ 到右焦点的距离满足
          $ sqrt((x-1)^2+y^2)=sqrt((x-1)^2+3(1-x^2/4))=2-x/2. $
          故 $|F A|+|F B|=4-(x_1+x_2)/2=3=2|F P|$，三者成等差数列。联立 $l$ 与椭圆，得 $28x^2-56x+1=0$，即 $x_1,x_2=1 plus.minus (3sqrt(21))/14$。因此公差为
          $ d=|F P|-|F A|=(x_1-1)/2=plus.minus (3sqrt(21))/28. $]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=(2+x+a x^2)ln(1+x)-2x$。],
  parts: (
    subquestion(
      stem: [若 $a=0$，证明：当 $-1<x<0$ 时，$f(x)<0$；当 $x>0$ 时，$f(x)>0$。],
      answers: ([证明见解析。],),
      explanation: [此时 $f'(x)=ln(1+x)-x/(1+x)$。令 $g(x)=f'(x)$，则 $g'(x)=x/(1+x)^2$。故 $g$ 在 $(-1,0)$ 上递减，在 $(0,+infinity)$ 上递增，且 $g(0)=0$。因此 $f'(x)>=0$，仅在 0 处取等号，$f$ 严格递增。结合 $f(0)=0$，即得结论。],
    ),
    subquestion(
      stem: [若 $x=0$ 是 $f(x)$ 的极大值点，求 $a$。],
      answers: ([$-1/6$],),
      explanation: [
        #step[化为同号函数][在 0 的充分小邻域内，$q(x)=2+x+a x^2>0$，故 $h(x)=f(x)/q(x)=ln(1+x)-2x/q(x)$ 与 $f(x)$ 同号，且二者在 0 处均为 0。因此 0 是 $f$ 的极大值点，当且仅当它是 $h$ 的极大值点。求导得
          $ h'(x)=frac(x^2(a^2x^2+4a x+6a+1), (1+x)(2+x+a x^2)^2). $]
        #step[判断极值][若 $6a+1!=0$，则在 0 的充分小去心邻域内，导数与 $6a+1$ 同号，$h$ 在 0 附近严格单调，不可能有极大值。故必须 $a=-1/6$。此时
          $ h'(x)=frac(x^3(x-24), (1+x)(x^2-6x-12)^2). $
          在 0 左侧足够近处导数为正，右侧足够近处为负，故 0 确为极大值点。综上，$a=-1/6$。]
      ],
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
