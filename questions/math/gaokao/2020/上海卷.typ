#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2020/2020上海.pdf",
  regions: ("上海",),
)

#let cube-diagram() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (2, 2, 0)
  let d = (0, 2, 0)
  let a1 = (0, 0, 2)
  let b1 = (2, 0, 2)
  let c1 = (2, 2, 2)
  let d1 = (0, 2, 2)
  oblique-project((1, 0), (0.35, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(a1, c, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "south-east"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south-east"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let cylinder-diagram() = cetz.canvas(length: 19mm, {
  import cetz.draw: *
  let a = (-1, 0, 1)
  let b = (0, 0, 1)
  let c = (0, 0, 0)
  let d = (-1, 0, 0)
  let a1 = (0, -1, 1)
  let d1 = (0, -1, 0)
  let angle = calc.atan(0.45)
  let arc-points(start, end, z) = range(0, 101).map(i => {
    let t = start + (end - start) * i / 100
    (calc.cos(t), calc.sin(t), z)
  })
  oblique-project((1, 0), (0.45, 0.3), (0, 1.4), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(..arc-points(0deg, 360deg, 1))
    line(..arc-points(angle + 180deg, angle + 360deg, 0))
    line(..arc-points(angle, angle + 180deg, 0), stroke: (
      dash: figure-style.dash,
    ))
    for t in (angle, angle + 180deg) {
      line((calc.cos(t), calc.sin(t), 0), (calc.cos(t), calc.sin(t), 1))
    }
    line(a, b, a1, d1)
    line(a, d)
    line(d, c, b, stroke: (dash: figure-style.dash))
    line(c, d1, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "south-west"),
      (c, $C$, "south-west"),
      (d, $D$, "east"),
      (a1, $A_1$, "north-east"),
      (d1, $D_1$, "north"),
    ) {
      content(p, label, anchor: anchor, padding: if p == a or p == d {
        7pt
      } else { 3pt })
    }
  })
})
#let composite-curve() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  let b = 2
  let r = calc.sqrt(8)
  let xa = calc.sqrt(6)
  let ya = calc.sqrt(2)
  let alpha = calc.acos(xa / r)
  let style(dashed) = (
    stroke: (
      paint: black,
      thickness: figure-style.thickness,
      dash: if dashed { figure-style.dash } else { none },
    ),
  )
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: move(dx: -5pt)[$O$],
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (7, 7),
    axis-style: "school-book",
    x-min: -4.4,
    x-max: 4.4,
    y-min: -4.4,
    y-max: 4.4,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      for (start, end, dashed) in (
        (-alpha, alpha, false),
        (alpha, 180deg - alpha, true),
        (180deg - alpha, 180deg + alpha, false),
        (180deg + alpha, 360deg - alpha, true),
      ) {
        plot.add(
          range(0, 101).map(i => {
            let t = start + (end - start) * i / 100
            (r * calc.cos(t), r * calc.sin(t))
          }),
          style: style(dashed),
        )
      }
      for sign in (-1, 1) {
        for (low, high, dashed) in (
          (-3.6, -ya, false),
          (-ya, ya, true),
          (ya, 3.6, false),
        ) {
          plot.add(
            range(0, 101).map(i => {
              let y = low + (high - low) * i / 100
              (sign * 2 * calc.sqrt(1 + y * y / (b * b)), y)
            }),
            style: style(dashed),
          )
        }
        plot.add(x => sign * b * x / 2, domain: (-3.7, 3.7), style: style(true))
      }
      plot.annotate({
        content((xa, ya), $A$, anchor: "west", padding: 5pt)
      })
    },
  )
})

#section[填空题：本大题共 12 小题，第 1—6 题每小题 4 分，第 7—12 题每小题 5 分，共 54 分。]

#question(
  "fill-in",
  score: 4,
  stem: [若集合 $A = {1,2,4}$，$B = {2,4,5}$，则 $A inter B =$ #fill-placeholder()。],
  answers: ([${2,4}$],),
  explanation: [两集合的公共元素为 $2$、$4$，故 $A inter B = {2,4}$。],
)

#question(
  "fill-in",
  score: 4,
  stem: [计算：$lim_(n -> infinity) (n+1)/(3n-1) =$ #fill-placeholder()。],
  answers: ([$1/3$],),
  explanation: [分子、分母同除以 $n$，得 $ lim_(n -> infinity) (n+1)/(3n-1) = lim_(n -> infinity) (1+1/n)/(3-1/n) = 1/3. $],
)

#question(
  "fill-in",
  score: 4,
  stem: [若复数 $z = 1-2i$（其中 $i$ 为虚数单位），则 $|z| =$ #fill-placeholder()。],
  answers: ([$sqrt(5)$],),
  explanation: [$|z| = sqrt(1^2+(-2)^2) = sqrt(5)$。],
)

#question(
  "fill-in",
  score: 4,
  stem: [函数 $f(x) = x^3$ 的反函数为 #fill-placeholder()。],
  answers: ([$f^(-1)(x) = root(3, x)$（$x in RR$）],),
  explanation: [由 $y = x^3$ 得 $x = root(3, y)$，交换 $x,y$，得反函数 $f^(-1)(x) = root(3, x)$，定义域为 $RR$。],
)

#question(
  "fill-in",
  score: 4,
  stem: [若实数 $x,y$ 满足 $cases(x+y-2 >= 0, x+2y-3 <= 0, y >= 0)$，则 $z = y-2x$ 的最大值为 #fill-placeholder()。],
  answers: ([$-1$],),
  explanation: [由约束条件可得 $ z = 3(x+2y)-5(x+y) <= 3 dot 3 - 5 dot 2 = -1. $ 当 $(x,y) = (1,1)$ 时约束均成立且取等，故最大值为 $-1$。],
)

#question(
  "fill-in",
  score: 4,
  stem: [设 $a,b,c,d in RR$，若行列式 $mat(delim: "|", 1, a, b; 2, c, d; 3, 0, 0) = 6$，则行列式 $mat(delim: "|", a, b; c, d) =$ #fill-placeholder()。],
  answers: ([2],),
  explanation: [将三阶行列式按第三行展开，得 $3 mat(delim: "|", a, b; c, d) = 6$，故所求为 $2$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设 $a,b in RR$，若 $1,2,a,b$ 这四个数的中位数为 $3$，平均数为 $4$，则 $a b =$ #fill-placeholder()。],
  answers: ([36],),
  explanation: [不妨设 $a <= b$。若 $a <= 2$，则中间两数均不超过 $2$，与中位数为 $3$ 矛盾。故 $a > 2$，由 $(2+a)/2 = 3$ 得 $a = 4$；再由 $1+2+a+b = 16$ 得 $b = 9$，故 $a b = 36$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知公差不为 $0$ 的等差数列 ${a_n}$，其前 $n$ 项和为 $S_n$。若 $a_1+a_10 = a_9$，则 $S_9/a_10 =$ #fill-placeholder()。],
  answers: ([$27/8$],),
  explanation: [设公差为 $d != 0$，由 $2a_1+9d = a_1+8d$ 得 $a_1 = -d$。于是 $a_10 = 8d$，$S_9 = 9(2a_1+8d)/2 = 27d$，故 $S_9/a_10 = 27/8$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [从 6 人中选出 4 人去值班，每人值班一天，若第一天安排 1 人，第二天安排 1 人，第三天安排 2 人，则不同安排方法的种数为 #fill-placeholder()。（结果用数值表示）],
  answers: ([180],),
  explanation: [依次安排第一天、第二天的人选，再从剩余 4 人中选 2 人安排第三天，共 $6 times 5 times upright(C)_4^2 = 180$ 种。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知椭圆 $Gamma: x^2/4+y^2/3 = 1$ 的右焦点为 $F$，点 $P$ 位于第二象限且在 $Gamma$ 上，联结 $P F$ 并延长，交 $Gamma$ 于点 $Q(x_Q,y_Q)$。点 $Q'(x_(Q'),y_(Q'))$ 也在 $Gamma$ 上，且 $y_Q+y_(Q') = 0$。若 $F Q' perp F P$，则直线 $P Q$ 的方程为 #fill-placeholder()。],
  answers: ([$y = -x+1$],),
  explanation: [#step[确定对称方式][
      $F = (1,0)$。由 $P$ 在第二象限，直线 $P F$ 的斜率为负，且延长线上的 $Q$ 满足 $x_Q > 1$、$y_Q < 0$。椭圆方程及 $y_(Q') = -y_Q$ 给出 $x_(Q') = x_Q$ 或 $-x_Q$。
      若 $Q' = -Q$，则
      $ arrow(F Q) dot arrow(F Q') = 1 - x_Q^2 - y_Q^2 < 0, $
      其中椭圆上 $x_Q^2+y_Q^2 = 3+x_Q^2/4 >= 3$，与垂直矛盾。
    ]
    #step[求直线][
      故 $Q' = (x_Q,-y_Q)$。由垂直得 $(x_Q-1)^2-y_Q^2 = 0$，结合符号可知 $y_Q = -(x_Q-1)$。∴ 直线 $P Q$ 为 $y = -x+1$。
    ]],
)

#question(
  "fill-in",
  score: 5,
  stem: [设 $a in RR$，若存在定义域为 $RR$ 的函数 $f(x)$，既满足“对任意 $x_0 in RR$，$f(x_0)$ 的值为 $x_0^2$ 或 $x_0$”，又满足“关于 $x$ 的方程 $f(x) = a$ 无实数解”，则 $a$ 的取值范围是 #fill-placeholder()。],
  answers: ([$(-infinity,0) union (0,1) union (1,+infinity)$],),
  explanation: [由于 $f(0) = 0$，$f(1) = 1$ 恒成立，必须 $a != 0,1$。反之，任取 $a != 0,1$，构造 $ f(x) = cases(x & quad x != a, a^2 & quad x = a). $ 此函数处处取 $x$ 或 $x^2$，且 $a^2 != a$，故不会取到 $a$，充分性成立。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知 $bold(a)_1,bold(a)_2,bold(b)_1,bold(b)_2,dots,bold(b)_k$ 是平面内两两互不相等的向量。若 $|bold(a)_1-bold(a)_2| = 1$，且 $|bold(a)_i-bold(b)_j| in {1,2}$（其中 $i = 1,2$，$j = 1,2,dots,k$），则 $k$ 的最大值为 #fill-placeholder()。],
  answers: ([6],),
  explanation: [将向量的终点看作平面上的点，两个固定点的距离为 $1$。每个可选点必须同时位于以这两个固定点为圆心、半径分别为 $r_1,r_2 in {1,2}$ 的两圆上。\
    半径组合 $(1,1)$、$(2,2)$ 各有两个交点；组合 $(1,2)$、$(2,1)$ 均内切，各有一个交点。不同组合的交点不会重合，且均不等于固定点，故最多且可以取到 $2+2+1+1 = 6$ 个。],
)

#section[选择题：本大题共 4 小题，每小题 5 分，共 20 分。每小题只有一个正确选项。]

#question(
  "single-choice",
  score: 5,
  stem: [若 $a,b in RR$，则下列不等式中，恒成立的是 #choice-placeholder()。],
  choices: (
    [$a^2+b^2 <= 2a b$],
    [$a^2+b^2 >= -2a b$],
    [$a+b >= 2sqrt(|a b|)$],
    [$a+b >= -2sqrt(|a b|)$],
  ),
  answers: ([B],),
  explanation: [由 $(a+b)^2 >= 0$ 得 $a^2+b^2 >= -2a b$。A 可取 $a = 1,b = 0$ 排除；C、D 均可取 $a = -1,b = 0$ 排除。],
)

#question(
  "single-choice",
  score: 5,
  stem: [直线 $3x+4y+1 = 0$ 的一个参数方程可以为 #choice-placeholder()。],
  choices: (
    [$cases(x = 1+3t, y = -1+4t)$（$t$ 为参数）],
    [$cases(x = 1-3t, y = -1+4t)$（$t$ 为参数）],
    [$cases(x = 1-4t, y = -1-3t)$（$t$ 为参数）],
    [$cases(x = 1+4t, y = -1-3t)$（$t$ 为参数）],
  ),
  answers: ([D],),
  explanation: [点 $(1,-1)$ 在直线上，且方向向量 $(4,-3)$ 与法向量 $(3,4)$ 垂直，故 D 正确。其余三个方向向量与 $(3,4)$ 的数量积分别为 $25$、$7$、$-24$，均不为 $0$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [在如图所示的棱长为 10 的正方体 $A B C D - A_1 B_1 C_1 D_1$ 中，一条平行于 $A_1 C$ 的直线与正方体的表面交于 $P,Q$ 两点。其中 $P$ 在侧面 $A D D_1 A_1$ 上，且到 $A_1 D_1$ 的距离为 3，到 $A A_1$ 的距离为 2，则点 $Q$ 所在的面是 #choice-placeholder()。#figure(cube-diagram())],
  choices: ([$A B C D$], [$A B B_1 A_1$], [$B C C_1 B_1$], [$C D D_1 C_1$]),
  answers: ([A],),
  explanation: [以 $A$ 为原点，沿 $A B,A D,A A_1$ 建立坐标系。则 $P = (0,2,7)$，$arrow(A_1 C) = (10,10,-10)$。沿直线进入正方体的点可写成 $(t,2+t,7-t)$，需满足 $0 <= t <= 7$。当 $t = 7$ 时首先到达另一边界，得 $Q = (7,9,0)$，位于底面 $A B C D$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [对于定义在 $RR$ 上的函数 $y = f(x)$，考察以下性质：\
    $p$：存在非零实数 $a$，使得 $f(x+a) < f(x)+f(a)$ 对任意的 $x in RR$ 恒成立；\
    $q_1$：$y = f(x)$ 单调递减，且 $f(x)$ 恒大于 $0$；\
    $q_2$：$y = f(x)$ 单调递增，且存在 $x_0 < 0$，使得 $f(x_0) = 0$。\
    关于上述性质，以下判断正确的是 #choice-placeholder()。],
  choices: (
    [$q_1,q_2$ 都是 $p$ 的充分条件],
    [$q_1,q_2$ 中仅 $q_1$ 是 $p$ 的充分条件],
    [$q_1,q_2$ 中仅 $q_2$ 是 $p$ 的充分条件],
    [$q_1,q_2$ 都不是 $p$ 的充分条件],
  ),
  answers: ([A],),
  explanation: [#step[性质 $q_1$][
      取任意 $a > 0$，则 $f(x+a) < f(x) < f(x)+f(a)$，对所有实数 $x$ 成立，故 $q_1$ 充分。
    ]
    #step[性质 $q_2$][
      取 $a = x_0 < 0$，则 $f(x+a) < f(x) = f(x)+f(a)$，对所有实数 $x$ 成立，故 $q_2$ 也充分。
    ]],
)

#section[解答题：本大题共 5 小题，共 76 分。解答应写出文字说明、证明过程或演算步骤。]

#question(
  "solution",
  score: 14,
  stem: [如图所示，边长为 1 的正方形 $A B C D$ 绕 $B C$ 边旋转一周后形成一个圆柱。#figure(cylinder-diagram())],
  parts: (
    subquestion(
      stem: [求该圆柱的表面积 $S$。],
      answers: ([$4 pi$],),
      explanation: [圆柱的底面半径和高均为 $1$，故 $S = 2 pi r^2+2 pi r h = 4 pi$。],
    ),
    subquestion(
      stem: [正方形 $A B C D$ 绕 $B C$ 逆时针旋转 $pi/2$ 到 $A_1 B C D_1$，求 $A D_1$ 与平面 $A B C D$ 所成角的大小。（结果用反三角函数值表示）],
      answers: ([$arcsin(sqrt(3)/3)$],),
      explanation: [旋转后 $C D_1 perp$ 平面 $A B C D$，故 $A D_1$ 在该平面上的射影为 $A C$，所求角为 $angle D_1 A C$。由 $A C = sqrt(2)$、$C D_1 = 1$，得 $A D_1 = sqrt(3)$，故 $sin angle D_1 A C = sqrt(3)/3$，所求为 $arcsin(sqrt(3)/3)$。],
    ),
  ),
)

#question(
  "solution",
  score: 14,
  stem: [已知函数 $f(x) = sin omega x$（$omega > 0$）。],
  parts: (
    subquestion(
      stem: [若函数 $y = f(x)$ 的最小正周期为 $4 pi$，求 $omega$ 及此时 $f(x) = 1/2$ 的解集。],
      answers: (
        [$omega = 1/2$；${x | x = 4k pi+pi/3 "或" x = 4k pi+(5pi)/3,k in ZZ}$],
      ),
      explanation: [由 $2 pi/omega = 4 pi$ 得 $omega = 1/2$。方程化为 $sin(x/2) = 1/2$，故 $x/2 = 2k pi+pi/6$ 或 $2k pi+(5pi)/6$，即 $x = 4k pi+pi/3$ 或 $4k pi+(5pi)/3$，$k in ZZ$。],
    ),
    subquestion(
      stem: [若 $omega = 1$，设 $g(x) = f^2(x)+sqrt(3)f(-x) dot f(pi/2-x)$，$x in [0,pi/4]$，求函数 $y = g(x)$ 的值域。],
      answers: ([$[-1/2,0]$],),
      explanation: [$ g(x) = sin^2 x-sqrt(3)sin x cos x = 1/2-1/2 cos 2x-sqrt(3)/2 sin 2x = 1/2-sin(2x+pi/6). $ 当 $x in [0,pi/4]$ 时，$2x+pi/6 in [pi/6,(2pi)/3]$，其正弦值范围为 $[1/2,1]$。故 $g$ 的值域为 $[-1/2,0]$。],
    ),
  ),
)

#question(
  "solution",
  score: 14,
  stem: [在研究某市交通情况时，道路密度是指该路段上一定时间内通过的车辆数量除以时间，车辆密度是指该路段一定时间内通过的车辆数除以该路段的长度。现定义交通流量为 $v = q/x$，其中 $x$ 为道路密度，$q$ 为车辆密度。据调查某路段的交通流量有如下规律：$ v = cases(100-135(1/3)^(80/x) & quad 0 < x < 40, -k(x-40)+85 & quad 40 <= x <= 80), $ 其中 $k > 0$。],
  parts: (
    subquestion(
      stem: [当交通流量大于 95 时，求道路密度 $x$ 的取值范围。],
      answers: ([$(0,80/3)$],),
      explanation: [当 $40 <= x <= 80$ 时，$v <= 85$，不满足要求。当 $0 < x < 40$ 时，$v > 95$ 等价于 $ (1/3)^(80/x) < 1/27 = (1/3)^3, $ 即 $80/x > 3$，得 $0 < x < 80/3$。],
    ),
    subquestion(
      stem: [若道路密度 $x = 80$ 时，测得交通流量 $v = 50$，求车辆密度 $q$ 的最大值。],
      answers: ([$28800/7$（当 $x = 480/7$ 时取得）],),
      explanation: [由 $-40k+85 = 50$ 得 $k = 7/8$。当 $0 < x < 40$ 时，$q = x v < 100x < 4000$。当 $40 <= x <= 80$ 时，$ q = -7/8 x^2+120x = -7/8 (x-480/7)^2+28800/7. $ ∵ $480/7 in [40,80]$ 且 $28800/7 > 4000$，∴ $q$ 的最大值为 $28800/7$，在 $x = 480/7$ 时取得。],
    ),
  ),
)

#question(
  "solution",
  score: 16,
  stem: [设 $b > 0$。如图所示，在平面直角坐标系 $x O y$ 中，$A(x_A,y_A)$ 是双曲线 $C_1: x^2/4-y^2/b^2 = 1$ 和圆 $C_2: x^2+y^2 = 4+b^2$ 在第一象限内的交点。曲线 $Gamma$ 由 $C_1$ 中满足 $|x| >= x_A$ 的部分和 $C_2$ 中满足 $|x| >= x_A$ 的部分构成。#figure(composite-curve())],
  parts: (
    subquestion(
      stem: [若 $x_A = sqrt(6)$，求 $b$ 的值。],
      answers: ([2],),
      explanation: [由双曲线方程，$y_A^2 = b^2/2$；代入圆方程得 $6+b^2/2 = 4+b^2$，故 $b^2 = 4$。∵ $b > 0$，∴ $b = 2$。],
    ),
    subquestion(
      stem: [若 $b = sqrt(5)$，$F_1,F_2$ 分别为 $Gamma$ 与 $x$ 轴的左、右两个交点，第一象限内的点 $P$ 也在 $Gamma$ 上，且 $|P F_1| = 8$，求 $angle F_1 P F_2$ 的大小。],
      answers: ([$arccos(11/16)$],),
      explanation: [此时圆半径为 $3$，故 $F_1 = (-3,0)$、$F_2 = (3,0)$，恰为双曲线的两个焦点。若 $P$ 在圆上，则 $|P F_1| <= 6$，矛盾。故 $P$ 在双曲线的右支上，由焦点距离差得 $|P F_2| = 8-4 = 4$。余弦定理给出 $ cos angle F_1 P F_2 = (8^2+4^2-6^2)/(2 dot 8 dot 4) = 11/16. $ 所求角为 $arccos(11/16)$。],
    ),
    subquestion(
      stem: [过点 $S(0,b^2/2+2)$ 作斜率为 $-b/2$ 的直线 $l$。若 $l$ 与 $Gamma$ 恰有两个不同的公共点，记为 $M,N$，用 $b$ 表示 $arrow(O M) dot arrow(O N)$，并求当 $b$ 变化时，$arrow(O M) dot arrow(O N)$ 的取值范围。],
      answers: ([$b^2+4$；$(6+2sqrt(5),+infinity)$],),
      explanation: [#step[确定交点及数量积][
          直线方程为 $b x+2y = b^2+4$。原点到它的距离为 $sqrt(b^2+4)$，故直线与圆相切，切点为 $M = (b,2)$。
          代入双曲线方程，二次项消去，得到唯一交点 $N$，其横坐标为
          $ x_N = ((b^2+4)^2+4b^2)/(2b(b^2+4)) > 0. $
          因此有两个不同交点时，必分别是这个切点与双曲线交点。由 $O M perp M N$，得
          $
            arrow(O M) dot arrow(O N) = arrow(O M) dot (arrow(O M)+arrow(M N)) = |O M|^2 = b^2+4.
          $
        ]
        #step[确定参数范围][
          联立两曲线得 $x_A^2 = (8(b^2+2))/(b^2+4)$。切点属于 $Gamma$ 的条件为 $b >= x_A$，等价于
          $ b^4-4b^2-16 >= 0, quad b^2 >= 2+2sqrt(5). $
          等号成立时 $M = A = N$，只有一个交点，应排除。
          严格大于时，$M$ 不在双曲线上，故 $N != M$。切线上的其他点均在圆外，故 $|O N|^2 > b^2+4$；双曲线上 $x^2+y^2 = (1+b^2/4)x^2-b^2$，从而 $x_N > x_A$，所以 $N$ 也属于 $Gamma$，确有两个不同交点。
          因此恰有两个交点当且仅当 $b^2 > 2+2sqrt(5)$，所求数量积的取值范围为 $(6+2sqrt(5),+infinity)$。
        ]],
    ),
  ),
)

#question(
  "solution",
  score: 18,
  stem: [对于至少有三项的有穷实数数列 ${a_n}$，若 $|a_2-a_1| <= |a_3-a_1| <= dots <= |a_m-a_1|$（其中 $m$ 为 ${a_n}$ 的项数），则称其具有性质 $P$。],
  parts: (
    subquestion(
      stem: [分别判断数列 $3,2,5,1$ 与数列 $4,3,2,5,1$ 是否具有性质 $P$，并说明理由。],
      answers: ([前者具有性质 $P$，后者不具有性质 $P$。],),
      explanation: [前者各项与首项的距离依次为 $1,2,2$，不递减，故具有性质 $P$。后者各项与首项的距离依次为 $1,2,1,3$，其中 $2 > 1$，故不具有性质 $P$。],
    ),
    subquestion(
      stem: [已知首项为 1、公比为 $q$、项数为 10 的等比数列 ${a_n}$ 具有性质 $P$，求 $q$ 的取值范围。],
      answers: ([$(-infinity,-2] union (0,+infinity)$],),
      explanation: [#step[必要性][
          等比数列的公比 $q != 0$，且 $a_n = q^(n-1)$。由 $|q-1| <= |q^2-1|$，若 $q != 1$，约去 $|q-1|$ 得 $|q+1| >= 1$，即 $q <= -2$ 或 $q >= 0$。加上 $q = 1$ 并排除 $q = 0$，得到候选范围 $(-infinity,-2] union (0,+infinity)$。
        ]
        #step[充分性][
          当 $q > 0$ 时，无论 $0 < q < 1$、$q = 1$ 还是 $q > 1$，$|q^j-1|$ 均随正整数 $j$ 不减。
          当 $q = -t <= -2$ 时，$t >= 2$。若 $j$ 为奇数，相邻距离的差为
          $ |q^(j+1)-1|-|q^j-1| = t^j (t-1)-2 >= t(t-1)-2 >= 0; $
          若 $j$ 为偶数，差为 $t^j (t-1)+2 > 0$。故所列范围内均满足性质 $P$。
        ]],
    ),
    subquestion(
      stem: [给定正整数 $m >= 4$。设数列 ${a_n}$ 是 $1,2,dots,m$ 的一个排列，项数为 $m-1$ 的数列 ${b_n}$ 满足 $b_k = a_(k+1)$（$k = 1,2,dots,m-1$），且 ${a_n}$ 与 ${b_n}$ 都具有性质 $P$，求所有满足条件的数列 ${a_n}$。],
      answers: (
        [$1,2,3,dots,m$；$2,1,3,dots,m$；$m,m-1,m-2,dots,1$；$m-1,m,m-2,m-3,dots,1$。],
      ),
      explanation: [#step[首项为端点][
          若 $a_1 = 1$，性质 $P$ 强制剩余各项按大小递增排列，得到 $1,2,dots,m$；若 $a_1 = m$，同理得到 $m,m-1,dots,1$。去掉首项后仍满足性质 $P$。
        ]
        #step[首项位于内部][
          设 $a_1 = p$，$2 <= p <= m-1$。与 $p$ 距离最小的两个数为 $p-1,p+1$，故它们必须依次占据 $a_2,a_3$。
          若 $a_2 = p-1$，则 $a_3 = p+1$，两者距离为 $2$。若 $p >= 3$，数 $p-2$ 出现在后面，却与 $a_2$ 仅相距 $1$，违反 ${b_n}$ 的性质 $P$。故只能 $p = 2$，排列被确定为 $2,1,3,4,dots,m$。
          若 $a_2 = p+1$，则 $a_3 = p-1$。若 $p <= m-2$，后面的 $p+2$ 与 $a_2$ 仅相距 $1$，同样矛盾。故只能 $p = m-1$，得到 $m-1,m,m-2,m-3,dots,1$。
          上述两种排列及去掉首项后的数列均满足性质 $P$。因此恰有答案所列四种。
        ]],
    ),
  ),
)
