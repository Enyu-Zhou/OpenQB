#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "全国三卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016全国3理(云南,广西,贵州).pdf",
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
    for (a, b) in ((P, A), (A, B), (A, D), (A, C), (A, N), (P, M), (M, N)) {
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
  stem: [设集合 $S={x|(x-2)(x-3)>=0}$，$T={x|x>0}$，则 $S inter T=$#choice-placeholder()。],
  choices: (
    [$[2,3]$],
    [$(-infinity,2] union [3,+infinity)$],
    [$[3,+infinity)$],
    [$(0,2] union [3,+infinity)$],
  ),
  answers: ([D],),
  explanation: [$S=(-infinity,2] union [3,+infinity)$，与 $T=(0,+infinity)$ 取交集，得 $(0,2] union [3,+infinity)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $z=1+2upright(i)$，则 $(4upright(i))/(z overline(z)-1)=$#choice-placeholder()。],
  choices: ([$1$], [$-1$], [$upright(i)$], [$-upright(i)$]),
  answers: ([C],),
  explanation: [$z overline(z)=1^2+2^2=5$，故原式为 $(4upright(i))/(5-1)=upright(i)$。],
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
  stem: [若 $tan alpha=3/4$，则 $cos^2 alpha+2sin 2alpha=$#choice-placeholder()。],
  choices: ([$64/25$], [$48/25$], [$1$], [$16/25$]),
  answers: ([A],),
  explanation: [$cos^2 alpha=1/(1+tan^2 alpha)=16/25$，$sin 2alpha=(2tan alpha)/(1+tan^2 alpha)=24/25$，故所求值为 $16/25+2 times 24/25=64/25$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a=2^(4/3),b=4^(2/5),c=25^(1/3)$，则#choice-placeholder()。],
  choices: ([$b<a<c$], [$a<b<c$], [$b<c<a$], [$c<a<b$]),
  answers: ([A],),
  explanation: [$a=16^(1/3)$、$b=16^(1/5)$，因底数 $16>1$，所以 $b<a$；又 $16<25$，所以 $a<c$，故 $b<a<c$。],
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
  stem: [在三角形 $A B C$ 中，$B=pi/4$，$B C$ 边上的高等于 $1/3 B C$，则 $cos A=$#choice-placeholder()。],
  choices: (
    [$(3sqrt(10))/10$],
    [$sqrt(10)/10$],
    [$-sqrt(10)/10$],
    [$-(3sqrt(10))/10$],
  ),
  answers: ([C],),
  explanation: [设高为 $h$，垂足为 $D$，则 $B C=3h$。由 $B=45 degree$，得 $B D=A D=h$，所以 $D C=2h$，$A B=sqrt(2)h$，$A C=sqrt(5)h$。
    由余弦定理，$cos A=(2h^2+5h^2-9h^2)/(2sqrt(2)h dot sqrt(5)h)=-sqrt(10)/10$。],
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
#question(
  "single-choice",
  score: 5,
  stem: [定义“规范 01 数列”${a_n}$ 如下：${a_n}$ 共有 $2m$ 项，其中 $m$ 项为 $0$，$m$ 项为 $1$，且对任意 $k<=2m$，$a_1,a_2,dots,a_k$ 中 $0$ 的个数不少于 $1$ 的个数。若 $m=4$，则不同的“规范 01 数列”共有#choice-placeholder()。],
  choices: ([$18$ 个], [$16$ 个], [$14$ 个], [$12$ 个]),
  answers: ([C],),
  explanation: [含四个 $0$、四个 $1$ 的序列共有 $C_8^4=70$ 个。
    对不合要求的序列，从首项到首次出现“$1$ 比 $0$ 多一个”的位置，将该前缀中的 $0,1$ 互换，得到含五个 $0$、三个 $1$ 的序列。反之，对后者到首次“$0$ 比 $1$ 多一个”的前缀互换，便恢复原序列。因此不合要求者有 $C_8^3=56$ 个。
    所求个数为 $70-56=14$。],
)
#section[填空题：共 4 题，每题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(x-y+1>=0, x-2y<=0, x+2y-2<=0)$，则 $z=x+y$ 的最大值为#fill-placeholder()。],
  answers: ([$3/2$],),
  explanation: [由 $x-2y<=0$、$x+2y<=2$，得 $x<=1$，所以 $x+y=1/2 x+1/2(x+2y)<=1/2+1=3/2$。当 $(x,y)=(1,1/2)$ 时满足全部约束且取等号，故最大值为 $3/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [函数 $y=sin x-sqrt(3)cos x$ 的图象可由函数 $y=sin x+sqrt(3)cos x$ 的图象至少向右平移#fill-placeholder()个单位长度得到。],
  answers: ([$(2pi)/3$],),
  explanation: [两函数分别为 $2sin(x-pi/3)$、$2sin(x+pi/3)$。向右平移 $d>0$ 后，相位满足 $pi/3-d=-pi/3+2k pi$（$k in ZZ$），故最小正值为 $d=(2pi)/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $f(x)$ 为偶函数，当 $x<0$ 时，$f(x)=ln(-x)+3x$，则曲线 $y=f(x)$ 在 $(1,-3)$ 处的切线方程是#fill-placeholder()。],
  answers: ([$y=-2x-1$],),
  explanation: [当 $x>0$ 时，$f(x)=f(-x)=ln x-3x$，所以 $f'(x)=1/x-3$，$f'(1)=-2$。切线方程为 $y+3=-2(x-1)$，即 $y=-2x-1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知直线 $l:m x+y+3m-sqrt(3)=0$ 与圆 $x^2+y^2=12$ 交于 $A,B$ 两点，过 $A,B$ 分别作 $l$ 的垂线与 $x$ 轴交于 $C,D$ 两点。若 $abs(A B)=2sqrt(3)$，则 $abs(C D)=$#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [圆心到 $l$ 的距离为 $sqrt(12-(sqrt(3))^2)=3$，故 $abs(3m-sqrt(3))/sqrt(m^2+1)=3$，解得 $m=-sqrt(3)/3$。
    直线 $l$ 的倾斜角为 $30 degree$。线段 $A B$ 是 $C D$ 在 $l$ 上的正投影，故 $abs(A B)=abs(C D)cos 30 degree$，得 $abs(C D)=4$。],
)
#section[解答题：共 70 分。第 17～21 题为必考题，每题 12 分；第 22～24 题为选考题，任选一题作答，满分 10 分。]
#question(
  "solution",
  score: 12,
  stem: [已知数列 ${a_n}$ 的前 $n$ 项和 $S_n=1+lambda a_n$，其中 $lambda !=0$。],
  parts: (
    subquestion(
      stem: [证明 ${a_n}$ 是等比数列，并求其通项公式。],
      answers: ([等比数列，$a_n=1/(1-lambda)(lambda/(lambda-1))^(n-1)$。],),
      explanation: [由 $a_1=S_1=1+lambda a_1$，得 $lambda !=1$，$a_1=1/(1-lambda) !=0$。
        将 $S_(n+1)=1+lambda a_(n+1)$ 与 $S_n=1+lambda a_n$ 相减，得 $(lambda-1)a_(n+1)=lambda a_n$。由于 $lambda !=0,1$，归纳知各项均非零，且 $a_(n+1)/a_n=lambda/(lambda-1)$。
        故该数列为等比数列，通项为 $a_n=1/(1-lambda)(lambda/(lambda-1))^(n-1)$。],
    ),
    subquestion(
      stem: [若 $S_5=31/32$，求 $lambda$。],
      answers: ([$lambda=-1$],),
      explanation: [令 $q=lambda/(lambda-1)$，则 $a_1=1-q$，所以 $S_n=1-q^n$。由 $1-q^5=31/32$，得 $q=1/2$，即 $lambda/(lambda-1)=1/2$，解得 $lambda=-1$。],
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
      stem: [求直线 $A N$ 与平面 $P M N$ 所成角的正弦值。],
      answers: ([$(8sqrt(5))/25$],),
      explanation: [取 $B C$ 的中点 $E$。由 $A B=A C=3$、$B C=4$，得 $A E perp B C$、$A E=sqrt(5)$。
        以 $A$ 为原点，$A E,A D,A P$ 的方向依次为 $x,y,z$ 轴正向，得
        $
          P=(0,0,4),quad M=(0,2,0),quad C=(sqrt(5),2,0),quad N=(sqrt(5)/2,1,2).
        $
        平面 $P M N$ 的法向量可取 $arrow(n)=(0,2,1)$，它与 $arrow(P M)=(0,2,-4)$、$arrow(P N)=(sqrt(5)/2,1,-2)$ 均垂直。
        设所求角为 $theta$，则
        $
          sin theta=abs(arrow(n) dot arrow(A N))/(abs(arrow(n))abs(arrow(A N)))=4/(sqrt(5) times 5/2)=(8sqrt(5))/25.
        $],
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
      explanation: [沿用第 (1) 问的坐标，利用底高或行列式计算面积，得
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
  stem: [设函数 $f(x)=alpha cos 2x+(alpha-1)(cos x+1)$，其中 $alpha>0$，$abs(f(x))$ 的最大值为 $A$。],
  parts: (
    subquestion(
      stem: [求 $f'(x)$。],
      answers: ([$f'(x)=-2alpha sin 2x-(alpha-1)sin x$],),
      explanation: [分别求导，得 $f'(x)=-2alpha sin 2x-(alpha-1)sin x$。],
    ),
    subquestion(
      stem: [求 $A$。],
      answers: (
        [$A=cases(2-3alpha & quad 0<alpha<=1/5, (alpha^2+6alpha+1)/(8alpha) & quad 1/5<alpha<1, 3alpha-2 & quad alpha>=1)$],
      ),
      explanation: [#step[当 $alpha>=1$ 时][
          $abs(f(x))<=alpha abs(cos 2x)+(alpha-1)abs(cos x+1)<=3alpha-2$，且 $x=0$ 时取等号，所以 $A=3alpha-2$。
        ]
        #step[当 $0<alpha<1$ 时][
          令 $t=cos x in [-1,1]$，则 $f(x)=g(t)=2alpha t^2+(alpha-1)t-1$。有 $g(-1)=alpha$、$g(1)=3alpha-2$，抛物线顶点横坐标为 $t_0=(1-alpha)/(4alpha)$。
          若 $0<alpha<=1/5$，则 $t_0>=1$，$g$ 在 $[-1,1]$ 上递减，故 $max abs(g(t))=max(alpha, 2-3alpha)=2-3alpha$。
          若 $1/5<alpha<1$，则 $0<t_0<1$，$g$ 的最小值为 $-(alpha^2+6alpha+1)/(8alpha)$，最大值为 $alpha$。又
          $
            (alpha^2+6alpha+1)/(8alpha)-alpha=((1-alpha)(7alpha+1))/(8alpha)>0,
          $
          所以 $A=(alpha^2+6alpha+1)/(8alpha)$。
        ]],
    ),
    subquestion(
      stem: [证明 $abs(f'(x))<=2A$。],
      answers: ([证明见解析。],),
      explanation: [由第 (1) 问，$abs(f'(x))<=2alpha+abs(alpha-1)$。
        当 $0<alpha<=1$ 时，$f(pi/2)=-1$，所以 $A>=1$，从而 $abs(f'(x))<=1+alpha<=2<=2A$。
        当 $alpha>=1$ 时，由第 (2) 问，$A=3alpha-2$，故 $abs(f'(x))<=3alpha-1<=6alpha-4=2A$。
        综上，对所有 $alpha>0$ 均有 $abs(f'(x))<=2A$。],
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
