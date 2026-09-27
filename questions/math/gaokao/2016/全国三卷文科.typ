#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "全国三卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016全国3文(云南,广西,贵州).pdf",
  regions: ("云南", "广西", "贵州"),
)

#let temperatures() = {
  set text(size: 9pt)
  cetz.canvas(length: 7mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let at(r, i) = (
      r * calc.cos(90deg - i * 30deg),
      r * calc.sin(90deg - i * 30deg),
    )
    let high = (6.5, 7.5, 10, 15, 18.5, 20, 22, 23, 18.5, 15, 10, 7)
    let low = (2.5, 1.5, 2, 5, 7.5, 10, 12.5, 13, 11.5, 10, 5.5, 3.5)
    line(
      ..high.enumerate().map(((i, r)) => at(r / 5, i)),
      close: true,
      fill: luma(90%),
      stroke: none,
    )
    for r in range(1, 6) { circle((0, 0), radius: r) }
    for (i, label) in (
      [一月],
      [二月],
      [三月],
      [四月],
      [五月],
      [六月],
      [七月],
      [八月],
      [九月],
      [十月],
      [十一月],
      [十二月],
    ).enumerate() {
      line((0, 0), at(5, i))
      content(at(5.55, i), label)
    }
    line(..high.enumerate().map(((i, r)) => at(r / 5, i)), close: true)
    line(..low.enumerate().map(((i, r)) => at(r / 5, i)), close: true, stroke: (
      dash: figure-style.dash,
    ))
    for data in (high, low) {
      for (i, r) in data.enumerate() {
        circle(at(r / 5, i), radius: 1pt, fill: black)
      }
    }
    for v in (5, 10, 15, 20) {
      content(
        if v == 5 { (0.12, 1) } else { (-0.12, v / 5) },
        box(fill: white, inset: 0.5pt)[#v℃],
        anchor: if v == 5 { "west" } else { "south-east" },
        padding: 1pt,
      )
    }
    content((-3.1, 0.1), $A$, anchor: "south-east", padding: 3pt)
    content((1.1, 0.1), $B$, anchor: "south-west", padding: 3pt)
    line((-5, -6.1), (-4, -6.1), stroke: (dash: figure-style.dash))
    content((-3.85, -6.1), [平均最低气温], anchor: "west")
    line((0.2, -6.1), (1.2, -6.1))
    content((1.35, -6.1), [平均最高气温], anchor: "west")
  })
}
#let algorithm() = {
  set text(size: 9pt)
  cetz.canvas(length: 7mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    for (y, label) in ((0, [开始]), (-11.6, [结束])) {
      rect((-0.7, y - 0.3), (0.7, y + 0.3), radius: 0.15)
      content((0, y), label)
    }
    for (y, label) in ((-1.2, [输入 $a,b$]), (-10.4, [输出 $n$])) {
      line(
        (-1.2, y - 0.35),
        (1, y - 0.35),
        (1.2, y + 0.35),
        (-1, y + 0.35),
        close: true,
      )
      content((0, y), label)
    }
    for (y, label, w) in (
      (-2.4, $n=0,s=0$, 1.4),
      (-3.8, $a=b-a$, 1.1),
      (-5.1, $b=b-a$, 1.1),
      (-6.4, $a=b+a$, 1.1),
      (-7.7, $s=s+a,n=n+1$, 2),
    ) {
      rect((-w, y - 0.35), (w, y + 0.35))
      content((0, y), label)
    }
    line((0, -8.6), (1.6, -9.1), (0, -9.6), (-1.6, -9.1), close: true)
    content((0, -9.1), $s>16$)
    for (a, b) in (
      (-0.3, -0.85),
      (-1.55, -2.05),
      (-2.75, -3.45),
      (-4.15, -4.75),
      (-5.45, -6.05),
      (-6.75, -7.35),
      (-8.05, -8.6),
      (-9.6, -10.05),
      (-10.75, -11.3),
    ) {
      line((0, a), (0, b), mark: (end: ">"))
    }
    line((-1.6, -9.1), (-2.8, -9.1), (-2.8, -3.1), (0, -3.1), mark: (end: ">"))
    content((-1.9, -9), [否], anchor: "south")
    content((0.25, -9.82), [是], anchor: "west")
  })
}
#let views() = cetz.canvas(length: 4.5mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for x in range(14) {
    for y in range(13) {
      if not (
        (x in (9, 12) and (6 <= y and y < 12))
          or (x in (1, 4, 7) and (1 <= y and y < 4))
      ) {
        line((x, y), (x, y + 1), stroke: (paint: luma(75%)))
      }
    }
  }
  for y in range(14) {
    for x in range(13) {
      if not (
        (y == 6 and (1 <= x and x < 4))
          or (y == 12 and (4 <= x and x < 7))
          or (y in (6, 12) and (9 <= x and x < 12))
          or (y in (1, 4) and (1 <= x and x < 7))
      ) {
        line((x, y), (x + 1, y), stroke: (paint: luma(75%)))
      }
    }
  }
  line((1, 6), (4, 6), (7, 12), (4, 12), close: true)
  rect((9, 6), (12, 12))
  rect((1, 1), (7, 4))
  line((4, 1), (4, 4))
})
#let waste-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: false,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      grid: (
        stroke: (
          paint: luma(55%),
          thickness: figure-style.thickness,
          dash: figure-style.dash,
        ),
      ),
    ))
    plot.plot(
      size: (9, 4.8),
      axis-style: "school-book",
      x-min: 0,
      x-max: 7.8,
      y-min: 0.8,
      y-max: 1.9,
      x-label: [年份代码 $t$],
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: range(1, 8),
      y-ticks: (
        (0.8, [0.80]),
        (1, [1.00]),
        (1.2, [1.20]),
        (1.4, [1.40]),
        (1.6, [1.60]),
        (1.8, [1.80]),
      ),
      {
        plot.annotate(resize: false, background: true, {
          for y in (1, 1.2, 1.4, 1.6, 1.8) {
            line((0, y), (7.8, y), stroke: (
              paint: luma(55%),
              dash: figure-style.dash,
            ))
          }
        })
        plot.add(
          (
            (1, 1.03),
            (2, 1.12),
            (3, 1.23),
            (4, 1.31),
            (5, 1.45),
            (6, 1.54),
            (7, 1.64),
          ),
          mark: "square",
          mark-size: 0.08,
          mark-style: (fill: black, stroke: figure-style.thickness),
          style: (stroke: (paint: black, thickness: figure-style.thickness)),
        )
      },
    )
  })
}
#let pyramid() = cetz.canvas(length: 11mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((-0.35, -0.55), (0.75, -0.1), (0, 1), {
    let A = (0, 0, 0)
    let B = (calc.sqrt(5), -2, 0)
    let C = (calc.sqrt(5), 2, 0)
    let D = (0, 3, 0)
    let P = (0, 0, 4)
    let M = (0, 2, 0)
    let N = (calc.sqrt(5) / 2, 1, 2)
    line(P, B, C, D, P)
    line(P, C)
    line(B, N)
    for (a, b) in ((P, A), (A, B), (A, D), (A, C), (B, M), (C, M), (M, N)) {
      line(a, b, stroke: (dash: figure-style.dash))
    }
    for (p, label, anchor) in (
      (A, $A$, "south-east"),
      (B, $B$, "east"),
      (C, $C$, "north"),
      (D, $D$, "west"),
      (P, $P$, "south"),
      (M, $M$, "south-west"),
      (N, $N$, "south-west"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let circle-chords() = cetz.canvas(length: 26mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let at(a) = (calc.cos(a), calc.sin(a))
  let A = at(145deg)
  let B = at(55deg)
  let P = at(100deg)
  let C = at(200deg)
  let D = at(315deg)
  let E = (-0.3648206491, 0.6536873195)
  let F = (-0.0318419138, 0.7124004545)
  let G = (-0.0433852999, -0.1956984411)
  circle((0, 0), radius: 1)
  line(A, B)
  line(P, C, D, P)
  line(
    ((E.at(0) + C.at(0)) / 2, (E.at(1) + C.at(1)) / 2),
    G,
    ((F.at(0) + D.at(0)) / 2, (F.at(1) + D.at(1)) / 2),
  )
  line((-G.at(0) * 1.2, -G.at(1) * 1.2), (G.at(0) * 3.5, G.at(1) * 3.5))
  circle((0, 0), radius: 1pt, fill: black)
  for (p, label, anchor) in (
    (A, $A$, "south-east"),
    (B, $B$, "south-west"),
    (P, $P$, "south"),
    (C, $C$, "north-east"),
    (D, $D$, "north-west"),
    (E, $E$, "north-east"),
    (F, $F$, "south-west"),
    ((0, 0), $O$, "east"),
    (G, $G$, "north-east"),
  ) {
    content(p, label, anchor: anchor, padding: 3pt)
  }
})

#section[选择题：共 12 题，每题 5 分，共 60 分。每题只有一个选项符合题意。]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={0,2,4,6,8,10}$，$B={4,8}$，则 $complement_A B=$#choice-placeholder()。],
  choices: ([${4,8}$], [${0,2,6}$], [${0,2,6,10}$], [${0,2,4,6,8,10}$]),
  answers: ([C],),
  explanation: [从集合 $A$ 中去掉属于 $B$ 的元素 $4,8$，得 $complement_A B={0,2,6,10}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $z=4+3i$，则 $overline(z)/abs(z)=$#choice-placeholder()。],
  choices: ([$1$], [$-1$], [$4/5+3/5 i$], [$4/5-3/5 i$]),
  answers: ([D],),
  explanation: [$overline(z)=4-3i$，$abs(z)=sqrt(4^2+3^2)=5$，所以 $overline(z)/abs(z)=4/5-3/5 i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知向量 $arrow(B A)=(1/2,sqrt(3)/2)$，$arrow(B C)=(sqrt(3)/2,1/2)$，则 $angle A B C=$#choice-placeholder()。],
  choices: ([$30 degree$], [$45 degree$], [$60 degree$], [$120 degree$]),
  answers: ([A],),
  explanation: [两向量的模均为 $1$，数量积为 $sqrt(3)/2$，故 $cos angle A B C=sqrt(3)/2$，从而 $angle A B C=30 degree$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某旅游城市为向游客介绍本地的气温情况，绘制了一年中各月平均最高气温和平均最低气温的雷达图。图中 $A$ 点表示十月的平均最高气温约为 15℃，$B$ 点表示四月的平均最低气温约为 5℃。下面叙述不正确的是#choice-placeholder()。
    #figure(temperatures())],
  choices: (
    [各月的平均最低气温都在 0℃以上],
    [七月的平均温差比一月的平均温差大],
    [三月和十一月的平均最高气温基本相同],
    [平均最高气温高于 20℃的月份有 $5$ 个],
  ),
  answers: ([D],),
  explanation: [图中最低气温曲线各点均在原点外，A 正确。七月两条曲线的径向距离大于一月，B 正确。三月和十一月的平均最高气温均约为 10℃，C 正确。平均最高气温高于 20℃的只有七月和八月，故 D 不正确。],
)
#question(
  "single-choice",
  score: 5,
  stem: [小敏打开计算机时，忘记了开机密码的前两位，只记得第一位是 M、I、N 中的一个字母，第二位是 $1,2,3,4,5$ 中的一个数字，则小敏输入一次密码能够成功开机的概率是#choice-placeholder()。],
  choices: ([$8/15$], [$1/8$], [$1/15$], [$1/30$]),
  answers: ([C],),
  explanation: [密码前两位共有 $3 times 5=15$ 种等可能组合，其中只有一种正确，故成功开机的概率为 $1/15$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $tan theta=1/3$，则 $cos 2theta=$#choice-placeholder()。],
  choices: ([$-4/5$], [$-1/5$], [$1/5$], [$4/5$]),
  answers: ([D],),
  explanation: [$cos 2theta=(1-tan^2 theta)/(1+tan^2 theta)=(1-1/9)/(1+1/9)=4/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a=2^(4/3),b=3^(2/3),c=25^(1/3)$，则#choice-placeholder()。],
  choices: ([$b<a<c$], [$a<b<c$], [$b<c<a$], [$c<a<b$]),
  answers: ([A],),
  explanation: [$a=4^(2/3)$，$b=3^(2/3)$，$c=5^(2/3)$。函数 $y=x^(2/3)$ 在 $(0,+infinity)$ 上单调递增，由 $3<4<5$ 得 $b<a<c$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行下图的程序框图，如果输入的 $a=4,b=6$，那么输出的 $n=$#choice-placeholder()。
    #figure(algorithm())],
  choices: ([$3$], [$4$], [$5$], [$6$]),
  answers: ([B],),
  explanation: [每轮前三条赋值语句依次执行，其效果是交换 $a,b$。各轮结束时，$(a,b,s,n)$ 依次为 $(6,4,6,1)$、$(4,6,10,2)$、$(6,4,16,3)$、$(4,6,20,4)$。第四轮才满足 $s>16$，故输出 $n=4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在三角形 $A B C$ 中，$B=pi/4$，$B C$ 边上的高等于 $1/3 B C$，则 $sin A=$#choice-placeholder()。],
  choices: ([$3/10$], [$sqrt(10)/10$], [$sqrt(5)/5$], [$(3sqrt(10))/10$]),
  answers: ([D],),
  explanation: [设高 $A D=h$，则 $B C=3h$。由 $B=45 degree$，得 $B D=h$，故 $D C=2h$，$A C=sqrt(5)h$。
    由正弦定理，$sin A=(B C sin B)/(A C)=(3h times sqrt(2)/2)/(sqrt(5)h)=(3sqrt(10))/10$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，网格纸上小正方形的边长为 $1$，粗实线画出的是某多面体的三视图，则该多面体的表面积为#choice-placeholder()。
    #figure(views())],
  choices: ([$18+36sqrt(5)$], [$54+18sqrt(5)$], [$90$], [$81$]),
  answers: ([B],),
  explanation: [该几何体是斜四棱柱，上下底面均为边长 $3$ 的正方形，侧棱的竖直分量为 $6$、水平分量为 $3$，故侧棱长 $sqrt(6^2+3^2)=3sqrt(5)$。
    前后两个侧面是底为 $3$、高为 $6$ 的平行四边形，左右两个侧面是边长 $3$ 与 $3sqrt(5)$ 的矩形，故表面积为
    $2 times 3^2+2 times 3 times 6+2 times 3 times 3sqrt(5)=54+18sqrt(5)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在封闭的直三棱柱 $A B C-A_1 B_1 C_1$ 内有一个体积为 $V$ 的球，若 $A B perp B C$，$A B=6,B C=8,A A_1=3$，则 $V$ 的最大值是#choice-placeholder()。],
  choices: ([$4pi$], [$(9pi)/2$], [$6pi$], [$(32pi)/3$]),
  answers: ([B],),
  explanation: [底面直角三角形的斜边长为 $10$，内切圆半径为 $(6+8-10)/2=2$。球又受上下底面间距 $3$ 的限制，故半径不超过 $3/2$。
    将球心取在底面内心的正上方、距上下底面均为 $3/2$ 处，半径 $3/2$ 的球可以放入，故最大体积为 $4/3 pi (3/2)^3=(9pi)/2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $O$ 为坐标原点，$F$ 是椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的左焦点，$A,B$ 分别为 $C$ 的左、右顶点，$P$ 为 $C$ 上一点，且 $P F perp x$ 轴。过点 $A$ 的直线 $l$ 与线段 $P F$ 交于点 $M$，与 $y$ 轴交于点 $E$。若直线 $B M$ 经过 $O E$ 的中点，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$1/3$], [$1/2$], [$2/3$], [$3/4$]),
  answers: ([A],),
  explanation: [设 $F=(-c,0)$、$M=(-c,h)$。按题意 $O E$ 为非退化线段，故 $h !=0$。
    直线 $A M$ 在 $y$ 轴上的截距为 $(a h)/(a-c)$，直线 $B M$ 在 $y$ 轴上的截距为 $(a h)/(a+c)$。由中点条件，$(a h)/(a+c)=1/2 dot (a h)/(a-c)$，所以 $a+c=2(a-c)$，得 $a=3c$。故离心率 $e=c/a=1/3$。],
)
#section[填空题：共 4 题，每题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(2x-y+1>=0, x-2y-1<=0, x<=1)$，则 $z=2x+3y-5$ 的最小值为#fill-placeholder()。],
  answers: ([$-10$],),
  explanation: [由约束得 $(x-1)/2<=y<=2x+1$，故 $x>=-1$，进而 $y>=(x-1)/2>=-1$。
    所以 $z=2x+3y-5>=-2-3-5=-10$。当 $(x,y)=(-1,-1)$ 时满足全部约束且取等号，故最小值为 $-10$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [函数 $y=sin x-sqrt(3)cos x$ 的图象可由函数 $y=2sin x$ 的图象至少向右平移#fill-placeholder()个单位长度得到。],
  answers: ([$pi/3$],),
  explanation: [$sin x-sqrt(3)cos x=2sin(x-pi/3)$，故由 $y=2sin x$ 的图象向右平移 $pi/3$ 个单位长度即可得到，且这是最小正平移量。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知直线 $l:x-sqrt(3)y+6=0$ 与圆 $x^2+y^2=12$ 交于 $A,B$ 两点，过 $A,B$ 分别作 $l$ 的垂线与 $x$ 轴交于 $C,D$ 两点，则 $abs(C D)=$#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [圆的半径为 $2sqrt(3)$，圆心到直线 $l$ 的距离为 $6/sqrt(1+3)=3$，所以弦长 $abs(A B)=2sqrt(12-9)=2sqrt(3)$。
    直线 $l$ 的倾斜角为 $30 degree$，而 $A B$ 是 $C D$ 在 $l$ 上的正投影，故 $abs(C D)=abs(A B)/(cos 30 degree)=4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $f(x)$ 为偶函数，当 $x<=0$ 时，$f(x)=e^(-x-1)-x$，则曲线 $y=f(x)$ 在点 $(1,2)$ 处的切线方程是#fill-placeholder()。],
  answers: ([$y=2x$],),
  explanation: [当 $x>0$ 时，$-x<0$，由偶性得 $f(x)=f(-x)=e^(x-1)+x$，所以 $f'(x)=e^(x-1)+1$，$f'(1)=2$。
    切线方程为 $y-2=2(x-1)$，即 $y=2x$。],
)
#section[解答题：共 70 分。第 17～21 题为必考题，每题 12 分；第 22～24 题为选考题，任选一题作答，满分 10 分。]
#question(
  "solution",
  score: 12,
  stem: [已知各项都为正数的数列 ${a_n}$ 满足 $a_1=1$，$a_n^2-(2a_(n+1)-1)a_n-2a_(n+1)=0$。],
  parts: (
    subquestion(
      stem: [求 $a_2,a_3$。],
      answers: ([$a_2=1/2$，$a_3=1/4$。],),
      explanation: [取 $n=1$，代入 $a_1=1$，得 $1-(2a_2-1)-2a_2=0$，解得 $a_2=1/2$。
        再取 $n=2$，得 $1/4-(2a_3-1)/2-2a_3=0$，解得 $a_3=1/4$。],
    ),
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=1/2^(n-1)$],),
      explanation: [将递推式因式分解，得 $(a_n+1)(a_n-2a_(n+1))=0$。
        因为 $a_n>0$，所以 $a_n+1>0$，从而 $a_(n+1)=1/2 a_n$。故 ${a_n}$ 是首项为 $1$、公比为 $1/2$ 的等比数列，通项公式为 $a_n=(1/2)^(n-1)=1/2^(n-1)$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [下图是我国 2008 年至 2014 年生活垃圾无害化处理量（单位：亿吨）的折线图。
    #figure(waste-chart())
    注：年份代码 $1～7$ 分别对应年份 2008～2014。

    参考数据：$sum_(i=1)^7 y_i=9.32$，$sum_(i=1)^7 t_i y_i=40.17$，$sqrt(sum_(i=1)^7 (y_i-overline(y))^2)=0.55$，$sqrt(7) approx 2.646$。

    参考公式：相关系数
    $
      r=(sum_(i=1)^n (t_i-overline(t))(y_i-overline(y)))/sqrt(sum_(i=1)^n (t_i-overline(t))^2 sum_(i=1)^n (y_i-overline(y))^2).
    $
    回归方程 $hat(y)=hat(a)+hat(b)t$ 中斜率和截距的最小二乘估计公式分别为：
    $
      hat(b)=(sum_(i=1)^n (t_i-overline(t))(y_i-overline(y)))/(sum_(i=1)^n (t_i-overline(t))^2),quad hat(a)=overline(y)-hat(b)overline(t).
    $],
  parts: (
    subquestion(
      stem: [由折线图看出，可用线性回归模型拟合 $y$ 与 $t$ 的关系，请用相关系数加以说明。],
      answers: ([$r approx 0.99$，线性相关程度很高，可用线性回归模型拟合。],),
      explanation: [$overline(t)=4$，$sum_(i=1)^7 (t_i-overline(t))^2=28$，且
        $
          sum_(i=1)^7 (t_i-overline(t))(y_i-overline(y))=sum_(i=1)^7 t_i y_i-overline(t)sum_(i=1)^7 y_i=40.17-4 times 9.32=2.89.
        $
        所以 $r=2.89/(sqrt(28) times 0.55) approx 0.99$。$r$ 接近 $1$，表明 $y$ 与 $t$ 的线性正相关程度很高，可以采用线性回归模型。],
    ),
    subquestion(
      stem: [建立 $y$ 关于 $t$ 的回归方程（系数精确到 $0.01$），预测 2016 年我国生活垃圾无害化处理量。],
      answers: ([$hat(y)=0.92+0.10t$，预测约为 $1.82$ 亿吨。],),
      explanation: [$hat(b)=2.89/28 approx 0.10$，$hat(a)=9.32/7-2.89/28 times 4 approx 0.92$，所以按要求保留两位小数的回归方程为 $hat(y)=0.92+0.10t$。
        2016 年对应 $t=9$，代入得 $hat(y)=0.92+0.10 times 9=1.82$，故预测处理量约为 $1.82$ 亿吨。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，四棱锥 $P-A B C D$ 中，$P A perp$ 平面 $A B C D$，$A D parallel B C$，$A B=A D=A C=3$，$P A=B C=4$，$M$ 为线段 $A D$ 上一点，$A M=2M D$，$N$ 为 $P C$ 的中点。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [证明：$M N parallel$ 平面 $P A B$。],
      answers: ([证明见解析。],),
      explanation: [取 $P B$ 的中点 $T$，连接 $A T,T N$。三角形 $P B C$ 中，$T N parallel B C$ 且 $T N=1/2 B C=2$。
        又 $A M=2/3 A D=2$、$A M parallel B C$，所以 $A M$ 与 $T N$ 平行且相等，四边形 $A M N T$ 是平行四边形，故 $M N parallel A T$。
        因 $A T$ 在平面 $P A B$ 内，而 $M N$ 不在该平面内，故 $M N parallel$ 平面 $P A B$。],
    ),
    subquestion(
      stem: [求四面体 $N-B C M$ 的体积。],
      answers: ([$(4sqrt(5))/3$],),
      explanation: [取 $B C$ 的中点 $E$。由 $A B=A C=3$、$B C=4$，得 $A E perp B C$，$A E=sqrt(3^2-2^2)=sqrt(5)$。
        因为 $A M parallel B C$，所以点 $M$ 到 $B C$ 的距离也是 $sqrt(5)$，故 $S_(triangle B C M)=1/2 times 4 times sqrt(5)=2sqrt(5)$。
        又 $P A perp$ 平面 $A B C D$，$N$ 为 $P C$ 的中点，故 $N$ 到该平面的距离为 $1/2 P A=2$。
        因此 $V_(N-B C M)=1/3 times 2sqrt(5) times 2=(4sqrt(5))/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知抛物线 $C:y^2=2x$ 的焦点为 $F$，平行于 $x$ 轴的两条直线 $l_1,l_2$ 分别交 $C$ 于 $A,B$ 两点，交 $C$ 的准线于 $P,Q$ 两点。],
  parts: (
    subquestion(
      stem: [若 $F$ 在线段 $A B$ 上，$R$ 是 $P Q$ 的中点，证明 $A R parallel F Q$。],
      answers: ([证明见解析。],),
      explanation: [$F=(1/2,0)$。设 $l_1:y=u,l_2:y=v$，则 $u !=v$，且因两直线平行于 $x$ 轴而与之不重合，$u v !=0$。于是
        $ A=(u^2/2,u),quad B=(v^2/2,v), $
        $ P=(-1/2,u),quad Q=(-1/2,v),quad R=(-1/2,(u+v)/2). $
        直线 $A B$ 的方程为 $2x-(u+v)y+u v=0$。代入 $F$ 得 $u v=-1$，所以
        $ k_(A R)=(u-v)/(u^2+1)=(u+1/u)/(u^2+1)=1/u=-v=k_(F Q). $
        两直线不同且斜率相等，故 $A R parallel F Q$。],
    ),
    subquestion(
      stem: [若三角形 $P Q F$ 的面积是三角形 $A B F$ 面积的两倍，求 $A B$ 中点的轨迹方程。],
      answers: ([$y^2=x-1$],),
      explanation: [沿用第 (1) 问的坐标，利用直线截距和三角形面积公式，得
        $
          S_(triangle P Q F)=abs(u-v)/2,quad S_(triangle A B F)=(abs(u-v)abs(1+u v))/4.
        $
        因 $u !=v$，由题意得 $abs(1+u v)=1$，即 $u v=0$ 或 $u v=-2$。前者不符合 $u v !=0$，故 $u v=-2$。
        设中点为 $(x,y)$，则 $x=(u^2+v^2)/4$、$y=(u+v)/2$，从而 $y^2=x+(u v)/2=x-1$。
        反之，对曲线上任一点 $(y^2+1,y)$，取 $u,v$ 为 $t^2-2y t-2=0$ 的两根。判别式 $4y^2+8>0$，两根不同且均非零，满足所有条件。因此完整轨迹为 $y^2=x-1$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设函数 $f(x)=ln x-x+1$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性。],
      answers: ([在 $(0,1)$ 上单调递增，在 $(1,+infinity)$ 上单调递减。],),
      explanation: [定义域为 $(0,+infinity)$，$f'(x)=1/x-1=(1-x)/x$。
        当 $0<x<1$ 时，$f'(x)>0$；当 $x>1$ 时，$f'(x)<0$。故 $f(x)$ 在 $(0,1)$ 上单调递增，在 $(1,+infinity)$ 上单调递减。],
    ),
    subquestion(
      stem: [证明当 $x in (1,+infinity)$ 时，$1<(x-1)/(ln x)<x$。],
      answers: ([证明见解析。],),
      explanation: [由第 (1) 问，$f$ 在 $x=1$ 处取得唯一最大值 $f(1)=0$，故当 $t>0$、$t !=1$ 时，$ln t<t-1$。
        对 $x>1$，分别令 $t=x$ 和 $t=1/x$，得 $ln x<x-1$、$-ln x<1/x-1$，即
        $ (x-1)/x<ln x<x-1. $
        因 $ln x>0$，整理得 $1<(x-1)/(ln x)<x$。],
    ),
    subquestion(
      stem: [设 $c>1$，证明当 $x in (0,1)$ 时，$1+(c-1)x>c^x$。],
      answers: ([证明见解析。],),
      explanation: [令 $g(x)=1+(c-1)x-c^x$，则 $g'(x)=c-1-c^x ln c$。
        由于 $c>1$，$g'(x)$ 严格递减。由第 (2) 问，$1<(c-1)/(ln c)<c$，所以
        $ g'(0)=c-1-ln c>0,quad g'(1)=c-1-c ln c<0. $
        因此存在唯一 $x_0 in (0,1)$，使 $g'(x_0)=0$，且 $g$ 在 $(0,x_0)$ 上递增，在 $(x_0,1)$ 上递减。
        又 $g(0)=g(1)=0$，所以对所有 $x in (0,1)$，都有 $g(x)>0$，即 $1+(c-1)x>c^x$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4-1：几何证明选讲。如图，圆 $O$ 中弧 $A B$ 的中点为 $P$，弦 $P C,P D$ 分别交 $A B$ 于 $E,F$ 两点。
    #figure(circle-chords())],
  parts: (
    subquestion(
      stem: [若 $angle P F B=2angle P C D$，求 $angle P C D$ 的大小。],
      answers: ([$60 degree$],),
      explanation: [连接 $P B,B C$。由三角形外角关系，$angle B F D=angle P B A+angle B P D$；又 $angle P C D=angle P C B+angle B C D$。
        因弧 $A P$ 与弧 $P B$ 相等，$angle P B A=angle P C B$；由同弧所对圆周角相等，$angle B P D=angle B C D$。故 $angle B F D=angle P C D$。
        又 $angle P F B+angle B F D=180 degree$，所以 $3angle P C D=180 degree$，即 $angle P C D=60 degree$。],
    ),
    subquestion(
      stem: [若 $E C$ 的垂直平分线与 $F D$ 的垂直平分线交于点 $G$，证明 $O G perp C D$。],
      answers: ([证明见解析。],),
      explanation: [第 (1) 问中，$angle B F D=angle P C D$ 的推导只依赖弧中点条件，仍然成立。故 $angle E F D+angle E C D=180 degree$，于是 $C,D,E,F$ 四点共圆。
        该圆的圆心为弦 $E C,F D$ 的垂直平分线交点 $G$，所以 $G C=G D$。又 $O C=O D$，故 $O,G$ 均在 $C D$ 的垂直平分线上。
        由于 $E,F$ 位于圆 $O$ 内，四点所在圆与圆 $O$ 不同，且共享 $C,D$，故 $G !=O$。因此 $O G$ 就是 $C D$ 的垂直平分线，$O G perp C D$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4-4：坐标系与参数方程。在直角坐标系 $x O y$ 中，曲线 $C_1$ 的参数方程为 $cases(x=sqrt(3)cos alpha, y=sin alpha)$（$alpha$ 为参数）。以坐标原点为极点，以 $x$ 轴的正半轴为极轴，建立极坐标系，曲线 $C_2$ 的极坐标方程为 $rho sin(theta+pi/4)=2sqrt(2)$。],
  parts: (
    subquestion(
      stem: [写出 $C_1$ 的普通方程和 $C_2$ 的直角坐标方程。],
      answers: ([$C_1:x^2/3+y^2=1$，$C_2:x+y-4=0$。],),
      explanation: [由 $cos^2 alpha+sin^2 alpha=1$，得 $C_1:x^2/3+y^2=1$。
        将极坐标方程展开，得 $rho sin theta+rho cos theta=4$，即 $C_2:x+y-4=0$。],
    ),
    subquestion(
      stem: [设点 $P$ 在 $C_1$ 上，点 $Q$ 在 $C_2$ 上，求 $abs(P Q)$ 的最小值及此时 $P$ 的直角坐标。],
      answers: ([$sqrt(2)$；$P=(3/2,1/2)$。],),
      explanation: [设 $P=(sqrt(3)cos alpha,sin alpha)$。固定 $P$ 时，$Q$ 取垂足可使距离最小，最小值为
        $
          d=(abs(sqrt(3)cos alpha+sin alpha-4))/sqrt(2)=(4-2sin(alpha+pi/3))/sqrt(2).
        $
        当 $sin(alpha+pi/3)=1$ 时，距离取最小值 $sqrt(2)$。此时 $alpha=pi/6+2k pi$（$k in ZZ$），故 $P=(3/2,1/2)$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4-5：不等式选讲。已知函数 $f(x)=abs(2x-a)+a$。],
  parts: (
    subquestion(
      stem: [当 $a=2$ 时，求不等式 $f(x)<=6$ 的解集。],
      answers: ([$[-1,3]$],),
      explanation: [$abs(2x-2)+2<=6$ 等价于 $-4<=2x-2<=4$，解得 $-1<=x<=3$，故解集为 $[-1,3]$。],
    ),
    subquestion(
      stem: [设函数 $g(x)=abs(2x-1)$，当 $x in RR$ 时，$f(x)+g(x)>=3$，求 $a$ 的取值范围。],
      answers: ([$[2,+infinity)$],),
      explanation: [由绝对值三角不等式，$f(x)+g(x)=abs(2x-a)+abs(1-2x)+a>=abs(1-a)+a$，且 $x=1/2$ 时取等号。
        因此恒成立条件等价于 $abs(1-a)+a>=3$。当 $a<=1$ 时左边为 $1$，不成立；当 $a>1$ 时，得 $2a-1>=3$，即 $a>=2$。故所求范围为 $[2,+infinity)$。],
    ),
  ),
)
