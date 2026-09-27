#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016全国1理(河南,河北,山西,江西,湖北,湖南,广东,安徽,福建).pdf",
  regions: (
    "河南",
    "河北",
    "山西",
    "江西",
    "湖北",
    "湖南",
    "广东",
    "安徽",
    "福建",
  ),
)

#let views() = cetz.canvas(length: 11mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (center, u, v) in (
    ((0, 2), (-0.75, 2), (0, 2.75)),
    ((2, 2), (2, 2.75), (2.75, 2)),
    ((0, 0), (-0.75, 0), (0, -0.75)),
  ) {
    circle(center, radius: 0.75)
    line(u, center, v)
  }
})
#let choice-graph(kind) = {
  set text(size: 9pt)
  cetz.canvas(length: 9mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $O$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      x: (
        tick: (
          label: (
            anchor: if kind == 0 { "south" } else { "north" },
            offset: if kind == 0 { -0.3cm } else { 0.15cm },
          ),
        ),
      ),
    ))
    let f = if kind == 0 { x => -calc.abs(x * x - 2.56) / 2.56 } else if (
      kind == 1
    ) { x => 2.5 * x * x - calc.exp(calc.abs(x)) } else if kind == 2 {
      x => 0.4 * x * x - 1
    } else { x => 2 * x * x - calc.exp(calc.abs(x)) }
    plot.plot(
      size: (4.8, 3.2),
      axis-style: "school-book",
      x-min: -2.5,
      x-max: 2.5,
      y-min: -1.7,
      y-max: 2.8,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (-2, 2),
      y-ticks: (1,),
      {
        plot.add(f, domain: (-2, 2), samples: 161, style: (
          stroke: (paint: black, thickness: figure-style.thickness),
        ))
      },
    )
  })
}
#let loop-chart() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.65, -0.35), (0.65, 0.35), radius: 0.18)
  content((0, 0), text(size: 9pt)[开始])
  line((-1.6, -1.9), (1.4, -1.9), (1.6, -1.1), (-1.4, -1.1), close: true)
  content((0, -1.5), text(size: 9pt)[输入 $x,y,n$])
  rect((-2.4, -3.5), (2.4, -2.5))
  content((0, -3), text(size: 9pt)[$x=x+(n-1)/2,y=n y$])
  line((0, -4.2), (2.1, -4.9), (0, -5.6), (-2.1, -4.9), close: true)
  content((0, -4.9), text(size: 9pt)[$x^2+y^2>=36$])
  rect((-5, -3.4), (-2.8, -2.6))
  content((-3.9, -3), text(size: 9pt)[$n=n+1$])
  line((-1.4, -7), (1.2, -7), (1.4, -6.2), (-1.2, -6.2), close: true)
  content((0, -6.6), text(size: 9pt)[输出 $x,y$])
  rect((-0.65, -8.5), (0.65, -7.8), radius: 0.18)
  content((0, -8.15), text(size: 9pt)[结束])
  for (a, b) in (
    ((0, -0.35), (0, -1.1)),
    ((0, -1.9), (0, -2.5)),
    ((0, -3.5), (0, -4.2)),
    ((0, -5.6), (0, -6.2)),
    ((0, -7), (0, -7.8)),
  ) {
    line(a, b, mark: (end: ">"))
  }
  line((-2.1, -4.9), (-3.9, -4.9), (-3.9, -3.4), mark: (end: ">"))
  line((-3.9, -2.6), (-3.9, -2.2), (0, -2.2), mark: (end: ">"))
  content((-2.35, -5), text(size: 9pt)[否], anchor: "north")
  content((0.15, -5.9), text(size: 9pt)[是], anchor: "west")
})
#let polyhedron() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let F = (0, 0, 0)
  let E = (4, 0, 0)
  let A = (0, 4, 0)
  let B = (4, 4, 0)
  let D = (1, 0, calc.sqrt(3))
  let C = (3, 0, calc.sqrt(3))
  oblique-project((1, 0.18), (0.65, -0.32), (0, 1), {
    line(F, A, B, C, D, F)
    line(A, D)
    line(F, E, B, stroke: (dash: figure-style.dash))
    line(E, C, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (A, $A$, "north"),
      (B, $B$, "west"),
      (C, $C$, "south"),
      (D, $D$, "south-east"),
      (E, $E$, "south-west"),
      (F, $F$, "east"),
    ) {
      content(p, label, anchor: anchor, padding: 4pt)
    }
  })
})
#let frequency-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 11mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $0$,
      tick: (stroke: figure-style.thickness, length: 0),
      x: (label: (anchor: "north-east", offset: 0.5)),
      y: (label: (anchor: "south", offset: 0.2)),
    ))
    plot.plot(
      size: (6, 4),
      axis-style: "school-book",
      x-min: 7.3,
      x-max: 11.8,
      x-break: true,
      y-min: 0,
      y-max: 50,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (8, 9, 10, 11),
      y-ticks: (20, 40),
      x-label: [更换的易损零件数],
      y-label: [频数],
      {
        plot.annotate(resize: false, {
          for (x, h) in ((8, 20), (9, 40), (10, 20), (11, 20)) {
            line((x - 0.25, 0), (x - 0.25, h), (x + 0.25, h), (x + 0.25, 0))
          }
          for (x1, x2, y) in (
            (7.3, 7.75, 20),
            (8.25, 8.75, 20),
            (9.25, 9.75, 20),
            (10.25, 10.75, 20),
            (7.3, 8.75, 40),
          ) {
            line((x1, y), (x2, y), stroke: (dash: figure-style.dash))
          }
        })
      },
    )
  })
}
#let circle-triangle() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (-calc.sqrt(3), -1)
  let B = (calc.sqrt(3), -1)
  let O = (0, 0)
  let C = (0.8, 0.6)
  let D = (-0.8, 0.6)
  circle(O, radius: 1)
  line(A, O, B, A)
  line(D, C)
  for (p, label, anchor) in (
    (A, $A$, "north-east"),
    (B, $B$, "north-west"),
    (O, $O$, "south"),
    (C, $C$, "south-west"),
    (D, $D$, "south-east"),
  ) {
    content(p, label, anchor: anchor, padding: 4pt)
  }
})
#let absolute-graph(solution: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $O$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
        length: 0,
      ),
      grid: (stroke: (paint: luma(75%), thickness: figure-style.thickness)),
    ))
    let ticks = range(-7, 8)
      .filter(i => i != 0)
      .map(i => (i, if i == 1 { $1$ } else { [] }))
    plot.plot(
      size: (7, 7),
      axis-style: "school-book",
      x-min: -7,
      x-max: 7,
      y-min: -7,
      y-max: 7,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: ticks,
      y-ticks: ticks,
      x-grid: true,
      y-grid: true,
      {
        plot.annotate(resize: false, {
          if solution {
            line((-3, -7), (-1, -5), (1.5, 2.5), (7, -3))
            content((-1, -5), $(-1,-5)$, anchor: "north-west", padding: 3pt)
            content((1.5, 2.5), $(3/2,5/2)$, anchor: "south-west", padding: 3pt)
          }
        })
      },
    )
  })
}

#section[选择题：共 12 题，每题 5 分，共 60 分。每题只有一个选项符合题意。]

#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={x|x^2-4x+3<0}$，$B={x|2x-3>0}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([$(-3,-3/2)$], [$(-3,3/2)$], [$(1,3/2)$], [$(3/2,3)$]),
  answers: ([D],),
  explanation: [$A=(1,3)$，$B=(3/2,+infinity)$，故 $A inter B=(3/2,3)$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $(1+upright(i))x=1+y upright(i)$，其中 $x,y$ 是实数，则 $abs(x+y upright(i))=$#choice-placeholder()。],
  choices: ([$1$], [$sqrt(2)$], [$sqrt(3)$], [$2$]),
  answers: ([B],),
  explanation: [比较实部与虚部，得 $x=1$、$y=x=1$，所以 $abs(x+y upright(i))=sqrt(1^2+1^2)=sqrt(2)$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知等差数列 ${a_n}$ 前 $9$ 项的和为 $27$，$a_10=8$，则 $a_100=$#choice-placeholder()。],
  choices: ([$100$], [$99$], [$98$], [$97$]),
  answers: ([C],),
  explanation: [由 $S_9=9a_5=27$ 得 $a_5=3$。故公差 $d=(a_10-a_5)/5=1$，于是 $a_100=a_10+90d=98$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [某公司的班车在 7:30、8:00、8:30 发车，小明在 7:50 至 8:30 之间到达发车站乘坐班车，且到达发车站的时刻是随机的，则他等车时间不超过 $10$ 分钟的概率是#choice-placeholder()。],
  choices: ([$1/3$], [$1/2$], [$2/3$], [$3/4$]),
  answers: ([B],),
  explanation: [符合要求的到达时段为 7:50 至 8:00、8:20 至 8:30，共 $20$ 分钟。总时段长 $40$ 分钟，故概率为 $20/40=1/2$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知方程 $x^2/(m^2+n)-y^2/(3m^2-n)=1$ 表示双曲线，且该双曲线两焦点间的距离为 $4$，则 $n$ 的取值范围是#choice-placeholder()。],
  choices: ([$(-1,3)$], [$(-1,sqrt(3))$], [$(0,3)$], [$(0,sqrt(3))$]),
  answers: ([A],),
  explanation: [两个分母必须同号，且其和为 $4m^2>=0$，故只能同为正数。双曲线的半焦距满足 $c^2=(m^2+n)+(3m^2-n)=4m^2$。由 $2c=4$ 得 $m^2=1$，所以 $1+n>0$ 且 $3-n>0$，即 $-1<n<3$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [如图，某几何体的三视图是三个半径相等的圆及每个圆中两条互相垂直的半径。若该几何体的体积是 $(28pi)/3$，则它的表面积是#choice-placeholder()。
    #figure(views())],
  choices: ([$17pi$], [$18pi$], [$20pi$], [$28pi$]),
  answers: ([A],),
  explanation: [该几何体是球去掉一个八分之一球体后的部分。设球半径为 $R$，由 $7/8 times 4/3 pi R^3=(28pi)/3$ 得 $R=2$。表面积包括余下的球面和三个四分之一圆面，故 $S=7/8 times 4pi R^2+3/4 pi R^2=17pi$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [函数 $y=2x^2-upright(e)^(abs(x))$ 在 $[-2,2]$ 的图象大致为#choice-placeholder()。],
  choices: (
    [#figure(choice-graph(0))],
    [#figure(choice-graph(1))],
    [#figure(choice-graph(2))],
    [#figure(choice-graph(3))],
  ),
  answers: ([D],),
  explanation: [函数为偶函数，图象关于 $y$ 轴对称，且 $f(0)=-1$、$f(2)=8-upright(e)^2 in (0,1)$，排除 A、B。
    对 $x>0$，$f'(x)=4x-upright(e)^x$，在 $0$ 的右侧为负，所以函数先下降，排除 C。
    进一步，令 $h(x)=4x-upright(e)^x$，则 $h'(x)=4-upright(e)^x$。$h$ 在 $[0,ln 4]$ 上递增，在 $[ln 4,2]$ 上递减；而 $h(0)=-1$、$h(2)>0$，故它在 $(0,2)$ 内仅有一个零点。函数在正半区间先减后增，符合 D。],
)

#question(
  "single-choice",
  score: 5,
  stem: [若 $a>b>1$，$0<c<1$，则#choice-placeholder()。],
  choices: (
    [$a^c<b^c$],
    [$a b^c<b a^c$],
    [$a log_b c<b log_a c$],
    [$log_a c<log_b c$],
  ),
  answers: ([C],),
  explanation: [∵ $c>0$，∴ $a^c>b^c$，A 错误。
    $frac(a b^c, b a^c)=(a/b)^(1-c)>1$，故 B 错误。
    又 $a ln a>b ln b>0$、$ln c<0$，所以
    $ a log_b c-b log_a c=(ln c (a ln a-b ln b))/(ln a ln b)<0, $
    故 C 正确。
    最后，$ln a>ln b>0$，故 $log_a c>log_b c$，D 错误。],
)

#question(
  "single-choice",
  score: 5,
  stem: [执行下面的程序框图，如果输入的 $x=0,y=1,n=1$，则输出 $x,y$ 的值满足#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$y=2x$], [$y=3x$], [$y=4x$], [$y=5x$]),
  answers: ([C],),
  explanation: [依次执行赋值后，$(n,x,y)$ 为 $(1,0,1)$、$(2,1/2,2)$、$(3,3/2,6)$。前两次 $x^2+y^2<36$，第三次满足 $x^2+y^2>=36$，输出 $x=3/2$、$y=6$，故 $y=4x$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [以抛物线 $C$ 的顶点为圆心的圆交 $C$ 于 $A,B$ 两点，交 $C$ 的准线于 $D,E$ 两点。已知 $abs(A B)=4sqrt(2)$，$abs(D E)=2sqrt(5)$，则 $C$ 的焦点到准线的距离为#choice-placeholder()。],
  choices: ([$2$], [$4$], [$6$], [$8$]),
  answers: ([B],),
  explanation: [不妨设抛物线为 $y^2=2p x$（$p>0$），圆为 $x^2+y^2=R^2$。
    由对称性，$A,B$ 的纵坐标为 $plus.minus 2sqrt(2)$，横坐标均为 $4/p$，故 $R^2=16/p^2+8$。
    准线为 $x=-p/2$，由弦长得 $R^2=p^2/4+5$。
    两式相等，得 $p^4-12p^2-64=0$，即 $(p^2-16)(p^2+4)=0$。故 $p=4$，即所求距离为 $4$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [平面 $alpha$ 过正方体 $A B C D-A_1 B_1 C_1 D_1$ 的顶点 $A$，$alpha parallel$ 平面 $C B_1 D_1$，$alpha inter$ 平面 $A B C D=m$，$alpha inter$ 平面 $A B B_1 A_1=n$，则 $m,n$ 所成角的正弦值为#choice-placeholder()。],
  choices: ([$sqrt(3)/2$], [$sqrt(2)/2$], [$sqrt(3)/3$], [$1/3$]),
  answers: ([A],),
  explanation: [以 $A$ 为原点，$A B,A D,A A_1$ 分别为三条坐标轴正向，设棱长为 $1$。
    则 $C=(1,1,0)$、$B_1=(1,0,1)$、$D_1=(0,1,1)$，三点所在平面为 $x+y+z=2$，所以 $alpha:x+y+z=0$。
    $m$、$n$ 的方向向量可分别取 $(1,-1,0)$、$(1,0,-1)$，其夹角余弦为 $1/2$，故两直线所成角的正弦为 $sqrt(3)/2$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=sin(omega x+phi)$（$omega>0,abs(phi)<=pi/2$），$x=-pi/4$ 为 $f(x)$ 的零点，$x=pi/4$ 为 $y=f(x)$ 图象的对称轴，且 $f(x)$ 在 $(pi/18,(5pi)/36)$ 单调，则 $omega$ 的最大值为#choice-placeholder()。],
  choices: ([$11$], [$9$], [$7$], [$5$]),
  answers: ([B],),
  explanation: [由零点和对称轴条件，有 $-omega pi/4+phi=k pi$、$omega pi/4+phi=pi/2+j pi$，其中 $j,k in ZZ$。相减得 $omega=1+2(j-k)$，故 $omega$ 是正奇数。
    单调区间长度不超过 $pi/omega$，所以 $pi/12<=pi/omega$，即 $omega<=12$。
    若 $omega=11$，则由相位范围得 $phi=-pi/4$。在题设区间内，相位跨过 $pi/2$，对应 $x=(3pi)/44 in (pi/18,(5pi)/36)$，函数不单调。
    若 $omega=9$，可取 $phi=pi/4$，相位区间为 $((3pi)/4,(3pi)/2)$，正弦在其中单调递减，且满足全部条件。
    故最大值为 $9$。],
)

#section[填空题：共 4 题，每题 5 分，共 20 分。]

#question(
  "fill-in",
  score: 5,
  stem: [设向量 $arrow(a)=(m,1)$，$arrow(b)=(1,2)$，且 $abs(arrow(a)+arrow(b))^2=abs(arrow(a))^2+abs(arrow(b))^2$，则 $m=$#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [展开模的平方，得 $2arrow(a) dot arrow(b)=0$，即 $m+2=0$，故 $m=-2$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [$(2x+sqrt(x))^5$ 的展开式中，$x^3$ 的系数是#fill-placeholder()。（用数字填写答案）],
  answers: ([$10$],),
  explanation: [通项为 $T_(r+1)=C_5^r (2x)^(5-r)(sqrt(x))^r=C_5^r 2^(5-r)x^(5-r/2)$。令 $5-r/2=3$，得 $r=4$，所求系数为 $2C_5^4=10$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设等比数列 ${a_n}$ 满足 $a_1+a_3=10$，$a_2+a_4=5$，则 $a_1 a_2 dots.c a_n$ 的最大值为#fill-placeholder()。],
  answers: ([$64$],),
  explanation: [设公比为 $q$，由 $q(a_1+a_3)=a_2+a_4$ 得 $q=1/2$，进而 $a_1=8$。各项依次为 $8,4,2,1,1/2,dots.c$，均为正数。乘积在前 $3$ 项不断增大，第 $4$ 项为 $1$，以后每乘一项都减小，因此在 $n=3$ 或 $4$ 时取最大值 $8 times 4 times 2=64$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [某高科技企业生产产品 A 和产品 B，需要甲、乙两种新型材料。生产一件产品 A 需要甲材料 $1.5$ kg，乙材料 $1$ kg，用 $5$ 个工时；生产一件产品 B 需要甲材料 $0.5$ kg，乙材料 $0.3$ kg，用 $3$ 个工时，生产一件产品 A 的利润为 $2100$ 元，生产一件产品 B 的利润为 $900$ 元。该企业现有甲材料 $150$ kg，乙材料 $90$ kg，则在不超过 $600$ 个工时的条件下，生产产品 A、产品 B 的利润之和的最大值为#fill-placeholder()元。],
  answers: ([$216000$],),
  explanation: [设两种产品的产量分别为 $x,y$，约束为
    $ cases(3x+y<=300, 10x+3y<=900, 5x+3y<=600, x>=0, y>=0). $
    利润 $Z=2100x+900y=120(10x+3y)+180(5x+3y)<=120 times 900+180 times 600=216000$。
    当 $x=60,y=100$ 时，上述两项等号同时成立，且 $3x+y=280<=300$，满足所有约束。因此最大利润为 $216000$ 元。],
)

#section[解答题：第 17～21 题为必考题，每题 12 分；第 22～24 题为选考题，每题 10 分，任选一题作答。]
#question(
  "solution",
  score: 12,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $2cos C(a cos B+b cos A)=c$。],
  parts: (
    subquestion(
      stem: [求 $C$。],
      answers: ([$C=pi/3$],),
      explanation: [由正弦定理，得 $2cos C(sin A cos B+sin B cos A)=sin C$，所以 $2cos C sin(A+B)=sin C$。
        ∵ $A+B=pi-C$、$sin C>0$，∴ $cos C=1/2$，即 $C=pi/3$。],
    ),
    subquestion(
      stem: [若 $c=sqrt(7)$，$triangle A B C$ 的面积为 $(3sqrt(3))/2$，求 $triangle A B C$ 的周长。],
      answers: ([$5+sqrt(7)$],),
      explanation: [由 $1/2 a b sin C=(3sqrt(3))/2$ 得 $a b=6$。再由余弦定理，$7=a^2+b^2-a b$，故 $a^2+b^2=13$。
        因而 $(a+b)^2=13+12=25$，得 $a+b=5$，周长为 $5+sqrt(7)$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在以 $A,B,C,D,E,F$ 为顶点的五面体中，面 $A B E F$ 为正方形，$A F=2F D$，$angle A F D=90 degree$，且二面角 $D-A F-E$ 与二面角 $C-B E-F$ 都是 $60 degree$。
    #figure(polyhedron())],
  parts: (
    subquestion(
      stem: [证明：平面 $A B E F perp$ 平面 $E F D C$。],
      answers: ([证明见解析。],),
      explanation: [正方形中 $A F perp F E$，题设又有 $A F perp F D$，且 $F E inter F D=F$，故 $A F perp$ 平面 $E F D C$。
        ∵ $A F subset$ 平面 $A B E F$，∴ 平面 $A B E F perp$ 平面 $E F D C$。],
    ),
    subquestion(
      stem: [求二面角 $E-B C-A$ 的余弦值。],
      answers: ([$-(2sqrt(19))/19$],),
      explanation: [#step[由二面角确定点的坐标][
          取 $F$ 为原点，$F E,F A$ 为 $x,y$ 轴正向，垂直底面向上为 $z$ 轴正向。相似缩放不改变角度，可设 $F E=F A=4$，从而 $F D=2$。
          由第（1）问，$angle D F E=60 degree$ 是二面角 $D-A F-E$ 的平面角，故
          $
            F=(0,0,0), quad E=(4,0,0), quad A=(0,4,0), quad B=(4,4,0), quad D=(1,0,sqrt(3)).
          $
          ∵ $A B parallel F E$，∴ $A B parallel$ 平面 $E F D C$；由平面 $A B C D$ 与其交于 $C D$，得 $C D parallel A B parallel F E$。
          又 $B E parallel A F perp$ 平面 $E F D C$，所以 $angle C E F=60 degree$。结合 $C,D$ 高度相同，得 $C=(3,0,sqrt(3))$。
        ]
        #step[用垂直于棱的向量确定角的正负][
          令 $arrow(v)=arrow(B C)=(-1,-4,sqrt(3))$，$arrow(u)=arrow(B E)=(0,-4,0)$，$arrow(w)=arrow(B A)=(-4,0,0)$。
          将后两个向量沿棱的分量去掉，得
          $
            arrow(u)_perp=arrow(u)-(arrow(u) dot arrow(v))/(abs(arrow(v))^2)arrow(v), quad
            arrow(w)_perp=arrow(w)-(arrow(w) dot arrow(v))/(abs(arrow(v))^2)arrow(v).
          $
          它们分别指向二面角的两个半平面，其夹角就是所求二面角。
          因为 $abs(arrow(v))^2=20$、$arrow(u) dot arrow(v)=16$、$arrow(w) dot arrow(v)=4$、$arrow(u) dot arrow(w)=0$，所以
          $
            arrow(u)_perp dot arrow(w)_perp=-16/5, quad abs(arrow(u)_perp)^2=16/5, quad abs(arrow(w)_perp)^2=76/5.
          $
          因此所求余弦值为 $(-16/5)/(sqrt(16/5)sqrt(76/5))=-(2sqrt(19))/19$。
        ]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某公司计划购买 $2$ 台机器，该种机器使用三年后即被淘汰。机器有一易损零件，在购进机器时，可以额外购买这种零件作为备件，每个 $200$ 元。在机器使用期间，如果备件不足再购买，则每个 $500$ 元。现需决策在购买机器时应同时购买几个易损零件，为此搜集并整理了 $100$ 台这种机器在三年使用期内更换的易损零件数，得下面柱状图：
    #figure(frequency-chart())
    以这 $100$ 台机器更换的易损零件数的频率代替 $1$ 台机器更换的易损零件数发生的概率，记 $X$ 表示 $2$ 台机器三年内共需更换的易损零件数，$n$ 表示购买 $2$ 台机器的同时购买的易损零件数。],
  parts: (
    subquestion(
      stem: [求 $X$ 的分布列。],
      answers: ([见解析中的分布列。],),
      explanation: [单台机器需要 $8,9,10,11$ 个零件的概率依次为 $0.2,0.4,0.2,0.2$。将两台机器的更换数量视为相互独立，卷积可得
        $ P(X=16)=0.2^2=0.04, quad P(X=17)=2 times 0.2 times 0.4=0.16, $
        $ P(X=18)=2 times 0.2^2+0.4^2=0.24, $
        $ P(X=19)=2 times 0.2^2+2 times 0.4 times 0.2=0.24, $
        $ P(X=20)=2 times 0.4 times 0.2+0.2^2=0.20, $
        $ P(X=21)=2 times 0.2^2=0.08, quad P(X=22)=0.2^2=0.04. $
        #table(
          columns: 8,
          align: center,
          [$X$], [$16$], [$17$], [$18$], [$19$], [$20$], [$21$], [$22$],
          [$P$],
          [$0.04$],
          [$0.16$],
          [$0.24$],
          [$0.24$],
          [$0.20$],
          [$0.08$],
          [$0.04$],
        )],
    ),
    subquestion(
      stem: [若要求 $P(X<=n)>=0.5$，确定 $n$ 的最小值。],
      answers: ([$19$],),
      explanation: [$P(X<=18)=0.04+0.16+0.24=0.44<0.5$，而 $P(X<=19)=0.68>=0.5$，故 $n$ 的最小值为 $19$。],
    ),
    subquestion(
      stem: [以购买易损零件所需费用的期望值为决策依据，在 $n=19$ 与 $n=20$ 之中选其一，应选用哪个？],
      answers: ([应选 $n=19$。],),
      explanation: [设总费用为 $Y_n$，则 $Y_n=200n+500max(X-n, 0)$（单位：元）。
        $ E(Y_19)=3800+500(0.20+2 times 0.08+3 times 0.04)=4040, $
        $ E(Y_20)=4000+500(0.08+2 times 0.04)=4080. $
        因为 $4040<4080$，所以应在购买机器时同时购买 $19$ 个易损零件。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设圆 $x^2+y^2+2x-15=0$ 的圆心为 $A$，直线 $l$ 过点 $B(1,0)$ 且与 $x$ 轴不重合，$l$ 交圆 $A$ 于 $C,D$ 两点，过 $B$ 作 $A C$ 的平行线交 $A D$ 于点 $E$。],
  parts: (
    subquestion(
      stem: [证明 $abs(E A)+abs(E B)$ 为定值，并写出点 $E$ 的轨迹方程。],
      answers: ([$abs(E A)+abs(E B)=4$；轨迹为 $x^2/4+y^2/3=1$（$y !=0$）。],),
      explanation: [圆的标准方程为 $(x+1)^2+y^2=16$，所以 $A=(-1,0)$，半径为 $4$，且 $A B=2$。
        因 $B$ 在圆内，故 $B$ 在线段 $C D$ 内。由 $B E parallel A C$，$E$ 在线段 $A D$ 内，且 $triangle D B E ∽ triangle D C A$。
        设 $lambda=(D B)/(D C) in (0,1)$，则 $D E=lambda D A$、$B E=lambda C A$，故
        $ E A+E B=(1-lambda)D A+lambda C A=4. $
        由椭圆定义，半长轴为 $2$，半焦距为 $1$，得轨迹方程 $x^2/4+y^2/3=1$。因 $l$ 不与 $x$ 轴重合，需排除两个长轴端点，即 $y !=0$。],
    ),
    subquestion(
      stem: [设点 $E$ 的轨迹为曲线 $C_1$，直线 $l$ 交 $C_1$ 于 $M,N$ 两点，过 $B$ 且与 $l$ 垂直的直线与圆 $A$ 交于 $P,Q$ 两点，求四边形 $M P N Q$ 面积的取值范围。],
      answers: ([$[12,8sqrt(3))$],),
      explanation: [#step[用方向角求两条对角线的长度][
          设 $l$ 的方向角为 $theta in (0,pi)$，用参数形式 $(x,y)=(1+t cos theta,t sin theta)$ 表示其上的点。
          代入椭圆方程，得
          $ (4-cos^2 theta)t^2+6t cos theta-9=0. $
          该方程的两根乘积为负，故 $B$ 在线段 $M N$ 内。判别式为 $144$，又方向向量为单位向量，得
          $ M N=abs(t_1-t_2)=12/(4-cos^2 theta). $
          圆心 $A$ 到直线 $P Q$ 的距离为 $2abs(cos theta)$，所以
          $ P Q=2sqrt(16-4cos^2 theta)=4sqrt(4-cos^2 theta). $
        ]
        #step[求面积范围][
          $B$ 也在线段 $P Q$ 内，且 $M N perp P Q$，因此
          $ S_(M P N Q)=1/2 M N dot P Q=24/sqrt(4-cos^2 theta). $
          ∵ $0<=cos^2 theta<1$，∴ $12<=S_(M P N Q)<8sqrt(3)$。
          当 $theta=pi/2$ 时取到下界；上界对应被排除的水平直线，不能取到。故面积范围为 $[12,8sqrt(3))$。
        ]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=(x-2)upright(e)^x+a(x-1)^2$ 有两个零点。],
  parts: (
    subquestion(
      stem: [求 $a$ 的取值范围。],
      answers: ([$(0,+infinity)$],),
      explanation: [#step[将零点条件化为水平线与函数的交点][
          $f(1)=-upright(e) !=0$，故零点必满足 $x !=1$。令
          $ g(x)=((2-x)upright(e)^x)/(x-1)^2, $
          则 $f(x)=0$ 等价于 $g(x)=a$，且
          $ g'(x)=-(upright(e)^x ((x-2)^2+1))/(x-1)^3. $
          因此 $g$ 在 $(-infinity,1)$ 上严格递增，在 $(1,+infinity)$ 上严格递减。
        ]
        #step[分别确定两个区间上的值域][
          当 $x arrow -infinity$ 时，$g(x) arrow 0$；当 $x arrow 1^-$ 时，$g(x) arrow +infinity$，所以左侧值域为 $(0,+infinity)$。
          当 $x arrow 1^+$ 时，$g(x) arrow +infinity$；当 $x arrow +infinity$ 时，$g(x) arrow -infinity$，所以右侧值域为 $RR$。
          因而对任意实数 $a$，右侧恰有一个交点；左侧有且仅在 $a>0$ 时恰有一个交点。故 $a in (0,+infinity)$。
        ]],
    ),
    subquestion(
      stem: [设 $x_1,x_2$ 是 $f(x)$ 的两个零点，证明：$x_1+x_2<2$。],
      answers: ([证明见解析。],),
      explanation: [由第（1）问，不妨设 $x_1<1<x_2$，且 $a>0$。由于 $f'(x)=(x-1)(upright(e)^x+2a)$，$f$ 在 $(-infinity,1)$ 上严格递减。
        由 $f(x_2)=0$，得 $a(x_2-1)^2=-(x_2-2)upright(e)^(x_2)$，从而
        $ f(2-x_2)=-x_2 upright(e)^(2-x_2)-(x_2-2)upright(e)^(x_2). $
        令 $h(x)=-x upright(e)^(2-x)-(x-2)upright(e)^x$（$x>1$），则
        $ h'(x)=(x-1)(upright(e)^(2-x)-upright(e)^x)<0. $
        又 $h(1)=0$，故 $f(2-x_2)=h(x_2)<0=f(x_1)$。
        因 $2-x_2<1$，利用 $f$ 在左侧的严格递减性，得 $2-x_2>x_1$，即 $x_1+x_2<2$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4-1：几何证明选讲。
    如图，$triangle O A B$ 是等腰三角形，$angle A O B=120 degree$，以 $O$ 为圆心，$1/2 O A$ 为半径作圆。
    #figure(circle-triangle())],
  parts: (
    subquestion(
      stem: [证明：直线 $A B$ 与 $circle O$ 相切。],
      answers: ([证明见解析。],),
      explanation: [设 $H$ 是 $A B$ 的中点，连接 $O H$。由 $O A=O B$，得 $O H perp A B$、$angle A O H=60 degree$。
        故 $O H=O A cos 60 degree=1/2 O A$，圆心到直线的距离等于半径，所以 $A B$ 与 $circle O$ 相切。],
    ),
    subquestion(
      stem: [点 $C,D$ 在 $circle O$ 上，且 $A,B,C,D$ 四点共圆，证明：$A B parallel C D$。],
      answers: ([证明见解析。],),
      explanation: [设 $A,B,C,D$ 所在圆的圆心为 $O'$。因为 $O A=2O C$，所以 $O !=O'$。
        由 $O A=O B$、$O' A=O' B$，得直线 $O O'$ 是弦 $A B$ 的垂直平分线。
        同理由 $O C=O D$、$O' C=O' D$，得 $O O' perp C D$。
        两条直线都垂直于 $O O'$，故 $A B parallel C D$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4-4：坐标系与参数方程。
    在直角坐标系 $x O y$ 中，曲线 $C_1$ 的参数方程为 $cases(x=a cos t, y=1+a sin t)$（$t$ 为参数，$a>0$）。在以坐标原点为极点，$x$ 轴正半轴为极轴的极坐标系中，曲线 $C_2:rho=4cos theta$。],
  parts: (
    subquestion(
      stem: [说明 $C_1$ 是哪种曲线，并将 $C_1$ 的方程化为极坐标方程。],
      answers: ([圆；$rho^2-2rho sin theta+1-a^2=0$。],),
      explanation: [消去参数，得 $x^2+(y-1)^2=a^2$，故 $C_1$ 是以 $(0,1)$ 为圆心、$a$ 为半径的圆。
        代入 $x=rho cos theta$、$y=rho sin theta$，得 $rho^2-2rho sin theta+1-a^2=0$。],
    ),
    subquestion(
      stem: [直线 $C_3$ 的极坐标方程为 $theta=alpha_0$，其中 $alpha_0$ 满足 $tan alpha_0=2$，若曲线 $C_1$ 与 $C_2$ 的公共点都在 $C_3$ 上，求 $a$。],
      answers: ([$a=1$],),
      explanation: [$C_2$ 的直角坐标方程为 $x^2+y^2=4x$，$C_3$ 为直线 $y=2x$。
        将两圆的方程相减，公共点满足 $4x-2y+1-a^2=0$。再由 $y=2x$ 得 $a^2=1$，因 $a>0$，所以 $a=1$。
        当 $a=1$ 时，两圆的公共点为 $(0,0)$ 和 $(4/5,8/5)$，确实均在 $C_3$ 上。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4-5：不等式选讲。
    已知函数 $f(x)=abs(x+1)-abs(2x-3)$。],
  parts: (
    subquestion(
      stem: [在图中画出 $y=f(x)$ 的图象。
        #figure(absolute-graph())],
      answers: ([图象见解析。],),
      explanation: [在 $x=-1$ 和 $x=3/2$ 处分段，得
        $ f(x)=cases(x-4 quad &x<=-1, 3x-2 quad &-1<x<=3/2, -x+4 quad &x>3/2). $
        图象由三段直线组成，转折点为 $(-1,-5)$、$(3/2,5/2)$。
        #figure(absolute-graph(solution: true))],
    ),
    subquestion(
      stem: [求不等式 $abs(f(x))>1$ 的解集。],
      answers: ([$(-infinity,1/3) union (1,3) union (5,+infinity)$],),
      explanation: [由分段表达式，$f(x)>1$ 等价于 $1<x<3$；$f(x)< -1$ 等价于 $x<1/3$ 或 $x>5$。
        所以 $abs(f(x))>1$ 的解集为 $(-infinity,1/3) union (1,3) union (5,+infinity)$。],
    ),
  ),
)
