#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "浙江卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020浙江.pdf",
  regions: ("浙江",),
)

#let function-choice(index) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  let f(x) = {
    let t = if index >= 2 { calc.abs(x) } else { x }
    let y = t * calc.cos(t * 1rad) + calc.sin(t * 1rad)
    if calc.rem(index, 2) == 0 { y } else { -y }
  }
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: move(
      dx: if index == 0 { 12pt } else { 0pt },
      dy: if index == 3 { -14pt } else { 0pt },
    )[$O$],
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
    x: (tick: (label: (anchor: "south", offset: 0.08))),
  ))
  plot.plot(
    size: (4.2, 3.3),
    axis-style: "school-book",
    x-min: -3.8,
    x-max: 3.8,
    y-min: -3.6,
    y-max: 3.6,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (
      (-calc.pi, move(dy: if f(-calc.pi) < 0 { -12pt } else { 6pt })[$-pi$]),
      (calc.pi, move(dy: if f(calc.pi) < 0 { -12pt } else { 6pt })[$pi$]),
    ),
    {
      for domain in ((-calc.pi, 0), (0, calc.pi)) {
        plot.add(f, domain: domain, samples: 100, style: (
          stroke: (paint: black, thickness: figure-style.thickness),
        ))
      }
      plot.annotate({
        for x in (-calc.pi, calc.pi) {
          line((x, 0), (x, f(x)), stroke: (dash: figure-style.dash))
        }
      })
    },
  )
})
#let three-views() = cetz.canvas(length: 11mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  line((0, 0), (2, 0), (2, 2), (1, 3), (0, 2), close: true)
  line((0, 2), (2, 2))
  line((1, 0), (1, 3))
  line((3, 0), (4, 0), (4, 2), (3, 3), close: true)
  line((3, 2), (4, 2))
  line((0, -1.1), (2, -1.1), (1, -2.1), close: true)
  line((1, -1.1), (1, -2.1))
  for (a, b, p, label) in (
    ((0, -0.2), (1, -0.2), (0.5, -0.2), $1$),
    ((1, -0.2), (2, -0.2), (1.5, -0.2), $1$),
    ((3, -0.2), (4, -0.2), (3.5, -0.2), $1$),
    ((2.2, 0), (2.2, 2), (2.2, 1), $2$),
    ((2.2, 2), (2.2, 3), (2.2, 2.5), $1$),
  ) {
    line(a, b, mark: (start: ">", end: ">"))
    content(p, label, frame: "rect", fill: white, stroke: none, padding: 1pt)
  }
  content((1, -0.55), [正视图], anchor: "north")
  content((3.5, -0.55), [侧视图], anchor: "north")
  content((1, -2.25), [俯视图], anchor: "north")
})
#let frustum-diagram() = cetz.canvas(length: 25mm, {
  import cetz.draw: *
  let a = (0, -0.5, 0)
  let b = (0.5, 0.5, 0)
  let c = (0, 1, 0)
  let d = (0, 0, 1)
  let e = (0.25, 0.5, 1)
  let f = (0, 0.75, 1)
  oblique-project((0, -1.4), (1, 0), (0, 1.1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, f, d, a)
    line(d, e, f)
    line(e, b, d)
    line(a, c, d, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (e, $E$, "west"),
      (f, $F$, "south-west"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let conic-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  let p = calc.sqrt(10) / 40
  let a = (2 * calc.sqrt(10) / 5, calc.sqrt(5) / 5)
  let m = (calc.sqrt(10) / 10, -calc.sqrt(5) / 10)
  let b = (-calc.sqrt(10) / 5, -2 * calc.sqrt(5) / 5)
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: $O$,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (6, 4.5),
    axis-style: "school-book",
    x-min: -1.9,
    x-max: 1.9,
    y-min: -1.425,
    y-max: 1.425,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.add(
        range(0, 361).map(t => (
          calc.sqrt(2) * calc.cos(t * 1deg),
          calc.sin(t * 1deg),
        )),
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.add(
        range(-100, 101).map(i => {
          let y = i * 0.005
          (y * y / (2 * p), y)
        }),
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.annotate({
        line(b, a)
        for (pt, label, anchor) in (
          (a, $A$, "south-west"),
          (b, $B$, "north-east"),
          (m, $M$, "north-west"),
        ) {
          content(pt, label, anchor: anchor, padding: 3pt)
        }
      })
    },
  )
})

#section[选择题：本大题共 10 小题，每小题 4 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]

#question(
  "single-choice",
  score: 4,
  stem: [已知集合 $P = {x | 1 < x < 4}$，$Q = {x | 2 < x < 3}$，则 $P inter Q =$ #choice-placeholder()。],
  choices: (
    [${x | 1 < x <= 2}$],
    [${x | 2 < x < 3}$],
    [${x | 3 <= x < 4}$],
    [${x | 1 < x < 4}$],
  ),
  answers: ([B],),
  explanation: [∵ $Q subset P$，∴ $P inter Q = Q = {x | 2 < x < 3}$。],
)

#question(
  "single-choice",
  score: 4,
  stem: [已知 $a in RR$，若 $a - 1 + (a - 2)i$（$i$ 为虚数单位）是实数，则 $a =$ #choice-placeholder()。],
  choices: ([1], [$-1$], [2], [$-2$]),
  answers: ([C],),
  explanation: [复数为实数当且仅当虚部为 $0$，即 $a - 2 = 0$，得 $a = 2$。],
)

#question(
  "single-choice",
  score: 4,
  stem: [若实数 $x, y$ 满足约束条件 $cases(x - 3y + 1 <= 0, x + y - 3 >= 0)$，则 $z = x + 2y$ 的取值范围是 #choice-placeholder()。],
  choices: (
    [$(-infinity,4]$],
    [$[4,+infinity)$],
    [$[5,+infinity)$],
    [$(-infinity,+infinity)$],
  ),
  answers: ([B],),
  explanation: [由 $3y - x >= 1$，$x + y >= 3$，得 $ z = 1/4 (3y-x) + 5/4 (x+y) >= 1/4 + 15/4 = 4. $ 取 $x = 2$，$y >= 1$，约束均成立，且 $z = 2 + 2y$ 遍取 $[4,+infinity)$。],
)

#question(
  "single-choice",
  score: 4,
  stem: [函数 $y = x cos x + sin x$ 在区间 $[-pi,+pi]$ 的图象大致为 #choice-placeholder()。],
  choices: (
    [#figure(function-choice(0))],
    [#figure(function-choice(1))],
    [#figure(function-choice(2))],
    [#figure(function-choice(3))],
  ),
  answers: ([A],),
  explanation: [$f(-x) = -x cos x - sin x = -f(x)$，故函数为奇函数，排除 C、D。又 $f(pi) = -pi < 0$，排除 B，故选 A。],
)

#question(
  "single-choice",
  score: 4,
  stem: [某几何体的三视图（单位：cm）如图所示，则该几何体的体积（单位：$"cm"^3$）是 #choice-placeholder()。#figure(three-views())],
  choices: ([$7/3$], [$14/3$], [3], [6]),
  answers: ([A],),
  explanation: [该几何体由下部三棱柱与上部三棱锥组成，两者的底面面积均为 $1/2 times 2 times 1 = 1$，高分别为 $2$、$1$。故体积为 $ V = 1 times 2 + 1/3 times 1 times 1 = 7/3. $],
)

#question(
  "single-choice",
  score: 4,
  stem: [已知空间中不过同一点的三条直线 $m, n, l$，则“$m, n, l$ 在同一平面”是“$m, n, l$ 两两相交”的 #choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([B],),
  explanation: [同一平面内三条直线可能互相平行，故不充分。反之，若三条直线两两相交且不共点，$m, n$ 确定一个平面，$l$ 与它们的两个不同交点均在该平面内，故 $l$ 也在该平面内。因此是必要不充分条件。],
)

#question(
  "single-choice",
  score: 4,
  stem: [已知等差数列 ${a_n}$ 的前 $n$ 项和为 $S_n$，公差 $d != 0$，$a_1/d <= 1$。记 $b_1 = S_2$，$b_(n+1) = S_(2n+2) - S_(2n)$，$n in NN^*$，下列等式不可能成立的是 #choice-placeholder()。],
  choices: (
    [$2a_4 = a_2 + a_6$],
    [$2b_4 = b_2 + b_6$],
    [$a_4^2 = a_2 a_8$],
    [$b_4^2 = b_2 b_8$],
  ),
  answers: ([D],),
  explanation: [#step[选项 A、B][
      $a_n = a_1 + (n-1)d$，$b_n = a_(2n-1) + a_(2n) = 2a_1 + (4n-3)d$，两数列均为等差数列，故 A、B 恒成立。
    ]
    #step[选项 C][
      $a_4^2 - a_2 a_8 = 2d^2(1 - a_1/d)$，取 $a_1 = d != 0$ 时等于 $0$，故可能成立。
    ]
    #step[选项 D][
      $b_4^2 - b_2 b_8 = 8d^2(3 - 2a_1/d) >= 8d^2 > 0$，故不可能成立。
    ]],
)

#question(
  "single-choice",
  score: 4,
  stem: [已知点 $O(0,0)$，$A(-2,0)$，$B(2,0)$。设点 $P$ 满足 $|P A| - |P B| = 2$，且 $P$ 为函数 $y = 3sqrt(4-x^2)$ 图象上的点，则 $|O P| =$ #choice-placeholder()。],
  choices: ([$sqrt(22)/2$], [$(4sqrt(10))/5$], [$sqrt(7)$], [$sqrt(10)$]),
  answers: ([D],),
  explanation: [由双曲线定义，$P$ 在双曲线 $x^2 - y^2/3 = 1$ 的右支上。又 $y^2 = 9(4-x^2)$，联立得 $x^2 = 13/4$，$y^2 = 27/4$，故 $|O P| = sqrt(x^2+y^2) = sqrt(10)$。],
)

#question(
  "single-choice",
  score: 4,
  stem: [已知 $a, b in RR$ 且 $a b != 0$，若 $(x-a)(x-b)(x-2a-b) >= 0$ 在 $x >= 0$ 上恒成立，则 #choice-placeholder()。],
  choices: ([$a < 0$], [$a > 0$], [$b < 0$], [$b > 0$]),
  answers: ([C],),
  explanation: [若 $b > 0$，当 $a > 0$ 时，取 $x = 0$，三个因子均为负，矛盾；当 $a < 0$ 时，$2a+b < b$，在 $max(0, 2a+b) < x < b$ 内，前后两个因子为正，中间因子为负，仍矛盾。因此必有 $b < 0$。
    取 $(a,b) = (-1,-1)$ 或 $(1,-1)$ 均满足恒成立，故 $a$ 的符号不确定。],
)

#question(
  "single-choice",
  score: 4,
  stem: [设集合 $S, T$，$S subset.eq NN^*$，$T subset.eq NN^*$，$S, T$ 中至少有两个元素，且 $S, T$ 满足：\
    ① 对于任意 $x, y in S$，若 $x != y$，都有 $x y in T$；\
    ② 对于任意 $x, y in T$，若 $x < y$，则 $y/x in S$。\
    下列命题正确的是 #choice-placeholder()。],
  choices: (
    [若 $S$ 有 4 个元素，则 $S union T$ 有 7 个元素],
    [若 $S$ 有 4 个元素，则 $S union T$ 有 6 个元素],
    [若 $S$ 有 3 个元素，则 $S union T$ 有 4 个元素],
    [若 $S$ 有 3 个元素，则 $S union T$ 有 5 个元素],
  ),
  answers: ([A],),
  explanation: [#step[由乘积推出商的封闭性][
      当 $S$ 至少有三个元素时，对 $u < v$（$u,v in S$）选不同于它们的 $w in S$，由 $u w,v w in T$ 得 $v/u in S$。
    ]
    #step[证明选项 A][
      设 $S = {p_1,p_2,p_3,p_4}$，$p_1 < p_2 < p_3 < p_4$。
      若 $p_1 = 1$，则 $1 < p_3/p_2 < p_3$，故 $p_3/p_2 = p_2$；又 $1 < p_4/p_3 < p_4/p_2 < p_4$，两商依次为 $p_2,p_3$。令 $r = p_2$，得 $S = {1,r,r^2,r^3}$。但 $r,r^5 in T$，会推出 $r^4 in S$，矛盾。
    ]
    #step[确定四元素集合][
      故 $p_1 > 1$。由 $1 < p_2/p_1 < p_2$ 得 $p_2 = p_1^2$；由 $p_1 < p_3/p_1 < p_3$ 得 $p_3 = p_1^3$；而 $p_4/p_3,p_4/p_2,p_4/p_1$ 是 $S$ 中小于 $p_4$ 的三个不同元素，故 $p_4/p_3 = p_1$，得 $p_4 = p_1^4$。
    ]
    #step[确定并集][
      令 $r = p_1$，由①得 ${r^3,r^4,r^5,r^6,r^7} subset.eq T$。若 $t in T$，由②及 $max S = r^4$，必有 $r^3 <= t <= r^7$；当 $t > r^3$ 时，再由 $t/r^3 in S$ 得 $t in {r^4,r^5,r^6,r^7}$。
      ∴ $T = {r^3,r^4,r^5,r^6,r^7}$，$S union T = {r,r^2,dots,r^7}$ 恰有 7 个元素。
    ]
    #step[排除其余选项][
      取 $S = {2,4,8,16}$，$T = {8,16,32,64,128}$，符合条件，并集有 7 个元素，排除 B。\
      取 $S = {2,4,8}$，$T = {8,16,32}$，符合条件，并集有 5 个元素，排除 C。\
      取 $S = {1,2,4}$，$T = {2,4,8}$，符合条件，并集有 4 个元素，排除 D。
    ]],
)

#section[填空题：本大题共 7 小题，共 36 分。多空题每小题 6 分，单空题每小题 4 分。]

#question(
  "fill-in",
  score: 4,
  stem: [我国古代数学家杨辉、朱世杰等研究过高阶等差数列的求和问题，如数列 ${ (n(n+1))/2 }$ 就是二阶等差数列。数列 ${ (n(n+1))/2 }$（$n in NN^*$）的前 3 项和是 #fill-placeholder()。],
  answers: ([10],),
  explanation: [前三项依次为 $1$、$3$、$6$，故前 3 项和为 $1 + 3 + 6 = 10$。],
)

#question(
  "fill-in",
  score: 6,
  stem: [设 $(1+2x)^5 = a_1 + a_2 x + a_3 x^2 + a_4 x^3 + a_5 x^4 + a_6 x^5$，则 $a_5 =$ #fill-placeholder()；$a_1 + a_2 + a_3 =$ #fill-placeholder()。],
  answers: ([80], [51]),
  explanation: [由二项式定理，$a_5 = upright(C)_5^4 2^4 = 80$；$a_1 + a_2 + a_3 = 1 + upright(C)_5^1 2 + upright(C)_5^2 2^2 = 51$。],
)

#question(
  "fill-in",
  score: 6,
  stem: [已知 $tan theta = 2$，则 $cos 2theta =$ #fill-placeholder()；$tan(theta - pi/4) =$ #fill-placeholder()。],
  answers: ([$-3/5$], [$1/3$]),
  explanation: [$ cos 2theta = (1-tan^2 theta)/(1+tan^2 theta) = -3/5, $ $
      tan(theta-pi/4) = (tan theta-1)/(1+tan theta) = 1/3.
    $],
)

#question(
  "fill-in",
  score: 4,
  stem: [已知圆锥的侧面积（单位：$"cm"^2$）为 $2 pi$，且它的侧面展开图是一个半圆，则这个圆锥的底面半径（单位：cm）是 #fill-placeholder()。],
  answers: ([1],),
  explanation: [设母线长为 $l$，底面半径为 $r$。半圆面积 $1/2 pi l^2 = 2 pi$，得 $l = 2$；又弧长等于底面周长，$pi l = 2 pi r$，得 $r = 1$。],
)

#question(
  "fill-in",
  score: 6,
  stem: [设直线 $l: y = k x + b$（$k > 0$），圆 $C_1: x^2+y^2 = 1$，$C_2: (x-4)^2+y^2 = 1$。若直线 $l$ 与 $C_1, C_2$ 都相切，则 $k =$ #fill-placeholder()；$b =$ #fill-placeholder()。],
  answers: ([$sqrt(3)/3$], [$-(2sqrt(3))/3$]),
  explanation: [两个圆心到直线的距离均为 $1$，故 $ b^2 = k^2 + 1, quad (4k+b)^2 = k^2 + 1. $ 相减得 $8k(2k+b) = 0$。∵ $k > 0$，∴ $b = -2k$，再代入得 $3k^2 = 1$，故 $k = sqrt(3)/3$，$b = -(2sqrt(3))/3$。],
)

#question(
  "fill-in",
  score: 6,
  stem: [盒子里有 4 个球，其中 1 个红球、1 个绿球、2 个黄球。从盒中随机取球，每次取 1 个，不放回，直到取出红球为止。设此过程中取到黄球的个数为 $xi$，则 $P(xi = 0) =$ #fill-placeholder()；$E(xi) =$ #fill-placeholder()。],
  answers: ([$1/3$], [1]),
  explanation: [忽略绿球，只看红球与两个黄球的先后顺序。红球在这三个球中处于第一、第二、第三个位置的概率均为 $1/3$，对应 $xi = 0,1,2$。故 $P(xi=0)=1/3$，$E(xi) = (0+1+2)/3 = 1$。],
)

#question(
  "fill-in",
  score: 4,
  stem: [设 $bold(e)_1, bold(e)_2$ 为单位向量，满足 $|2bold(e)_1-bold(e)_2| <= sqrt(2)$，$bold(a) = bold(e)_1+bold(e)_2$，$bold(b) = 3bold(e)_1+bold(e)_2$。设 $bold(a), bold(b)$ 的夹角为 $theta$，则 $cos^2 theta$ 的最小值为 #fill-placeholder()。],
  answers: ([$28/29$],),
  explanation: [令 $t = bold(e)_1 dot bold(e)_2$。由 $5 - 4t <= 2$，得 $3/4 <= t <= 1$，且 $ cos^2 theta = (4+4t)^2/((2+2t)(10+6t)) = (4(1+t))/(5+3t) = 4/3 (1 - 2/(5+3t)). $ 此式随 $t$ 增大而增大，在 $t = 3/4$ 时取最小值 $28/29$；单位向量夹角的余弦可取 $3/4$，故等号可达。],
)

#section[解答题：本大题共 5 小题，共 74 分。解答应写出文字说明、证明过程或演算步骤。]

#question(
  "solution",
  score: 14,
  stem: [在锐角 $triangle A B C$ 中，角 $A, B, C$ 的对边分别为 $a, b, c$，且 $2b sin A = sqrt(3)a$。],
  parts: (
    subquestion(
      stem: [求角 $B$。],
      answers: ([$pi/3$],),
      explanation: [由正弦定理，$2 sin B sin A = sqrt(3) sin A$，∵ $sin A > 0$，∴ $sin B = sqrt(3)/2$。又 $B$ 为锐角，故 $B = pi/3$。],
    ),
    subquestion(
      stem: [求 $cos A + cos B + cos C$ 的取值范围。],
      answers: ([$((sqrt(3)+1)/2,3/2]$],),
      explanation: [∵ $A+C = 2pi/3$ 且 $A,C$ 均为锐角，∴ $pi/6 < A < pi/2$，故 $-pi/6 < (A-C)/2 < pi/6$。于是 $ cos A + cos B + cos C = 2 cos((A+C)/2) cos((A-C)/2) + 1/2 = cos((A-C)/2) + 1/2. $ ∴ 取值范围为 $((sqrt(3)+1)/2,3/2]$；当 $A = C = pi/3$ 时取到上端点。],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [如图，三棱台 $D E F - A B C$ 中，平面 $A D F C perp$ 平面 $A B C$，$angle A C B = angle A C D = 45 degree$，$D C = 2 B C$。#figure(frustum-diagram())],
  parts: (
    subquestion(
      stem: [证明：$E F perp D B$。],
      answers: ([证明见解析。],),
      explanation: [作 $D H perp A C$，垂足为 $H$。由面面垂直得 $D H perp$ 平面 $A B C$。取 $H C$ 为单位长，以 $H$ 为原点，平面 $A B C$ 内垂直于 $H C$ 且指向 $B$ 所在一侧的方向为 $x$ 轴正方向，$H C$、$H D$ 的方向分别为 $y$、$z$ 轴正方向。由两个 $45 degree$ 角及 $D C = 2 B C$，得 $ D = (0,0,1), quad C = (0,1,0), quad B = (1/2,1/2,0). $ 因此 $ arrow(B D) = (-1/2,-1/2,1), quad arrow(B C) = (-1/2,1/2,0), $ 两向量数量积为 $0$，故 $B D perp B C$。又棱台中 $E F parallel B C$，∴ $E F perp D B$。],
    ),
    subquestion(
      stem: [求 $D F$ 与平面 $D B C$ 所成角的正弦值。],
      answers: ([$sqrt(3)/3$],),
      explanation: [由上一问的坐标，可取平面 $D B C$ 的一个法向量为 $bold(n) = (1,1,1)$。∵ $D F parallel A C$，∴ 直线 $D F$ 的方向向量可取 $bold(v) = (0,1,0)$。所求角 $alpha$ 满足 $ sin alpha = (|bold(v) dot bold(n)|)/(|bold(v)| |bold(n)|) = 1/sqrt(3) = sqrt(3)/3. $],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [已知数列 ${a_n}$，${b_n}$，${c_n}$ 中，$a_1 = b_1 = c_1 = 1$，$c_n = a_(n+1)-a_n$，$c_(n+1) = b_n/b_(n+2) dot c_n$，$n in NN^*$。],
  parts: (
    subquestion(
      stem: [若数列 ${b_n}$ 为等比数列，且公比 $q > 0$，且 $b_1 + b_2 = 6b_3$，求 $q$ 与 ${a_n}$ 的通项公式。],
      answers: ([$q = 1/2$，$a_n = (4^(n-1)+2)/3$],),
      explanation: [由 $1 + q = 6q^2$ 及 $q > 0$，得 $q = 1/2$。于是 $c_(n+1) = q^(-2)c_n = 4c_n$，结合 $c_1 = 1$ 得 $c_n = 4^(n-1)$。累加得 $ a_n = a_1 + sum_(j=1)^(n-1)c_j = 1 + (4^(n-1)-1)/3 = (4^(n-1)+2)/3, $ 此式在 $n = 1$ 时也成立。],
    ),
    subquestion(
      stem: [若数列 ${b_n}$ 为等差数列，且公差 $d > 0$，证明：$c_1+c_2+dots+c_n < 1+1/d$，$n in NN^*$。],
      answers: ([证明见解析。],),
      explanation: [由 $b_n = 1+(n-1)d > 0$，累乘递推式可得 $ c_n = (b_1 b_2)/(b_n b_(n+1)) = (1+d)/(b_n b_(n+1)) = (1+1/d)(1/b_n-1/b_(n+1)). $ 此式对 $n = 1$ 也成立。故 $ sum_(j=1)^n c_j = (1+1/d)(1-1/b_(n+1)) < 1+1/d. $],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [如图，已知椭圆 $C_1: x^2/2+y^2 = 1$，抛物线 $C_2: y^2 = 2p x$（$p > 0$），点 $A$ 是椭圆 $C_1$ 与抛物线 $C_2$ 的交点，过点 $A$ 的直线 $l$ 交椭圆 $C_1$ 于点 $B$，交抛物线 $C_2$ 于 $M$（$B, M$ 不同于 $A$）。#figure(conic-diagram())],
  parts: (
    subquestion(
      stem: [若 $p = 1/16$，求抛物线 $C_2$ 的焦点坐标。],
      answers: ([$(1/32,0)$],),
      explanation: [抛物线 $y^2 = 2p x$ 的焦点为 $(p/2,0)$，代入得 $(1/32,0)$。],
    ),
    subquestion(
      stem: [若存在不过原点的直线 $l$ 使 $M$ 为线段 $A B$ 的中点，求 $p$ 的最大值。],
      answers: ([$sqrt(10)/40$],),
      explanation: [#step[用中点和交点关系消元][
          水平直线与抛物线只有一个交点，不合题意。故可设 $l: x = m y + t$，其中 $t != 0$。若 $m = 0$，椭圆弦的中点为 $(t,0)$，在抛物线上则 $t = 0$，矛盾，故 $m != 0$。
          设 $A = (x_A,y_A)$，$M = (x_M,y_M)$。直线代入椭圆得
          $ (m^2+2)y^2 + 2m t y + t^2 - 2 = 0, $
          由中点关系得 $y_M = -(m t)/(m^2+2)$。
          直线代入抛物线得 $y^2 - 2p m y - 2p t = 0$，故 $y_A y_M = -2p t$，从而
          $ y_A = (2p(m^2+2))/m, quad x_A = y_A^2/(2p) = 2p(m+2/m)^2. $
        ]
        #step[求上界并验证取等][
          令 $u = (m+2/m)^2 = m^2+4+4/m^2 >= 8$。由 $A$ 在椭圆上，得
          $ 1 = x_A^2/2+y_A^2 = p^2(2u^2+4u) >= 160p^2. $
          故 $p <= sqrt(10)/40$。
          取 $p = sqrt(10)/40$，直线 $x = sqrt(2)y + sqrt(10)/5$，则
          $ A = ((2sqrt(10))/5,sqrt(5)/5), quad M = (sqrt(10)/10,-sqrt(5)/10), $
          $ B = (-sqrt(10)/5,-(2sqrt(5))/5). $
          直接代入可知 $A,B$ 在椭圆上，$A,M$ 在抛物线上，三点共线且 $M = (A+B)/2$；它们互异，直线不过原点。因此最大值为 $sqrt(10)/40$。
        ]],
    ),
  ),
)

#question(
  "solution",
  score: 15,
  stem: [已知 $1 < a <= 2$，函数 $f(x) = e^x - x - a$，其中 $e = 2.71828 dots$ 为自然对数的底数。],
  parts: (
    subquestion(
      stem: [证明：函数 $y = f(x)$ 在 $(0,+infinity)$ 上有唯一零点。],
      answers: ([证明见解析。],),
      explanation: [$f'(x) = e^x-1 > 0$（$x > 0$），故 $f$ 在 $(0,+infinity)$ 上严格递增。又 $f(0) = 1-a < 0$，$f(2) = e^2-2-a >= e^2-4 > 0$，由连续性及零点存在定理，$f$ 在 $(0,2)$ 内有零点，结合严格单调性知该正零点唯一。],
    ),
    subquestion(
      stem: [记 $x_0$ 为函数 $y = f(x)$ 在 $(0,+infinity)$ 上的零点，证明：],
      parts: (
        subquestion(
          stem: [$sqrt(a-1) <= x_0 <= sqrt(2(a-1))$。],
          answers: ([证明见解析。],),
          explanation: [#step[证明上界][
              由 $f(x_0) = 0$，得 $a-1 = e^(x_0)-x_0-1$。
              令 $H(x) = e^x-1-x-x^2/2$。$x > 0$ 时，$H''(x) = e^x-1 > 0$，且 $H'(0) = H(0) = 0$，故 $H(x) > 0$。于是 $a-1 >= x_0^2/2$，即 $x_0 <= sqrt(2(a-1))$。
            ]
            #step[证明下界][
              若 $x_0 >= 1$，由 $a <= 2$ 直接得 $sqrt(a-1) <= 1 <= x_0$。
              若 $0 < x_0 < 1$，令 $G(x) = e^x-1-x-x^2$。有 $G'(x) = e^x-1-2x$，$G''(x) = e^x-2$，故 $G'$ 在 $(0,ln 2)$ 上递减，在 $(ln 2,1)$ 上递增。又 $G'(0) = 0$，$G'(1) = e-3 < 0$，∴ $G'(x) < 0$（$0 < x < 1$）。由 $G(0) = 0$ 得 $G(x_0) < 0$，即 $a-1 < x_0^2$。
              综上，所求两侧不等式均成立。
            ]],
        ),
        subquestion(
          stem: [$x_0 f(e^(x_0)) >= (e-1)(a-1)a$。],
          answers: ([证明见解析。],),
          explanation: [#step[利用零点等式][
              记 $s = a-1 in (0,1]$。由上一小问，$x_0^2 >= s$，且 $x_0 >= sqrt(s) >= s$。
              由 $e^(x_0) = x_0+a$，得
              $ x_0 f(e^(x_0)) = x_0 f(x_0+a) = (e^a-1)x_0^2 + a(e^a-2)x_0. $
              两项系数均为正，故
              $ x_0 f(e^(x_0)) >= s[(e^a-1)+a(e^a-2)]. $
            ]
            #step[估计剩余的系数][
              由函数 $e^t-e t$ 在 $t = 1$ 处取得最小值 $0$，得 $e^a >= e a$。于是
              $ (e^a-1)+a(e^a-2)-(e-1)a >= e a^2-a-1. $
              又 $a > 1$，故 $e a^2-a-1 = (a-1)(e(a+1)-1)+e-2 > 0$。
              乘以 $s = a-1 > 0$，结合上式即得结论。
            ]],
        ),
      ),
    ),
  ),
)
