#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)

#show: exam.with(
  subject: "数学",
  year: 2026,
  type: "上海市春季招生统一文化考试",
  name: "上海春季卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2026/2026上海春季.pdf",
  regions: ("上海",),
)

#let triangle-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 15mm, {
    import cetz.draw: *
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    let a = (1.5, calc.sqrt(3) / 2)
    line(a, (0, 0), (3, 0), a)
    line(a, (1, 0))
    line(a, (2, 0))
    content(a, $A$, anchor: "south", padding: 0.1)
    for (i, label) in ($B$, $D$, $E$, $C$).enumerate() {
      content((i, 0), label, anchor: "north", padding: 0.1)
    }
  })
}

#let oil-figure(tilted: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 3mm, {
    import cetz.draw: *
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    let tip = (9.9, 3 + 6.7 * calc.sqrt(3))
    let slope = if tilted { (tip.at(1) - 12.1) / 9.9 } else { 0 }
    line((-3.2, 0), (3.2, 0), (3.2, 16), (-3.2, 16), close: true)
    line((3.2, 3), tip)
    line((-3.2, 12.1 - 3.2 * slope), (3.2, 12.1 + 3.2 * slope))
    if tilted {
      line((3.2, 12.1 + 3.2 * slope), tip, stroke: (dash: figure-style.dash))
      line((0, 0), (0, 16), stroke: (dash: figure-style.dash))
      content((0, 12.1), $M$, anchor: "south-east", padding: 0.3)
      content(tip, $F$, anchor: "south", padding: 0.3)
      content((3.2, 3), $E$, anchor: "north-west", padding: 0.3)
    } else {
      content((-3.2, 6), [12.1 cm], anchor: "east", padding: 0.4)
      content((0, 0), [6.4 cm], anchor: "north", padding: 0.4)
      content((3.2, 1.5), [3 cm], anchor: "west", padding: 0.4)
      content((7, 9), [13.4 cm], anchor: "west", padding: 0.4)
      content((-3.2, 16), [16 cm], anchor: "east", padding: 0.4)
      arc((3.2, 3), start: 60deg, stop: 90deg, radius: 3, anchor: "origin")
      content(
        (4.25, 6.7),
        text(size: 7pt)[$30 degree$],
        anchor: "center",
        padding: 0,
      )
    }
  })
}

#let symmetry-figure(kind) = {
  set text(size: 8pt)
  cetz.canvas(length: 9mm, {
    import cetz.draw: *
    set-style(axes: (
      stroke: figure-style.thickness,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      padding: 0,
      overshoot: 0.15,
      shared-zero: $O$,
      x: (tick: (length: 0, label: (anchor: "north-west"))),
    ))
    let top(x) = if kind == 0 { x + 0.5 } else if kind == 2 {
      x * x + 0.5
    } else { 0.5 + 2 * x - x * x }
    let bottom(x) = if kind == 3 { -0.5 - x * x } else { -top(x) }
    plot.plot(
      size: (2.4, 3.4),
      axis-style: "school-book",
      x-min: -0.6,
      x-max: 1.6,
      y-min: -1.9,
      y-max: 1.9,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: 1,
      x-format: value => [#h(0.3em)#value],
      y-tick-step: 1,
      {
        plot.add(top, domain: (0, 1), style: (stroke: figure-style.thickness))
        plot.add(bottom, domain: (0, 1), style: (
          stroke: figure-style.thickness,
        ))
        plot.annotate(resize: false, {
          line((1, bottom(1)), (1, top(1)), stroke: figure-style.thickness)
        })
      },
    )
  })
}

#let frustum-figure(auxiliary: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let a = (-2, -2, 0)
    let b = (2, -2, 0)
    let c = (2, 2, 0)
    let d = (-2, 2, 0)
    let a1 = (-1, -1, 3)
    let b1 = (1, -1, 3)
    let c1 = (1, 1, 3)
    let d1 = (-1, 1, 3)
    oblique-project((1, 0), (0.45, 0.35), (0, 0.85), {
      set-style(stroke: (thickness: figure-style.thickness, join: "round"))
      line(a, b, c, c1, d1, a1, b1, c1)
      line(a, a1)
      line(b, b1)
      line(a, d, c, stroke: (dash: figure-style.dash))
      line(d, d1, stroke: (dash: figure-style.dash))
      if auxiliary {
        line(b, d, stroke: (dash: figure-style.dash))
        line(a, c, stroke: (dash: figure-style.dash))
        line(a1, c1)
        line((0, 0, 0), c1, stroke: (dash: figure-style.dash))
        content((0, 0, 0), $O$, anchor: "north", padding: 0.12)
      }
      for (p, label, anchor) in (
        (a, $A$, "north-east"),
        (b, $B$, "north-west"),
        (c, $C$, "west"),
        (d, $D$, "south-east"),
        (a1, $A_1$, "east"),
        (b1, $B_1$, "north-east"),
        (c1, $C_1$, "south-west"),
        (d1, $D_1$, "south-east"),
      ) {
        content(p, label, anchor: anchor, padding: 0.12)
      }
    })
  })
}

#section[填空题]
#question(
  "fill-in",
  stem: [已知集合 $A = {2, 4}$，$B = {2, 3, m}$，若 $A subset.eq B$，则 $m =$#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [$4 in A$ 且 $A subset.eq B$，所以 $4 in B$。由 $4 != 2$、$4 != 3$，得 $m = 4$。],
)
#question(
  "fill-in",
  stem: [关于 $x$ 的不等式 $(x + 2)/(x - 3) < 0$ 的解集为#fill-placeholder()。],
  answers: ([$(-2, 3)$],),
  explanation: [在 $x != 3$ 时，两边同乘 $(x - 3)^2 > 0$，原不等式等价于 $(x + 2)(x - 3) < 0$，解得 $-2 < x < 3$。],
)
#question(
  "fill-in",
  stem: [已知 $arrow(a) = (x, 3)$，$arrow(b) = (4, 6)$，若 $arrow(a) parallel arrow(b)$，则 $x =$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [由向量平行的坐标条件，$6x - 3 times 4 = 0$，故 $x = 2$。],
)
#question(
  "fill-in",
  stem: [在平面直角坐标系中，点 $(1, 2)$ 到直线 $4x - 3y + 5 = 0$ 的距离为#fill-placeholder()。],
  answers: ([$3/5$],),
  explanation: [由点到直线的距离公式，得 $d = abs(4 times 1 - 3 times 2 + 5)/sqrt(4^2 + (-3)^2) = 3/5$。],
)
#question(
  "fill-in",
  stem: [$(1/x + 3x^2)^6$ 的二项展开式中，$1/x^3$ 的系数为#fill-placeholder()。],
  answers: ([$18$],),
  explanation: [展开式的通项为 $T_(k + 1) = C_6^k (1/x)^(6 - k)(3x^2)^k = C_6^k 3^k x^(3k - 6)$。#linebreak()令 $3k - 6 = -3$，得 $k = 1$，所求系数为 $C_6^1 times 3 = 18$。],
)
#question(
  "fill-in",
  stem: [若 $a > 0$，$b > 0$，且 $a + 2b = 4$，则 $a b$ 的最大值是#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [∵ $4 = a + 2b >= 2 sqrt(2a b)$，∴ $a b <= 2$。当且仅当 $a = 2b$，即 $a = 2$、$b = 1$ 时等号成立。],
)
#question(
  "fill-in",
  stem: [在 $5$ 个人中选 $3$ 个人去演讲，若甲一定去，则一共有#fill-placeholder()种选法。],
  answers: ([$6$],),
  explanation: [固定甲入选，再从其余 $4$ 人中选 $2$ 人，共有 $C_4^2 = 6$ 种选法。],
)
#question(
  "fill-in",
  stem: [已知点 $P$ 为抛物线 $Gamma: y^2 = 4x$ 上一点，若点 $P$ 到 $Gamma$ 的焦点的距离是 $P$ 到 $y$ 轴的距离的两倍，则点 $P$ 的横坐标是#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [焦点为 $(1, 0)$，准线为 $x = -1$。设 $P$ 的横坐标为 $x_0 >= 0$，由抛物线的定义，焦点距离为 $x_0 + 1$，到 $y$ 轴的距离为 $x_0$。故 $x_0 + 1 = 2x_0$，得 $x_0 = 1$。],
)
#question(
  "fill-in",
  stem: [已知 $m > 1$，对于所有满足 $abs(z) = 2$ 的复数 $z$，$abs(z - i)$ 的最小值与 $abs(z - m)$ 的最小值相同，则 $m =$#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [复数 $z$ 对应的点在圆 $x^2 + y^2 = 4$ 上。点 $(0, 1)$ 到此圆的最短距离为 $2 - 1 = 1$；点 $(m, 0)$ 到此圆的最短距离为 $abs(m - 2)$。#linebreak()所以 $abs(m - 2) = 1$。结合 $m > 1$，得 $m = 3$。],
)
#question(
  "fill-in",
  stem: [在 $triangle A B C$ 中，$D$、$E$ 在边 $B C$ 上，且 $arrow(B D) = arrow(D E) = arrow(E C)$，$abs(arrow(A D)) = 1$，$arrow(A D)$ 与 $arrow(A E)$ 所成的夹角为 $pi/3$，则 $arrow(A B) dot arrow(A C)$ 的最大值为#fill-placeholder()。
    #figure(triangle-figure())
  ],
  answers: ([$-39/32$],),
  explanation: [令 $arrow(u) = arrow(A D)$、$arrow(v) = arrow(A E)$，$t = abs(arrow(v)) > 0$。由等分关系，
    $
      arrow(A B) = 2 arrow(u) - arrow(v), quad arrow(A C) = -arrow(u) + 2 arrow(v).
    $
    又 $abs(arrow(u)) = 1$，$arrow(u) dot arrow(v) = t cos(pi/3) = t/2$，所以
    $ arrow(A B) dot arrow(A C) = -2 + 5/2 t - 2t^2 = -2(t - 5/8)^2 - 39/32. $
    当 $t = 5/8$ 时等号成立，故最大值为 $-39/32$。
  ],
)
#question(
  "fill-in",
  stem: [已知椭圆 $Gamma_1: x^2/a^2 + y^2 = 1$（$a > 1$）与椭圆 $Gamma_2: y^2/(b^2 + 2) + x^2/b^2 = 1$ 相交于 $A$、$B$、$C$、$D$ 四点，且这四点与 $Gamma_1$ 和 $Gamma_2$ 的四个焦点在同一个圆上，则 $b^2 =$#fill-placeholder()。],
  answers: ([$sqrt(3)$],),
  explanation: [四个焦点关于两坐标轴对称，共圆时圆心必为原点，两椭圆的半焦距相等。因此 $a^2 - 1 = 2$，即 $a^2 = 3$，该圆为 $x^2 + y^2 = 2$。#linebreak()联立 $x^2/3 + y^2 = 1$ 与圆方程，得交点满足 $x^2 = 3/2$、$y^2 = 1/2$。代入 $Gamma_2$，得
    $ 1/(2(b^2 + 2)) + 3/(2b^2) = 1. $
    化简得 $(b^2)^2 = 3$，由 $b^2 > 0$，得 $b^2 = sqrt(3)$。
  ],
)
#question(
  "fill-in",
  stem: [有一个油壶，壶身视为圆柱，壶嘴视为直线且不计容积，壶底直径 $6.4$ 厘米，壶身高 $16$ 厘米，壶内油液面高 $12.1$ 厘米，壶嘴长 $13.4$ 厘米，与壶身夹角为 $30 degree$，壶嘴最低点距壶底 $3$ 厘米。将壶身向壶嘴方向至少转#fill-placeholder()度可使油倒出（精确到 $0.01 degree$）。
    #figure(oil-figure())
  ],
  answers: ([$14.20$],),
  explanation: [
    #step[用体积守恒确定液面][以壶底圆心为原点，沿壶嘴方向为 $x$ 轴正方向、圆柱轴线向上为 $z$ 轴正方向，坐标系随壶身一起转动。设倾角为 $theta$。当液面尚未碰到壶底或壶口时，液面形如 $z = h + x tan theta$。#linebreak()底面关于 $x = 0$ 对称，$x tan theta$ 所对应的体积增减抵消；油的体积不变，所以 $h = 12.1$。
      #figure(oil-figure(tilted: true))
      图中 $M$ 是液面与圆柱轴线的交点，图形仍用随壶坐标表示。]
    #step[求液面到达壶嘴端点的倾角][壶嘴起点为 $E(3.2, 3)$，端点为
      $
        F(3.2 + 13.4 sin 30 degree, 3 + 13.4 cos 30 degree) = F(9.9, 3 + 6.7 sqrt(3)).
      $
      液面恰经过 $F$ 时，$3 + 6.7 sqrt(3) = 12.1 + 9.9 tan theta$，故
      $ theta = arctan((67 sqrt(3) - 91)/99) approx 14.20 degree. $
      在此倾角下，壶壁两侧液面高度为 $12.1 plus.minus 3.2 tan theta$，约为 $11.29$ 和 $12.91$，均在 $(0, 16)$ 内，所用体积关系成立，油也尚未从壶口溢出。#linebreak()在从 $0$ 增至该倾角的过程中，端点处液面高度 $12.1 + 9.9 tan theta$ 严格递增，故这就是首次从壶嘴倒出所需的最小倾角。]
  ],
)

#section[单选题]
#question(
  "single-choice",
  stem: [下列数列中是等差数列也是等比数列的是#choice-placeholder()。],
  choices: (
    [$1, -1, 1, -1, 1$],
    [$1, 2, 3, 4, 5$],
    [$5, 5, 5, 5, 5$],
    [$1, 2, 3, 5, 7$],
  ),
  answers: ([C],),
  explanation: [选项 C 的公差为 $0$、公比为 $1$，符合题意。#linebreak()选项 A 的相邻差不相等；选项 B 的相邻比不相等；选项 D 的相邻差不相等。故选 C。],
)
#question(
  "single-choice",
  stem: [已知 $x > y > 1$，则下列不等式恒成立的是#choice-placeholder()。],
  choices: ([$x > y^2$], [$x y > x + y$], [$x^2 > y$], [$x + y > x y$]),
  answers: ([C],),
  explanation: [∵ $x > y > 1$，∴ $x^2 > x > y$，选项 C 恒成立。#linebreak()取 $x = 3$、$y = 2$，可同时否定 A、D；取 $x = 3/2$、$y = 6/5$，有 $x y = 9/5 < 27/10 = x + y$，否定 B。],
)
#question(
  "single-choice",
  stem: [平移对称法在几何学中具有重要的应用。设平面直角坐标系 $x O y$ 中有一图形 $Omega$，过 $Omega$ 内任意一点 $P$ 作垂直于 $x$ 轴的直线 $l_P$，满足 $l_P inter Omega$ 为一线段。现沿 $l_P$ 方向平移这些线段，使它们的中点均在 $x$ 轴上，这样叫做平移对称法。对于曲线 $y = -x^2 + x + 1$、$y = -x^2 - x$，直线 $x = 0$ 和直线 $x = 1$ 围成的封闭图形 $Omega$，对它进行一次平移对称，得到的图像大致为#choice-placeholder()。],
  choices: (
    [#symmetry-figure(0)],
    [#symmetry-figure(1)],
    [#symmetry-figure(2)],
    [#symmetry-figure(3)],
  ),
  answers: ([A],),
  explanation: [在 $0 <= x <= 1$ 时，每条竖直线段的长度为
    $ (-x^2 + x + 1) - (-x^2 - x) = 2x + 1. $
    平移后中点在 $x$ 轴上，所以两端纵坐标分别为 $x + 1/2$ 和 $-x - 1/2$，边界是直线段，所得图形为选项 A 的梯形。],
)
#question(
  "single-choice",
  stem: [对于函数 $y = f(x)$，$x in D$，设 $A_f = {(x, y) | y >= f(x), x in D}$。对于点集 $M$，若存在 $(x_0, y_0) in M$，使得任取 $(x, y) in M$，总有 $y >= y_0$，则称 $(x_0, y_0)$ 为“最低点”。对于函数 $y = f(x)$ 和 $y = g(x)$，以下说法中正确的是#choice-placeholder()。],
  choices: (
    [若 $y = f(x)$ 和 $y = g(x)$ 都有最小值，则 $A_f inter A_g$ 有最低点。],
    [若 $A_f inter A_g$ 有最低点，则 $y = f(x)$ 和 $y = g(x)$ 都有最小值。],
    [若 $y = f(x)$ 或 $y = g(x)$ 有最小值，则 $A_f union A_g$ 有最低点。],
    [若 $A_f union A_g$ 有最低点，则 $y = f(x)$ 或 $y = g(x)$ 有最小值。],
  ),
  answers: ([D],),
  explanation: [
    #step[选项 A][取 $f(x) = x$（$x in [0, 1]$），$g(x) = x$（$x in [2, 3]$）。两函数分别有最小值 $0$、$2$，但定义域不交，$A_f inter A_g = emptyset$，没有最低点。A 错误。]
    #step[选项 B][取 $f(x) = x$、$g(x) = -x$，定义域均为 $RR$。两函数均无最小值，但 $A_f inter A_g = {(x, y) | y >= abs(x)}$ 有最低点 $(0, 0)$。B 错误。]
    #step[选项 C][取 $f(x) = x^2$、$g(x) = -x^2$，定义域均为 $RR$。$f$ 有最小值 $0$，但 $A_f union A_g$ 中点的纵坐标无下界。C 错误。]
    #step[选项 D][设 $(x_0, y_0)$ 为 $A_f union A_g$ 的最低点。它至少属于其中一个点集，不妨设属于 $A_f$，则 $f(x_0) <= y_0$。又 $(x_0, f(x_0)) in A_f union A_g$，由最低点定义知 $f(x_0) >= y_0$，故 $f(x_0) = y_0$。#linebreak()对 $f$ 定义域内任意 $x$，点 $(x, f(x))$ 都在并集中，故 $f(x) >= y_0$，所以 $f$ 有最小值。属于 $A_g$ 时同理。D 正确。]
  ],
)

#section[解答题]
#question(
  "solution",
  stem: [某兴趣班共 $150$ 人，年龄分布及兴趣爱好统计如下：
    #table(
      columns: 5,
      align: center,
      [年龄], [剪纸], [摄影], [画画], [人数],
      [$[25,35)$], [], [8], [], [45],
      [$[35,45)$], [], [10], [], [55],
      [$[45,55)$], [], [6], [], [50],
    )
  ],
  parts: (
    subquestion(
      stem: [现采用分层抽样抽取 $30$ 人，其中抽到年龄在 $[25, 35)$ 岁的有多少人？],
      answers: ([9 人。],),
      explanation: [按该年龄段的人数比例抽取 $30 times 45/150 = 9$ 人。],
    ),
    subquestion(
      stem: [该兴趣班 $150$ 人的平均年龄是多少？],
      answers: ([估计为 $121/3$ 岁，约 $40.33$ 岁。],),
      explanation: [用各年龄区间的组中值 $30$、$40$、$50$ 代表该组年龄，加权估计平均年龄为
        $
          overline(x) = (30 times 45 + 40 times 55 + 50 times 50)/150 = 121/3 approx 40.33 "（岁）".
        $
        表中只有分组人数，不能据此确定实际平均年龄；上述结果是组中值估计。],
    ),
    subquestion(
      stem: [现从 $150$ 人中任意抽选 $1$ 人，记抽到学员年龄在 $[35, 45)$ 为事件 $A$，记抽到学员爱好摄影为事件 $B$。事件 $A$ 与 $B$ 是否独立？请说明理由。],
      answers: ([不独立。],),
      explanation: [$P(A) = 55/150 = 11/30$，$P(B) = (8 + 10 + 6)/150 = 4/25$，$P(A B) = 10/150 = 1/15$。#linebreak()∵ $P(A)P(B) = 22/375 != 1/15 = P(A B)$，∴ $A$ 与 $B$ 不独立。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图所示正四棱台 $A B C D - A_1 B_1 C_1 D_1$，其中 $A B = 4$，$A_1 B_1 = 2$。
    #figure(frustum-figure())
  ],
  parts: (
    subquestion(
      stem: [当 $A A_1 = 2$ 时，求 $A A_1$ 和平面 $A_1 B_1 C_1 D_1$ 所成角。],
      answers: ([$45 degree$],),
      explanation: [设 $A_1$ 在下底面的垂足为 $H$。正四棱台上下底面中心在同一垂线上，故 $H$ 到 $A B$、$A D$ 的距离均为 $(4 - 2)/2 = 1$，于是 $A H = sqrt(2)$。#linebreak()两底面平行，所以所求线面角等于 $angle A_1 A H$，其余弦为 $A H/(A A_1) = sqrt(2)/2$，故所求角为 $45 degree$。],
    ),
    subquestion(
      stem: [证明：$A A_1 parallel$ 平面 $B C_1 D$；若棱台高为 $3$，求三棱锥 $A_1 - B C_1 D$ 的体积。],
      answers: ([平行关系证明见解析；体积为 $8$。],),
      explanation: [
        #step[证明线面平行][设下底面中心为 $O$。由正四棱台性质，$A_1 C_1 parallel A C$，且 $A_1 C_1 = 2 sqrt(2) = A O$，故四边形 $A A_1 C_1 O$ 为平行四边形，$A A_1 parallel O C_1$。#linebreak()又 $O in B D$，故 $O C_1 subset$ 平面 $B C_1 D$；$A$ 不在该平面内，所以 $A A_1 parallel$ 平面 $B C_1 D$。
          #figure(frustum-figure(auxiliary: true))]
        #step[计算体积][平面 $A_1 O C_1$ 垂直于 $B D$，交 $B D$ 于中点 $O$。三棱锥 $A_1 - B C_1 D$ 可沿面 $A_1 O C_1$ 分为顶点为 $B$、$D$ 的两个三棱锥。#linebreak()∵ $A_1 C_1 = 2 sqrt(2)$，$O$ 到直线 $A_1 C_1$ 的距离为棱台高 $3$，∴
          $ S_(triangle A_1 O C_1) = 1/2 times 2 sqrt(2) times 3 = 3 sqrt(2). $
          于是
          $
            V = 1/3 (B O + D O) S_(triangle A_1 O C_1) = 1/3 times 4 sqrt(2) times 3 sqrt(2) = 8.
          $]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知函数 $f(x) = sin(omega x + phi)$（$omega > 0$，$0 < phi < pi$）。],
  parts: (
    subquestion(
      stem: [当 $omega = 2$，$f(pi/12) = 0$，求函数 $f(x)$ 在 $x = 0$ 处的切线方程。],
      answers: ([$y = -sqrt(3)x + 1/2$],),
      explanation: [由 $sin(pi/6 + phi) = 0$ 及 $0 < phi < pi$，得 $phi = 5pi/6$。#linebreak()于是 $f(0) = 1/2$，$f'(0) = 2 cos(5pi/6) = -sqrt(3)$，所求切线为 $y = -sqrt(3)x + 1/2$。],
    ),
    subquestion(
      stem: [若函数 $f(x)$ 的最小正周期为 $3pi$，且 $f(x) = sqrt(2)/2$ 在 $x in [0, 2026pi)$ 上恰好有 $1351$ 个解，求 $phi$ 的取值范围。],
      answers: ([$(0, pi/12] union (pi/4, 3pi/4]$],),
      explanation: [
        #step[拆分完整周期与剩余区间][由 $2pi/omega = 3pi$，得 $omega = 2/3$。令 $t = 2/3 x + phi$，则 $t in [phi, phi + 4052pi/3)$。区间长度为 $675 times 2pi + 2pi/3$。#linebreak()前 $675$ 个左闭右开的完整周期各有 $2$ 个解，共 $1350$ 个。因此最后一段经周期平移后，即 $[phi, phi + 2pi/3)$，须恰含一个解。]
        #step[判断剩余区间中的解][因 $0 < phi < pi$，该区间内可能的解只有 $pi/4$、$3pi/4$。#linebreak()当 $0 < phi <= pi/4$ 时，$pi/4$ 必在区间内，要排除 $3pi/4$，须 $phi + 2pi/3 <= 3pi/4$，即 $0 < phi <= pi/12$。#linebreak()当 $pi/4 < phi <= 3pi/4$ 时，区间恰含 $3pi/4$。#linebreak()当 $3pi/4 < phi < pi$ 时，区间无解。#linebreak()综上，$phi in (0, pi/12] union (pi/4, 3pi/4]$。]
      ],
    ),
  ),
)
#if sys.inputs.at("show-answers", default: "false") != "true" {
  pagebreak(weak: true)
}
#question(
  "solution",
  stem: [已知双曲线 $Gamma: x^2/2 - y^2/2 = 1$，过点 $M(m, 0)$ 作不垂直于 $x$ 轴的直线 $l$ 交双曲线 $Gamma$ 于 $A$、$B$ 两点。],
  parts: (
    subquestion(
      stem: [求双曲线离心率。],
      answers: ([$sqrt(2)$],),
      explanation: [$a = b = sqrt(2)$，$c = sqrt(a^2 + b^2) = 2$，所以 $e = c/a = sqrt(2)$。],
    ),
    subquestion(
      stem: [若点 $A(sqrt(3), 1)$，点 $B$ 在双曲线的右支上，且 $B$ 是 $A M$ 的中点，求直线 $l$ 的斜率。],
      answers: ([$(2 sqrt(3) + 3)/3$],),
      explanation: [由中点公式，$B((m + sqrt(3))/2, 1/2)$。代入双曲线，得 $(m + sqrt(3))^2 = 9$。#linebreak()由 $B$ 在右支，取 $m + sqrt(3) = 3$，故 $m = 3 - sqrt(3)$。所求斜率为
        $ k = (1 - 0)/(sqrt(3) - (3 - sqrt(3))) = (2 sqrt(3) + 3)/3. $],
    ),
    subquestion(
      stem: [若 $m > 0$，$F_1$、$F_2$ 分别是双曲线 $Gamma$ 的左、右焦点，$A'$ 是 $A$ 关于 $y$ 轴的对称点，若存在直线 $l$ 使得 $arrow(F_1 A') dot arrow(F_2 B) = 0$，求 $m$ 的取值范围。],
      answers: ([$(4/3, 2) union (2, +infinity)$],),
      explanation: [
        #step[联立直线与双曲线][焦点为 $F_1(-2, 0)$、$F_2(2, 0)$。水平直线与双曲线相交于两个顶点，此时两个向量均为非零水平向量，数量积不为 $0$。#linebreak()其余符合要求的直线可写为 $x = n y + m$，其中 $n != 0$（排除垂直直线）。设 $A(x_1, y_1)$、$B(x_2, y_2)$，联立得
          $ (n^2 - 1)y^2 + 2n m y + m^2 - 2 = 0. $
          有两个不同交点的条件为 $n^2 != 1$ 且 $Delta = 4(m^2 + 2n^2 - 2) > 0$。此时
          $
            y_1 + y_2 = (-2n m)/(n^2 - 1), quad y_1 y_2 = (m^2 - 2)/(n^2 - 1).
          $]
        #step[利用数量积条件][由于 $A'(-x_1, y_1)$，所给条件等价于
          $ (2 - m - n y_1)(m - 2 + n y_2) + y_1 y_2 = 0, $
          即
          $ (1 - n^2)y_1 y_2 - n(m - 2)(y_1 + y_2) - (m - 2)^2 = 0. $
          代入根的和、积并化简，得 $n^2 = (m - 1)^2$。因此判别式条件化为 $3m^2 - 4m > 0$，由 $m > 0$ 得 $m > 4/3$。#linebreak()又 $n^2 != 1$，须 $m != 2$。]
        #step[验证充分性][对任意 $m > 4/3$ 且 $m != 2$，取 $n = m - 1$，则 $n != 0$、$n^2 != 1$ 且 $Delta > 0$，故直线 $x = n y + m$ 不垂直于 $x$ 轴，并有两个不同交点。上述等价运算保证数量积为 $0$。#linebreak()因此所求范围为 $(4/3, 2) union (2, +infinity)$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [设 $f(x)$ 是定义在 $RR$ 上的函数。定义性质 $P$：若对任意 $x_1, x_2 in RR$，当 $abs(x_1) < abs(x_2)$ 时，$f(x_1) < f(x_2)$，则称函数 $f(x)$ 具有“性质 $P$”。],
  parts: (
    subquestion(
      stem: [判断函数 $f(x) = e^x$ 是否具有“性质 $P$”。],
      answers: ([不具有。],),
      explanation: [取 $x_1 = -2$、$x_2 = -3$，则 $abs(x_1) < abs(x_2)$，但 $e^(-2) > e^(-3)$，不符合性质 $P$。],
    ),
    subquestion(
      stem: [若分段函数 $f(x) = cases(a x & quad x <= 0, x + b & quad x > 0)$ 具有“性质 $P$”，求所有满足条件的实数 $a$ 和 $b$ 的解。],
      answers: ([$a = -1$，$b = 0$。],),
      explanation: [
        #step[先确定 $b$][由 $f(0) < f(x)$（$x != 0$），得 $a < 0$，且对一切 $x > 0$ 有 $x + b > 0$，因此 $b >= 0$。#linebreak()若 $b > 0$，取充分小的 $t > 0$ 使 $-2a t < b$。因 $abs(t) < abs(-2t)$，性质 $P$ 要求 $t + b < -2a t < b$，矛盾。故 $b = 0$。]
        #step[再确定 $a$ 并验证][对任意 $t > 0$、$epsilon > 0$，由 $abs(t) < abs(-(t + epsilon))$ 和 $abs(-t) < abs(t + epsilon)$，分别得
          $ t < -a(t + epsilon), quad -a t < t + epsilon. $
          令 $epsilon -> 0^+$，得 $t <= -a t <= t$，所以 $a = -1$。#linebreak()反之，$a = -1$、$b = 0$ 时 $f(x) = abs(x)$，显然满足性质 $P$。]
      ],
    ),
    subquestion(
      stem: [已知 $f(x)$ 的值域为 $[0, 1)$，且在 $[0, +infinity)$ 上是严格增函数，证明：$f(x)$ 是偶函数的充要条件是 $f(x)$ 具有“性质 $P$”。],
      answers: ([证明见解析。],),
      explanation: [
        #step[偶函数推出性质 $P$][若 $f$ 为偶函数，当 $abs(x_1) < abs(x_2)$ 时，由非负半轴上的严格单调性，
          $ f(x_1) = f(abs(x_1)) < f(abs(x_2)) = f(x_2). $
          所以 $f$ 具有性质 $P$。]
        #step[性质 $P$ 推出偶函数][若存在 $t > 0$ 使 $f(t) != f(-t)$，记这两个函数值中较小者为 $u$、较大者为 $v$，则 $0 <= u < v < 1$。#linebreak()由性质 $P$，当 $abs(x) < t$ 时，$f(x) < u$；当 $abs(x) > t$ 时，$f(x) > v$；当 $abs(x) = t$ 时，$f(x)$ 只能取 $u$ 或 $v$。#linebreak()因此 $(u + v)/2 in [0, 1)$ 却不可能被 $f$ 取到，与值域为 $[0, 1)$ 矛盾。故对所有 $t > 0$，均有 $f(t) = f(-t)$；在 $t = 0$ 时等式也成立，所以 $f$ 为偶函数。]
      ],
    ),
  ),
)
