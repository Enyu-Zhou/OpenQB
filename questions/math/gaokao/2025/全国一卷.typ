#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, space-axes, step, subquestion,
)

#show: exam.with(
  subject: "数学",
  year: 2025,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2025/2025全国1(山东,广东,湖南,湖北,河北,江苏,福建,浙江,河南,江西,安徽).pdf",
  regions: (
    "山东",
    "广东",
    "湖南",
    "湖北",
    "河北",
    "江苏",
    "福建",
    "浙江",
    "河南",
    "江西",
    "安徽",
  ),
)

#let wind-figure() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.25,
    shared-zero: $O$,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
      length: 0,
    ),
    grid: (
      stroke: (thickness: figure-style.thickness, dash: figure-style.dash),
    ),
  ))
  plot.plot(
    size: (3.5, 3.5),
    axis-style: "school-book",
    x-min: 0,
    x-max: 3.2,
    y-min: 0,
    y-max: 3.2,
    x-label: $x$,
    y-label: $y$,
    x-ticks: (1, 2, 3),
    y-ticks: (1, 2, 3),
    x-tick-step: none,
    y-tick-step: none,
    x-grid: true,
    y-grid: true,
    {
      plot.annotate(resize: false, {
        line((3, 3), (0, 2), mark: (end: ">"))
        line((2, 0), (3, 3), mark: (end: ">"))
        content((1.5, 3.3), [视风风速], anchor: "south", padding: 0.08)
        content((3.35, 1.5), [船速], anchor: "west", padding: 0.08)
      })
    },
  )
})

#let pyramid-figure(auxiliary: false) = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (calc.sqrt(2), 0, 0)
  let c = (calc.sqrt(2), 2, 0)
  let d = (0, 1 + calc.sqrt(3), 0)
  let p = (0, 0, calc.sqrt(2))
  let o = (0, 1, 0)
  oblique-project((-0.4, -0.4), (1, 0), (0, 1.35), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, b, c, d, p, c)
    line(p, a, b, stroke: (dash: figure-style.dash))
    line(a, d, stroke: (dash: figure-style.dash))
    line(a, c, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(p, o, stroke: (dash: figure-style.dash))
      space-axes((calc.sqrt(2), 1 + calc.sqrt(3), calc.sqrt(2)), (2.1, 3.4, 2))
      content(o, $O$, anchor: "south-west", padding: 0.1)
    }
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, if auxiliary { "south-east" } else { "north-east" }),
      (c, $C$, "north"),
      (d, $D$, if auxiliary { "south" } else { "west" }),
      (p, $P$, if auxiliary { "east" } else { "south" }),
    ) {
      content(point, label, anchor: anchor, padding: 0.1)
    }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [$(1 + 5i)i$ 的虚部为#choice-placeholder()。],
  choices: ([$-1$], [$0$], [$1$], [$6$]),
  answers: ([C],),
  explanation: [$(1 + 5i)i = -5 + i$，虚部为 $1$，故选 C。],
)
#question(
  "single-choice",
  stem: [已知集合 $U = {x | x$ 是小于 $9$ 的正整数$}$，$A = {1, 3, 5}$，则 $complement_U A$ 中元素个数为#choice-placeholder()。],
  choices: ([$0$], [$3$], [$5$], [$8$]),
  answers: ([C],),
  explanation: [$complement_U A = {2, 4, 6, 7, 8}$，共有 $5$ 个元素，故选 C。],
)
#question(
  "single-choice",
  stem: [已知双曲线 $C$ 的虚轴长是实轴长的 $sqrt(7)$ 倍，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$2$], [$sqrt(7)$], [$2 sqrt(2)$]),
  answers: ([D],),
  explanation: [由 $2b = sqrt(7) times 2a$，得 $b^2 = 7a^2$，所以 $e = sqrt(a^2 + b^2)/a = 2 sqrt(2)$，故选 D。],
)
#question(
  "single-choice",
  stem: [已知点 $(a, 0)$（$a > 0$）是函数 $y = 2 tan(x - pi/3)$ 的图象的一个对称中心，则 $a$ 的最小值为#choice-placeholder()。],
  choices: ([$pi/6$], [$pi/3$], [$pi/2$], [$(4pi)/3$]),
  answers: ([B],),
  explanation: [对称中心满足 $a - pi/3 = k pi$（$k in ZZ$），故最小正值为 $pi/3$，选 B。],
)
#question(
  "single-choice",
  stem: [已知 $f(x)$ 是定义在 $RR$ 上且周期为 $2$ 的偶函数，当 $2 <= x <= 3$ 时，$f(x) = 5 - 2x$，则#box[$f(-3/4) =$#choice-placeholder()]。],
  choices: ([$-1/2$], [$-1/4$], [$1/4$], [$1/2$]),
  answers: ([A],),
  explanation: [由偶性和周期性，$f(-3/4) = f(3/4) = f(11/4) = 5 - 2 times 11/4 = -1/2$，故选 A。],
)
#question(
  "single-choice",
  stem: [帆船比赛中，运动员可借助风力计测定风速的大小与方向，测出的结果在航海学中称为视风风速。视风风速对应的向量是真风风速对应的向量与船行风风速对应的向量之和，其中船行风风速对应的向量与船速对应的向量大小相等、方向相反。图 1 给出了部分风力等级、名称与风速大小的对应关系。已知某帆船运动员在某时刻测得的视风风速对应的向量与船速对应的向量如图 2 所示（线段长度代表速度大小，单位：m/s），则该时刻的真风为#choice-placeholder()。
    #figure(grid(
      columns: (auto, auto),
      column-gutter: 2em,
      align: center + horizon,
      [#table(
          columns: 3,
          align: center,
          [级数], [名称], [风速大小（单位：m/s）],
          [2], [轻风], [1.6～3.3],
          [3], [微风], [3.4～5.4],
          [4], [和风], [5.5～7.9],
          [5], [劲风], [8.0～10.7],
        )
        #align(center)[图 1]],
      [#wind-figure()#align(center)[图 2]],
    ))
  ],
  choices: ([轻风], [微风], [和风], [劲风]),
  answers: ([A],),
  explanation: [图中视风风速向量为 $(-3, -1)$，船速向量为 $(1, 3)$。#linebreak()由题意，真风风速向量等于视风风速向量与船速向量之和，即 $(-2, 2)$。#linebreak()其大小为 $sqrt((-2)^2 + 2^2) = 2 sqrt(2) approx 2.83$，在 $1.6$～$3.3$ 之间，为轻风，故选 A。],
)
#question(
  "single-choice",
  stem: [已知圆 $x^2 + (y + 2)^2 = r^2$（$r > 0$）上到直线 $y = sqrt(3)x + 2$ 的距离为 $1$ 的点有且仅有 $2$ 个，则 $r$ 的取值范围是#choice-placeholder()。],
  choices: ([$(0, 1)$], [$(1, 3)$], [$(3, +infinity)$], [$(0, +infinity)$]),
  answers: ([B],),
  explanation: [圆心 $(0, -2)$ 到已知直线的距离为 $2$。到该直线距离为 $1$ 的点组成两条平行线，它们到圆心的距离分别为 $1$、$3$。#linebreak()当 $r = 1$ 时有 $1$ 个交点；$1 < r < 3$ 时有 $2$ 个；$r = 3$ 时有 $3$ 个；$r > 3$ 时有 $4$ 个。#linebreak()故所求范围为 $(1, 3)$，选 B。],
)
#question(
  "single-choice",
  stem: [已知 $2 + log_2 x = 3 + log_3 y = 5 + log_5 z$，则 $x, y, z$ 的大小关系不可能为#choice-placeholder()。],
  choices: ([$x > y > z$], [$x > z > y$], [$y > x > z$], [$y > z > x$]),
  answers: ([B],),
  explanation: [设公共值为 $t$，则 $x = 2^(t - 2)$、$y = 3^(t - 3)$、$z = 5^(t - 5)$。#linebreak()取 $t = 2$，有 $x = 1 > y = 1/3 > z = 1/125$，A 可成立；取 $t = 5$，有 $y = 9 > x = 8 > z = 1$，C 可成立；取 $t = 8$，有 $y = 243 > z = 125 > x = 64$，D 可成立。#linebreak()再看 B：若 $x > y$，由 $x/y = (3/2)^3 (2/3)^t times 2$ 随 $t$ 递减且 $t = 5$ 时 $x < y$，知 $t < 5$。此时 $y/z = 3^(t - 3)/5^(t - 5)$ 随 $t$ 递减，故 $y/z > 9$，不可能 $z > y$。因此选 B。],
)

#section[选择题：本题共 3 小题，每小题 6 分，共 18 分。在每小题给出的选项中，有多项符合题目要求。全部选对的得 6 分，部分选对的得部分分，有选错的得 0 分。]
#question(
  "multiple-choice",
  stem: [在正三棱柱 $A B C - A_1 B_1 C_1$ 中，$D$ 为 $B C$ 的中点，则#choice-placeholder()。],
  choices: (
    [$A D perp A_1 C$],
    [$B_1 C_1 perp$ 平面 $A A_1 D$],
    [$A D parallel A_1 B_1$],
    [$C C_1 parallel$ 平面 $A A_1 D$],
  ),
  answers: ([BD],),
  explanation: [
    #step[选项 A、C][设 $D(0, 0, 0)$、$B(-1, 0, 0)$、$C(1, 0, 0)$、$A(0, sqrt(3), 0)$，棱柱高为 $h > 0$。#linebreak()则 $arrow(A D) = (0, -sqrt(3), 0)$、$arrow(A_1 C) = (1, -sqrt(3), -h)$，数量积为 $3 != 0$，A 错误。#linebreak()又 $arrow(A_1 B_1) = (-1, -sqrt(3), 0)$ 与 $arrow(A D)$ 不共线，C 错误。]
    #step[选项 B、D][平面 $A A_1 D$ 为 $x = 0$，$B_1 C_1$ 的方向向量为 $(2, 0, 0)$，故 B 正确。#linebreak()$C C_1$ 平行于平面内的 $A A_1$，且不在该平面内，故 D 正确。]
  ],
)
#question(
  "multiple-choice",
  stem: [已知抛物线 $C: y^2 = 6x$ 的焦点为 $F$，过 $F$ 的一条直线交 $C$ 于 $A, B$ 两点，过 $A$ 作直线 $l: x = -3/2$ 的垂线，垂足为 $D$，过 $F$ 且与直线 $A B$ 垂直的直线交 $l$ 于点 $E$，则#choice-placeholder()。],
  choices: (
    [$abs(A D) = abs(A F)$],
    [$abs(A E) = abs(A B)$],
    [$abs(A B) >= 6$],
    [$abs(A E) dot abs(B E) >= 18$],
  ),
  answers: ([ACD],),
  explanation: [
    #step[选项 A][$l$ 是抛物线的准线，由定义，$abs(A D) = abs(A F)$，A 正确。]
    #step[建立统一坐标表示][焦点为 $F(3/2, 0)$，水平线只与抛物线交于一点，故可设直线 $A B: x = t y + 3/2$。#linebreak()联立得 $y^2 - 6t y - 9 = 0$，记两根为 $y_1, y_2$，则 $y_1 + y_2 = 6t$、$y_1 y_2 = -9$。#linebreak()由 $E F perp A B$，得 $E(-3/2, 3t)$，于是
      $
        arrow(E A) dot arrow(E B) = (t y_1 + 3)(t y_2 + 3) + (y_1 - 3t)(y_2 - 3t) = 0.
      $
      因此 $triangle A E B$ 在 $E$ 处为直角。
    ]
    #step[选项 B、C、D][$A B$ 为斜边，故 $abs(A E) < abs(A B)$，B 错误。#linebreak()由抛物线定义和根的和，
      $ abs(A B) = x_A + x_B + 3 = t(y_1 + y_2) + 6 = 6(1 + t^2) >= 6, $
      C 正确。#linebreak()又 $abs(E F) = 3 sqrt(1 + t^2)$，在直角三角形中用两种方式计算面积，得
      $ abs(A E) abs(B E) = abs(A B) abs(E F) = 18(1 + t^2)^(3/2) >= 18, $
      D 正确，故选 ACD。
    ]
  ],
)
#question(
  "multiple-choice",
  stem: [已知 $triangle A B C$ 的面积为 $1/4$，$cos 2A + cos 2B + 2 sin C = 2$，$cos A cos B sin C = 1/4$，则#choice-placeholder()。],
  choices: (
    [$sin C = sin^2 A + sin^2 B$],
    [$A B = sqrt(2)$],
    [$sin A + sin B = sqrt(6)/2$],
    [$A C^2 + B C^2 = 3$],
  ),
  answers: ([ABC],),
  explanation: [
    #step[确定三角形的角][由二倍角公式，第一条件等价于 $sin C = sin^2 A + sin^2 B$，A 正确。#linebreak()又 $cos A cos B > 0$，故 $A, B$ 均为锐角，$cos(A - B) > 0$。利用 $A + B = pi - C$，得
      $ sin C = 1 + cos C cos(A - B). $
      若 $C < pi/2$，右侧大于 $1$，矛盾；若 $C > pi/2$，两边减 $1$ 并除以 $cos C$，得
      $ cos(A - B) = (sin C - 1)/cos C = -cos C/(1 + sin C). $
      但 $abs(A - B) < A + B = pi - C < pi/2$，所以 $cos(A - B) > -cos C$，仍矛盾。#linebreak()故 $C = pi/2$，由第二条件，$sin A cos A = 1/4$，即 $sin 2A = 1/2$，所以 $\{A, B\} = \{pi/12, (5pi)/12\}$。
    ]
    #step[判断其余选项][记 $a = B C$、$b = A C$、$c = A B$。由面积，$a b = 1/2$；又 $sin A sin B = 1/4$，由正弦定理 $a b = c^2 sin A sin B$，得 $c^2 = 2$，B 正确。#linebreak()$(sin A + sin B)^2 = 1 + 2 sin A sin B = 3/2$，C 正确。#linebreak()$A C^2 + B C^2 = A B^2 = 2 != 3$，D 错误。故选 ABC。]
  ],
)

#section[填空题：本题共 3 小题，每小题 5 分，共 15 分。]
#question(
  "fill-in",
  stem: [若直线 $y = 2x + 5$ 是曲线 $y = e^x + x + a$ 的一条切线，则 $a =$#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [切点横坐标 $x_0$ 满足 $e^(x_0) + 1 = 2$，故 $x_0 = 0$。#linebreak()切点为 $(0, 5)$，代入曲线得 $1 + a = 5$，所以 $a = 4$。],
)
#question(
  "fill-in",
  stem: [若一个等比数列的各项均为正数，且前 $4$ 项的和等于 $4$，前 $8$ 项的和等于 $68$，则这个数列的公比等于#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [设公比为 $q > 0$，由 $S_8 = S_4 + q^4 S_4$，得 $68 = 4(1 + q^4)$，故 $q^4 = 16$，$q = 2$。],
)
#question(
  "fill-in",
  stem: [有 $5$ 个相同的球，分别标有数字 $1, 2, 3, 4, 5$，从中有放回地随机取 $3$ 次，每次取 $1$ 个球。记 $X$ 为这 $5$ 个球中至少被取出 $1$ 次的球的个数，则 $X$ 的数学期望 $E(X) =$#fill-placeholder()。],
  answers: ([$61/25$],),
  explanation: [$X$ 可取 $1, 2, 3$。共有 $5^3 = 125$ 种等可能的抽取结果。#linebreak()$X = 1$ 有 $5$ 种；$X = 2$ 有 $5 times 4 times 3 = 60$ 种；$X = 3$ 有 $5 times 4 times 3 = 60$ 种。#linebreak()故 $E(X) = (1 times 5 + 2 times 60 + 3 times 60)/125 = 61/25$。],
)

#section[解答题：本题共 5 小题，共 77 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  stem: [为研究某疾病与超声波检查结果的关系，从做过超声波检查的人群中随机调查了 $1000$ 人，得到如下列联表：
    #table(
      columns: 4,
      align: center,
      [组别／超声波检查结果], [正常], [不正常], [合计],
      [患该疾病], [20], [180], [200],
      [未患该疾病], [780], [20], [800],
      [合计], [800], [200], [1000],
    )
    附：$chi^2 = (n(a d - b c)^2)/((a + b)(c + d)(a + c)(b + d))$。
    #table(
      columns: 4,
      align: center,
      [$P(chi^2 >= k)$], [0.050], [0.010], [0.001],
      [$k$], [3.841], [6.635], [10.828],
    )
  ],
  parts: (
    subquestion(
      stem: [记超声波检查结果不正常者患该疾病的概率为 $p$，求 $p$ 的估计值；],
      answers: ([$0.9$],),
      explanation: [检查结果不正常的 $200$ 人中有 $180$ 人患病，故 $hat(p) = 180/200 = 0.9$。],
    ),
    subquestion(
      stem: [根据小概率值 $alpha = 0.001$ 的独立性检验，分析超声波检查结果是否与患该疾病有关。],
      answers: ([认为超声波检查结果与患该疾病有关。],),
      explanation: [零假设 $H_0$：超声波检查结果与患该疾病独立。由列联表，
        $
          chi^2 = (1000(20 times 20 - 180 times 780)^2)/(200 times 800 times 800 times 200) = 765.625 > 10.828.
        $
        因此在显著性水平 $0.001$ 下拒绝 $H_0$，认为超声波检查结果与患该疾病有关。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知数列 $\{a_n\}$ 中，$a_1 = 3$，$a_(n + 1)/n = a_n/(n + 1) + 1/(n(n + 1))$。],
  parts: (
    subquestion(
      stem: [证明：数列 $\{n a_n\}$ 是等差数列；],
      answers: ([首项为 $3$、公差为 $1$ 的等差数列。],),
      explanation: [递推式两边乘 $n(n + 1)$，得 $(n + 1)a_(n + 1) = n a_n + 1$。#linebreak()所以相邻两项之差为 $1$，且首项为 $a_1 = 3$，结论成立。],
    ),
    subquestion(
      stem: [给定正整数 $m$，设函数 $f(x) = a_1 x + a_2 x^2 + dots + a_m x^m$，求 $f'(-2)$。],
      answers: ([$(7 - (3m + 7)(-2)^m)/9$],),
      explanation: [由第（1）问，$n a_n = n + 2$，所以 $f'(x) = sum_(n = 1)^m (n + 2)x^(n - 1)$。#linebreak()记 $S = f'(-2) = 3 + 4(-2) + dots + (m + 2)(-2)^(m - 1)$，错位相减得
        $ 3S = 3 + sum_(j = 1)^(m - 1) (-2)^j - (m + 2)(-2)^m. $
        其中 $sum_(j = 1)^(m - 1) (-2)^j = ((-2)^m + 2)/(-3)$（$m = 1$ 时为空和，也成立）。#linebreak()化简得 $f'(-2) = (7 - (3m + 7)(-2)^m)/9$。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在四棱锥 $P - A B C D$ 中，$P A perp$ 底面 $A B C D$，$A B perp A D$，$B C parallel A D$。
    #figure(pyramid-figure())
  ],
  parts: (
    subquestion(
      stem: [证明：平面 $P A B perp$ 平面 $P A D$；],
      answers: ([证明见解析。],),
      explanation: [由 $P A perp$ 底面 $A B C D$，得 $A B perp P A$。又 $A B perp A D$、$P A inter A D = A$，故 $A B perp$ 平面 $P A D$。#linebreak()因 $A B$ 在平面 $P A B$ 内，所以平面 $P A B perp$ 平面 $P A D$。],
    ),
    subquestion(
      stem: [设 $P A = A B = sqrt(2)$，$B C = 2$，$A D = 1 + sqrt(3)$，且点 $P, B, C, D$ 均在球 $O$ 的球面上。],
      parts: (
        subquestion(
          stem: [证明：点 $O$ 在平面 $A B C D$ 内；],
          answers: ([证明见解析。],),
          explanation: [以 $A$ 为原点，$A B, A D, A P$ 的方向为三条坐标轴正方向，则
            $
              P(0, 0, sqrt(2)), quad B(sqrt(2), 0, 0), quad C(sqrt(2), 2, 0), quad D(0, 1 + sqrt(3), 0).
            $
            #figure(pyramid-figure(auxiliary: true))
            设球心 $O(u, v, w)$。由 $O B^2 = O C^2$，得 $v = 1$；由 $O P^2 = O B^2$，得 $w = u$。#linebreak()再由 $O B^2 = O D^2$，得
            $ 2 sqrt(2) u = 2 + 2(1 + sqrt(3))v - (1 + sqrt(3))^2 = 0. $
            所以 $u = w = 0$，球心为 $O(0, 1, 0)$，在底面内。],
        ),
        subquestion(
          stem: [求直线 $A C$ 与 $P O$ 所成角的余弦值。],
          answers: ([$sqrt(2)/3$],),
          explanation: [由上一问，$arrow(A C) = (sqrt(2), 2, 0)$、$arrow(P O) = (0, 1, -sqrt(2))$。#linebreak()所求余弦为 $abs(arrow(A C) dot arrow(P O))/(abs(arrow(A C)) abs(arrow(P O))) = 2/(sqrt(6) sqrt(3)) = sqrt(2)/3$。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $C: x^2/a^2 + y^2/b^2 = 1$（$a > b > 0$）的离心率为 $(2 sqrt(2))/3$，下顶点为 $A$，右顶点为 $B$，$abs(A B) = sqrt(10)$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程；],
      answers: ([$x^2/9 + y^2 = 1$],),
      explanation: [由 $c^2/a^2 = 8/9$、$c^2 = a^2 - b^2$，得 $b^2 = a^2/9$。#linebreak()又 $a^2 + b^2 = abs(A B)^2 = 10$，所以 $a^2 = 9$、$b^2 = 1$，椭圆为 $x^2/9 + y^2 = 1$，$A(0, -1)$。],
    ),
    subquestion(
      stem: [已知动点 $P$ 不在 $y$ 轴上，点 $R$ 在射线 $A P$ 上，且满足 $abs(A P) dot abs(A R) = 3$。],
      parts: (
        subquestion(
          stem: [设 $P(m, n)$，求 $R$ 的坐标（用 $m, n$ 表示）；],
          answers: (
            [$R((3m)/(m^2 + (n + 1)^2), (n + 2 - m^2 - n^2)/(m^2 + (n + 1)^2))$],
          ),
          explanation: [设 $d = m^2 + (n + 1)^2 > 0$，因两向量同向且长度乘积为 $3$，有 $arrow(A R) = 3/d arrow(A P)$。#linebreak()所以
            $
              R((3m)/d, -1 + (3(n + 1))/d) = R((3m)/d, (n + 2 - m^2 - n^2)/d).
            $],
        ),
        subquestion(
          stem: [设 $O$ 为坐标原点，$Q$ 是 $C$ 上的动点，直线 $O R$ 的斜率为直线 $O P$ 的斜率的 $3$ 倍，求 $abs(P Q)$ 的最大值。],
          answers: ([$3(sqrt(3) + sqrt(2))$],),
          explanation: [
            #step[求 $P$ 的轨迹][因 $m != 0$，由斜率关系，$(n + 2 - m^2 - n^2)/(3m) = (3n)/m$，整理得
              $ m^2 + (n + 4)^2 = 18. $
              因此 $P$ 在圆心为 $K(0, -4)$、半径为 $3 sqrt(2)$ 的圆上，去掉 $m = 0$ 的两点；上述变换可逆。
            ]
            #step[求距离的上界并验证可取][设 $Q(s, t)$，则 $s^2 = 9(1 - t^2)$，$-1 <= t <= 1$。于是
              $ abs(K Q)^2 = s^2 + (t + 4)^2 = 27 - 8(t - 1/2)^2 <= 27. $
              由三角不等式，$abs(P Q) <= abs(P K) + abs(K Q) <= 3 sqrt(2) + 3 sqrt(3)$。#linebreak()取 $Q((3 sqrt(3))/2, 1/2)$，再取圆上与 $Q$ 分居 $K$ 两侧、且 $P, K, Q$ 共线的点 $P$。此时 $P$ 横坐标非零，两处等号均成立。#linebreak()所以最大值为 $3(sqrt(3) + sqrt(2))$。
            ]
          ],
        ),
      ),
    ),
  ),
)
#question("solution", parts: (
  subquestion(
    stem: [求函数 $f(x) = 5 cos x - cos 5x$ 在区间 $[0, pi/4]$ 的最大值；],
    answers: ([$3 sqrt(3)$],),
    explanation: [有 $f'(x) = 5(sin 5x - sin x) = 10 cos 3x sin 2x$。#linebreak()在 $(0, pi/6)$ 上，$f'(x) > 0$；在 $(pi/6, pi/4)$ 上，$f'(x) < 0$。#linebreak()故最大值为 $f(pi/6) = 5 sqrt(3)/2 + sqrt(3)/2 = 3 sqrt(3)$。],
  ),
  subquestion(
    stem: [给定 $theta in (0, pi)$ 和 $a in RR$，证明：存在 $y in [a - theta, a + theta]$ 使得 $cos y <= cos theta$；],
    answers: ([证明见解析。],),
    explanation: [反设整个闭区间上的点均满足 $cos y > cos theta$。#linebreak()该不等式的解集为 $union_(k in ZZ) (2k pi - theta, 2k pi + theta)$，各开区间彼此分离。#linebreak()连续区间 $[a - theta, a + theta]$ 因而必须包含在其中一个开区间内，但其长度同为 $2theta$，闭区间不可能被等长开区间包含，矛盾。故结论成立。],
  ),
  subquestion(
    stem: [设 $b in RR$，若存在 $phi in RR$ 使得 $5 cos x - cos(5x + phi) <= b$ 对 $x in RR$ 恒成立，求 $b$ 的最小值。],
    answers: ([$3 sqrt(3)$],),
    explanation: [
      #step[对任意相位证明下界][在第（2）问中取 $a = phi$、$theta = (5pi)/6$，存在 $y in [phi - (5pi)/6, phi + (5pi)/6]$ 使 $cos y <= -sqrt(3)/2$。#linebreak()令 $x = (y - phi)/5$，则 $abs(x) <= pi/6$，从而
        $ 5 cos x - cos(5x + phi) >= (5 sqrt(3))/2 + sqrt(3)/2 = 3 sqrt(3). $
        因此任何可行的 $b$ 都满足 $b >= 3 sqrt(3)$。
      ]
      #step[证明下界可取][取 $phi = 0$。令 $t = cos x in [-1, 1]$，由五倍角公式，
        $ 5 cos x - cos 5x = 20t^3 - 16t^5 = g(t). $
        有 $g'(t) = 20t^2(3 - 4t^2)$。比较端点 $t = plus.minus 1$ 与驻点 $t = 0, plus.minus sqrt(3)/2$ 的函数值，最大值为 $g(sqrt(3)/2) = 3 sqrt(3)$。#linebreak()所以 $phi = 0$、$b = 3 sqrt(3)$ 满足要求，所求最小值为 $3 sqrt(3)$。
      ]
    ],
  ),
))
