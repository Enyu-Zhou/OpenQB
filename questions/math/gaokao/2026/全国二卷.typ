#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, fill-placeholder, oblique-project, plot,
  question, section, space-axes, step, subquestion,
)

#show: exam.with(
  subject: "数学",
  year: 2026,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2026/2026全国2(辽宁%2C重庆%2C海南%2C吉林%2C黑龙江%2C山西%2C云南%2C广西%2C甘肃%2C贵州%2C新疆%2C四川%2C内蒙古%2C陕西%2C青海%2C宁夏%2C西藏).pdf",
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

// 使用实际天数与频率密度，坐标轴、刻度及断轴由 cetz-plot 生成。
// 柱底复用横轴，相邻柱共用竖边；网格仅绘制柱体外的可见部分。
#let histogram-figure() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(axes: (
      stroke: 0.6pt,
      padding: 0,
      overshoot: 0.35,
      shared-zero: $O$,
      tick: (length: 0, label: (offset: 0.12)),
      grid: (stroke: (paint: black, dash: "dashed", thickness: 0.6pt)),
      x: (overshoot: 0.65, label: (anchor: "north-west", offset: 0.15)),
      y: (label: (anchor: "south", offset: -0.15)),
    ))
    let heights = (0.005, 0.010, 0.020, 0.025, 0.015, 0.015, 0.005, 0.005)
    plot.plot(
      name: "histogram",
      size: (9, 4.5),
      axis-style: "school-book",
      x-min: 335,
      x-max: 425,
      x-break: true,
      x-tick-step: none,
      x-ticks: range(345, 426, step: 10),
      x-label: [首次出现故障#linebreak()的时间/天],
      y-min: 0,
      y-max: 0.027,
      y-tick-step: none,
      y-ticks: (
        (0.005, [0.005]),
        (0.010, [0.010]),
        (0.015, [0.015]),
        (0.020, [0.020]),
        (0.025, [0.025]),
      ),
      y-grid: false,
      y-label: [频率/组距],
      {
        for level in (0.005, 0.010, 0.015, 0.020, 0.025) {
          let start = 335
          for (i, height) in heights.enumerate() {
            let left = 345 + 10 * i
            if height >= level {
              if start < left {
                plot.add-hline(level, min: start, max: left, style: (
                  stroke: (paint: black, dash: "dashed", thickness: 0.6pt),
                ))
              }
              start = left + 10
            }
          }
          if start < 425 {
            plot.add-hline(level, min: start, max: 425, style: (
              stroke: (paint: black, dash: "dashed", thickness: 0.6pt),
            ))
          }
        }
        plot.annotate(resize: false, {
          set-style(stroke: 0.6pt)
          for (i, height) in heights.enumerate() {
            line((345 + 10 * i, height), (355 + 10 * i, height))
          }
          for i in range(heights.len() + 1) {
            let left = if i == 0 { 0 } else { heights.at(i - 1) }
            let right = if i == heights.len() { 0 } else { heights.at(i) }
            line((345 + 10 * i, 0), (345 + 10 * i, calc.max(left, right)))
          }
        })
      },
    )
    content((0, 0), $O$, anchor: "north-east", padding: 0.12)
  })
}

// 按第 (2) 问的真实三维坐标绘制，背面的 BD、AE、CE 使用虚线。
#let pyramid-figure(auxiliary: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 16mm, {
    import cetz.draw: *
    let d = (0, 0, 0)
    let e = (2, 0, 0)
    let b = (3, 0, 0)
    let c = (0, 2 * calc.sqrt(3), 0)
    let a = (2, 0, calc.sqrt(2))
    // 斜投影保留真实点位，使 BD 水平、AE 竖直，C 位于原卷的斜下方。
    oblique-project((-1, 0), (-0.36, -0.27), (0, 1.5), {
      set-style(stroke: (thickness: 0.6pt, join: "round", cap: "butt"))
      line(b, d, stroke: (dash: "dashed"))
      line(a, e, c, stroke: (dash: "dashed"))
      line(a, b, c, d, a, c)
      if auxiliary {
        space-axes(
          (3, 2 * calc.sqrt(3), 0),
          (3.7, 4.2, 2.1),
          label-anchors: ("east", "north-east", "south"),
        )
      }
      for (point, label, anchor) in (
        (a, $A$, "south"),
        (b, $B$, if auxiliary { "south-east" } else { "east" }),
        (c, $C$, if auxiliary { "north-west" } else { "north" }),
        (d, $D$, "west"),
        (e, $E$, "south-east"),
      ) {
        content(point, label, anchor: anchor, padding: 0.12)
      }
    })
  })
}

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]

#question(
  "single-choice",
  stem: [$(1 - 3i)^2 =$#choice-placeholder()],
  choices: ([$-8 + 6i$], [$-8 - 6i$], [$8 + 6i$], [$8 - 6i$]),
  answers: ([B],),
  explanation: [由 $i^2 = -1$，得 $(1 - 3i)^2 = 1 - 6i + 9i^2 = -8 - 6i$，故选 B。],
)

#question(
  "single-choice",
  stem: [已知集合 $A = {0, 1, 3, 6, 9}$，$B = {x | sqrt(x) = x}$，则 $A inter B =$#choice-placeholder()],
  choices: ([${0, 1}$], [${3, 6}$], [${0, 1, 9}$], [${0, 3, 9}$]),
  answers: ([A],),
  explanation: [
    $sqrt(x) = x$ 要求 $x >= 0$，两边平方得 $x(x - 1) = 0$。#linebreak()
    $0$、$1$ 均满足原方程，故 $B = {0, 1}$，$A inter B = {0, 1}$，选 A。
  ],
)

#question(
  "single-choice",
  stem: [已知向量 $bold(a), bold(b)$ 满足 $abs(bold(a) + bold(b)) = 1$，$abs(bold(a) - bold(b)) = sqrt(3)$，则 $bold(a) dot bold(b) =$#choice-placeholder()],
  choices: ([$1/2$], [$1/3$], [$-1/3$], [$-1/2$]),
  answers: ([D],),
  explanation: [
    两个模长等式平方后相减，得#linebreak()
    $4 bold(a) dot bold(b) = abs(bold(a) + bold(b))^2 - abs(bold(a) - bold(b))^2 = 1 - 3 = -2$。#linebreak()
    $therefore bold(a) dot bold(b) = -1/2$，故选 D。
  ],
)

#question(
  "single-choice",
  stem: [设双曲线 $C: x^2/a^2 - y^2/b^2 = 1$（$a > 0, b > 0$）经过点 $(1, 0)$ 和点 $(sqrt(7)/2, 3)$，则 $C$ 的渐近线方程为#choice-placeholder()],
  choices: (
    [$y = plus.minus 3 sqrt(2)x$],
    [$y = plus.minus 2 sqrt(3)x$],
    [$y = plus.minus sqrt(3)/6 x$],
    [$y = plus.minus sqrt(2)/6 x$],
  ),
  answers: ([B],),
  explanation: [
    代入 $(1, 0)$，得 $a^2 = 1$。#linebreak()
    再代入 $(sqrt(7)/2, 3)$，得 $7/4 - 9/b^2 = 1$，故 $b^2 = 12$。#linebreak()
    渐近线方程为 $y = plus.minus b/a x = plus.minus 2 sqrt(3)x$，故选 B。
  ],
)

#question(
  "single-choice",
  stem: [已知棱台的上、下底面均是有一个内角为 $60 degree$ 的菱形，上、下底面的边长分别为 $2$、$3$，该棱台的高为 $sqrt(3)$，则其体积为#choice-placeholder()],
  choices: ([$19/12$], [$19/6$], [$19/4$], [$19/2$]),
  answers: ([D],),
  explanation: [
    上、下底面积分别为 $S_1 = 2^2 sin 60 degree = 2 sqrt(3)$，$S_2 = 3^2 sin 60 degree = 9 sqrt(3)/2$。#linebreak()
    由棱台体积公式，
    $
      V = sqrt(3)/3 (S_1 + sqrt(S_1 S_2) + S_2) = sqrt(3)/3 (2 sqrt(3) + 3 sqrt(3) + 9 sqrt(3)/2) = 19/2.
    $
    故选 D。
  ],
)

#question(
  "single-choice",
  stem: [把甲、乙、丙、丁等 $8$ 位员工分为 $A$、$B$ 两个技术攻关组，要求每组 $4$ 人，其中甲、乙同组，丙、丁不同组，则分组方案共有#choice-placeholder()],
  choices: ([$10$ 种], [$12$ 种], [$16$ 种], [$24$ 种]),
  answers: ([C],),
  explanation: [
    先选择甲、乙所在的组，有 $2$ 种方法。#linebreak()
    再从丙、丁中选 $1$ 人与甲、乙同组，有 $2$ 种方法。#linebreak()
    最后从其余 $4$ 人中选 $1$ 人加入该组，其余人自动进入另一组，有 $4$ 种方法。#linebreak()
    两组有明确名称，无需除以 $2$，故方案数为 $2 times 2 times 4 = 16$，选 C。
  ],
)

#question(
  "single-choice",
  stem: [已知 $alpha$ 为第二象限角，$3 sin 2 alpha cos alpha = 8 sin alpha cos 2 alpha$，则 $(1 + sin alpha)/(2 - cos alpha) =$#choice-placeholder()],
  choices: ([$3/4$], [$3/5$], [$1/2$], [$5/12$]),
  answers: ([C],),
  explanation: [
    $because sin alpha > 0$，由二倍角公式并约去 $2 sin alpha$，得#linebreak()
    $3 cos^2 alpha = 4(2 cos^2 alpha - 1)$，故 $cos^2 alpha = 4/5$。#linebreak()
    $alpha$ 为第二象限角，故 $cos alpha = -2/sqrt(5)$，$sin alpha = 1/sqrt(5)$。#linebreak()
    $therefore (1 + sin alpha)/(2 - cos alpha) = (1 + 1/sqrt(5))/(2 + 2/sqrt(5)) = 1/2$，故选 C。
  ],
)

#question(
  "single-choice",
  stem: [已知 $f(x)$ 是定义域为 $RR$ 的偶函数，$f(x) + f(x - 2) = 0$，且当 $x in [3/2, 3]$ 时，$f(x) = x^2 + a x + b$，则#choice-placeholder()],
  choices: (
    [$a = -2, b = -3$],
    [$a = -2, b = 3$],
    [$a = -4, b = -3$],
    [$a = -4, b = 3$],
  ),
  answers: ([D],),
  explanation: [
    由 $f(x + 2) = -f(x)$，得 $f(x + 4) = f(x)$。#linebreak()
    结合偶性，$f(3/2) = f(-3/2) = f(5/2)$。#linebreak()
    代入二次式得 $9/4 + 3a/2 + b = 25/4 + 5a/2 + b$，故 $a = -4$。#linebreak()
    又 $f(1) + f(-1) = 0$ 且 $f(1) = f(-1)$，故 $f(1) = 0$。#linebreak()
    $therefore f(3) = -f(1) = 0$，即 $9 + 3a + b = 0$，得 $b = 3$，选 D。
  ],
)

#section[选择题：本题共 3 小题，每小题 6 分，共 18 分。在每小题给出的四个选项中，有多项符合题目要求。全部选对的得 6 分，部分选对的得部分分，有选错的得 0 分。]

#question(
  "multiple-choice",
  stem: [已知 $⊙ O: x^2 + y^2 = 1$，$⊙ A: x^2 + y^2 - 6x - 8y + k = 0$，则#choice-placeholder()],
  choices: (
    [点 $A$ 的坐标为 $(-3, -4)$],
    [当 $k = 9$ 时，$⊙ A$ 与 $x$ 轴相切],
    [当 $k = -11$ 时，$⊙ O$ 与 $⊙ A$ 相切],
    [当 $⊙ O$ 与 $⊙ A$ 相交时，两个交点所在直线的方程为 $6x + 8y - k - 2 = 0$],
  ),
  answers: ([BC],),
  explanation: [
    #step[选项 A][配方得 $(x - 3)^2 + (y - 4)^2 = 25 - k$，故圆心 $A(3, 4)$，半径为 $sqrt(25 - k)$。A 错误。]
    #step[选项 B][当 $k = 9$ 时，半径为 $4$，恰等于圆心到 $x$ 轴的距离，故相切。B 正确。]
    #step[选项 C][当 $k = -11$ 时，两圆半径分别为 $1$、$6$，圆心距 $O A = 5 = 6 - 1$，故两圆内切。C 正确。]
    #step[选项 D][两圆方程相减得 $-6x - 8y + k + 1 = 0$，即公共弦所在直线为 $6x + 8y - k - 1 = 0$。D 错误。]
  ],
)

#question(
  "multiple-choice",
  stem: [设等比数列 $\{a_n\}$ 的公比 $q != 1$，$a_1 > 0$，$2a_3 = a_1 + a_2$，记其前 $n$ 项和为 $S_n$，则#choice-placeholder()],
  choices: (
    [$q = -1/2$],
    [$S_n > (2a_1)/3$],
    [$2S_(n + 2) = S_(n + 1) + S_n$],
    [$sum_(k = 1)^n S_k > (2n a_1)/3$],
  ),
  answers: ([ACD],),
  explanation: [
    #step[选项 A][
      由 $2a_1 q^2 = a_1 (1 + q)$ 及 $a_1 > 0$，得 $(2q + 1)(q - 1) = 0$。#linebreak()
      $because q != 1$，$therefore q = -1/2$。A 正确。
    ]
    #step[选项 B][当 $n = 2$ 时，$S_2 = a_1/2 < (2a_1)/3$。B 错误。]
    #step[选项 C][
      $S_n = (2a_1)/3 (1 - q^n)$，且 $2q^2 = q + 1$。#linebreak()
      $therefore 2S_(n + 2) - S_(n + 1) - S_n = (2a_1)/3 q^n (-2q^2 + q + 1) = 0$。C 正确。
    ]
    #step[选项 D][
      对前 $n$ 项和再求和，得
      $
        sum_(k = 1)^n S_k = (2n a_1)/3 - (2a_1)/3 dot (q(1 - q^n))/(1 - q) = (2n a_1)/3 + (2a_1)/9 (1 - (-1/2)^n).
      $
      $because abs((-1/2)^n) < 1$ 且 $a_1 > 0$，末项严格大于 $0$。D 正确。
    ]
  ],
)

#question(
  "multiple-choice",
  stem: [已知抛物线 $E: y^2 = 8x$，斜率为 $k$（$k > 0$）的直线 $l$ 经过点 $(-1, 0)$，等边三角形 $A B C$ 的顶点 $A$ 在 $E$ 上，顶点 $B$、$C$ 均在 $l$ 上。下列结论正确的有#choice-placeholder()],
  choices: (
    [$E$ 的准线方程为 $x = -2$],
    [若 $l$ 与 $E$ 没有公共点，则 $k > sqrt(2)$],
    [若 $l$ 与 $E$ 的唯一公共点为 $B$，则 $E$ 的焦点在直线 $A B$ 上],
    [若 $k = 2$，则 $triangle A B C$ 面积的最小值为 $sqrt(3)/15$],
  ),
  answers: ([ABD],),
  explanation: [
    #step[选项 A][$y^2 = 2p x$ 中 $p = 4$，故焦点为 $F(2, 0)$，准线为 $x = -2$。A 正确。]
    #step[选项 B][
      由 $l: y = k(x + 1)$，消去 $x$ 得 $k y^2 - 8y + 8k = 0$。#linebreak()
      无公共点等价于 $Delta = 64 - 32k^2 < 0$。结合 $k > 0$，得 $k > sqrt(2)$。B 正确。
    ]
    #step[选项 C][
      唯一公共点对应 $Delta = 0$，故 $k = sqrt(2)$，$B(1, 2 sqrt(2))$。#linebreak()
      直线 $B F$ 的斜率为 $-2 sqrt(2)$，与 $l$ 所成锐角的正切值为
      $
        abs((-2 sqrt(2) - sqrt(2))/(1 + (-2 sqrt(2)) dot sqrt(2))) = sqrt(2) != sqrt(3).
      $
      因而 $B F$ 与 $l$ 不成 $60 degree$ 角，不能是等边三角形的边 $A B$ 所在直线。C 错误。
    ]
    #step[选项 D][
      当 $k = 2$ 时，$l: 2x - y + 2 = 0$。设 $A(u^2/8, u)$，则 $A$ 到 $l$ 的距离为
      $
        h = abs(u^2/4 - u + 2)/sqrt(5) = ((u - 2)^2/4 + 1)/sqrt(5) >= 1/sqrt(5).
      $
      等边三角形以 $B C$ 为底的高为 $h$，故 $S = h^2/sqrt(3) >= sqrt(3)/15$。#linebreak()
      当 $u = 2$ 时取等号；以垂足为中点，在 $l$ 上向两侧各取长 $h/sqrt(3)$ 即可得到 $B$、$C$。D 正确。
    ]
  ],
)

#section[填空题：本题共 3 小题，每小题 5 分，共 15 分。]

#question(
  "fill-in",
  stem: [记 $S_n$ 为等差数列 $\{a_n\}$ 的前 $n$ 项和。若 $a_1 = -1$，$a_4 = 5$，则 $S_6 =$#fill-placeholder()。],
  answers: ([$24$],),
  explanation: [
    设公差为 $d$，则 $-1 + 3d = 5$，得 $d = 2$。#linebreak()
    $therefore S_6 = 6a_1 + (6 times 5)/2 d = -6 + 30 = 24$。
  ],
)

#question(
  "fill-in",
  stem: [若函数 $f(x) = 2^x + 2^(2 - x) - m$ 有两个零点，则 $m$ 的取值范围是#fill-placeholder()。],
  answers: ([$(4, +infinity)$],),
  explanation: [
    令 $u = 2^x > 0$。$x$ 与 $u$ 一一对应，原方程等价于 $u^2 - m u + 4 = 0$。#linebreak()
    有两个零点等价于该二次方程有两个不同的正根，即#linebreak()
    $Delta = m^2 - 16 > 0$，根的和 $m > 0$，根的积 $4 > 0$。#linebreak()
    联立得 $m > 4$，故所求范围为 $(4, +infinity)$。
  ],
)

#question(
  "fill-in",
  stem: [已知球 $O$ 的体积为 $4 sqrt(3) pi$，$A$、$B$、$C$、$D$ 四点均在球 $O$ 的球面上，$triangle A B C$ 为等边三角形，$D A = D B = D C = sqrt(2)$，则 $triangle A B C$ 的面积为#fill-placeholder()。],
  answers: ([$(5 sqrt(3))/4$],),
  explanation: [
    #step[确定底面所在平面][
      由 $4/3 pi R^3 = 4 sqrt(3) pi$，得球半径 $R = sqrt(3)$。#linebreak()
      以 $O$ 为原点，$O D$ 为 $z$ 轴正方向，则 $D(0, 0, sqrt(3))$。#linebreak()
      对 $A$、$B$、$C$ 中任一点 $(x, y, z)$，有#linebreak()
      $x^2 + y^2 + z^2 = 3$，$x^2 + y^2 + (z - sqrt(3))^2 = 2$。#linebreak()
      相减得 $z = 2/sqrt(3)$，故三点所在截面圆的半径平方为 $r^2 = 3 - 4/3 = 5/3$。
    ]
    #step[由外接圆半径求面积][
      该截面圆就是 $triangle A B C$ 的外接圆。#linebreak()
      等边三角形的边长为 $sqrt(3)r = sqrt(5)$，故面积为 $sqrt(3)/4 dot 5 = (5 sqrt(3))/4$。
    ]
  ],
)

#section[解答题：本题共 5 小题，共 77 分。解答应写出文字说明、证明过程或演算步骤。]

#question(
  "solution",
  score: 13,
  stem: [从某厂生产的某种电子产品中随机抽取了若干件进行试验，测试它们首次出现故障的时间（单位：天），由试验结果得到如下频率分布直方图：
    #figure(histogram-figure())
  ],
  parts: (
    subquestion(
      stem: [估计这种电子产品首次出现故障的时间的第一四分位数及中位数（假设数据在组内均匀分布）；],
      answers: ([第一四分位数为 $370$ 天，中位数为 $381$ 天。],),
      explanation: [
        #step[第一四分位数][
          前两组的累计频率为 $(0.005 + 0.010) times 10 = 0.15$。#linebreak()
          加上第三组后为 $0.15 + 0.020 times 10 = 0.35$。#linebreak()
          $because 0.15 < 0.25 < 0.35$，第一四分位数在 $[365, 375)$ 内。#linebreak()
          由组内均匀分布，估计值为 $365 + (0.25 - 0.15)/0.020 = 370$ 天。
        ]
        #step[中位数][
          前四组的累计频率为 $0.35 + 0.025 times 10 = 0.60$。#linebreak()
          $because 0.35 < 0.50 < 0.60$，中位数在 $[375, 385)$ 内。#linebreak()
          估计值为 $375 + (0.50 - 0.35)/0.025 = 381$ 天。
        ]
      ],
    ),
    subquestion(
      stem: [设 $hat(p)$ 为 $1$ 件这种电子产品首次出现故障的时间小于 $365$ 天的概率估计值。],
      parts: (
        subquestion(
          stem: [求 $hat(p)$；],
          answers: ([$0.15$],),
          explanation: [以对应的频率估计概率，得 $hat(p) = (0.005 + 0.010) times 10 = 0.15$。],
        ),
        subquestion(
          stem: [该厂向某用户销售 $100$ 件这种电子产品，记 $X$ 为这 $100$ 件电子产品中首次出现故障的时间小于 $365$ 天的件数，假设 $X tilde B(100, hat(p))$，求 $E(X)$、$D(X)$。],
          answers: ([$E(X) = 15$，$D(X) = 12.75$。],),
          explanation: [
            由二项分布的期望和方差公式，得#linebreak()
            $E(X) = 100 hat(p) = 15$，#linebreak()
            $D(X) = 100 hat(p)(1 - hat(p)) = 100 times 0.15 times 0.85 = 12.75$。
          ],
        ),
      ),
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [如图，三棱锥 $A - B C D$ 中，点 $E$ 在 $B D$ 上，$A E perp C E$，$A E perp D E$，$C D perp A D$。
    #figure(pyramid-figure())
  ],
  parts: (
    subquestion(
      stem: [证明：$C D perp A B$；],
      answers: ([$C D perp A B$，证明见解析。],),
      explanation: [
        $because A E perp C E$、$A E perp D E$，且 $C E inter D E = E$，两线均在平面 $B C D$ 内，#linebreak()
        $therefore A E perp$ 平面 $B C D$，从而 $A E perp C D$。#linebreak()
        又 $C D perp A D$，$A E inter A D = A$，$A E$、$A D$ 均在平面 $A B D$ 内，#linebreak()
        $therefore C D perp$ 平面 $A B D$。#linebreak()
        $because A B subset$ 平面 $A B D$，$therefore C D perp A B$。
      ],
    ),
    subquestion(
      stem: [若 $D E = 2$，$B E = 1$，$A E = sqrt(2)$，$C D = 2 sqrt(3)$，求直线 $A D$ 与平面 $A B C$ 所成角的正弦值。],
      answers: ([$sqrt(6)/3$],),
      explanation: [
        #step[建立空间直角坐标系][
          由第（1）问，$C D perp$ 平面 $A B D$，故 $C D perp D B$。#linebreak()
          以 $D$ 为原点，$D B$、$D C$ 的方向分别为 $x$、$y$ 轴正方向，以平行于 $E A$ 的方向为 $z$ 轴正方向。#linebreak()
          得 $D(0, 0, 0)$，$B(3, 0, 0)$，$C(0, 2 sqrt(3), 0)$，$A(2, 0, sqrt(2))$。
          #figure(pyramid-figure(auxiliary: true))
        ]
        #step[求平面法向量][
          $arrow(A B) = (1, 0, -sqrt(2))$，$arrow(A C) = (-2, 2 sqrt(3), -sqrt(2))$。#linebreak()
          设平面 $A B C$ 的法向量为 $bold(n) = (u, v, w)$，则#linebreak()
          $u - sqrt(2)w = 0$，$-2u + 2 sqrt(3)v - sqrt(2)w = 0$。#linebreak()
          取 $w = 2$，得 $bold(n) = (2 sqrt(2), sqrt(6), 2)$，$abs(bold(n)) = 3 sqrt(2)$。
        ]
        #step[计算线面角][
          $arrow(A D) = (-2, 0, -sqrt(2))$，$abs(arrow(A D)) = sqrt(6)$。#linebreak()
          设所求角为 $theta$，则
          $
            sin theta = abs(arrow(A D) dot bold(n))/(abs(arrow(A D)) abs(bold(n))) = (6 sqrt(2))/(sqrt(6) dot 3 sqrt(2)) = sqrt(6)/3.
          $
        ]
      ],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [在 $triangle A B C$ 中，已知 $cos B = 3/4$，$cos^2 (A + C) + sin A sin C = 1$。],
  parts: (
    subquestion(
      stem: [证明：$triangle A B C$ 为钝角三角形；],
      answers: ([$triangle A B C$ 为钝角三角形，证明见解析。],),
      explanation: [
        由 $A + C = pi - B$，得 $cos(A + C) = -3/4$。#linebreak()
        由已知条件，$sin A sin C = 1 - 9/16 = 7/16$。#linebreak()
        由余弦的和角公式，得#linebreak()
        $cos A cos C = cos(A + C) + sin A sin C = -3/4 + 7/16 = -5/16 < 0$。#linebreak()
        $because A, C in (0, pi)$，故 $A$、$C$ 中恰有一个是钝角，$triangle A B C$ 为钝角三角形。
      ],
    ),
    subquestion(
      stem: [若 $triangle A B C$ 的面积为 $sqrt(7)/4$，求 $triangle A B C$ 的周长。],
      answers: ([$3 + sqrt(2)$],),
      explanation: [
        #step[利用正弦定理求边长关系][
          记 $A$、$B$、$C$ 的对边分别为 $a$、$b$、$c$。#linebreak()
          $sin B = sqrt(7)/4$，而 $sin A sin C = 7/16 = sin^2 B$。#linebreak()
          由正弦定理得 $(a c)/b^2 = (sin A sin C)/sin^2 B = 1$，故 $a c = b^2$。
        ]
        #step[利用面积和余弦定理求周长][
          由 $1/2 a c sin B = sqrt(7)/4$，得 $a c = 2$，从而 $b = sqrt(2)$。#linebreak()
          由余弦定理，$a^2 + c^2 = b^2 + 2a c cos B = 2 + 3 = 5$。#linebreak()
          $therefore (a + c)^2 = 5 + 4 = 9$，故 $a + c = 3$。#linebreak()
          所求周长为 $a + b + c = 3 + sqrt(2)$。
        ]
      ],
    ),
  ),
)

#question(
  "solution",
  score: 17,
  stem: [已知椭圆 $E: x^2/a^2 + y^2 = 1$（$a > 1$），过 $E$ 的右焦点且与 $x$ 轴垂直的直线被 $E$ 截得的线段长为 $sqrt(2)$。],
  parts: (
    subquestion(
      stem: [求 $E$ 的离心率；],
      answers: ([$sqrt(2)/2$],),
      explanation: [
        设右焦点为 $(c, 0)$，则 $c^2 = a^2 - 1$。#linebreak()
        令 $x = c$，得 $y^2 = 1 - c^2/a^2 = 1/a^2$。#linebreak()
        所截线段长为 $2/a = sqrt(2)$，故 $a = sqrt(2)$，$c = 1$。#linebreak()
        $therefore$ 离心率 $e = c/a = sqrt(2)/2$，椭圆方程为 $x^2/2 + y^2 = 1$。
      ],
    ),
    subquestion(
      stem: [设 $O$ 为坐标原点，给定点 $G(t, 0)$（$t != 0$），$A(x_0, y_0)$（$y_0 != 0$）为 $E$ 上的点，过 $A$ 作 $y$ 轴的垂线，垂足为 $B$。直线 $O A$ 与直线 $G B$ 的交点为 $P$，当 $A$ 在 $E$ 上运动时，点 $P$ 的轨迹为 $M$。],
      parts: (
        subquestion(
          stem: [求 $M$ 的方程；],
          answers: ([$(1/2 - 1/t^2)x^2 + y^2 + 2/t x - 1 = 0$（$y != 0$）。],),
          explanation: [
            #step[求交点并消去参数][
              $B(0, y_0)$，直线 $O A$ 的方程可写为 $y_0 x = x_0 y$，无需排除 $x_0 = 0$。#linebreak()
              直线 $G B$ 的方程为 $x/t + y/y_0 = 1$。#linebreak()
              当 $x_0 = -t$ 时，两直线平行，无交点，应排除该位置。#linebreak()
              当 $x_0 != -t$ 时，联立得
              $ x = (t x_0)/(t + x_0), quad y = (t y_0)/(t + x_0). $
              由 $t != 0$、$y_0 != 0$，得 $y != 0$、$x != t$，反解得
              $ x_0 = (t x)/(t - x), quad y_0 = (t y)/(t - x). $
              代入 $x_0^2/2 + y_0^2 = 1$，得
              $ x^2/2 + y^2 = (t - x)^2/t^2. $
              整理即得 $(1/2 - 1/t^2)x^2 + y^2 + 2/t x - 1 = 0$（$y != 0$）。
            ]
            #step[验证轨迹没有增点或漏点][
              反之，任取满足上述方程且 $y != 0$ 的点 $(x, y)$。#linebreak()
              若 $x = t$，则方程给出 $t^2/2 + y^2 = 0$，与 $t != 0$ 矛盾，故必有 $x != t$。#linebreak()
              令 $x_0 = t x/(t - x)$、$y_0 = t y/(t - x)$，则 $y_0 != 0$，且 $x_0^2/2 + y_0^2 = 1$。#linebreak()
              又 $x_0 + t = t^2/(t - x) != 0$，故相应两直线确实交于 $(x, y)$。所求方程成立。
            ]
          ],
        ),
        subquestion(
          stem: [当 $t$ 为何值时，$M$ 有对称中心？当 $M$ 有对称中心时，将 $M$ 平移后得到曲线 $M'$，使得 $O$ 为 $M'$ 的对称中心，说明 $M'$ 是什么曲线。],
          answers: (
            [
              当 $t != 0$ 且 $t != plus.minus sqrt(2)$ 时，$M$ 有对称中心。#linebreak()
              $abs(t) > sqrt(2)$ 时，$M'$ 为焦点在 $x$ 轴上的椭圆去掉与 $x$ 轴的交点；#linebreak()
              $0 < abs(t) < sqrt(2)$ 时，$M'$ 为焦点在 $x$ 轴上的双曲线去掉与 $x$ 轴的交点。
            ],
          ),
          explanation: [
            #step[讨论无中心的情形][
              当 $t^2 = 2$ 时，方程为 $y^2 + 2x/t - 1 = 0$（$y != 0$）。#linebreak()
              它是抛物线去掉顶点。其 $x$ 坐标向一个方向有界、向另一个方向无界，故不可能关于某点中心对称。
            ]
            #step[求中心及平移后的方程][
              当 $t^2 != 2$ 时，配方并化简得
              $
                (t^2 - 2)^2/(2t^4) (x + (2t)/(t^2 - 2))^2 + (t^2 - 2)/t^2 y^2 = 1, quad y != 0.
              $
              对称中心为 $H(-(2t)/(t^2 - 2), 0)$。被去掉的两个 $x$ 轴交点关于 $H$ 成对对称，故去点后仍有该中心。#linebreak()
              沿向量 $((2t)/(t^2 - 2), 0)$ 平移，得到
              $
                M': (t^2 - 2)^2/(2t^4) x^2 + (t^2 - 2)/t^2 y^2 = 1, quad y != 0.
              $
            ]
            #step[判断曲线类型][
              若 $t^2 > 2$，则
              $
                x^2/((2t^4)/(t^2 - 2)^2) + y^2/(t^2/(t^2 - 2)) = 1, quad y != 0.
              $
              两个分母均为正，且前者与后者之比为 $(2t^2)/(t^2 - 2) > 1$。#linebreak()
              故为焦点在 $x$ 轴上的椭圆去掉与 $x$ 轴的两个交点。#linebreak()
              若 $0 < t^2 < 2$，则
              $
                x^2/((2t^4)/(2 - t^2)^2) - y^2/(t^2/(2 - t^2)) = 1, quad y != 0.
              $
              故为焦点在 $x$ 轴上的双曲线去掉与 $x$ 轴的两个交点。
            ]
          ],
        ),
      ),
    ),
  ),
)

#question(
  "solution",
  score: 17,
  stem: [已知函数 $f(x) = x e^x + a x + b$，曲线 $y = f(x)$ 在点 $(0, f(0))$ 处的切线方程为 $y = -2x + 1$。],
  parts: (
    subquestion(
      stem: [求 $a$、$b$；],
      answers: ([$a = -3$，$b = 1$。],),
      explanation: [
        切点在切线上，故 $f(0) = b = 1$。#linebreak()
        $f'(x) = (x + 1)e^x + a$，由切线斜率得 $f'(0) = 1 + a = -2$。#linebreak()
        $therefore a = -3$，$b = 1$，即 $f(x) = x e^x - 3x + 1$。
      ],
    ),
    subquestion(
      stem: [当 $x > 0$ 时，$f(x + m) - f(x) > m$，求 $m$ 的取值范围；],
      answers: ([$[2 ln 2, +infinity)$],),
      explanation: [
        令 $g(x) = f(x + m) - f(x) - m = (x + m)e^(x + m) - x e^x - 4m$。#linebreak()
        题意为对一切 $x > 0$，均有 $g(x) > 0$。
        #step[排除 $m <= 0$][
          当 $m = 0$ 时，$g(x) = 0$，不满足严格不等式。#linebreak()
          当 $m < 0$ 时，
          $ g(x) = e^x ((e^m - 1)x + m e^m) - 4m. $
          $because e^m - 1 < 0$，当 $x$ 趋于正无穷时 $g(x)$ 趋于负无穷，也不满足条件。
        ]
        #step[讨论 $m > 0$][
          求导得
          $ g'(x) = e^x ((x + 1)(e^m - 1) + m e^m) > 0 quad (x >= 0). $
          故 $g$ 在 $[0, +infinity)$ 严格递增。#linebreak()
          若 $g(0) < 0$，由连续性，充分小的正数 $x$ 仍有 $g(x) < 0$；#linebreak()
          若 $g(0) >= 0$，则所有 $x > 0$ 均有 $g(x) > g(0) >= 0$。#linebreak()
          因而充要条件是 $g(0) = m(e^m - 4) >= 0$，即 $m >= ln 4 = 2 ln 2$。#linebreak()
          综上，$m in [2 ln 2, +infinity)$。端点可取，因为题目只要求 $x > 0$。
        ]
      ],
    ),
    subquestion(
      stem: [当 $x > 0$ 时，$f(k + x) + f(k - x) > 2f(k)$，求 $k$ 的最小值。],
      answers: ([$-2$],),
      explanation: [
        令 $F(x) = f(k + x) + f(k - x) - 2f(k)$，则
        $ F(x) = e^k (k(e^x + e^(-x) - 2) + x(e^x - e^(-x))). $
        $F(0) = F'(0) = 0$，且
        $ F''(x) = e^k ((k + 2)(e^x + e^(-x)) + x(e^x - e^(-x))). $
        #step[证明 $k >= -2$ 时恒成立][
          当 $k >= -2$、$x > 0$ 时，第一项非负，第二项严格为正，故 $F''(x) > 0$。#linebreak()
          $therefore F'(x) > F'(0) = 0$，进而 $F(x) > F(0) = 0$。#linebreak()
          特别地，$k = -2$ 时仍满足严格不等式。
        ]
        #step[排除 $k < -2$][
          此时 $F''(0) = 2e^k (k + 2) < 0$。#linebreak()
          由 $F''$ 的连续性，存在 $delta > 0$，使 $0 < x < delta$ 时 $F''(x) < 0$。#linebreak()
          从而该区间内 $F'(x) < F'(0) = 0$，继而 $F(x) < F(0) = 0$，与题意矛盾。#linebreak()
          综上，符合条件的 $k >= -2$，最小值为 $-2$。
        ]
      ],
    ),
  ),
)
