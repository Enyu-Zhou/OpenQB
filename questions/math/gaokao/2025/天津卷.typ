#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, space-axes, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2025,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2025/2025天津.pdf",
  regions: ("天津",),
)

#let function-figure() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.2,
    shared-zero: $O$,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (5, 4),
    axis-style: "school-book",
    x-min: -3.5,
    x-max: 3.5,
    y-min: -2.5,
    y-max: 2.5,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (-1, 1),
    {
      for domain in ((-3.5, -1.23), (-0.81, 0), (0, 0.81), (1.23, 3.5)) {
        plot.add(
          x => calc.abs(x) / (x * x - 1),
          domain: domain,
          style: (stroke: figure-style.thickness),
        )
      }
      plot.annotate(resize: false, {
        for x in (-1, 1) {
          line((x, -2.5), (x, 2.5), stroke: (dash: figure-style.dash))
        }
      })
    },
  )
})
#let cube-figure(auxiliary: false) = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (4, 0, 0)
  let c = (4, 4, 0)
  let d = (0, 4, 0)
  let a1 = (0, 0, 4)
  let b1 = (4, 0, 4)
  let c1 = (4, 4, 4)
  let d1 = (0, 4, 4)
  let e = (0, 2, 4)
  let f = (4, 2, 4)
  let g = (4, 4, 3)
  oblique-project((1, 0), (0.4, 0.3), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(e, f, b, g, f)
    line(b, e, g, stroke: (dash: figure-style.dash))
    if auxiliary {
      space-axes(
        (4, 4, 4),
        (5.1, 5.1, 5.1),
        label-anchors: ("north", "west", "south"),
      )
    }
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "north-west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "north-east"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
      (e, $E$, "east"),
      (f, $F$, "south-east"),
      (g, $G$, "west"),
    ) {
      content(p, label, anchor: anchor, padding: 0.12)
    }
  })
})

#section[选择题：本大题共 9 小题，每小题 5 分，共 45 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [已知全集 $U = {1, 2, 3, 4, 5}$，集合 $A = {1, 3}$，$B = {2, 3, 5}$，则 $complement_U (A union B) =$#choice-placeholder()。],
  choices: ([${1, 2, 4, 5}$], [${1, 3, 4}$], [${1, 2, 3, 5}$], [${4}$]),
  answers: ([D],),
  explanation: [$A union B = {1, 2, 3, 5}$，故 $complement_U (A union B) = {4}$，选 D。],
)
#question(
  "single-choice",
  stem: [已知 $x in RR$，则“$x = 0$”是“$sin 2x = 0$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [$x = 0$ 能推出 $sin 2x = 0$；但 $x = pi$ 时，后者成立而前者不成立，故为充分不必要条件，选 A。],
)
#question(
  "single-choice",
  stem: [已知函数 $y = f(x)$ 的部分图象如下，则 $f(x)$ 的解析式可能为#choice-placeholder()。
    #figure(function-figure())
  ],
  choices: (
    [$f(x) = x/(1 - abs(x))$],
    [$f(x) = x/(abs(x) - 1)$],
    [$f(x) = abs(x)/(1 - x^2)$],
    [$f(x) = abs(x)/(x^2 - 1)$],
  ),
  answers: ([D],),
  explanation: [图象关于 $y$ 轴对称，排除奇函数 A、B。#linebreak()当 $0 < x < 1$ 时图象在 $x$ 轴下方，C 的函数值为正、D 为负，故选 D。],
)
#question(
  "single-choice",
  stem: [已知 $m$ 是一条直线，$alpha, beta$ 是两个平面。下列命题正确的是#choice-placeholder()。],
  choices: (
    [若 $m parallel alpha$，$m parallel beta$，则 $alpha parallel beta$],
    [若 $m perp alpha$，$m perp beta$，则 $alpha perp beta$],
    [若 $m parallel alpha$，$m perp beta$，则 $alpha perp beta$],
    [若 $alpha perp beta$，$m subset alpha$，则 $m perp beta$],
  ),
  answers: ([C],),
  explanation: [
    #step[选项 C][在平面 $alpha$ 内可取直线 $n parallel m$，则 $n perp beta$，故 $alpha perp beta$，C 正确。]
    #step[其余选项][两相交平面可同时平行于同一直线，A 错误；同垂直于一条直线的两个不同平面互相平行，B 错误；两平面的交线同时位于两平面内，不能垂直于其中任一平面，D 错误。]
  ],
)
#question(
  "single-choice",
  stem: [下列说法错误的是#choice-placeholder()。],
  choices: (
    [若随机变量 $X tilde N(mu, sigma^2)$，则 $P(X <= mu - sigma) = P(X >= mu + sigma)$],
    [若随机变量 $X tilde N(1, 2^2)$，$Y tilde N(2, 2^2)$，则 $P(X <= 1) < P(Y <= 2)$],
    [样本相关系数的绝对值越接近 $1$，则成对数据的线性相关程度越强],
    [样本相关系数的绝对值越接近 $0$，则成对数据的线性相关程度越弱],
  ),
  answers: ([B],),
  explanation: [正态分布关于均值对称，所以 A 正确，而 B 中两个概率都为 $1/2$，严格不等式不成立。#linebreak()C、D 符合样本相关系数的含义，故选 B。],
)
#question(
  "single-choice",
  stem: [已知数列 $\{a_n\}$ 的前 $n$ 项和为 $S_n = -n^2 + 8n$，则数列 $\{abs(a_n)\}$ 的前 $12$ 项和为#choice-placeholder()。],
  choices: ([$144$], [$112$], [$80$], [$48$]),
  answers: ([C],),
  explanation: [$a_1 = 7$；当 $n >= 2$ 时，$a_n = S_n - S_(n - 1) = 9 - 2n$，此式对 $n = 1$ 也成立。#linebreak()前 $4$ 项为正，其后为负，故 $sum_(n = 1)^12 abs(a_n) = S_4 - (S_12 - S_4) = 2 times 16 - (-48) = 80$，选 C。],
)
#question(
  "single-choice",
  stem: [函数 $f(x) = 0.3^x - sqrt(x)$ 的零点所在的一个区间是#choice-placeholder()。],
  choices: ([$(0, 0.3)$], [$(0.3, 0.5)$], [$(0.5, 1)$], [$(1, 2)$]),
  answers: ([B],),
  explanation: [$f$ 在 $[0, +infinity)$ 上连续且严格递减。#linebreak()$0.3^0.3 > 0.3^0.5 = sqrt(0.3)$，故 $f(0.3) > 0$；$f(0.5) = sqrt(0.3) - sqrt(0.5) < 0$。#linebreak()由零点存在定理，唯一零点在 $(0.3, 0.5)$ 内，选 B。],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x) = sin(omega x + phi)$（$omega > 0$，$-pi < phi < pi$）在区间 $[-(5pi)/12, pi/12]$ 上单调递增，直线 $x = pi/12$ 为曲线 $y = f(x)$ 的一条对称轴，点 $(pi/3, 0)$ 为曲线 $y = f(x)$ 的一个对称中心，则 $f(x)$ 在区间 $[0, pi/2]$ 上的最小值为#choice-placeholder()。],
  choices: ([$-sqrt(3)/2$], [$-1/2$], [$-1$], [$0$]),
  answers: ([A],),
  explanation: [
    #step[确定参数][单调递增区间的长度为 $pi/2$，不超过半个周期 $pi/omega$，故 $0 < omega <= 2$。#linebreak()递增区间右端为对称轴，故 $omega pi/12 + phi = pi/2 + 2k pi$。对称中心满足 $omega pi/3 + phi = j pi$。#linebreak()相减得 $omega pi/4 = (j - 2k - 1/2)pi$。左端在 $(0, pi/2]$ 内，因此只能等于 $pi/2$，得 $omega = 2$。#linebreak()由 $-pi < phi < pi$，得 $phi = pi/3$。]
    #step[求最小值][$x in [0, pi/2]$ 时，$2x + pi/3 in [pi/3, (4pi)/3]$，正弦函数在该区间的最小值为 $-sqrt(3)/2$，选 A。]
  ],
)
#question(
  "single-choice",
  stem: [已知双曲线 $x^2/a^2 - y^2/b^2 = 1$（$a > 0, b > 0$）的左、右焦点分别为 $F_1, F_2$，以 $F_2$ 为焦点的抛物线 $y^2 = 2p x$（$p > 0$）与双曲线在第一象限的交点为 $P$。若 $abs(P F_1) + abs(P F_2) = 3 abs(F_1 F_2)$，则双曲线的离心率为#choice-placeholder()。],
  choices: ([$2$], [$5$], [$(sqrt(2) + 1)/2$], [$(sqrt(5) + 1)/2$]),
  answers: ([A],),
  explanation: [设半焦距为 $c$，则 $p = 2c$。由双曲线定义和已知条件，$abs(P F_2) = 3c - a$。#linebreak()抛物线准线为 $x = -c$，故 $P$ 的横坐标为 $x = 2c - a$，纵坐标满足 $y^2 = 4c(2c - a)$。#linebreak()代入双曲线方程，令 $e = c/a > 1$，得
    $ (2e - 1)^2 - (4e(2e - 1))/(e^2 - 1) = 1. $
    化简为 $(e - 2)(e^2 + e - 1) = 0$。因 $e > 1$，只能 $e = 2$，故选 A。],
)

#section[填空题：本大题共 6 小题，每小题 5 分，共 30 分。试题中包含两个空的，答对 1 个的给 3 分，全部答对的给 5 分。]
#question(
  "fill-in",
  stem: [$i$ 是虚数单位，$(3 - i)/i =$#fill-placeholder()。],
  answers: ([$-1 - 3i$],),
  explanation: [$(3 - i)/i = -i(3 - i) = -1 - 3i$。],
)
#question(
  "fill-in",
  stem: [在 $(x - 1)^6$ 的展开式中，$x^3$ 的系数为#fill-placeholder()。],
  answers: ([$-20$],),
  explanation: [所求项为 $binom(6, 3)x^3(-1)^3 = -20x^3$，故系数为 $-20$。],
)
#question(
  "fill-in",
  stem: [若直线 $x - y + 6 = 0$ 与 $x$ 轴交于点 $A$，与 $y$ 轴交于点 $B$，与圆 $(x + 1)^2 + (y - 3)^2 = r^2$（$r > 0$）交于 $C, D$ 两点，且 $abs(A B) = 3 abs(C D)$，则 $r =$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [$A(-6, 0)$、$B(0, 6)$，所以 $abs(C D) = abs(A B)/3 = 2 sqrt(2)$。#linebreak()圆心 $(-1, 3)$ 到直线的距离为 $abs(-1 - 3 + 6)/sqrt(2) = sqrt(2)$。#linebreak()由半弦、圆心距和半径组成的直角三角形，$r^2 = (sqrt(2))^2 + (sqrt(2))^2 = 4$，故 $r = 2$。],
)
#question(
  "fill-in",
  stem: [小颖同学去某健康主题公园沿环形步道跑步锻炼，每周两次，每次跑五圈或六圈，每周第一次跑五圈和六圈的概率都是 $0.5$。若第一次跑了五圈，则第二次跑五圈和六圈的概率分别为 $0.4$ 和 $0.6$；若第一次跑了六圈，则第二次跑五圈和六圈的概率分别为 $0.6$ 和 $0.4$。小颖同学一周共跑十一圈的概率为#fill-placeholder()；当小颖同学在一周内跑步不少于十一圈时，则认为这一周运动量合格。假设各周之间跑步圈数互不影响，在 $4$ 周的跑步锻炼中，以 $X$ 表示小颖同学运动量合格的周数，则 $X$ 的数学期望为#fill-placeholder()。],
  answers: ([$0.6$], [$3.2$]),
  explanation: [一周共跑十一圈的概率为 $0.5 times 0.6 + 0.5 times 0.6 = 0.6$。#linebreak()一周不合格仅可能两次均跑五圈，其概率为 $0.5 times 0.4 = 0.2$，故合格概率为 $0.8$。#linebreak()于是 $X tilde B(4, 0.8)$，$E(X) = 4 times 0.8 = 3.2$。],
)
#question(
  "fill-in",
  stem: [在 $triangle A B C$ 中，$arrow(A D) = 1/2 arrow(A B)$，$arrow(C E) = 1/3 arrow(C D)$。记 $arrow(A B) = bold(a)$，$arrow(A C) = bold(b)$，用 $bold(a)$ 和 $bold(b)$ 表示 $arrow(A E) =$#fill-placeholder()；若 $abs(arrow(A E)) = 5$，且 $A E perp B C$，则 $arrow(A E) dot arrow(C D) =$#fill-placeholder()。],
  answers: ([$1/6 bold(a) + 2/3 bold(b)$], [$-15$]),
  explanation: [由 $arrow(C D) = 1/2 bold(a) - bold(b)$，得 $arrow(A E) = arrow(A C) + 1/3 arrow(C D) = 1/6 bold(a) + 2/3 bold(b)$。#linebreak()记 $bold(u) = arrow(A E)$。垂直条件给出 $bold(u) dot (bold(b) - bold(a)) = 0$，故 $bold(u) dot bold(a) = bold(u) dot bold(b)$。#linebreak()又 $25 = abs(bold(u))^2 = 5/6 bold(u) dot bold(a)$，所以 $bold(u) dot bold(a) = 30$。#linebreak()因此 $arrow(A E) dot arrow(C D) = (1/2 - 1) times 30 = -15$。],
)
#question(
  "fill-in",
  stem: [已知 $a, b in RR$，且 $(2a + b)x^2 + b x - a - 1 <= 0$ 对任意 $x in [-2, 2]$ 成立，则 $2a + b$ 的最小值为#fill-placeholder()。],
  answers: ([$-4$],),
  explanation: [取 $x = -1/2$，得 $-(2a + b)/4 - 1 <= 0$，所以 $2a + b >= -4$。#linebreak()取 $a = 0$、$b = -4$，原式为 $-4x^2 - 4x - 1 = -(2x + 1)^2 <= 0$，恒成立。#linebreak()故最小值为 $-4$。],
)

#section[解答题：本大题共 5 小题，共 75 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  stem: [在 $triangle A B C$ 中，角 $A, B, C$ 所对的边分别为 $a, b, c$。已知 $a sin B = sqrt(3)b cos A$，$c - 2b = 1$，$a = sqrt(7)$。],
  parts: (
    subquestion(
      stem: [求角 $A$ 的大小；],
      answers: ([$pi/3$],),
      explanation: [由正弦定理，$sin A sin B = sqrt(3) sin B cos A$。因 $sin B > 0$，得 $sin A = sqrt(3) cos A$。#linebreak()故 $cos A > 0$，$tan A = sqrt(3)$，$A = pi/3$。],
    ),
    subquestion(
      stem: [求 $c$ 的值；],
      answers: ([$3$],),
      explanation: [由余弦定理，$7 = b^2 + c^2 - b c$。代入 $c = 2b + 1$，得 $3b^2 + 3b - 6 = 0$。#linebreak()由 $b > 0$，取 $b = 1$，故 $c = 3$。],
    ),
    subquestion(
      stem: [求 $sin(A + 2B)$ 的值。],
      answers: ([$(4 sqrt(3))/7$],),
      explanation: [由正弦、余弦定理，$sin B = sqrt(3)/(2 sqrt(7))$、$cos B = 5/(2 sqrt(7))$。#linebreak()故 $sin 2B = (5 sqrt(3))/14$、$cos 2B = 11/14$，从而
        $
          sin(A + 2B) = sqrt(3)/2 times 11/14 + 1/2 times (5 sqrt(3))/14 = (4 sqrt(3))/7.
        $],
    ),
  ),
)
#question(
  "solution",
  stem: [已知正方体 $A B C D - A_1 B_1 C_1 D_1$ 的棱长为 $4$，$E, F$ 分别为 $A_1 D_1$ 和 $B_1 C_1$ 的中点，$G$ 在线段 $C C_1$ 上，且 $C G = 3G C_1$。
    #figure(cube-figure())
  ],
  parts: (
    subquestion(
      stem: [求证：$G F perp$ 平面 $E B F$；],
      answers: ([证明见解析。],),
      explanation: [以 $A$ 为原点，$A B, A D, A A_1$ 的方向为坐标轴正方向，则 $B(4, 0, 0)$、$D(0, 4, 0)$、$E(0, 2, 4)$、$F(4, 2, 4)$、$G(4, 4, 3)$。
        #figure(cube-figure(auxiliary: true))
        $arrow(G F) = (0, -2, 1)$、$arrow(E F) = (4, 0, 0)$、$arrow(B F) = (0, 2, 4)$。#linebreak()前者与后两者的数量积均为零，故 $G F perp E F$、$G F perp B F$。两线相交于 $F$，所以 $G F perp$ 平面 $E B F$。],
    ),
    subquestion(
      stem: [求平面 $E B F$ 和平面 $E B G$ 夹角的余弦值；],
      answers: ([$4/5$],),
      explanation: [平面 $E B F$ 的一个法向量为 $bold(n) = (0, -2, 1)$。#linebreak()由 $arrow(E B) = (4, -2, -4)$、$arrow(E G) = (4, 2, -1)$，可取平面 $E B G$ 的法向量为 $bold(m) = (5, -6, 8)$。#linebreak()故所求余弦为 $abs(bold(n) dot bold(m))/(abs(bold(n)) abs(bold(m))) = 20/(sqrt(5) sqrt(125)) = 4/5$。],
    ),
    subquestion(
      stem: [求三棱锥 $D - E B F$ 的体积。],
      answers: ([$32/3$],),
      explanation: [$E F perp B F$，$E F = 4$、$B F = 2 sqrt(5)$，故 $S_(triangle E B F) = 4 sqrt(5)$。#linebreak()平面 $E B F$ 的方程为 $-2y + z = 0$，$D$ 到该平面的距离为 $8/sqrt(5)$。#linebreak()故体积为 $1/3 times 4 sqrt(5) times 8/sqrt(5) = 32/3$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $x^2/a^2 + y^2/b^2 = 1$（$a > b > 0$）的离心率为 $1/2$，左焦点为 $F$，右顶点为 $A$，点 $P$ 在直线 $x = a$ 上，直线 $F P$ 的斜率为 $1/3$，$triangle P F A$ 的面积为 $3/2$。],
  parts: (
    subquestion(
      stem: [求椭圆的方程；],
      answers: ([$x^2/4 + y^2/3 = 1$],),
      explanation: [设半焦距为 $c = a/2$，则 $F(-a/2, 0)$、$A(a, 0)$。由斜率得 $P(a, a/2)$。#linebreak()因此 $1/2 times (3a)/2 times a/2 = 3/2$，得 $a^2 = 4$，$b^2 = a^2 - c^2 = 3$。#linebreak()椭圆方程为 $x^2/4 + y^2/3 = 1$，且 $F(-1, 0)$、$A(2, 0)$、$P(2, 1)$。],
    ),
    subquestion(
      stem: [若过 $P$ 的直线与椭圆有唯一公共点 $B$（$B$ 异于 $A$），求证：$F P$ 平分 $angle A F B$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[求另一切点][竖直线 $x = 2$ 的切点为 $A$，不合要求。故设切线为 $y = k(x - 2) + 1$。联立椭圆并令判别式为零，得 $k = -1/2$，切点为 $B(1, 3/2)$。#linebreak()也可由切点形式 $x_B x/4 + y_B y/3 = 1$ 经过 $P(2, 1)$，得 $3x_B + 2y_B = 6$，与椭圆联立并排除 $A$，得到相同结果。]
        #step[比较两角][直线 $F B$ 的斜率为 $3/4$，$F P$ 的斜率为 $1/3$。两条射线均在第一象限方向，且 $F P$ 在 $F A$ 与 $F B$ 之间。#linebreak()设 $alpha = angle A F P$、$beta = angle P F B$，则
          $
            tan alpha = 1/3, quad tan beta = (3/4 - 1/3)/(1 + 3/4 times 1/3) = 1/3.
          $
          因 $alpha, beta in (0, pi/2)$，有 $alpha = beta$，故 $F P$ 平分 $angle A F B$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知等差数列 $\{a_n\}$ 和等比数列 $\{b_n\}$ 满足 $a_1 = b_1 = 2$，$a_2 = b_2 + 1$，$a_3 = b_3$。],
  parts: (
    subquestion(
      stem: [求 $\{a_n\}$ 和 $\{b_n\}$ 的通项公式；],
      answers: ([$a_n = 3n - 1$，$b_n = 2^n$。],),
      explanation: [设公差为 $d$、公比为 $q != 0$，则 $2 + d = 2q + 1$、$2 + 2d = 2q^2$。#linebreak()消去 $d$ 得 $q(q - 2) = 0$，故 $q = 2$、$d = 3$，所以 $a_n = 3n - 1$、$b_n = 2^n$。],
    ),
    subquestion(
      stem: [给定 $n in NN^*$，记集合 $I = {0, 1}$，集合 $T_n = {p_1 a_1 b_1 + p_2 a_2 b_2 + dots + p_n a_n b_n | p_1, p_2, dots, p_n in I}$。],
      parts: (
        subquestion(
          stem: [求证：对任意的 $t in T_n$，有 $t < a_(n + 1)b_(n + 1)$；],
          answers: ([证明见解析。],),
          explanation: [因各 $a_k b_k$ 均为正，$t <= S_n = sum_(k = 1)^n (3k - 1)2^k$。#linebreak()错位相减，或用数学归纳法，得
            $ S_n = (3n - 4)2^(n + 1) + 8. $
            于是 $a_(n + 1)b_(n + 1) - S_n = 6 times 2^(n + 1) - 8 > 0$，故结论成立。],
        ),
        subquestion(
          stem: [求 $T_n$ 中所有元素之和。],
          answers: ([$(3n - 4)2^(2n) + 2^(n + 2)$],),
          explanation: [
            #step[证明不同选择对应不同元素][若两组 $0, 1$ 系数不同，取系数不同的最大下标 $j$。该位置造成的差的绝对值为 $a_j b_j$，而之前所有位置的差的绝对值之和至多为 $S_(j - 1) < a_j b_j$；$j = 1$ 时也显然不能抵消。#linebreak()故不同选择得到不同元素，$T_n$ 共有 $2^n$ 个元素。]
            #step[统计每一项出现次数][每个 $a_k b_k$ 在所有选择中恰出现 $2^(n - 1)$ 次，所以总和为
              $ 2^(n - 1) S_n = (3n - 4)2^(2n) + 2^(n + 2). $
            ]
          ],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  stem: [已知 $a in RR$，函数 $f(x) = a x - (ln x)^2$。],
  parts: (
    subquestion(
      stem: [当 $a = 1$ 时，求曲线 $y = f(x)$ 在点 $(1, f(1))$ 处的切线方程；],
      answers: ([$y = x$],),
      explanation: [$f(1) = 1$，$f'(x) = 1 - (2 ln x)/x$，故 $f'(1) = 1$，切线为 $y - 1 = x - 1$，即 $y = x$。],
    ),
    subquestion(
      stem: [若 $f(x)$ 有三个零点 $x_1, x_2, x_3$，且 $x_1 < x_2 < x_3$，],
      parts: (
        subquestion(
          stem: [求 $a$ 的取值范围；],
          answers: ([$(0, 4/e^2)$],),
          explanation: [令 $t = ln x$，零点条件等价于 $a = h(t) = t^2 e^(-t)$。#linebreak()有 $h'(t) = t(2 - t)e^(-t)$。因此 $h$ 在 $(-infinity, 0)$ 上递减，在 $(0, 2)$ 上递增，在 $(2, +infinity)$ 上递减。#linebreak()又 $h(0) = 0$、$h(2) = 4/e^2$，两端极限分别为 $+infinity$ 与 $0$。#linebreak()水平线与图象有三个交点，当且仅当 $0 < a < 4/e^2$；此时 $ln x_1 < 0 < ln x_2 < 2 < ln x_3$。],
        ),
        subquestion(
          stem: [求证：$(ln x_2 - ln x_1) ln x_3 < (4e)/(e - 1)$。],
          answers: ([证明见解析。],),
          explanation: [
            #step[转化为三个正数的关系][记 $u = -ln x_1 > 0$、$v = ln x_2 in (0, 2)$、$w = ln x_3 > 2$。由零点条件，
              $ u^2 e^u = v^2 e^(-v) = w^2 e^(-w). $
              所证左端为 $(u + v)w$。
            ]
            #step[估计 $v w$][由 $v e^(-v/2) = w e^(-w/2)$，令 $s = w/v > 1$，得 $v = (2 ln s)/(s - 1)$。#linebreak()对 $s > 1$，函数 $q(s) = (s - 1)/sqrt(s) - ln s$ 满足 $q(1) = 0$、$q'(s) = (sqrt(s) - 1)^2/(2s^(3/2)) > 0$，故
              $ v w = (4s(ln s)^2)/(s - 1)^2 < 4. $
            ]
            #step[估计 $u w$ 并合并][由 $u e^(u/2) = w e^(-w/2)$，得 $u < w e^(-w/2)$，故 $u w < w^2 e^(-w/2)$。#linebreak()函数 $r(w) = w^2 e^(-w/2)$ 在 $w > 2$ 上的最大值为 $r(4) = 16/e^2$，所以
              $ (u + v)w < 4 + 16/e^2 < (4e)/(e - 1). $
              最后一个不等式等价于 $4(e - 1) < e^2$，即 $(e - 2)^2 > 0$。故原不等式成立。
            ]
          ],
        ),
      ),
    ),
  ),
)
