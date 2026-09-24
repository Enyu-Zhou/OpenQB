#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2025,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2025/2025上海.pdf",
  regions: ("上海",),
)

#let prism-figure() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (4, 0, 0)
  let c = (4, 4, 0)
  let d = (0, 4, 0)
  let ap = (0, 0, 7)
  let bp = (4, 0, 7)
  let cp = (4, 4, 7)
  let dp = (0, 4, 7)
  oblique-project((1, 0), (0.45, 0.4), (0, 0.65), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, cp, dp, ap, a)
    line(ap, bp, cp)
    line(b, bp)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, dp, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "west"),
      (d, $D$, "east"),
      (ap, $A_1$, "east"),
      (bp, $B_1$, "west"),
      (cp, $C_1$, "south-west"),
      (dp, $D_1$, "south-east"),
    ) { content(p, label, anchor: anchor, padding: 0.12) }
  })
})
#let shadow-figure() = cetz.canvas(length: 16mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let slope-angle = 12.578392deg
  let a = (0, 0)
  let at = (0, 1)
  let o = (0, 0)
  let b = (2.5, 2.5 * calc.tan(slope-angle))
  let bt = (b.at(0), b.at(1) + 1)
  let tip = (
    b.at(0) - 0.45 * calc.cos(slope-angle),
    b.at(1) - 0.45 * calc.sin(slope-angle),
  )
  line((-1.8, 0), o, (3.4, 3.4 * calc.tan(slope-angle)))
  line(a, at)
  line(b, bt)
  line((0.6, 2.5), (-0.4, 0), mark: (end: "stealth"))
  line((bt.at(0) + 0.6, bt.at(1) + 1.5), tip, mark: (end: "stealth"))
  line(o, (1.2, 0), stroke: (dash: figure-style.dash))
  content((0.9, 0.11), $theta$, anchor: "west", padding: 0.06)
  content(a, $A$, anchor: "north", padding: 0.1)
  content(b, $B$, anchor: "north-west", padding: 0.1)
  content(at, [杆], anchor: "east", padding: 0.08)
  content(bt, [杆], anchor: "south-east", padding: 0.08)
  content((0.6, 2.55), [平行阳光], anchor: "south")
})
#let cone-figure(auxiliary: false) = cetz.canvas(length: 23mm, {
  import cetz.draw: *
  let a = (-1, 0, 0)
  let b = (1, 0, 0)
  let o = (0, 0, 0)
  let p = (0, 0, calc.sqrt(3))
  let c = (-0.5, -calc.sqrt(3) / 2, 0)
  let d = (0.5, -calc.sqrt(3) / 2, 0)
  let q = (-0.5, 0, calc.sqrt(3) / 2)
  let t = (-0.3, -0.3 * calc.sqrt(3), 0)
  oblique-project((1, 0), (0, 0.38), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    let arc-points(start, end) = range(41).map(i => {
      let angle = start + (end - start) * i / 40
      (calc.cos(angle), calc.sin(angle), 0)
    })
    line(..arc-points(0deg, 180deg), stroke: (dash: figure-style.dash))
    line(..arc-points(180deg, 360deg))
    line(a, p, b)
    line(a, b, stroke: (dash: figure-style.dash))
    circle(o, radius: 0.025, fill: black, stroke: none)
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "west"),
      (o, $O$, "south"),
      (p, $P$, "south"),
    ) { content(point, label, anchor: anchor, padding: 0.08) }
    if auxiliary {
      line(c, d, b, stroke: (dash: figure-style.dash))
      line(o, c, stroke: (dash: figure-style.dash))
      line(q, o, stroke: (dash: figure-style.dash))
      line(q, t)
      line(p, d)
      for (point, label, anchor) in (
        (c, $C$, "north-east"),
        (d, $D$, "north-west"),
        (q, $Q$, "east"),
        (t, $T$, "east"),
      ) { content(point, label, anchor: anchor, padding: 0.08) }
    }
  })
})

#section[填空题：本题共 12 小题。]
#question(
  "fill-in",
  stem: [已知全集 $U = {x | 2 <= x <= 5, x in RR}$，若集合 $A = {x | 2 <= x < 4, x in RR}$，则 $complement_U A =$#fill-placeholder()。],
  answers: ([$[4,5]$],),
  explanation: [从全集 $[2,5]$ 中去掉 $[2,4)$，得到补集 $[4,5]$。],
)
#question(
  "fill-in",
  stem: [设 $x in RR$，不等式 $(x-1)/(x-3) < 0$ 的解集为#fill-placeholder()。],
  answers: ([$(1,3)$],),
  explanation: [分子、分母异号，得 $1 < x < 3$。],
)
#question(
  "fill-in",
  stem: [若等差数列 $lr({a_n})$ 的首项 $a_1 = -3$，公差 $d = 2$，则该数列的前 $6$ 项的和为#fill-placeholder()。],
  answers: ([$12$],),
  explanation: [$S_6 = 6a_1 + (6 times 5)/2 d = -18 + 30 = 12$。],
)
#question(
  "fill-in",
  stem: [在 $(2x-1)^5$ 的二项展开式中，$x^3$ 项的系数为#fill-placeholder()。],
  answers: ([$80$],),
  explanation: [$x^3$ 项为 $binom(5, 3)(2x)^3(-1)^2 = 80x^3$，故系数为 $80$。],
)
#question(
  "fill-in",
  stem: [函数 $y = cos x$，$x in [-pi/2,pi/4]$ 的值域为#fill-placeholder()。],
  answers: ([$[0,1]$],),
  explanation: [$cos x$ 在 $[-pi/2,0]$ 上由 $0$ 递增至 $1$，在 $[0,pi/4]$ 上由 $1$ 递减至 $sqrt(2)/2$，故值域为 $[0,1]$。],
)
#question(
  "fill-in",
  stem: [若随机变量 $X$ 的分布为
    #table(
      columns: 4,
      align: center,
      [$X$], [$5$], [$6$], [$7$],
      [$P$], [$0.2$], [$0.3$], [$0.5$],
    )
    则期望 $E(X) =$#fill-placeholder()。],
  answers: ([$6.3$],),
  explanation: [$E(X) = 5 times 0.2 + 6 times 0.3 + 7 times 0.5 = 6.3$。],
)
#question(
  "fill-in",
  stem: [在正四棱柱 $A B C D - A_1 B_1 C_1 D_1$ 中，若 $A C = 4sqrt(2)$，$B D_1 = 9$，则其体积为#fill-placeholder()。
    #figure(prism-figure())],
  answers: ([$112$],),
  explanation: [底面边长为 $4$，底面对角线 $B D = 4sqrt(2)$，高 $D D_1 = sqrt(9^2-(4sqrt(2))^2) = 7$。#linebreak()∴ 体积为 $4^2 times 7 = 112$。],
)
#question(
  "fill-in",
  stem: [设 $a,b > 0$，若 $a + 1/b = 1$，则 $b + 1/a$ 的最小值为#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [由条件得 $0 < a < 1$，$b = 1/(1-a)$，故 $b + 1/a = 1/(a(1-a)) >= 4$。#linebreak()当且仅当 $a = 1/2$，$b = 2$ 时取等号。],
)
#question(
  "fill-in",
  stem: [有 4 名家长和 2 名儿童去郊游爬山。若 6 个人要排成一队列，要求队列的首和尾均是家长，则不同的排列方式共有#fill-placeholder()种。],
  answers: ([$288$],),
  explanation: [先从 4 名家长中依次选出队首、队尾，有 $4 times 3$ 种；其余 4 人任意排列，有 $4!$ 种。#linebreak()共有 $4 times 3 times 4! = 288$ 种。],
)
#question(
  "fill-in",
  stem: [$i$ 为虚数单位，若复数 $z$ 满足 $z^2 = (overline(z))^2$，且 $abs(z) <= 1$，则 $abs(z-2-3i)$ 的最小值为#fill-placeholder()。],
  answers: ([$2sqrt(2)$],),
  explanation: [设 $z = x + y i$，由 $z^2 = (overline(z))^2$ 得 $x y = 0$。#linebreak()故 $z$ 对应的点在线段 ${ (x,0) | -1 <= x <= 1 }$ 或 ${ (0,y) | -1 <= y <= 1 }$ 上。#linebreak()点 $(2,3)$ 到这两条线段的最短距离分别为 $sqrt(10)$，$sqrt(8)$，因此最小值为 $2sqrt(2)$，当 $z = i$ 时取得。],
)
#question(
  "fill-in",
  stem: [小申同学观察发现，生活中有时候影子可以完全投射在斜面上。某斜面上有两根长为 1 米且垂直于水平面放置的杆子，与斜面的接触点分别为 $A$，$B$，它们在阳光的照射下呈现出影子，阳光可视为平行光，其中 $A$ 处杆子的影子在水平面上，长度为 $0.4$ 米，$B$ 处杆子的影子完全在斜面上，长度为 $0.45$ 米。则斜面的坡角 $theta =$#fill-placeholder()。（结果精确到 $0.01 degree$）
    #figure(shadow-figure())],
  answers: ([$12.58 degree$],),
  explanation: [阳光方向的水平位移与竖直位移之比为 $0.4/1 = 0.4$。#linebreak()在 $B$ 处，从杆顶到影子末端的水平位移为 $0.45cos theta$，竖直位移为 $1 + 0.45sin theta$，故
    $
      (0.45cos theta)/(1+0.45sin theta) = 0.4, quad cos theta - 0.4sin theta = 8/9.
    $
    令 $phi = arctan 0.4$，则 $sqrt(1.16) cos(theta+phi) = 8/9$。#linebreak()由 $0 < theta < 90 degree$，解得 $theta = arccos(8/(9sqrt(1.16))) - arctan 0.4 approx 12.58 degree$。],
)
#question(
  "fill-in",
  stem: [已知 $f(x) = cases(1 & quad x>0, 0 & quad x=0, -1 & quad x<0)$，向量 $bold(a)$，$bold(b)$，$bold(c)$ 是平面内三个不同的单位向量。若 $f(bold(a) dot bold(b)) + f(bold(b) dot bold(c)) + f(bold(c) dot bold(a)) = 0$，则 $abs(bold(a)+bold(b)+bold(c))$ 的取值范围是#fill-placeholder()。],
  answers: ([$(1,sqrt(5))$],),
  explanation: [三个函数值只能为 $-1,0,1$。若均为 $0$，则三个非零向量两两垂直，这在平面内不可能；故三个值恰为 $-1,0,1$。#linebreak()不妨设 $bold(a) perp bold(b)$，取 $bold(a)=(1,0)$，$bold(b)=(0,1)$，$bold(c)=(cos t,sin t)$，则 $cos t sin t < 0$。#linebreak()由 $(cos t+sin t)^2=1+2cos t sin t<1$，得 $-1 < cos t + sin t < 1$，且区间内各值均可取到。#linebreak()∴ $abs(bold(a)+bold(b)+bold(c))^2 = 3 + 2(cos t+sin t) in (1,5)$，所求范围为 $(1,sqrt(5))$。],
)

#section[选择题：本题共 4 小题。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [已知事件 $A$，$B$ 相互独立，若 $P(A)=P(B)=1/2$，则 $P(A inter B)$ 的值为#choice-placeholder()。],
  choices: ([$0$], [$1/4$], [$1/2$], [$1$]),
  answers: ([B],),
  explanation: [$P(A inter B)=P(A)P(B)=1/4$，选 B。],
)
#question(
  "single-choice",
  stem: [已知 $a>0$ 且 $a != 1$，$s in RR$，下列各项中，能推出 $a^s > a$ 的是#choice-placeholder()。],
  choices: ([$a>1, s>0$], [$a>1, s<0$], [$0<a<1, s>0$], [$0<a<1, s<0$]),
  answers: ([D],),
  explanation: [当 $0<a<1$ 时，指数函数严格递减，$s<0<1$ 可推出 $a^s>a^1=a$，故 D 正确。#linebreak()A 取 $s=1/2$、C 取 $s=2$ 均不满足结论；B 中恒有 $a^s<1<a$。],
)
#question(
  "single-choice",
  stem: [已知点 $A(0,1)$，$B(1,2)$，若动点 $C$ 在曲线 $x^2-y^2=1$（$x>=1,y>=0$）上，则 $triangle A B C$ 的面积#choice-placeholder()。],
  choices: (
    [有最大值，无最小值],
    [无最大值，有最小值],
    [有最大值，有最小值],
    [无最大值，无最小值],
  ),
  answers: ([A],),
  explanation: [直线 $A B$ 为 $x-y+1=0$，$abs(A B)=sqrt(2)$，故面积 $S=1/2 abs(x-y+1)$。#linebreak()在曲线上，$x-y=1/(x+y) in (0,1]$，故 $S in (1/2,1]$，有最大值 $1$，无最小值，选 A。],
)
#question(
  "single-choice",
  stem: [设 $lambda in RR$，数列 $lr({a_n})$，$lr({b_n})$，$lr({c_n})$ 满足 $a_n=10n-9$，$b_n=2^n$，$c_n=lambda a_n+(1-lambda)b_n$。若对任意的 $lambda in [0,1]$，$a_n$，$b_n$，$c_n$ 均能作为三角形的三边长，则满足条件的正整数 $n$ 有#choice-placeholder()。],
  choices: ([1 个], [3 个], [4 个], [无穷多个]),
  answers: ([B],),
  explanation: [当 $lambda in [0,1]$ 时，$c_n$ 遍历以 $a_n,b_n$ 为端点的闭区间。条件等价于 $abs(a_n-b_n)<min(a_n, b_n)$，即 $1/2<a_n/b_n<2$。#linebreak()$n=1,2,dots,7$ 时，$(10n-9)/2^n$ 依次为
    $ 1/2, 11/4, 21/8, 31/16, 41/32, 51/64, 61/128. $
    其中只有 $n=4,5,6$ 满足条件。#linebreak()当 $n>=2$ 时，$10n+1<2(10n-9)$，故该比值随 $n$ 严格递减；$n>=7$ 均不满足条件。共有 3 个，选 B。],
)

#section[解答题：本题共 5 小题。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  stem: [2024 年巴黎奥运会，中国获得了男子 $4 times 100$ 米混合泳接力金牌。以下是历届奥运会男子 $4 times 100$ 米混合泳接力项目冠军成绩（单位：秒），数据按照升序排列。
    #table(
      columns: 5,
      align: center,
      [$206.78$], [$207.46$], [$207.95$], [$209.34$], [$209.35$],
      [$210.68$], [$213.73$], [$214.84$], [$216.93$], [$216.93$],
    )
  ],
  parts: (
    subquestion(
      stem: [求这组数据的极差与中位数；],
      answers: ([极差为 $10.15$ 秒，中位数为 $210.015$ 秒。],),
      explanation: [极差为 $216.93-206.78=10.15$ 秒，中位数为 $(209.35+210.68)/2=210.015$ 秒。],
    ),
    subquestion(
      stem: [从这 10 个数据中任选 3 个，求恰有 2 个数据大于 $211$ 的概率；],
      answers: ([$3/10$。],),
      explanation: [大于 $211$ 的数据有 4 个，其余有 6 个，故所求概率为 $(binom(4, 2)binom(6, 1))/binom(10, 3)=36/120=3/10$。],
    ),
    subquestion(
      stem: [若比赛成绩 $y$ 关于年份 $x$ 的回归方程为 $hat(y)=-0.311x+hat(b)$，年份 $x$ 的平均数为 $2006$，请预测 2028 年男子 $4 times 100$ 米混合泳接力项目冠军队的成绩。（结果精确到 $0.01$ 秒）],
      answers: ([$204.56$ 秒。],),
      explanation: [这组成绩的平均数为 $overline(y)=211.399$。回归直线经过样本中心 $(2006,211.399)$，故
        $ hat(y)=211.399-0.311(x-2006). $
        代入 $x=2028$，得 $hat(y)=204.557 approx 204.56$（秒）。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，点 $P$ 是圆锥的顶点，点 $O$ 是底面圆心，底面直径 $A B=2$。
    #figure(cone-figure())],
  parts: (
    subquestion(
      stem: [若直线 $P A$ 与圆锥底面所成角为 $pi/3$，求圆锥的侧面积；],
      answers: ([$2pi$。],),
      explanation: [底面半径 $r=1$，$P O perp$ 底面，故 $angle P A O=pi/3$，母线长 $l=A O/cos(pi/3)=2$。#linebreak()∴ 圆锥侧面积 $S=pi r l=2pi$。],
    ),
    subquestion(
      stem: [若 $Q$ 是母线 $P A$ 的中点，点 $C$，$D$ 在底面圆周上，$A C$ 弧长为 $pi/3$，$C D parallel A B$，点 $T$ 在线段 $O C$ 上，求证：直线 $Q T parallel$ 平面 $P B D$。],
      answers: ([证明见解析。],),
      explanation: [
        #figure(cone-figure(auxiliary: true))
        取底面坐标 $O(0,0)$，$A(-1,0)$，$B(1,0)$，不妨令 $C(-1/2,-sqrt(3)/2)$，则 $D(1/2,-sqrt(3)/2)$。#linebreak()∴ $arrow(O C)=arrow(B D)$，故 $O C parallel B D$。又 $O$，$Q$ 分别为 $A B$，$A P$ 的中点，故 $O Q parallel B P$。#linebreak()$O C$，$O Q$ 是平面 $Q O C$ 内的相交直线，分别平行于平面 $P B D$ 内的相交直线 $B D$，$B P$，且两平面不重合，故平面 $Q O C parallel$ 平面 $P B D$。#linebreak()∵ $Q T subset$ 平面 $Q O C$，∴ $Q T parallel$ 平面 $P B D$。],
    ),
  ),
)
#question("solution", stem: [设 $m in RR$，$f(x)=x^2-(m+2)x+m ln x$。], parts: (
  subquestion(
    stem: [若 $f(1)=0$，求不等式 $f(x)<=x^2-1$ 的解集；],
    answers: ([$[1,+infinity)$。],),
    explanation: [由 $f(1)=-m-1=0$，得 $m=-1$。原不等式化为 $x+ln x>=1$（$x>0$）。#linebreak()函数 $x+ln x$ 在 $(0,+infinity)$ 上严格递增，且 $1+ln 1=1$，故解集为 $[1,+infinity)$。],
  ),
  subquestion(
    stem: [若 $y=f(x)$ 在区间 $(0,+infinity)$ 上存在极大值，求 $m$ 的取值范围。],
    answers: ([$(0,2) union (2,+infinity)$。],),
    explanation: [$f'(x)=2x-(m+2)+m/x=((x-1)(2x-m))/x$。#linebreak()若 $m<=0$，导数在 $x=1$ 处由负变正，只有极小值；若 $m=2$，导数非负，没有极大值。#linebreak()若 $0<m<2$，导数在 $x=m/2$ 处由正变负，存在极大值；若 $m>2$，导数在 $x=1$ 处由正变负，存在极大值。#linebreak()∴ $m in (0,2) union (2,+infinity)$。],
  ),
))
#question(
  "solution",
  stem: [设椭圆 $Gamma: x^2/a^2+y^2/5=1$（$a>sqrt(5)$），点 $A$ 为 $Gamma$ 的右顶点，点 $M(0,m)$（$m>0$）。],
  parts: (
    subquestion(
      stem: [若 $Gamma$ 的一个焦点是 $(2,0)$，求 $Gamma$ 的离心率；],
      answers: ([$2/3$。],),
      explanation: [$c=2$，$a^2=5+c^2=9$，故 $e=c/a=2/3$。],
    ),
    subquestion(
      stem: [设 $a=4$，椭圆 $Gamma$ 上存在一点 $P$ 满足 $arrow(P A)=2arrow(M P)$，求 $m$ 的值；],
      answers: ([$sqrt(10)$。],),
      explanation: [由 $arrow(P A)=2arrow(M P)$，得 $3arrow(O P)=arrow(O A)+2arrow(O M)$，故 $P(4/3,2m/3)$。#linebreak()代入椭圆方程，得 $1/9+4m^2/45=1$，结合 $m>0$，得 $m=sqrt(10)$。],
    ),
    subquestion(
      stem: [若线段 $A M$ 的中垂线 $l$ 的斜率为 $2$，$l$ 与椭圆 $Gamma$ 交于 $C$，$D$ 两点，且 $angle C M D$ 为钝角，求 $a$ 的取值范围。],
      answers: ([$(sqrt(5),sqrt(11))$。],),
      explanation: [
        #step[求直线方程][由 $k_(A M)=-m/a=-1/2$，得 $m=a/2$。中点为 $(a/2,a/4)$，故 $l:y=2x-3a/4$。#linebreak()直线经过椭圆内部的点 $(3a/8,0)$，因此恒与椭圆有两个不同交点。]
        #step[用数量积表示钝角条件][设 $C(x_1,y_1)$，$D(x_2,y_2)$，联立方程得
          $ (4a^2+5)x^2-3a^3 x+9a^4/16-5a^2=0. $
          故 $x_1+x_2=(3a^3)/(4a^2+5)$，$x_1 x_2=(9a^4/16-5a^2)/(4a^2+5)$。#linebreak()点 $M$ 不在 $l$ 上，故钝角条件等价于
          $
            arrow(M C) dot arrow(M D) = 5x_1 x_2-5a/2(x_1+x_2)+25a^2/16 = (25a^2(a^2-11))/(16(4a^2+5)) < 0.
          $
          ∴ $a^2<11$。结合 $a>sqrt(5)$，得 $sqrt(5)<a<sqrt(11)$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知函数 $y=f(x)$ 的定义域为 $RR$，对于正实数 $a$，定义集合 $M_a={x | f(x+a)=f(x), x in RR}$。],
  parts: (
    subquestion(
      stem: [设 $f(x)=sin x$，判断 $pi/3$ 是否是 $M_pi$ 中的元素，并说明理由；],
      answers: ([$pi/3 in.not M_pi$。],),
      explanation: [$f(pi/3+pi)=sin(4pi/3)=-sqrt(3)/2 != sqrt(3)/2=f(pi/3)$，故 $pi/3 in.not M_pi$。],
    ),
    subquestion(
      stem: [设 $f(x)=cases(x+2 & quad x<0, sqrt(x) & quad x>=0)$，且 $M_a != emptyset$，求 $a$ 的取值范围；],
      answers: ([$[7/4,4)$。],),
      explanation: [函数在 $(-infinity,0)$，$[0,+infinity)$ 内均严格递增，故 $f(x+a)=f(x)$ 只能在 $x<0<=x+a$ 时成立。#linebreak()此时 $x+2=sqrt(x+a)$，故 $-2<=x<0$，且
        $ a=x^2+3x+4=(x+3/2)^2+7/4. $
        反之，对任意 $x in [-2,0)$，按上式取 $a$，均有 $x+a=(x+2)^2>=0$，满足原式。#linebreak()当 $x in [-2,0)$ 时，上式的值域为 $[7/4,4)$，即所求范围。],
    ),
    subquestion(
      stem: [若 $y=f(x)$ 是偶函数，当 $x in (0,1]$ 时，$f(x)=1-x$，且对任意 $a in (0,2)$，均有 $M_a subset.eq M_2$。写出当 $x in (1,2)$ 时 $f(x)$ 的表达式，并证明：对任意实数 $c$，函数 $y=f(x)-c$ 在区间 $[-3,3]$ 上至多有 9 个零点。],
      answers: ([$f(x)=x-1$（$1<x<2$）；零点个数证明见解析。],),
      explanation: [
        #step[确定各开区间上的函数值][对 $t in (0,1)$，由偶性 $f(-t)=f(t)$，得 $-t in M_(2t) subset.eq M_2$，故 $f(2-t)=f(-t)=1-t$。#linebreak()令 $x=2-t$，得 $f(x)=x-1$（$1<x<2$）。#linebreak()又 $f(t)=f(2-t)$，$2-2t in (0,2)$，故 $t in M_(2-2t) subset.eq M_2$，从而 $f(t+2)=f(t)=1-t$。因此 $f(x)=3-x$（$2<x<3$）。#linebreak()结合偶性，$(-3,-2)$，$(-2,-1)$，$(-1,0)$，$(0,1)$，$(1,2)$，$(2,3)$ 上的函数均严格单调，值域均为 $(0,1)$。]
        #step[限制端点处的零点数][若 $c in.not (0,1)$，六个开区间上没有零点，只有七个整数点可能是零点，至多 7 个。#linebreak()若 $c in (0,1)$，六个开区间各有一个零点。又 $f(1)=f(-1)=0 != c$。#linebreak()下面证明 $f(3)=f(-3) != c$。若 $f(-3)=c$，则由已求表达式与偶性，$f(-1-c)=f(1+c)=c$。因此 $-3 in M_(2-c) subset.eq M_2$，推出 $f(-1)=f(-3)=c$，与 $f(-1)=0$ 矛盾。#linebreak()故除六个开区间中的零点外，只有 $-2,0,2$ 三点可能为零点，总数至多 $6+3=9$。]
      ],
    ),
  ),
)
