#import "/src/lib.typ": choice-placeholder, exam, question, section

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
