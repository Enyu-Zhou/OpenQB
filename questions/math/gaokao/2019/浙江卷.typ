#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, space-axes, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "浙江卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019浙江.pdf",
  regions: ("浙江",),
)

#let three-views() = cetz.canvas(length: 5mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((0, 0), (6, 6))
  line((2, 0), (2, 6), stroke: (dash: figure-style.dash))
  line((4, 0), (4, 6))
  rect((8, 0), (14, 6))
  line((11, 0), (11, 6))
  for x in (1, 3, 5) { content((x, -0.25), $2$, anchor: "north") }
  for x in (9.5, 12.5) { content((x, -0.25), $3$, anchor: "north") }
  content((6.2, 3), $6$, anchor: "west")
  content((3, -1.05), [正视图], anchor: "north")
  content((11, -1.05), [侧视图], anchor: "north")
  line((0, -5.5), (2, -2.5), (6, -2.5), (6, -8.5), (4, -8.5), close: true)
  content((3, -8.8), [俯视图], anchor: "north")
})

#let function-option(index) = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(
    stroke: figure-style.thickness,
    axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.15,
      shared-zero: $O$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
    ),
  )
  plot.plot(
    size: (3.6, 3.5),
    axis-style: "school-book",
    x-min: -1,
    x-max: 2.6,
    y-min: -1,
    y-max: 2.5,
    x-label: $x$,
    y-label: $y$,
    x-ticks: (1,),
    x-tick-step: none,
    y-tick-step: none,
    {
      let graph-style = (
        stroke: (paint: black, thickness: figure-style.thickness),
      )
      plot.add(
        x => calc.pow(2, if index == 2 { -x } else { x }),
        domain: (-1, if index == 2 { 2.5 } else { 1.3 }),
        style: graph-style,
      )
      let shift = if index in (0, 2) { -0.5 } else { 0.5 }
      let sign = if index in (0, 3) { -1 } else { 1 }
      plot.add(
        x => sign * calc.log(x + shift, base: 2),
        domain: (
          if sign < 0 { calc.pow(2, -2.4) - shift } else { 0.5 - shift },
          if sign < 0 { 2 - shift } else { 2.5 },
        ),
        style: graph-style,
      )
    },
  )
})

#let prism-diagram(axes: false) = cetz.canvas(length: 16mm, {
  import cetz.draw: *
  let s = calc.sqrt(3)
  let a = (0, -s, 0)
  let b = (1.5, s / 2, 0)
  let c = (0, s, 0)
  let a1 = (0, 0, 3)
  let b1 = (1.5, 1.5 * s, 3)
  let c1 = (0, 2 * s, 3)
  let e = (0, 0, 0)
  let f = (0.75, 0.75 * s, 3)
  oblique-project((-0.36, -0.5), (0.85, 0), (0, 0.93), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, c, stroke: (dash: figure-style.dash))
    line(a1, e, f, stroke: (dash: figure-style.dash))
    line(a1, c, stroke: (dash: figure-style.dash))
    if axes { space-axes((0, s, 3), (2.2, 2.5, 3.55)) }
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, if axes { "north-west" } else { "west" }),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "north-west"),
      (c1, $C_1$, "south-west"),
      (e, $E$, if axes { "north-west" } else { "north-east" }),
      (f, $F$, "south"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})

#let parabola-diagram() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(
    stroke: (thickness: figure-style.thickness, join: "round"),
    axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: $O$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
    ),
  )
  plot.plot(
    size: (5.3, 8),
    axis-style: "school-book",
    x-min: -0.6,
    x-max: 4.7,
    y-min: -3.5,
    y-max: 4.5,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.add(
        range(121).map(i => {
          let y = -3.4 + 7.7 * i / 120
          (y * y / 4, y)
        }),
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.annotate(resize: false, {
        let a = (4, 4)
        let b = (0.25, -1)
        let c = (2.25, -3)
        let g = (13 / 6, 0)
        line(a, b, c, a)
        line(a, g, c)
        content(b, $B$, anchor: "east", padding: 6pt)
        for (point, label, anchor) in (
          (a, $A$, "south"),

          (c, $C$, "north"),
          ((1, 0), $F$, "south"),
          (g, $G$, "north-east"),
          ((3, 0), $Q$, "south-west"),
        ) { content(point, label, anchor: anchor, padding: 3pt) }
      })
    },
  )
})

#section[选择题：本大题共 10 小题，每小题 4 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 4,
  stem: [已知全集 $U={-1,0,1,2,3}$，集合 $A={0,1,2}$，$B={-1,0,1}$，则 $(complement_U A) inter B=$#choice-placeholder()。],
  choices: ([${-1}$], [${0,1}$], [${-1,2,3}$], [${-1,0,1,3}$]),
  answers: ([A],),
  explanation: [$complement_U A={-1,3}$，故 $(complement_U A) inter B={-1}$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [渐近线方程为 $x plus.minus y=0$ 的双曲线的离心率是#choice-placeholder()。],
  choices: ([$sqrt(2)/2$], [$1$], [$sqrt(2)$], [$2$]),
  answers: ([C],),
  explanation: [两渐近线的斜率为 $plus.minus 1$，故双曲线的实半轴长与虚半轴长相等，即 $a=b$。由 $c^2=a^2+b^2$，得 $e=c/a=sqrt(2)$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [若实数 $x,y$ 满足约束条件 $cases(x-3y+4>=0, 3x-y-4<=0, x+y>=0)$，则 $z=3x+2y$ 的最大值是#choice-placeholder()。],
  choices: ([$-1$], [$1$], [$10$], [$12$]),
  answers: ([C],),
  explanation: [由 $3x-y<=4$，$-x+3y<=4$，得 $ 3x+2y=11/8(3x-y)+9/8(-x+3y)<=10. $ 当 $x=y=2$ 时，满足全部约束且取等，故最大值为 $10$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [祖暅是我国南北朝时代的伟大科学家，他提出的“幂势既同，则积不容异”称为祖暅原理，利用该原理可以得到柱体的体积公式 $V_"柱体"=S h$，其中 $S$ 是柱体的底面积，$h$ 是柱体的高。若某柱体的三视图如图所示（单位：$"cm"$），则该柱体的体积（单位：$"cm"^3$）是#choice-placeholder()。
    #figure(three-views())],
  choices: ([$158$], [$162$], [$182$], [$324$]),
  answers: ([B],),
  explanation: [柱体高为 $6$。底面可分成两个高为 $3$ 的直角梯形，两组平行边长分别为 $2,6$ 和 $4,6$，故
    $ S=(2+6)/2 times 3+(4+6)/2 times 3=27, quad V=S h=162. $],
)
#question(
  "single-choice",
  score: 4,
  stem: [若 $a>0$，$b>0$，则“$a+b<=4$”是“$a b<=4$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [∵ $a b<=(a+b)^2/4$，∴ $a+b<=4$ 时有 $a b<=4$。反之，取 $a=1,b=4$，则 $a b=4$ 而 $a+b=5>4$，故为充分不必要条件。],
)
#question(
  "single-choice",
  score: 4,
  stem: [在同一直角坐标系中，函数 $y=1/a^x$，$y=log_a (x+1/2)$（$a>0$，且 $a!=1$）的图象可能是#choice-placeholder()。],
  choices: (
    [#figure(function-option(0))],
    [#figure(function-option(1))],
    [#figure(function-option(2))],
    [#figure(function-option(3))],
  ),
  answers: ([D],),
  explanation: [两函数的单调性相反，排除 B。对数函数的零点恒为 $x=1/2$，A、C 的对数曲线与 $x$ 轴的交点均在 $x=1$ 的右侧，排除。D 中指数曲线递增、对数曲线递减，对应 $0<a<1$，且对数曲线的零点位置正确。],
)
#question(
  "single-choice",
  score: 4,
  stem: [设 $0<a<1$，随机变量 $X$ 的分布列是
    #table(
      columns: 4,
      align: center,
      [$X$], [$0$], [$a$], [$1$],
      [$P$], [$1/3$], [$1/3$], [$1/3$],
    )
    则当 $a$ 在 $(0,1)$ 内增大时#choice-placeholder()。],
  choices: (
    [$D(X)$ 增大],
    [$D(X)$ 减小],
    [$D(X)$ 先增大后减小],
    [$D(X)$ 先减小后增大],
  ),
  answers: ([D],),
  explanation: [$E(X)=(a+1)/3$，故 $ D(X)=(a^2+1)/3-((a+1)/3)^2=2/9(a-1/2)^2+1/6. $ 因此方差在 $(0,1/2)$ 上递减，在 $(1/2,1)$ 上递增。],
)
#question(
  "single-choice",
  score: 4,
  stem: [设三棱锥 $V-A B C$ 的底面是正三角形，侧棱长均相等，$P$ 是棱 $V A$ 上的点（不含端点）。记直线 $P B$ 与直线 $A C$ 所成角为 $alpha$，直线 $P B$ 与平面 $A B C$ 所成角为 $beta$，二面角 $P-A C-B$ 的平面角为 $gamma$，则#choice-placeholder()。],
  choices: (
    [$beta<gamma,alpha<gamma$],
    [$beta<alpha,beta<gamma$],
    [$beta<alpha,gamma<alpha$],
    [$alpha<beta,gamma<beta$],
  ),
  answers: ([B],),
  explanation: [
    #step[建立坐标表示三个角][不妨取 $A=(0,0,0)$，$C=(2,0,0)$，$B=(1,sqrt(3),0)$。侧棱等长，故可设 $V=(1,sqrt(3)/3,h)$，其中 $h>0$。设 $P=(t,t sqrt(3)/3,t h)$，$0<t<1$，其在底面的射影为 $D=(t,t sqrt(3)/3,0)$。]
    #step[比较角的大小][∵ $D B^2=(1-t)^2+(sqrt(3)-t sqrt(3)/3)^2>(1-t)^2$，∴
      $ cos beta=(D B)/(P B)>(1-t)/(P B)=cos alpha, $
      故 $beta<alpha$。设 $D$ 到 $A C$ 的距离为 $d=t/sqrt(3)$，则 $D B^2-d^2=(2-t)^2>0$。于是
      $ tan beta=(t h)/(D B)<(t h)/d=tan gamma. $
      三个角均在 $(0,pi/2)$ 内，故 $beta<gamma$。]
  ],
)
#question(
  "single-choice",
  score: 4,
  stem: [已知 $a,b in RR$，函数 $f(x)=cases(x & quad x<0, 1/3 x^3-1/2(a+1)x^2+a x & quad x>=0)$。若函数 $y=f(x)-a x-b$ 恰有 $3$ 个零点，则#choice-placeholder()。],
  choices: ([$a< -1,b<0$], [$a< -1,b>0$], [$a>-1,b<0$], [$a>-1,b>0$]),
  answers: ([C],),
  explanation: [令 $g(x)=f(x)-a x-b$。当 $x<0$ 时，$g(x)=(1-a)x-b$；当 $x>=0$ 时，$g(x)=x^3/3-(a+1)x^2/2-b$，导数为 $x(x-a-1)$。
    #step[判断 $a$][若 $a<=-1$，非负半轴上 $g$ 严格递增，至多一个零点；负半轴上也至多一个零点，不符。故 $a>-1$。]
    #step[判断 $b$][若 $b>0$，则 $g(0)<0$，$g$ 在 $[0,a+1]$ 递减、在 $[a+1,+infinity)$ 递增，非负半轴至多一个零点，总数不超过两个。若 $b=0$，非负半轴恰有 $0$、$3(a+1)/2$ 两个零点；负半轴在 $a!=1$ 时没有零点，在 $a=1$ 时处处为零，均不符。故 $b<0$。]
  ],
)
#question(
  "single-choice",
  score: 4,
  stem: [设 $a,b in RR$，数列 ${a_n}$ 满足 $a_1=a$，$a_(n+1)=a_n^2+b$，$n in NN^+$，则#choice-placeholder()。],
  choices: (
    [当 $b=1/2$ 时，$a_10>10$],
    [当 $b=1/4$ 时，$a_10>10$],
    [当 $b=-2$ 时，$a_10>10$],
    [当 $b=-4$ 时，$a_10>10$],
  ),
  answers: ([A],),
  explanation: [
    #step[选项 A][当 $b=1/2$ 时，$a_2>=1/2$，且 $a_(n+1)-sqrt(2)a_n=(a_n-sqrt(2)/2)^2>=0$。故 $a_9>=(sqrt(2))^7/2=4sqrt(2)$，从而 $a_10>=32+1/2>10$。]
    #step[其余选项][对于 B，取 $a=1/2$，数列恒为 $1/2$；对于 C，取 $a=2$，数列恒为 $2$；对于 D，取 $a=(1+sqrt(17))/2$，数列恒为该数。这些值均小于 $10$，故其余选项均不成立。]
  ],
)

#section[填空题：本大题共 7 小题，多空题每题 6 分，单空题每题 4 分，共 36 分。]
#question(
  "fill-in",
  score: 4,
  stem: [复数 $z=1/(1+i)$（$i$ 为虚数单位），则 $|z|=$#fill-placeholder()。],
  answers: ([$sqrt(2)/2$],),
  explanation: [$|z|=frac(1, |1+i|)=1/sqrt(2)=sqrt(2)/2$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知圆 $C$ 的圆心坐标是 $(0,m)$，半径长是 $r$。若直线 $2x-y+3=0$ 与圆相切于点 $A(-2,-1)$，则 $m=$#fill-placeholder()，$r=$#fill-placeholder()。],
  answers: ([$-2$], [$sqrt(5)$]),
  explanation: [半径 $C A$ 垂直于切线，其斜率为 $-1/2$，故 $(-1-m)/(-2)=-1/2$，得 $m=-2$。于是 $r=|C A|=sqrt((-2)^2+1^2)=sqrt(5)$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [在二项式 $(sqrt(2)+x)^9$ 的展开式中，常数项是#fill-placeholder()，系数为有理数的项的个数是#fill-placeholder()。],
  answers: ([$16sqrt(2)$], [$5$]),
  explanation: [通项为 $T_(k+1)=binom(9, k)(sqrt(2))^(9-k)x^k$（$k=0,1,dots,9$）。常数项为 $(sqrt(2))^9=16sqrt(2)$。系数为有理数当且仅当 $9-k$ 为偶数，即 $k=1,3,5,7,9$，共 $5$ 项。],
)
#question(
  "fill-in",
  score: 6,
  stem: [在 $triangle A B C$ 中，$angle A B C=90 degree$，$A B=4$，$B C=3$，点 $D$ 在线段 $A C$ 上，若 $angle B D C=45 degree$，则 $B D=$#fill-placeholder()，$cos angle A B D=$#fill-placeholder()。],
  answers: ([$(12sqrt(2))/5$], [$(7sqrt(2))/10$]),
  explanation: [由 $A C=5$，得 $sin A=3/5$，$cos A=4/5$。∵ $angle A D B=135 degree$，∴ 在 $triangle A B D$ 中，由正弦定理得
    $ B D=(A B sin A)/(sin 135 degree)=(12sqrt(2))/5. $
    又 $angle A B D=45 degree-A$，故 $cos angle A B D=(sqrt(2)/2)(cos A+sin A)=(7sqrt(2))/10$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知椭圆 $x^2/9+y^2/5=1$ 的左焦点为 $F$，点 $P$ 在椭圆上且在 $x$ 轴的上方。若线段 $P F$ 的中点在以原点 $O$ 为圆心、$|O F|$ 为半径的圆上，则直线 $P F$ 的斜率是#fill-placeholder()。],
  answers: ([$sqrt(15)$],),
  explanation: [左、右焦点分别为 $F=(-2,0)$、$F'=(2,0)$。在 $triangle P F F'$ 中，$O$ 为 $F F'$ 中点，故题设中点条件给出 $|P F'|=4$，从而 $|P F|=2$。设 $P=(x,y)$，则两焦距平方之差为 $8x=2^2-4^2=-12$，得 $x=-3/2$。代入椭圆且取 $y>0$，得 $y=sqrt(15)/2$，故斜率为 $sqrt(15)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知 $a in RR$，函数 $f(x)=a x^3-x$。若存在 $t in RR$，使得 $|f(t+2)-f(t)|<=2/3$，则实数 $a$ 的最大值是#fill-placeholder()。],
  answers: ([$4/3$],),
  explanation: [令 $m=3(t+1)^2+1>=1$，则 $f(t+2)-f(t)=2a m-2$。题设等价于 $2/3<=a m<=4/3$，从而 $a>0$ 且 $a<=4/(3m)<=4/3$。取 $t=-1$、$a=4/3$ 时满足条件，故最大值为 $4/3$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知正方形 $A B C D$ 的边长为 $1$，当每个 $lambda_i$（$i=1,2,3,4,5,6$）取遍 $plus.minus 1$ 时，$|lambda_1 arrow(A B)+lambda_2 arrow(B C)+lambda_3 arrow(C D)+lambda_4 arrow(D A)+lambda_5 arrow(A C)+lambda_6 arrow(B D)|$ 的最小值是#fill-placeholder()，最大值是#fill-placeholder()。],
  answers: ([$0$], [$2sqrt(5)$]),
  explanation: [取 $arrow(A B)=(1,0)$、$arrow(B C)=(0,1)$，题中向量的坐标为
    $
      (lambda_1-lambda_3+lambda_5-lambda_6,lambda_2-lambda_4+lambda_5+lambda_6).
    $
    #step[最小值][取 $(lambda_1,lambda_2,lambda_3,lambda_4,lambda_5,lambda_6)=(1,-1,1,1,1,1)$，所得向量为零，故最小值为 $0$。]
    #step[最大值][$lambda_5-lambda_6$ 与 $lambda_5+lambda_6$ 中恰有一个为 $0$，另一个的绝对值为 $2$。因此两坐标中一个的绝对值不超过 $2$，另一个不超过 $4$，向量的模不超过 $sqrt(2^2+4^2)=2sqrt(5)$。取 $(1,1,-1,-1,1,1)$ 时得到向量 $(2,4)$，取到最大值。]
  ],
)

#section[解答题：本大题共 5 小题，共 74 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [设函数 $f(x)=sin x$，$x in RR$。],
  parts: (
    subquestion(
      stem: [已知 $theta in [0,2pi)$，函数 $f(x+theta)$ 是偶函数，求 $theta$ 的值。],
      answers: ([$pi/2$ 或 $(3pi)/2$。],),
      explanation: [偶函数条件为 $sin(x+theta)=sin(-x+theta)$ 对任意 $x$ 成立，即 $2sin x cos theta=0$ 对任意 $x$ 成立，故 $cos theta=0$。结合 $theta in [0,2pi)$，得 $theta=pi/2$ 或 $(3pi)/2$。],
    ),
    subquestion(
      stem: [求函数 $y=[f(x+pi/12)]^2+[f(x+pi/4)]^2$ 的值域。],
      answers: ([$[1-sqrt(3)/2,1+sqrt(3)/2]$],),
      explanation: [由降幂公式及和差化积公式得
        $ y=1-1/2(cos(2x+pi/6)+cos(2x+pi/2))=1-sqrt(3)/2 cos(2x+pi/3). $
        ∵ 余弦函数取遍 $[-1,1]$，∴ 所求值域为 $[1-sqrt(3)/2,1+sqrt(3)/2]$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，已知三棱柱 $A B C-A_1 B_1 C_1$，平面 $A_1 A C C_1 perp$ 平面 $A B C$，$angle A B C=90 degree$，$angle B A C=30 degree$，$A_1 A=A_1 C=A C$，$E,F$ 分别是 $A C,A_1 B_1$ 的中点。
    #figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [证明：$E F perp B C$。],
      answers: ([证明见解析。],),
      explanation: [等边三角形 $A_1 A C$ 中，$A_1 E perp A C$。由平面 $A_1 A C C_1 perp$ 平面 $A B C$，得 $A_1 E perp$ 平面 $A B C$，故 $A_1 E perp B C$。又 $A_1 B_1 parallel A B$，$A B perp B C$，故 $A_1 B_1 perp B C$。∵ $A_1 E inter A_1 B_1=A_1$，∴ $B C perp$ 平面 $A_1 B_1 E$。由 $E F subset$ 平面 $A_1 B_1 E$，得 $E F perp B C$。],
    ),
    subquestion(
      stem: [求直线 $E F$ 与平面 $A_1 B C$ 所成角的余弦值。],
      answers: ([$3/5$],),
      explanation: [
        #step[建立空间坐标系][以 $E$ 为原点，在平面 $A B C$ 内垂直于 $A C$ 且朝向 $B$ 的方向、$E C$ 方向、$E A_1$ 方向依次为 $x,y,z$ 轴正方向。不妨令 $A C=2sqrt(3)$，则
          $ A=(0,-sqrt(3),0), quad C=(0,sqrt(3),0), quad A_1=(0,0,3), $
          $
            B=(3/2,sqrt(3)/2,0), quad B_1=(3/2,(3sqrt(3))/2,3), quad F=(3/4,(3sqrt(3))/4,3).
          $
          #figure(prism-diagram(axes: true))]
        #step[由法向量求线面角][取平面 $A_1 B C$ 的法向量 $bold(n)=(1,sqrt(3),1)$，它与 $arrow(A_1 B)=(3/2,sqrt(3)/2,-3)$、$arrow(B C)=(-3/2,sqrt(3)/2,0)$ 均垂直。设所求角为 $phi$，则
          $
            sin phi=frac(|arrow(E F) dot bold(n)|, |arrow(E F)| |bold(n)|)=6/((3sqrt(5))/2 times sqrt(5))=4/5.
          $
          因此 $cos phi=sqrt(1-(4/5)^2)=3/5$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [设等差数列 ${a_n}$ 的前 $n$ 项和为 $S_n$，$a_3=4$，$a_4=S_3$。数列 ${b_n}$ 满足：对每个 $n in NN^+$，$S_n+b_n$，$S_(n+1)+b_n$，$S_(n+2)+b_n$ 成等比数列。],
  parts: (
    subquestion(
      stem: [求数列 ${a_n},{b_n}$ 的通项公式。],
      answers: ([$a_n=2n-2$，$b_n=n(n+1)$。],),
      explanation: [设公差为 $d$。由 $a_1+2d=4$、$a_1+3d=3a_1+3d$，得 $a_1=0,d=2$，故 $a_n=2n-2$，$S_n=n(n-1)$。
        由等比中项关系，有
        $ [n(n+1)+b_n]^2=[n(n-1)+b_n][(n+1)(n+2)+b_n]. $
        化简得 $b_n=n(n+1)$。代入后三项依次为 $2n^2,2n(n+1),2(n+1)^2$，确实成等比数列。],
    ),
    subquestion(
      stem: [记 $c_n=sqrt(a_n/(2b_n))$，$n in NN^+$，证明：$c_1+c_2+dots+c_n<2sqrt(n)$，$n in NN^+$。],
      answers: ([证明见解析。],),
      explanation: [由第（1）问，$c_n=sqrt((n-1)/(n(n+1)))$。对 $n>=2$，
        $ c_n<1/sqrt(n)<2/(sqrt(n)+sqrt(n-1))=2(sqrt(n)-sqrt(n-1)). $
        又 $c_1=0<2(sqrt(1)-sqrt(0))$。逐项相加即得
        $ c_1+c_2+dots+c_n<2sum_(k=1)^n (sqrt(k)-sqrt(k-1))=2sqrt(n). $],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，已知点 $F(1,0)$ 为抛物线 $y^2=2p x$（$p>0$）的焦点，过点 $F$ 的直线交抛物线于 $A,B$ 两点，点 $C$ 在抛物线上，使得 $triangle A B C$ 的重心 $G$ 在 $x$ 轴上，直线 $A C$ 交 $x$ 轴于点 $Q$，且 $Q$ 在点 $F$ 的右侧。记 $triangle A F G$、$triangle C Q G$ 的面积分别为 $S_1,S_2$。
    #figure(parabola-diagram())],
  parts: (
    subquestion(
      stem: [求 $p$ 的值及抛物线的准线方程。],
      answers: ([$p=2$，准线方程为 $x=-1$。],),
      explanation: [焦点为 $(p/2,0)=(1,0)$，故 $p=2$。准线方程为 $x=-p/2=-1$。],
    ),
    subquestion(
      stem: [求 $S_1/S_2$ 的最小值及此时点 $G$ 的坐标。],
      answers: ([最小值为 $1+sqrt(3)/2$，此时 $G=(2,0)$。],),
      explanation: [
        #step[用抛物线参数表示各点][设 $A=(t^2,2t)$，其中 $t!=0$。焦点弦两端点的纵坐标乘积为 $-4$，故 $B=(1/t^2,-2/t)$。重心在 $x$ 轴上，故
          $ C=((1/t-t)^2,2(1/t-t)), quad G=(2(t^4-t^2+1)/(3t^2),0). $
          抛物线上参数为 $t,s$ 的两点所连直线方程为 $2x-(t+s)y+2t s=0$。取 $s=1/t-t$，得 $Q=(t^2-1,0)$。∵ $Q$ 在 $F$ 右侧，∴ $t^2>2$。]
        #step[求面积比][令 $u=t^2>2$，则
          $ x_G-1=((2u-1)(u-2))/(3u)>0, quad x_Q-x_G=((u-2)(u+1))/(3u)>0. $
          ∴ $F,G,Q$ 从左到右排列。于是
          $
            S_1/S_2=frac(|y_A|(x_G-1), |y_C|(x_Q-x_G))=u/(u-1) dot (2u-1)/(u+1)=2-(u-2)/(u^2-1).
          $]
        #step[求最小值及等号条件][令 $v=u-2>0$，则
          $ S_1/S_2=2-1/(v+4+3/v)>=2-1/(4+2sqrt(3))=1+sqrt(3)/2. $
          等号当且仅当 $v=sqrt(3)$，即 $u=2+sqrt(3)$ 时成立。此时 $1/u=2-sqrt(3)$，故 $x_G=2/3(u-1+1/u)=2$，即 $G=(2,0)$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知实数 $a!=0$，设函数 $f(x)=a ln x+sqrt(x+1)$，$x>0$。],
  parts: (
    subquestion(
      stem: [当 $a=-3/4$ 时，求函数 $f(x)$ 的单调区间。],
      answers: ([单调递减区间为 $(0,3)$，单调递增区间为 $(3,+infinity)$。],),
      explanation: [$
          f'(x)=-3/(4x)+1/(2sqrt(x+1))=((x-3)(4x+3))/(4x sqrt(x+1)(2x+3sqrt(x+1))).
        $
        分母及 $4x+3$ 均为正，故 $f'(x)$ 与 $x-3$ 同号。因此 $f$ 在 $(0,3)$ 上单调递减，在 $(3,+infinity)$ 上单调递增。],
    ),
    subquestion(
      stem: [对任意 $x in [1/e^2,+infinity)$ 均有 $f(x)<=sqrt(x)/(2a)$，求 $a$ 的取值范围。（注：$e=2.71828 dots$ 为自然对数的底数。）],
      answers: ([$(0,sqrt(2)/4]$],),
      explanation: [
        #step[由特殊点确定必要条件][取 $x=1$，得 $sqrt(2)<=1/(2a)$，故 $0<a<=sqrt(2)/4$。]
        #step[转化为二次函数的非负性][下面证明上述范围内的 $a$ 均满足要求。令 $t=1/a>=2sqrt(2)$，原不等式等价于
          $ g_x (t)=sqrt(x)t^2-2sqrt(x+1)t-2ln x>=0. $
          配方得
          $ g_x (t)=sqrt(x)(t-sqrt(1+1/x))^2-(x+1)/sqrt(x)-2ln x. $]
        #step[讨论 $x>=1/7$][此时二次函数的对称轴 $sqrt(1+1/x)<=2sqrt(2)$，故
          $
            g_x (t)>=g_x (2sqrt(2))=2p(x), quad p(x)=4sqrt(x)-2sqrt(2x+2)-ln x.
          $
          求导并整理得
          $
            p'(x)=((x-1)[1+sqrt(x)(sqrt(2x+2)-1)])/(x sqrt(x+1)(sqrt(x)+1)(sqrt(x+1)+sqrt(2x))).
          $
          ∵ 除 $x-1$ 外各因子均为正，∴ $p$ 在 $(0,1)$ 上递减，在 $(1,+infinity)$ 上递增。因此 $p(x)>=p(1)=0$，从而 $g_x (t)>=0$。]
        #step[讨论 $1/e^2<=x<1/7$][由配方，$g_x (t)>=-q(x)/sqrt(x)$，其中 $q(x)=2sqrt(x)ln x+x+1$。在 $[1/e^2,1/7]$ 上，
          $ q'(x)=(ln x+2)/sqrt(x)+1>0. $
          又 $q(1/7)=-(2/sqrt(7))p(1/7)<0$，故 $q(x)<0$，从而 $g_x (t)>0$。综上，所求范围为 $(0,sqrt(2)/4]$。]
      ],
    ),
  ),
)
