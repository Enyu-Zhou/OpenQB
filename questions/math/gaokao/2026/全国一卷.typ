#import "/src/lib.typ": (
  choice-placeholder, exam, fill-placeholder, question, section,
)

#show: exam.with(
  subject: "数学",
  year: 2026,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2026/2026全国1(山东%2C广东%2C湖南%2C湖北%2C河北%2C江苏%2C福建%2C浙江%2C河南%2C江西%2C安徽).pdf",
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

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]

#question(
  "single-choice",
  answers: ([B],),
  stem: [样本数据 $6, 8, 4, 5, 12$ 的中位数为#choice-placeholder()],
  choices: ([$5$], [$6$], [$8$], [$9$]),
  explanation: [
    将数据从小到大排列为 $4, 5, 6, 8, 12$，中间的数为 $6$，故选 B。
  ],
)

#question(
  "single-choice",
  answers: ([A],),
  stem: [已知平面向量 $bold(a), bold(b)$ 不共线，且 $2 bold(a) + y bold(b) = x bold(a) - 3 bold(b)$，则#choice-placeholder()],
  choices: (
    [$x = 2, y = -3$],
    [$x = -2, y = 3$],
    [$x = 2, y = 3$],
    [$x = -2, y = -3$],
  ),
  explanation: [
    移项得 $(2 - x) bold(a) + (y + 3) bold(b) = bold(0)$。#linebreak()
    因为 $bold(a), bold(b)$ 不共线，所以 $2 - x = 0$，$y + 3 = 0$。#linebreak()
    即 $x = 2$，$y = -3$，故选 A。
  ],
)

#question(
  "single-choice",
  answers: ([C],),
  stem: [已知集合 $A = {sin (7 pi)/6, cos (5 pi)/3, tan (5 pi)/4}$，$B = {-sqrt(3)/2, -1/2, 1}$，则 $A inter B =$#choice-placeholder()],
  choices: (
    [${-sqrt(3)/2, -1/2}$],
    [${-sqrt(3)/2, 1}$],
    [${-1/2, 1}$],
    [${-sqrt(3)/2, -1/2, 1}$],
  ),
  explanation: [
    由 $sin (7 pi)/6 = -1/2$，$cos (5 pi)/3 = 1/2$，$tan (5 pi)/4 = 1$。#linebreak()
    得 $A = {-1/2, 1/2, 1}$，故 $A inter B = {-1/2, 1}$，选 C。
  ],
)

#question(
  "single-choice",
  answers: ([D],),
  stem: [曲线 $y = 5x + 8 ln x$ 在点 $(1, 5)$ 处的切线方程为#choice-placeholder()],
  choices: ([$y = 3x + 2$], [$y = 5x$], [$y = 8x - 3$], [$y = 13x - 8$]),
  explanation: [
    求导得 $y' = 5 + 8/x$，在 $x = 1$ 处的切线斜率为 $13$。#linebreak()
    切线方程为 $y - 5 = 13(x - 1)$，即 $y = 13x - 8$，故选 D。
  ],
)

#question(
  "single-choice",
  answers: ([D],),
  stem: [已知抛物线 $C_1: y^2 = 2p_1 x (p_1 > 0)$ 和 $C_2: x^2 = 2p_2 y (p_2 > 0)$ 均经过点 $(4, 8)$，则 $C_1$ 的焦点与 $C_2$ 的焦点之间的距离为#choice-placeholder()],
  choices: ([$12$], [$4 sqrt(5)$], [$6$], [$sqrt(65)/2$]),
  explanation: [
    代入点 $(4, 8)$，得 $64 = 8p_1$，$16 = 16p_2$，所以 $p_1 = 8$，$p_2 = 1$。#linebreak()
    两焦点分别为 $(4, 0)$、$(0, 1/2)$。#linebreak()
    距离为 $sqrt(4^2 + (1/2)^2) = sqrt(65)/2$，故选 D。
  ],
)

#question(
  "single-choice",
  answers: ([B],),
  stem: [已知函数 $f(x) = (x + 2)/(e^x + a)$ 的最大值为 $1$，则 $a =$#choice-placeholder()],
  choices: ([$1/2$], [$1$], [$3/2$], [$2$]),
  explanation: [
    由选项可知 $a > 0$。#linebreak()
    取 $a = 1$，由 $e^x >= 1 + x$，得 $x + 2 <= e^x + 1$。#linebreak()
    所以 $f(x) <= 1$，且 $x = 0$ 时等号成立，满足最大值为 $1$。#linebreak()
    由单选题答案唯一性，选 B。
  ],
)

#question(
  "single-choice",
  answers: ([B],),
  stem: [一百零八塔位于宁夏回族自治区青铜峡市，以其独特的建筑格局和深远的历史文化闻名遐迩。该塔群共有 $108$ 座塔，依山势自上而下排成 $12$ 行，将第 $i$ 行中塔的座数记为 $a_i (i = 1, 2, dots.c, 12)$，其中 $a_1 = 1$，$a_2 = a_3 = 3$，$a_4 = a_5 = 5$，且 $a_6, a_7, dots.c, a_12$ 是一个首项为 $7$，公差为 $2$ 的等差数列。将 $a_1, a_2, dots.c, a_12$ 分为 $6$ 组，每组 $2$ 个数，使得每组的 $2$ 个数之和可构成一个项数为 $6$ 且公差为 $d (d > 0)$ 的等差数列，则 $d =$#choice-placeholder()],
  choices: ([$2$], [$4$], [$6$], [$8$]),
  explanation: [
    设六组的和按递增顺序构成等差数列 $b_1, dots.c, b_6$。#linebreak()
    则 $6b_1 + 15d = 108$，即 $b_1 = 18 - 5d/2$。#linebreak()
    原数列各项均为正奇数，因此 $b_1$ 必须为正偶数。#linebreak()
    将选项中的 $d = 2, 4, 6, 8$ 代入，分别得到 $b_1 = 13, 8, 3, -2$，仅 $d = 4$ 符合。#linebreak()
    此时可分组为 $(a_1, a_6)$、$(a_2, a_7)$、$(a_4, a_8)$、$(a_3, a_11)$、$(a_5, a_12)$、$(a_9, a_10)$。#linebreak()
    各组之和依次为 $8, 12, 16, 20, 24, 28$，故选 B。
  ],
)

#question(
  "single-choice",
  answers: ([A],),
  stem: [设 $U = {(x_1, x_2, x_3) | x_i in {-2, -1, 1, 2}, i = 1, 2, 3}$ 为空间中的 $64$ 个点构成的集合，点 $P(1, 1, 1)$，记样本空间 $Omega = complement_U {P}$，从 $Omega$ 中随机取一个点，定义随机变量 $X$ 如下：对于 $Omega$ 中的每个点 $A(x_1, x_2, x_3)$，令 $X(A) = x_1 + x_2 + x_3$，则 $X$ 的数学期望为#choice-placeholder()],
  choices: ([$-1/21$], [$-1/63$], [$0$], [$1/7$]),
  explanation: [
    集合 $U$ 中的点关于原点成对出现，因此所有点的三个坐标之和为 $0$。#linebreak()
    去掉点 $P(1, 1, 1)$ 后，剩余 $63$ 个点的坐标总和为 $-3$。#linebreak()
    各点被取到的概率相同，所以 $E(X) = -3/63 = -1/21$，故选 A。
  ],
)

#section[选择题：本题共 3 小题，每小题 6 分，共 18 分。在每小题给出的四个选项中，有多项符合题目要求。全部选对的得 6 分，部分选对的得部分分，有选错的得 0 分。]

#question(
  "multiple-choice",
  stem: [设 $z = 3 + 2i$，则#choice-placeholder()],
  choices: (
    [$overline(z) = 3 - 2i$],
    [$abs(z) = 5$],
    [$z^2 = 5 + 12i$],
    [$(z + 3)/(z - i) in RR$],
  ),
  answers: ([ACD],),
  explanation: [
    A：$overline(z) = 3 - 2i$，正确。#linebreak()
    B：$abs(z) = sqrt(3^2 + 2^2) = sqrt(13) != 5$，错误。#linebreak()
    C：$z^2 = (3 + 2i)^2 = 9 + 12i - 4 = 5 + 12i$，正确。#linebreak()
    D：$(z + 3)/(z - i) = (6 + 2i)/(3 + i) = 2 in RR$，正确。故选 ACD。
  ],
)

#question(
  "multiple-choice",
  stem: [在空间中，$A$、$B$ 为两个定点，动点 $C$ 到直线 $A B$ 的距离为 $2$，动点 $D$ 到直线 $A B$ 的距离为 $1$。若二面角 $C - A B - D$ 为 $60 degree$，则#choice-placeholder()],
  choices: (
    [$angle C A D >= 60 degree$],
    [$C D >= sqrt(3)$],
    [当 $A B perp C D$ 时，$C D perp$ 平面 $A B D$],
    [当 $A B perp$ 平面 $A C D$ 时，$A C perp A D$],
  ),
  answers: ([BC],),
  explanation: [
    以 $A$ 为原点、直线 $A B$ 为 $z$ 轴建立空间直角坐标系，可设 $C(2, 0, u)$，$D(1/2, sqrt(3)/2, v)$。#linebreak()
    A：取 $u = v = 2$，则 $cos angle C A D = 5/sqrt(40) > 1/2$，所以 $angle C A D < 60 degree$，错误。#linebreak()
    B：$C D^2 = (2 - 1/2)^2 + (sqrt(3)/2)^2 + (u - v)^2 = 3 + (u - v)^2 >= 3$，正确。#linebreak()
    C：若 $A B perp C D$，则 $u = v$。此时 $arrow(C D) = (-3/2, sqrt(3)/2, 0)$，与 $arrow(A D) = (1/2, sqrt(3)/2, u)$ 的数量积为 $0$。#linebreak()
    故 $C D perp A D$，又 $C D perp A B$，所以 $C D perp$ 平面 $A B D$，正确。#linebreak()
    D：若 $A B perp$ 平面 $A C D$，则 $u = v = 0$，此时 $angle C A D = 60 degree$，错误。故选 BC。
  ],
)

#question(
  "multiple-choice",
  stem: [已知圆 $C_1: (x + 1)^2 + y^2 = 1$，圆 $C_2: (x - 1)^2 + y^2 = 1$，圆 $C_3: x^2 + (y - sqrt(3))^2 = 1$，直线 $l: y = k x + b$ 与 $C_1, C_2, C_3$ 均有两个交点。记 $l$ 被 $C_1, C_2, C_3$ 截得的弦长分别为 $s_1, s_2, s_3$，则#choice-placeholder()],
  choices: (
    [$k$ 可以取任意实数],
    [满足 $s_1 = s_2 = s_3$ 的直线 $l$ 共有 $3$ 条],
    [满足 $s_1 + s_2 + s_3 = 3$ 的直线 $l$ 多于 $3$ 条],
    [当 $b = 0$ 时，$s_1 + s_2 + s_3$ 的最大值为 $(2 sqrt(21))/3$],
  ),
  answers: ([BCD],),
  explanation: [
    三个圆心到直线的距离分别为 $d_1 = abs(b - k)/sqrt(1 + k^2)$，$d_2 = abs(b + k)/sqrt(1 + k^2)$，$d_3 = abs(b - sqrt(3))/sqrt(1 + k^2)$。#linebreak()
    由题意，$d_i < 1$，且 $s_i = 2 sqrt(1 - d_i^2)$（$i = 1, 2, 3$）。#linebreak()
    A：取 $k = sqrt(3)/3$，由 $d_1 < 1$、$d_2 < 1$ 得 $-1/sqrt(3) < b < 1/sqrt(3)$，但 $d_3 < 1$ 要求 $b > 1/sqrt(3)$，矛盾，错误。#linebreak()
    B：弦长相等当且仅当 $d_1 = d_2 = d_3$。由 $abs(b - k) = abs(b + k)$ 得 $b k = 0$。#linebreak()
    若 $k = 0$，则 $b = sqrt(3)/2$；若 $b = 0$，则 $k = plus.minus sqrt(3)$。三条直线均满足 $d_i = sqrt(3)/2 < 1$，正确。#linebreak()
    C、D：令 $b = 0$，则 $k^2 > 2$，且 $s_1 + s_2 + s_3 = (4 + 2 sqrt(k^2 - 2))/sqrt(1 + k^2)$。#linebreak()
    设 $t = sqrt(k^2 - 2) > 0$，则弦长之和为 $S(t) = (4 + 2t)/sqrt(t^2 + 3)$。#linebreak()
    令 $S(t) = 3$，得 $5t^2 - 16t + 11 = 0$，故 $t = 1$ 或 $11/5$，对应 $k = plus.minus sqrt(3)$ 或 $plus.minus sqrt(171)/5$，已有四条直线，C 正确。#linebreak()
    又 $S'(t) = (6 - 4t)/(t^2 + 3)^(3/2)$，所以 $S$ 在 $t = 3/2$ 处取得最大值 $(2 sqrt(21))/3$，D 正确。故选 BCD。
  ],
)

#section[填空题：本题共 3 小题，每小题 5 分，共 15 分。]

#question(
  "fill-in",
  stem: [双曲线 $5x^2 - 6y^2 = 1$ 的离心率为#fill-placeholder()。],
  answers: ([$sqrt(66)/6$],),
  explanation: [
    双曲线的标准方程为 $x^2/(1/5) - y^2/(1/6) = 1$，故 $a^2 = 1/5$，$b^2 = 1/6$。#linebreak()
    由 $c^2 = a^2 + b^2 = 11/30$，得离心率 $e = c/a = sqrt(11/6) = sqrt(66)/6$。
  ],
)

#question(
  "fill-in",
  stem: [已知 $f(x) = 2 sin(a x + theta)$（$a in ZZ$，$0 <= theta < 2 pi$）是偶函数，$f(x)$ 在区间 $(0, pi/2)$ 单调递增。则 $theta =$#fill-placeholder()，$f((2 pi)/3) =$#fill-placeholder()。],
  answers: ([$(3 pi)/2$], [$1$]),
  explanation: [
    由严格单调递增知 $a != 0$。正弦函数的递增区间长度为 $pi/abs(a)$，故 $pi/abs(a) >= pi/2$，结合 $a in ZZ$ 得 $abs(a) = 1$ 或 $2$。#linebreak()
    由偶函数性质，$f'(0) = 2a cos theta = 0$，所以 $theta = pi/2$ 或 $(3 pi)/2$。#linebreak()
    若 $theta = pi/2$，则 $f(x) = 2 cos(a x)$，在 $(0, pi/2)$ 上递减，不符合题意。#linebreak()
    因此 $theta = (3 pi)/2$，$f(x) = -2 cos(a x)$，在 $abs(a) = 1$、$2$ 时均满足题意。#linebreak()
    此时 $f((2 pi)/3) = -2 cos((2 pi)/3) = 1$ 或 $-2 cos((4 pi)/3) = 1$，故两空依次为 $(3 pi)/2$，$1$。
  ],
)

#question(
  "fill-in",
  stem: [设实数 $q$ 满足：存在数列 ${a_n}$，使得对于任意 $n in NN^*$，均有 $a_1 + a_2 + dots.c + a_(3n) = n^2 + n$，且 ${a_n}$ 中有某连续 $9$ 项 $a_k, a_(k + 1), dots.c, a_(k + 8)$ 是公比为 $q$ 的等比数列，则 $q$ 的最大值为#fill-placeholder()。],
  answers: ([$root(3, 12)/2$],),
  explanation: [
    将数列按每三项一组分块，记 $T_n = a_(3n - 2) + a_(3n - 1) + a_(3n)$。由前 $3n$ 项和得 $T_n = 2n$。#linebreak()
    设连续九项为 $x, x q, dots.c, x q^8$，记 $H = 1 + q + q^2 > 0$，按起点 $k$ 分类。#linebreak()
    若 $k = 3m + 1$（$m >= 0$），这九项恰含三个完整块，块和依次为 $x H$、$x q^3 H$、$x q^6 H$。#linebreak()
    因而同时有 $q^3 = (m + 2)/(m + 1)$ 和 $q^3 = (m + 3)/(m + 2)$，矛盾。#linebreak()
    若 $k = 3m + 2$（$m >= 0$），两个完整块的和分别为 $x q^2 H = 2(m + 2)$、$x q^5 H = 2(m + 3)$，所以 $q^3 = (m + 3)/(m + 2) <= 3/2$。#linebreak()
    若 $k = 3m$（$m >= 1$），同理有 $x q H = 2(m + 1)$、$x q^4 H = 2(m + 2)$，所以 $q^3 = (m + 2)/(m + 1) <= 3/2$。#linebreak()
    因此 $q <= root(3, 3/2) = root(3, 12)/2$。#linebreak()
    下面说明等号可取：取 $q = root(3, 3/2)$，$k = 2$，$x = 4/(q^2 H)$，令 $a_(2 + j) = x q^j$（$j = 0, 1, dots.c, 8$）。#linebreak()
    此时第二、第三块的和分别为 $4$、$6$；取 $a_1 = 2 - x - x q$，$a_11 = 0$，$a_12 = 8 - a_10$，即可使第一、第四块的和为 $2$、$8$。#linebreak()
    对 $n >= 5$，取 $a_(3n - 2) = 2n$，$a_(3n - 1) = a_(3n) = 0$。于是所有块均满足 $T_n = 2n$，前 $3n$ 项和为 $n^2 + n$，最大值可以取到。
  ],
)
