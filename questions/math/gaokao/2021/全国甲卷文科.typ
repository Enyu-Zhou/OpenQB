#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校招生全国统一考试",
  name: "全国甲卷（文科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2021/2021全国甲文(云南,广西,贵州,西藏,四川).pdf",
  regions: ("云南", "广西", "贵州", "西藏", "四川"),
)

#let income-histogram() = {
  set text(size: 8pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let heights = (
      0.02,
      0.04,
      0.10,
      0.14,
      0.20,
      0.20,
      0.10,
      0.10,
      0.04,
      0.02,
      0.02,
      0.02,
    )
    let levels = (0.02, 0.04, 0.10, 0.14, 0.20)
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: $0$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      x: (label: (anchor: "west", offset: 0.18)),
    ))
    plot.plot(
      size: (10, 4.8),
      axis-style: "school-book",
      x-min: 1.5,
      x-max: 15,
      x-break: true,
      y-min: 0,
      y-max: 0.23,
      x-label: [收入/万元],
      y-label: [$"频率"/"组距"$],
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: range(13).map(i => i + 2.5),
      y-ticks: levels.zip(("0.02", "0.04", "0.10", "0.14", "0.20")),
      {
        plot.annotate(resize: false, {
          for (i, h) in heights.enumerate() {
            let x = 2.5 + i
            line((x, h), (x + 1, h))
            line(
              (x, 0),
              (x, calc.max(h, if i == 0 { 0 } else { heights.at(i - 1) })),
            )
          }
          line((14.5, 0), (14.5, heights.last()))
          for level in levels {
            let i = heights.position(h => h >= level)
            line((1.5, level), (2.5 + i, level), stroke: (
              dash: figure-style.dash,
            ))
          }
        })
      },
    )
  })
}
#let cube-view(index, title: none) = cetz.canvas(length: 20mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((0, 0), (1, 1))
  let left = index == 1 or index == 3
  line(
    if left { (0, 0.5) } else { (1, 0.5) },
    (0.5, 0),
    stroke: (
      dash: if index == 1 or index == 2 { figure-style.dash } else { none },
    ),
  )
  if title != none { content((0.5, -0.1), title, anchor: "north") }
})
#let cosine-diagram() = cetz.canvas(length: 10mm, {
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
  ))
  plot.plot(
    size: (6, 3.2),
    axis-style: "school-book",
    x-min: -0.8,
    x-max: 4.65,
    y-min: -2.3,
    y-max: 2.5,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((calc.pi / 3, $pi/3$), (13 * calc.pi / 12, $(13pi)/12$)),
    y-ticks: (2,),
    {
      plot.add(
        x => 2 * calc.cos((2 * x - calc.pi / 6) * 1rad),
        domain: (-0.7, 4.5),
        samples: 150,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.annotate(resize: false, {
        line((0, 2), (13 * calc.pi / 12, 2), (13 * calc.pi / 12, 0), stroke: (
          dash: figure-style.dash,
        ))
      })
    },
  )
})
#let prism-diagram(auxiliary: false) = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  let a = (2, 0, 0)
  let b = (0, 0, 0)
  let c = (0, 2, 0)
  let a1 = (2, 0, 2)
  let b1 = (0, 0, 2)
  let c1 = (0, 2, 2)
  let d = (0.5, 0, 2)
  let e = (1, 1, 0)
  let f = (0, 2, 1)
  oblique-project((-1, 0), (-0.35, -0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, c, b, b1, a1, a)
    line(a1, c1, b1)
    line(c, c1)
    line(a, b, stroke: (dash: figure-style.dash))
    line(b, f, e)
    line(e, b, stroke: (dash: figure-style.dash))
    if auxiliary {
      let n = (0, 1, 0)
      line(b1, n)
      line(e, n, stroke: (dash: figure-style.dash))
      content(n, $N$, anchor: "north-west", padding: 3pt)
    }
    line(e, d, f, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "west"),
      (c, $C$, "north"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "south-west"),

      (d, $D$, "south"),
      (e, $E$, "north-east"),
      (f, $F$, "east"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
    content(c1, $C_1$, anchor: "east", padding: 9pt)
  })
})
#let absolute-diagram(solved: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let ticks = range(-8, 9)
      .filter(v => v != 0)
      .map(v => (v, if v == 1 { $1$ } else { [] }))
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: if solved { move(dx: 12pt, dy: -15pt)[$O$] } else { $O$ },
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      grid: (stroke: (paint: luma(65%), thickness: figure-style.thickness)),
    ))
    plot.plot(
      size: (7.2, 7.2),
      axis-style: "school-book",
      x-min: -8,
      x-max: 8,
      y-min: -8,
      y-max: 8,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: if solved { ((-1.5, $-3/2$), (0.5, $1/2$), (2, $2$)) } else {
        ticks
      },
      y-ticks: if solved { (-4, 4) } else { ticks },
      x-grid: not solved,
      y-grid: not solved,
      {
        plot.annotate(resize: false, {})
        if solved {
          plot.add(((-6, 8), (2, 0), (8, 6)), style: (
            stroke: (paint: black, thickness: figure-style.thickness),
          ))
          plot.add(((-8, -4), (-1.5, -4), (0.5, 4), (8, 4)), style: (
            stroke: (
              paint: black,
              thickness: figure-style.thickness,
              dash: figure-style.dash,
            ),
          ))
          plot.annotate(resize: false, {
            content((5, 5.5), $y=f(x)$)
            content((-4.5, -5), $y=g(x)$)
          })
        }
      },
    )
  })
}


#section[选择题]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $M={1,3,5,7,9},N={x | 2x>7}$，则 $M inter N=$#choice-placeholder()。],
  choices: ([$\{7,9\}$], [$\{5,7,9\}$], [$\{3,5,7,9\}$], [$\{1,3,5,7,9\}$]),
  answers: ([B],),
  explanation: [$N={x | x>7/2}$，在 $M$ 中满足条件的元素为 $5,7,9$，所以 $M inter N={5,7,9}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [为了解某地农村经济情况，对该地农户家庭年收入进行抽样调查，将农户家庭年收入的调查数据整理得到如下频率分布直方图：
    #figure(income-histogram())
    根据此频率分布直方图，下面结论中不正确的是#choice-placeholder()。],
  choices: (
    [该地农户家庭年收入低于 4.5 万元的农户比率估计为 6%],
    [该地农户家庭年收入不低于 10.5 万元的农户比率估计为 10%],
    [估计该地农户家庭年收入的平均值不超过 6.5 万元],
    [估计该地有一半以上的农户，其家庭年收入介于 4.5 万元至 8.5 万元之间],
  ),
  answers: ([C],),
  explanation: [组距为 $1$，各柱高即相应频率。
    #step[选项 A、B、D][低于 $4.5$ 万元的频率为 $0.02+0.04=0.06$；不低于 $10.5$ 万元的频率为 $0.04+3 times 0.02=0.10$。
      介于 $4.5$ 万元至 $8.5$ 万元的频率为 $0.10+0.14+2 times 0.20=0.64>0.5$。三项均正确。]
    #step[选项 C][以各组中点 $3,4,dots,14$ 为代表值，加权求和得平均收入约为 $7.68$ 万元，超过 $6.5$ 万元，故 C 不正确。]],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知 $(1-i)^2 z=3+2i$，则 $z=$#choice-placeholder()。],
  choices: ([$-1-3/2 i$], [$-1+3/2 i$], [$-3/2+i$], [$-3/2-i$]),
  answers: ([B],),
  explanation: [∵ $(1-i)^2=-2i$，∴ $z=(3+2i)/(-2i)=-1+3/2 i$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [下列函数中是增函数的为#choice-placeholder()。],
  choices: ([$f(x)=-x$], [$f(x)=(2/3)^x$], [$f(x)=x^2$], [$f(x)=root(3, x)$]),
  answers: ([D],),
  explanation: [$-x$ 与 $(2/3)^x$ 在 $RR$ 上均递减；$x^2$ 在 $(-infinity,0)$ 上递减，在 $(0,+infinity)$ 上递增，故都不是定义域上的增函数。
    立方根函数 $root(3, x)$ 在 $RR$ 上严格递增，故选 D。],
)
#question(
  "single-choice",
  score: 5,
  stem: [点 $(3,0)$ 到双曲线 $x^2/16-y^2/9=1$ 的一条渐近线的距离为#choice-placeholder()。],
  choices: ([$9/5$], [$8/5$], [$6/5$], [$4/5$]),
  answers: ([A],),
  explanation: [两条渐近线为 $3x+4y=0$ 与 $3x-4y=0$，点 $(3,0)$ 到它们的距离相同，均为 $d=9/sqrt(3^2+4^2)=9/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [青少年视力是社会普遍关注的问题，视力情况可借助视力表测量。通常用五分记录法和小数记录法记录视力数据，五分记录法的数据 $L$ 和小数记录法的数据 $V$ 满足 $L=5+lg V$。已知某同学视力的五分记录法的数据为 $4.9$，则其视力的小数记录法的数据约为（$root(10, 10) approx 1.259$）#choice-placeholder()。],
  choices: ([$1.5$], [$1.2$], [$0.8$], [$0.6$]),
  answers: ([C],),
  explanation: [$lg V=4.9-5=-0.1$，故 $V=10^(-0.1)=1/root(10, 10) approx 1/1.259 approx 0.8$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [在一个正方体中，过顶点 $A$ 的三条棱的中点分别为 $E,F,G$。该正方体截去三棱锥 $A-E F G$ 后，所得多面体的三视图中，正视图如图所示，则相应的侧视图是#choice-placeholder()。
    #figure(cube-view(1, title: [正视图]))],
  choices: (
    [#figure(cube-view(0))],
    [#figure(cube-view(1))],
    [#figure(cube-view(2))],
    [#figure(cube-view(3))],
  ),
  answers: ([D],),
  explanation: [正视图左下角的截面边为虚线，说明被截去的顶点位于正方体的后方、左下角。从左侧观察时，该截面可见，其投影边连接正方形左边与下边的中点，应画为实线，故选 D。],
)

#question(
  "single-choice",
  score: 5,
  stem: [在 $triangle A B C$ 中，已知 $B=120 degree,A C=sqrt(19),A B=2$，则 $B C=$#choice-placeholder()。],
  choices: ([$1$], [$sqrt(2)$], [$sqrt(5)$], [$3$]),
  answers: ([D],),
  explanation: [设 $B C=t>0$。由余弦定理，$19=t^2+4-4t cos 120 degree=t^2+2t+4$。
    故 $(t-3)(t+5)=0$，舍去负根，得 $B C=3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [记 $S_n$ 为等比数列 $\{a_n\}$ 的前 $n$ 项和。若 $S_2=4,S_4=6$，则 $S_6=$#choice-placeholder()。],
  choices: ([$7$], [$8$], [$9$], [$10$]),
  answers: ([A],),
  explanation: [设公比为 $q$，则 $S_4-S_2=q^2 S_2$，所以 $q^2=(6-4)/4=1/2$。
    因此 $S_6-S_4=q^2(S_4-S_2)=1$，得 $S_6=7$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [将 3 个 $1$ 和 2 个 $0$ 随机排成一行，则 2 个 $0$ 不相邻的概率为#choice-placeholder()。],
  choices: ([$0.3$], [$0.5$], [$0.6$], [$0.8$]),
  answers: ([C],),
  explanation: [从 $5$ 个位置中选 $2$ 个放 $0$，共有 $binom(5, 2)=10$ 种等可能排法。
    若两个 $0$ 不相邻，则在 $3$ 个 $1$ 形成的 $4$ 个空位中任选 $2$ 个，共 $binom(4, 2)=6$ 种，故概率为 $6/10=0.6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $alpha in (0,pi/2)$，$tan 2alpha=(cos alpha)/(2-sin alpha)$，则 $tan alpha=$#choice-placeholder()。],
  choices: ([$sqrt(15)/15$], [$sqrt(5)/5$], [$sqrt(5)/3$], [$sqrt(15)/3$]),
  answers: ([A],),
  explanation: [∵ $cos alpha>0$，利用二倍角公式约去 $cos alpha$，得
    $ (2 sin alpha)/(1-2sin^2 alpha)=1/(2-sin alpha). $
    交叉相乘，得 $4sin alpha=1$，故 $sin alpha=1/4,cos alpha=sqrt(15)/4$，所以 $tan alpha=sqrt(15)/15$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $f(x)$ 是定义域为 $RR$ 的奇函数，且 $f(1+x)=f(-x)$。若 $f(-1/3)=1/3$，则 $f(5/3)=$#choice-placeholder()。],
  choices: ([$-5/3$], [$-1/3$], [$1/3$], [$5/3$]),
  answers: ([C],),
  explanation: [由奇函数性质，$f(1+x)=f(-x)=-f(x)$，从而 $f(x+2)=-f(x+1)=f(x)$。
    故 $f(5/3)=f(-1/3+2)=f(-1/3)=1/3$。],
)

#section[填空题]
#question(
  "fill-in",
  score: 5,
  stem: [若向量 $bold(a),bold(b)$ 满足 $|bold(a)|=3,|bold(a)-bold(b)|=5,bold(a) dot bold(b)=1$，则 $|bold(b)|=$#fill-placeholder()。],
  answers: ([$3sqrt(2)$],),
  explanation: [由 $|bold(a)-bold(b)|^2=|bold(a)|^2+|bold(b)|^2-2bold(a) dot bold(b)$，得 $25=9+|bold(b)|^2-2$，故 $|bold(b)|^2=18$，所以 $|bold(b)|=3sqrt(2)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知一个圆锥的底面半径为 $6$，其体积为 $30pi$，则该圆锥的侧面积为#fill-placeholder()。],
  answers: ([$39pi$],),
  explanation: [由 $1/3 pi times 6^2 h=30pi$，得高 $h=5/2$。
    母线长 $l=sqrt(6^2+(5/2)^2)=13/2$，故侧面积 $S=pi r l=pi times 6 times 13/2=39pi$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=2cos(omega x+phi)$ 的部分图象如图所示，则 $f(pi/2)=$#fill-placeholder()。
    #figure(cosine-diagram())],
  answers: ([$-sqrt(3)$],),
  explanation: [由图象，$3T/4=(13pi)/12-pi/3=3pi/4$，得周期 $T=pi$。
    结合 $x=pi/3$ 处图象向下穿过横轴，可将函数写成 $f(x)=2cos(2x-pi/6)$。
    因此 $f(pi/2)=2cos(5pi/6)=-sqrt(3)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $F_1,F_2$ 为椭圆 $C:x^2/16+y^2/4=1$ 的两个焦点，$P,Q$ 为 $C$ 上关于坐标原点对称的两点，且 $|P Q|=|F_1 F_2|$，则四边形 $P F_1 Q F_2$ 的面积为#fill-placeholder()。],
  answers: ([$8$],),
  explanation: [两条对角线 $P Q,F_1 F_2$ 互相平分且等长，因此四边形为矩形。设相邻两边长为 $m,n$，由椭圆定义得 $m+n=8$。
    又 $c^2=16-4=12$，故 $m^2+n^2=(2c)^2=48$，从而面积 $m n=((m+n)^2-(m^2+n^2))/2=(64-48)/2=8$。],
)


#section[解答题]
#question(
  "solution",
  score: 12,
  stem: [甲、乙两台机床生产同种产品，产品质量分为一级品和二级品，为了比较两台机床产品的质量，分别用两台机床各生产了 200 件产品，产品的质量情况统计如下表：
    #table(
      columns: 4,
      align: center,
      [], [一级品], [二级品], [合计],
      [甲机床], [150], [50], [200],
      [乙机床], [120], [80], [200],
      [合计], [270], [130], [400],
    )
    附：$K^2=(n(a d-b c)^2)/((a+b)(c+d)(a+c)(b+d))$。
    #table(
      columns: 4,
      align: center,
      [$P(K^2>=k)$], [0.050], [0.010], [0.001],
      [$k$], [3.841], [6.635], [10.828],
    )],
  parts: (
    subquestion(
      stem: [甲机床、乙机床生产的产品中一级品的频率分别是多少？],
      answers: ([$75%$；$60%$。],),
      explanation: [甲机床为 $150/200=75%$，乙机床为 $120/200=60%$。],
    ),
    subquestion(
      stem: [能否有 99% 的把握认为甲机床的产品质量与乙机床的产品质量有差异？],
      answers: ([能。],),
      explanation: [由列联表，
        $
          K^2=(400(150 times 80-50 times 120)^2)/(200 times 200 times 270 times 130)=400/39 approx 10.256>6.635.
        $
        因此有 $99%$ 的把握认为两台机床的产品质量有差异。],
    ),
  ),
)

#question(
  "solution",
  score: 12,
  stem: [记 $S_n$ 为数列 $\{a_n\}$ 的前 $n$ 项和。已知 $a_n>0,a_2=3a_1$，且数列 $\{sqrt(S_n)\}$ 是等差数列，证明：$\{a_n\}$ 是等差数列。],
  answers: ([证明见解析。],),
  explanation: [由 $S_1=a_1,S_2=a_1+a_2=4a_1$，得 $\{sqrt(S_n)\}$ 的首项和公差均为 $sqrt(a_1)$。
    因此 $sqrt(S_n)=n sqrt(a_1)$，即 $S_n=n^2 a_1$。
    当 $n>=2$ 时，$a_n=S_n-S_(n-1)=(2n-1)a_1$；当 $n=1$ 时，该式也成立。
    故对所有正整数 $n$，$a_(n+1)-a_n=2a_1$，所以 $\{a_n\}$ 是等差数列。],
)
#question(
  "solution",
  score: 12,
  stem: [已知直三棱柱 $A B C-A_1 B_1 C_1$ 中，侧面 $A A_1 B_1 B$ 为正方形，$A B=B C=2$，$E,F$ 分别为 $A C$ 和 $C C_1$ 的中点，$B F perp A_1 B_1$。
    #figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [求三棱锥 $F-E B C$ 的体积；],
      answers: ([$1/3$。],),
      explanation: [由 $A B parallel A_1 B_1$，得 $A B perp B F$。又直棱柱中 $A B perp B B_1$，而 $B F inter B B_1={B}$，所以 $A B perp "平面" B B_1 C_1 C$，从而 $A B perp B C$。
        因此 $S_(triangle A B C)=1/2 times 2 times 2=2$。$E$ 是 $A C$ 的中点，故 $S_(triangle E B C)=1$。
        侧棱长为 $2$，$F$ 为 $C C_1$ 中点，故 $F$ 到底面的距离为 $F C=1$，所以 $V_(F-E B C)=1/3 times 1 times 1=1/3$。],
    ),
    subquestion(
      stem: [已知 $D$ 为棱 $A_1 B_1$ 上的点，证明：$B F perp D E$。],
      answers: ([证明见解析。],),
      explanation: [取 $B C$ 的中点 $N$，连接 $B_1 N,E N$。
        #figure(prism-diagram(auxiliary: true))
        #step[证明辅助线与 $B F$ 垂直][侧面 $B B_1 C_1 C$ 为正方形，且 $B C=B B_1=2,C F=B N=1$，所以直角三角形 $B C F$ 与 $B_1 B N$ 全等，得 $angle C B F=angle B B_1 N$。
          又 $angle B B_1 N+angle B N B_1=90 degree$，故 $angle C B F+angle B N B_1=90 degree$，从而 $B F perp B_1 N$。]
        #step[由线面垂直推出结论][已知 $B F perp A_1 B_1$，且 $A_1 B_1 inter B_1 N={B_1}$，所以 $B F perp "平面" A_1 B_1 N$。
          $E,N$ 为 $A C,B C$ 的中点，故 $E N parallel A B parallel A_1 B_1$，因此 $E$ 在平面 $A_1 B_1 N$ 内。
          又 $D$ 在 $A_1 B_1$ 上，所以 $D E$ 在该平面内，故 $B F perp D E$。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设函数 $f(x)=a^2 x^2+a x-3ln x+1$，其中 $a>0$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性；],
      answers: ([在 $(0,1/a)$ 上递减，在 $(1/a,+infinity)$ 上递增。],),
      explanation: [定义域为 $(0,+infinity)$，且
        $ f'(x)=2a^2 x+a-3/x=((2a x+3)(a x-1))/x. $
        因为 $a>0,x>0$，故导数的符号与 $a x-1$ 相同。
        因此 $f$ 在 $(0,1/a)$ 上递减，在 $(1/a,+infinity)$ 上递增。],
    ),
    subquestion(
      stem: [若 $y=f(x)$ 的图象与 $x$ 轴没有公共点，求 $a$ 的取值范围。],
      answers: ([$(1/e,+infinity)$。],),
      explanation: [由上一问，全局最小值为 $f(1/a)=3+3ln a$。
        又 $f$ 在定义域内连续，且 $f(1)=a^2+a+1>0$，故若最小值不大于 $0$，由零点存在定理或最小值点本身可知图象与 $x$ 轴有公共点。
        反之，最小值大于 $0$ 时显然没有公共点。因此所求条件等价于 $3+3ln a>0$，解得 $a>1/e$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [抛物线 $C$ 的顶点为坐标原点 $O$，焦点在 $x$ 轴上，直线 $l:x=1$ 交 $C$ 于 $P,Q$ 两点，且 $O P perp O Q$。已知点 $M(2,0)$，且 $⊙M$ 与 $l$ 相切。],
  parts: (
    subquestion(
      stem: [求 $C,⊙M$ 的方程；],
      answers: ([$C:y^2=x$，$⊙M:(x-2)^2+y^2=1$。],),
      explanation: [抛物线开口向右，设其方程为 $y^2=2p x$（$p>0$）。则 $P,Q$ 的坐标可取 $(1,sqrt(2p)),(1,-sqrt(2p))$。
        由 $arrow(O P) dot arrow(O Q)=1-2p=0$，得 $2p=1$，所以 $C:y^2=x$。
        圆心 $M(2,0)$ 到直线 $x=1$ 的距离为 $1$，故圆的方程为 $(x-2)^2+y^2=1$。],
    ),
    subquestion(
      stem: [设 $A_1,A_2,A_3$ 是 $C$ 上的三个点，直线 $A_1 A_2,A_1 A_3$ 均与 $⊙M$ 相切。判断 $A_2 A_3$ 与 $⊙M$ 的位置关系，并说明理由。],
      answers: ([相切。],),
      explanation: [设 $A_i=(t_i^2,t_i)$（$i=1,2,3$）。任意两点所连的直线方程统一为
        $ A_i A_j:x-(t_i+t_j)y+t_i t_j=0, $
        该式在 $t_i+t_j=0$ 时也成立，此时直线竖直。
        #step[将两条切线的条件转为直线方程][圆心 $(2,0)$ 到 $A_1 A_j$ 的距离为 $1$，故
          $ (2+t_1 t_j)^2=1+(t_1+t_j)^2,quad j=2,3. $
          整理得 $(t_1^2-1)t_j^2+2t_1 t_j+3-t_1^2=0$。
          因为 $A_j=(t_j^2,t_j)$，所以 $A_2,A_3$ 均在直线
          $ (t_1^2-1)x+2t_1 y+3-t_1^2=0 $
          上，即这就是 $A_2 A_3$ 的方程；两个一次项系数不可能同时为零。]
        #step[计算圆心到第三条直线的距离][
          $
            d=(|2(t_1^2-1)+3-t_1^2|)/sqrt((t_1^2-1)^2+4t_1^2)=(t_1^2+1)/(t_1^2+1)=1.
          $
          距离等于圆的半径，故 $A_2 A_3$ 与 $⊙M$ 相切。]
      ],
    ),
  ),
)


#section[选考题：请从第 22、23 题中任选一题作答。]
#question(
  "solution",
  score: 10,
  stem: [在直角坐标系 $x O y$ 中，以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，曲线 $C$ 的极坐标方程为 $rho=2sqrt(2) cos theta$。],
  parts: (
    subquestion(
      stem: [将 $C$ 的极坐标方程化为直角坐标方程；],
      answers: ([$(x-sqrt(2))^2+y^2=2$。],),
      explanation: [两边乘以 $rho$，利用 $rho^2=x^2+y^2,rho cos theta=x$，得 $x^2+y^2=2sqrt(2)x$，即 $(x-sqrt(2))^2+y^2=2$。原点也在两种方程表示的曲线上。],
    ),
    subquestion(
      stem: [设点 $A$ 的直角坐标为 $(1,0)$，$M$ 为 $C$ 上的动点，点 $P$ 满足 $arrow(A P)=sqrt(2) arrow(A M)$，写出 $P$ 的轨迹 $C_1$ 的参数方程，并判断 $C$ 与 $C_1$ 是否有公共点。],
      answers: (
        [$cases(x=3-sqrt(2)+2cos t, y=2sin t)$（$t$ 为参数，$0<=t<2pi$）；两曲线没有公共点。],
      ),
      explanation: [设 $M=(sqrt(2)+sqrt(2) cos t,sqrt(2) sin t)$，由向量关系得
        $ P=(1,0)+sqrt(2)(M-(1,0))=(3-sqrt(2)+2cos t,2sin t). $
        因而参数方程如答案。$C_1$ 的圆心为 $(3-sqrt(2),0)$，半径为 $2$；$C$ 的圆心为 $(sqrt(2),0)$，半径为 $sqrt(2)$。
        圆心距为 $3-2sqrt(2)<2-sqrt(2)$，小于半径之差，因此两圆内含，没有公共点。],
    ),
  ),
)

#question(
  "solution",
  score: 10,
  stem: [已知函数 $f(x)=|x-2|$，$g(x)=|2x+3|-|2x-1|$。
    #figure(absolute-diagram())],
  parts: (
    subquestion(
      stem: [画出 $y=f(x)$ 和 $y=g(x)$ 的图象；],
      answers: ([图象见解析，实线表示 $f$，虚线表示 $g$。],),
      explanation: [去绝对值，得
        $
          f(x)=cases(2-x & quad x<2, x-2 & quad x>=2),quad
          g(x)=cases(-4 & quad x< -3/2, 4x+2 & quad -3/2<=x<1/2, 4 & quad x>=1/2).
        $
        #figure(absolute-diagram(solved: true))],
    ),
    subquestion(
      stem: [若 $f(x+a)>=g(x)$，求 $a$ 的取值范围。],
      answers: ([$[11/2,+infinity)$。],),
      explanation: [题意要求不等式对所有实数 $x$ 成立。
        #step[必要性][若 $a<=3/2$，取 $x=2-a>=1/2$，则 $f(x+a)=0<4=g(x)$，矛盾，故 $a>3/2$。
          再取 $x=1/2$，得 $|a-3/2|=a-3/2>=4$，所以 $a>=11/2$。]
        #step[充分性][设 $a>=11/2$。当 $x<=-1/2$ 时，$g(x)<=0<=f(x+a)$。
          当 $-1/2<x<1/2$ 时，$x+a-2>0$，故
          $ f(x+a)-g(x)=x+a-2-(4x+2)=a-4-3x>=3/2-3x>0. $
          当 $x>=1/2$ 时，$f(x+a)=x+a-2>=4=g(x)$。
          综上，$a in [11/2,+infinity)$。]
      ],
    ),
  ),
)

