#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2021/2021北京.pdf",
  regions: ("北京",),
)

#let three-views() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  line((0, 0), (0, 1), (1, 0), close: true)
  line((1.7, 0), (1.7, 1), (2.7, 0), close: true)
  line((0, -1.15), (1, -1.15), (0, -2.15), close: true)
  for (p, q, label, offset) in (
    ((0, -0.16), (1, -0.16), $1$, (0.5, -0.16)),
    ((1.7, -0.16), (2.7, -0.16), $1$, (2.2, -0.16)),
    ((-0.16, 0), (-0.16, 1), $1$, (-0.16, 0.5)),
  ) {
    line(p, q, mark: (start: ">", end: ">"))
    content(
      offset,
      label,
      frame: "rect",
      fill: white,
      stroke: none,
      padding: 1pt,
    )
  }
  content((0.5, -0.45), [正（主）视图], anchor: "north")
  content((2.2, -0.45), [侧（左）视图], anchor: "north")
  content((0.5, -2.3), [俯视图], anchor: "north")
})

#let rain-gauge() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let angle = calc.asin(-0.28 / 3)
  let edge = calc.cos(angle)
  oblique-project((1, 0), (0, 0.28), (0, 1), {
    let arc-points(radius, z, start, end) = range(65).map(i => {
      let t = start + (end - start) * i / 64
      (radius * calc.cos(t), radius * calc.sin(t), z)
    })
    line(
      (0, 0, 0),
      ..arc-points(0.5, 1.5, angle, 180deg - angle),
      close: true,
      fill: luma(92%),
      stroke: none,
    )
    line(..arc-points(1, 3, 0deg, 360deg))
    line((-edge, calc.sin(angle), 3), (0, 0, 0), (edge, calc.sin(angle), 3))
    line(..arc-points(0.5, 1.5, angle, 180deg - angle), stroke: (
      dash: figure-style.dash,
    ))
    line(..arc-points(0.5, 1.5, 180deg - angle, 360deg + angle))
    content((0, 0, 1), text(size: 10pt)[雨#linebreak()水])
  })
  for (p, q, pos, label) in (
    ((-1, 3.55), (1, 3.55), (0, 3.55), [$200 "mm"$]),
    ((-1.3, 0), (-1.3, 3), (-1.3, 1.5), [$300 "mm"$]),
    ((0.9, 0), (0.9, 1.5), (0.9, 0.75), [$150 "mm"$]),
  ) {
    line(p, q, mark: (start: ">", end: ">"))
    content(pos, label, frame: "rect", fill: white, stroke: none, padding: 2pt)
  }
})

#let vector-grid() = cetz.canvas(length: 6mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for x in range(7) {
    if x == 4 {
      line((x, 0), (x, 3), stroke: (dash: figure-style.dash))
      line((x, 4), (x, 5), stroke: (dash: figure-style.dash))
    } else { line((x, 0), (x, 5), stroke: (dash: figure-style.dash)) }
  }
  for y in range(6) { line((0, y), (6, y), stroke: (dash: figure-style.dash)) }
  line((1, 2), (3, 3), mark: (end: ">"))
  line((1, 2), (3, 1), mark: (end: ">"))
  // 向量 c 所在的网格段由实线替代，避免重复描线。
  content(
    (1.5, 2.65),
    $bold(a)$,
    frame: "rect",
    fill: white,
    stroke: none,
    padding: 1pt,
  )
  content(
    (1.5, 1.35),
    $bold(b)$,
    frame: "rect",
    fill: white,
    stroke: none,
    padding: 1pt,
  )
  line((4, 3), (4, 4), mark: (end: ">"))
  content((4.12, 3.5), $bold(c)$, anchor: "west", padding: 2pt)
})

#let cube-section() = cetz.canvas(length: 28mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (1, 0, 0)
  let c = (1, 1, 0)
  let d = (0, 1, 0)
  let a1 = (0, 0, 1)
  let b1 = (1, 0, 1)
  let c1 = (1, 1, 1)
  let d1 = (0, 1, 1)
  let e = (0, 0.5, 1)
  let f = (1, 0.5, 1)
  let m = (0.5, 0, 1)
  oblique-project((1, 0), (0.35, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(d, e, stroke: (dash: figure-style.dash))
    line(e, f, c)
    line(m, f)
    line(m, c, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "north-west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "north-west"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
      (e, $E$, "east"),
      (f, $F$, "west"),
      ((0.46, 0, 1), $M$, "north"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题]
#question(
  "single-choice",
  stem: [已知集合 $A={x | -1<x<1},B={x | 0<=x<=2}$，则 $A union B=$#choice-placeholder()。],
  choices: (
    [$\{x | -1<x<2\}$],
    [$\{x | -1<x<=2\}$],
    [$\{x | 0<=x<1\}$],
    [$\{x | 0<=x<=2\}$],
  ),
  answers: ([B],),
  explanation: [合并两集合所含的区间，得 $A union B={x | -1<x<=2}$。],
)
#question(
  "single-choice",
  stem: [若复数 $z$ 满足 $(1-i)z=2$，则 $z=$#choice-placeholder()。],
  choices: ([$-1-i$], [$-1+i$], [$1-i$], [$1+i$]),
  answers: ([D],),
  explanation: [$z=2/(1-i)=(2(1+i))/((1-i)(1+i))=1+i$。],
)
#question(
  "single-choice",
  stem: [设函数 $f(x)$ 的定义域为 $[0,1]$，则“$f(x)$ 在区间 $[0,1]$ 上单调递增”是“$f(x)$ 在区间 $[0,1]$ 上的最大值为 $f(1)$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [单调递增可推出最大值为 $f(1)$。反之不成立，例如 $f(x)=(x-1/3)^2$ 在 $[0,1]$ 上先减后增，最大值仍在 $x=1$ 处取得。],
)
#question(
  "single-choice",
  stem: [某四面体的三视图如图所示，该四面体的表面积为#choice-placeholder()。
    #figure(three-views())],
  choices: ([$3/2+sqrt(3)/2$], [$3+sqrt(3)$], [$3/2+sqrt(3)$], [$3+sqrt(3)/2$]),
  answers: ([A],),
  explanation: [该四面体可还原为顶点 $(0,0,0),(1,0,0),(0,1,0),(0,0,1)$ 构成的三棱锥。其中三个面为直角边长 $1$ 的等腰直角三角形，另一个面为边长 $sqrt(2)$ 的等边三角形。
    $
      S=3 times 1/2 times 1 times 1+sqrt(3)/4 times (sqrt(2))^2=3/2+sqrt(3)/2.
    $],
)
#question(
  "single-choice",
  stem: [若双曲线 $x^2/a^2-y^2/b^2=1$ 的离心率为 $2$，且过点 $(sqrt(2),sqrt(3))$，则双曲线的方程为#choice-placeholder()。],
  choices: (
    [$2x^2-y^2=1$],
    [$x^2-y^2/3=1$],
    [$5x^2-3y^2=1$],
    [$x^2/2-y^2/6=1$],
  ),
  answers: ([B],),
  explanation: [由 $e^2=1+b^2/a^2=4$，得 $b^2=3a^2$。代入已知点，得 $2/a^2-3/(3a^2)=1$，故 $a^2=1,b^2=3$。],
)
#question(
  "single-choice",
  stem: [《中国共产党党旗党徽制作和使用的若干规定》指出，中国共产党党旗为旗面缀有金黄色党徽图案的红旗，通用规格有五种。这五种规格党旗的长 $a_1,a_2,a_3,a_4,a_5$（单位：$"cm"$）成等差数列，对应的宽为 $b_1,b_2,b_3,b_4,b_5$（单位：$"cm"$），且长与宽之比都相等。已知 $a_1=288,a_5=96,b_1=192$，则 $b_3=$#choice-placeholder()。],
  choices: ([$64$], [$96$], [$128$], [$160$]),
  answers: ([C],),
  explanation: [$a_3=(a_1+a_5)/2=192$，且 $b_3/a_3=b_1/a_1=2/3$，所以 $b_3=128$。],
)
#question(
  "single-choice",
  stem: [函数 $f(x)=cos x-cos 2x$ 是#choice-placeholder()。],
  choices: (
    [奇函数，且最大值为 $2$],
    [偶函数，且最大值为 $2$],
    [奇函数，且最大值为 $9/8$],
    [偶函数，且最大值为 $9/8$],
  ),
  answers: ([D],),
  explanation: [$f(-x)=f(x)$，故为偶函数。
    $ f(x)=-2cos^2 x+cos x+1=-2(cos x-1/4)^2+9/8. $
    当 $cos x=1/4$ 时取最大值 $9/8$。],
)
#question(
  "single-choice",
  stem: [某一时段内，从天空降落到地面上的雨水，未经蒸发、渗漏、流失而在水平面上积聚的深度，称为这个时段的降雨量（单位：$"mm"$）。$24 "h"$ 降雨量的等级划分如下：
    #table(
      columns: 2,
      align: center,
      [等级], [$24 "h"$ 降雨量（精确到 $0.1$）],
      [$dots$], [$dots$],
      [小雨], [$0.1$～$9.9$],
      [中雨], [$10.0$～$24.9$],
      [大雨], [$25.0$～$49.9$],
      [暴雨], [$50.0$～$99.9$],
      [$dots$], [$dots$],
    )
    在综合实践活动中，某小组自制了一个底面直径为 $200 "mm"$，高为 $300 "mm"$ 的圆锥形雨量器。若一次降雨过程中，该雨量器收集的 $24 "h"$ 的雨水高度是 $150 "mm"$（如图所示），则这 $24 "h"$ 降雨量的等级是#choice-placeholder()。
    #figure(rain-gauge())],
  choices: ([小雨], [中雨], [大雨], [暴雨]),
  answers: ([B],),
  explanation: [雨水所成圆锥与雨量器相似，高之比为 $1/2$，故水面半径为 $50 "mm"$。降雨量等于收集的雨水体积除以开口面积：
    $ h=(1/3 pi times 50^2 times 150)/(pi times 100^2)=12.5 ("mm"). $
    ∴ 这 $24 "h"$ 降雨量的等级为中雨。],
)
#question(
  "single-choice",
  stem: [已知直线 $y=k x+m$（$m$ 为常数）与圆 $x^2+y^2=4$ 交于点 $M,N$。当 $k$ 变化时，若 $|M N|$ 的最小值为 $2$，则 $m=$#choice-placeholder()。],
  choices: (
    [$plus.minus 1$],
    [$plus.minus sqrt(2)$],
    [$plus.minus sqrt(3)$],
    [$plus.minus 2$],
  ),
  answers: ([C],),
  explanation: [圆心到直线的距离 $d=frac(|m|, sqrt(1+k^2))$，故 $|M N|=2sqrt(4-m^2/(1+k^2))$。
    若 $|m|>=2$，相交弦长可以任意接近 $0$，不可能有最小值 $2$，所以 $|m|<2$。
    当 $k=0$ 时弦长最小，故 $2sqrt(4-m^2)=2$，解得 $m=plus.minus sqrt(3)$。],
)
#question(
  "single-choice",
  stem: [已知 $\{a_n\}$ 是各项均为整数的递增数列，且 $a_1>=3$。若 $a_1+a_2+a_3+ dots +a_n=100$，则 $n$ 的最大值为#choice-placeholder()。],
  choices: ([$9$], [$10$], [$11$], [$12$]),
  answers: ([C],),
  explanation: [各项为递增整数，故 $a_j>=j+2$，从而
    $ 100=sum_(j=1)^n a_j>=sum_(j=1)^n (j+2)=n(n+5)/2. $
    当 $n>=12$ 时右端至少为 $102$，所以 $n<=11$。
    取前 $11$ 项为 $3,4,5,dots,12,25$，其和为 $100$，满足条件，故最大值为 $11$。],
)

#section[填空题]
#question(
  "fill-in",
  stem: [在 $(x^3-1/x)^4$ 的展开式中，常数项为#fill-placeholder()。（用数字作答）],
  answers: ([$-4$],),
  explanation: [通项为 $binom(4, r)(-1)^r x^(12-4r)$。令 $12-4r=0$，得 $r=3$，故常数项为 $-binom(4, 3)=-4$。],
)
#question(
  "fill-in",
  stem: [已知抛物线 $y^2=4x$ 的焦点为 $F$，点 $M$ 在抛物线上，$M N$ 垂直 $x$ 轴于点 $N$。若 $|M F|=6$，则点 $M$ 的横坐标为#fill-placeholder()；$triangle M N F$ 的面积为#fill-placeholder()。],
  answers: ([$5$], [$4sqrt(5)$]),
  explanation: [焦点为 $F(1,0)$，准线为 $x=-1$。由抛物线定义，$x_M+1=6$，故 $x_M=5$，$|y_M|=2sqrt(5)$。
    $ S_(triangle M N F)=1/2 |5-1| times 2sqrt(5)=4sqrt(5). $],
)
#question(
  "fill-in",
  stem: [已知向量 $bold(a),bold(b),bold(c)$ 在正方形网格中的位置如图所示，若网格纸上小正方形的边长为 $1$，则 $(bold(a)+bold(b)) dot bold(c)=$#fill-placeholder()；$bold(a) dot bold(b)=$#fill-placeholder()。
    #figure(vector-grid())],
  answers: ([$0$], [$3$]),
  explanation: [以向右、向上为坐标轴正向，由网格读得 $bold(a)=(2,1),bold(b)=(2,-1),bold(c)=(0,1)$。
    $ (bold(a)+bold(b)) dot bold(c)=(4,0) dot (0,1)=0, $
    $ bold(a) dot bold(b)=2 times 2+1 times (-1)=3. $],
)
#question(
  "fill-in",
  stem: [若点 $A(cos theta,sin theta)$ 关于 $y$ 轴的对称点为 $B(cos(theta+pi/6),sin(theta+pi/6))$，则 $theta$ 的一个取值为#fill-placeholder()。],
  answers: ([$(5pi)/12$（答案不唯一）],),
  explanation: [关于 $y$ 轴对称的单位圆上两点，其角满足 $theta+pi/6=pi-theta+2k pi$，$k in ZZ$。
    ∴ $theta=(5pi)/12+k pi$，$k in ZZ$。例如取 $theta=(5pi)/12$。],
)
#question(
  "fill-in",
  stem: [已知函数 $f(x)=|lg x|-k x-2$。给出下列四个结论：
    #linebreak()① 当 $k=0$ 时，$f(x)$ 恰有 $2$ 个零点；
    #linebreak()② 存在负数 $k$，使得 $f(x)$ 恰有 $1$ 个零点；
    #linebreak()③ 存在负数 $k$，使得 $f(x)$ 恰有 $3$ 个零点；
    #linebreak()④ 存在正数 $k$，使得 $f(x)$ 恰有 $3$ 个零点。
    #linebreak()其中所有正确结论的序号是#fill-placeholder()。],
  answers: ([①②④],),
  explanation: [定义域为 $(0,+infinity)$，且
    $ f(x)=cases(-lg x-k x-2 & quad 0<x<=1, lg x-k x-2 & quad x>1). $
    #step[结论①][$k=0$ 时，零点为 $1/100$ 和 $100$，故①正确。]
    #step[结论②][取 $k=-100/(e ln 10)$。在 $(0,1)$ 上，$f'(x)=-1/(x ln 10)+100/(e ln 10)$，故 $f$ 在 $x=e/100$ 处取得唯一最小值，且
      $ f(e/100)=-lg(e/100)+1/(ln 10)-2=0. $
      又 $f(1)=100/(e ln 10)-2>0$，且 $f$ 在 $(1,+infinity)$ 上严格递增，所以只有这一个零点，②正确。]
    #step[结论③][设 $q=-k>0$。在 $(0,1)$ 上，$f'(x)=-1/(x ln 10)+q$ 严格递增，故 $f$ 至多先减后增；在 $(1,+infinity)$ 上，$f'(x)=1/(x ln 10)+q>0$。
      若 $0<q<2$，则 $f(1)<0$，左右两段各恰有一个零点。
      若 $q=2$，则 $x=1$ 为零点，左段至多还有一个零点，右段没有零点。
      若 $q>2$，则 $f(1)>0$，右段没有零点，左段至多有两个零点。
      因此零点总数至多为 $2$，③错误。]
    #step[结论④][取 $k=1/10000$。在 $(0,1]$ 上，$f$ 严格递减，从 $+infinity$ 降至负数，故恰有一个零点。
      在 $[1,+infinity)$ 上，$f'(x)=1/(x ln 10)-1/10000$，所以先增后减。又 $f(1)<0,f(1000)=0.9>0$，且 $lim_(x arrow +infinity) f(x)=-infinity$，故此段恰有两个零点。
      总计三个零点，④正确。]
  ],
)

#section[解答题]
#question(
  "solution",
  stem: [在 $triangle A B C$ 中，$c=2b cos B,C=(2pi)/3$。],
  parts: (
    subquestion(
      stem: [求 $angle B$；],
      answers: ([$pi/6$。],),
      explanation: [由正弦定理，$sin C=2sin B cos B=sin 2B$。又 $0<B<pi/3$，故 $0<2B<(2pi)/3$。
        $ sin 2B=sqrt(3)/2 quad arrow quad 2B=pi/3 quad arrow quad B=pi/6. $],
    ),
    subquestion(
      stem: [再从条件①、条件②、条件③这三个条件中选择一个作为已知，使 $triangle A B C$ 存在且唯一确定，求 $B C$ 边上中线的长。
        #linebreak()条件①：$c=sqrt(2)b$；
        #linebreak()条件②：$triangle A B C$ 的周长为 $4+2sqrt(3)$；
        #linebreak()条件③：$triangle A B C$ 的面积为 $(3sqrt(3))/4$。],
      answers: (
        [选择②时为 $sqrt(7)$；选择③时为 $sqrt(21)/2$。条件①不符合要求。],
      ),
      explanation: [由上一问，$A=B=pi/6$，故 $a=b,c=sqrt(3)a$。
        设 $B C$ 边上的中线长为 $m$，由中线长公式，
        $ m^2=(2b^2+2c^2-a^2)/4=(7a^2)/4. $
        #step[选择条件①][$c/b=sqrt(3)!=sqrt(2)$，三角形不存在。]
        #step[选择条件②][$(2+sqrt(3))a=4+2sqrt(3)$，所以 $a=2$，$m=sqrt(7)$。]
        #step[选择条件③][$S=1/2 a^2 sin((2pi)/3)=(sqrt(3))/4 a^2=(3sqrt(3))/4$，所以 $a=sqrt(3)$，$m=sqrt(21)/2$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$E$ 为 $A_1 D_1$ 的中点，$B_1 C_1$ 与平面 $C D E$ 交于点 $F$。
    #figure(cube-section())],
  parts: (
    subquestion(
      stem: [求证：$F$ 为 $B_1 C_1$ 中点；],
      answers: ([证明见解析。],),
      explanation: [取 $B_1 C_1$ 的中点 $F'$。因 $E F' parallel A_1 B_1 parallel C D$，所以 $E,F',C,D$ 四点共面，即 $F'$ 在平面 $C D E$ 内。
        $F'$ 又在直线 $B_1 C_1$ 上，由直线与平面交点的唯一性，$F'=F$，故 $F$ 为 $B_1 C_1$ 中点。],
    ),
    subquestion(
      stem: [若 $M$ 是棱 $A_1 B_1$ 上一点，且二面角 $M-F C-E$ 的余弦值为 $sqrt(5)/3$，求 $(A_1 M)/(A_1 B_1)$ 的值。],
      answers: ([$1/2$。],),
      explanation: [以 $A$ 为原点，$A B,A D,A A_1$ 的方向为三个坐标轴正向，正方体棱长取 $1$。
        设 $t=(A_1 M)/(A_1 B_1) in [0,1]$，则
        $ C=(1,1,0),E=(0,1/2,1),F=(1,1/2,1),M=(t,0,1). $
        #step[求二面角的平面角][记 $bold(w)=arrow(F C)=(0,1/2,-1)$，$bold(u)=arrow(F E)=(-1,0,0)$，则 $bold(u) perp bold(w)$。
          将 $arrow(F M)$ 沿 $F C$ 的分量去掉，得
          $
            bold(v)=arrow(F M)-(arrow(F M) dot bold(w))/(bold(w) dot bold(w)) bold(w)=(t-1,-2/5,-1/5).
          $
          $bold(u),bold(v)$ 分别位于二面角的两个半平面内，且都垂直 $F C$，所以它们的夹角就是所求二面角。]
        #step[解参数][由题意，
          $
            (bold(u) dot bold(v))/(|bold(u)| |bold(v)|)=(1-t)/sqrt((1-t)^2+1/5)=sqrt(5)/3.
          $
          ∴ $9(1-t)^2=5(1-t)^2+1$，又 $1-t>=0$，故 $t=1/2$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [在核酸检测中，“$k$ 合 $1$”混采核酸检测是指：先将 $k$ 个人的样本混合在一起进行 $1$ 次检测，如果这 $k$ 个人都没感染新冠病毒，则检测结果为阴性；如果这 $k$ 个人中有人感染新冠病毒，则检测结果为阳性，此时需对每人再进行一次检测，得到每人的检测结果，检测结束。现对 $100$ 人进行核酸检测，假设其中只有 $2$ 人感染新冠病毒，并假设每次检测结果准确。],
  parts: (
    subquestion(
      stem: [将这 $100$ 人随机分成 $10$ 组，每组 $10$ 人，且对每组都采用“$10$ 合 $1$”混采核酸检测。],
      parts: (
        subquestion(
          stem: [如果感染新冠病毒的 $2$ 人在同一组，求检测的总次数；],
          answers: ([$20$ 次。],),
          explanation: [先混采检测 $10$ 次，只有一组阳性，再对该组 $10$ 人各检测一次，总次数为 $10+10=20$。],
        ),
        subquestion(
          stem: [已知感染新冠病毒的 $2$ 人在同一组的概率为 $1/11$，设 $X$ 是检测的总次数，求 $X$ 的分布列与数学期望 $E X$；],
          answers: ([分布列见解析，$E X=320/11$。],),
          explanation: [两人在同一组时 $X=20$，不在同一组时有两个阳性组，$X=10+20=30$，故分布列为
            #table(
              columns: 3,
              align: center,
              [$X$], [$20$], [$30$],
              [$P$], [$1/11$], [$10/11$],
            )
            $ E X=20 times 1/11+30 times 10/11=320/11. $],
        ),
      ),
    ),
    subquestion(
      stem: [将这 $100$ 人随机分成 $20$ 组，每组 $5$ 人，且对每组都采用“$5$ 合 $1$”混采核酸检测。设 $Y$ 是检测的总次数，试判断数学期望 $E Y$ 与上一问中 $E X$ 的大小。（结论不要求证明）],
      answers: ([$E Y>E X$。],),
      explanation: [固定一名感染者后，另一名感染者在其余 $99$ 人中，而与其同组的名额有 $4$ 个，故两人在同一组的概率为 $4/99$。
        此时 $Y=25$，否则 $Y=30$，所以
        $ E Y=25 times 4/99+30 times 95/99=2950/99>2880/99=E X. $],
    ),
  ),
)
#question(
  "solution",
  stem: [已知函数 $f(x)=(3-2x)/(x^2+a)$。],
  parts: (
    subquestion(
      stem: [若 $a=0$，求曲线 $y=f(x)$ 在点 $(1,f(1))$ 处的切线方程；],
      answers: ([$4x+y-5=0$。],),
      explanation: [$a=0$ 时，$f(x)=3x^(-2)-2x^(-1)$，$f'(x)=-6x^(-3)+2x^(-2)$。
        ∴ $f(1)=1,f'(1)=-4$，切线方程为 $y-1=-4(x-1)$，即 $4x+y-5=0$。],
    ),
    subquestion(
      stem: [若 $f(x)$ 在 $x=-1$ 处取得极值，求 $f(x)$ 的单调区间，并求其最大值与最小值。],
      answers: (
        [递增区间为 $(-infinity,-1)$、$(4,+infinity)$，递减区间为 $(-1,4)$；最大值为 $1$，最小值为 $-1/4$。],
      ),
      explanation: [∵ $x=-1$ 为极值点，故 $a!=-1$，且
        $ f'(x)=(2(x^2-3x-a))/(x^2+a)^2,quad f'(-1)=(2(4-a))/(1+a)^2=0. $
        ∴ $a=4$，定义域为 $RR$，且
        $ f'(x)=(2(x+1)(x-4))/(x^2+4)^2. $
        所以 $f$ 在 $(-infinity,-1)$、$(4,+infinity)$ 上递增，在 $(-1,4)$ 上递减。
        又 $lim_(x arrow plus.minus infinity) f(x)=0$，$f(-1)=1$，$f(4)=-1/4$，故最大值为 $1$，最小值为 $-1/4$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $E:x^2/a^2+y^2/b^2=1$（$a>b>0$）的一个顶点为 $A(0,-2)$，以椭圆 $E$ 的四个顶点为顶点的四边形面积为 $4sqrt(5)$。],
  parts: (
    subquestion(
      stem: [求椭圆 $E$ 的方程；],
      answers: ([$x^2/5+y^2/4=1$。],),
      explanation: [由 $A(0,-2)$，得 $b=2$。四个顶点组成的菱形面积为 $1/2 times 2a times 2b=2a b=4sqrt(5)$，所以 $a=sqrt(5)$。
        ∴ 椭圆方程为 $x^2/5+y^2/4=1$。],
    ),
    subquestion(
      stem: [过点 $P(0,-3)$ 作斜率为 $k$ 的直线与椭圆 $E$ 交于不同的两点 $B,C$，直线 $A B,A C$ 分别与直线 $y=-3$ 交于点 $M,N$。当 $|P M|+|P N|<=15$ 时，求 $k$ 的取值范围。],
      answers: ([$[-3,-1) union (1,3]$。],),
      explanation: [设 $B(x_1,y_1),C(x_2,y_2)$。联立 $y=k x-3$ 与椭圆方程，得
        $ (4+5k^2)x^2-30k x+25=0. $
        #step[确定相交条件][判别式 $Delta=400(k^2-1)>0$，所以 $|k|>1$。由韦达定理，
          $ x_1+x_2=(30k)/(4+5k^2),quad x_1 x_2=25/(4+5k^2)>0. $
          因 $P$ 不在椭圆上，$x_1,x_2$ 均不为 $0$。又 $y_i>=-2$，而 $y_i=-2$ 只能对应 $A$，其不在 $y=k x-3$ 上，故 $y_i+2>0$。]
        #step[计算距离和][由直线 $A B$ 的方程 $y+2=((y_1+2)/x_1)x$，得 $x_M=-x_1/(y_1+2)$，同理 $x_N=-x_2/(y_2+2)$。
          ∵ $x_1 x_2>0$ 且 $y_i+2>0$，故 $x_M,x_N$ 同号，所以
          $
            |P M|+|P N|=|x_M+x_N|
            =abs((2k x_1 x_2-(x_1+x_2))/(k^2 x_1 x_2-k(x_1+x_2)+1))
            =abs(((20k)/(4+5k^2))/(4/(4+5k^2)))=5|k|.
          $
          由 $5|k|<=15$，结合 $|k|>1$，得 $k in [-3,-1) union (1,3]$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [设 $p$ 为实数。若无穷数列 $\{a_n\}$ 满足如下三个性质，则称 $\{a_n\}$ 为 $R_p$ 数列：
    #linebreak()① $a_1+p>=0$，且 $a_2+p=0$；
    #linebreak()② $a_(4n-1)<a_(4n)$（$n=1,2,dots$）；
    #linebreak()③ $a_(m+n) in {a_m+a_n+p,a_m+a_n+p+1}$（$m=1,2,dots$；$n=1,2,dots$）。],
  parts: (
    subquestion(
      stem: [如果数列 $\{a_n\}$ 的前四项分别为 $2,-2,-2,-1$，那么 $\{a_n\}$ 是否可能为 $R_2$ 数列？说明理由；],
      answers: ([不可能。],),
      explanation: [若为 $R_2$ 数列，令性质③中的 $m=n=1$，则 $a_2 in {2+2+2,2+2+2+1}={6,7}$，与 $a_2=-2$ 矛盾，故不可能。],
    ),
    subquestion(
      stem: [若数列 $\{a_n\}$ 是 $R_0$ 数列，求 $a_5$；],
      answers: ([$1$。],),
      explanation: [由性质①，$a_1>=0,a_2=0$。又由③，$0=a_2 in {2a_1,2a_1+1}$，故 $a_1=0$。
        ∴ $a_3 in {a_1+a_2,a_1+a_2+1}={0,1}$，$a_4 in {2a_2,2a_2+1}={0,1}$。
        结合②中的 $a_3<a_4$，得 $a_3=0,a_4=1$。
        分别取 $5=1+4$ 和 $5=2+3$，由③得
        $ a_5 in {1,2} inter {0,1}={1}. $
        ∴ $a_5=1$。],
    ),
    subquestion(
      stem: [设数列 $\{a_n\}$ 的前 $n$ 项和为 $S_n$，是否存在 $R_p$ 数列 $\{a_n\}$，使得 $S_n>=S_10$ 恒成立？如果存在，求出所有的 $p$；如果不存在，说明理由。],
      answers: ([存在，且 $p=2$。],),
      explanation: [令 $b_n=a_n+p$，则三个性质化为 $b_1>=0,b_2=0$，$b_(4n-1)<b_(4n)$，以及
        $ b_(m+n) in {b_m+b_n,b_m+b_n+1}. $
        所以 $\{b_n\}$ 为 $R_0$ 数列。由上一问，$b_1=b_2=b_3=0,b_4=b_5=1$。
        #step[确定必要的数列项][分别用 $6=3+3=2+4$，得 $b_6 in {0,1} inter {1,2}$，故 $b_6=1$。
          #linebreak()用 $8=2+6=4+4$，得 $b_8 in {1,2} inter {2,3}$，故 $b_8=2$。
          #linebreak()用 $7=3+4$，得 $b_7 in {1,2}$；结合 $b_7<b_8$，得 $b_7=1$。
          #linebreak()用 $10=3+7=2+8$，得 $b_10 in {1,2} inter {2,3}$，故 $b_10=2$。
          #linebreak()用 $12=6+6=4+8$，得 $b_12 in {2,3} inter {3,4}$，故 $b_12=3$。
          #linebreak()用 $11=3+8$，得 $b_11 in {2,3}$；结合 $b_11<b_12$，得 $b_11=2$。]
        #step[确定参数][由 $S_9>=S_10$ 和 $S_11>=S_10$，分别得
          $ a_10=2-p<=0,quad a_11=2-p>=0. $
          ∴ $p=2$。]
        #step[构造数列验证存在性][取 $a_n=floor(n/4)-2$，其中 $floor(x)$ 表示不大于 $x$ 的最大整数。
          此时 $a_1+2=a_2+2=0$，$a_(4n-1)=n-3<n-2=a_(4n)$。
          由取整运算的性质，
          $ floor((m+n)/4) in {floor(m/4)+floor(n/4),floor(m/4)+floor(n/4)+1}, $
          故性质③成立，$\{a_n\}$ 是 $R_2$ 数列。
          又 $n<=10$ 时 $a_n<=0$，$n>=11$ 时 $a_n>=0$，所以对任意正整数 $n$，均有 $S_n>=S_10$。
          综上，存在这样的数列，且所有可能的参数为 $p=2$。]
      ],
    ),
  ),
)
