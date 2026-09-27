#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "山东卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016山东文.pdf",
  regions: ("山东",),
)

#let frequency-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 11mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $0$,
      tick: (stroke: figure-style.thickness, length: 0),
      x: (label: (anchor: "north-east", offset: 0.6)),
      y: (label: (anchor: "south", offset: 0.2)),
    ))
    plot.plot(
      size: (6.4, 4),
      axis-style: "school-book",
      x-min: 15.5,
      x-max: 34,
      x-break: true,
      y-min: 0,
      y-max: 0.19,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (17.5, 20, 22.5, 25, 27.5, 30),
      y-ticks: (
        (0.02, [0.02]),
        (0.04, [0.04]),
        (0.08, [0.08]),
        (0.10, [0.10]),
        (0.16, [0.16]),
      ),
      x-label: [自习时间/小时],
      y-label: $"频率"/"组距"$,
      {
        plot.annotate(resize: false, {
          let heights = (0.02, 0.10, 0.16, 0.08, 0.04)
          for (i, h) in heights.enumerate() {
            let x = 17.5 + 2.5 * i
            line((x, h), (x + 2.5, h))
            line(
              (x, 0),
              (x, if i == 0 { h } else { calc.max(h, heights.at(i - 1)) }),
            )
          }
          line((30, 0), (30, 0.04))
          for (h, x) in (
            (0.02, 17.5),
            (0.04, 27.5),
            (0.08, 25),
            (0.10, 20),
            (0.16, 22.5),
          ) {
            line((15.5, h), (x, h), stroke: (dash: figure-style.dash))
          }
        })
      },
    )
  })
}
#let three-views() = {
  set text(size: 9pt)
  cetz.canvas(length: 15mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let r = calc.sqrt(2) / 2
    for (x, caption) in ((0, [正（主）视图]), (2.3, [侧（左）视图])) {
      line((x - 0.5, 0), (x + 0.5, 0), (x, 1), close: true)
      line((x - r, 1 + r), (x + r, 1 + r))
      line(
        ..range(61).map(i => (
          x + r * calc.cos((180 + i * 3) * 1deg),
          1 + r + r * calc.sin((180 + i * 3) * 1deg),
        )),
      )
      line((x - 0.5, -0.18), (x + 0.5, -0.18), mark: (start: ">", end: ">"))
      content(
        (x, -0.18),
        $1$,
        frame: "rect",
        fill: white,
        stroke: none,
        padding: 1pt,
      )
      for d in (-0.5, 0.5) { line((x + d, -0.08), (x + d, -0.28)) }
      content((x, -0.65), caption)
    }
    line((-0.82, 0), (-0.82, 1), mark: (start: ">", end: ">"))
    content(
      (-0.82, 0.5),
      $1$,
      frame: "rect",
      fill: white,
      stroke: none,
      padding: 1pt,
    )
    for y in (0, 1) { line((-0.92, y), (-0.62, y)) }
    circle((0, -1.85), radius: r)
    rect((-0.5, -2.35), (0.5, -1.35), stroke: (dash: figure-style.dash))
    line((-0.5, -2.35), (0.5, -1.35), stroke: (dash: figure-style.dash))
    line((-0.5, -1.35), (0.5, -2.35), stroke: (dash: figure-style.dash))
    content((0, -2.85), [俯视图])
  })
}

#let loop-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 7mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    for (y, label) in ((0, [开始]), (-9.4, [结束])) {
      rect((-0.65, y - 0.3), (0.65, y + 0.3), radius: 0.15)
      content((0, y), label)
    }
    for (y, label) in ((-1.2, [输入 $n$]), (-8.2, [输出 $S$])) {
      line(
        (-1, y - 0.35),
        (0.8, y - 0.35),
        (1, y + 0.35),
        (-0.8, y + 0.35),
        close: true,
      )
      content((0, y), label)
    }
    for (y, label) in ((-2.4, $i=1$), (-3.6, $S=0$)) {
      rect((-0.7, y - 0.35), (0.7, y + 0.35))
      content((0, y), label)
    }
    rect((-2.4, -5.15), (2.4, -4.45))
    content((0, -4.8), $S=S+sqrt(i+1)-sqrt(i)$)
    line((0, -6), (1.25, -6.6), (0, -7.2), (-1.25, -6.6), close: true)
    content((0, -6.6), $i>=n$)
    rect((2.8, -5.15), (5, -4.45))
    content((3.9, -4.8), $i=i+1$)
    for (a, b) in (
      (-0.3, -0.85),
      (-1.55, -2.05),
      (-2.75, -3.25),
      (-3.95, -4.45),
      (-5.15, -6),
      (-7.2, -7.85),
      (-8.55, -9.1),
    ) {
      line((0, a), (0, b), mark: (end: ">"))
    }
    line((1.25, -6.6), (3.9, -6.6), (3.9, -5.15), mark: (end: ">"))
    line((3.9, -4.45), (3.9, -4.2), (0, -4.2), mark: (end: ">"))
    content((1.65, -6.45), [否], anchor: "south")
    content((0.2, -7.5), [是], anchor: "west")
  })
}
#let spinner() = {
  set text(size: 10pt)
  cetz.canvas(length: 13mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let h = calc.sqrt(2) / 2
    circle((0, 0), radius: 1)
    line((-h, -h), (h, h))
    line((-h, h), (h, -h))
    for (position, label) in (
      ((0, 0.5), $1$),
      ((0, -0.5), $2$),
      ((-0.5, 0), $3$),
      ((0.5, 0), $4$),
    ) {
      content(position, label)
    }
    line((0, 1.5), (0, 1.1), mark: (end: ">"))
    content((0, 1.6), [指针], anchor: "south")
  })
}
#let solid(auxiliary: 0) = cetz.canvas(length: 16mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((0.7, -0.8), (1.4, 0.4), (-0.15, 1), {
    let A = (-1, 0, 0)
    let C = (1, 0, 0)
    let B = (0, 2, 0)
    let D = (0, 0, 0)
    let E = (0, 0, 2)
    let F = (0, 2, 2)
    let G = (0.5, 0, 1)
    let H = (0, 2, 1)
    let I = (0.5, 1, 1)
    line(A, C, B, F, E, A)
    line(E, C, F)
    for (a, b) in ((A, B), (A, F), (D, B), (G, H)) {
      line(a, b, stroke: (dash: figure-style.dash))
    }
    if auxiliary == 1 { line(D, E, stroke: (dash: figure-style.dash)) }
    if auxiliary == 2 {
      line(G, I, H, stroke: (dash: figure-style.dash))
      content((0.5, 1.26, 0.85), $I$, anchor: "west")
    }
    for (position, label, anchor) in (
      ((-1.15, -0.04, 0), $A$, "east"),
      ((0, 2.12, 0), $B$, "west"),
      ((1.08, 0, -0.1), $C$, "north"),
      ((0, -0.16, -0.06), $D$, "north-east"),
      ((0, -0.12, 2.1), $E$, "south-east"),
      ((0, 2, 2.15), $F$, "south"),
      ((0.5, -0.1, 0.82), $G$, "center"),
      ((0, 2.13, 1), $H$, "west"),
    ) { content(position, label, anchor: anchor) }
  })
})
#let ellipse-diagram() = {
  set text(size: 10pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: false,
      tick: (stroke: figure-style.thickness),
    ))
    let p = 1.4
    let m = calc.sqrt((4 - p * p) / 8)
    let k = m / p
    let xa = -p * (1 + 6 * k * k) / (1 + 2 * k * k)
    let xb = -p * (1 + 6 * k * k) / (1 + 18 * k * k)
    let ya = k * xa + m
    let yb = -3 * k * xb + m
    plot.plot(
      size: (7.8, 5.25),
      axis-style: "school-book",
      x-min: -2.5,
      x-max: 2.7,
      y-min: -1.7,
      y-max: 1.8,
      x-tick-step: none,
      y-tick-step: none,
      {
        plot.annotate(resize: false, {
          line(
            ..range(181).map(i => (
              2 * calc.cos(i * 2deg),
              calc.sqrt(2) * calc.sin(i * 2deg),
            )),
          )
          line((-2.3, -2.3 * k + m), (2.2, 2.2 * k + m))
          line((xb, yb), (p, -2 * m), (p, 2 * m))
          line((xa, ya), (xb, yb))
          for (position, label, anchor) in (
            ((-0.07, -0.07), $O$, "north-east"),
            ((0.09, m + 0.1), $M$, "south-west"),
            ((-p, -0.08), $N$, "north"),
            ((p + 0.08, 2 * m + 0.06), $P$, "south-west"),
            ((p + 0.08, -2 * m - 0.06), $Q$, "north-west"),
            ((xa - 0.08, ya - 0.06), $A$, "north-east"),
            ((xb - 0.05, yb + 0.1), $B$, "south-east"),
          ) { content(position, label, anchor: anchor) }
        })
      },
    )
  })
}

#section[选择题：共 10 小题，每小题 5 分，共 50 分。每小题只有一个选项符合题意。]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $U={1,2,3,4,5,6}$，$A={1,3,5}$，$B={3,4,5}$，则 $complement_U (A union B)=$#choice-placeholder()。],
  choices: ([${2,6}$], [${3,6}$], [${1,3,4,5}$], [${1,2,4,6}$]),
  answers: ([A],),
  explanation: [由 $A union B={1,3,4,5}$，得 $complement_U (A union B)=U without (A union B)={2,6}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若复数 $z=2/(1-i)$，其中 $i$ 为虚数单位，则 $overline(z)=$#choice-placeholder()。],
  choices: ([$1+i$], [$1-i$], [$-1+i$], [$-1-i$]),
  answers: ([B],),
  explanation: [分母实数化得 $z=(2(1+i))/((1-i)(1+i))=1+i$，故其共轭复数为 $overline(z)=1-i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某高校调查了 200 名学生每周的自习时间（单位：小时），制成了如图所示的频率分布直方图，其中自习时间的范围是 $[17.5,30]$，样本数据分组为 $[17.5,20)$，$[20,22.5)$，$[22.5,25)$，$[25,27.5)$，$[27.5,30]$。根据直方图，这 200 名学生中每周的自习时间不少于 22.5 小时的人数是#choice-placeholder()。
    #figure(frequency-chart())],
  choices: ([$56$], [$60$], [$120$], [$140$]),
  answers: ([D],),
  explanation: [所求频率为后三个小矩形的面积之和，即 $2.5(0.16+0.08+0.04)=0.7$，对应人数为 $200 times 0.7=140$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若变量 $x,y$ 满足 $cases(x+y<=2, 2x-3y<=9, x>=0)$，则 $x^2+y^2$ 的最大值是#choice-placeholder()。],
  choices: ([$4$], [$9$], [$10$], [$12$]),
  answers: ([C],),
  explanation: [可行域是顶点为 $(0,2)$、$(0,-3)$、$(3,-1)$ 的三角形。固定 $x$ 时，$x^2+y^2$ 关于 $y$ 是开口向上的二次函数，最大值在对应线段的端点取得；再沿三角形各边考察，所得二次函数也在端点取最大值。因此只需比较三个顶点。代入三个顶点分别得 $4,9,10$，故最大值为 $10$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [一个由半球和四棱锥组成的几何体，其三视图如图所示，则该几何体的体积为#choice-placeholder()。
    #figure(three-views())],
  choices: (
    [$1/3+(2pi)/3$],
    [$1/3+(sqrt(2)pi)/3$],
    [$1/3+(sqrt(2)pi)/6$],
    [$1+(sqrt(2)pi)/6$],
  ),
  answers: ([C],),
  explanation: [由三视图，四棱锥的底面是边长为 $1$ 的正方形，高为 $1$；俯视图中的圆外接于该正方形，故半径为 $sqrt(2)/2$。总体积为
    $
      V=1/3 times 1^2 times 1+1/2 times (4pi)/3 (sqrt(2)/2)^3=1/3+(sqrt(2)pi)/6.
    $],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知直线 $a,b$ 分别在两个不同的平面 $alpha,beta$ 内，则“直线 $a$ 和直线 $b$ 相交”是“平面 $alpha$ 和平面 $beta$ 相交”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [若两直线相交，交点同时属于两个不同平面，故两平面相交，充分性成立。两平面相交时，各自平面内的直线可以平行，例如分别取平行于两平面交线的两条不同直线，故必要性不成立。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知圆 $M:x^2+y^2-2a y=0$（$a>0$）截直线 $x+y=0$ 所得线段的长度是 $2sqrt(2)$，则圆 $M$ 与圆 $N:(x-1)^2+(y-1)^2=1$ 的位置关系是#choice-placeholder()。],
  choices: ([内切], [相交], [外切], [相离]),
  answers: ([B],),
  explanation: [圆 $M$ 的圆心为 $(0,a)$，半径为 $a$，圆心到直线的距离为 $a/sqrt(2)$。由半弦长、圆心距与半径组成直角三角形，得 $a^2=(a/sqrt(2))^2+(sqrt(2))^2$，解得 $a=2$。
    两圆圆心距为 $sqrt((1-0)^2+(1-2)^2)=sqrt(2)$，半径分别为 $2,1$。因 $2-1<sqrt(2)<2+1$，两圆相交。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$triangle A B C$ 中，角 $A,B,C$ 的对边分别是 $a,b,c$，已知 $b=c$，$a^2=2b^2(1-sin A)$，则 $A=$#choice-placeholder()。],
  choices: ([$(3pi)/4$], [$pi/3$], [$pi/4$], [$pi/6$]),
  answers: ([C],),
  explanation: [由余弦定理及 $b=c$，得 $a^2=2b^2(1-cos A)$。与题设比较可得 $sin A=cos A$，又 $0<A<pi$，故 $A=pi/4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)$ 的定义域为 $RR$。当 $x<0$ 时，$f(x)=x^3-1$；当 $-1<=x<=1$ 时，$f(-x)=-f(x)$；当 $x>1/2$ 时，$f(x+1/2)=f(x-1/2)$。则 $f(6)=$#choice-placeholder()。],
  choices: ([$-2$], [$-1$], [$0$], [$2$]),
  answers: ([D],),
  explanation: [由递推关系得 $f(6)=f(5)=dots=f(1)$。又 $f(-1)=(-1)^3-1=-2$，由区间 $[-1,1]$ 上的奇对称关系，得 $f(1)=-f(-1)=2$，故 $f(6)=2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若函数 $y=f(x)$ 的图象上存在两点，使得函数的图象在这两点处的切线互相垂直，则称 $y=f(x)$ 具有 $T$ 性质。下列函数中具有 $T$ 性质的是#choice-placeholder()。],
  choices: ([$y=sin x$], [$y=ln x$], [$y=e^x$], [$y=x^3$]),
  answers: ([A],),
  explanation: [对于 $y=sin x$，在 $x=0$ 和 $x=pi$ 处的切线斜率分别为 $1$ 和 $-1$，乘积为 $-1$，满足要求。其余三个函数的导数分别为 $1/x$（$x>0$）、$e^x$、$3x^2$，均非负，任意两处切线斜率的乘积不可能为 $-1$。],
)

#section[填空题：共 5 小题，每小题 5 分，共 25 分。]
#question(
  "fill-in",
  score: 5,
  stem: [执行如图的程序框图，若输入 $n$ 的值为 $3$，则输出的 $S$ 的值为#fill-placeholder()。
    #figure(loop-chart())],
  answers: ([$1$],),
  explanation: [循环中 $i$ 依次取 $1,2,3$，执行 $S=S+sqrt(i+1)-sqrt(i)$，在 $i=3$ 时满足 $i>=n$，退出循环。故 $S=(sqrt(2)-1)+(sqrt(3)-sqrt(2))+(2-sqrt(3))=1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [观察下列等式：
    $ (sin pi/3)^(-2)+(sin (2pi)/3)^(-2)=4/3 times 1 times 2; $
    $
      (sin pi/5)^(-2)+(sin (2pi)/5)^(-2)+(sin (3pi)/5)^(-2)+(sin (4pi)/5)^(-2)=4/3 times 2 times 3;
    $
    $
      (sin pi/7)^(-2)+(sin (2pi)/7)^(-2)+(sin (3pi)/7)^(-2)+dots+(sin (6pi)/7)^(-2)=4/3 times 3 times 4;
    $
    $
      (sin pi/9)^(-2)+(sin (2pi)/9)^(-2)+(sin (3pi)/9)^(-2)+dots+(sin (8pi)/9)^(-2)=4/3 times 4 times 5;
    $
    $ dots $
    照此规律，
    $
      (sin pi/(2n+1))^(-2)+(sin (2pi)/(2n+1))^(-2)+(sin (3pi)/(2n+1))^(-2)+dots+(sin (2n pi)/(2n+1))^(-2)= #fill-placeholder().
    $],
  answers: ([$4/3 n(n+1)$],),
  explanation: [前四个等式分别对应 $n=1,2,3,4$。左侧的分母依次为 $2n+1$，共有 $2n$ 项；右侧均为 $4/3$ 乘以 $n$ 与 $n+1$，故按此规律填 $4/3 n(n+1)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)=(1,-1)$，$bold(b)=(6,-4)$。若 $bold(a) perp (t bold(a)+bold(b))$，则实数 $t$ 的值为#fill-placeholder()。],
  answers: ([$-5$],),
  explanation: [由垂直条件，$0=bold(a) dot (t bold(a)+bold(b))=t abs(bold(a))^2+bold(a) dot bold(b)=2t+10$，故 $t=-5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知双曲线 $E:x^2/a^2-y^2/b^2=1$（$a>0,b>0$），若矩形 $A B C D$ 的四个顶点在 $E$ 上，$A B,C D$ 的中点为 $E$ 的两个焦点，且 $2abs(A B)=3abs(B C)$，则 $E$ 的离心率是#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [设半焦距为 $c$。矩形的两条对边中点连线平行于另一组边，故 $A B,C D$ 垂直于 $x$ 轴。将 $x=plus.minus c$ 代入双曲线，得 $abs(y)=b^2/a$，于是 $abs(A B)=2b^2/a$，$abs(B C)=2c$。
    题设给出 $2b^2=3a c$。利用 $b^2=c^2-a^2$，两边除以 $a^2$，得 $2e^2-3e-2=0$，即 $(2e+1)(e-2)=0$。由 $e>1$，得 $e=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=cases(abs(x) & quad x<=m, x^2-2m x+4m & quad x>m)$，其中 $m>0$，若存在实数 $b$，使得关于 $x$ 的方程 $f(x)=b$ 有三个不同的根，则 $m$ 的取值范围是#fill-placeholder()。],
  answers: ([$(3,+infinity)$],),
  explanation: [当 $x>m$ 时，$f(x)=(x-m)^2+4m-m^2$ 严格递增，值域为 $(4m-m^2,+infinity)$，至多提供一个根。
    当 $x<=m$ 时，$abs(x)=b$ 有两个不同的根当且仅当 $0<b<=m$。故原方程有三个不同的根当且仅当 $0<b<=m$ 且 $b>4m-m^2$。
    由 $m>0$，存在这样的 $b$ 当且仅当 $m>4m-m^2$，即 $m>3$；此时取 $b=m$ 即可。],
)

#section[解答题：共 6 小题，共 75 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 12,
  stem: [某儿童乐园在“六一”儿童节推出了一项趣味活动。参加活动的儿童需转动如图所示的转盘两次，每次转动后，待转盘停止转动时，记录指针所指区域中的数。设两次记录的数分别为 $x,y$，奖励规则如下：\
    ① 若 $x y<=3$，则奖励玩具一个；\
    ② 若 $x y>=8$，则奖励水杯一个；\
    ③ 其余情况奖励饮料一瓶。\
    假设转盘质地均匀，四个区域划分均匀。小亮准备参加此项活动。
    #figure(spinner())],
  parts: (
    subquestion(
      stem: [求小亮获得玩具的概率；],
      answers: ([$5/16$],),
      explanation: [两次转动的结果用有序数对 $(x,y)$ 表示，$x,y in {1,2,3,4}$，共有 $4 times 4=16$ 种等可能的结果。满足 $x y<=3$ 的结果为 $(1,1),(1,2),(1,3),(2,1),(3,1)$，共 5 种，故获得玩具的概率为 $5/16$。],
    ),
    subquestion(
      stem: [请比较小亮获得水杯与获得饮料的概率的大小，并说明理由。],
      answers: ([获得水杯的概率为 $3/8$，大于获得饮料的概率 $5/16$。],),
      explanation: [满足 $x y>=8$ 的结果为 $(2,4),(3,3),(3,4),(4,2),(4,3),(4,4)$，共 6 种，故获得水杯的概率为 $6/16=3/8$。
        获得饮料的概率为 $1-5/16-6/16=5/16$，所以获得水杯的概率较大。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设 $f(x)=2sqrt(3)sin(pi-x)sin x-(sin x-cos x)^2$。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的单调递增区间；],
      answers: ([$[k pi-pi/12,k pi+(5pi)/12]$，$k in ZZ$。],),
      explanation: [由 $sin(pi-x)=sin x$ 及二倍角公式，得
        $ f(x)=2sqrt(3)sin^2 x-(1-2sin x cos x) $
        $ =sin 2x-sqrt(3)cos 2x+sqrt(3)-1=2sin(2x-pi/3)+sqrt(3)-1. $
        令 $2k pi-pi/2<=2x-pi/3<=2k pi+pi/2$，解得 $k pi-pi/12<=x<=k pi+(5pi)/12$。故单调递增区间为 $[k pi-pi/12,k pi+(5pi)/12]$，$k in ZZ$。],
    ),
    subquestion(
      stem: [把 $y=f(x)$ 图象上所有点的横坐标伸长到原来的 2 倍（纵坐标不变），再把得到的图象向左平移 $pi/3$ 个单位，得到函数 $y=g(x)$ 的图象，求 $g(pi/6)$ 的值。],
      answers: ([$sqrt(3)$],),
      explanation: [横坐标伸长到原来的 2 倍后，函数变为 $y=f(x/2)=2sin(x-pi/3)+sqrt(3)-1$。再向左平移 $pi/3$ 个单位，得
        $ g(x)=2sin x+sqrt(3)-1. $
        因此 $g(pi/6)=2 times 1/2+sqrt(3)-1=sqrt(3)$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [在如图所示的几何体中，$D$ 是 $A C$ 的中点，$E F parallel D B$。
    #figure(solid())],
  parts: (
    subquestion(
      stem: [已知 $A B=B C$，$A E=E C$，求证：$A C perp F B$；],
      answers: ([证明见解析。],),
      explanation: [连接 $D E$。
        #figure(solid(auxiliary: 1))
        因 $A B=B C$，$A E=E C$，且 $D$ 是 $A C$ 的中点，由等腰三角形底边上的中线垂直于底边，得 $B D perp A C$，$E D perp A C$。
        又 $E F parallel D B$，故这两条平行直线确定平面 $B D E F$。$B D,E D$ 是该平面内相交于 $D$ 的两条直线，故 $A C perp$ 平面 $B D E F$。由 $F B subset$ 平面 $B D E F$，得 $A C perp F B$。],
    ),
    subquestion(
      stem: [已知 $G,H$ 分别是 $E C$ 和 $F B$ 的中点，求证：$G H parallel$ 平面 $A B C$。],
      answers: ([证明见解析。],),
      explanation: [取 $F C$ 的中点 $I$，连接 $G I,H I$。
        #figure(solid(auxiliary: 2))
        由三角形中位线定理，$G I parallel E F$，$H I parallel C B$。又 $E F parallel D B$，故 $G I parallel D B$。
        因 $D B,C B subset$ 平面 $A B C$，而 $G I,H I$ 均在该平面外，所以 $G I parallel$ 平面 $A B C$，$H I parallel$ 平面 $A B C$。
        $G I,H I$ 相交于 $I$，于是平面 $G H I parallel$ 平面 $A B C$，从而 $G H parallel$ 平面 $A B C$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知数列 ${a_n}$ 的前 $n$ 项和 $S_n=3n^2+8n$，${b_n}$ 是等差数列，且 $a_n=b_n+b_(n+1)$。],
  parts: (
    subquestion(
      stem: [求数列 ${b_n}$ 的通项公式；],
      answers: ([$b_n=3n+1$],),
      explanation: [当 $n>=2$ 时，$a_n=S_n-S_(n-1)=6n+5$；当 $n=1$ 时，$a_1=S_1=11$ 也符合此式。设 ${b_n}$ 的公差为 $d$，由 $a_1=11,a_2=17$，得
        $ cases(2b_1+d=11, 2b_1+3d=17), quad d=3, quad b_1=4. $
        所以 $b_n=4+3(n-1)=3n+1$。],
    ),
    subquestion(
      stem: [令 $c_n=(a_n+1)^(n+1)/(b_n+2)^n$，求数列 ${c_n}$ 的前 $n$ 项和 $T_n$。],
      answers: ([$T_n=3n dot 2^(n+2)$],),
      explanation: [代入得 $c_n=(6n+6)^(n+1)/(3n+3)^n=6(n+1)2^n$。于是
        $ T_n/6=2 dot 2+3 dot 2^2+dots+(n+1)2^n, $
        $ (2T_n)/6=2 dot 2^2+3 dot 2^3+dots+(n+1)2^(n+1). $
        后式减前式，得
        $ T_n/6=(n+1)2^(n+1)-(2 dot 2+2^2+dots+2^n) $
        $ =(n+1)2^(n+1)-2^(n+1)=n dot 2^(n+1). $
        所以 $T_n=3n dot 2^(n+2)$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设函数 $f(x)=x ln x-a x^2+(2a-1)x$，$a in RR$。],
  parts: (
    subquestion(
      stem: [令 $g(x)=f'(x)$，求函数 $g(x)$ 的单调区间；],
      answers: (
        [当 $a<=0$ 时，$g$ 在 $(0,+infinity)$ 上递增，无递减区间；当 $a>0$ 时，$g$ 在 $(0,1/(2a))$ 上递增，在 $(1/(2a),+infinity)$ 上递减。],
      ),
      explanation: [函数定义域为 $(0,+infinity)$，求导得
        $ g(x)=f'(x)=ln x-2a x+2a, quad g'(x)=1/x-2a=(1-2a x)/x. $
        若 $a<=0$，则 $g'(x)>0$，故 $g$ 在整个定义域上递增。
        若 $a>0$，则在 $0<x<1/(2a)$ 时 $g'(x)>0$，在 $x>1/(2a)$ 时 $g'(x)<0$，故单调区间如答案。],
    ),
    subquestion(
      stem: [已知 $f(x)$ 在 $x=1$ 处取得极大值，求实数 $a$ 的取值范围。],
      answers: ([$(1/2,+infinity)$],),
      explanation: [对任意 $a$，都有 $g(1)=f'(1)=0$，须进一步判断导数在 $1$ 左右的符号。
        #step[当 $a<1/2$ 时][$g'(1)=1-2a>0$，由连续性，$g$ 在 $1$ 的某邻域内严格递增。结合 $g(1)=0$，得 $f'$ 在 $1$ 左侧为负、右侧为正，故 $f$ 在此处取得极小值，不合题意。]
        #step[当 $a=1/2$ 时][$g(x)=ln x-x+1$，由第 (1) 问，$g$ 在 $x=1$ 处取得唯一最大值 $0$，其余点均为负。因此 $f$ 在整个定义域上严格递减，$x=1$ 不是极值点。]
        #step[当 $a>1/2$ 时][$g'(1)=1-2a<0$，所以 $g$ 在 $1$ 的某邻域内严格递减。由 $g(1)=0$，得 $f'$ 在 $1$ 左侧为正、右侧为负，故 $f$ 在此处取得极大值。]
        综上，$a in (1/2,+infinity)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的长轴长为 $4$，焦距为 $2sqrt(2)$。
    #figure(ellipse-diagram())],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 的方程；],
      answers: ([$x^2/4+y^2/2=1$],),
      explanation: [由 $2a=4$，$2c=2sqrt(2)$，得 $a=2,c=sqrt(2)$，故 $b^2=a^2-c^2=2$，椭圆方程为 $x^2/4+y^2/2=1$。],
    ),
    subquestion(
      stem: [过动点 $M(0,m)$（$m>0$）的直线交 $x$ 轴于点 $N$，交 $C$ 于点 $A,P$（$P$ 在第一象限），且 $M$ 是线段 $P N$ 的中点。过点 $P$ 作 $x$ 轴的垂线交 $C$ 于另一点 $Q$，延长线 $Q M$ 交 $C$ 于点 $B$。],
      parts: (
        subquestion(
          stem: [设直线 $P M,Q M$ 的斜率分别为 $k,k'$，证明 $k'/k$ 为定值；],
          answers: ([$k'/k=-3$，证明见解析。],),
          explanation: [设 $P(p,2m)$，其中 $p>0$。由 $M$ 为 $P N$ 的中点及 $N$ 在 $x$ 轴上，知此设法成立，并有 $N(-p,0)$。由椭圆关于 $x$ 轴对称，得 $Q(p,-2m)$。
            因而 $k=(2m-m)/p=m/p>0$，$k'=(-2m-m)/p=-3m/p$，故 $k'/k=-3$，为定值。],
        ),
        subquestion(
          stem: [求直线 $A B$ 的斜率的最小值。],
          answers: ([$sqrt(6)/2$],),
          explanation: [沿用第 (i) 问，设 $A(x_A,y_A)$，$B(x_B,y_B)$，则
            $ P A:y=k x+m, quad Q B:y=-3k x+m. $
            将 $y=k x+m$ 代入椭圆，得
            $ (1+2k^2)x^2+4m k x+2m^2-4=0. $
            其中一根为 $p$，且 $m=k p$，由韦达定理，
            $ x_A=(-4m k)/(1+2k^2)-p=(-p(1+6k^2))/(1+2k^2). $
            同理，将 $y=-3k x+m$ 代入椭圆，所得方程一根也为 $p$，故
            $ x_B=(12m k)/(1+18k^2)-p=(-p(1+6k^2))/(1+18k^2). $
            因 $k,p>0$，有 $x_B>x_A$，所以 $A B$ 的斜率存在，且
            $ k_(A B)=(y_B-y_A)/(x_B-x_A)=(-k(3x_B+x_A))/(x_B-x_A) $
            $ =(1+6k^2)/(4k)=1/4 (6k+1/k)>=sqrt(6)/2. $
            等号当且仅当 $k=1/sqrt(6)$ 时成立。由 $P(p,2m)$ 在椭圆上及 $m=k p$，得 $p^2+8m^2=4$，此时
            $ p=(2sqrt(21))/7, quad m=sqrt(14)/7. $
            这给出第一象限内的点 $P$，且 $M$ 在椭圆内部，两条过 $M$ 的直线均与椭圆交于两个不同点，符合题意。因此所求最小值为 $sqrt(6)/2$。],
        ),
      ),
    ),
  ),
)
