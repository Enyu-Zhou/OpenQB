#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校招生全国统一考试",
  name: "浙江卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2021/2021浙江.pdf",
  regions: ("浙江",),
)

#let three-views() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for dx in (0, 3) {
    rect((dx, 0), (dx + 2, 1))
    line((dx + 1, 0), (dx + 1, 1))
    for i in (0, 1) {
      line((dx + i, -0.18), (dx + i + 1, -0.18), mark: (start: ">", end: ">"))
      content(
        (dx + i + 0.5, -0.18),
        $1$,
        frame: "rect",
        fill: white,
        stroke: none,
        padding: 1pt,
      )
    }
    content(
      (dx + 1, -0.48),
      if dx == 0 { [正视图] } else { [侧视图] },
      anchor: "north",
    )
  }
  line((-0.2, 0), (-0.2, 1), mark: (start: ">", end: ">"))
  content(
    (-0.2, 0.5),
    $1$,
    frame: "rect",
    fill: white,
    stroke: none,
    padding: 1pt,
  )
  line((0, -1.2), (0, -2.2), (1, -3.2), (2, -3.2), close: true)
  content((1, -3.4), [俯视图], anchor: "north")
})

#let cube-diagram() = cetz.canvas(length: 30mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (1, 0, 0)
  let c = (1, 1, 0)
  let d = (0, 1, 0)
  let a1 = (0, 0, 1)
  let b1 = (1, 0, 1)
  let c1 = (1, 1, 1)
  let d1 = (0, 1, 1)
  let m = (0, 0.5, 0.5)
  let n = (0.5, 0.5, 0.5)
  oblique-project((1, 0), (0.35, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(a1, d, b, d1, stroke: (dash: figure-style.dash))
    line(d1, b1)
    line(m, n, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "north-west"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
      (m, $M$, "east"),
      (n, $N$, "south-west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#let function-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
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
    size: (5, 3.2),
    axis-style: "school-book",
    x-min: -2.1,
    x-max: 2.1,
    y-min: -1.1,
    y-max: 1.1,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((-calc.pi / 4, $-pi/4$), (calc.pi / 4, $pi/4$)),
    {
      plot.add(
        x => calc.sin(x * 1rad) / (x * x + 0.25),
        domain: (-1.95, 1.95),
        samples: 150,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
    },
  )
})

#let pythagorean-diagram() = cetz.canvas(length: 5mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  line((0, 3), (4, 0), (1, -4), (-3, -1), close: true)
  line((0, 3), (0, -1))
  line((-3, -1), (1, -1))
  line((4, 0), (0, 0))
  line((1, -4), (1, 0))
})

#let pyramid-diagram() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  let s = calc.sqrt(3)
  let a = (-s, 2, 0)
  let b = (-s, 1, 0)
  let c = (s, -1, 0)
  let d = (s, 0, 0)
  let m = (0, 0, 0)
  let p = (0, 0, 2 * calc.sqrt(2))
  let n = (s / 2, -0.5, calc.sqrt(2))
  oblique-project((0.75, 0.3), (-0.45, 0.25), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, a, b, c, p)
    line(p, b)
    line(p, m)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(p, d, m, stroke: (dash: figure-style.dash))
    line(a, n, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (p, $P$, "south"),
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (m, $M$, "north"),
      (n, $N$, "west"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
    content((s - 0.45, 0, 0.33), $D$, anchor: "east", padding: 2pt)
  })
})

#let parabola-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  let t = 0.25
  let n = (calc.sqrt(13) - 1) / (calc.sqrt(13) + 1)
  let ya = 2 * t + 2 * calc.sqrt(t * t + 1)
  let yb = 2 * t - 2 * calc.sqrt(t * t + 1)
  let a = (ya * ya / 4, ya)
  let b = (yb * yb / 4, yb)
  let yp = 2 * (n + 1) * ya / (2 * a.at(0) + 2 - ya)
  let yq = 2 * (n + 1) * yb / (2 * b.at(0) + 2 - yb)
  let yr = 2 * (n - 1) / (2 * t - 1)
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
    size: (4.2, 6.3),
    axis-style: "school-book",
    x-min: -1.4,
    x-max: 2.8,
    y-min: -2.8,
    y-max: 3.5,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.add(
        range(161).map(i => {
          let y = -2.75 + 6.05 * i / 160
          (y * y / 4, y)
        }),
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.annotate(resize: false, {
        line((-1, 0), (yp / 2 + n, yp))
        line((-1, 0), (1.6, -2.6 * ya / (a.at(0) + 1)))
        line(b, a)
        line((-1.2 + n, -2.4), (1.625 + n, 3.25))
        for (point, label, anchor) in (
          ((-1, 0), $M$, "north-east"),
          ((1, 0), $F$, "north-west"),
          ((n, 0), $N$, "south-east"),
          (a, $A$, "south-east"),
          (b, $B$, "north-east"),
          ((yp / 2 + n, yp), $P$, "south-east"),

          ((yr / 2 + n, yr), $R$, "west"),
          ((-1.2 + n, -2.4), $l$, "east"),
        ) { content(point, label, anchor: anchor, padding: 3pt) }
        content((yq / 2 + n, yq), $Q$, anchor: "east", padding: 8pt)
      })
    },
  )
})

#section[单项选择题]
#question(
  "single-choice",
  stem: [设集合 $A={x | x>=1},B={x | -1<x<2}$，则 $A inter B=$#choice-placeholder()。],
  choices: (
    [$\{x | x>-1\}$],
    [$\{x | x>=1\}$],
    [$\{x | -1<x<1\}$],
    [$\{x | 1<=x<2\}$],
  ),
  answers: ([D],),
  explanation: [同时满足 $x>=1$ 与 $-1<x<2$，得 $A inter B={x | 1<=x<2}$。],
)
#question(
  "single-choice",
  stem: [已知 $a in RR$，$(1+a i)i=3+i$（$i$ 为虚数单位），则 $a=$#choice-placeholder()。],
  choices: ([$-1$], [$1$], [$-3$], [$3$]),
  answers: ([C],),
  explanation: [$(1+a i)i=-a+i=3+i$，比较实部，得 $a=-3$。],
)
#question(
  "single-choice",
  stem: [已知非零向量 $bold(a),bold(b),bold(c)$，则“$bold(a) dot bold(c)=bold(b) dot bold(c)$”是“$bold(a)=bold(b)$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([B],),
  explanation: [$bold(a)=bold(b)$ 能推出数量积相等。反之，取 $bold(a)=(1,1),bold(b)=(1,2),bold(c)=(1,0)$，则两数量积均为 $1$，但 $bold(a)!=bold(b)$，故为必要不充分条件。],
)
#question(
  "single-choice",
  stem: [某几何体的三视图如图所示（单位：$"cm"$），则该几何体的体积（单位：$"cm"^3$）是#choice-placeholder()。
    #figure(three-views())],
  choices: ([$3/2$], [$3$], [$(3sqrt(2))/2$], [$3sqrt(2)$]),
  answers: ([A],),
  explanation: [该几何体是高为 $1$ 的直棱柱。俯视图中的底面可看作直角边长 $2$ 的等腰直角三角形，减去直角边长 $1$ 的等腰直角三角形，故底面积为 $1/2 times 2^2-1/2 times 1^2=3/2$。
    ∴ 体积为 $V=3/2 times 1=3/2$。],
)
#question(
  "single-choice",
  stem: [若实数 $x,y$ 满足约束条件 $cases(x+1>=0, x-y<=0, 2x+3y-1<=0)$，则 $z=x-1/2 y$ 的最小值是#choice-placeholder()。],
  choices: ([$-2$], [$-3/2$], [$-1/2$], [$1/10$]),
  answers: ([B],),
  explanation: [由 $y<=(1-2x)/3$ 及 $x>=-1$，得
    $ z=x-y/2>=x-(1-2x)/6=(4x)/3-1/6>=-3/2. $
    当 $(x,y)=(-1,1)$ 时满足全部约束并取等号，故最小值为 $-3/2$。],
)
#question(
  "single-choice",
  stem: [如图，已知正方体 $A B C D-A_1 B_1 C_1 D_1$，$M,N$ 分别是 $A_1 D,D_1 B$ 的中点，则#choice-placeholder()。
    #figure(cube-diagram())],
  choices: (
    [直线 $A_1 D$ 与直线 $D_1 B$ 垂直，直线 $M N parallel$ 平面 $A B C D$],
    [直线 $A_1 D$ 与直线 $D_1 B$ 平行，直线 $M N perp$ 平面 $B D D_1 B_1$],
    [直线 $A_1 D$ 与直线 $D_1 B$ 相交，直线 $M N parallel$ 平面 $A B C D$],
    [直线 $A_1 D$ 与直线 $D_1 B$ 异面，直线 $M N perp$ 平面 $B D D_1 B_1$],
  ),
  answers: ([A],),
  explanation: [以 $A$ 为原点，$A B,A D,A A_1$ 的方向为坐标轴正向，棱长取 $1$，则
    $ arrow(A_1 D)=(0,1,-1),quad arrow(D_1 B)=(1,-1,-1). $
    两向量的数量积为 $0$，故 $A_1 D perp D_1 B$。
    又 $M=(0,1/2,1/2),N=(1/2,1/2,1/2)$，所以 $M N parallel A B$，且 $M N$ 不在底面内，故 $M N parallel$ 平面 $A B C D$。
    平面 $B D D_1 B_1$ 的法向量可取 $(1,1,0)$，与 $arrow(M N)$ 不平行，故 $M N$ 不垂直该平面。],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x)=x^2+1/4,g(x)=sin x$，则图象为如图的函数可能是#choice-placeholder()。
    #figure(function-diagram())],
  choices: (
    [$y=f(x)+g(x)-1/4$],
    [$y=f(x)-g(x)-1/4$],
    [$y=f(x)g(x)$],
    [$y=g(x)/f(x)$],
  ),
  answers: ([D],),
  explanation: [图象关于原点对称，故对应奇函数，排除 A、B 中的 $x^2 plus.minus sin x$。
    对于 C，$h(x)=(x^2+1/4)sin x$，在 $0<x<pi/2$ 上有
    $ h'(x)=2x sin x+(x^2+1/4)cos x>0. $
    因而在 $x=pi/4$ 附近递增，与图象在此处递减不符，故选 D。],
)
#question(
  "single-choice",
  stem: [已知 $alpha,beta,gamma$ 是互不相同的锐角，则在 $sin alpha cos beta,sin beta cos gamma,sin gamma cos alpha$ 三个值中，大于 $1/2$ 的个数的最大值是#choice-placeholder()。],
  choices: ([$0$], [$1$], [$2$], [$3$]),
  answers: ([C],),
  explanation: [由 $2u v<=u^2+v^2$，三式相加得
    $ sin alpha cos beta+sin beta cos gamma+sin gamma cos alpha<=3/2. $
    所以不可能三个都大于 $1/2$。
    取 $alpha=pi/6,beta=pi/3,gamma=pi/4$，三个值分别为 $1/4,sqrt(6)/4,sqrt(6)/4$，后两个大于 $1/2$，故最大个数为 $2$。],
)
#question(
  "single-choice",
  stem: [已知 $a,b in RR,a b>0$，函数 $f(x)=a x^2+b$（$x in RR$）。若 $f(s-t),f(s),f(s+t)$ 成等比数列，则平面上点 $(s,t)$ 的轨迹是#choice-placeholder()。],
  choices: ([直线和圆], [直线和椭圆], [直线和双曲线], [直线和抛物线]),
  answers: ([C],),
  explanation: [∵ $a b>0$，故 $f(x)$ 始终非零，成等比数列等价于 $f(s-t)f(s+t)=f(s)^2$。
    展开整理得 $a t^2(a t^2-2a s^2+2b)=0$，故
    $ t=0 quad "或" quad s^2/(b/a)-t^2/(2b/a)=1. $
    又 $b/a>0$，所以轨迹是直线与双曲线。],
)
#question(
  "single-choice",
  stem: [已知数列 $\{a_n\}$ 满足 $a_1=1,a_(n+1)=a_n/(1+sqrt(a_n))$（$n in NN^*$）。记数列 $\{a_n\}$ 的前 $n$ 项和为 $S_n$，则#choice-placeholder()。],
  choices: ([$3/2<S_100<3$], [$3<S_100<4$], [$4<S_100<9/2$], [$9/2<S_100<5$]),
  answers: ([A],),
  explanation: [各项为正，且 $a_2=1/2$，故 $S_100>a_1+a_2=3/2$。
    #step[先估计各项的下界][令 $u_n=1/sqrt(a_n)>0$，由递推式得
      $ u_(n+1)^2=u_n^2+u_n<(u_n+1/2)^2. $
      故 $u_(n+1)<u_n+1/2$，累加并结合 $u_1=1$，有 $u_n<=(n+1)/2$，即 $sqrt(a_n)>=2/(n+1)$。]
    #step[再估计各项的上界][
      $ a_(n+1)/a_n=1/(1+sqrt(a_n))<=(n+1)/(n+3). $
      连乘得 $a_n<=6/((n+1)(n+2))$（$n=1$ 时同样成立）。因此
      $ S_100<=6sum_(n=1)^100(1/(n+1)-1/(n+2))=6(1/2-1/102)<3. $
      综上，$3/2<S_100<3$。]
  ],
)

#section[填空题]
#question(
  "fill-in",
  stem: [我国古代数学家赵爽用弦图给出了勾股定理的证明。弦图是由四个全等的直角三角形和中间的一个小正方形拼成的一个大正方形（如图所示）。若直角三角形直角边的长分别是 $3,4$，记大正方形的面积为 $S_1$，小正方形的面积为 $S_2$，则 $S_1/S_2=$#fill-placeholder()。
    #figure(pythagorean-diagram())],
  answers: ([$25$],),
  explanation: [大正方形边长为直角三角形的斜边，故 $S_1=3^2+4^2=25$。小正方形边长为 $4-3=1$，故 $S_2=1$，所以 $S_1/S_2=25$。],
)
#question(
  "fill-in",
  stem: [已知 $a in RR$，函数 $f(x)=cases(x^2-4 & quad x>2, |x-3|+a & quad x<=2)$，若 $f(f(sqrt(6)))=3$，则 $a=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [$f(sqrt(6))=6-4=2$，故 $f(2)=|2-3|+a=1+a=3$，得 $a=2$。],
)
#question(
  "fill-in",
  stem: [已知多项式
    $ (x-1)^3+(x+1)^4=x^4+a_1 x^3+a_2 x^2+a_3 x+a_4, $
    则 $a_1=$#fill-placeholder()，$a_2+a_3+a_4=$#fill-placeholder()。],
  answers: ([$5$], [$10$]),
  explanation: [比较 $x^3$ 的系数，得 $a_1=1+4=5$。令 $x=1$，得 $16=1+a_1+a_2+a_3+a_4$，故 $a_2+a_3+a_4=10$。],
)
#question(
  "fill-in",
  stem: [在 $triangle A B C$ 中，$angle B=60 degree,A B=2$，$M$ 是 $B C$ 的中点，$A M=2sqrt(3)$，则 $A C=$#fill-placeholder()，$cos angle M A C=$#fill-placeholder()。],
  answers: ([$2sqrt(13)$], [$(2sqrt(39))/13$]),
  explanation: [设 $B M=t>0$。在 $triangle A B M$ 中，由余弦定理得 $12=4+t^2-2t$，解得 $t=4$，故 $B C=8,M C=4$。
    $ A C^2=2^2+8^2-2 times 2 times 8 cos 60 degree=52,quad A C=2sqrt(13). $
    再在 $triangle A M C$ 中用余弦定理，得
    $
      cos angle M A C=(A M^2+A C^2-M C^2)/(2 A M dot A C)=(12+52-16)/(2 times 2sqrt(3) times 2sqrt(13))=(2sqrt(39))/13.
    $],
)
#question(
  "fill-in",
  stem: [袋中有 $4$ 个红球，$m$ 个黄球，$n$ 个绿球。现从中任取两个球，记取出的红球数为 $xi$，若取出的两个球都是红球的概率为 $1/6$，一红一黄的概率为 $1/3$，则 $m-n=$#fill-placeholder()，$E(xi)=$#fill-placeholder()。],
  answers: ([$1$], [$8/9$]),
  explanation: [设球的总数为 $T=4+m+n$，则 $binom(4, 2)/binom(T, 2)=1/6$，故 $binom(T, 2)=36$，$T=9$。
    由 $(4m)/36=1/3$，得 $m=3,n=2$，故 $m-n=1$。
    又 $P(xi=2)=1/6,P(xi=1)=(4 times 5)/36=5/9$，所以 $E(xi)=2 times 1/6+5/9=8/9$。],
)
#question(
  "fill-in",
  stem: [已知椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$），焦点 $F_1(-c,0),F_2(c,0)$（$c>0$），若过 $F_1$ 的直线和圆 $(x-1/2 c)^2+y^2=c^2$ 相切，与椭圆在第一象限交于点 $P$，且 $P F_2 perp x$ 轴，则该直线的斜率是#fill-placeholder()，椭圆的离心率是#fill-placeholder()。],
  answers: ([$(2sqrt(5))/5$], [$sqrt(5)/5$]),
  explanation: [设直线为 $y=k(x+c)$，由 $P$ 在第一象限且 $x_P=c$，知 $k>0$。
    圆心 $(c/2,0)$ 到直线的距离为 $c$，故 $(3k c)/(2sqrt(1+k^2))=c$，解得 $k=2/sqrt(5)$。
    ∴ $|P F_2|=2c k=(4c)/sqrt(5)$，$|P F_1|=sqrt((2c)^2+((4c)/sqrt(5))^2)=(6c)/sqrt(5)$。
    由椭圆定义，$2a=|P F_1|+|P F_2|=2sqrt(5)c$，故 $e=c/a=sqrt(5)/5$。],
)
#question(
  "fill-in",
  stem: [已知平面向量 $bold(a),bold(b),bold(c)$（$bold(c)!=bold(0)$）满足 $|bold(a)|=1,|bold(b)|=2,bold(a) dot bold(b)=0,(bold(a)-bold(b)) dot bold(c)=0$。记向量 $bold(d)$ 在 $bold(a),bold(b)$ 方向上的投影分别为 $x,y$，$bold(d)-bold(a)$ 在 $bold(c)$ 方向上的投影为 $z$，则 $x^2+y^2+z^2$ 的最小值是#fill-placeholder()。],
  answers: ([$2/5$],),
  explanation: [取 $bold(a)=(1,0),bold(b)=(0,2)$，则 $bold(d)=(x,y)$。由垂直条件，$bold(c)$ 与 $(2,1)$ 平行，故不论其方向如何，均有 $z^2=(2x+y-2)^2/5$。
    记 $u=2x+y$，由柯西不等式 $u^2<=5(x^2+y^2)$，得
    $ x^2+y^2+z^2>=(u^2+(u-2)^2)/5=2/5(u-1)^2+2/5>=2/5. $
    当 $x=2/5,y=1/5$ 时同时取等号，故最小值为 $2/5$。],
)

#section[解答题]
#question("solution", stem: [设函数 $f(x)=sin x+cos x$（$x in RR$）。], parts: (
  subquestion(
    stem: [求函数 $y=[f(x+pi/2)]^2$ 的最小正周期；],
    answers: ([$pi$。],),
    explanation: [$f(x+pi/2)=cos x-sin x$，故 $y=(cos x-sin x)^2=1-sin 2x$，最小正周期为 $pi$。],
  ),
  subquestion(
    stem: [求函数 $y=f(x)f(x-pi/4)$ 在 $[0,pi/2]$ 上的最大值。],
    answers: ([$1+sqrt(2)/2$。],),
    explanation: [$f(x-pi/4)=sqrt(2)sin x$，所以
      $ y=sqrt(2)sin x(sin x+cos x)=sqrt(2)/2+sin(2x-pi/4). $
      当 $x in [0,pi/2]$ 时，$2x-pi/4 in [-pi/4,(3pi)/4]$。在 $x=(3pi)/8$ 时正弦项取最大值 $1$，故所求最大值为 $1+sqrt(2)/2$。],
  ),
))
#question(
  "solution",
  stem: [如图，在四棱锥 $P-A B C D$ 中，底面 $A B C D$ 是平行四边形，$angle A B C=120 degree,A B=1,B C=4,P A=sqrt(15)$，$M,N$ 分别为 $B C,P C$ 的中点，$P D perp D C,P M perp M D$。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [证明：$A B perp P M$；],
      answers: ([证明见解析。],),
      explanation: [在 $triangle D C M$ 中，$D C=1,C M=2,angle D C M=60 degree$，故
        $ D M^2=1^2+2^2-2 times 1 times 2 cos 60 degree=3. $
        ∴ $D M^2+D C^2=C M^2$，所以 $D M perp D C$。
        又 $P D perp D C$，且 $P D inter D M={D}$，故 $D C perp$ 平面 $P D M$，从而 $D C perp P M$。
        ∵ $A B parallel D C$，∴ $A B perp P M$。],
    ),
    subquestion(
      stem: [求直线 $A N$ 与平面 $P D M$ 所成角的正弦值。],
      answers: ([$sqrt(15)/6$。],),
      explanation: [由上一问及已知条件，$P M$ 垂直于底面内两条相交直线 $D C,D M$，故 $P M perp$ 平面 $A B C D$。
        在 $triangle A B M$ 中，$A M^2=1^2+2^2-2 times 1 times 2 cos 120 degree=7$，所以 $P M=sqrt(P A^2-A M^2)=2sqrt(2)$。
        以 $M$ 为原点，$M D$、$C D$、$M P$ 的方向为三个坐标轴正向，则
        $ A=(-sqrt(3),2,0),P=(0,0,2sqrt(2)),C=(sqrt(3),-1,0), $
        $
          N=(sqrt(3)/2,-1/2,sqrt(2)),quad arrow(A N)=((3sqrt(3))/2,-5/2,sqrt(2)).
        $
        平面 $P D M$ 的法向量可取 $bold(n)=(0,1,0)$，故所求正弦值为
        $
          abs(arrow(A N) dot bold(n))/(|arrow(A N)| |bold(n)|)=(5/2)/sqrt(27/4+25/4+2)=sqrt(15)/6.
        $],
    ),
  ),
)
#question(
  "solution",
  stem: [已知数列 $\{a_n\}$ 的前 $n$ 项和为 $S_n$，$a_1=-9/4$，且 $4S_(n+1)=3S_n-9$（$n in NN^*$）。],
  parts: (
    subquestion(
      stem: [求数列 $\{a_n\}$ 的通项公式；],
      answers: ([$a_n=-3(3/4)^n$。],),
      explanation: [当 $n=1$ 时，$4(a_1+a_2)=3a_1-9$，故 $a_2=-27/16=3/4 a_1$。
        当 $n>=2$ 时，将 $4S_(n+1)=3S_n-9$ 与 $4S_n=3S_(n-1)-9$ 相减，得 $4a_(n+1)=3a_n$。
        ∴ 数列为首项 $-9/4$、公比 $3/4$ 的等比数列，$a_n=-3(3/4)^n$。],
    ),
    subquestion(
      stem: [设数列 $\{b_n\}$ 满足 $3b_n+(n-4)a_n=0$，记 $\{b_n\}$ 的前 $n$ 项和为 $T_n$，若 $T_n<=lambda b_n$ 对任意 $n in NN^*$ 恒成立，求实数 $lambda$ 的取值范围。],
      answers: ([$[-3,1]$。],),
      explanation: [令 $r=3/4$，则 $b_n=(n-4)r^n$。由错位相减，
        $ (1-r)T_n=-3r+sum_(k=2)^n r^k-(n-4)r^(n+1)=-n r^(n+1). $
        故 $T_n=-4n r^(n+1)=-3n r^n$。原不等式等价于
        $ (lambda+3)n-4lambda>=0 quad (n in NN^*). $
        若 $lambda+3<0$，当 $n$ 足够大时左端为负，不成立，故 $lambda>=-3$。
        在此条件下左端关于 $n$ 不减，故只需且必须在 $n=1$ 时非负，即 $3-3lambda>=0$，得 $lambda<=1$。
        ∴ $lambda in [-3,1]$。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，已知 $F$ 是抛物线 $y^2=2p x$（$p>0$）的焦点，$M$ 是抛物线的准线与 $x$ 轴的交点，且 $|M F|=2$。
    #figure(parabola-diagram())],
  parts: (
    subquestion(
      stem: [求抛物线方程；],
      answers: ([$y^2=4x$。],),
      explanation: [$M=(-p/2,0),F=(p/2,0)$，故 $|M F|=p=2$，抛物线方程为 $y^2=4x$。],
    ),
    subquestion(
      stem: [设过点 $F$ 的直线交抛物线于 $A,B$ 两点，斜率为 $2$ 的直线 $l$ 与直线 $M A,M B,A B,x$ 轴依次交于点 $P,Q,R,N$，且 $|R N|^2=|P N| dot |Q N|$，求直线 $l$ 在 $x$ 轴上截距的范围。],
      answers: (
        [$(-infinity,-7-4sqrt(3)] union [-7+4sqrt(3),1) union (1,+infinity)$。],
      ),
      explanation: [设 $A B:x=t y+1$，$N=(h,0)$，则 $l:x=y/2+h$。为有唯一交点 $R$，须 $t!=1/2$。
        #step[表示交点坐标][设 $A=(x_1,y_1),B=(x_2,y_2)$。联立抛物线与 $A B$，得
          $ y^2-4t y-4=0,quad y_1+y_2=4t,quad y_1 y_2=-4. $
          故 $x_i=y_i^2/4$。联立 $M A:y=y_1/(x_1+1)(x+1)$ 与 $l$，以及对应的 $M B$，得
          $ y_P=(2(h+1)y_1)/(2x_1+2-y_1),quad y_Q=(2(h+1)y_2)/(2x_2+2-y_2). $
          两分母均为 $1/2(y_i-1)^2+3/2>0$。
          又 $y_R=(2(h-1))/(2t-1)$。若 $h=1$，则 $y_R=0$ 而 $y_P y_Q!=0$，与长度条件矛盾，故 $h!=1$。]
        #step[转化长度条件][点 $P,Q,R,N$ 在斜率为 $2$ 的同一直线上，且 $y_N=0$，故长度条件等价于 $y_R^2=|y_P y_Q|$。
          由韦达定理展开可得
          $ (2x_1+2-y_1)(2x_2+2-y_2)=4(3+4t^2). $
          所以
          $
            |y_P y_Q|=(4(h+1)^2)/(3+4t^2),quad
            ((h+1)/(h-1))^2=(3+4t^2)/(2t-1)^2.
          $]
        #step[求范围并验证可取性][令 $u=1/(2t-1)!=0$，则
          $ (3+4t^2)/(2t-1)^2=4(u+1/4)^2+3/4. $
          当 $u$ 遍历非零实数时，此式的值域为 $[3/4,+infinity)$；特别地，值 $1$ 可由 $u=-1/2$ 取得，所以排除 $u=0$ 不会漏掉任何值。
          因此存在满足条件的 $t$ 当且仅当
          $
            h!=1,quad ((h+1)/(h-1))^2>=3/4,
            quad "即" quad h!=1,quad h^2+14h+1>=0.
          $
          对每个这样的 $h$，取相应非零 $u$，便得到 $t!=1/2$；方程 $y^2-4t y-4=0$ 始终有两个不同实根，且前述交点分母均非零，故构型可实现。
          综上，截距范围为 $(-infinity,-7-4sqrt(3)] union [-7+4sqrt(3),1) union (1,+infinity)$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [设 $a,b$ 为实数，且 $a>1$，函数 $f(x)=a^x-b x+e^2$（$x in RR$）。
    （注：$e=2.71828dots$ 是自然对数的底数。）],
  parts: (
    subquestion(
      stem: [求函数 $f(x)$ 的单调区间；],
      answers: (
        [$b<=0$ 时，在 $RR$ 上递增，无递减区间；$b>0$ 时，在 $(-infinity,log_a (b/(ln a)))$ 上递减，在 $(log_a (b/(ln a)),+infinity)$ 上递增。],
      ),
      explanation: [$f'(x)=a^x ln a-b$，且 $ln a>0$。
        当 $b<=0$ 时，$f'(x)>0$，故在 $RR$ 上递增。
        当 $b>0$ 时，令 $f'(x)=0$，得 $x_0=log_a (b/(ln a))$。在 $x<x_0$ 时导数为负，在 $x>x_0$ 时导数为正，故递减区间为 $(-infinity,x_0)$，递增区间为 $(x_0,+infinity)$。],
    ),
    subquestion(
      stem: [若对任意 $b>2e^2$，函数 $f(x)$ 有两个不同的零点，求 $a$ 的取值范围；],
      answers: ([$(1,e^2]$。],),
      explanation: [此时 $b>0$，若 $x<=0$ 则 $f(x)>0$，故零点只能在正半轴。令 $t=x ln a>0$，零点方程等价于
        $ b/(ln a)=g(t),quad g(t)=(e^t+e^2)/t. $
        #step[确定两个零点的条件][
          $ g'(t)=(e^t (t-1)-e^2)/t^2. $
          分子在 $t>0$ 上严格递增，因为其导数为 $t e^t>0$，且在 $t=2$ 时等于 $0$。
          故 $g$ 在 $(0,2)$ 上递减，在 $(2,+infinity)$ 上递增，最小值 $g(2)=e^2$；两端极限均为 $+infinity$。
          因而恰有两个不同零点当且仅当 $b/(ln a)>e^2$，即 $b>e^2 ln a$。]
        #step[处理任意参数的要求][要使每个 $b>2e^2$ 都满足上述严格不等式，充要条件为 $e^2 ln a<=2e^2$。
          结合 $a>1$，得 $1<a<=e^2$。]],
    ),
    subquestion(
      stem: [当 $a=e$ 时，证明：对任意 $b>e^4$，函数 $f(x)$ 有两个不同的零点 $x_1,x_2$（$x_1<x_2$），满足 $x_2>(b ln b)/(2e^2)x_1+e^2/b$。],
      answers: ([证明见解析。],),
      explanation: [由上一问，$a=e$ 且 $b>e^4>2e^2$ 时，恰有两个不同的正零点。由 $f'(x)=e^x-b$，得 $0<x_1<ln b<x_2$。
        #step[估计较小零点][∵ $f(0)>0$，$f(2)=2e^2-2b<0$，故 $x_1<2$。
          利用 $f(x_1)=0$，有 $b x_1=e^(x_1)+e^2<2e^2$，从而
          $ (b ln b)/(2e^2)x_1<ln b. $]
        #step[估计较大零点][令 $t=ln b+e^2/b>ln b$。由 $b>e^4$，得 $0<e^2/b<1$，且 $ln b>4$，所以
          $ f(t)=b(e^(e^2/b)-ln b)<b(e-4)<0. $
          ∵ $f$ 在 $(ln b,+infinity)$ 上递增，且 $f(x_2)=0$，∴ $x_2>t$。
          结合前面的估计，得
          $ x_2>ln b+e^2/b>(b ln b)/(2e^2)x_1+e^2/b. $
          命题得证。]
      ],
    ),
  ),
)
