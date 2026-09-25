#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校招生全国统一考试",
  name: "全国甲卷（理科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2021/2021全国甲理(云南,广西,贵州,西藏,四川).pdf",
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
#let height-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  let s = calc.sqrt(3)
  let cp = (0, 0, 0)
  let bp = (2 + s, 0, 0)
  let ap = ((3 + s) / 2, (3 + s) / 2, 0)
  let c = (0, 0, 0.7)
  let b = (2 + s, 0, 1.7)
  let a = ((3 + s) / 2, (3 + s) / 2, 2.7 + s)
  oblique-project((1, 0), (0.25, 0.3), (0, 0.7), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(c, a, b, c, cp, bp, b)
    line(cp, ap, bp, stroke: (dash: figure-style.dash))
    line(a, ap, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "south"),
      (b, $B$, "west"),
      (c, $C$, "east"),
      (ap, $A'$, "north-east"),
      (bp, $B'$, "north"),
      (cp, $C'$, "north"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
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
#let prism-diagram() = cetz.canvas(length: 18mm, {
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
  stem: [设集合 $M={x | 0<x<4},N={x | 1/3<=x<=5}$，则 $M inter N=$#choice-placeholder()。],
  choices: (
    [$\{x | 0<x<=1/3\}$],
    [$\{x | 1/3<=x<4\}$],
    [$\{x | 4<=x<5\}$],
    [$\{x | 0<x<=5\}$],
  ),
  answers: ([B],),
  explanation: [同时满足两个集合的条件，得 $1/3<=x<4$，故 $M inter N={x | 1/3<=x<4}$。],
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
  stem: [青少年视力是社会普遍关注的问题，视力情况可借助视力表测量。通常用五分记录法和小数记录法记录视力数据，五分记录法的数据 $L$ 和小数记录法的数据 $V$ 满足 $L=5+lg V$。已知某同学视力的五分记录法的数据为 $4.9$，则其视力的小数记录法的数据约为（$root(10, 10) approx 1.259$）#choice-placeholder()。],
  choices: ([$1.5$], [$1.2$], [$0.8$], [$0.6$]),
  answers: ([C],),
  explanation: [$lg V=4.9-5=-0.1$，故 $V=10^(-0.1)=1/root(10, 10) approx 1/1.259 approx 0.8$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $F_1,F_2$ 是双曲线 $C$ 的两个焦点，$P$ 为 $C$ 上一点，且 $angle F_1 P F_2=60 degree$，$|P F_1|=3|P F_2|$，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$sqrt(7)/2$], [$sqrt(13)/2$], [$sqrt(7)$], [$sqrt(13)$]),
  answers: ([A],),
  explanation: [设双曲线的实半轴长、半焦距分别为 $a,c$。由双曲线定义，$|P F_1|-|P F_2|=2a$，结合倍数关系得 $|P F_2|=a,|P F_1|=3a$。
    由余弦定理，$4c^2=9a^2+a^2-6a^2 cos 60 degree=7a^2$，所以 $e=c/a=sqrt(7)/2$。],
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
  stem: [等比数列 $\{a_n\}$ 的公比为 $q$，前 $n$ 项和为 $S_n$。设甲：$q>0$，乙：$\{S_n\}$ 是递增数列，则#choice-placeholder()。],
  choices: (
    [甲是乙的充分条件但不是必要条件],
    [甲是乙的必要条件但不是充分条件],
    [甲是乙的充要条件],
    [甲既不是乙的充分条件也不是乙的必要条件],
  ),
  answers: ([B],),
  explanation: [若 $\{S_n\}$ 递增，则 $a_2=S_2-S_1>0,a_3=S_3-S_2>0$，所以 $q=a_3/a_2>0$，即乙能推出甲。
    反之，取 $a_n=-2^n$，则 $q=2>0$，但 $S_(n+1)-S_n=a_(n+1)<0$，乙不成立。因此甲是乙的必要条件但不是充分条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [2020 年 12 月 8 日，中国和尼泊尔联合公布珠穆朗玛峰最新高程为 $8848.86$（单位：m），三角高程测量法是珠峰高程测量方法之一。如图是三角高程测量法的一个示意图，现有 $A,B,C$ 三点，且 $A,B,C$ 在同一水平面上的投影 $A',B',C'$ 满足 $angle A' C' B'=45 degree$，$angle A' B' C'=60 degree$。由 $C$ 点测得 $B$ 点的仰角为 $15 degree$，$B B'$ 与 $C C'$ 的差为 $100$；由 $B$ 点测得 $A$ 点的仰角为 $45 degree$，则 $A,C$ 两点到水平面 $A' B' C'$ 的高度差 $A A'-C C'$ 约为（$sqrt(3) approx 1.732$）#choice-placeholder()。
    #figure(height-diagram())],
  choices: ([$346$], [$373$], [$446$], [$473$]),
  answers: ([B],),
  explanation: [由仰角与高度差，水平距离 $B' C'=100/(tan 15 degree)$。
    在 $triangle A' B' C'$ 中，$angle A'=75 degree$，由正弦定理得
    $
      A' B'=(100 sin 45 degree)/(tan 15 degree sin 75 degree)=(100 sin 45 degree)/(sin 15 degree)=100(sqrt(3)+1).
    $
    又 $A A'-B B'=A' B' tan 45 degree=A' B'$，故
    $ A A'-C C'=100(sqrt(3)+1)+100=100(sqrt(3)+2) approx 373. $],
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
  stem: [将 4 个 $1$ 和 2 个 $0$ 随机排成一行，则 2 个 $0$ 不相邻的概率为#choice-placeholder()。],
  choices: ([$1/3$], [$2/5$], [$2/3$], [$4/5$]),
  answers: ([C],),
  explanation: [从 $6$ 个位置中选出 $2$ 个放 $0$，共 $binom(6, 2)=15$ 种等可能排法。
    两个 $0$ 不相邻时，可在 $4$ 个 $1$ 形成的 $5$ 个空位中选择 $2$ 个，共 $binom(5, 2)=10$ 种，故概率为 $10/15=2/3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $A,B,C$ 是半径为 $1$ 的球 $O$ 的球面上的三个点，且 $A C perp B C$，$A C=B C=1$，则三棱锥 $O-A B C$ 的体积为#choice-placeholder()。],
  choices: ([$sqrt(2)/12$], [$sqrt(3)/12$], [$sqrt(2)/4$], [$sqrt(3)/4$]),
  answers: ([A],),
  explanation: [直角三角形 $A B C$ 的斜边 $A B=sqrt(2)$，外接圆半径为 $r=sqrt(2)/2$，故球心 $O$ 到平面 $A B C$ 的距离为 $h=sqrt(1-r^2)=sqrt(2)/2$。
    因而 $V=1/3 times 1/2 times 1 times 1 times sqrt(2)/2=sqrt(2)/12$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)$ 的定义域为 $RR$，$f(x+1)$ 为奇函数，$f(x+2)$ 为偶函数，当 $x in [1,2]$ 时，$f(x)=a x^2+b$。若 $f(0)+f(3)=6$，则 $f(9/2)=$#choice-placeholder()。],
  choices: ([$-9/4$], [$-3/2$], [$7/4$], [$5/2$]),
  answers: ([D],),
  explanation: [由奇偶性，$f(2-x)=-f(x)$，$f(4-x)=f(x)$。
    取 $x=1$，得 $f(1)=0$，故 $a+b=0$。又 $f(3)=f(1)=0$，$f(0)=-f(2)=-(4a+b)=6$，解得 $a=-2,b=2$。
    再用两种对称关系，得
    $ f(9/2)=f(-1/2)=-f(5/2)=-f(3/2)=5/2. $],
)

#section[填空题]
#question(
  "fill-in",
  score: 5,
  stem: [曲线 $y=(2x-1)/(x+2)$ 在点 $(-1,-3)$ 处的切线方程为#fill-placeholder()。],
  answers: ([$5x-y+2=0$],),
  explanation: [$y'=5/(x+2)^2$，在 $x=-1$ 时切线斜率为 $5$，故切线为 $y+3=5(x+1)$，即 $5x-y+2=0$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)=(3,1),bold(b)=(1,0),bold(c)=bold(a)+k bold(b)$。若 $bold(a) perp bold(c)$，则 $k=$#fill-placeholder()。],
  answers: ([$-10/3$],),
  explanation: [$bold(c)=(3+k,1)$。由垂直条件，$bold(a) dot bold(c)=3(3+k)+1=0$，解得 $k=-10/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $F_1,F_2$ 为椭圆 $C:x^2/16+y^2/4=1$ 的两个焦点，$P,Q$ 为 $C$ 上关于坐标原点对称的两点，且 $|P Q|=|F_1 F_2|$，则四边形 $P F_1 Q F_2$ 的面积为#fill-placeholder()。],
  answers: ([$8$],),
  explanation: [两条对角线 $P Q,F_1 F_2$ 互相平分且等长，因此四边形为矩形。设相邻两边长为 $m,n$，由椭圆定义得 $m+n=8$。
    又 $c^2=16-4=12$，故 $m^2+n^2=(2c)^2=48$，从而面积 $m n=((m+n)^2-(m^2+n^2))/2=(64-48)/2=8$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=2cos(omega x+phi)$ 的部分图象如图所示，则满足条件
    $ (f(x)-f(-(7pi)/4))(f(x)-f((4pi)/3))>0 $
    的最小正整数 $x$ 为#fill-placeholder()。
    #figure(cosine-diagram())],
  answers: ([$2$],),
  explanation: [由图象，$3T/4=(13pi)/12-pi/3=3pi/4$，故周期为 $pi$，可将函数写成 $f(x)=2cos(2x-pi/6)$。
    $ f(-(7pi)/4)=1,quad f((4pi)/3)=0. $
    因此原条件等价于 $f(x)>1$ 或 $f(x)<0$。
    因为 $pi/3<2-pi/6<pi/2$，所以 $0<f(1)<1$，$x=1$ 不满足。
    又 $pi/2<4-pi/6<3pi/2$，所以 $f(2)<0$，故最小正整数为 $2$。],
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
  stem: [已知数列 $\{a_n\}$ 的各项均为正数，记 $S_n$ 为 $\{a_n\}$ 的前 $n$ 项和，从下面①②③中选取两个作为条件，证明另外一个成立。

    ①数列 $\{a_n\}$ 是等差数列；\
    ②数列 $\{sqrt(S_n)\}$ 是等差数列；\
    ③ $a_2=3a_1$。],
  answers: ([三种组合均成立，证明见解析。],),
  explanation: [
    #step[选①③，证明②][由 $a_2=3a_1$，得公差 $d=2a_1$，故 $S_n=n a_1+n(n-1)/2 dot 2a_1=n^2 a_1$。
      因此 $sqrt(S_n)=n sqrt(a_1)$，是公差为 $sqrt(a_1)$ 的等差数列。]
    #step[选②③，证明①][由 $S_1=a_1,S_2=4a_1$，得 $\{sqrt(S_n)\}$ 的首项和公差均为 $sqrt(a_1)$，所以 $S_n=n^2 a_1$。
      当 $n>=2$ 时，$a_n=S_n-S_(n-1)=(2n-1)a_1$；$n=1$ 时也满足该式，故 $\{a_n\}$ 是等差数列。]
    #step[选①②，证明③][因为 $a_n>0$，所以 $S_n$ 严格递增，设 $sqrt(S_n)=u n+v$，其中 $u>0$。
      当 $n>=2$ 时，$a_n=(u n+v)^2-(u(n-1)+v)^2=2u^2 n+2u v-u^2$。
      由①，该数列的公差必为 $2u^2$，且首项应为 $u^2+2u v$。另一方面 $a_1=S_1=(u+v)^2$，比较得 $v^2=0$。
      故 $a_1=u^2,a_2=3u^2=3a_1$，③成立。]
  ],
)
#question(
  "solution",
  score: 12,
  stem: [已知直三棱柱 $A B C-A_1 B_1 C_1$ 中，侧面 $A A_1 B_1 B$ 为正方形，$A B=B C=2$，$E,F$ 分别为 $A C$ 和 $C C_1$ 的中点，$D$ 为棱 $A_1 B_1$ 上的点，$B F perp A_1 B_1$。
    #figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [证明：$B F perp D E$；],
      answers: ([证明见解析。],),
      explanation: [由 $A B parallel A_1 B_1$，得 $A B perp B F$。又直棱柱中 $A B perp B B_1$，而 $B F,B B_1$ 是侧面内两条相交直线，故 $A B perp "平面" B B_1 C_1 C$。
        以 $B$ 为原点，$B A,B C,B B_1$ 的方向为三个坐标轴的正方向，得
        $ B=(0,0,0),quad A=(2,0,0),quad C=(0,2,0),quad B_1=(0,0,2). $
        设 $t=B_1 D in [0,2]$，则 $D=(t,0,2),E=(1,1,0),F=(0,2,1)$。所以
        $
          arrow(B F)=(0,2,1),quad arrow(D E)=(1-t,1,-2),quad arrow(B F) dot arrow(D E)=0.
        $
        因此 $B F perp D E$。],
    ),
    subquestion(
      stem: [当 $B_1 D$ 为何值时，面 $B B_1 C_1 C$ 与面 $D E F$ 所成的二面角正弦值最小？],
      answers: ([$B_1 D=1/2$，此时正弦最小值为 $sqrt(3)/3$。],),
      explanation: [沿用上一问的坐标。平面 $B B_1 C_1 C$ 的法向量可取 $bold(n)=(1,0,0)$。
        ∵ $arrow(E F)=(-1,1,1),arrow(D E)=(1-t,1,-2)$，∴平面 $D E F$ 的法向量可取 $bold(m)=(3,1+t,2-t)$。
        二面角与法向量夹角相等或互补，其正弦相同。设所求角为 $theta$，则
        $
          sin^2 theta=1-(bold(m) dot bold(n))^2/(|bold(m)|^2 |bold(n)|^2)=1-9/(2t^2-2t+14).
        $
        分母 $2t^2-2t+14=2(t-1/2)^2+27/2$ 在 $t=1/2$ 时最小，因此 $sin theta$ 在 $B_1 D=1/2$ 时最小，最小值为 $sqrt(1-9/(27/2))=sqrt(3)/3$。],
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
#question(
  "solution",
  score: 12,
  stem: [已知 $a>0$ 且 $a!=1$，函数 $f(x)=x^a/a^x$（$x>0$）。],
  parts: (
    subquestion(
      stem: [若 $a=2$，求 $f(x)$ 的单调区间；],
      answers: (
        [在 $(0,2/(ln 2))$ 上递增，在 $(2/(ln 2),+infinity)$ 上递减。],
      ),
      explanation: [$f(x)=x^2/2^x$，故 $f'(x)=x(2-x ln 2)/2^x$。
        由于 $x>0$，导数在 $0<x<2/(ln 2)$ 时为正，在 $x>2/(ln 2)$ 时为负，故递增区间为 $(0,2/(ln 2))$，递减区间为 $(2/(ln 2),+infinity)$。],
    ),
    subquestion(
      stem: [若曲线 $y=f(x)$ 与直线 $y=1$ 有且仅有两个交点，求 $a$ 的取值范围。],
      answers: ([$(1,e) union (e,+infinity)$。],),
      explanation: [两边取对数，$f(x)=1$ 等价于
        $ h(x)=h(a),quad h(x)=(ln x)/x. $
        #step[确定辅助函数的值域与单调性][$h'(x)=(1-ln x)/x^2$，故 $h$ 在 $(0,e)$ 上严格递增，在 $(e,+infinity)$ 上严格递减，最大值为 $1/e$。
          又 $h(1)=0$，当 $x arrow.r 0^+$ 时 $h(x) arrow.r -infinity$，当 $x arrow.r +infinity$ 时 $h(x) arrow.r 0^+$。]
        #step[按参数确定交点个数][若 $0<a<1$，则 $h(a)<0$，水平线与 $h$ 只有一个交点。
          若 $a=e$，水平线经过唯一最大值点，也只有一个交点。
          若 $a>1$ 且 $a!=e$，则 $0<h(a)<1/e$，在 $(1,e)$ 与 $(e,+infinity)$ 上各有一个交点。
          所以 $a in (1,e) union (e,+infinity)$。]
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
