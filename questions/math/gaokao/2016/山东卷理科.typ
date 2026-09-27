#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "山东卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016山东理.pdf",
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
    for (y, label) in ((0, [开始]), (-8.4, [结束])) {
      rect((-0.65, y - 0.3), (0.65, y + 0.3), radius: 0.15)
      content((0, y), label)
    }
    for (y, label) in ((-1.2, [输入 $a,b$]), (-7.2, [输出 $i$])) {
      line(
        (-1, y - 0.35),
        (0.8, y - 0.35),
        (1, y + 0.35),
        (-0.8, y + 0.35),
        close: true,
      )
      content((0, y), label)
    }
    rect((-0.7, -2.75), (0.7, -2.05))
    content((0, -2.4), $i=1$)
    rect((-2, -4.15), (2, -3.45))
    content((0, -3.8), $a=a+i,b=b-i$)
    line((0, -5), (1.25, -5.6), (0, -6.2), (-1.25, -5.6), close: true)
    content((0, -5.6), $a>b$)
    rect((2.6, -4.15), (4.8, -3.45))
    content((3.7, -3.8), $i=i+1$)
    for (a, b) in (
      (-0.3, -0.85),
      (-1.55, -2.05),
      (-2.75, -3.45),
      (-4.15, -5),
      (-6.2, -6.85),
      (-7.55, -8.1),
    ) {
      line((0, a), (0, b), mark: (end: ">"))
    }
    line((1.25, -5.6), (3.7, -5.6), (3.7, -4.15), mark: (end: ">"))
    line((3.7, -3.45), (3.7, -3.05), (0, -3.05), mark: (end: ">"))
    content((1.65, -5.45), [否], anchor: "south")
    content((0.2, -6.5), [是], anchor: "west")
  })
}

#let frustum(auxiliary: false) = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((-0.22, -0.35), (0.95, 0), (0, 1), {
    let r = calc.sqrt(3)
    let A = (2 * r, 0, 0)
    let B = (0, 2 * r, 0)
    let C = (-2 * r, 0, 0)
    let E = (0, -r, 3)
    let F = (0, r, 3)
    let G = (-r, -r / 2, 1.5)
    let H = (0, 1.5 * r, 1.5)
    let M = (-r, r / 2, 1.5)
    let phase = calc.atan(0.22 / 0.95)
    let offset = calc.acos(
      -2 * r * 0.3325 / (6 * calc.sqrt(0.22 * 0.22 + 0.95 * 0.95)),
    )
    let left = phase - offset
    let right = phase + offset
    let arc-points(radius, z, start, end) = range(101).map(i => {
      let t = start + (end - start) * i / 100
      (radius * calc.cos(t), radius * calc.sin(t), z)
    })
    line(..arc-points(2 * r, 0, left, right))
    line(..arc-points(2 * r, 0, right, left + 360deg), stroke: (
      dash: figure-style.dash,
    ))
    line(..arc-points(r, 3, 0deg, 360deg))
    for t in (left, right) {
      line(
        (2 * r * calc.cos(t), 2 * r * calc.sin(t), 0),
        (r * calc.cos(t), r * calc.sin(t), 3),
      )
    }
    line(E, F, B)
    for points in ((A, B, C, A), (E, C), (G, H), (A, F)) {
      line(..points, stroke: (dash: figure-style.dash))
    }
    if auxiliary {
      line(F, C, stroke: (dash: figure-style.dash))
      line(G, M, H, stroke: (dash: figure-style.dash))
      content((-r, r / 2 + 0.35, 1.65), $M$, anchor: "west")
    }
    for (p, label, anchor) in (
      ((2 * r, -0.1, -0.24), $A$, "north"),
      ((0, 2 * r + 0.25, 0), $B$, "west"),
      ((-2 * r, 0.55, 0.25), $C$, "west"),
      ((0, -r - 0.25, 3.05), $E$, "east"),
      ((0, r + 0.25, 3.1), $F$, "west"),
      ((-r + 0.3, -r / 2 - 0.25, 1.5), $G$, "east"),
      ((0, 1.5 * r + 0.6, 1.5), $H$, "west"),
      ((0, -0.15, 0.16), $O$, "south-east"),
      ((0, -0.15, 3.06), $O'$, "south-east"),
    ) { content(p, label, anchor: anchor) }
  })
})
#let conics() = {
  set text(size: 10pt)
  cetz.canvas(length: 16mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: false,
      tick: (stroke: figure-style.thickness),
    ))
    let t = 0.54
    let p = (t, t * t / 2)
    let d = (2 * t * t * t / (1 + 4 * t * t), -t * t / (2 * (1 + 4 * t * t)))
    let discriminant = calc.sqrt(1 + 4 * t * t - t * t * t * t)
    let xa = (2 * t * t * t + discriminant) / (1 + 4 * t * t)
    let xb = (2 * t * t * t - discriminant) / (1 + 4 * t * t)
    plot.plot(
      size: (6, 4),
      axis-style: "school-book",
      x-min: -1.5,
      x-max: 1.5,
      y-min: -0.9,
      y-max: 1.1,
      x-tick-step: none,
      y-tick-step: none,
      {
        plot.annotate(resize: false, {
          line(
            ..range(181).map(i => (
              calc.cos(i * 2deg),
              0.5 * calc.sin(i * 2deg),
            )),
          )
          line(
            ..range(101).map(i => {
              let x = -1.2 + 2.4 * i / 100
              (x, x * x / 2)
            }),
          )
          line((-0.95, -0.95 * t - t * t / 2), (1.32, 1.32 * t - t * t / 2))
          line((t, -0.8), (t, 0.8))
          line((0, 0), (t, -0.25))
          line((0, 0.5), p)
          for (position, label, anchor) in (
            ((-0.06, 0.06), $O$, "south-east"),
            ((-0.05, 0.56), $F$, "south-east"),
            ((-0.07, -0.19), $G$, "east"),
            ((d.at(0) + 0.02, d.at(1) - 0.06), $D$, "north-west"),
            ((t + 0.08, -0.24), $M$, "west"),
            ((t + 0.06, p.at(1) - 0.04), $P$, "north-west"),
            ((xa + 0.24, t * xa - t * t / 2 - 0.02), $A$, "west"),
            ((xb - 0.04, t * xb - t * t / 2 - 0.05), $B$, "north-east"),
            ((1.32, 1.32 * t - t * t / 2 + 0.05), $l$, "south"),
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
  stem: [若复数 $z$ 满足 $2z+overline(z)=3-2i$，其中 $i$ 为虚数单位，则 $z=$#choice-placeholder()。],
  choices: ([$1+2i$], [$1-2i$], [$-1+2i$], [$-1-2i$]),
  answers: ([B],),
  explanation: [设 $z=u+v i$，其中 $u,v in RR$，则 $2z+overline(z)=3u+v i$。比较实部与虚部得 $u=1,v=-2$，故 $z=1-2i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={y|y=2^x,x in RR}$，$B={x|x^2-1<0}$，则 $A union B=$#choice-placeholder()。],
  choices: ([$(-1,1)$], [$(0,1)$], [$(-1,+infinity)$], [$(0,+infinity)$]),
  answers: ([C],),
  explanation: [由指数函数的值域得 $A=(0,+infinity)$，解不等式得 $B=(-1,1)$，故 $A union B=(-1,+infinity)$。],
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
  stem: [函数 $f(x)=(sqrt(3)sin x+cos x)(sqrt(3)cos x-sin x)$ 的最小正周期是#choice-placeholder()。],
  choices: ([$pi/2$], [$pi$], [$(3pi)/2$], [$2pi$]),
  answers: ([B],),
  explanation: [展开并利用二倍角公式，得
    $
      f(x)=2sin x cos x+sqrt(3)(cos^2 x-sin^2 x)=sin 2x+sqrt(3)cos 2x=2sin(2x+pi/3).
    $
    故最小正周期为 $T=(2pi)/2=pi$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知非零向量 $bold(m),bold(n)$ 满足 $4abs(bold(m))=3abs(bold(n))$，$cos lr(〈bold(m), bold(n)〉)=1/3$。若 $bold(n) perp (t bold(m)+bold(n))$，则实数 $t$ 的值为#choice-placeholder()。],
  choices: ([$4$], [$-4$], [$9/4$], [$-9/4$]),
  answers: ([B],),
  explanation: [由已知得 $bold(m) dot bold(n)=abs(bold(m))abs(bold(n))/3=abs(bold(n))^2/4$。垂直条件给出
    $ 0=t bold(m) dot bold(n)+abs(bold(n))^2=(t/4+1)abs(bold(n))^2. $
    因 $bold(n)!=bold(0)$，得 $t=-4$。],
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
  stem: [执行如图的程序框图，若输入的 $a,b$ 的值分别为 $0$ 和 $9$，则输出的 $i$ 的值为#fill-placeholder()。
    #figure(loop-chart())],
  answers: ([$3$],),
  explanation: [依次执行循环体：$i=1$ 时，$(a,b)=(1,8)$，不满足 $a>b$；$i=2$ 时，$(a,b)=(3,6)$，仍不满足；$i=3$ 时，$(a,b)=(6,3)$，满足条件，故输出 $3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $(a x^2+1/sqrt(x))^5$ 的展开式中 $x^5$ 的系数是 $-80$，则实数 $a=$#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [通项为 $T_(r+1)=C_5^r a^(5-r)x^(10-(5r)/2)$。令 $10-(5r)/2=5$，得 $r=2$，故 $10a^3=-80$，解得 $a=-2$。],
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
  stem: [在 $[-1,1]$ 上随机地取一个数 $k$，则事件“直线 $y=k x$ 与圆 $(x-5)^2+y^2=9$ 相交”发生的概率为#fill-placeholder()。],
  answers: ([$3/4$],),
  explanation: [圆心为 $(5,0)$，半径为 $3$。直线与圆相交等价于圆心到直线的距离小于半径，即 $5abs(k)/sqrt(1+k^2)<3$，解得 $abs(k)<3/4$。因此所求概率为 $((3/4)-(-3/4))/(1-(-1))=3/4$。],
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
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $2(tan A+tan B)=(tan A)/(cos B)+(tan B)/(cos A)$。],
  parts: (
    subquestion(
      stem: [证明：$a+b=2c$；],
      answers: ([证明见解析。],),
      explanation: [原式有意义保证 $cos A cos B!=0$。两边同乘 $cos A cos B$，得
        $ 2(sin A cos B+cos A sin B)=sin A+sin B. $
        因 $A+B=pi-C$，得 $2sin C=sin A+sin B$。由正弦定理，$a+b=2c$。],
    ),
    subquestion(
      stem: [求 $cos C$ 的最小值。],
      answers: ([$1/2$],),
      explanation: [由第 (1) 问和余弦定理，
        $ cos C=(a^2+b^2-c^2)/(2a b)=3/8 (a/b+b/a)-1/4>=3/8 times 2-1/4=1/2. $
        等号当且仅当 $a=b$ 时成立，此时 $a=b=c$，等边三角形满足原条件。故最小值为 $1/2$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [在如图所示的圆台中，$A C$ 是下底面圆 $O$ 的直径，$E F$ 是上底面圆 $O'$ 的直径，$F B$ 是圆台的一条母线。
    #figure(frustum())],
  parts: (
    subquestion(
      stem: [已知 $G,H$ 分别为 $E C,F B$ 的中点，求证：$G H parallel$ 平面 $A B C$；],
      answers: ([证明见解析。],),
      explanation: [取 $F C$ 的中点 $M$，连接 $G M,H M$。
        #figure(frustum(auxiliary: true))
        由三角形中位线定理，$G M parallel E F$，$H M parallel B C$。圆台上下底面平行，故 $E F parallel$ 平面 $A B C$，从而 $G M parallel$ 平面 $A B C$；同理 $H M parallel$ 平面 $A B C$。
        两直线 $G M,H M$ 相交，因此平面 $G H M parallel$ 平面 $A B C$，于是 $G H parallel$ 平面 $A B C$。],
    ),
    subquestion(
      stem: [已知 $E F=F B=1/2 A C=2sqrt(3)$，$A B=B C$，求二面角 $F-B C-A$ 的余弦值。],
      answers: ([$sqrt(7)/7$],),
      explanation: [圆台的下底面半径为 $2sqrt(3)$，上底面半径为 $sqrt(3)$。母线长为 $2sqrt(3)$，故高为 $sqrt((2sqrt(3))^2-(2sqrt(3)-sqrt(3))^2)=3$。
        由 $A B=B C$ 及 $A C$ 为直径，得 $O B perp A C$。以 $O$ 为原点，分别沿 $O A,O B,O O'$ 建立 $x,y,z$ 轴，则
        $ A=(2sqrt(3),0,0), quad B=(0,2sqrt(3),0), $
        $ C=(-2sqrt(3),0,0), quad F=(0,sqrt(3),3). $
        平面 $F B C$ 的一个法向量为 $bold(n)=(-sqrt(3),sqrt(3),1)$，平面 $A B C$ 的法向量为 $bold(k)=(0,0,1)$，故两平面所成锐角的余弦为
        $ abs(bold(n) dot bold(k))/(abs(bold(n))abs(bold(k)))=1/sqrt(7). $
        $F$ 在底面的射影 $(0,sqrt(3),0)$ 与 $A$ 位于直线 $B C$ 的同侧，故题设二面角为锐角，其余弦为 $sqrt(7)/7$。],
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
  score: 12,
  stem: [甲、乙两人组成“星队”参加猜成语活动，每轮活动由甲、乙各猜一个成语。在一轮活动中，如果两人都猜对，则“星队”得 3 分；如果只有一个人猜对，则“星队”得 1 分；如果两人都没猜对，则“星队”得 0 分。已知甲每轮猜对的概率是 $3/4$，乙每轮猜对的概率是 $2/3$；每轮活动中甲、乙猜对与否互不影响，各轮结果亦互不影响。假设“星队”参加两轮活动，求：],
  parts: (
    subquestion(
      stem: [“星队”至少猜对 3 个成语的概率；],
      answers: ([$2/3$],),
      explanation: [一轮中猜对两个、一个、零个成语的概率分别为
        $ p_2=3/4 times 2/3=1/2, $
        $ p_1=3/4 times 1/3+1/4 times 2/3=5/12, quad p_0=1/4 times 1/3=1/12. $
        至少猜对 3 个成语，包括两轮各猜对两个，或一轮猜对两个且另一轮猜对一个，故概率为 $p_2^2+2p_2 p_1=1/4+5/12=2/3$。],
    ),
    subquestion(
      stem: [“星队”两轮得分之和 $X$ 的分布列和数学期望 $E X$。],
      answers: (
        [#table(
            columns: 7,
            align: center,
            [$X$], [$0$], [$1$], [$2$], [$3$], [$4$], [$6$],
            [$P$], [$1/144$], [$5/72$], [$25/144$], [$1/12$], [$5/12$], [$1/4$],
          )
          $E X=23/6$。],
      ),
      explanation: [一轮得分为 $0,1,3$ 的概率分别为 $1/12,5/12,1/2$。由两轮独立性，
        $ P(X=0)=(1/12)^2=1/144, quad P(X=1)=2 times 1/12 times 5/12=5/72, $
        $ P(X=2)=(5/12)^2=25/144, quad P(X=3)=2 times 1/12 times 1/2=1/12, $
        $ P(X=4)=2 times 5/12 times 1/2=5/12, quad P(X=6)=(1/2)^2=1/4. $
        分布列如答案。由期望的可加性，$E X=2(0 times 1/12+1 times 5/12+3 times 1/2)=23/6$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知 $f(x)=a(x-ln x)+(2x-1)/x^2$，$a in RR$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性；],
      answers: (
        [当 $a<=0$ 时，在 $(0,1)$ 上递增，在 $(1,+infinity)$ 上递减。
          当 $0<a<2$ 时，在 $(0,1)$ 和 $(sqrt(2/a),+infinity)$ 上递增，在 $(1,sqrt(2/a))$ 上递减。
          当 $a=2$ 时，在 $(0,+infinity)$ 上递增。
          当 $a>2$ 时，在 $(0,sqrt(2/a))$ 和 $(1,+infinity)$ 上递增，在 $(sqrt(2/a),1)$ 上递减。],
      ),
      explanation: [函数定义域为 $(0,+infinity)$，求导得
        $ f'(x)=a-a/x-2/x^2+2/x^3=((x-1)(a x^2-2))/x^3. $
        #step[分类讨论][
          若 $a<=0$，恒有 $a x^2-2<0$，故导数在 $(0,1)$ 上为正，在 $(1,+infinity)$ 上为负。
          若 $a>0$，令 $r=sqrt(2/a)$，则 $a x^2-2$ 在 $(0,r)$ 上为负，在 $(r,+infinity)$ 上为正。
          当 $0<a<2$ 时，$r>1$，导数依次在 $(0,1)$、$(1,r)$、$(r,+infinity)$ 上取正、负、正。
          当 $a=2$ 时，$r=1$，$f'(x)=2(x-1)^2(x+1)/x^3>=0$，且只在 $x=1$ 处为零，故 $f$ 在整个定义域上严格递增。
          当 $a>2$ 时，$0<r<1$，导数依次在 $(0,r)$、$(r,1)$、$(1,+infinity)$ 上取正、负、正。由此得各单调区间。]],
    ),
    subquestion(
      stem: [当 $a=1$ 时，证明 $f(x)>f'(x)+3/2$ 对于任意的 $x in [1,2]$ 成立。],
      answers: ([证明见解析。],),
      explanation: [在 $[1,2]$ 上，$x-ln x$ 单调递增，故 $x-ln x>=1$，等号仅在 $x=1$ 时成立；$(2x-1)/x^2$ 的导数为 $2(1-x)/x^3<=0$，故 $(2x-1)/x^2>=3/4$，等号仅在 $x=2$ 时成立。
        两个等号不能同时成立，因此 $f(x)>7/4$。
        另一方面，$f'(x)=(1-1/x)(1-2/x^2)$。当 $1<=x<=sqrt(2)$ 时，$f'(x)<=0$；当 $sqrt(2)<=x<=2$ 时，两个因子均非负且不超过 $1/2$，故 $f'(x)<=1/4$。
        综上，$f(x)-f'(x)>7/4-1/4=3/2$，结论成立。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [平面直角坐标系 $x O y$ 中，椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的离心率是 $sqrt(3)/2$，抛物线 $E:x^2=2y$ 的焦点 $F$ 是 $C$ 的一个顶点。
    #figure(conics())],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 的方程；],
      answers: ([$x^2+4y^2=1$],),
      explanation: [抛物线的焦点为 $F(0,1/2)$，故 $b=1/2$。又 $e^2=1-b^2/a^2=3/4$，得 $a=2b=1$，所以椭圆方程为 $x^2+4y^2=1$。],
    ),
    subquestion(
      stem: [设 $P$ 是 $E$ 上的动点，且位于第一象限，$E$ 在点 $P$ 处的切线 $l$ 与 $C$ 交于不同的两点 $A,B$，线段 $A B$ 的中点为 $D$，直线 $O D$ 与过 $P$ 且垂直于 $x$ 轴的直线交于点 $M$。],
      parts: (
        subquestion(
          stem: [求证：点 $M$ 在定直线上；],
          answers: ([定直线为 $y=-1/4$，证明见解析。],),
          explanation: [设 $P(t,t^2/2)$，$t>0$，由 $y'=x$，得切线 $l:y=t x-t^2/2$。与椭圆方程联立消去 $y$，得
            $ (1+4t^2)x^2-4t^3 x+t^4-1=0. $
            其判别式为 $4(1+4t^2-t^4)>0$，即 $0<t^2<2+sqrt(5)$。由韦达定理及中点公式，
            $ x_D=(2t^3)/(1+4t^2), quad y_D=t x_D-t^2/2=(-t^2)/(2(1+4t^2)). $
            因 $x_D>0$，直线 $O D$ 的方程为 $y=-x/(4t)$。代入 $x_M=t$，得 $y_M=-1/4$，故 $M$ 在定直线 $y=-1/4$ 上。],
        ),
        subquestion(
          stem: [直线 $l$ 与 $y$ 轴交于点 $G$，记 $triangle P F G$ 的面积为 $S_1$，$triangle P D M$ 的面积为 $S_2$，求 $S_1/S_2$ 的最大值及取得最大值时点 $P$ 的坐标。],
          answers: ([最大值为 $9/4$，此时 $P(sqrt(2)/2,1/4)$。],),
          explanation: [由 $G(0,-t^2/2)$ 及 $F(0,1/2)$，得
            $ S_1=1/2 dot (1+t^2)/2 dot t=(t(1+t^2))/4. $
            又 $P M=t^2/2+1/4$，$D$ 到直线 $P M$ 的距离为
            $ t-x_D=(t(1+2t^2))/(1+4t^2)>0, $
            所以 $S_2=(t(1+2t^2)^2)/(8(1+4t^2))$，从而
            $ S_1/S_2=(2(1+t^2)(1+4t^2))/(1+2t^2)^2. $
            令 $u=1+2t^2$，则
            $ S_1/S_2=((u+1)(2u-1))/u^2=2+1/u-1/u^2=9/4-(1/u-1/2)^2<=9/4. $
            等号当且仅当 $u=2$，即 $t^2=1/2$ 时成立，此值满足切线与椭圆有两个不同交点的条件。故最大值为 $9/4$，此时 $P(sqrt(2)/2,1/4)$。],
        ),
      ),
    ),
  ),
)
