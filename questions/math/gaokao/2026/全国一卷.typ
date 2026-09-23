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
  stem: [样本数据 $6, 8, 4, 5, 12$ 的中位数为#choice-placeholder()],
  choices: ([$5$], [$6$], [$8$], [$9$]),
)

#question(
  "single-choice",
  stem: [已知平面向量 $bold(a), bold(b)$ 不共线，且 $2 bold(a) + y bold(b) = x bold(a) - 3 bold(b)$，则#choice-placeholder()],
  choices: (
    [$x = 2, y = -3$],
    [$x = -2, y = 3$],
    [$x = 2, y = 3$],
    [$x = -2, y = -3$],
  ),
)

#question(
  "single-choice",
  stem: [已知集合 $A = {sin (7 pi)/6, cos (5 pi)/3, tan (5 pi)/4}$，$B = {-sqrt(3)/2, -1/2, 1}$，则 $A inter B =$#choice-placeholder()],
  choices: (
    [${-sqrt(3)/2, -1/2}$],
    [${-sqrt(3)/2, 1}$],
    [${-1/2, 1}$],
    [${-sqrt(3)/2, -1/2, 1}$],
  ),
)

#question(
  "single-choice",
  stem: [曲线 $y = 5x + 8 ln x$ 在点 $(1, 5)$ 处的切线方程为#choice-placeholder()],
  choices: ([$y = 3x + 2$], [$y = 5x$], [$y = 8x - 3$], [$y = 13x - 8$]),
)

#question(
  "single-choice",
  stem: [已知抛物线 $C_1: y^2 = 2p_1 x (p_1 > 0)$ 和 $C_2: x^2 = 2p_2 y (p_2 > 0)$ 均经过点 $(4, 8)$，则 $C_1$ 的焦点与 $C_2$ 的焦点之间的距离为#choice-placeholder()],
  choices: ([$12$], [$4 sqrt(5)$], [$6$], [$sqrt(65)/2$]),
)

#question(
  "single-choice",
  stem: [已知函数 $f(x) = (x + 2)/(e^x + a)$ 的最大值为 $1$，则 $a =$#choice-placeholder()],
  choices: ([$1/2$], [$1$], [$3/2$], [$2$]),
)

#question(
  "single-choice",
  stem: [一百零八塔位于宁夏回族自治区青铜峡市，以其独特的建筑格局和深远的历史文化闻名遐迩。该塔群共有 $108$ 座塔，依山势自上而下排成 $12$ 行，将第 $i$ 行中塔的座数记为 $a_i (i = 1, 2, dots.c, 12)$，其中 $a_1 = 1$，$a_2 = a_3 = 3$，$a_4 = a_5 = 5$，且 $a_6, a_7, dots.c, a_12$ 是一个首项为 $7$，公差为 $2$ 的等差数列。将 $a_1, a_2, dots.c, a_12$ 分为 $6$ 组，每组 $2$ 个数，使得每组的 $2$ 个数之和可构成一个项数为 $6$ 且公差为 $d (d > 0)$ 的等差数列，则 $d =$#choice-placeholder()],
  choices: ([$2$], [$4$], [$6$], [$8$]),
)

#question(
  "single-choice",
  stem: [设 $U = {(x_1, x_2, x_3) | x_i in {-2, -1, 1, 2}, i = 1, 2, 3}$ 为空间中的 $64$ 个点构成的集合，点 $P(1, 1, 1)$，记样本空间 $Omega = complement_U {P}$，从 $Omega$ 中随机取一个点，定义随机变量 $X$ 如下：对于 $Omega$ 中的每个点 $A(x_1, x_2, x_3)$，令 $X(A) = x_1 + x_2 + x_3$，则 $X$ 的数学期望为#choice-placeholder()],
  choices: ([$-1/21$], [$-1/63$], [$0$], [$1/7$]),
)
