#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017全国1文(河南,河北,山西,江西,湖北,湖南,广东,安徽,福建).pdf",
  regions: (
    "河南",
    "河北",
    "山西",
    "江西",
    "湖北",
    "湖南",
    "广东",
    "安徽",
    "福建",
  ),
)

#let taiji() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let rim = range(61).map(i => (
    calc.cos(-90deg + i * 3deg),
    calc.sin(-90deg + i * 3deg),
  ))
  line(..rim, close: true, fill: black, stroke: none)
  circle((0, 0.5), radius: 0.5, fill: black, stroke: none)
  circle((0, -0.5), radius: 0.5, fill: white, stroke: none)
  circle((0, 0.5), radius: 0.09, fill: white, stroke: none)
  circle((0, -0.5), radius: 0.09, fill: black, stroke: none)
  circle((0, 0), radius: 1)
  line((-1, -1), (1, -1), (1, 1), (-1, 1), close: true)
  for (p, label, anchor) in (
    ((-1, 1), $A$, "south-east"),
    ((1, 1), $B$, "south-west"),
    ((1, -1), $C$, "north-west"),
    ((-1, -1), $D$, "north-east"),
  ) {
    content(p, label, anchor: anchor, padding: 2pt)
  }
})
#let loop-chart() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (y, label) in ((0, [开始]), (-10.4, [结束])) {
    rect((-0.7, y - 0.35), (0.7, y + 0.35), radius: 0.2)
    content((0, y), text(size: 9pt, label))
  }
  for (y, label) in ((-1.7, [输入 $n=0$]), (-8.6, [输出 $n$])) {
    line(
      (-1.2, y - 0.4),
      (0.9, y - 0.4),
      (1.2, y + 0.4),
      (-0.9, y + 0.4),
      close: true,
    )
    content((0, y), text(size: 9pt, label))
  }
  rect((-1.4, -3.8), (1.4, -3))
  content((0, -3.4), text(size: 9pt)[$A=3^n-2^n$])
  line((0, -4.8), (2, -5.6), (0, -6.4), (-2, -5.6), close: true)
  rect((-4.5, -4.5), (-2.5, -3.7))
  for (a, b) in (
    ((0, -0.35), (0, -1.3)),
    ((0, -2.1), (0, -3)),
    ((0, -3.8), (0, -4.8)),
    ((0, -6.4), (0, -8.2)),
    ((0, -9), (0, -10.05)),
  ) {
    line(a, b, mark: (end: ">"))
  }
  line((-2, -5.6), (-3.5, -5.6), (-3.5, -4.5), mark: (end: ">"))
  line((-3.5, -3.7), (-3.5, -2.6), (0, -2.6), mark: (end: ">"))
  content((-2.15, -5.6), text(size: 9pt)[是], anchor: "north", padding: 2pt)
  content((0, -7.1), text(size: 9pt)[否], anchor: "west", padding: 3pt)
})
#let pyramid() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (0, 0, 0)
  let b = (0, 1, 0)
  let d = (calc.sqrt(2), 0, 0)
  let c = (calc.sqrt(2), 1, 0)
  let p = (calc.sqrt(2) / 2, 0, calc.sqrt(2) / 2)
  oblique-project((0.7, 0.5), (2.1, 0), (-0.3, 1.8), {
    line(a, b, c, p, a)
    line(p, b)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(p, d, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "north"),
      (p, $P$, "south"),
    ) {
      content(point, label, anchor: anchor, padding: 3pt)
    }
  })
})

#let cube-choice(kind) = cetz.canvas(length: 24mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let o = (0, 0, 0)
  let x = (1, 0, 0)
  let y = (0, 1, 0)
  let xy = (1, 1, 0)
  let z = (0, 0, 1)
  let xz = (1, 0, 1)
  let yz = (0, 1, 1)
  let xyz = (1, 1, 1)
  let (a, b, m, n, q) = if kind == 0 {
    (z, xy, (0.5, 0, 0), (0, 0.5, 0), (0, 0, 0.5))
  } else if kind == 1 {
    (z, xyz, (0.5, 0, 0), (0.5, 0, 1), (1, 0.5, 0))
  } else if kind == 2 { (z, y, (1, 0, 0.5), (0, 0.5, 0), (1, 0.5, 0)) } else {
    (yz, xy, (0, 1, 0.5), (0.5, 0, 1), (1, 0, 0.5))
  }
  oblique-project((1, 0), (0.36, 0.36), (0, 1), {
    line(o, x, xy, xyz, yz, z, o)
    line(z, xz, xyz)
    line(x, xz)
    line(o, y, xy, stroke: (dash: figure-style.dash))
    line(y, yz, stroke: (dash: figure-style.dash))
    line(a, b, stroke: if kind == 1 { (dash: none) } else {
      (dash: figure-style.dash)
    })
    if kind == 0 {
      line(m, q)
      line(m, n, q, stroke: (dash: figure-style.dash))
    } else if kind == 1 {
      line(m, n)
      line(n, q, m, stroke: (dash: figure-style.dash))
    } else if kind == 2 {
      line(m, q)
      line(m, n, q, stroke: (dash: figure-style.dash))
    } else {
      line(n, q)
      line(n, m, q, stroke: (dash: figure-style.dash))
    }
    for (p, label, anchor) in (
      (a, $A$, "south-east"),
      (b, $B$, if kind == 2 { "north" } else { "west" }),
      (
        m,
        $M$,
        if kind == 2 { "west" } else if kind == 3 { "east" } else { "north" },
      ),
      (
        n,
        $N$,
        if kind == 1 { "north-east" } else if kind == 3 { "south" } else {
          "north-west"
        },
      ),
      (q, $Q$, if kind == 0 { "east" } else { "west" }),
    ) {
      content(p, label, anchor: anchor, padding: 2pt)
    }
  })
})
#let curve-choice(kind) = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.1,
    shared-zero: $O$,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
    x: (label: (anchor: "west", offset: 0.1)),
    y: (label: (anchor: "south", offset: 0.1)),
  ))
  plot.plot(
    size: (4.8, 4.8),
    axis-style: "school-book",
    x-min: -3.6,
    x-max: 3.6,
    y-min: -5,
    y-max: 5,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((-calc.pi, $-pi$), (1, $1$), (calc.pi, $pi$)),
    y-ticks: (1,),
    x-label: $x$,
    y-label: $y$,
    {
      let f(x) = {
        let v = calc.sin(2 * x * 1rad) / (1 - calc.cos(x * 1rad))
        if kind == 0 { -v } else if kind == 1 {
          if x < 0 { -v } else { v }
        } else if kind == 2 { v } else {
          calc.sin(2.5 * x * 1rad) / (1 - calc.cos(1.25 * x * 1rad))
        }
      }
      for domain in ((-calc.pi, -0.75), (0.75, calc.pi)) {
        plot.add(f, domain: domain, style: (
          stroke: (paint: black, thickness: figure-style.thickness),
        ))
      }
    },
  )
})

#section[选择题：共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x|x<2}$，$B={x|3-2x>0}$，则#choice-placeholder()。],
  choices: (
    [$A inter B={x|x<3/2}$],
    [$A inter B=emptyset$],
    [$A union B={x|x<3/2}$],
    [$A union B=RR$],
  ),
  answers: ([A],),
  explanation: [$B=(-infinity,3/2) subset A$，故 $A inter B=B$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [为评估一种农作物的种植效果，选了 $n$ 块地作试验田，这 $n$ 块地的亩产量（单位：$"kg"$）分别是 $x_1,x_2,dots,x_n$，下面给出的指标中可以用来评估这种农作物亩产量稳定程度的是#choice-placeholder()。],
  choices: (
    [$x_1,x_2,dots,x_n$ 的平均数],
    [$x_1,x_2,dots,x_n$ 的标准差],
    [$x_1,x_2,dots,x_n$ 的最大值],
    [$x_1,x_2,dots,x_n$ 的中位数],
  ),
  answers: ([B],),
  explanation: [标准差衡量数据围绕平均数的波动程度，标准差越小，亩产量越稳定。],
)
#question(
  "single-choice",
  score: 5,
  stem: [下列各式的运算结果为纯虚数的是#choice-placeholder()。],
  choices: ([$i(1+i)^2$], [$i^2(1-i)$], [$(1+i)^2$], [$i(1+i)$]),
  answers: ([C],),
  explanation: [四个选项依次为 $-2$、$-1+i$、$2i$、$-1+i$，只有 $2i$ 为纯虚数。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，正方形 $A B C D$ 内的图形来自中国古代的太极图，正方形内切圆中的黑色部分和白色部分关于正方形的中心成中心对称。在正方形内随机取一点，则此点取自黑色部分的概率是#choice-placeholder()。
    #figure(taiji())],
  choices: ([$1/4$], [$pi/8$], [$1/2$], [$pi/4$]),
  answers: ([B],),
  explanation: [设圆的半径为 $r$，黑色部分的面积为 $1/2 pi r^2$，正方形面积为 $4r^2$，所求概率为 $pi/8$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $F$ 是双曲线 $C:x^2-y^2/3=1$ 的右焦点，$P$ 是 $C$ 上一点，且 $P F$ 与 $x$ 轴垂直，点 $A$ 的坐标是 $(1,3)$，则 $triangle A P F$ 的面积为#choice-placeholder()。],
  choices: ([$1/3$], [$1/2$], [$2/3$], [$3/2$]),
  answers: ([D],),
  explanation: [$F(2,0)$，故 $P$ 的横坐标为 2。代入双曲线得 $y_P=plus.minus 3$，故 $|P F|=3$。点 $A$ 到直线 $x=2$ 的距离为 1，三角形面积为 $3/2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，在下列四个正方体中，$A$、$B$ 为正方体的两个顶点，$M$、$N$、$Q$ 为所在棱的中点，则在这四个正方体中，直线 $A B$ 与平面 $M N Q$ 不平行的是#choice-placeholder()。],
  choices: (
    [#figure(cube-choice(0))],
    [#figure(cube-choice(1))],
    [#figure(cube-choice(2))],
    [#figure(cube-choice(3))],
  ),
  answers: ([A],),
  explanation: [选项 A 中，设底面中心为 $O$，由三角形中位线定理，$O Q parallel A B$。而 $O$ 不在平面 $M N Q$ 内，故 $O Q$ 与该平面相交，$A B$ 也不平行于该平面。选项 B、C 中均有 $A B parallel M Q$，选项 D 中有 $A B parallel N Q$，且 $A B$ 均不在相应平面内，因此后三项均为线面平行。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $x$、$y$ 满足约束条件 $cases(x+3y<=3, x-y>=1, y>=0)$，则 $z=x+y$ 的最大值为#choice-placeholder()。],
  choices: ([$0$], [$1$], [$2$], [$3$]),
  answers: ([D],),
  explanation: [$z=(x+3y)-2y<=3$，当 $(x,y)=(3,0)$ 时满足全部约束且取等号，故最大值为 3。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $y=(sin 2x)/(1-cos x)$ 的部分图像大致为#choice-placeholder()。],
  choices: (
    [#figure(curve-choice(0))],
    [#figure(curve-choice(1))],
    [#figure(curve-choice(2))],
    [#figure(curve-choice(3))],
  ),
  answers: ([C],),
  explanation: [定义域关于原点对称，分子为奇函数、分母为偶函数，故函数为奇函数，排除 B。在 $(0,pi/2)$ 上，分子、分母均为正，排除 A；在 $(pi/2,pi)$ 上函数值为负，且 $x=pi$ 时函数值为 0，排除 D，故选 C。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=ln x+ln(2-x)$，则#choice-placeholder()。],
  choices: (
    [$f(x)$ 在 $(0,2)$ 单调递增],
    [$f(x)$ 在 $(0,2)$ 单调递减],
    [$y=f(x)$ 的图像关于直线 $x=1$ 对称],
    [$y=f(x)$ 的图像关于点 $(1,0)$ 对称],
  ),
  answers: ([C],),
  explanation: [定义域为 $(0,2)$，且 $f(2-x)=ln(2-x)+ln x=f(x)$，故图像关于直线 $x=1$ 对称。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，程序框图是为了求出满足 $3^n-2^n>1000$ 的最小偶数 $n$，那么在菱形和矩形两个空白框中，可以分别填入#choice-placeholder()。
    #figure(loop-chart())],
  choices: (
    [$A>1000$ 和 $n=n+1$],
    [$A>1000$ 和 $n=n+2$],
    [$A<=1000$ 和 $n=n+1$],
    [$A<=1000$ 和 $n=n+2$],
  ),
  answers: ([D],),
  explanation: [从 $n=0$ 开始每次增加 2，依次检验偶数。当 $A<=1000$ 时继续循环，否则输出 $n$，故选 D。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$triangle A B C$ 的内角 $A$、$B$、$C$ 的对边分别为 $a$、$b$、$c$，已知 $sin B+sin A(sin C-cos C)=0$，$a=2$，$c=sqrt(2)$，则 $C=$#choice-placeholder()。],
  choices: ([$pi/12$], [$pi/6$], [$pi/4$], [$pi/3$]),
  answers: ([B],),
  explanation: [将 $sin B=sin(A+C)$ 代入条件，得 $sin C(cos A+sin A)=0$。∵ $sin C>0$，∴ $A=3pi/4$。由正弦定理，$sin C=c/a sin A=1/2$，又 $0<C<pi/4$，故 $C=pi/6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $A$、$B$ 是椭圆 $C:x^2/3+y^2/m=1$ 长轴的两个端点，若 $C$ 上存在点 $M$ 满足 $angle A M B=120 degree$，则 $m$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$(0,1] union [9,+infinity)$],
    [$(0,sqrt(3)] union [9,+infinity)$],
    [$(0,1] union [4,+infinity)$],
    [$(0,sqrt(3)] union [4,+infinity)$],
  ),
  answers: ([A],),
  explanation: [设椭圆长、短半轴分别为 $a$、$b$。以长轴为 $x$ 轴，$A(-a,0)$、$B(a,0)$、$M(x,y)$。由椭圆方程和向量点积、三角形面积公式，
    $ cot angle A M B=frac(x^2+y^2-a^2, 2a|y|)=-frac((a^2-b^2)|y|, 2a b^2). $
    当 $|y|=b$ 时夹角最大；存在 $120 degree$ 的夹角等价于 $frac(a^2-b^2, 2a b)>=1/sqrt(3)$，即 $a/b>=sqrt(3)$。因此 $0<m<3$ 时需 $3/m>=3$，即 $0<m<=1$；$m>3$ 时需 $m/3>=3$，即 $m>=9$。$m=3$ 为圆，直径所对圆周角为 $90 degree$，不满足要求。],
)
#section[填空题：共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)=(-1,2)$，$bold(b)=(m,1)$，若向量 $bold(a)+bold(b)$ 与 $bold(a)$ 垂直，则 $m=$#fill-placeholder()。],
  answers: ([$7$],),
  explanation: [$(bold(a)+bold(b)) dot bold(a)=(m-1,3) dot (-1,2)=7-m=0$，故 $m=7$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [曲线 $y=x^2+1/x$ 在点 $(1,2)$ 处的切线方程为#fill-placeholder()。],
  answers: ([$y=x+1$],),
  explanation: [$y'=2x-1/x^2$，在 $x=1$ 处的导数为 1，故切线为 $y-2=x-1$，即 $y=x+1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $alpha in (0,pi/2)$，$tan alpha=2$，则 $cos(alpha-pi/4)=$#fill-placeholder()。],
  answers: ([$(3sqrt(10))/10$],),
  explanation: [$cos alpha=1/sqrt(5)$，$sin alpha=2/sqrt(5)$，故 $cos(alpha-pi/4)=sqrt(2)/2(cos alpha+sin alpha)=(3sqrt(10))/10$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知三棱锥 $S-A B C$ 的所有顶点都在球 $O$ 的球面上，$S C$ 是球 $O$ 的直径。若平面 $S C A perp$ 平面 $S C B$，$S A=A C$，$S B=B C$，三棱锥 $S-A B C$ 的体积为 9，则球 $O$ 的表面积为#fill-placeholder()。],
  answers: ([$36pi$],),
  explanation: [设球半径为 $R$，则 $O$ 为 $S C$ 的中点。由 $S A=A C$、$S B=B C$，得 $A O perp S C$、$B O perp S C$，两平面垂直又给出 $A O perp B O$。因此 $S_(triangle S A C)=1/2 dot 2R dot R=R^2$，$B$ 到平面 $S A C$ 的距离为 $R$，∴ $V=R^3/3=9$，得 $R=3$，球面积为 $4pi R^2=36pi$。],
)
#section[解答题：共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17～21 题为必考题，每个试题考生都必须作答；第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [记 $S_n$ 为等比数列 ${a_n}$ 的前 $n$ 项和，已知 $S_2=2$，$S_3=-6$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=(-2)^n$],),
      explanation: [设公比为 $q$，则 $a_1(1+q)=2$，$a_1 q^2=S_3-S_2=-8$。消去 $a_1$ 得 $q^2=-4(1+q)$，即 $(q+2)^2=0$，故 $q=-2$、$a_1=-2$，通项为 $a_n=(-2)^n$。],
    ),
    subquestion(
      stem: [求 $S_n$，并判断 $S_(n+1)$、$S_n$、$S_(n+2)$ 是否能成等差数列。],
      answers: ([$S_n=2/3((-2)^n-1)$；三者能成等差数列。],),
      explanation: [由等比数列求和公式，$S_n=frac(-2(1-(-2)^n), 3)=2/3((-2)^n-1)$。又
        $ S_(n+1)+S_(n+2)-2S_n=2a_(n+1)+a_(n+2)=0, $
        故 $S_(n+1)$、$S_n$、$S_(n+2)$ 按此顺序成等差数列。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在四棱锥 $P-A B C D$ 中，$A B parallel C D$，且 $angle B A P=angle C D P=90 degree$。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [证明：平面 $P A B perp$ 平面 $P A D$。],
      answers: ([证明见解析。],),
      explanation: [由 $A B perp A P$、$A B parallel C D$、$C D perp P D$ 得 $A B perp P D$，故 $A B perp$ 平面 $P A D$。又 $A B subset$ 平面 $P A B$，所以平面 $P A B perp$ 平面 $P A D$。],
    ),
    subquestion(
      stem: [若 $P A=P D=A B=D C$，$angle A P D=90 degree$，且四棱锥 $P-A B C D$ 的体积为 $8/3$，求该四棱锥的侧面积。],
      answers: ([$6+2sqrt(3)$],),
      explanation: [设公共棱长为 $t$，取 $A D$ 的中点 $E$。由等腰直角三角形 $P A D$，得 $A D=sqrt(2)t$，$P E=t/sqrt(2)$，且 $P E perp A D$。又 $A B perp$ 平面 $P A D$，故 $P E perp A B$，从而 $P E perp$ 底面 $A B C D$。底面是矩形，其面积为 $sqrt(2)t^2$，故体积为 $t^3/3=8/3$，得 $t=2$。
        三个直角三角形侧面 $P A D$、$P A B$、$P D C$ 的面积各为 2；$P B=P C=B C=2sqrt(2)$，故 $triangle P B C$ 为等边三角形，面积为 $2sqrt(3)$。所以侧面积为 $6+2sqrt(3)$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [为了监控某种零件的一条生产线的生产过程，检验员每隔 $30 "min"$ 从该生产线上随机抽取一个零件，并测量其尺寸（单位：$"cm"$）。下面是检验员在一天内依次抽取的 16 个零件的尺寸：
    #table(
      columns: 9,
      inset: 3pt,
      [抽取次序], [1], [2], [3], [4], [5], [6], [7], [8],
      [零件尺寸],
      [9.95],
      [10.12],
      [9.96],
      [9.96],
      [10.01],
      [9.92],
      [9.98],
      [10.04],

      [抽取次序], [9], [10], [11], [12], [13], [14], [15], [16],
      [零件尺寸],
      [10.26],
      [9.91],
      [10.13],
      [10.02],
      [9.22],
      [10.04],
      [10.05],
      [9.95],
    )
    经计算得 $overline(x)=1/16 sum_(i=1)^16 x_i=9.97$，
    $
      s=sqrt(1/16 sum_(i=1)^16(x_i-overline(x))^2)=sqrt(1/16(sum_(i=1)^16 x_i^2-16overline(x)^2)) approx 0.212,
    $
    $
      sqrt(sum_(i=1)^16(i-8.5)^2) approx 18.439, quad sum_(i=1)^16(x_i-overline(x))(i-8.5)=-2.78,
    $
    其中 $x_i$ 为抽取的第 $i$ 个零件的尺寸，$i=1,2,dots,16$。
    附：样本 $(x_i,y_i)$（$i=1,2,dots,n$）的相关系数
    $
      r=frac(sum_(i=1)^n (x_i-overline(x))(y_i-overline(y)), sqrt(sum_(i=1)^n (x_i-overline(x))^2)sqrt(sum_(i=1)^n (y_i-overline(y))^2)), quad sqrt(0.008) approx 0.09.
    $],
  parts: (
    subquestion(
      stem: [求 $(x_i,i)$（$i=1,2,dots,16$）的相关系数 $r$，并回答是否可以认为这一天生产的零件尺寸不随生产过程的进行而系统地变大或变小（若 $|r|<0.25$，则可以认为零件的尺寸不随生产过程的进行而系统地变大或变小）。],
      answers: ([$r approx -0.178$；可以认为不随生产过程系统地变大或变小。],),
      explanation: [$r approx frac(-2.78, sqrt(16) times 0.212 times 18.439) approx -0.178$，其绝对值小于 $0.25$，故可以作出上述判断。],
    ),
    subquestion(
      stem: [一天内抽检零件中，如果出现了尺寸在 $(overline(x)-3s,overline(x)+3s)$ 之外的零件，就认为这条生产线在这一天的生产过程可能出现了异常情况，需对当天的生产过程进行检查。],
      parts: (
        subquestion(
          stem: [从这一天抽检的结果看，是否需对当天的生产过程进行检查？],
          answers: ([需要。],),
          explanation: [区间为 $(9.334,10.606)$，第 13 个零件的尺寸 $9.22$ 在区间外，因此需要检查。],
        ),
        subquestion(
          stem: [在 $(overline(x)-3s,overline(x)+3s)$ 之外的数据称为离群值，试剔除离群值，估计这条生产线当天生产的零件尺寸的均值与标准差（精确到 $0.01$）。],
          answers: ([均值估计为 $10.02$，标准差估计为 $0.09$。],),
          explanation: [剔除 $9.22$ 后，均值为 $(16 times 9.97-9.22)/15=10.02$。剩余数据的方差为 $0.008146dots$，故标准差约为 $0.09$。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设 $A$、$B$ 为曲线 $C:y=x^2/4$ 上两点，$A$ 与 $B$ 的横坐标之和为 4。],
  parts: (
    subquestion(
      stem: [求直线 $A B$ 的斜率。],
      answers: ([$1$],),
      explanation: [设横坐标分别为 $x_1$、$x_2$，则 $x_1!=x_2$，故斜率 $k=frac(x_2^2/4-x_1^2/4, x_2-x_1)=(x_1+x_2)/4=1$。],
    ),
    subquestion(
      stem: [设 $M$ 为曲线 $C$ 上一点，$C$ 在 $M$ 处的切线与直线 $A B$ 平行，且 $A M perp B M$，求直线 $A B$ 的方程。],
      answers: ([$y=x+7$],),
      explanation: [由 $y'=x/2$，切点为 $M(2,1)$。设直线为 $y=x+t$，联立曲线得 $x^2-4x-4t=0$，故 $x_1+x_2=4$、$x_1 x_2=-4t$，且 $t> -1$。
        $
          0=arrow(M A) dot arrow(M B)=(x_1-2)(x_2-2)+(x_1+t-1)(x_2+t-1)=t^2-6t-7.
        $
        得 $t=7$ 或 $t=-1$，后者不满足 $t> -1$，故直线为 $y=x+7$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=e^x (e^x-a)-a^2 x$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性。],
      answers: (
        [当 $a=0$ 时，在 $RR$ 上单调递增；当 $a>0$ 时，在 $(-infinity,ln a)$ 上单调递减，在 $(ln a,+infinity)$ 上单调递增；当 $a<0$ 时，在 $(-infinity,ln(-a/2))$ 上单调递减，在 $(ln(-a/2),+infinity)$ 上单调递增。],
      ),
      explanation: [$f'(x)=2e^(2x)-a e^x-a^2=(2e^x+a)(e^x-a)$。
        当 $a=0$ 时，导数恒正；当 $a>0$ 时，$2e^x+a>0$，导数在 $x=ln a$ 两侧先负后正；当 $a<0$ 时，$e^x-a>0$，导数在 $x=ln(-a/2)$ 两侧先负后正，故有上述单调性。],
    ),
    subquestion(
      stem: [若 $f(x)>=0$，求 $a$ 的取值范围。],
      answers: ([$[-2e^(3/4),1]$],),
      explanation: [要求 $f(x)>=0$ 对所有实数 $x$ 成立。
        当 $a=0$ 时，$f(x)=e^(2x)>0$；当 $a>0$ 时，最小值为 $f(ln a)=-a^2 ln a$，非负等价于 $0<a<=1$；当 $a<0$ 时，最小值为 $f(ln(-a/2))=a^2(3/4-ln(-a/2))$，非负等价于 $-2e^(3/4)<=a<0$。合并得 $a in [-2e^(3/4),1]$。],
    ),
  ),
)
#section[选考题：共 10 分。请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [［选修 4—4：坐标系与参数方程］在直角坐标系 $x O y$ 中，曲线 $C$ 的参数方程为 $cases(x=3cos theta, y=sin theta)$（$theta$ 为参数），直线 $l$ 的参数方程为 $cases(x=a+4t, y=1-t)$（$t$ 为参数）。],
  parts: (
    subquestion(
      stem: [若 $a=-1$，求 $C$ 与 $l$ 的交点坐标。],
      answers: ([$(3,0)$，$(-21/25,24/25)$。],),
      explanation: [曲线的普通方程为 $x^2/9+y^2=1$，直线为 $x+4y-3=0$。代入 $x=3-4y$，得 $25y^2-24y=0$，即 $y=0$ 或 $y=24/25$，故两交点为 $(3,0)$、$(-21/25,24/25)$。],
    ),
    subquestion(
      stem: [若 $C$ 上的点到 $l$ 距离的最大值为 $sqrt(17)$，求 $a$。],
      answers: ([$a=8$ 或 $a=-16$。],),
      explanation: [$l:x+4y-a-4=0$。点 $(3cos theta,sin theta)$ 到 $l$ 的距离为 $frac(|3cos theta+4sin theta-a-4|, sqrt(17))$。∵ $3cos theta+4sin theta$ 的值域为 $[-5,5]$，∴ 距离的最大值为 $(5+|a+4|)/sqrt(17)$。令其等于 $sqrt(17)$，得 $|a+4|=12$，故 $a=8$ 或 $a=-16$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [［选修 4—5：不等式选讲］已知函数 $f(x)=-x^2+a x+4$，$g(x)=|x+1|+|x-1|$。],
  parts: (
    subquestion(
      stem: [当 $a=1$ 时，求不等式 $f(x)>=g(x)$ 的解集。],
      answers: ([$[-1,(-1+sqrt(17))/2]$],),
      explanation: [当 $x< -1$ 时，不等式为 $x^2-3x-4<=0$，与 $x< -1$ 无公共解；当 $-1<=x<=1$ 时，为 $x^2-x-2<=0$，该段全部满足；当 $x>1$ 时，为 $x^2+x-4<=0$，得 $1<x<=(-1+sqrt(17))/2$。合并得解集为 $[-1,(-1+sqrt(17))/2]$。],
    ),
    subquestion(
      stem: [若不等式 $f(x)>=g(x)$ 的解集包含 $[-1,1]$，求 $a$ 的取值范围。],
      answers: ([$[-1,1]$],),
      explanation: [在 $[-1,1]$ 上，$g(x)=2$，故要求 $f(x)>=2$ 恒成立。二次函数 $f(x)$ 开口向下，区间最小值在端点取得，故等价于 $f(-1)=3-a>=2$ 且 $f(1)=3+a>=2$，即 $-1<=a<=1$。],
    ),
  ),
)
