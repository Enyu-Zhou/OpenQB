#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, space-axes, step, subquestion,
)

#show: exam.with(
  subject: "数学",
  year: 2026,
  type: "普通高等学校招生统一考试",
  name: "北京卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2026/2026北京.pdf",
  regions: ("北京",),
)

#let crank-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    let a = (0, 0)
    let b = (4, 0)
    let d = (-0.2, calc.sqrt(0.96))
    // 两圆交点保证 BC、CD 的长度与题设一致。
    let v = d.zip(b).map(((x, y)) => x - y)
    let distance = calc.sqrt(v.map(x => x * x).sum())
    let u = v.map(x => x / distance)
    let t = (2.5 * 2.5 - 9 + distance * distance) / (2 * distance)
    let h = calc.sqrt(2.5 * 2.5 - t * t)
    let c = (4 + t * u.at(0) + h * u.at(1), t * u.at(1) - h * u.at(0))
    circle(a, radius: 1)
    line(a, b, c, d, a)
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "west"),
      (c, $C$, "south"),
      (d, $D$, "south-east"),
    ) {
      content(p, label, anchor: anchor, padding: 0.12)
    }
  })
}

#let pyramid-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 11mm, {
    import cetz.draw: *
    let a = (0, 1, 2)
    let b = (0, -1, 0)
    let c = (-calc.sqrt(3), 0, 0)
    let d = (calc.sqrt(3), 0, 0)
    oblique-project((1, 0), (0.3, 0.65), (0, 1), {
      set-style(stroke: (thickness: figure-style.thickness, join: "round"))
      line(c, d, stroke: (dash: figure-style.dash))
      line(a, c, b, d, a, b)
      for (p, label, anchor) in (
        (a, $A$, "south"),
        (b, $B$, "north"),
        (c, $C$, "east"),
        (d, $D$, "west"),
      ) {
        content(p, label, anchor: anchor, padding: 0.12)
      }
    })
  })
}

#let prism-figure(auxiliary: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 13mm, {
    import cetz.draw: *
    let a = (0, 0, 0)
    let b = (2, 0, 0)
    let c = (0, 2, 0)
    let a1 = (0, 0, calc.sqrt(2))
    let b1 = (2, 0, calc.sqrt(2))
    let c1 = (0, 2, calc.sqrt(2))
    let d = (0, 1, 0)
    let e = (1, 0, calc.sqrt(2))
    let p = (0.5, 0.5, calc.sqrt(2))
    oblique-project((-0.85, -0.4), (0.7, -0.4), (0, 1), {
      set-style(stroke: (thickness: figure-style.thickness, join: "round"))
      line(b, a, c, stroke: (dash: figure-style.dash))
      line(a, a1, stroke: (dash: figure-style.dash))
      line(b, c, c1, a1, b1, b)
      line(b1, c1)
      line(e, d, p, a, stroke: (dash: figure-style.dash))
      line(e, p)
      if auxiliary { space-axes((2, 2, calc.sqrt(2)), (2.65, 2.65, 2.05)) }
      for (point, label, anchor) in (
        (a, $A$, "south-east"),
        (b, $B$, "north"),
        (c, $C$, if auxiliary { "south-west" } else { "north-west" }),
        (a1, $A_1$, "south-east"),
        (b1, $B_1$, "east"),
        (c1, $C_1$, "west"),
        (d, $D$, "north"),
        (e, $E$, "south-east"),
        (p, $P$, "south-west"),
      ) { content(point, label, anchor: anchor, padding: 0.12) }
    })
  })
}

#section[选择题：共 10 小题，每小题 4 分，共 40 分。在每小题列出的四个选项中，选出符合题目要求的一项。]

#question(
  "single-choice",
  stem: [已知集合 $M = {x | -1 < x < 3}$，$N = {x | x >= 2}$，则 $M union N =$#choice-placeholder()],
  choices: (
    [${x | x > -1}$],
    [${x | x < 3}$],
    [${x | x >= 2}$],
    [${x | 2 <= x < 3}$],
  ),
  answers: ([A],),
  explanation: [两区间 $(-1, 3)$ 与 $[2, +infinity)$ 的并集为 $(-1, +infinity)$，故选 A。],
)
#question(
  "single-choice",
  stem: [已知复数 $z_1 = 3 - 2i$，$z_2 = -5 + 4i$，则 $abs(z_1 + z_2) =$#choice-placeholder()],
  choices: ([$sqrt(2)$], [$2$], [$2 sqrt(2)$], [$8$]),
  answers: ([C],),
  explanation: [$z_1 + z_2 = -2 + 2i$，故 $abs(z_1 + z_2) = sqrt((-2)^2 + 2^2) = 2 sqrt(2)$，选 C。],
)
#question(
  "single-choice",
  stem: [已知双曲线 $x^2/a^2 - y^2/4 = 1$（$a > 0$）的渐近线方程为 $y = plus.minus 2/3 x$，则 $a =$#choice-placeholder()],
  choices: ([$sqrt(3)$], [$3$], [$6$], [$9$]),
  answers: ([B],),
  explanation: [渐近线为 $y = plus.minus 2/a x$，故 $2/a = 2/3$，得 $a = 3$，选 B。],
)
#question(
  "single-choice",
  stem: [在 $(a - sqrt(x))^7$ 的展开式中，若 $x^2$ 的系数为 $280$，则实数 $a =$#choice-placeholder()],
  choices: ([$2$], [$-2$], [$1$], [$-1$]),
  answers: ([A],),
  explanation: [含 $x^2$ 的项为 $binom(7, 4) a^3 (-sqrt(x))^4 = 35a^3 x^2$。#linebreak()由 $35a^3 = 280$，得 $a = 2$，选 A。],
)
#question(
  "single-choice",
  stem: [下列函数中，是奇函数且在其定义域上单调递增的为#choice-placeholder()],
  choices: (
    [$y = 1/(x^2 + 1)$],
    [$y = 2^(-x) - 2^x$],
    [$y = sin x$],
    [$y = ln ((5 + x)/(5 - x))$],
  ),
  answers: ([D],),
  explanation: [A 为偶函数；B 在 $RR$ 上递减；C 在 $RR$ 上不单调。#linebreak()D 的定义域为 $(-5, 5)$，关于原点对称，且 $f(-x) = -f(x)$。#linebreak()又 $f'(x) = 1/(5 + x) + 1/(5 - x) = 10/(25 - x^2) > 0$，故选 D。],
)
#question(
  "single-choice",
  stem: [已知向量 $bold(a), bold(b)$ 满足 $bold(a) = (-3, 0)$，$abs(bold(a) - bold(b)) = 1$，则#choice-placeholder()],
  choices: (
    [$abs(bold(b))$ 的最小值为 $1$],
    [$abs(bold(b))$ 的最小值为 $3$],
    [$abs(bold(b))$ 的最大值为 $3$],
    [$abs(bold(b))$ 的最大值为 $4$],
  ),
  answers: ([D],),
  explanation: [由三角不等式得 $2 = abs(bold(a)) - 1 <= abs(bold(b)) <= abs(bold(a)) + 1 = 4$。#linebreak()取 $bold(b) = (-2, 0)$、$(-4, 0)$ 可分别达到两端，故选 D。],
)
#question(
  "single-choice",
  stem: [已知 $\{a_n\}$、$\{b_n\}$ 均为无穷数列，则“存在常数 $M$，使得 $a_n <= M <= b_n$（$n = 1, 2, dots$）”是“$a_n <= b_n$（$n = 1, 2, dots$）”的#choice-placeholder()],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [若存在这样的 $M$，显然每个 $n$ 都有 $a_n <= b_n$，故充分。#linebreak()反之，取 $a_n = b_n = n$，虽逐项满足不等式，却不存在一个常数同时等于所有正整数，故不必要，选 A。],
)
#question(
  "single-choice",
  stem: [设函数 $f(x) = sin(x + phi)$（$0 < phi < 2pi$）。若将 $y = f(x)$ 的图象沿 $x$ 轴的正方向平移 $3phi$ 个单位长度，所得图象与 $y = f(x)$ 的图象关于 $x$ 轴对称，则满足条件的 $phi$ 的个数为#choice-placeholder()],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([C],),
  explanation: [平移后为 $y = sin(x - 2phi)$。要求对所有 $x$ 都有 $sin(x - 2phi) = -sin(x + phi)$，即相位相差奇数倍 $pi$。#linebreak()故 $3phi = (2k + 1)pi$（$k in ZZ$）。由 $0 < 3phi < 6pi$，得 $phi = pi/3, pi, 5pi/3$，共 $3$ 个，选 C。],
)
#question(
  "single-choice",
  stem: [为纪念红军长征胜利 90 周年，某校组织高一和高二两个年级的学生去甲、乙两个红色教育基地进行研学，每位学生选择其中一个基地参加。已知该校高一学生人数多于高二学生人数。若选择甲基地的学生人数多于选择乙基地的学生人数，则#choice-placeholder()],
  choices: (
    [选择甲基地的高一学生人数多于选择乙基地的高一学生人数],
    [选择甲基地的高一学生人数多于选择乙基地的高二学生人数],
    [选择甲基地的高二学生人数不多于选择乙基地的高一学生人数],
    [选择甲基地的高二学生人数不多于选择乙基地的高二学生人数],
  ),
  answers: ([B],),
  explanation: [设高一选择甲、乙的人数分别为 $a, b$，高二选择甲、乙的人数分别为 $c, d$。#linebreak()题意给出 $a + b > c + d$、$a + c > b + d$。两式相加得 $2a > 2d$，即 $a > d$，故选 B。],
)
#question(
  "single-choice",
  stem: [曲柄摇杆机构可以实现旋转运动与摆动运动的相互转化，被广泛应用于多个领域。已知从某曲柄摇杆机构中可抽象出如图所示的平面图形 $A B C D$，其中 $A, B$ 为定点，$C, D$ 为动点，$A B = 4$，$B C = 5/2$，$C D = 3$，$A D = 1$，则 $cos angle A B C$ 的取值范围是#choice-placeholder()
    #figure(crank-figure())
  ],
  choices: (
    [$[5/16, 53/80]$],
    [$[5/16, 73/80]$],
    [$[5/12, 53/80]$],
    [$[5/12, 73/80]$],
  ),
  answers: ([B],),
  explanation: [由 $A D = 1$、$C D = 3$，得 $2 <= A C <= 4$，当 $A, C, D$ 共线时可取端点。#linebreak()这一区间也满足 $abs(A B - B C) < A C < A B + B C$，故每个值均可实现。#linebreak()由余弦定理，$cos angle A B C = (A B^2 + B C^2 - A C^2)/(2A B dot B C) = (89/4 - A C^2)/20$。#linebreak()因此取值范围为 $[5/16, 73/80]$，选 B。],
)

#section[填空题：共 5 小题，每小题 5 分，共 25 分。]

#question(
  "fill-in",
  stem: [若直线 $a x + y = 0$ 与圆 $(x - 2)^2 + (y - 2)^2 = 4$ 相切，则 $a =$#fill-placeholder()。],
  answers: ([$0$],),
  explanation: [圆心到直线的距离等于半径，故 $abs(2a + 2)/sqrt(a^2 + 1) = 2$。#linebreak()平方得 $(a + 1)^2 = a^2 + 1$，解得 $a = 0$。],
)
#question(
  "fill-in",
  stem: [已知公差为 $d$ 的等差数列 $\{a_n\}$ 的前 $n$ 项和为 $S_n$。若 $S_6 = 6a_6 + 30$，则 $d =$#fill-placeholder()，使得 $S_n <= S_5$ 对所有 $n$ 都成立的一个 $a_1$ 的取值为#fill-placeholder()。],
  answers: ([$-2$], [$9$（答案不唯一，$8 <= a_1 <= 10$ 均可）]),
  explanation: [由 $6a_1 + 15d = 6(a_1 + 5d) + 30$，得 $d = -2$。#linebreak()数列递减，$S_5$ 为最大值的充要条件为 $a_5 >= 0$ 且 $a_6 <= 0$，即 $a_1 - 8 >= 0$、$a_1 - 10 <= 0$。#linebreak()因此 $a_1 in [8, 10]$，例如取 $a_1 = 9$。],
)
#question(
  "fill-in",
  stem: [我国在机器人技术领域取得了一系列重要成就。在处理机器人语音信号时，常用公式 $F(f) = k lg(1 + f/700)$（其中常数 $k > 0$）将声音频率 $f$（单位：Hz）转换为 $F(f)$。若 $F(f)$ 的取值范围是 $[k lg 2, 3k lg 2]$，则 $f$ 的取值范围是#fill-placeholder()。],
  answers: ([$[700, 4900]$],),
  explanation: [因 $k > 0$ 且对数函数递增，$lg 2 <= lg(1 + f/700) <= lg 8$ 等价于 $2 <= 1 + f/700 <= 8$。#linebreak()故 $700 <= f <= 4900$。],
)
#question(
  "fill-in",
  stem: [如图，在三棱锥 $A - B C D$ 中，$A B = A C = A D = 2 sqrt(2)$，$B C = B D = 2$，$C D = 2 sqrt(3)$。该三棱锥的底面积为#fill-placeholder()，体积为#fill-placeholder()。
    #figure(pyramid-figure())
  ],
  answers: ([$sqrt(3)$], [$(2 sqrt(3))/3$]),
  explanation: [底面三角形中，$cos angle C B D = (4 + 4 - 12)/8 = -1/2$，故 $angle C B D = 120 degree$。#linebreak()底面积为 $1/2 dot 2 dot 2 sin 120 degree = sqrt(3)$，外接圆半径为 $R = (2 sqrt(3))/(2 sin 120 degree) = 2$。#linebreak()由三条侧棱相等，顶点 $A$ 在底面上的投影为底面外心，故高 $h = sqrt((2 sqrt(2))^2 - R^2) = 2$。#linebreak()于是 $V = 1/3 dot sqrt(3) dot 2 = (2 sqrt(3))/3$。],
)
#question(
  "fill-in",
  stem: [已知 $c$ 是非负常数，函数 $f(x) = abs(x^2 - cos x - c^2)$。给出下列四个结论：#linebreak()
    ① $f(x)$ 在区间 $[-1, 1]$ 上有最小值和最大值；#linebreak()
    ② 当 $c = 1$ 时，$f(x)$ 在区间 $(1, 2]$ 上有最大值；#linebreak()
    ③ 当 $c = 0$ 时，方程 $f(x) = 1$ 的解集有 $3$ 个元素；#linebreak()
    ④ 当 $c > 0$ 时，方程 $f(x) = c$ 的解集有 $4$ 个元素。#linebreak()
    其中正确结论的序号是#fill-placeholder()。
  ],
  answers: ([①②③④],),
  explanation: [
    令 $g(x) = x^2 - cos x$，则 $g$ 为偶函数，$g(0) = -1$。#linebreak()又 $g'(0) = 0$、$g''(x) = 2 + cos x >= 1$，故 $g$ 在 $[0, +infinity)$ 上严格递增，值域为 $[-1, +infinity)$。
    #step[结论①][连续函数 $f$ 在闭区间 $[-1, 1]$ 上必能取得最大值和最小值，①正确。]
    #step[结论②][当 $c = 1$ 时，$g(x) - 1$ 在 $[1, 2]$ 上递增，两端值为 $-cos 1$ 和 $3 - cos 2$。#linebreak()因 $3 - cos 2 >= 2 > cos 1$，$abs(g(x) - 1)$ 的最大值在 $x = 2$ 处取得；去掉左端点不影响该最大值，②正确。]
    #step[结论③][当 $c = 0$ 时，$abs(g(x)) = 1$ 等价于 $g(x) = -1$ 或 $g(x) = 1$。前者仅有 $x = 0$，后者有一正一负两个解，共 $3$ 个，③正确。]
    #step[结论④][方程等价于 $g(x) = c^2 + c$ 或 $g(x) = c^2 - c$。#linebreak()当 $c > 0$ 时，两数不同，且均大于 $-1$，因为 $c^2 - c + 1 = (c - 1/2)^2 + 3/4 > 0$。#linebreak()每个方程恰有一正一负两个解，四解互异，④正确。]
  ],
)

#section[解答题：共 6 小题，共 85 分。解答应写出文字说明、演算步骤或证明过程。]

#question(
  "solution",
  score: 13,
  stem: [设函数 $f(x) = 2 sin omega x cos phi + 2 cos omega x sin phi$（$omega > 0, abs(phi) < pi/2$）。已知 $f(x)$ 的最小正周期为 $pi$，且 $f(pi/4) = 1$，$f(0) > 0$。],
  parts: (
    subquestion(
      stem: [求 $omega, phi$ 的值；],
      answers: ([$omega = 2$，$phi = pi/3$。],),
      explanation: [由和角公式，$f(x) = 2 sin(omega x + phi)$。#linebreak()由 $2pi/omega = pi$ 得 $omega = 2$；再由 $2 sin(pi/2 + phi) = 1$ 得 $cos phi = 1/2$。#linebreak()结合 $abs(phi) < pi/2$ 及 $2 sin phi = f(0) > 0$，得 $phi = pi/3$。],
    ),
    subquestion(
      stem: [求 $f(x)$ 的单调递减区间。],
      answers: ([$[pi/12 + k pi, 7pi/12 + k pi]$（$k in ZZ$）。],),
      explanation: [由 $pi/2 + 2k pi <= 2x + pi/3 <= 3pi/2 + 2k pi$，得#linebreak()$pi/12 + k pi <= x <= 7pi/12 + k pi$，故所求区间为 $[pi/12 + k pi, 7pi/12 + k pi]$（$k in ZZ$）。],
    ),
  ),
)

#question(
  "solution",
  score: 13,
  stem: [为了了解某校高三年级学生的数学学习情况，随机抽查了 $200$ 名高三年级学生某次考试的数学成绩，整理成下表：
    #table(
      columns: 6,
      align: center,
      [成绩], $[81, 94)$, $[94, 107)$, $[107, 120)$, $[120, 135)$, $[135, 150]$,
      [人数], [40], [60], [60], [32], [8],
    )
    假设学生的数学成绩相互独立。用频率估计概率。
  ],
  parts: (
    subquestion(
      stem: [估计该校高三年级学生这次考试的数学成绩低于 $120$ 的概率；],
      answers: ([$0.8$],),
      explanation: [对应人数为 $40 + 60 + 60 = 160$，故概率估计值为 $160/200 = 0.8$。],
    ),
    subquestion(
      stem: [从该校高三年级学生中随机抽取 $4$ 人，估计在这次考试中，$2$ 人的数学成绩不低于 $120$ 且 $2$ 人的数学成绩低于 $94$ 的概率；],
      answers: ([$0.0096$],),
      explanation: [成绩不低于 $120$、低于 $94$ 的概率估计值分别为 $(32 + 8)/200 = 0.2$、$40/200 = 0.2$。#linebreak()两类互斥，由独立性，所求概率为 $binom(4, 2) dot 0.2^2 dot 0.2^2 = 0.0096$。],
    ),
    subquestion(
      stem: [为分析该校高三年级学生的数学学习情况，可采用三种方法：将样本中每名学生数学成绩所在区间的左端点值、中点值和右端点值视为该生的数学成绩。分别将这三种方法得到的三组数学成绩的方差记为 $s_"左"^2$、$s_"中"^2$ 和 $s_"右"^2$，判断它们的大小关系。（结论不要求证明）],
      answers: ([$s_"左"^2 < s_"中"^2 < s_"右"^2$],),
      explanation: [以各组人数除以 $200$ 为权重，分别代入 $s^2 = sum p_i x_i^2 - (sum p_i x_i)^2$，得#linebreak()$s_"左"^2 = 209.49$，$s_"中"^2 = 218.41$，$s_"右"^2 = 227.65$，故上述大小关系成立。],
    ),
  ),
)

#question(
  "solution",
  score: 14,
  stem: [如图，在直三棱柱 $A B C - A_1 B_1 C_1$ 中，$D, E$ 分别为 $A C, A_1 B_1$ 的中点，$A B = A C = 2$，$angle B A C = 90 degree$，$B B_1 = sqrt(2)$。
    #figure(prism-figure())
  ],
  parts: (
    subquestion(
      stem: [求证：$D E parallel$ 平面 $B C C_1 B_1$；],
      answers: ([$D E parallel$ 平面 $B C C_1 B_1$，证明见解析。],),
      explanation: [取 $B C$ 的中点 $F$，连接 $D F, F B_1$。#linebreak()由三角形中位线定理，$D F parallel A B$ 且 $D F = (A B)/2$。又 $E B_1 parallel A B$ 且 $E B_1 = (A B)/2$，故四边形 $D F B_1 E$ 是平行四边形，$D E parallel F B_1$。#linebreak()因为 $F B_1 subset$ 平面 $B C C_1 B_1$，$D E subset.not$ 该平面，所以 $D E parallel$ 平面 $B C C_1 B_1$。],
    ),
    subquestion(
      stem: [设点 $P$ 在 $triangle A_1 B_1 C_1$ 的内部，$P E parallel B_1 C_1$。再从条件①、条件②、条件③这三个条件中选择一个作为已知，使点 $P$ 的位置唯一确定，求平面 $P A D$ 与平面 $P D E$ 夹角的余弦值。#linebreak()条件①：$P A = P D$；#linebreak()条件②：$P A perp B C$；#linebreak()条件③：$B B_1 parallel$ 平面 $P D E$。#linebreak()#block(breakable: false)[注：如果选择的条件不符合要求，第（2）问得 $0$ 分；如果选择多个符合要求的条件分别解答，按第一个解答计分。]],
      answers: ([选择条件①（或②），余弦值为 $2/3$。],),
      explanation: [
        #step[选择条件①确定点位][以 $A$ 为原点，$A B, A C, A A_1$ 的方向分别为三条坐标轴正方向，得 $D(0, 1, 0)$，$E(1, 0, sqrt(2))$。#linebreak()由 $P E parallel B_1 C_1$ 且 $P$ 在三角形内部，可设 $P(1 - t, t, sqrt(2))$，$0 < t < 1$。#linebreak()条件①给出 $(1 - t)^2 + t^2 + 2 = (1 - t)^2 + (t - 1)^2 + 2$，解得 $t = 1/2$，故 $P$ 唯一。
          #figure(prism-figure(auxiliary: true))
        ]
        #step[求面面角][此时 $arrow(A P) = (1/2, 1/2, sqrt(2))$，$arrow(A D) = (0, 1, 0)$，可取平面 $P A D$ 的法向量 $bold(n) = (-2 sqrt(2), 0, 1)$。#linebreak()因 $D, E, P$ 均满足 $x + y = 1$，平面 $P D E$ 的法向量可取 $bold(m) = (1, 1, 0)$。#linebreak()所求余弦为 $abs(bold(n) dot bold(m))/(abs(bold(n)) abs(bold(m))) = (2 sqrt(2))/(3 sqrt(2)) = 2/3$。]
        #step[其他条件的可行性][条件②给出 $(1 - t, t, sqrt(2)) dot (-2, 2, 0) = 0$，同样唯一确定 $t = 1/2$。#linebreak()条件③对所有 $0 < t < 1$ 均成立：平面 $P D E$ 恒为 $x + y = 1$，而 $B B_1$ 的方向为 $(0, 0, 1)$，且该直线不在平面内。因此③不能唯一确定 $P$。]
      ],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [已知椭圆 $E: x^2/a^2 + y^2/b^2 = 1$（$a > b > 0$）的一个顶点为 $(2, 0)$，离心率为 $1/2$。过点 $A(1, 1)$ 且斜率为 $k$（$k != plus.minus 1$）的直线与椭圆 $E$ 交于不同的两点 $B, C$。点 $B$ 关于直线 $y = x$ 的对称点为 $D$，直线 $C D$ 与直线 $y = x$ 交于点 $Q$。设 $triangle A B Q$ 与 $triangle A C Q$ 的面积分别为 $S_(triangle A B Q)$ 与 $S_(triangle A C Q)$。],
  parts: (
    subquestion(
      stem: [求椭圆 $E$ 的方程；],
      answers: ([$x^2/4 + y^2/3 = 1$],),
      explanation: [由顶点得 $a = 2$，由 $c/a = 1/2$ 得 $c = 1$，故 $b^2 = a^2 - c^2 = 3$，所求方程为 $x^2/4 + y^2/3 = 1$。],
    ),
    subquestion(
      stem: [若 $abs(S_(triangle A B Q) - S_(triangle A C Q)) = 5/8$，求 $k$ 的值。],
      answers: ([$k = plus.minus sqrt(2)/4$],),
      explanation: [
        #step[把面积差转为一个三角形的面积][点 $A$ 在椭圆内部，故位于弦 $B C$ 内部。因 $k != 1$，$B, C$ 位于 $y = x$ 的两侧，反射后 $C, D$ 位于其同侧，故 $Q$ 位于线段 $C D$ 的延长线上。#linebreak()又 $A, Q$ 在对称轴上，所以 $S_(triangle A B Q) = S_(triangle A D Q)$，从而所给面积差的绝对值等于 $S_(triangle A C D)$。]
        #step[联立方程并计算面积][设 $B(x_1, y_1)$、$C(x_2, y_2)$，则 $D(y_1, x_1)$。联立 $y = k(x - 1) + 1$ 与椭圆方程，得
          $ (4k^2 + 3)x^2 + (8k - 8k^2)x + 4k^2 - 8k - 8 = 0. $
          因而 $x_1 + x_2 = (8k^2 - 8k)/(4k^2 + 3)$，$x_1 x_2 = (4k^2 - 8k - 8)/(4k^2 + 3)$。#linebreak()$A C = sqrt(1 + k^2) abs(x_2 - 1)$，$D$ 到直线 $A C$ 的距离为
          $
            d = abs(k y_1 - x_1 + 1 - k)/sqrt(1 + k^2) = abs((k^2 - 1)(x_1 - 1))/sqrt(1 + k^2).
          $
          故
          $
            S_(triangle A C D) = 1/2 abs((k^2 - 1)(x_1 - 1)(x_2 - 1)) = (5 abs(k^2 - 1))/(8k^2 + 6).
          $
        ]
        #step[求解并验证][由 $(5 abs(k^2 - 1))/(8k^2 + 6) = 5/8$，得 $8 abs(k^2 - 1) = 8k^2 + 6$。#linebreak()当 $k^2 >= 1$ 时无解；当 $k^2 < 1$ 时，$k^2 = 1/8$，得 $k = plus.minus sqrt(2)/4$。#linebreak()两值均不等于 $plus.minus 1$；因 $A$ 在椭圆内部，交点必不同。另由 $C D$ 与 $y = x$ 的联立方程可知，仅 $k = -3/4$ 会使两线平行而无 $Q$，两候选值均避开该值，故均成立。]
      ],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [设函数 $f(x) = x^2 + m x - 4e^(n x - 1)$（$n$ 是整数）。已知曲线 $y = f(x)$ 在点 $(-1, f(-1))$ 处的切线方程为 $4x + e^2 y + e^2 + 8 = 0$。],
  parts: (
    subquestion(
      stem: [求 $m, n$ 的值；],
      answers: ([$m = 2$，$n = 1$。],),
      explanation: [由切线方程，$f(-1) = -1 - 4e^(-2)$、$f'(-1) = -4e^(-2)$。#linebreak()代入得 $1 - m - 4e^(-n - 1) = -1 - 4e^(-2)$、$-2 + m - 4n e^(-n - 1) = -4e^(-2)$。#linebreak()相加并整理得 $e^(n - 1) = (n + 1)/2$。#linebreak()当 $n <= -1$ 时右端非正，不可能；$n = 0$ 时 $e^(-1) < 1/2$；$n >= 2$ 时 $e^(n - 1) > 1 + (n - 1) = n > (n + 1)/2$。#linebreak()所以整数解仅为 $n = 1$，代回得 $m = 2$。],
    ),
    subquestion(
      stem: [求 $f(x)$ 的极值点个数；],
      answers: ([$2$ 个],),
      explanation: [令 $g(x) = f'(x) = 2x + 2 - 4e^(x - 1)$，则 $g'(x) = 2 - 4e^(x - 1)$。#linebreak()因此 $g$ 在 $(-infinity, 1 - ln 2)$ 上递增，在 $(1 - ln 2, +infinity)$ 上递减。#linebreak()由 $g(-1) < 0$、$g(0) = 2 - 4/e > 0$，递增段恰有一个零点 $alpha in (-1, 0)$；递减段因 $g(1) = 0$，恰有一个零点 $1$。#linebreak()所以 $f'$ 在 $alpha$ 处由负变正，在 $1$ 处由正变负，$f$ 恰有 $2$ 个极值点。],
    ),
    subquestion(
      stem: [求直线 $l: y = k x - 1$（$k > 0$）与曲线 $y = f(x)$ 的交点个数。],
      answers: ([$1$ 个],),
      explanation: [
        #step[排除非负横坐标的交点][由第（2）问，$f$ 在 $[0, 1]$ 上递增，在 $[1, +infinity)$ 上递减，故 $x >= 0$ 时 $f(x) <= f(1) = -1$。#linebreak()当 $x > 0$ 时，$k x - 1 > -1$；当 $x = 0$ 时，$f(0) = -4/e < -1$，故均无交点。]
        #step[证明负半轴上恰有一个交点][令 $F(x) = f(x) - (k x - 1) = x^2 + (2 - k)x + 1 - 4e^(x - 1)$。#linebreak()在 $(-infinity, 0]$ 上，$F''(x) = 2 - 4e^(x - 1) >= 2 - 4/e > 0$，故 $F'$ 严格递增，且 $F'(x)$ 在 $x$ 趋于负无穷时趋于负无穷。#linebreak()若 $F'(0) <= 0$，则 $F$ 在负半轴上严格递减；若 $F'(0) > 0$，则 $F$ 先减后增，递增段上 $F(x) <= F(0) = 1 - 4/e < 0$。#linebreak()两种情况中，结合 $F(x)$ 在 $x$ 趋于负无穷时趋于正无穷，均知 $F$ 只在递减段有且仅有一个零点。故交点总数为 $1$。]
      ],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [设 $A$ 是如下形式的 $m$ 行 $n$ 列的数表：
    $
      mat(delim: #none, a_(11), a_(12), dots.h, a_(1n); a_(21), a_(22), dots.h, a_(2n); dots.v, dots.v, dots.down, dots.v; a_(m 1), a_(m 2), dots.h, a_(m n))
    $
    其中位于第 $i$ 行第 $j$ 列的数记为 $a_(i j)$，且 $a_(i j) in {-1, 1}$（$i = 1, 2, dots, m$；$j = 1, 2, dots, n$）。#linebreak()
    若对任意的 $k, l in {1, 2, dots, m}$ 和 $p, q in {1, 2, dots, n}$，当 $l > k$、$q > p$ 且 $(l - k) - (q - p) in {-2, 2}$ 时，均有 $a_(k p) + a_(k q) + a_(l p) + a_(l q) = 0$，则称数表 $A$ 具有性质 $P$。
  ],
  parts: (
    subquestion(
      stem: [分别判断数表 $A_1$ 和 $A_2$ 是否具有性质 $P$。（只需写出结论）
        $
          A_1 = mat(1, 1, -1, 1; -1, 1, -1, 1), quad A_2 = mat(1, -1, 1, -1; 1, 1, -1, -1; -1, 1, 1, 1).
        $
      ],
      answers: ([$A_1$ 不具有性质 $P$，$A_2$ 具有性质 $P$。],),
      explanation: [在 $A_1$ 中，取第 $1, 2$ 行与第 $1, 4$ 列，四个数之和为 $1 + 1 - 1 + 1 = 2 != 0$。#linebreak()在 $A_2$ 中，只有相邻两行与第 $1, 4$ 列符合条件，对应两组和分别为 $1 - 1 + 1 - 1 = 0$、$1 - 1 - 1 + 1 = 0$，故具有性质 $P$。],
    ),
    subquestion(
      stem: [当 $m = 4, n = 5$ 时，若数表 $A$ 具有性质 $P$，求 $A$ 中 $1$ 的个数的最大值；],
      answers: ([$12$],),
      explanation: [
        #step[给出上界][分别选取行对 $(1, 2)$、$(3, 4)$，与列对 $(1, 4)$、$(2, 5)$ 组合，共得到四组互不重叠的四个角。#linebreak()每组均有两个 $1$、两个 $-1$，故第 $1, 2, 4, 5$ 列中共有 $8$ 个 $1$。第 $3$ 列至多再有 $4$ 个 $1$，总数至多为 $12$。]
        #step[构造达到上界的数表][取
          $
            A = mat(1, -1, 1, -1, 1; -1, 1, 1, 1, -1; -1, 1, 1, 1, -1; 1, -1, 1, -1, 1).
          $
          符合条件的行距、列距仅可能为 $(1, 3)$、$(2, 4)$、$(3, 1)$。#linebreak()列距为 $3$ 时，每行相应两项互为相反数；列距为 $4$ 时，间隔两行的第 $1, 5$ 列取值互为相反数；行距为 $3$ 时，第 $1, 4$ 行各自的相邻两项之和均为 $0$。故所有符合条件的四角和均为 $0$。#linebreak()该表有 $12$ 个 $1$，因此最大值为 $12$。]
      ],
    ),
    subquestion(
      stem: [当 $m = n = 6$ 时，若数表 $A$ 具有性质 $P$，且 $a_(11) = 1$，证明：$a_(i j) = a_(i 1) a_(1 j)$（$i = 1, 2, dots, 6$；$j = 1, 2, dots, 6$）。],
      answers: ([证明见解析。],),
      explanation: [
        #step[建立四角传递规则][称满足 $a_(i j) = a_(i 1) a_(1 j)$ 的位置 $(i, j)$ 为已证位置。第 $1$ 行、第 $1$ 列均已证。#linebreak()在符合性质 $P$ 的任一矩形中，四角恰有两个 $1$、两个 $-1$，故四角乘积为 $1$。#linebreak()若其中三角已证，则第四角也已证。例如
          $
            a_(l q) = a_(k p) a_(k q) a_(l p) = (a_(k 1) a_(1 p))(a_(k 1) a_(1 q))(a_(l 1) a_(1 p)) = a_(l 1) a_(1 q).
          $
          其他缺角情形同理。
        ]
        #step[依次证明第 4、5、2 行和列][取行对 $(1, 4)$、列对 $(j, j + 1)$，从 $j = 1$ 递推至 $5$，可证第 $4$ 行全部位置。转置同理可证第 $4$ 列。#linebreak()取行对 $(1, 5)$、列对 $(j, j + 2)$：从已证的第 $1$ 列沿 $1, 3, 5$ 递推，从已证的第 $4$ 列向 $2, 6$ 传递，可证第 $5$ 行；转置同理得第 $5$ 列。#linebreak()再取行对 $(2, 5)$、列对 $(j, j + 1)$，由第 $2$ 行第 $1$ 项已证，依次证明第 $2$ 行；转置同理得第 $2$ 列。]
        #step[补齐剩余四个位置][此时只剩 $(3, 3)$、$(3, 6)$、$(6, 3)$、$(6, 6)$。#linebreak()取行对 $(1, 3)$、列对 $(2, 6)$，可证 $(3, 6)$；转置得 $(6, 3)$。#linebreak()取行对 $(3, 4)$、列对 $(3, 6)$，可证 $(3, 3)$。#linebreak()取行对 $(5, 6)$、列对 $(3, 6)$，可证 $(6, 6)$。#linebreak()以上矩形的行距与列距之差的绝对值均为 $2$，传递规则均适用，故所有位置均满足所证等式。]
      ],
    ),
  ),
)
