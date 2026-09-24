#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, space-axes, step, subquestion,
)

#show: exam.with(
  subject: "数学",
  year: 2026,
  type: "上海市普通高等学校招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2026/2026上海.pdf",
  regions: ("上海",),
)

#let cube-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 24mm, {
    import cetz.draw: *
    let a = (0, 0, 0)
    let b = (1, 0, 0)
    let c = (1, 1, 0)
    let d = (0, 1, 0)
    let a1 = (0, 0, 1)
    let b1 = (1, 0, 1)
    let c1 = (1, 1, 1)
    let d1 = (0, 1, 1)
    oblique-project((-0.6, -0.4), (1, 0), (0, 1), {
      set-style(stroke: (thickness: figure-style.thickness, join: "round"))
      line(a1, b1, c1, d1, a1)
      line(b1, b, c, c1)
      line(c, d, d1)
      line(b, a, d, stroke: (dash: figure-style.dash))
      line(a, a1, stroke: (dash: figure-style.dash))
      line(a, c1, stroke: (dash: figure-style.dash))
      space-axes((1, 1, 1), (1.7, 1.5, 1.5))
      for (p, label, anchor) in (
        (a, $A$, "north-east"),
        (b, $B$, "south-east"),
        (c, $C$, "north"),
        (d, $D$, "north"),
        (a1, $A_1$, "south-east"),
        (b1, $B_1$, "south-east"),
        (c1, $C_1$, "south"),
        (d1, $D_1$, "south-west"),
      ) { content(p, label, anchor: anchor, padding: 0.09) }
    })
  })
}

#let pyramid-figure(auxiliary: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let a = (0, 0, 0)
    let b = (2, 0, 0)
    let c = (2, 5, 0)
    let d = (0, 5, 0)
    let h = (0, 1, 0)
    let p = (0, 1, calc.sqrt(5))
    let k = (1, 0.5, calc.sqrt(5) / 2)
    oblique-project((-0.75, -0.55), (0.72, 0), (0, 1), {
      set-style(stroke: (thickness: figure-style.thickness, join: "round"))
      line(p, b, c, d, p, c)
      line(b, a, d, stroke: (dash: figure-style.dash))
      line(p, a, stroke: (dash: figure-style.dash))
      line(p, h, stroke: (dash: figure-style.dash))
      line(b, h, c, stroke: (dash: figure-style.dash))
      if auxiliary {
        line(h, k, stroke: (dash: figure-style.dash))
        line(c, k)
        content(k, $K$, anchor: "south-east", padding: 0.12)
      }
      for (point, label, anchor) in (
        (p, $P$, "south"),
        (a, $A$, "south-east"),
        (b, $B$, "north-east"),
        (c, $C$, "north-west"),
        (d, $D$, "west"),
        (h, $H$, "south-west"),
      ) { content(point, label, anchor: anchor, padding: 0.12) }
    })
  })
}

#let pollution-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(axes: (
      stroke: figure-style.thickness,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      padding: 0,
      overshoot: 0.2,
      shared-zero: $O$,
      x: (label: (anchor: "north-east", offset: 0.8)),
      y: (label: (anchor: "south", offset: 0.1)),
    ))
    plot.plot(
      size: (5, 5),
      axis-style: "school-book",
      x-min: 0,
      x-max: 125,
      y-min: 0,
      y-max: 125,
      x-tick-step: 25,
      y-tick-step: 25,
      x-label: [颗粒物密度],
      y-label: [二氧化硫密度],
      {
        plot.annotate(resize: false, {
          for p in (
            (101.02, 119.47),
            (87.02, 81.94),
            (57.47, 53.20),
            (21.85, 9.16),
            (11.76, 6.60),
            (8.86, 4.40),
            (5.03, 3.31),
            (4.63, 3.35),
            (3.86, 3.86),
          ) { circle(p, radius: 0.65, fill: black, stroke: none) }
        })
      },
    )
  })
}

#let hyperbola-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 9mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    set-style(axes: (
      stroke: figure-style.thickness,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      padding: 0,
      overshoot: 0.15,
      shared-zero: $O$,
    ))
    let root = calc.sqrt(2)
    let intersections(t) = {
      let ys = (
        (-root * t + calc.sqrt(1 + t * t)) / (t * t - 1),
        (-root * t - calc.sqrt(1 + t * t)) / (t * t - 1),
      )
      ys.map(y => (t * y + root, y))
    }
    let (q, p) = intersections(0.2)
    let (n, m) = intersections(2)
    plot.plot(
      size: (7, 5.8),
      axis-style: "school-book",
      x-min: -3.4,
      x-max: 3.6,
      y-min: -2.8,
      y-max: 3,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      {
        plot.add(
          y => (calc.sqrt(1 + y * y), y),
          domain: (-1, 2.8),
          style: (stroke: figure-style.thickness),
        )
        plot.add(
          y => (-calc.sqrt(1 + y * y), y),
          domain: (-2.6, -1),
          style: (stroke: figure-style.thickness),
        )
        plot.annotate(resize: false, {
          line((0.2 * -1.3 + root, -1.3), (0.2 * 2.8 + root, 2.8))
          line((2 * -2.2 + root, -2.2), (2 * 0.8 + root, 0.8))
          for (point, label, anchor) in (
            ((root, 0), $F_2$, "north-west"),
            (p, $P$, "west"),
            (q, $Q$, "north-east"),
            (m, $M$, "north-west"),
            (n, $N$, "east"),
            ((0.2 * 2.8 + root, 2.8), $l$, "south"),
            ((2 * 0.8 + root, 0.8), $m$, "west"),
          ) { content(point, label, anchor: anchor, padding: 0.14) }
          circle((root, -1), radius: 0.035, fill: black, stroke: none)
          circle((-root, -1), radius: 0.035, fill: black, stroke: none)
        })
      },
    )
  })
}

#section[填空题：本大题共 12 题，满分 54 分，第 1～6 题每题 4 分，第 7～12 题每题 5 分。]

#question(
  "fill-in",
  stem: [若集合 $A = {2, a + 1}$，且 $-1 in A$，则 $a =$#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [∵ $-1 != 2$，∴ $a + 1 = -1$，得 $a = -2$。此时 $A = {2, -1}$，符合题意。],
)
#question(
  "fill-in",
  stem: [已知数列 $\{a_n\}$ 为等比数列，且 $a_1 = 2$，$a_2 = 6$，则 $a_4 =$#fill-placeholder()。],
  answers: ([$54$],),
  explanation: [公比 $q = a_2/a_1 = 3$，故 $a_4 = a_1 q^3 = 2 dot 27 = 54$。],
)
#question(
  "fill-in",
  stem: [已知 $sin alpha = 1/5$，则 $cos 2alpha =$#fill-placeholder()。],
  answers: ([$23/25$],),
  explanation: [$cos 2alpha = 1 - 2 sin^2 alpha = 1 - 2/25 = 23/25$。],
)
#question(
  "fill-in",
  stem: [已知事件 $A, B$ 互斥，且 $P(A) = 0.2$，$P(B) = 0.5$，则 $P(A union B) =$#fill-placeholder()。],
  answers: ([$0.7$],),
  explanation: [由互斥事件的概率加法公式，$P(A union B) = P(A) + P(B) = 0.7$。],
)
#question(
  "fill-in",
  stem: [已知函数 $f(x)$ 是偶函数，当 $x >= 0$ 时，$f(x) = sqrt(x) - a$，若 $f(-4) = 3$，则 $a =$#fill-placeholder()。],
  answers: ([$-1$],),
  explanation: [由偶性，$3 = f(-4) = f(4) = 2 - a$，得 $a = -1$。],
)
#question(
  "fill-in",
  stem: [在 $(x^2 + x)^5$ 的展开式中，$x^7$ 项的系数为#fill-placeholder()。],
  answers: ([$10$],),
  explanation: [通项为 $binom(5, k)(x^2)^(5 - k)x^k = binom(5, k)x^(10 - k)$。令 $10 - k = 7$，得 $k = 3$，故系数为 $binom(5, 3) = 10$。],
)
#question(
  "fill-in",
  stem: [已知 $a^2 + 4b^2 = 1$，则 $a b$ 的最大值为#fill-placeholder()。],
  answers: ([$1/4$],),
  explanation: [由 $(a - 2b)^2 >= 0$，得 $4a b <= a^2 + 4b^2 = 1$，故 $a b <= 1/4$。#linebreak()当 $a = sqrt(2)/2$、$b = sqrt(2)/4$ 时等号成立，所以最大值为 $1/4$。],
)
#question(
  "fill-in",
  stem: [已知随机变量 $X$ 的分布列为
    #table(
      columns: 4,
      align: center,
      stroke: figure-style.thickness,
      $X$, $-1$, $0$, $1$,
      $P$, $a$, $0.3$, $b$,
    )
    且 $E(X) = 0.5$，则 $b =$#fill-placeholder()。
  ],
  answers: ([$0.6$],),
  explanation: [概率和为 $1$，故 $a + b = 0.7$；又 $E(X) = -a + b = 0.5$。两式相加得 $2b = 1.2$，所以 $b = 0.6$。],
)
#question(
  "fill-in",
  stem: [已知等差数列 $\{a_n\}$ 的公差为 $d$，前 $n$ 项和为 $S_n$，$a_1 = 0$，$\{S_n\}$ 在区间 $(0, 1)$ 上至少有两项，则公差 $d$ 的取值范围是#fill-placeholder()。],
  answers: ([$(0, 1/3)$],),
  explanation: [$S_n = (n(n - 1))/2 d$。若 $d <= 0$，所有项均不大于零，不合题意。#linebreak()若 $d > 0$，则 $S_1 = 0$，其后各项递增，所以至少两项在 $(0, 1)$ 内等价于 $S_3 = 3d < 1$。#linebreak()故 $0 < d < 1/3$。],
)
#question(
  "fill-in",
  stem: [已知 $k in RR$，向量 $bold(a), bold(b), bold(c)$ 两两不平行，且 $(bold(a) + 3bold(b)) parallel (bold(b) + bold(c))$，$(2bold(a) + k bold(c)) parallel (bold(b) + bold(c))$，则 $k$ 的值为#fill-placeholder()。],
  answers: ([$-6$],),
  explanation: [设 $bold(a) + 3bold(b) = s(bold(b) + bold(c))$，$2bold(a) + k bold(c) = t(bold(b) + bold(c))$。#linebreak()第二式减去第一式的两倍，得
    $ k bold(c) - 6bold(b) = (t - 2s)(bold(b) + bold(c)). $
    ∵ $bold(b), bold(c)$ 不平行，∴ $k = t - 2s = -6$。
  ],
)
#question(
  "fill-in",
  stem: [已知三角函数 $f(t) = A sin(omega t + phi) + B$（$A > 0$，$B in RR$，$omega > 0$，$0 <= phi < 2pi$）。若某物体的运动速度 $v$ 关于时间 $t$ 的函数为 $v = f(t)$，当 $v = 0$ 或 $v = 4$ 时，其导数为 $0$，且初始速度为 $0$，速度第一次达到 $4$ 时用时 $0.1$ 秒，则 $f(t) =$#fill-placeholder()。],
  answers: ([$2 sin(10pi t + (3pi)/2) + 2$],),
  explanation: [导数为零时对应正弦函数的最高点或最低点，故 $B - A = 0$、$B + A = 4$，得 $A = B = 2$。#linebreak()由 $f(0) = 0$，得 $sin phi = -1$，结合 $0 <= phi < 2pi$，得 $phi = (3pi)/2$。#linebreak()从最低点到第一次最高点经过半个周期，所以 $pi/omega = 0.1$，$omega = 10pi$。#linebreak()故 $f(t) = 2 sin(10pi t + (3pi)/2) + 2$。],
)
#question(
  "fill-in",
  stem: [已知 $A, B, C$ 是椭圆 $x^2/a^2 + y^2/b^2 = 1$ 的四个顶点与两个焦点中的三个点，且 $abs(A B) = 5$，$abs(B C) = sqrt(14)$，$abs(A C) = 3$，则该椭圆的离心率为#fill-placeholder()。],
  answers: ([$2/3$],),
  explanation: [
    #step[确定三点的类型][记长半轴、短半轴、半焦距为 $a, b, c$，则 $a > b > 0$、$c^2 = a^2 - b^2$。#linebreak()三边互不相等且构成非退化三角形，三点不能全在长轴上，也不能包含两个短轴顶点或长轴上的一对对称点。#linebreak()所以三点必为一个短轴顶点、一个长轴顶点和一个焦点，三边为 $a$、$sqrt(a^2 + b^2)$、$a + c$ 或 $a - c$。]
    #step[分类求解][若第三边为 $a + c$，则 $a$ 最小，故 $a = 3$。因 $b < a$，$sqrt(a^2 + b^2) < 3 sqrt(2) < 5$，所以 $a + c = 5$、$sqrt(a^2 + b^2) = sqrt(14)$。得 $c = 2$、$b = sqrt(5)$，符合题意。#linebreak()若第三边为 $a - c$，则 $a - c < a < sqrt(a^2 + b^2)$，得 $a = sqrt(14)$、$a - c = 3$、$a^2 + b^2 = 25$。由后式得 $b^2 = 11$、$c = sqrt(3)$，但 $sqrt(14) - sqrt(3) != 3$，矛盾。#linebreak()因此所求离心率为 $e = c/a = 2/3$。]
  ],
)

#section[选择题：本大题共 4 题，满分 18 分，第 13～14 题每题 4 分，第 15～16 题每题 5 分。每题有且只有一个正确选项。]

#question(
  "single-choice",
  stem: [$a$ 是不为 $1$ 的任意实数，则 $a dot root(3, a) =$#choice-placeholder()],
  choices: ([$a^(3/2)$], [$a^(4/3)$], [$a^(5/2)$], [$a^(5/3)$]),
  answers: ([B],),
  explanation: [按实立方根理解分母为 $3$ 的分数指数，$a dot root(3, a) = (root(3, a))^4 = a^(4/3)$，故选 B。],
)
#question(
  "single-choice",
  stem: [事件 $A$ 和事件 $B$ 相互独立，“$A$ 和 $B$ 至少一个发生”的对立事件是#choice-placeholder()],
  choices: (
    [$A inter B$],
    [$A union B$],
    [$overline(A) inter overline(B)$],
    [$overline(A) union overline(B)$],
  ),
  answers: ([C],),
  explanation: [“至少一个发生”的对立事件是“两者都不发生”，即 $overline(A union B) = overline(A) inter overline(B)$，故选 C。],
)
#question(
  "single-choice",
  stem: [对于任意两个复数 $z, omega$，如果满足“$z - omega in RR$”或“$z - overline(omega) in RR$”，那么就称 $z$ 与 $omega$ 伴随。如果 $z$ 与 $omega$ 伴随，则 $omega - i$ 与 $z + i$ 伴随的充要条件是#choice-placeholder()],
  choices: (
    [$op("Re") z + op("Re") omega = 0$],
    [$op("Re") z - op("Re") omega = 0$],
    [$op("Im") z + op("Im") omega = 0$],
    [$op("Im") z - op("Im") omega = 0$],
  ),
  answers: ([C],),
  explanation: [设 $z = u + v i$、$omega = s + t i$，其中 $u, v, s, t in RR$。#linebreak()两复数伴随等价于虚部相等或互为相反数，故已知条件为 $v = t$ 或 $v = -t$。#linebreak()$omega - i$ 与 $z + i$ 伴随等价于 $t - 1 = v + 1$ 或 $t - 1 = -(v + 1)$，即 $t - v = 2$ 或 $t + v = 0$。#linebreak()若已知条件中的 $v = t$ 成立，前一等式不可能；若 $v = -t$ 成立，则后一等式必成立。#linebreak()因此在已知条件下，新条件等价于 $t + v = 0$，故选 C。],
)
#question(
  "single-choice",
  stem: [如图，在一个空间直角坐标系中，存在一个正方体 $A B C D - A_1 B_1 C_1 D_1$，其中 $A$ 为坐标原点，$A B, A D, A A_1$ 所在直线分别为 $x, y, z$ 轴。将正方体绕体对角线 $A C_1$ 旋转一周，点 $C$ 经过的卦限个数为#choice-placeholder()
    #figure(cube-figure())
  ],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([A],),
  explanation: [
    #step[写出旋转轨迹][不妨设棱长为 $1$，则 $C(1, 1, 0)$、$C_1(1, 1, 1)$。旋转保持到原点的距离和沿转轴的投影不变，故轨迹为圆
      $ x + y + z = 2, quad x^2 + y^2 + z^2 = 2. $
    ]
    #step[判断各坐标的符号][由 $x^2 + y^2 >= (x + y)^2/2$，得 $2 - z^2 >= (2 - z)^2/2$，即 $z(4 - 3z) >= 0$，所以 $0 <= z <= 4/3$。同理 $x, y$ 均非负。#linebreak()轨迹上有 $(4/3, 1/3, 1/3)$ 这样的三坐标均正的点，而坐标面上的点不属于任何卦限。因此只经过第一卦限，故选 A。]
  ],
)

#section[解答题：本大题共 5 题，满分 78 分。解答下列各题必须写出必要的步骤。]

#question(
  "solution",
  score: 14,
  stem: [某工厂为进行环境保护与改善，对 $2023$ 年前九年间空气中某颗粒物密度与二氧化硫密度进行了监测与记录，数据如下：
    #text(size: 9pt)[
      #table(
        columns: (auto, ..range(9).map(_ => 1fr)),
        align: center,
        stroke: figure-style.thickness,
        inset: 3pt,
        [颗粒物密度], [101.02],
        [87.02], [57.47],
        [21.85], [11.76],
        [8.86], [5.03],
        [4.63], [3.86],
        [二氧化硫密度], [119.47],
        [81.94], [53.20],
        [9.16], [6.60],
        [4.40], [3.31],
        [3.35], [3.86],
      )
    ]
  ],
  parts: (
    subquestion(
      score: 4,
      stem: [为进一步研究，从这 $9$ 年间随机抽取一年，该年份颗粒物的密度大于二氧化硫密度的概率是多少？],
      answers: ([$7/9$],),
      explanation: [第一年颗粒物密度较小，最后一年两者相等，其余 $7$ 年颗粒物密度较大，故所求概率为 $7/9$。],
    ),
    subquestion(
      score: 4,
      stem: [为研究颗粒物密度与二氧化硫密度的相关性，该工厂应选取茎叶图、扇形图、散点图中的哪一种进行分析，并请你判断相关系数在 $(-1, 0)$、$(0, 1)$、$(1, 2)$ 哪个区间内？],
      answers: ([散点图；相关系数在 $(0, 1)$ 内。],),
      explanation: [研究两个变量的相关性，应使用散点图。数据点整体呈上升趋势，且不完全位于同一直线上，所以相关系数在 $(0, 1)$ 内。
        #figure(pollution-figure())
      ],
    ),
    subquestion(
      score: 6,
      stem: [$2023$ 年之前 $9$ 年的年份（$x$）的平均数为 $2018$，$y$（颗粒物密度）关于 $x$（年份）的回归方程拟采用 $y = 106.544e^(-0.461(x - 2014))$ 或 $y = a(x - 2014) + 83.743$。已知 $2023$ 年实际颗粒物密度为 $3.88$，则哪个回归方程对于 $2023$ 年的预测值与实际值的差的绝对值更小（精确到 $0.01$）？#linebreak()参考数据：$106.544e^(-0.461 times 9) approx 1.681$。],
      answers: (
        [指数回归方程 $y = 106.544e^(-0.461(x - 2014))$ 更好，绝对误差约为 $2.20$，线性回归方程的绝对误差约为 $33.18$。],
      ),
      explanation: [
        #step[指数模型][代入 $x = 2023$，预测值约为 $1.681$，绝对误差约为 $abs(1.681 - 3.88) = 2.199 approx 2.20$。]
        #step[线性模型][由表中数据，$overline(y) = 301.50/9 = 33.5$。回归直线经过样本中心 $(2018, 33.5)$，所以
          $ 33.5 = 4a + 83.743, quad a = -12.56075. $
          代入 $x = 2023$，预测值为 $-12.56075 times 9 + 83.743 = -29.30375$。#linebreak()绝对误差为 $abs(-29.30375 - 3.88) = 33.18375 approx 33.18$。#linebreak()因为 $2.20 < 33.18$，所以指数回归方程对 $2023$ 年的预测误差更小。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知四棱锥 $P - A B C D$，底面 $A B C D$ 为矩形，$P H perp$ 底面 $A B C D$，垂足 $H$ 在 $A D$ 边上，且 $A H = 1$，$H D = 4$，$A B = 2$，如图。
    #figure(pyramid-figure())
  ],
  parts: (
    subquestion(
      score: 6,
      stem: [求证：$C H perp P B$；],
      answers: ([$C H perp P B$，证明见解析。],),
      explanation: [以 $A$ 为原点，$A B, A D$ 的方向为 $x, y$ 轴正方向，垂直底面向上为 $z$ 轴正方向。设 $P H = h > 0$，则
        $ B(2, 0, 0), quad C(2, 5, 0), quad H(0, 1, 0), quad P(0, 1, h). $
        于是 $arrow(C H) = (-2, -4, 0)$、$arrow(P B) = (2, -1, -h)$，$arrow(C H) dot arrow(P B) = -4 + 4 = 0$，故 $C H perp P B$。
      ],
    ),
    subquestion(
      score: 8,
      stem: [若四棱锥 $P - A B C D$ 的体积为 $(10 sqrt(5))/3$，求二面角 $C - P B - H$ 的大小。],
      answers: ([$arccos(1/3)$],),
      explanation: [
        #step[确定高度和辅助点][由 $1/3 times (5 times 2) times h = (10 sqrt(5))/3$，得 $h = sqrt(5)$。#linebreak()取 $P B$ 的中点 $K$，则 $K(1, 1/2, sqrt(5)/2)$。
          #figure(pyramid-figure(auxiliary: true))
        ]
        #step[求二面角的平面角][有
          $
            arrow(K H) = (-1, 1/2, -sqrt(5)/2), quad arrow(K C) = (1, 9/2, -sqrt(5)/2).
          $
          两向量与 $arrow(P B) = (2, -1, -sqrt(5))$ 的数量积均为零，故 $K H perp P B$、$K C perp P B$。#linebreak()两射线分别指向 $H, C$ 所在的半平面，所以 $angle C K H$ 就是所求二面角的平面角。
          $
            arrow(K H) dot arrow(K C) = 5/2, quad abs(arrow(K H))^2 = 5/2, quad abs(arrow(K C))^2 = 45/2.
          $
          因此 $cos angle C K H = (5/2)/(sqrt(5/2) sqrt(45/2)) = 1/3$，所求角为 $arccos(1/3)$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知 $a in RR$，函数 $f(x) = x^2 + a x + 3$，$g(x) = 4x + 1/x^2$。],
  parts: (
    subquestion(
      score: 6,
      stem: [已知 $f(1) = 4$，求 $f(x) + 1/x^2 > g(x)$ 的解集；],
      answers: ([$(-infinity, 0) union (0, 1) union (3, +infinity)$],),
      explanation: [由 $f(1) = 4$，得 $a = 0$。在 $x != 0$ 的条件下，所给不等式等价于 $x^2 + 3 > 4x$，即 $(x - 1)(x - 3) > 0$。#linebreak()故 $x < 1$ 或 $x > 3$，再排除 $x = 0$，解集为 $(-infinity, 0) union (0, 1) union (3, +infinity)$。],
    ),
    subquestion(
      score: 8,
      stem: [已知 $a != 0$，$l_1$ 是曲线 $y = f(x)$ 在点 $(0, 3)$ 处的切线，$l_2$ 是过点 $(0, 3)$ 且垂直于 $l_1$ 的直线。曲线 $y = g(x)$ 与 $l_1, l_2$ 在第一象限内均无公共点，求 $a$ 的取值范围。],
      answers: ([$(-infinity, -1/2) union (0, 2)$],),
      explanation: [
        #step[将交点条件转为斜率条件][由 $f'(0) = a$，得 $l_1: y = a x + 3$，$l_2: y = -1/a x + 3$。#linebreak()对直线 $y = k x + 3$，与 $y = g(x)$ 的正横坐标交点满足
          $ k = 4 - 3/x + 1/x^3 = h(x), quad x > 0. $
          此时 $g(x) > 0$，所以这些交点必在第一象限。
        ]
        #step[求函数值域][有 $h'(x) = (3(x^2 - 1))/x^4$，故 $h$ 在 $(0, 1)$ 上递减，在 $(1, +infinity)$ 上递增，最小值为 $h(1) = 2$。#linebreak()又 $x -> 0^+$ 时 $h(x) -> +infinity$，所以 $h$ 在正半轴的值域为 $[2, +infinity)$。]
        #step[求参数范围][两条直线都无第一象限交点，等价于 $a < 2$ 且 $-1/a < 2$。#linebreak()当 $a > 0$ 时，得 $0 < a < 2$；当 $a < 0$ 时，得 $a < -1/2$。#linebreak()故所求范围为 $(-infinity, -1/2) union (0, 2)$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知双曲线 $Gamma: x^2 - y^2 = 1$，$F_1, F_2$ 分别为 $Gamma$ 的左、右焦点。],
  parts: (
    subquestion(
      score: 4,
      stem: [求点 $(2, 0)$ 到 $Gamma$ 渐近线的距离；],
      answers: ([$sqrt(2)$],),
      explanation: [渐近线为 $y = plus.minus x$，点 $(2, 0)$ 到每条渐近线的距离均为 $2/sqrt(2) = sqrt(2)$。],
    ),
    subquestion(
      score: 6,
      stem: [若 $P$ 为 $Gamma$ 上一点，$arrow(P F_1) dot arrow(P F_2) = 1$，求 $triangle P F_1 F_2$ 的面积；],
      answers: ([$sqrt(2)$],),
      explanation: [$F_1(-sqrt(2), 0)$、$F_2(sqrt(2), 0)$。设 $P(x, y)$，则
        $ arrow(P F_1) dot arrow(P F_2) = x^2 + y^2 - 2 = 1. $
        联立 $x^2 - y^2 = 1$，得 $y^2 = 1$。故 $S_(triangle P F_1 F_2) = 1/2 times 2 sqrt(2) times abs(y) = sqrt(2)$。
      ],
    ),
    subquestion(
      score: 8,
      stem: [设曲线 $Omega$ 为双曲线 $x^2 - y^2 = 1$ 上满足“$x < 0$ 且 $y <= -1$”或“$x > 0$ 且 $y >= -1$”的部分。过点 $F_2$ 的直线 $l$ 交 $Omega$ 于 $P, Q$ 两点（分别位于第一、第四象限），过点 $F_2$ 的直线 $m$ 交 $Omega$ 于 $M, N$ 两点（分别位于第三、第四象限）。是否存在正数 $lambda$，对于任意的 $l$，都存在唯一的 $m$，使 $abs(M N) = lambda abs(P Q)$ 成立？若存在，求出所有的 $lambda$；若不存在，请说明理由。],
      answers: ([存在，$lambda in [9/7, +infinity)$。],),
      explanation: [
        #step[统一表示直线与弦长][水平直线不满足交点的象限要求，其余过 $F_2$ 的直线可写为 $x = t y + sqrt(2)$。联立双曲线，得
          $ (t^2 - 1)y^2 + 2 sqrt(2)t y + 1 = 0. $
          $t = plus.minus 1$ 时只有一个交点，须排除。其余情况下判别式为 $4(1 + t^2) > 0$，故弦长为
          $ L(t) = sqrt(1 + t^2) abs(y_1 - y_2) = (2(1 + t^2))/abs(1 - t^2). $
          #figure(hyperbola-figure())
        ]
        #step[确定 $l$ 的参数范围][两交点纵坐标异号，故 $abs(t) < 1$。此时两点均在右支，负纵坐标为
          $ y_Q = -1/(sqrt(1 + t^2) + sqrt(2)t). $
          分母在 $(-1, 1)$ 上严格递增，且在 $t = 0$ 时为 $1$，所以 $y_Q >= -1$ 当且仅当 $t >= 0$。#linebreak()因此 $l$ 对应 $t in [0, 1)$，其弦长 $L(t) = 2(1 + t^2)/(1 - t^2)$ 从 $2$ 严格递增至无穷，故 $abs(P Q) in [2, +infinity)$。
        ]
        #step[确定 $m$ 的参数范围与唯一性][两交点纵坐标同为负数，由根的和、积可知 $t > 1$，且两交点分别在左、右支。左支交点的纵坐标为
          $ y_M = -1/(sqrt(2)t - sqrt(1 + t^2)). $
          对 $t > 1$，分母为正且严格递增；$y_M <= -1$ 等价于 $sqrt(2)t - sqrt(1 + t^2) <= 1$，即 $t <= 2 sqrt(2)$。#linebreak()右支交点 $y_N = -1/(sqrt(2)t + sqrt(1 + t^2))$ 恒在 $(-1, 0)$ 内。因此 $m$ 对应 $t in (1, 2 sqrt(2)]$，且
          $ L(t) = 2 + 4/(t^2 - 1) $
          严格递减，值域为 $[18/7, +infinity)$，每个值恰好对应一条 $m$。
        ]
        #step[比较两个弦长区间][所求条件等价于 $[2lambda, +infinity) subset.eq [18/7, +infinity)$，即 $2lambda >= 18/7$。#linebreak()因此所有满足条件的正数为 $lambda in [9/7, +infinity)$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知 $(i, j, k)$ 是 $1, 2, 3$ 的一个排列。对函数 $f_1(x), f_2(x), f_3(x)$，若对于任意 $x in I$，都有 $f_1(x) <= f_i(x)$ 且 $f_1(x) + f_2(x) <= f_i(x) + f_j(x)$，则称 $(i, j, k)$ 是关于这三个函数的一个 $I$ 排列，关于这三个函数的 $I$ 排列总数记为 $n_I$。],
  parts: (
    subquestion(
      score: 4,
      stem: [已知 $I = [3, +infinity)$，$f_1(x) = x$，$f_2(x) = 0$，$f_3(x) = x^2 + 1$，判断 $(3, 1, 2)$ 是否为关于这三个函数的 $I$ 排列；],
      answers: ([是。],),
      explanation: [对所有 $x >= 3$，$f_3(x) - f_1(x) = x^2 - x + 1 = (x - 1/2)^2 + 3/4 > 0$，#linebreak()且 $f_3(x) - f_2(x) = x^2 + 1 > 0$。#linebreak()故 $f_1 <= f_3$、$f_1 + f_2 <= f_3 + f_1$ 均恒成立，所以 $(3, 1, 2)$ 是 $I$ 排列。],
    ),
    subquestion(
      score: 6,
      stem: [已知 $I = (0, +infinity)$，$f_1(x) = x - 1$，$f_2(x) = x + m$，$f_3(x) = x^2$，若此时 $n_I = 6$，求实数 $m$ 的取值范围；],
      answers: ([$[-1, -1/4]$],),
      explanation: [六个排列全部成立，必有 $(2, 1, 3)$、$(1, 3, 2)$ 成立，故 $f_1 <= f_2 <= f_3$ 在 $I$ 上恒成立。反之，该大小关系显然保证六个排列均成立。#linebreak()所以条件等价于对所有 $x > 0$，都有 $x - 1 <= x + m <= x^2$，即 $m >= -1$ 且 $m <= x^2 - x$。#linebreak()∵ $x^2 - x = (x - 1/2)^2 - 1/4$ 在正半轴的最小值为 $-1/4$，∴ $-1 <= m <= -1/4$。],
    ),
    subquestion(
      score: 8,
      stem: [已知函数 $F(x)$（$x >= 0$）满足：对任意 $x in [0, +infinity)$，$0 < F(x) < 1$。若 $I = [a, +infinity)$，$f_1(x) = F(x)$，$f_2(x) = 1/2 [F(x + a) + F(x - a)]$，$f_3(x) = 1 - e^(-x)$，证明：若 $F(x)$ 严格减，则存在 $a > 0$，使 $n_I >= 4$；若 $F(x)$ 严格增，则存在 $a in (0, 1)$，使 $n_I != 2$。],
      answers: ([证明见解析；严格增时可取充分小的 $a > 0$，使 $n_I = 1$。],),
      explanation: [
        #step[列出六个排列的条件][下表中的不等式均指在 $I$ 上恒成立：
          #table(
            columns: 2,
            align: (center, left),
            stroke: figure-style.thickness,
            [排列], [等价条件],
            [$(1, 2, 3)$], [恒成立],
            [$(1, 3, 2)$], [$f_2 <= f_3$],
            [$(2, 1, 3)$], [$f_1 <= f_2$],
            [$(2, 3, 1)$], [$f_1 <= f_2$ 且 $f_1 <= f_3$],
            [$(3, 1, 2)$], [$f_1 <= f_3$ 且 $f_2 <= f_3$],
            [$(3, 2, 1)$], [$f_1 <= f_3$],
          )
        ]
        #step[严格递减的情形][取 $a = -ln(1 - F(0)) > 0$，则 $f_3(a) = F(0)$。#linebreak()对 $x >= a$，由 $F$ 递减，$F(x), F(x + a), F(x - a) <= F(0)$，所以
          $ f_1(x) <= F(0) <= f_3(x), quad f_2(x) <= F(0) <= f_3(x). $
          故 $(1, 2, 3)$、$(1, 3, 2)$、$(3, 1, 2)$、$(3, 2, 1)$ 都是 $I$ 排列，$n_I >= 4$。
        ]
        #step[严格递增时，先排除涉及 $f_3$ 的四个排列][取
          $ 0 < a < min(1, -ln(1 - F(0))). $
          此时 $f_3(a) < F(0)$，而 $f_1(a) = F(a) > F(0)$、$f_2(a) = (F(2a) + F(0))/2 > F(0)$。#linebreak()因此 $f_1 <= f_3$ 与 $f_2 <= f_3$ 均不能在 $I$ 上恒成立，表中的 $(1, 3, 2)$、$(2, 3, 1)$、$(3, 1, 2)$、$(3, 2, 1)$ 均被排除。
        ]
        #step[再排除 $(2, 1, 3)$][若 $f_1 <= f_2$ 在 $I$ 上恒成立，令 $x = j a$（$j = 1, 2, dots$），得
          $ F((j + 1)a) - F(j a) >= F(j a) - F((j - 1)a). $
          记 $delta = F(a) - F(0) > 0$，由递推可知每个相邻增量都不小于 $delta$。故对所有正整数 $n$，
          $ F(n a) >= F(0) + n delta. $
          取足够大的 $n$，右侧超过 $1$，与 $F(n a) < 1$ 矛盾。因此 $(2, 1, 3)$ 也不成立。#linebreak()只剩恒成立的 $(1, 2, 3)$，所以 $n_I = 1 != 2$，结论得证。
        ]
      ],
    ),
  ),
)
