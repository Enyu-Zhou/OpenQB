#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016全国1文(河南,河北,山西,江西,湖北,湖南,广东,安徽,福建).pdf",
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
#let pyramid(auxiliary: false) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((-0.6, -0.53), (0.22, -0.76), (0.38, -0.46), {
    let P = (0, 0, 0)
    let A = (6, 0, 0)
    let B = (0, 6, 0)
    let C = (0, 0, 6)
    let D = (2, 2, 2)
    let E = (2, 2, 0)
    let G = (3, 3, 0)
    let F = (2, 0, 0)
    line(P, A, B, C, P)
    line(P, B)
    line(P, G)
    for (u, v) in ((A, C), (P, D), (D, E), (D, G)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    if auxiliary {
      line(E, F)
      line(D, F, stroke: (dash: figure-style.dash))
      line(D, C, stroke: (dash: figure-style.dash))
      content(F, $F$, anchor: "south-east", padding: 4pt)
    }
    for (pt, label, anchor) in (
      (P, $P$, "south"),
      (A, $A$, "east"),
      (B, $B$, "north"),
      (C, $C$, "west"),
      (D, $D$, "north-west"),
      (E, $E$, "east"),
      (G, $G$, "north-east"),
    ) { content(pt, label, anchor: anchor, padding: 4pt) }
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
      x-min: 15.3,
      x-max: 21.8,
      x-break: true,
      y-min: 0,
      y-max: 28,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (16, 17, 18, 19, 20, 21),
      y-ticks: (6, 10, 16, 20, 24),
      x-label: [更换的易损零件数],
      y-label: [频数],
      {
        plot.annotate(resize: false, {
          let bars = ((16, 6), (17, 16), (18, 24), (19, 24), (20, 20), (21, 10))
          for (x, h) in bars {
            line((x - 0.25, 0), (x - 0.25, h), (x + 0.25, h), (x + 0.25, 0))
          }
          for (height, last) in (
            (6, 16),
            (10, 21),
            (16, 17),
            (20, 20),
            (24, 19),
          ) {
            let left = 15.3
            for (x, h) in bars {
              if x <= last and h >= height {
                line((left, height), (x - 0.25, height), stroke: (
                  dash: figure-style.dash,
                ))
                left = x + 0.25
              }
            }
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
  stem: [设集合 $A={1,3,5,7}$，$B={x|2<=x<=5}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${1,3}$], [${3,5}$], [${5,7}$], [${1,7}$]),
  answers: ([B],),
  explanation: [$A$ 中满足 $2<=x<=5$ 的元素为 $3,5$，故 $A inter B={3,5}$。],
)


#question(
  "single-choice",
  score: 5,
  stem: [设 $(1+2upright(i))(a+upright(i))$ 的实部与虚部相等，其中 $a$ 为实数，则 $a=$#choice-placeholder()。],
  choices: ([$-3$], [$-2$], [$2$], [$3$]),
  answers: ([A],),
  explanation: [$(1+2upright(i))(a+upright(i))=(a-2)+(2a+1)upright(i)$。由 $a-2=2a+1$ 得 $a=-3$。],
)


#question(
  "single-choice",
  score: 5,
  stem: [为美化环境，从红、黄、白、紫 $4$ 种颜色的花中任选 $2$ 种花种在一个花坛中，余下的 $2$ 种花种在另一个花坛中，则红色和紫色的花不在同一花坛的概率是#choice-placeholder()。],
  choices: ([$1/3$], [$1/2$], [$2/3$], [$5/6$]),
  answers: ([C],),
  explanation: [第一个花坛所选颜色共有 $6$ 种等可能组合：红黄、红白、红紫、黄白、黄紫、白紫。其中只有红紫、黄白使红色与紫色在同一花坛，故所求概率为 $1-2/6=2/3$。],
)


#question(
  "single-choice",
  score: 5,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$。已知 $a=sqrt(5)$，$c=2$，$cos A=2/3$，则 $b=$#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$sqrt(3)$], [$2$], [$3$]),
  answers: ([D],),
  explanation: [由余弦定理，$5=b^2+4-2 times b times 2 times 2/3$，整理得 $(3b+1)(b-3)=0$。因为 $b>0$，所以 $b=3$。],
)


#question(
  "single-choice",
  score: 5,
  stem: [直线 $l$ 经过椭圆的一个顶点和一个焦点，若椭圆中心到 $l$ 的距离为其短轴长的 $1/4$，则该椭圆的离心率为#choice-placeholder()。],
  choices: ([$1/3$], [$1/2$], [$2/3$], [$3/4$]),
  answers: ([B],),
  explanation: [设椭圆的长、短半轴分别为 $a,b$，半焦距为 $c$。由于中心到 $l$ 的距离大于 $0$，该顶点只能是短轴端点。中心、焦点、该顶点构成两直角边长为 $b,c$ 的直角三角形，其斜边为 $sqrt(b^2+c^2)=a$。由面积相等，$b c=a times b/2$，故离心率 $e=c/a=1/2$。],
)


#question(
  "single-choice",
  score: 5,
  stem: [将函数 $y=2sin(2x+pi/6)$ 的图象向右平移 $1/4$ 个周期后，所得图象对应的函数为#choice-placeholder()。],
  choices: (
    [$y=2sin(2x+pi/4)$],
    [$y=2sin(2x+pi/3)$],
    [$y=2sin(2x-pi/4)$],
    [$y=2sin(2x-pi/3)$],
  ),
  answers: ([D],),
  explanation: [原函数的周期为 $pi$，故向右平移 $pi/4$ 个单位，所得函数为 $y=2sin(2(x-pi/4)+pi/6)=2sin(2x-pi/3)$。],
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
  stem: [若 $a>b>0$，$0<c<1$，则#choice-placeholder()。],
  choices: ([$log_a c<log_b c$], [$log_c a<log_c b$], [$a^c<b^c$], [$c^a>c^b$]),
  answers: ([B],),
  explanation: [因为 $0<c<1$，对数函数 $y=log_c x$ 在 $(0,+infinity)$ 上递减，所以 $log_c a<log_c b$，B 正确。
    取 $a=4,b=2,c=1/2$，有 $log_a c=-1/2> -1=log_b c$，A 不成立。
    幂函数 $y=x^c$ 在正半轴递增，故 $a^c>b^c$；指数函数 $y=c^x$ 递减，故 $c^a<c^b$，C、D 均不成立。],
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
  stem: [执行下面的程序框图，如果输入的 $x=0,y=1,n=1$，则输出 $x,y$ 的值满足#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$y=2x$], [$y=3x$], [$y=4x$], [$y=5x$]),
  answers: ([C],),
  explanation: [依次执行赋值后，$(n,x,y)$ 为 $(1,0,1)$、$(2,1/2,2)$、$(3,3/2,6)$。前两次 $x^2+y^2<36$，第三次满足 $x^2+y^2>=36$，输出 $x=3/2$、$y=6$，故 $y=4x$。],
)


#question(
  "single-choice",
  score: 5,
  stem: [平面 $alpha$ 过正方体 $A B C D-A_1 B_1 C_1 D_1$ 的顶点 $A$，$alpha parallel$ 平面 $C B_1 D_1$，$alpha inter$ 平面 $A B C D=m$，$alpha inter$ 平面 $A B B_1 A_1=n$，则 $m,n$ 所成角的正弦值为#choice-placeholder()。],
  choices: ([$sqrt(3)/2$], [$sqrt(2)/2$], [$sqrt(3)/3$], [$1/3$]),
  answers: ([A],),
  explanation: [由平行平面的性质，并结合正方体中 $B D parallel B_1 D_1$、$B A_1 parallel C D_1$，得 $m parallel B D$、$n parallel B A_1$。
    $B D$、$B A_1$、$D A_1$ 均为正方体的面对角线，长度相等，故 $triangle B D A_1$ 为等边三角形。两直线所成角为 $60 degree$，其正弦值为 $sqrt(3)/2$。],
)


#question(
  "single-choice",
  score: 5,
  stem: [若函数 $f(x)=x-1/3 sin 2x+a sin x$ 在 $(-infinity,+infinity)$ 单调递增，则 $a$ 的取值范围是#choice-placeholder()。],
  choices: ([$[-1,1]$], [$[-1,1/3]$], [$[-1/3,1/3]$], [$[-1,-1/3]$]),
  answers: ([C],),
  explanation: [$f'(x)=1-2/3 cos 2x+a cos x=-4/3 cos^2 x+a cos x+5/3$。
    令 $t=cos x in [-1,1]$，则需 $g(t)=-4/3 t^2+a t+5/3>=0$ 在该区间恒成立。
    这是开口向下的二次函数，最小值在端点取得，故只需 $g(-1)=1/3-a>=0$ 且 $g(1)=1/3+a>=0$，得 $-1/3<=a<=1/3$。在此范围内，导数仅可能在离散点为零，因此函数在实数集上严格递增。],
)

#section[填空题：共 4 题，每题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [设向量 $arrow(a)=(x,x+1)$，$arrow(b)=(1,2)$，且 $arrow(a) perp arrow(b)$，则 $x=$#fill-placeholder()。],
  answers: ([$-2/3$],),
  explanation: [由垂直条件，$arrow(a) dot arrow(b)=x+2(x+1)=0$，解得 $x=-2/3$。],
)


#question(
  "fill-in",
  score: 5,
  stem: [已知 $theta$ 是第四象限角，且 $sin(theta+pi/4)=3/5$，则 $tan(theta-pi/4)=$#fill-placeholder()。],
  answers: ([$-4/3$],),
  explanation: [不妨将 $theta$ 化到 $(-pi/2,0)$，则 $theta+pi/4 in (-pi/4,pi/4)$，其余弦为正，所以 $cos(theta+pi/4)=4/5$。
    由诱导公式，$tan(theta-pi/4)=-cot(theta+pi/4)=-(4/5)/(3/5)=-4/3$。],
)


#question(
  "fill-in",
  score: 5,
  stem: [设直线 $y=x+2a$ 与圆 $C:x^2+y^2-2a y-2=0$ 相交于 $A,B$ 两点，若 $abs(A B)=2sqrt(3)$，则圆 $C$ 的面积为#fill-placeholder()。],
  answers: ([$4pi$],),
  explanation: [配方得 $x^2+(y-a)^2=a^2+2$，故圆心为 $(0,a)$，半径平方为 $a^2+2$。圆心到直线的距离为 $abs(a)/sqrt(2)$。由半弦长、弦心距与半径组成的直角三角形，$3+a^2/2=a^2+2$，所以 $a^2=2$，圆面积为 $pi(a^2+2)=4pi$。],
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
  stem: [已知 ${a_n}$ 是公差为 $3$ 的等差数列，数列 ${b_n}$ 满足 $b_1=1$，$b_2=1/3$，$a_n b_(n+1)+b_(n+1)=n b_n$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=3n-1$],),
      explanation: [令 $n=1$，得 $(a_1+1)b_2=b_1$，所以 $a_1=2$。由等差数列通项公式，$a_n=2+3(n-1)=3n-1$。],
    ),
    subquestion(
      stem: [求 ${b_n}$ 的前 $n$ 项和。],
      answers: ([$S_n=3/2(1-3^(-n))$],),
      explanation: [代入 $a_n=3n-1$，原递推式化为 $3n b_(n+1)=n b_n$，故 $b_(n+1)=b_n/3$。
        所以 ${b_n}$ 是首项为 $1$、公比为 $1/3$ 的等比数列，其前 $n$ 项和为 $S_n=(1-(1/3)^n)/(1-1/3)=3/2(1-3^(-n))$。],
    ),
  ),
)


#question(
  "solution",
  score: 12,
  stem: [如图，已知正三棱锥 $P-A B C$ 的侧面是直角三角形，$P A=6$，顶点 $P$ 在平面 $A B C$ 内的正投影为点 $D$，$D$ 在平面 $P A B$ 内的正投影为点 $E$，连接 $P E$ 并延长交 $A B$ 于点 $G$。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [证明 $G$ 是 $A B$ 的中点。],
      answers: ([证明见解析。],),
      explanation: [由正投影条件，$P D perp$ 平面 $A B C$，$D E perp$ 平面 $P A B$，所以 $A B perp P D$、$A B perp D E$。
        又 $P D inter D E=D$，故 $A B perp$ 平面 $P D E$，从而 $A B perp P G$。由于 $P A=P B$，等腰三角形的底边高平分底边，故 $G$ 是 $A B$ 的中点。],
    ),
    subquestion(
      stem: [在图中作出点 $E$ 在平面 $P A C$ 内的正投影 $F$（说明做法及理由），并求四面体 $P D E F$ 的体积。],
      answers: (
        [过 $E$ 作 $E F parallel P B$ 交 $P A$ 于 $F$；体积为 $4/3$。],
      ),
      explanation: [#step[作出正投影][
          在平面 $P A B$ 内，过 $E$ 作 $P B$ 的平行线，交 $P A$ 于 $F$。
          正三棱锥的侧棱相等，各侧面为等腰直角三角形，故直角均在 $P$，即 $P B perp P A$、$P B perp P C$。于是 $P B perp$ 平面 $P A C$，从而 $E F perp$ 平面 $P A C$，$F$ 即为所求正投影。
          #figure(pyramid(auxiliary: true))
        ]
        #step[确定长度并求体积][
          $D$ 为正三角形 $A B C$ 的中心，连接 $C G$，则 $D in C G$，$G D/G C=1/3$。
          由 $P C perp$ 平面 $P A B$、$D E perp$ 平面 $P A B$，得 $D E parallel P C$，故 $triangle G D E ∽ triangle G C P$。
          因而 $D E=P C/3=2$，$P E=2P G/3$。在等腰直角三角形 $P A B$ 中，$P G=3sqrt(2)$，于是 $P E=2sqrt(2)$。
          $triangle P F E$ 也是等腰直角三角形，故 $P F=E F=2$。
          以 $triangle P E F$ 为底面，$D E$ 为高，得
          $
            V_(P D E F)=1/3 S_(triangle P E F) dot D E=1/3 times (1/2 times 2 times 2) times 2=4/3.
          $
        ]],
    ),
  ),
)


#question(
  "solution",
  score: 12,
  stem: [某公司计划购买 $1$ 台机器，该种机器使用三年后即被淘汰。机器有一易损零件，在购进机器时，可以额外购买这种零件作为备件，每个 $200$ 元。在机器使用期间，如果备件不足再购买，则每个 $500$ 元。现需决策在购买机器时应同时购买几个易损零件，为此搜集并整理了 $100$ 台这种机器在三年使用期内更换的易损零件数，得下面柱状图：
    #figure(frequency-chart())
    记 $x$ 表示 $1$ 台机器在三年使用期内需更换的易损零件数，$y$ 表示 $1$ 台机器在购买易损零件上所需的费用（单位：元），$n$ 表示购机的同时购买的易损零件数。],
  parts: (
    subquestion(
      stem: [若 $n=19$，求 $y$ 与 $x$ 的函数解析式。],
      answers: (
        [$y=cases(3800 & quad x<=19, 500x-5700 & quad x>19)$（$x in NN$）。],
      ),
      explanation: [购买 $19$ 个备件的费用为 $200 times 19=3800$ 元。若 $x<=19$，无需再买；若 $x>19$，需另付 $500(x-19)$ 元。因此
        $
          y=cases(3800 & quad x<=19, 500x-5700 & quad x>19), quad x in NN.
        $],
    ),
    subquestion(
      stem: [若要求“需更换的易损零件数不大于 $n$”的频率不小于 $0.5$，求 $n$ 的最小值。],
      answers: ([$19$],),
      explanation: [不大于 $18$ 的频率为 $(6+16+24)/100=0.46<0.5$；不大于 $19$ 的频率为 $(6+16+24+24)/100=0.70>=0.5$，所以最小值为 $19$。],
    ),
    subquestion(
      stem: [假设这 $100$ 台机器在购机的同时每台都购买 $19$ 个易损零件或每台都购买 $20$ 个易损零件，分别计算这 $100$ 台机器在购买易损零件上所需费用的平均数，以此作为决策依据，购买 $1$ 台机器的同时应购买 $19$ 个还是 $20$ 个易损零件？],
      answers: ([平均费用分别为 $4000$ 元、$4050$ 元，应购买 $19$ 个。],),
      explanation: [若每台都购买 $19$ 个，则 $70$ 台无需补购，$20$ 台补购 $1$ 个，$10$ 台补购 $2$ 个，平均费用为
        $ (70 times 3800+20 times 4300+10 times 4800)/100=4000. $
        若每台都购买 $20$ 个，则 $90$ 台无需补购，$10$ 台补购 $1$ 个，平均费用为
        $ (90 times 4000+10 times 4500)/100=4050. $
        因 $4000<4050$，所以应在购机时同时购买 $19$ 个易损零件。],
    ),
  ),
)


#question(
  "solution",
  score: 12,
  stem: [在直角坐标系 $x O y$ 中，直线 $l:y=t$（$t !=0$）交 $y$ 轴于点 $M$，交抛物线 $C:y^2=2p x$（$p>0$）于点 $P$，$M$ 关于点 $P$ 的对称点为 $N$，连接 $O N$ 并延长交 $C$ 于点 $H$。],
  parts: (
    subquestion(
      stem: [求 $abs(O H)/abs(O N)$。],
      answers: ([$2$],),
      explanation: [由题意，$M=(0,t)$，$P=(t^2/(2p),t)$，故 $N=(t^2/p,t)$。
        直线 $O N$ 的方程为 $y=p/t x$，代入抛物线方程，得 $p x^2-2t^2 x=0$。除原点外的交点为 $H=(2t^2/p,2t)$，所以 $arrow(O H)=2arrow(O N)$，故 $abs(O H)/abs(O N)=2$。],
    ),
    subquestion(
      stem: [除 $H$ 以外，直线 $M H$ 与抛物线 $C$ 是否有其它公共点？说明理由。],
      answers: ([没有其它公共点。],),
      explanation: [直线 $M H$ 的方程为 $y-t=p/(2t)x$，即 $x=(2t)/p (y-t)$。代入 $y^2=2p x$，得 $(y-2t)^2=0$。
        因此唯一交点的纵坐标为 $2t$，横坐标为 $2t^2/p$，正是 $H$。故没有其它公共点，直线 $M H$ 与抛物线在 $H$ 处相切。],
    ),
  ),
)


#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=(x-2)upright(e)^x+a(x-1)^2$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性。],
      answers: ([分类讨论见解析。],),
      explanation: [求导得 $f'(x)=(x-1)(upright(e)^x+2a)$。
        #step[当 $a>=0$ 时][第二个因子恒为正，故 $f$ 在 $(-infinity,1)$ 上递减，在 $(1,+infinity)$ 上递增。]
        #step[当 $a<0$ 时][令 $b=ln(-2a)$，则 $upright(e)^x+2a$ 在 $x<b$ 时为负，在 $x>b$ 时为正。
          若 $a=-upright(e)/2$，则 $b=1$，两个因子同号，所以 $f'(x)>=0$ 且仅在 $x=1$ 为零，$f$ 在 $RR$ 上递增。
          若 $-upright(e)/2<a<0$，则 $b<1$，$f$ 在 $(-infinity,b)$、$(1,+infinity)$ 上递增，在 $(b,1)$ 上递减。
          若 $a< -upright(e)/2$，则 $b>1$，$f$ 在 $(-infinity,1)$、$(b,+infinity)$ 上递增，在 $(1,b)$ 上递减。
        ]],
    ),
    subquestion(
      stem: [若 $f(x)$ 有两个零点，求 $a$ 的取值范围。],
      answers: ([$(0,+infinity)$],),
      explanation: [#step[当 $a>0$ 时][由第 (1) 问，$f$ 先减后增，最小值 $f(1)=-upright(e)<0$。当 $x$ 趋于 $-infinity$ 或 $+infinity$ 时，$f(x)$ 都趋于 $+infinity$。故在 $1$ 两侧各有且仅有一个零点，共两个。]
        #step[当 $a<=0$ 时][若 $a=0$，$f(x)=(x-2)upright(e)^x$ 只有零点 $x=2$。
          若 $a<0$，则对 $x<=1$，有 $f(x)<0$。
          记 $b=ln(-2a)$。若 $b<=1$，$f$ 在 $(1,+infinity)$ 上递增；若 $b>1$，$f$ 在 $(1,b)$ 上递减，在 $(b,+infinity)$ 上递增。又 $f(1)<0$，且 $x$ 趋于 $+infinity$ 时 $f(x)$ 趋于 $+infinity$，两种情形均恰有一个零点。
        ]
        因此所求范围为 $(0,+infinity)$。],
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
