#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2025,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2025/2025北京.pdf",
  regions: ("北京",),
)

#let part-figure(auxiliary: false) = cetz.canvas(length: 4mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (8, 0, 0)
  let c = (8, -8, 0)
  let d = (12, -8, 0)
  let e = (12, 4, 0)
  let f = (0, 4, 0)
  let r = (0, 2, 1.5)
  let s = (10, 2, 1.5)
  let t = (10, -8, 1.5)
  let h = (8, 2, 1.5)
  let u = (8, 4, 0)
  oblique-project((1, 0), (0.45, 0.5), (0, 1.1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, d, e, s, r, a)
    line(r, f, a, stroke: (dash: figure-style.dash))
    line(f, e, stroke: (dash: figure-style.dash))
    line(c, t, d)
    line(t, s)
    line(b, s)
    if auxiliary {
      line(b, h, u, b, stroke: (dash: figure-style.dash))
      line(b, e, stroke: (dash: figure-style.dash))
      content(h, $H$, anchor: "south-east", padding: 0.18)
      content(u, $U$, anchor: "south", padding: 0.75)
    }
    for (p, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "south-east"),
      (c, $C$, "north-east"),
      (d, $D$, "north-west"),
      (e, $E$, "west"),
      (f, $F$, "north-west"),
      (r, $R$, "south"),
      (s, $S$, "south"),
      (t, $T$, "south-east"),
    ) {
      content(p, label, anchor: anchor, padding: 0.18)
    }
  })
})
#let pyramid-figure() = cetz.canvas(length: 29mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (1, 0, 0)
  let c = (0, 1, 0)
  let d = (-0.5, 0.5, 0)
  let p = (0, 0, 1)
  let e = (0.5, 0.5, 0)
  let f = (-0.25, 0.25, 0.5)
  let g = (0.25, 0.25, 0.5)
  oblique-project((1, 0), (-0.4, -0.65), (0, 1.3), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, d, c, b, p)
    line(p, c)
    line(p, a, b, stroke: (dash: figure-style.dash))
    line(a, d, stroke: (dash: figure-style.dash))
    line(a, c, stroke: (dash: figure-style.dash))
    line(p, e)
    line(f, g, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "south-east"),
      (b, $B$, "west"),
      (c, $C$, "north"),
      (d, $D$, "east"),
      (p, $P$, "south"),
      (e, $E$, "north-west"),
      (f, $F$, "east"),
      (g, $G$, "west"),
    ) { content(point, label, anchor: anchor, padding: 0.1) }
  })
})

#section[选择题：本题共 10 小题，每小题 4 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [已知集合 $M = {x | 2x - 1 > 5}$，$N = {1, 2, 3}$，则 $M inter N =$#choice-placeholder()。],
  choices: ([${1, 2, 3}$], [${2, 3}$], [${3}$], [$emptyset$]),
  answers: ([D],),
  explanation: [$M = {x | x > 3}$，故 $M inter N = emptyset$，选 D。],
)
#question(
  "single-choice",
  stem: [已知复数 $z$ 满足 $i dot z + 2 = 2i$，则 $abs(z) =$#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$2sqrt(2)$], [$4$], [$8$]),
  answers: ([B],),
  explanation: [$z = (2i - 2)/i = 2 + 2i$，故 $abs(z) = sqrt(2^2 + 2^2) = 2sqrt(2)$，选 B。],
)
#question(
  "single-choice",
  stem: [双曲线 $x^2 - 4y^2 = 4$ 的离心率为#choice-placeholder()。],
  choices: ([$sqrt(3)/2$], [$sqrt(5)/2$], [$5/4$], [$sqrt(5)$]),
  answers: ([B],),
  explanation: [标准方程为 $x^2/4 - y^2 = 1$，故 $a = 2$，$c = sqrt(4 + 1) = sqrt(5)$，$e = c/a = sqrt(5)/2$，选 B。],
)
#question(
  "single-choice",
  stem: [为了得到函数 $y = 9^x$ 的图象，只需把函数 $y = 3^x$ 的图象上所有点的#choice-placeholder()。],
  choices: (
    [横坐标变为原来的 $1/2$ 倍（纵坐标不变）],
    [横坐标变为原来的 $2$ 倍（纵坐标不变）],
    [纵坐标变为原来的 $1/3$ 倍（横坐标不变）],
    [纵坐标变为原来的 $3$ 倍（横坐标不变）],
  ),
  answers: ([A],),
  explanation: [$9^x = 3^(2x)$，故横坐标变为原来的 $1/2$ 倍，选 A。],
)
#question(
  "single-choice",
  stem: [已知 $lr({a_n})$ 是公差不为零的等差数列，$a_1 = -2$，若 $a_3$，$a_4$，$a_6$ 成等比数列，则 $a_10 =$#choice-placeholder()。],
  choices: ([$-20$], [$-18$], [$16$], [$18$]),
  answers: ([C],),
  explanation: [设公差为 $d != 0$。由 $a_4^2 = a_3 a_6$，得 $(-2 + 3d)^2 = (-2 + 2d)(-2 + 5d)$，即 $d(d - 2) = 0$。#linebreak()∴ $d = 2$，$a_10 = -2 + 9 times 2 = 16$，选 C。],
)
#question(
  "single-choice",
  stem: [已知 $a > 0$，$b > 0$，则#choice-placeholder()。],
  choices: (
    [$a^2 + b^2 > 2a b$],
    [$1/a + 1/b >= 1/(a b)$],
    [$a + b > sqrt(a b)$],
    [$1/a + 1/b <= 2/sqrt(a b)$],
  ),
  answers: ([C],),
  explanation: [$a + b >= 2sqrt(a b) > sqrt(a b)$，故 C 正确。#linebreak()当 $a = b$ 时，A 不成立；当 $a = b = 1/4$ 时，B 不成立；当 $a != b$ 时，$1/a + 1/b > 2/sqrt(a b)$，D 不成立。],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x)$ 的定义域为 $D$，则“$f(x)$ 的值域为 $RR$”是“对任意 $M in RR$，存在 $x_0 in D$，使得 $abs(f(x_0)) > M$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [值域为 $RR$ 时，可取函数值大于 $abs(M) + 1$，故充分性成立。#linebreak()反之，$f(x) = x^2$ 满足后一条件，但值域为 $[0, +infinity)$，故不具有必要性，选 A。],
)
#question(
  "single-choice",
  stem: [设函数 $f(x) = sin omega x + cos omega x$（$omega > 0$），若 $f(x + pi) = f(x)$ 恒成立，且 $f(x)$ 在 $[0, pi/4]$ 上存在零点，则 $omega$ 的最小值为#choice-placeholder()。],
  choices: ([$8$], [$6$], [$4$], [$3$]),
  answers: ([C],),
  explanation: [$f(x) = sqrt(2) sin(omega x + pi/4)$。由 $f(x + pi) = f(x)$ 恒成立，得 $omega pi = 2k pi$，即 $omega = 2k$（$k$ 为正整数）。#linebreak()最小正零点为 $3pi/(4omega)$，故 $3pi/(4omega) <= pi/4$，即 $omega >= 3$。满足条件的最小正偶数为 $4$，选 C。],
)
#question(
  "single-choice",
  stem: [在一定条件下，某人工智能大语言模型训练 $N$ 个单位的数据量所需要的时间 $T = k log_2 N$（单位：$"h"$），其中 $k$ 为常数。在此条件下，已知训练数据量 $N$ 从 $10^6$ 个单位增加到 $1.024 times 10^9$ 个单位时，训练时间增加 $20 "h"$；当训练数据量 $N$ 从 $1.024 times 10^9$ 个单位增加到 $4.096 times 10^9$ 个单位时，训练时间增加#choice-placeholder()。],
  choices: ([$2 "h"$], [$4 "h"$], [$20 "h"$], [$40 "h"$]),
  answers: ([B],),
  explanation: [$20 = k log_2(1024) = 10k$，得 $k = 2$。#linebreak()所求时间增量为 $2log_2 4 = 4 "h"$，选 B。],
)
#question(
  "single-choice",
  stem: [在平面直角坐标系 $x O y$ 中，$abs(arrow(O A)) = abs(arrow(O B)) = sqrt(2)$，$abs(arrow(A B)) = 2$，设 $C(3, 4)$，则 $abs(2arrow(C A) + arrow(A B))$ 的取值范围是#choice-placeholder()。],
  choices: ([$[6, 14]$], [$[6, 12]$], [$[8, 14]$], [$[8, 12]$]),
  answers: ([D],),
  explanation: [设 $M$ 为 $A B$ 的中点，则 $O M perp A B$，$abs(O M) = sqrt(2 - 1) = 1$，且 $2arrow(C A) + arrow(A B) = 2arrow(C M)$。#linebreak()点 $M$ 可取单位圆上的任意一点，而 $abs(O C) = 5$，故 $4 <= abs(C M) <= 6$，所求范围为 $[8, 12]$，选 D。],
)

#section[填空题：本题共 5 小题，每小题 5 分，共 25 分。]
#question(
  "fill-in",
  stem: [已知抛物线 $y^2 = 2p x$（$p > 0$）的顶点到焦点的距离为 $3$，则 $p =$#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [顶点到焦点的距离为 $p/2 = 3$，故 $p = 6$。],
)
#question(
  "fill-in",
  stem: [已知 $(1 - 2x)^4 = a_0 - 2a_1 x + 4a_2 x^2 - 8a_3 x^3 + 16a_4 x^4$，则 $a_0 =$#fill-placeholder()；$a_1 + a_2 + a_3 + a_4 =$#fill-placeholder()。],
  answers: ([$1$], [$15$]),
  explanation: [由二项式定理，$a_k = binom(4, k)$（$k = 0, 1, 2, 3, 4$）。#linebreak()∴ $a_0 = 1$，$a_1 + a_2 + a_3 + a_4 = 2^4 - 1 = 15$。],
)
#question(
  "fill-in",
  stem: [已知 $alpha, beta in [0, 2pi]$，且 $sin(alpha + beta) = sin(alpha - beta)$，$cos(alpha + beta) != cos(alpha - beta)$。写出满足条件的一组 $alpha, beta$ 的值：$alpha =$#fill-placeholder()，$beta =$#fill-placeholder()。],
  answers: ([$pi/2$（答案不唯一）], [$pi/2$（与前一空配套）]),
  explanation: [条件等价于 $2cos alpha sin beta = 0$，$-2sin alpha sin beta != 0$。#linebreak()可取 $alpha = beta = pi/2$，此时两个正弦值均为 $0$，两个余弦值分别为 $-1$，$1$。],
)
#question(
  "fill-in",
  stem: [某科技兴趣小组用 3D 打印机制作的一个零件可以抽象为如图所示的多面体，其中 $A B C D E F$ 是一个平面多边形，平面 $A F R perp$ 平面 $A B C$，平面 $C D T perp$ 平面 $A B C$，$A B perp B C$，$A B parallel E F parallel R S parallel C D$，$B C parallel D E parallel S T parallel A F$。若 $A B = B C = 8$，$A F = C D = 4$，$R A = R F = T C = T D = 5/2$，则该多面体的体积为#fill-placeholder()。
    #figure(part-figure())],
  answers: ([$60$],),
  explanation: [
    #figure(part-figure(auxiliary: true))
    #step[分割几何体][连接 $B E$，过 $B$ 作 $B U parallel A F$，交 $F E$ 于 $U$；过 $U$ 作 $U H parallel F R$，交 $R S$ 于 $H$，则 $B U = 4$，$R H = 8$。过 $B E$ 与 $S$ 的平面将原几何体分为对称的两部分，其中一部分为直三棱柱 $A R F - B H U$ 与四棱锥 $B - U H S E$。]
    #step[计算体积][$triangle A R F$ 底边 $A F = 4$，高为 $sqrt((5/2)^2 - 2^2) = 3/2$，面积为 $3$，故三棱柱体积为 $3 times 8 = 24$。#linebreak()梯形 $U H S E$ 的两底 $H S = 2$，$U E = 4$，高为 $U H = 5/2$，面积为 $15/2$。#linebreak()点 $B$ 到其平面的距离等于点 $A$ 到直线 $R F$ 的距离，为 $2 times 3/(5/2) = 12/5$。#linebreak()∴ 四棱锥体积为 $1/3 times 15/2 times 12/5 = 6$，原几何体体积为 $2(24 + 6) = 60$。]
  ],
)
#question(
  "fill-in",
  stem: [关于定义域为 $RR$ 的函数 $f(x)$，给出下列四个结论：#linebreak()① 存在在 $RR$ 上单调递增的函数 $f(x)$ 使得 $f(x) + f(2x) = -x$ 恒成立；#linebreak()② 存在在 $RR$ 上单调递减的函数 $f(x)$ 使得 $f(x) - f(2x) = x$ 恒成立；#linebreak()③ 使得 $f(x) + f(-x) = cos x$ 恒成立的函数 $f(x)$ 存在且有无穷多个；#linebreak()④ 使得 $f(x) - f(-x) = cos x$ 恒成立的函数 $f(x)$ 存在且有无穷多个。#linebreak()其中正确结论的序号是#fill-placeholder()。],
  answers: ([②③],),
  explanation: [① 若 $f$ 递增，则 $f(x) + f(2x)$ 递增，与 $-x$ 递减矛盾，故错误。#linebreak()② 取 $f(x) = -x$ 即可，故正确。#linebreak()③ 对任意 $c in RR$，$f(x) = 1/2 cos x + c x$ 均满足条件，故正确。#linebreak()④ 令 $x = 0$，得 $0 = 1$，矛盾，故错误。],
)

#section[解答题：本题共 6 小题，共 85 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  stem: [在 $triangle A B C$ 中，$cos A = -1/3$，$a sin C = 4sqrt(2)$。],
  parts: (
    subquestion(
      stem: [求 $c$ 的值；],
      answers: ([$6$],),
      explanation: [$sin A = sqrt(1 - 1/9) = 2sqrt(2)/3$。#linebreak()由正弦定理，$a sin C = c sin A$，故 $c = 4sqrt(2)/(2sqrt(2)/3) = 6$。],
    ),
    subquestion(
      stem: [再从条件①、条件②、条件③这三个条件中选择一个作为已知，使得 $triangle A B C$ 存在，求 $B C$ 边上的高。#linebreak()条件①：$a = 6$；条件②：$a sin B = 10sqrt(2)/3$；条件③：$triangle A B C$ 的面积为 $10sqrt(2)$。],
      answers: ([选择条件②或③，高为 $20sqrt(2)/9$。],),
      explanation: [选择条件②。由 $a sin B = b sin A$，得 $b = 5$。#linebreak()由余弦定理，$a^2 = b^2 + c^2 - 2b c cos A = 25 + 36 + 20 = 81$，故 $a = 9$。#linebreak()三角形面积为 $1/2 b c sin A = 10sqrt(2)$，故 $B C$ 边上的高为 $20sqrt(2)/9$。#linebreak()选择条件③同样可先求得 $b = 5$，从而得到相同结果。条件①不合适：$A$ 为钝角，$a$ 应大于 $c = 6$。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在四棱锥 $P - A B C D$ 中，$triangle A D C$ 与 $triangle B A C$ 均为等腰直角三角形，$angle A D C = 90 degree$，$angle B A C = 90 degree$，$E$ 为 $B C$ 的中点。
    #figure(pyramid-figure())],
  parts: (
    subquestion(
      stem: [若 $F$，$G$ 分别为 $P D$，$P E$ 的中点，求证：$F G parallel$ 平面 $P A B$；],
      answers: ([证明见解析。],),
      explanation: [设 $A C = A B = 1$，在底面内取 $A(0,0)$，$B(1,0)$，$C(0,1)$，则 $D(-1/2,1/2)$，$E(1/2,1/2)$，故 $D E parallel A B$。#linebreak()又 $F G$ 为 $triangle P D E$ 的中位线，故 $F G parallel D E parallel A B$。#linebreak()∵ $A B subset$ 平面 $P A B$，$F G$ 不在平面 $P A B$ 内，∴ $F G parallel$ 平面 $P A B$。],
    ),
    subquestion(
      stem: [若 $P A perp$ 平面 $A B C D$，$P A = A C$，求直线 $A B$ 与平面 $P C D$ 所成角的正弦值。],
      answers: ([$sqrt(3)/3$],),
      explanation: [以 $A$ 为原点，$A B$，$A C$，$A P$ 所在直线分别为坐标轴，取 $A C = 1$，则
        $ A(0,0,0), B(1,0,0), C(0,1,0), D(-1/2,1/2,0), P(0,0,1). $
        平面 $P C D$ 的法向量可取 $bold(n) = (-1,1,1)$，因为其与 $arrow(P C) = (0,1,-1)$，$arrow(P D) = (-1/2,1/2,-1)$ 均垂直。#linebreak()设所求角为 $theta$，则 $sin theta = abs(arrow(A B) dot bold(n))/(abs(arrow(A B)) abs(bold(n))) = 1/sqrt(3) = sqrt(3)/3$。],
    ),
  ),
)
#question(
  "solution",
  stem: [某次考试中，只有一道单项选择题考查了某个知识点，甲、乙两校的高一年级学生都参加了这次考试。为了解学生对该知识点的掌握情况，随机抽查了甲、乙两校高一年级各 100 名学生该题的答题数据，其中甲校学生选择正确的人数为 80，乙校学生选择正确的人数为 75。假设学生之间答题相互独立。用频率估计概率。],
  parts: (
    subquestion(
      stem: [估计甲校高一年级学生该题选择正确的概率 $p$；],
      answers: ([$0.8$],),
      explanation: [$p = 80/100 = 0.8$。],
    ),
    subquestion(
      stem: [从甲、乙两校高一年级学生中各随机抽取 1 名。设 $X$ 为这 2 名学生中该题选择正确的人数，估计 $X = 1$ 的概率及 $X$ 的数学期望；],
      answers: ([$P(X = 1) = 0.35$，$E(X) = 1.55$。],),
      explanation: [$P(X = 1) = 0.8 times 0.25 + 0.2 times 0.75 = 0.35$。#linebreak()又 $P(X = 0) = 0.05$，$P(X = 2) = 0.6$，故 $E(X) = 0 times 0.05 + 1 times 0.35 + 2 times 0.6 = 1.55$。],
    ),
    subquestion(
      stem: [假设：如果没有掌握该知识点，学生就从题目给出的四个选项中随机选择一个作为答案；如果掌握该知识点，甲校学生选择正确的概率为 $100%$，乙校学生选择正确的概率为 $85%$。设甲、乙两校高一年级学生掌握该知识点的概率估计值分别为 $p_1$，$p_2$，判断 $p_1$ 与 $p_2$ 的大小。（结论不要求证明）],
      answers: ([$p_1 < p_2$。],),
      explanation: [由全概率公式，$p_1 + (1 - p_1)/4 = 0.8$，$0.85p_2 + (1 - p_2)/4 = 0.75$。#linebreak()解得 $p_1 = 11/15$，$p_2 = 5/6$，故 $p_1 < p_2$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $E: x^2/a^2 + y^2/b^2 = 1$（$a > b > 0$）的离心率为 $sqrt(2)/2$，椭圆 $E$ 上的点到两焦点的距离之和为 $4$。],
  parts: (
    subquestion(
      stem: [求椭圆 $E$ 的方程；],
      answers: ([$x^2/4 + y^2/2 = 1$。],),
      explanation: [$2a = 4$，$c/a = sqrt(2)/2$，故 $a = 2$，$c = sqrt(2)$，$b^2 = a^2 - c^2 = 2$。#linebreak()∴ 椭圆方程为 $x^2/4 + y^2/2 = 1$。],
    ),
    subquestion(
      stem: [设 $O$ 为坐标原点，点 $M(x_0, y_0)$（$x_0 != 0$）在椭圆 $E$ 上，直线 $x_0 x + 2y_0 y - 4 = 0$ 与直线 $y = 2$，$y = -2$ 分别交于点 $A$，$B$。设 $triangle O A M$ 和 $triangle O B M$ 的面积分别为 $S_1$，$S_2$，比较 $S_1/S_2$ 与 $abs(O A)/abs(O B)$ 的大小。],
      answers: ([$S_1/S_2 = abs(O A)/abs(O B)$。],),
      explanation: [∵ $x_0^2 + 2y_0^2 = 4$，∴ $M$ 在直线 $A B$ 上，且 $-sqrt(2) < y_0 < sqrt(2)$，故 $M$ 位于线段 $A B$ 内。#linebreak()两三角形在直线 $A B$ 上的高相同，故
        $ S_1/S_2 = abs(A M)/abs(B M) = (2 - y_0)/(2 + y_0). $
        又 $A((4 - 4y_0)/x_0,2)$，$B((4 + 4y_0)/x_0,-2)$，从而
        $ abs(O A)^2 = (16(1-y_0)^2 + 4x_0^2)/x_0^2 = (8(2-y_0)^2)/x_0^2, $
        $ abs(O B)^2 = (8(2+y_0)^2)/x_0^2. $
        ∴ $abs(O A)/abs(O B) = (2-y_0)/(2+y_0) = S_1/S_2$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知函数 $f(x)$ 的定义域是 $(-1,+infinity)$，$f(0) = 0$，导函数 $f'(x) = ln(1+x)/(1+x)$。设 $l_1$ 是曲线 $y = f(x)$ 在点 $A(a,f(a))$（$a != 0$）处的切线。],
  parts: (
    subquestion(
      stem: [求 $f'(x)$ 的最大值；],
      answers: ([$1/upright(e)$。],),
      explanation: [令 $g(x) = f'(x)$，则 $g'(x) = (1 - ln(1+x))/(1+x)^2$。#linebreak()∴ $g$ 在 $(-1,upright(e)-1)$ 上递增，在 $(upright(e)-1,+infinity)$ 上递减，最大值为 $g(upright(e)-1) = 1/upright(e)$。],
    ),
    subquestion(
      stem: [当 $-1 < a < 0$ 时，证明：除切点 $A$ 外，曲线 $y = f(x)$ 在直线 $l_1$ 的上方；],
      answers: ([证明见解析。],),
      explanation: [令 $h(x) = f(x) - f(a) - f'(a)(x-a)$，则 $h(a) = 0$，$h'(x) = f'(x) - f'(a)$，其中 $f'(a) < 0$。#linebreak()由第（1）问，$x in (-1,a)$ 时 $h'(x) < 0$，$x in (a,upright(e)-1)$ 时 $h'(x) > 0$；$x >= upright(e)-1$ 时，$f'(x) > 0 > f'(a)$，仍有 $h'(x) > 0$。#linebreak()因此 $h$ 在 $a$ 处取得唯一的最小值 $0$，即 $x != a$ 时 $f(x) > f(a) + f'(a)(x-a)$，结论成立。],
    ),
    subquestion(
      stem: [设过点 $A$ 的直线 $l_2$ 与直线 $l_1$ 垂直，$l_1$，$l_2$ 与 $x$ 轴交点的横坐标分别是 $x_1$，$x_2$。若 $a > 0$，求 $(2a-x_2-x_1)/(x_2-x_1)$ 的取值范围。],
      answers: ([$[(upright(e)^2-1)/(upright(e)^2+1),1)$。],),
      explanation: [当 $a > 0$ 时，$f'(x) > 0$（$x > 0$），故 $f(a) > f(0) = 0$。记 $k = f'(a)$，则 $0 < k <= 1/upright(e)$。#linebreak()由两直线方程，$x_1 = a - f(a)/k$，$x_2 = a + k f(a)$，故
        $ (2a-x_2-x_1)/(x_2-x_1) = (1/k-k)/(1/k+k) = (1-k^2)/(1+k^2). $
        该式关于 $k > 0$ 严格递减，而 $k$ 遍历 $(0,1/upright(e)]$，故所求范围为 $[(upright(e)^2-1)/(upright(e)^2+1),1)$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知集合 $A = {1,2,3,4,5,6,7,8}$，$M = {(x,y) | x in A, y in A}$。从 $M$ 中选取 $n$ 个不同的元素组成一个序列：$(x_1,y_1),(x_2,y_2),dots,(x_n,y_n)$，其中 $(x_i,y_i)$ 称为该序列的第 $i$ 项（$i = 1,2,dots,n$）。若该序列的相邻项 $(x_i,y_i)$，$(x_(i+1),y_(i+1))$ 满足
    $
      cases(abs(x_(i+1)-x_i)=3, abs(y_(i+1)-y_i)=4) quad "或" quad cases(abs(x_(i+1)-x_i)=4, abs(y_(i+1)-y_i)=3)
    $
    （$i=1,2,dots,n-1$），则称该序列为 $K$ 列。],
  parts: (
    subquestion(
      stem: [对于第 1 项为 $(3,3)$ 的 $K$ 列，写出它的第 2 项；],
      answers: ([$(6,7)$ 或 $(7,6)$。],),
      explanation: [各坐标均在 $1$ 至 $8$ 之间，故只能分别加 $3$，$4$，或加 $4$，$3$，得到 $(6,7)$ 或 $(7,6)$。],
    ),
    subquestion(
      stem: [设 $Gamma$ 为 $K$ 列，且 $Gamma$ 中的项 $(x_i,y_i)$（$i=1,2,dots,n$）满足：当 $i$ 为奇数时，$x_i in {1,2,7,8}$；当 $i$ 为偶数时，$x_i in {3,4,5,6}$。判断 $(3,2)$，$(4,4)$ 能否同时为 $Gamma$ 中的项，并说明理由；],
      answers: ([不能。],),
      explanation: [相邻两项的坐标和的奇偶性相反，故下标同为偶数的两项，其坐标和奇偶性相同。#linebreak()若 $(3,2)$，$(4,4)$ 同时出现，由第一坐标均在 ${3,4,5,6}$ 中可知，两项下标均为偶数；但其坐标和分别为 $5$，$8$，奇偶性相反，矛盾。故不能同时出现。],
    ),
    subquestion(
      stem: [证明：由 $M$ 的全部元素组成的序列都不是 $K$ 列。],
      answers: ([证明见解析。],),
      explanation: [令 $U = {1,2,7,8}$，$V = {3,4,5,6}$，考虑集合 $S = U times U$ 中的 $16$ 个元素。#linebreak()与 $S$ 中某个元素相邻的项，其两坐标必均在 $V$ 中。而 $(3,3)$，$(3,6)$，$(6,3)$，$(6,6)$ 不可能与 $S$ 中的项相邻：$3$ 或 $6$ 与 $U$ 中元素的差的绝对值不可能为 $3$，因此两个坐标差无法分别为 $3$ 和 $4$。#linebreak()因此能紧接在 $S$ 中元素之后的项，至多有 $4^2 - 4 = 12$ 个。#linebreak()假设某个 $K$ 列包含 $M$ 的全部元素，则 $S$ 中至多一个元素为末项，其余至少 $15$ 个元素各有后继项。由于序列元素互异，这些后继项也互不相同，故至少有 $15$ 个可能的后继项，与至多 $12$ 个矛盾。结论得证。],
    ),
  ),
)
