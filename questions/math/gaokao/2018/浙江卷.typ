#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "浙江卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018浙江.pdf",
  regions: ("浙江",),
)

#let views() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((0, 3.5), (2, 5.5))
  line((1, 3.5), (1, 5.5))
  rect((3.5, 3.5), (5.5, 5.5))
  line((0, 2), (2, 2), (2, 0), (1, 0), close: true)
  for (p, label) in (
    ((0.5, 3.2), $1$),
    ((1.5, 3.2), $1$),
    ((2.3, 4.5), $2$),
    ((4.5, 3.2), $2$),
    ((1, 2.7), [正视图]),
    ((4.5, 2.7), [侧视图]),
    ((1, -0.4), [俯视图]),
  ) { content(p, label) }
})
#let option-graph(index) = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: $O$,
    tick: (stroke: figure-style.thickness),
  ))
  plot.plot(
    size: (5, 4),
    axis-style: "school-book",
    x-min: -3.8,
    x-max: 3.8,
    y-min: -6.5,
    y-max: 6.5,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((-calc.pi, $-pi$), (calc.pi, $pi$)),
    {
      plot.add(
        x => {
          let t = calc.abs(x)
          if index == 0 { 2 * t * calc.sin(t * 1rad) } else if index == 1 {
            calc.pow(2, t) * calc.sin(2 * t * 1rad)
          } else if index == 2 { 2 * t * calc.sin(x * 1rad) } else {
            calc.pow(2, t) * calc.sin(2 * x * 1rad)
          }
        },
        domain: (-3.25, 3.25),
        samples: 240,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
    },
  )
})
#let polyhedron() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  let a = (0, -calc.sqrt(3), 0)
  let b = (1, 0, 0)
  let c = (0, calc.sqrt(3), 0)
  let a1 = (0, -calc.sqrt(3), 4)
  let b1 = (1, 0, 2)
  let c1 = (0, calc.sqrt(3), 1)
  oblique-project((0, -0.35), (0.9, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, a1, a)
    line(a1, b1, c1)
    line(a, b1, b)
    line(a, c, stroke: (dash: figure-style.dash))
    line(a, c1, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "north-west"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "south-west"),
      (c1, $C_1$, "west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})
#let parabola() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: $O$,
  ))
  let p = (-0.6, 0.6)
  let r = calc.sqrt(2 * (p.at(1) * p.at(1) - 4 * p.at(0)))
  let u = p.at(1) + r
  let v = p.at(1) - r
  let a = (u * u / 4, u)
  let b = (v * v / 4, v)
  let m = ((a.at(0) + b.at(0)) / 2, p.at(1))
  plot.plot(
    size: (5.2, 6.8),
    axis-style: "school-book",
    x-min: -1.8,
    x-max: 3.4,
    y-min: -3.4,
    y-max: 3.4,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.add(
        t => (t * t / 4, t),
        domain: (-3.1, 3.1),
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.annotate({
        line(p, a, b, close: true)
        line(p, m)
        for (pos, label, anchor) in (
          (p, $P$, "east"),
          (a, $A$, "south"),
          (b, $B$, "north-east"),
          (m, $M$, "west"),
        ) { content(pos, label, anchor: anchor, padding: 3pt) }
      })
    },
  )
})

#section[选择题：本大题共 10 小题，每小题 4 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 4,
  stem: [已知全集 $U={1,2,3,4,5}$，$A={1,3}$，则 $complement_U A=$#choice-placeholder()。],
  choices: ([$emptyset$], [${1,3}$], [${2,4,5}$], [${1,2,3,4,5}$]),
  answers: ([C],),
  explanation: [从 $U$ 中去掉属于 $A$ 的元素 $1,3$，得 ${2,4,5}$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [双曲线 $x^2/3-y^2=1$ 的焦点坐标是#choice-placeholder()。],
  choices: (
    [$(-sqrt(2),0),(sqrt(2),0)$],
    [$(-2,0),(2,0)$],
    [$(0,-sqrt(2)),(0,sqrt(2))$],
    [$(0,-2),(0,2)$],
  ),
  answers: ([B],),
  explanation: [焦点在 $x$ 轴上，且 $c=sqrt(3+1)=2$，故焦点为 $(-2,0),(2,0)$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [某几何体的三视图如图所示（单位：$"cm"$），则该几何体的体积（单位：$"cm"^3$）是#choice-placeholder()。#figure(views())],
  choices: ([$2$], [$4$], [$6$], [$8$]),
  answers: ([C],),
  explanation: [几何体为高 $2$ 的直四棱柱，底面是上、下底分别为 $1,2$，高为 $2$ 的直角梯形。故体积为 $1/2(1+2) times 2 times 2=6$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [复数 $2/(1-i)$（$i$ 为虚数单位）的共轭复数是#choice-placeholder()。],
  choices: ([$1+i$], [$1-i$], [$-1+i$], [$-1-i$]),
  answers: ([B],),
  explanation: [$2/(1-i)=1+i$，其共轭复数为 $1-i$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [函数 $y=2^(|x|) sin 2x$ 的图象可能是#choice-placeholder()。],
  choices: (
    [#figure(option-graph(0))],
    [#figure(option-graph(1))],
    [#figure(option-graph(2))],
    [#figure(option-graph(3))],
  ),
  answers: ([D],),
  explanation: [函数为奇函数，排除 A、B。在 $(pi/2,pi)$ 上，$sin 2x<0$，故函数值为负，排除 C，选 D。],
)
#question(
  "single-choice",
  score: 4,
  stem: [已知平面 $alpha$，直线 $m,n$ 满足 $m subset.not alpha$，$n subset alpha$，则“$m parallel n$”是“$m parallel alpha$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [由线面平行的判定定理，$m parallel n$ 可推出 $m parallel alpha$。反之，$m parallel alpha$ 时，$m,n$ 还可能异面，故为充分不必要条件。],
)
#question(
  "single-choice",
  score: 4,
  stem: [设 $0<p<1$，随机变量 $xi$ 的分布列是
    #table(
      columns: 4,
      align: center,
      [$xi$], [$0$], [$1$], [$2$],
      [$P$], [$(1-p)/2$], [$1/2$], [$p/2$],
    )
    则当 $p$ 在 $(0,1)$ 内增大时，#choice-placeholder()。],
  choices: (
    [$D(xi)$ 减小],
    [$D(xi)$ 增大],
    [$D(xi)$ 先减小后增大],
    [$D(xi)$ 先增大后减小],
  ),
  answers: ([D],),
  explanation: [$E(xi)=p+1/2$，$E(xi^2)=2p+1/2$，所以 $D(xi)=-(p-1/2)^2+1/2$，在 $(0,1)$ 上先增大后减小。],
)
#question(
  "single-choice",
  score: 4,
  stem: [已知四棱锥 $S-A B C D$ 的底面是正方形，侧棱长均相等，$E$ 是线段 $A B$ 上的点（不含端点），设 $S E$ 与 $B C$ 所成的角为 $theta_1$，$S E$ 与平面 $A B C D$ 所成的角为 $theta_2$，二面角 $S-A B-C$ 的平面角为 $theta_3$，则#choice-placeholder()。],
  choices: (
    [$theta_1<=theta_2<=theta_3$],
    [$theta_3<=theta_2<=theta_1$],
    [$theta_1<=theta_3<=theta_2$],
    [$theta_2<=theta_3<=theta_1$],
  ),
  answers: ([D],),
  explanation: [设底面中心为 $O$，$A B$ 中点为 $M$，$S O=h$，$O M=r$，$E M=t$。则 $S O perp$ 底面，且
    $
      tan theta_1=sqrt(h^2+t^2)/r,
      tan theta_2=h/sqrt(r^2+t^2),
      tan theta_3=h/r.
    $
    三角均为锐角，比较正切值得 $theta_2<=theta_3<=theta_1$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [已知 $bold(a),bold(b),bold(e)$ 是平面向量，$bold(e)$ 是单位向量。若非零向量 $bold(a)$ 与 $bold(e)$ 的夹角为 $pi/3$，向量 $bold(b)$ 满足 $bold(b)^2-4 bold(e) dot bold(b)+3=0$，则 $|bold(a)-bold(b)|$ 的最小值是#choice-placeholder()。],
  choices: ([$sqrt(3)-1$], [$sqrt(3)+1$], [$2$], [$2-sqrt(3)$]),
  answers: ([A],),
  explanation: [取 $bold(e)=(1,0)$，则 $bold(a)$ 的终点在射线 $y=plus.minus sqrt(3)x$（$x>0$）上，$bold(b)$ 的终点在圆 $(x-2)^2+y^2=1$ 上。圆心 $(2,0)$ 到这两条射线的距离均为 $sqrt(3)$，且垂足位于射线内部，故最小距离为 $sqrt(3)-1$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [已知 $a_1,a_2,a_3,a_4$ 成等比数列，且 $a_1+a_2+a_3+a_4=ln(a_1+a_2+a_3)$。若 $a_1>1$，则#choice-placeholder()。],
  choices: (
    [$a_1<a_3,a_2<a_4$],
    [$a_1>a_3,a_2<a_4$],
    [$a_1<a_3,a_2>a_4$],
    [$a_1>a_3,a_2>a_4$],
  ),
  answers: ([B],),
  explanation: [设公比为 $q$。由 $ln t<t$（$t>0$），知 $a_4<0$，故 $q<0$。若 $q<=-1$，则左边 $a_1(1+q)(1+q^2)<=0$，而右边 $ln(a_1(1+q+q^2))>0$，矛盾。因此 $-1<q<0$，从而 $a_3=a_1q^2<a_1$，$a_4=a_2q^2>a_2$。],
)

#section[填空题：本大题共 7 小题，多空题每小题 6 分，单空题每小题 4 分，共 36 分。]
#question(
  "fill-in",
  score: 6,
  stem: [我国古代数学著作《张邱建算经》中记载百鸡问题：“今有鸡翁一，值钱五；鸡母一，值钱三；鸡雏三，值钱一。凡百钱，买鸡百只，问鸡翁、母、雏各几何？”设鸡翁、鸡母、鸡雏个数分别为 $x,y,z$，则 $cases(x+y+z=100, 5x+3y+1/3 z=100)$。当 $z=81$ 时，$x=$#fill-placeholder()，$y=$#fill-placeholder()。],
  answers: ([$8$], [$11$]),
  explanation: [代入得 $x+y=19$，$5x+3y=73$，解得 $x=8,y=11$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [若 $x,y$ 满足约束条件 $cases(x-y>=0, 2x+y<=6, x+y>=2)$，则 $z=x+3y$ 的最小值是#fill-placeholder()，最大值是#fill-placeholder()。],
  answers: ([$-2$], [$8$]),
  explanation: [可行域为顶点 $(1,1),(2,2),(4,-2)$ 构成的三角形，三个顶点处 $z$ 分别为 $4,8,-2$，故最小值为 $-2$，最大值为 $8$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 所对的边分别为 $a,b,c$。若 $a=sqrt(7),b=2,A=60 degree$，则 $sin B=$#fill-placeholder()，$c=$#fill-placeholder()。],
  answers: ([$sqrt(21)/7$], [$3$]),
  explanation: [正弦定理给出 $sin B=(b sin A)/a=sqrt(21)/7$。余弦定理给出 $7=4+c^2-2c$，因 $c>0$，解得 $c=3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [二项式 $(root(3, x)+1/(2x))^8$ 的展开式的常数项是#fill-placeholder()。],
  answers: ([$7$],),
  explanation: [通项为 $C_8^r 2^(-r)x^((8-4r)/3)$。令 $8-4r=0$，得 $r=2$，故常数项为 $C_8^2/4=7$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知 $lambda in RR$，函数 $f(x)=cases(x-4 & quad x>=lambda, x^2-4x+3 & quad x<lambda)$。当 $lambda=2$ 时，不等式 $f(x)<0$ 的解集是#fill-placeholder()。若函数 $f(x)$ 恰有 $2$ 个零点，则 $lambda$ 的取值范围是#fill-placeholder()。],
  answers: ([$(1,4)$], [$(1,3] union (4,+infinity)$]),
  explanation: [当 $lambda=2$ 时，两段分别给出 $[2,4)$ 与 $(1,2)$，合并为 $(1,4)$。若 $lambda>4$，一次式无零点，二次式有零点 $1,3$。若 $lambda<=4$，一次式有零点 $4$，二次式恰含一个零点当且仅当 $1<lambda<=3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [从 $1,3,5,7,9$ 中任取 $2$ 个数字，从 $0,2,4,6$ 中任取 $2$ 个数字，一共可以组成#fill-placeholder()个没有重复数字的四位数。（用数字作答）],
  answers: ([$1260$],),
  explanation: [不含 $0$ 时有 $C_5^2 C_3^2 times 4!=720$ 个；含 $0$ 时有 $C_5^2 C_3^1 times 3 times 3!=540$ 个。共 $1260$ 个。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知点 $P(0,1)$，椭圆 $x^2/4+y^2=m$（$m>1$）上两点 $A,B$ 满足 $arrow(A P)=2 arrow(P B)$，则当 $m=$#fill-placeholder()时，点 $B$ 横坐标的绝对值最大。],
  answers: ([$5$],),
  explanation: [设 $B(u,v)$，则 $A(-2u,3-2v)$。代入椭圆方程，得 $u^2/4+v^2=m$，$u^2+(3-2v)^2=m$，消去 $u^2$ 得 $v=(m+3)/4$。于是 $u^2=4-(m-5)^2/4<=4$，当 $m=5$ 时取到等号。],
)

#section[解答题：本大题共 5 小题，共 74 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [已知角 $alpha$ 的顶点与原点 $O$ 重合，始边与 $x$ 轴的非负半轴重合，它的终边过点 $P(-3/5,-4/5)$。],
  parts: (
    subquestion(
      stem: [求 $sin(alpha+pi)$ 的值；],
      answers: ([$4/5$],),
      explanation: [$sin alpha=-4/5$，故 $sin(alpha+pi)=-sin alpha=4/5$。],
    ),
    subquestion(
      stem: [若角 $beta$ 满足 $sin(alpha+beta)=5/13$，求 $cos beta$ 的值。],
      answers: ([$-56/65$ 或 $16/65$。],),
      explanation: [$cos alpha=-3/5$，$cos(alpha+beta)=plus.minus 12/13$。因此
        $
          cos beta=cos(alpha+beta)cos alpha+sin(alpha+beta)sin alpha=-56/65 "或" 16/65.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，已知多面体 $A B C A_1 B_1 C_1$，$A_1 A,B_1 B,C_1 C$ 均垂直于平面 $A B C$，$angle A B C=120 degree$，$A_1 A=4,C_1 C=1,A B=B C=B_1 B=2$。#figure(polyhedron())],
  parts: (
    subquestion(
      stem: [证明：$A B_1 perp$ 平面 $A_1 B_1 C_1$；],
      answers: ([证明见解析。],),
      explanation: [由勾股定理，$A B_1^2=A_1 B_1^2=8$，故 $A B_1^2+A_1 B_1^2=A A_1^2$，得 $A B_1 perp A_1 B_1$。
        又由余弦定理，$A C^2=12$，故 $A C_1^2=13$；而 $B_1 C_1^2=5$，所以 $A B_1^2+B_1 C_1^2=A C_1^2$，得 $A B_1 perp B_1 C_1$。
        两直线交于 $B_1$，故 $A B_1 perp$ 平面 $A_1 B_1 C_1$。],
    ),
    subquestion(
      stem: [求直线 $A C_1$ 与平面 $A B B_1$ 所成的角的正弦值。],
      answers: ([$sqrt(39)/13$],),
      explanation: [平面 $A B C perp$ 平面 $A B B_1$，交线为 $A B$，故 $C$ 到平面 $A B B_1$ 的距离为 $B C sin 120 degree=sqrt(3)$。又 $C C_1 parallel$ 平面 $A B B_1$，$C_1$ 到该平面的距离也是 $sqrt(3)$。而 $A C_1=sqrt(13)$，故所求正弦值为 $sqrt(3)/sqrt(13)=sqrt(39)/13$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知等比数列 $\{a_n\}$ 的公比 $q>1$，且 $a_3+a_4+a_5=28$，$a_4+2$ 是 $a_3,a_5$ 的等差中项。数列 $\{b_n\}$ 满足 $b_1=1$，数列 $\{(b_(n+1)-b_n)a_n\}$ 的前 $n$ 项和为 $2n^2+n$。],
  parts: (
    subquestion(
      stem: [求 $q$ 的值；],
      answers: ([$2$],),
      explanation: [$a_3+a_5=2a_4+4$，故 $3a_4+4=28$，得 $a_4=8$。于是 $8(q+1/q)=20$，由 $q>1$ 得 $q=2$。],
    ),
    subquestion(
      stem: [求数列 $\{b_n\}$ 的通项公式。],
      answers: ([$b_n=15-(4n+3)/2^(n-2)$。],),
      explanation: [由前一问，$a_n=2^(n-1)$。用前 $n$ 项和减前 $n-1$ 项和，并检验 $n=1$，得 $(b_(n+1)-b_n)a_n=4n-1$。所以
        $ b_(n+1)-b_n=(4n-1)/2^(n-1)=(4n+3)/2^(n-2)-(4n+7)/2^(n-1). $
        对 $n=1,2,dots,m-1$ 累加，得 $b_m-b_1=14-(4m+3)/2^(m-2)$。因此 $b_n=15-(4n+3)/2^(n-2)$，且 $n=1$ 时也成立。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，已知点 $P$ 是 $y$ 轴左侧（不含 $y$ 轴）一点，抛物线 $C:y^2=4x$ 上存在不同的两点 $A,B$ 满足 $P A,P B$ 的中点均在 $C$ 上。#figure(parabola())],
  parts: (
    subquestion(
      stem: [设 $A B$ 中点为 $M$，证明：$P M$ 垂直于 $y$ 轴；],
      answers: ([证明见解析。],),
      explanation: [设 $P(x_0,y_0)$，$A(y_1^2/4,y_1)$，$B(y_2^2/4,y_2)$。由中点在抛物线上，$y_1,y_2$ 均满足
        $ ((y+y_0)/2)^2=2(x_0+y^2/4), "即" y^2-2y_0 y+8x_0-y_0^2=0. $
        故 $y_1+y_2=2y_0$，$M$ 的纵坐标为 $y_0$。又 $x_0<0$，$M$ 的横坐标非负，故 $P M perp y$ 轴。],
    ),
    subquestion(
      stem: [若 $P$ 是半椭圆 $x^2+y^2/4=1$（$x<0$）上的动点，求 $triangle P A B$ 面积的取值范围。],
      answers: ([$[6sqrt(2),15sqrt(10)/4]$],),
      explanation: [由前一问，$y_1 y_2=8x_0-y_0^2$，所以
        $
          P M=(y_1^2+y_2^2)/8-x_0=3/4(y_0^2-4x_0), quad |y_1-y_2|=2sqrt(2)sqrt(y_0^2-4x_0).
        $
        以水平线段 $P M$ 为公共底分割三角形，得
        $
          S_(triangle P A B)=1/2 P M dot |y_1-y_2|=(3sqrt(2))/4(y_0^2-4x_0)^(3/2).
        $
        又 $x_0 in [-1,0)$，$y_0^2-4x_0=5-4(x_0+1/2)^2 in [4,5]$，两端均可取，故面积范围为 $[6sqrt(2),15sqrt(10)/4]$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知函数 $f(x)=sqrt(x)-ln x$。],
  parts: (
    subquestion(
      stem: [若 $f(x)$ 在 $x=x_1,x_2$（$x_1!=x_2$）处导数相等，证明：$f(x_1)+f(x_2)>8-8ln 2$；],
      answers: ([证明见解析。],),
      explanation: [令 $u=sqrt(x_1),v=sqrt(x_2)$，则 $u,v>0$ 且 $u!=v$。由 $f'(x)=1/(2sqrt(x))-1/x$ 及导数相等，因式分解得
        $ (1/u-1/v)(1/2-1/u-1/v)=0, "故" u+v=(u v)/2. $
        令 $t=u v$。由 $u+v>2sqrt(u v)$，得 $t>16$。于是
        $ f(x_1)+f(x_2)=t/2-2ln t. $
        函数 $g(t)=t/2-2ln t$ 在 $t>16$ 上严格递增，故 $g(t)>g(16)=8-8ln 2$。],
    ),
    subquestion(
      stem: [若 $a<=3-4ln 2$，证明：对于任意 $k>0$，直线 $y=k x+a$ 与曲线 $y=f(x)$ 有唯一公共点。],
      answers: ([证明见解析。],),
      explanation: [
        #step[证明交点存在][令 $F(x)=sqrt(x)-ln x-k x-a$。取 $m=e^(-(|a|+k+1)) in (0,1)$，则 $F(m)>|a|+k+1-k-a>0$。再取 $R>max(1, (|a|+2)/k)$，令 $n=R^2$，则
          $ F(n)=R-2ln R-k R^2-a<R-(|a|+2)R+|a|<0. $
          由零点存在性定理，$F$ 在 $(m,n)$ 内有零点。]
        #step[证明交点唯一][交点方程等价于 $H(x)=k$，其中 $H(x)=(sqrt(x)-ln x-a)/x$。求导得
          $ H'(x)=(ln x-sqrt(x)/2-1+a)/x^2. $
          令 $G(x)=sqrt(x)/2-ln x$，则 $G'(x)=(sqrt(x)-4)/(4x)$，故 $G(x)>=G(16)=2-4ln 2$。因此 $H'(x)<=0$，等号至多在 $a=3-4ln 2,x=16$ 时成立，$H$ 在 $(0,+infinity)$ 上严格递减，方程至多一解。结合存在性，交点唯一。]
      ],
    ),
  ),
)
