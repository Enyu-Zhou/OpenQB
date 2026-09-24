#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2025,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2025/2025全国2(辽宁,重庆,海南,吉林,黑龙江,山西,云南,广西,甘肃,贵州,新疆,四川,内蒙古,陕西,青海,宁夏,西藏).pdf",
  regions: (
    "辽宁",
    "重庆",
    "海南",
    "吉林",
    "黑龙江",
    "山西",
    "云南",
    "广西",
    "甘肃",
    "贵州",
    "新疆",
    "四川",
    "内蒙古",
    "陕西",
    "青海",
    "宁夏",
    "西藏",
  ),
)

#let fold-figure() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  let e = (0, 0, 0)
  let f = (0, 1, 0)
  let a = (-1, 0, 0)
  let d = (-1, 1, 0)
  let b = (2, 0, 0)
  let c = (1, 1, 0)
  let ap = (0.5, 0, calc.sqrt(3) / 2)
  let dp = (0.5, 1, calc.sqrt(3) / 2)
  oblique-project((1, 0), (0.5, 0.4), (0, 1.5), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(e, b, c)
    line(e, ap, dp, b, ap)
    line(a, e, stroke: (dash: figure-style.dash))
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(e, f, dp, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north"),
      (b, $B$, "north"),
      (c, $C$, "north-east"),
      (d, $D$, "south-east"),
      (e, $E$, "north"),
      (f, $F$, "north-west"),
      (ap, $A'$, "east"),
      (dp, $D'$, "south"),
    ) { content(p, label, anchor: anchor, padding: 0.12) }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [样本数据 $2, 8, 14, 16, 20$ 的平均数为#choice-placeholder()。],
  choices: ([$8$], [$9$], [$12$], [$18$]),
  answers: ([C],),
  explanation: [平均数为 $(2 + 8 + 14 + 16 + 20)/5 = 12$，故选 C。],
)
#question(
  "single-choice",
  stem: [已知 $z = 1 + i$，则 $1/(z - 1) =$#choice-placeholder()。],
  choices: ([$-i$], [$i$], [$-1$], [$1$]),
  answers: ([A],),
  explanation: [$1/(z - 1) = 1/i = -i$，故选 A。],
)
#question(
  "single-choice",
  stem: [已知集合 $A = {-4, 0, 1, 2, 8}$，$B = {x | x^3 = x}$，则 $A inter B =$#choice-placeholder()。],
  choices: ([${0, 1, 2}$], [${1, 2, 8}$], [${2, 8}$], [${0, 1}$]),
  answers: ([D],),
  explanation: [$x^3 = x$ 等价于 $x(x - 1)(x + 1) = 0$，故 $B = {-1, 0, 1}$，$A inter B = {0, 1}$，选 D。],
)
#question(
  "single-choice",
  stem: [不等式 $(x - 4)/(x - 1) >= 2$ 的解集是#choice-placeholder()。],
  choices: (
    [${x | -2 <= x <= 1}$],
    [${x | x <= -2}$],
    [${x | -2 <= x < 1}$],
    [${x | x > 1}$],
  ),
  answers: ([C],),
  explanation: [移项得 $(-x - 2)/(x - 1) >= 0$，即 $(x + 2)/(x - 1) <= 0$。#linebreak()结合 $x != 1$，解得 $-2 <= x < 1$，故选 C。],
)
#question(
  "single-choice",
  stem: [在 $triangle A B C$ 中，$B C = 2$，$A C = 1 + sqrt(3)$，$A B = sqrt(6)$，则 $A =$#choice-placeholder()。],
  choices: ([$45 degree$], [$60 degree$], [$120 degree$], [$135 degree$]),
  answers: ([A],),
  explanation: [由余弦定理，
    $ cos A = ((1 + sqrt(3))^2 + 6 - 4)/(2(1 + sqrt(3))sqrt(6)) = sqrt(2)/2. $
    因 $0 < A < pi$，得 $A = 45 degree$，选 A。],
)
#question(
  "single-choice",
  stem: [设抛物线 $C: y^2 = 2p x$（$p > 0$）的焦点为 $F$，点 $A$ 在 $C$ 上，过 $A$ 作 $C$ 的准线的垂线，垂足为 $B$。若直线 $B F$ 的方程为 $y = -2x + 2$，则 $abs(A F) =$#choice-placeholder()。],
  choices: ([$3$], [$4$], [$5$], [$6$]),
  answers: ([C],),
  explanation: [焦点在 $x$ 轴上，代入直线方程得 $F(1, 0)$，所以 $p = 2$，准线为 $x = -1$。#linebreak()于是 $B(-1, 4)$，$A$ 的纵坐标为 $4$。由 $y^2 = 4x$，得 $A(4, 4)$。#linebreak()由抛物线定义，$abs(A F) = abs(A B) = 5$，故选 C。],
)
#question(
  "single-choice",
  stem: [记 $S_n$ 为等差数列 $\{a_n\}$ 的前 $n$ 项和。若 $S_3 = 6$，$S_5 = -5$，则 $S_6 =$#choice-placeholder()。],
  choices: ([$-20$], [$-15$], [$-10$], [$-5$]),
  answers: ([B],),
  explanation: [由 $S_3 = 3a_2$、$S_5 = 5a_3$，得 $a_2 = 2$、$a_3 = -1$，故公差 $d = -3$、$a_1 = 5$。#linebreak()所以 $S_6 = 6 times 5 + (6 times 5)/2 times (-3) = -15$，选 B。],
)
#question(
  "single-choice",
  stem: [已知 $0 < alpha < pi$，$cos(alpha/2) = sqrt(5)/5$，则 $sin(alpha - pi/4) =$#choice-placeholder()。],
  choices: (
    [$sqrt(2)/10$],
    [$sqrt(2)/5$],
    [$(3 sqrt(2))/10$],
    [$(7 sqrt(2))/10$],
  ),
  answers: ([D],),
  explanation: [由 $0 < alpha/2 < pi/2$，得 $sin(alpha/2) = (2 sqrt(5))/5$，所以 $sin alpha = 4/5$、$cos alpha = -3/5$。#linebreak()于是 $sin(alpha - pi/4) = (sin alpha - cos alpha)/sqrt(2) = (7 sqrt(2))/10$，选 D。],
)

#section[选择题：本题共 3 小题，每小题 6 分，共 18 分。在每小题给出的选项中，有多项符合题目要求。全部选对的得 6 分，部分选对的得部分分，有选错的得 0 分。]
#question(
  "multiple-choice",
  stem: [记 $S_n$ 为等比数列 $\{a_n\}$ 的前 $n$ 项和，$q$ 为 $\{a_n\}$ 的公比，$q > 0$。若 $S_3 = 7$，$a_3 = 1$，则#choice-placeholder()。],
  choices: ([$q = 1/2$], [$a_5 = 1/9$], [$S_5 = 8$], [$a_n + S_n = 8$]),
  answers: ([AD],),
  explanation: [由 $a_3 = 1$，得 $a_1 = 1/q^2$、$a_2 = 1/q$，所以 $1/q^2 + 1/q + 1 = 7$，即 $6q^2 - q - 1 = 0$。#linebreak()由 $q > 0$，得 $q = 1/2$，A 正确。此时 $a_n = 4(1/2)^(n - 1)$，$S_n = 8(1 - (1/2)^n)$。#linebreak()故 $a_5 = 1/4$、$S_5 = 31/4$，B、C 错误；$a_n + S_n = 8$，D 正确。故选 AD。],
)
#question(
  "multiple-choice",
  stem: [已知 $f(x)$ 是定义在 $RR$ 上的奇函数，且当 $x > 0$ 时，$f(x) = (x^2 - 3)e^x + 2$，则#choice-placeholder()。],
  choices: (
    [$f(0) = 0$],
    [当 $x < 0$ 时，$f(x) = -(x^2 - 3)e^(-x) - 2$],
    [$f(x) >= 2$ 当且仅当 $x >= sqrt(3)$],
    [$x = -1$ 是 $f(x)$ 的极大值点],
  ),
  answers: ([ABD],),
  explanation: [
    #step[选项 A、B][奇函数在原点有定义，故 $f(0) = 0$，A 正确。#linebreak()当 $x < 0$ 时，$-x > 0$，所以 $f(x) = -f(-x) = -(x^2 - 3)e^(-x) - 2$，B 正确。]
    #step[选项 C、D][当 $x > 0$ 时，$f'(x) = (x - 1)(x + 3)e^x$，在 $(0, 1)$ 上为负、$(1, +infinity)$ 上为正，故 $x = 1$ 是极小值点。#linebreak()由奇性，$x = -1$ 是极大值点，D 正确；且 $f(-1) = 2e - 2 > 2$，但 $-1 < sqrt(3)$，C 错误。故选 ABD。]
  ],
)
#question(
  "multiple-choice",
  stem: [双曲线 $C: x^2/a^2 - y^2/b^2 = 1$（$a > 0, b > 0$）的左、右焦点分别为 $F_1, F_2$，左、右顶点分别为 $A_1, A_2$，以 $F_1 F_2$ 为直径的圆与 $C$ 的一条渐近线交于 $M, N$ 两点，且 $angle N A_1 M = (5pi)/6$，则#choice-placeholder()。],
  choices: (
    [$angle A_1 M A_2 = pi/6$],
    [$abs(M A_1) = 2 abs(M A_2)$],
    [$C$ 的离心率为 $sqrt(13)$],
    [当 $a = sqrt(2)$ 时，四边形 $N A_1 M A_2$ 的面积为 $8 sqrt(3)$],
  ),
  answers: ([ACD],),
  explanation: [
    #step[确定边长关系][由对称性，不妨取 $M(a, b)$、$N(-a, -b)$；若交换 $M, N$，以下 A、C、D 的结论不变，而 B 仍不成立。#linebreak()此时 $arrow(A_1 N) = (0, -b)$、$arrow(A_1 M) = (2a, b)$，所以
      $ -b/sqrt(4a^2 + b^2) = cos((5pi)/6) = -sqrt(3)/2. $
      因此 $b^2 = 12a^2$，$b = 2 sqrt(3)a$，$e = sqrt(1 + b^2/a^2) = sqrt(13)$。
    ]
    #step[判断各选项][$M A_2$ 竖直，而 $cos angle A_1 M A_2 = b/sqrt(4a^2 + b^2) = sqrt(3)/2$，故 A 正确。#linebreak()$abs(M A_1) = 4a$、$abs(M A_2) = 2 sqrt(3)a$，不满足 B 的倍数关系。#linebreak()C 正确；四边形的面积为 $2a b = 4 sqrt(3)a^2$，当 $a = sqrt(2)$ 时为 $8 sqrt(3)$，D 正确。故选 ACD。]
  ],
)

#section[填空题：本题共 3 小题，每小题 5 分，共 15 分。]
#question(
  "fill-in",
  stem: [已知平面向量 $bold(a) = (x, 1)$，$bold(b) = (x - 1, 2x)$，若 $bold(a) perp (bold(a) - bold(b))$，则 $abs(bold(a)) =$#fill-placeholder()。],
  answers: ([$sqrt(2)$],),
  explanation: [$bold(a) - bold(b) = (1, 1 - 2x)$，垂直条件给出 $x + 1 - 2x = 0$，故 $x = 1$，$abs(bold(a)) = sqrt(2)$。],
)
#question(
  "fill-in",
  stem: [若 $x = 2$ 是函数 $f(x) = (x - 1)(x - 2)(x - a)$ 的极值点，则 $f(0) =$#fill-placeholder()。],
  answers: ([$-4$],),
  explanation: [必要条件 $f'(2) = 0$ 给出 $2 - a = 0$，故 $a = 2$。#linebreak()此时 $f(x) = (x - 1)(x - 2)^2$，$f'(x) = (x - 2)(3x - 4)$ 在 $2$ 两侧由负变正，确为极值点。#linebreak()所以 $f(0) = -4$。],
)
#question(
  "fill-in",
  stem: [一个底面半径为 $4$ cm，高为 $9$ cm 的封闭圆柱形容器（容器壁厚度忽略不计）内有两个半径相等的铁球，则铁球半径的最大值为#fill-placeholder()cm。],
  answers: ([$5/2$],),
  explanation: [设铁球半径为 $r$，则 $0 < r <= 4$。两球心在水平方向的距离至多为 $2(4 - r)$，竖直方向的距离至多为 $9 - 2r$。#linebreak()两球不重叠要求球心距离至少为 $2r$，故
    $ (2r)^2 <= (8 - 2r)^2 + (9 - 2r)^2, $
    即 $(2r - 5)(2r - 29) >= 0$。结合 $r <= 4$，得 $r <= 5/2$。#linebreak()取 $r = 5/2$，使两球分别贴住上下底面，且球心水平投影位于半径 $4 - r = 3/2$ 的圆的直径两端。此时球心水平距离为 $3$、竖直距离为 $4$，球心距离为 $5 = 2r$，可以放入。故最大值为 $5/2$。],
)

#section[解答题：本题共 5 小题，共 77 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  stem: [已知函数 $f(x) = cos(2x + phi)$（$0 <= phi < pi$），$f(0) = 1/2$。],
  parts: (
    subquestion(
      stem: [求 $phi$；],
      answers: ([$pi/3$],),
      explanation: [$cos phi = 1/2$，结合 $0 <= phi < pi$，得 $phi = pi/3$。],
    ),
    subquestion(
      stem: [设函数 $g(x) = f(x) + f(x - pi/6)$，求 $g(x)$ 的值域和单调区间。],
      answers: (
        [值域为 $[-sqrt(3), sqrt(3)]$；递增区间为 $[k pi - (7pi)/12, k pi - pi/12]$，递减区间为 $[k pi - pi/12, k pi + (5pi)/12]$（$k in ZZ$）。],
      ),
      explanation: [由和差化积，
        $ g(x) = cos(2x + pi/3) + cos 2x = sqrt(3) cos(2x + pi/6). $
        故值域为 $[-sqrt(3), sqrt(3)]$。#linebreak()令 $2k pi - pi <= 2x + pi/6 <= 2k pi$，得递增区间 $[k pi - (7pi)/12, k pi - pi/12]$。#linebreak()令 $2k pi <= 2x + pi/6 <= 2k pi + pi$，得递减区间 $[k pi - pi/12, k pi + (5pi)/12]$，其中 $k in ZZ$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $C: x^2/a^2 + y^2/b^2 = 1$（$a > b > 0$）的离心率为 $sqrt(2)/2$，长轴长为 $4$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程；],
      answers: ([$x^2/4 + y^2/2 = 1$],),
      explanation: [$2a = 4$，故 $a = 2$；$c/a = sqrt(2)/2$，故 $c = sqrt(2)$，$b^2 = a^2 - c^2 = 2$。#linebreak()所以 $C$ 的方程为 $x^2/4 + y^2/2 = 1$。],
    ),
    subquestion(
      stem: [过点 $(0, -2)$ 的直线 $l$ 与 $C$ 交于 $A, B$ 两点，$O$ 为坐标原点。若 $triangle O A B$ 的面积为 $sqrt(2)$，求 $abs(A B)$。],
      answers: ([$sqrt(5)$],),
      explanation: [直线 $x = 0$ 对应面积为 $0$，故可设 $l: y = k x - 2$。联立椭圆，得
        $ (1 + 2k^2)x^2 - 8k x + 4 = 0. $
        判别式为 $16(2k^2 - 1) > 0$，因此
        $ abs(x_A - x_B) = (4 sqrt(2k^2 - 1))/(1 + 2k^2). $
        又 $S_(triangle O A B) = 1/2 abs(x_A y_B - x_B y_A) = abs(x_A - x_B) = sqrt(2)$。#linebreak()两边平方化简得 $(2k^2 - 3)^2 = 0$，所以 $k^2 = 3/2$。#linebreak()于是 $abs(A B) = sqrt(1 + k^2) abs(x_A - x_B) = sqrt(5)$。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在四边形 $A B C D$ 中，$A B parallel C D$，$angle D A B = 90 degree$，$F$ 为 $C D$ 的中点，点 $E$ 在 $A B$ 上，$E F parallel A D$，$A B = 3A D$，$C D = 2A D$。将四边形 $E F D A$ 沿 $E F$ 翻折至四边形 $E F D' A'$，使得面 $E F D' A'$ 与面 $E F C B$ 所成的二面角为 $60 degree$。
    #figure(fold-figure())
  ],
  parts: (
    subquestion(
      stem: [证明：$A' B parallel$ 平面 $C D' F$；],
      answers: ([证明见解析。],),
      explanation: [由题设，$E F D A$ 为矩形，翻折后仍有 $A' D' parallel E F$，且 $A' D' = E F$。又 $A' B$ 所在平面 $A' B E$ 与平面 $D' C F$ 分别由平行的两组直线确定：$E A' parallel F D'$、$E B parallel F C$。#linebreak()两平面互相平行，且 $A' B$ 在前一平面内，故 $A' B parallel$ 平面 $C D' F$。],
    ),
    subquestion(
      stem: [求面 $B C D'$ 与面 $E F D' A'$ 所成的二面角的正弦值。],
      answers: ([$sqrt(42)/7$],),
      explanation: [
        #step[建立坐标系][长度统一除以 $A D$，不影响角度。取 $E$ 为原点，$E B, E F$ 为 $x, y$ 轴正方向，原底面向上为 $z$ 轴正方向。由二面角为 $60 degree$，可取
          $ E(0, 0, 0), quad F(0, 1, 0), quad B(2, 0, 0), quad C(1, 1, 0), $
          $ A'(1/2, 0, sqrt(3)/2), quad D'(1/2, 1, sqrt(3)/2). $
        ]
        #step[计算法向量][平面 $B C D'$ 的法向量可取 $bold(n) = (sqrt(3), sqrt(3), 1)$；平面 $E F D' A'$ 的法向量可取 $bold(m) = (sqrt(3), 0, -1)$。#linebreak()两法向量夹角余弦的绝对值为
          $
            abs(bold(n) dot bold(m))/(abs(bold(n)) abs(bold(m))) = 2/(sqrt(7) times 2) = 1/sqrt(7).
          $
          因此所求二面角的正弦值为 $sqrt(1 - 1/7) = sqrt(42)/7$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知函数 $f(x) = ln(1 + x) - x + 1/2 x^2 - k x^3$，其中 $0 < k < 1/3$。],
  parts: (
    subquestion(
      stem: [证明：$f(x)$ 在区间 $(0, +infinity)$ 存在唯一的极值点和唯一的零点；],
      answers: ([极值点为 $x_1 = 1/(3k) - 1$，唯一正零点位于 $x_1$ 右侧。],),
      explanation: [有
        $ f'(x) = 1/(1 + x) - 1 + x - 3k x^2 = x^2(1/(1 + x) - 3k). $
        记 $x_1 = 1/(3k) - 1 > 0$，则 $f$ 在 $(0, x_1)$ 上严格递增，在 $(x_1, +infinity)$ 上严格递减，故 $x_1$ 是唯一极值点。#linebreak()又 $f(0) = 0$，所以 $f(x_1) > 0$。由 $ln(1 + x) <= x$，有 $f(x) <= x^2/2 - k x^3$，当 $x > 1/(2k)$ 时为负。#linebreak()由连续性和上述单调性，存在唯一正零点 $x_2$，且 $x_2 > x_1$。],
    ),
    subquestion(
      stem: [设 $x_1, x_2$ 分别为 $f(x)$ 在区间 $(0, +infinity)$ 的极值点和零点。],
      parts: (
        subquestion(
          stem: [设函数 $g(t) = f(x_1 + t) - f(x_1 - t)$。证明：$g(t)$ 在区间 $(0, x_1)$ 单调递减；],
          answers: ([证明见解析。],),
          explanation: [记 $a = x_1$，则 $3k = 1/(1 + a)$，从而
            $
              g'(t) = f'(a + t) + f'(a - t) = t/(1 + a)((a - t)^2/(1 + a - t) - (a + t)^2/(1 + a + t)).
            $
            函数 $h(x) = x^2/(1 + x)$ 在 $x > 0$ 时满足 $h'(x) = x(x + 2)/(1 + x)^2 > 0$。#linebreak()因 $0 < a - t < a + t$，上式括号内为负，故 $g'(t) < 0$，结论成立。],
        ),
        subquestion(
          stem: [比较 $2x_1$ 与 $x_2$ 的大小，并证明你的结论。],
          answers: ([$x_2 < 2x_1$],),
          explanation: [$g(0) = 0$，由上一问的严格递减性及端点连续性，$g(x_1) < 0$。#linebreak()所以 $f(2x_1) = g(x_1) + f(0) < 0$。又 $f(x_1) > 0$，且 $f$ 在 $(x_1, +infinity)$ 上严格递减，故其唯一零点满足 $x_1 < x_2 < 2x_1$。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  stem: [甲、乙两人进行乒乓球练习，每个球胜者得 $1$ 分，负者得 $0$ 分。设每个球甲胜的概率为 $p$（$1/2 < p < 1$），乙胜的概率为 $q$，$p + q = 1$，且各球的胜负相互独立。对正整数 $k >= 2$，记 $p_k$ 为打完 $k$ 个球后甲比乙至少多得 $2$ 分的概率，$q_k$ 为打完 $k$ 个球后乙比甲至少多得 $2$ 分的概率。],
  parts: (
    subquestion(
      stem: [求 $p_3, p_4$（用 $p$ 表示）；],
      answers: ([$p_3 = p^3$，$p_4 = 4p^3 - 3p^4$。],),
      explanation: [打完 $3$ 球至少领先 $2$ 分，只能 $3$ 球全胜，故 $p_3 = p^3$。#linebreak()打完 $4$ 球至少领先 $2$ 分，须胜 $3$ 或 $4$ 球，故 $p_4 = 4p^3(1 - p) + p^4 = 4p^3 - 3p^4$。],
    ),
    subquestion(
      stem: [若 $(p_4 - p_3)/(q_4 - q_3) = 4$，求 $p$；],
      answers: ([$2/3$],),
      explanation: [由第（1）问及对称性，$p_4 - p_3 = 3p^3 q$、$q_4 - q_3 = 3q^3 p$。#linebreak()故 $(p/q)^2 = 4$。因 $p, q > 0$，得 $p = 2q$，结合 $p + q = 1$，得 $p = 2/3$。],
    ),
    subquestion(
      stem: [证明：对任意正整数 $m$，$p_(2m + 1) - q_(2m + 1) < p_(2m) - q_(2m) < p_(2m + 2) - q_(2m + 2)$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[从偶数球到奇数球][记 $D_k = p_k - q_k$。打完 $2m$ 球时分差为偶数，再打一球，只有原本恰好领先或落后 $2$ 分的情形可能退出相应事件，平分时再打一球仍不足 $2$ 分。#linebreak()因此
          $ p_(2m + 1) - p_(2m) = -binom(2m, m + 1)p^(m + 1)q^m, $
          $ q_(2m + 1) - q_(2m) = -binom(2m, m - 1)p^m q^(m + 1). $
          利用两个组合数相等，得
          $ D_(2m + 1) - D_(2m) = -binom(2m, m - 1)(p - q)(p q)^m < 0. $
        ]
        #step[再打一球并比较相邻偶数球][打完 $2m + 1$ 球时分差为奇数，再打一球，原本分差绝对值至少为 $3$ 的仍保留，恰好领先或落后 $1$ 分的情形可能进入相应事件。故
          $ D_(2m + 2) - D_(2m + 1) = binom(2m + 1, m)(p - q)(p q)^m. $
          将两式相加，再由组合数恒等式，得
          $ D_(2m + 2) - D_(2m) = binom(2m, m)(p - q)(p q)^m > 0. $
          结合上一问的严格不等式，所证结论成立。
        ]
      ],
    ),
  ),
)
