#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "山东卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017山东文.pdf",
  regions: ("山东",),
)
#let branch-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((-0.6, 0.3), (0.6, -0.3), radius: 0.15)
    content((0, 0), [开始])
    line((-0.8, -1), (1, -1), (0.8, -1.7), (-1, -1.7), close: true)
    content((0, -1.35), [输入 $x$])
    line((0, -2.35), (1.6, -2.85), (0, -3.35), (-1.6, -2.85), close: true)
    rect((-1, -4.2), (1, -4.9))
    content((0, -4.55), $y=x+2$)
    rect((2.1, -4.2), (4.3, -4.9))
    content((3.2, -4.55), $y=log_2 x$)
    line((-0.8, -5.9), (1, -5.9), (0.8, -6.6), (-1, -6.6), close: true)
    content((0, -6.25), [输出 $y$])
    rect((-0.6, -7.3), (0.6, -7.9), radius: 0.15)
    content((0, -7.6), [结束])
    for (u, v) in (
      ((0, -0.3), (0, -1)),
      ((0, -1.7), (0, -2.35)),
      ((0, -3.35), (0, -4.2)),
      ((0, -4.9), (0, -5.9)),
      ((0, -6.6), (0, -7.3)),
    ) {
      line(u, v, mark: (end: ">"))
    }
    line((1.6, -2.85), (3.2, -2.85), (3.2, -4.2), mark: (end: ">"))
    line((3.2, -4.9), (3.2, -5.4), (0, -5.4), mark: (end: ">"))
    content((0.2, -3.7), [是], anchor: "west")
    content((2.0, -2.65), [否])
  })
}
#let stem-leaf() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((-2.2, 0.3), (3.2, 0.3))
  line((-0.4, 0.3), (-0.4, -2.4))
  line((0.4, 0.3), (0.4, -2.4))
  content((-1.4, 0.8), [甲组])
  content((1.8, 0.8), [乙组])
  for (i, left, stem, right) in (
    (0, $6$, $5$, $9$),
    (1, $2 quad 5$, $6$, $1 quad 7 quad y$),
    (2, $x quad 4$, $7$, $8$),
  ) {
    let y = -0.3 - i * 0.85
    content((-0.65, y), left, anchor: "east")
    content((0, y), stem)
    content((0.65, y), right, anchor: "west")
  }
})
#let three-views() = {
  set text(size: 9pt)
  cetz.canvas(length: 12mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((0, 0), (4, 1))
    line((1, 0), (1, 1))
    line((3, 0), (3, 1))
    rect((5.2, 0), (6.2, 1))
    line((0, -1.8), (3, -1.8))
    line((1, -2.8), (4, -2.8))
    line((1, -1.8), (1, -2.8))
    line((3, -1.8), (3, -2.8))
    arc((0, -1.8), start: 180deg, stop: 270deg, radius: 1)
    arc((3, -1.8), start: 90deg, stop: 0deg, radius: 1)
    let h-dim(x1, x2, y, label) = {
      line((x1, y), (x2, y), mark: (start: ">", end: ">"))
      for x in (x1, x2) { line((x, y - 0.1), (x, y + 0.1)) }
      content(
        ((x1 + x2) / 2, y),
        label,
        frame: "rect",
        fill: white,
        stroke: none,
        padding: 1pt,
      )
    }
    h-dim(0, 1, -0.25, $1$)
    h-dim(1, 3, -0.25, $2$)
    h-dim(3, 4, -0.25, $1$)
    h-dim(5.2, 6.2, -0.25, $1$)
    h-dim(0, 1, -1.55, $1$)
    h-dim(1, 3, -3.05, $2$)
    h-dim(3, 4, -3.05, $1$)
    for x in (4.3, 4.9) {
      line((x, 0), (x, 1), mark: (start: ">", end: ">"))
      for y in (0, 1) { line((x - 0.1, y), (x + 0.1, y)) }
      content(
        (x, 0.5),
        $1$,
        frame: "rect",
        fill: white,
        stroke: none,
        padding: 1pt,
      )
    }
    content((2, -0.75), [正视图（主视图）])
    content((5.7, -0.75), [侧视图（左视图）])
    content((2, -3.55), [俯视图])
  })
}
#let cut-prism(auxiliary: false) = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (0, 2, 0)
  let c = (2, 2, 0)
  let d = (2, 0, 0)
  let a1 = (1, 0, 2)
  let b1 = (1, 2, 2)
  let d1 = (3, 0, 2)
  let e = (1, 0, 0)
  let o = (1, 1, 0)
  let m = (1.5, 0.5, 0)
  oblique-project((1, 0), (-0.55, -0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(b, c, d, d1, a1, b1, b)
    line(b1, c, d1, b1)
    for (u, v) in (
      (a, b),
      (a, d),
      (a, a1),
      (a, c),
      (b, d),
      (a1, e),
      (a1, o),
      (a1, m),
      (e, m),
    ) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    for (pt, label, anchor) in (
      (a, $A$, "south-east"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (a1, $A_1$, "south"),
      (b1, $B_1$, "east"),
      (d1, $D_1$, "west"),
      (e, $E$, "south-east"),
      (o, $O$, "north"),
      (m, $M$, "north-west"),
    ) { content(pt, label, anchor: anchor, padding: 3pt) }
    if auxiliary {
      let o1 = (2, 1, 2)
      line(a1, o1)
      line(c, o1)
      content(o1, $O_1$, anchor: "south", padding: 3pt)
    }
  })
})
#let ellipse-tangents() = {
  set text(size: 9pt)
  cetz.canvas(length: 12mm, {
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
    let k = 0.9
    let m = 1.8
    let s = 1 + 2 * k * k
    let dx = -2 * k * m / s
    let dy = m / s
    let root = calc.sqrt(16 * s - 8 * m * m) / (2 * s)
    let a = (dx - root, k * (dx - root) + m)
    let b = (dx + root, k * (dx + root) + m)
    let d = (dx, dy)
    let l2 = dx * dx + (dy + m) * (dy + m)
    let t = m * calc.sqrt(l2 - m * m) / l2
    let e = (
      m * m / l2 * dx - t * (dy + m),
      -m + m * m / l2 * (dy + m) + t * dx,
    )
    let f = (
      m * m / l2 * dx + t * (dy + m),
      -m + m * m / l2 * (dy + m) - t * dx,
    )
    plot.plot(
      size: (6, 6.6),
      axis-style: "school-book",
      x-min: -3,
      x-max: 3,
      y-min: -3.9,
      y-max: 2.7,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      {
        plot.annotate(resize: false, {
          circle((0, 0), radius: (2, calc.sqrt(2)))
          circle((0, -m), radius: m)
          line((-2.6, k * -2.6 + m), (0.8, k * 0.8 + m))
          line(e, d, f)
          circle((0, -m), radius: 0.035, fill: black, stroke: none)
          for (p, label, anchor) in (
            (b, $B$, "south-east"),
            ((0, m), $M$, "east"),
            ((0, -m), $N$, "west"),
            (e, $E$, "east"),
            ((0.8, k * 0.8 + m), $l$, "west"),
          ) { content(p, label, anchor: anchor, padding: 3pt) }
          content((a.at(0) - 0.25, a.at(1) + 0.25), $A$, padding: 0pt)
          content((dx + 0.35, dy + 0.1), $D$, padding: 0pt)
          content((f.at(0) - 0.12, f.at(1) - 0.26), $F$, padding: 0pt)
        })
      },
    )
  })
}

#section[选择题：共 10 小题，每小题 5 分，共 50 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $M={x | abs(x-1)<1}$，$N={x | x<2}$，则 $M inter N=$#choice-placeholder()。],
  choices: ([$(-1,1)$], [$(-1,2)$], [$(0,2)$], [$(1,2)$]),
  answers: ([C],),
  explanation: [由 $abs(x-1)<1$ 得 $0<x<2$，故 $M=(0,2) subset N$，所以 $M inter N=(0,2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $i$ 是虚数单位，若复数 $z$ 满足 $z i=1+i$，则 $z^2=$#choice-placeholder()。],
  choices: ([$-2i$], [$2i$], [$-2$], [$2$]),
  answers: ([A],),
  explanation: [两边平方得 $-z^2=(1+i)^2=2i$，故 $z^2=-2i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $x,y$ 满足约束条件 $cases(x-2y+5<=0, x+3>=0, y<=2)$，则 $z=x+2y$ 的最大值是#choice-placeholder()。],
  choices: ([$-3$], [$-1$], [$1$], [$3$]),
  answers: ([D],),
  explanation: [由约束条件得 $x<=2y-5$，所以 $x+2y<=4y-5<=3$。点 $(-1,2)$ 满足全部约束且使等号成立，故最大值为 $3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $cos x=3/4$，则 $cos 2x=$#choice-placeholder()。],
  choices: ([$-1/4$], [$1/4$], [$-1/8$], [$1/8$]),
  answers: ([D],),
  explanation: [$cos 2x=2cos^2 x-1=2 times (3/4)^2-1=1/8$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知命题 $p: exists x in RR,x^2-x+1>=0$。命题 $q$：若 $a^2<b^2$，则 $a<b$。下列命题为真命题的是#choice-placeholder()。],
  choices: ([$p and q$], [$p and not q$], [$not p and q$], [$not p and not q$]),
  answers: ([B],),
  explanation: [取 $x=0$ 即满足 $x^2-x+1>=0$，故 $p$ 为真。取 $a=1,b=-2$，有 $a^2<b^2$ 但 $a>b$，故 $q$ 为假。因此 $p and not q$ 为真。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图所示的程序框图，当输入的 $x$ 的值为 $4$ 时，输出的 $y$ 的值为 $2$，则空白判断框中的条件可能为#choice-placeholder()。
    #figure(branch-chart())],
  choices: ([$x>3$], [$x>4$], [$x<=4$], [$x<=5$]),
  answers: ([B],),
  explanation: [当 $x=4$ 时，$x+2=6$，$log_2 x=2$，所以程序应沿“否”分支执行。四个条件中只有 $x>4$ 在 $x=4$ 时为假。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $y=sqrt(3)sin 2x+cos 2x$ 的最小正周期为#choice-placeholder()。],
  choices: ([$pi/2$], [$2pi/3$], [$pi$], [$2pi$]),
  answers: ([C],),
  explanation: [$y=2sin(2x+pi/6)$，最小正周期为 $2pi/2=pi$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图所示的茎叶图记录了甲、乙两组各 $5$ 名工人某日的产量数据（单位：件）。若这两组数据的中位数相等，且平均值也相等，则 $x$ 和 $y$ 的值分别为#choice-placeholder()。
    #figure(stem-leaf())],
  choices: ([$3,5$], [$5,5$], [$3,7$], [$5,7$]),
  answers: ([A],),
  explanation: [甲组的中位数为 $65$。乙组的中位数只能在 $61,67,60+y$ 中产生，要等于 $65$，必须有 $y=5$。再由两组总和相等，得 $56+62+65+(70+x)+74=59+61+67+65+78$，解得 $x=3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $f(x)=cases(sqrt(x) quad &0<x<1, 2(x-1) quad &x>=1)$，若 $f(a)=f(a+1)$，则 $f(1/a)=$#choice-placeholder()。],
  choices: ([$2$], [$4$], [$6$], [$8$]),
  answers: ([C],),
  explanation: [定义域要求 $a>0$。若 $a>=1$，则 $f(a+1)-f(a)=2$，不合题意。因此 $0<a<1$，有 $sqrt(a)=2a$，解得 $a=1/4$。所以 $f(1/a)=f(4)=6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若函数 $e^x f(x)$（$e=2.71828 dots$ 是自然对数的底数）在 $f(x)$ 的定义域上单调递增，则称函数 $f(x)$ 具有 $M$ 性质。下列函数中具有 $M$ 性质的是#choice-placeholder()。],
  choices: ([$f(x)=2^(-x)$], [$f(x)=x^2$], [$f(x)=3^(-x)$], [$f(x)=cos x$]),
  answers: ([A],),
  explanation: [
    #step[选项 A][$e^x 2^(-x)=(e/2)^x$，底数 $e/2>1$，在 $RR$ 上递增。]
    #step[选项 B][$e^x x^2$ 的导数为 $e^x x(x+2)$，在 $(-2,0)$ 内为负，不合要求。]
    #step[选项 C][$e^x 3^(-x)=(e/3)^x$，因 $0<e/3<1$ 而递减。]
    #step[选项 D][$e^x cos x$ 的导数为 $e^x (cos x-sin x)$，在 $x=pi/2$ 附近为负，不合要求。]
  ],
)

#section[填空题：共 5 小题，每小题 5 分，共 25 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)=(2,6)$，$bold(b)=(-1,lambda)$，若 $bold(a) parallel bold(b)$，则 $lambda=$#fill-placeholder()。],
  answers: ([$-3$],),
  explanation: [由共线条件 $2lambda-6 times (-1)=0$，得 $lambda=-3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若直线 $x/a+y/b=1$（$a>0,b>0$）过点 $(1,2)$，则 $2a+b$ 的最小值为#fill-placeholder()。],
  answers: ([$8$],),
  explanation: [由 $1/a+2/b=1$，得
    $ 2a+b=(2a+b)(1/a+2/b)=4+4a/b+b/a>=4+2sqrt(4)=8. $
    等号要求 $4a/b=b/a$，结合约束得 $a=2,b=4$，故最小值为 $8$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [由一个长方体和两个 $1/4$ 圆柱体构成的几何体的三视图如图，则该几何体的体积为#fill-placeholder()。
    #figure(three-views())],
  answers: ([$2+pi/2$],),
  explanation: [长方体的长、宽、高分别为 $2,1,1$，体积为 $2$。两个 $1/4$ 圆柱体的底面半径、高均为 $1$，合计体积为 $2 times 1/4 times pi times 1^2 times 1=pi/2$。因此总体积为 $2+pi/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $f(x)$ 是定义在 $RR$ 上的偶函数，且 $f(x+4)=f(x-2)$。若当 $x in [-3,0]$ 时，$f(x)=6^(-x)$，则 $f(919)=$#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [令 $t=x-2$，得 $f(t+6)=f(t)$，故 $6$ 是 $f$ 的一个周期。由偶性，$f(919)=f(1)=f(-1)=6$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的右支与焦点为 $F$ 的抛物线 $x^2=2p y$（$p>0$）交于 $A,B$ 两点。若 $abs(A F)+abs(B F)=4abs(O F)$，则该双曲线的渐近线方程为#fill-placeholder()。],
  answers: ([$y=plus.minus sqrt(2)/2 x$],),
  explanation: [抛物线焦点为 $(0,p/2)$，准线为 $y=-p/2$。由抛物线定义得 $y_A+y_B+p=2p$，即 $y_A+y_B=p$。
    将 $x^2=2p y$ 代入双曲线，得 $a^2 y^2-2p b^2 y+a^2 b^2=0$。右支上每个 $y$ 只对应一个正的 $x$，故两交点的纵坐标为两个不同的根。由韦达定理，$y_A+y_B=2p b^2/a^2=p$，得 $a^2=2b^2$。所以渐近线为 $y=plus.minus b/a x=plus.minus sqrt(2)/2 x$。],
)

#section[解答题：共 6 小题，共 75 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 12,
  stem: [某旅游爱好者计划从 $3$ 个亚洲国家 $A_1,A_2,A_3$ 和 $3$ 个欧洲国家 $B_1,B_2,B_3$ 中选择 $2$ 个国家去旅游。],
  parts: (
    subquestion(
      stem: [若从这 $6$ 个国家中任选 $2$ 个，求这 $2$ 个国家都是亚洲国家的概率。],
      answers: ([$1/5$],),
      explanation: [共 $C_6^2=15$ 种等可能的选择，其中两个国家均在亚洲的有 $C_3^2=3$ 种，故所求概率为 $3/15=1/5$。],
    ),
    subquestion(
      stem: [若从亚洲国家和欧洲国家中各任选 $1$ 个，求这 $2$ 个国家包括 $A_1$ 但不包括 $B_1$ 的概率。],
      answers: ([$2/9$],),
      explanation: [共 $3 times 3=9$ 种等可能的选择，符合条件的只有 $(A_1,B_2)$、$(A_1,B_3)$ 两种，故概率为 $2/9$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $b=3$，$arrow(A B) dot arrow(A C)=-6$，$S_(triangle A B C)=3$，求 $A$ 和 $a$。],
  answers: ([$A=3pi/4$，$a=sqrt(29)$。],),
  explanation: [由数量积和面积公式，得 $b c cos A=-6$、$b c sin A=6$，所以 $tan A=-1$。结合 $0<A<pi$，得 $A=3pi/4$。
    由 $b=3$ 及 $b c sin A=6$，得 $c=2sqrt(2)$。再由余弦定理，$a^2=b^2+c^2-2b c cos A=9+8+12=29$，故 $a=sqrt(29)$。],
)
#question(
  "solution",
  score: 12,
  stem: [由四棱柱 $A B C D-A_1 B_1 C_1 D_1$ 截去三棱锥 $C_1-B_1 C D_1$ 后得到的几何体如图所示，四边形 $A B C D$ 为正方形，$O$ 为 $A C$ 与 $B D$ 的交点，$E$ 为 $A D$ 的中点，$A_1 E perp$ 平面 $A B C D$。
    #figure(cut-prism())],
  parts: (
    subquestion(
      stem: [证明：$A_1 O parallel$ 平面 $B_1 C D_1$。],
      answers: ([证明见解析。],),
      explanation: [取 $B_1 D_1$ 的中点 $O_1$，连接 $A_1 O_1,C O_1$。由棱柱性质，$arrow(A_1 O_1)=arrow(A O)=arrow(O C)$，故四边形 $A_1 O C O_1$ 为平行四边形，$A_1 O parallel C O_1$。
        又 $C O_1 subset$ 平面 $B_1 C D_1$，$A_1 O subset.not$ 平面 $B_1 C D_1$，所以 $A_1 O parallel$ 平面 $B_1 C D_1$。
        #figure(cut-prism(auxiliary: true))
      ],
    ),
    subquestion(
      stem: [设 $M$ 是 $O D$ 的中点，证明：平面 $A_1 E M perp$ 平面 $B_1 C D_1$。],
      answers: ([证明见解析。],),
      explanation: [在 $triangle A D O$ 中，$E,M$ 分别为 $A D,O D$ 的中点，故 $E M parallel A O$。正方形的对角线互相垂直，所以 $E M perp B D$。
        又 $A_1 E perp$ 平面 $A B C D$，故 $A_1 E perp B D$。结合 $B_1 D_1 parallel B D$，得 $B_1 D_1$ 同时垂直于平面 $A_1 E M$ 内两条相交直线 $A_1 E,E M$，所以 $B_1 D_1 perp$ 平面 $A_1 E M$。
        因 $B_1 D_1 subset$ 平面 $B_1 C D_1$，故两平面垂直。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知 ${a_n}$ 是各项均为正数的等比数列，且 $a_1+a_2=6$，$a_1 a_2=a_3$。],
  parts: (
    subquestion(
      stem: [求数列 ${a_n}$ 的通项公式。],
      answers: ([$a_n=2^n$],),
      explanation: [设公比为 $q>0$。由 $a_1^2 q=a_1 q^2$、$a_1>0$，得 $a_1=q$。于是 $q+q^2=6$，解得 $q=2$，所以 $a_n=2^n$。],
    ),
    subquestion(
      stem: [${b_n}$ 为各项非零的等差数列，其前 $n$ 项和为 $S_n$。已知 $S_(2n+1)=b_n b_(n+1)$，求数列 ${b_n/a_n}$ 的前 $n$ 项和 $T_n$。],
      answers: ([$T_n=5-(2n+5)/2^n$],),
      explanation: [由等差数列性质，$S_(2n+1)=(2n+1)b_(n+1)$。因 $b_(n+1)!=0$，可约去得到 $b_n=2n+1$，故 $T_n=sum_(k=1)^n (2k+1)/2^k$。
        错位相减得
        $ T_n-1/2 T_n=3/2+sum_(k=2)^n 2/2^k-(2n+1)/2^(n+1) $
        $ =3/2+1-1/2^(n-1)-(2n+1)/2^(n+1)=5/2-(2n+5)/2^(n+1). $
        所以 $T_n=5-(2n+5)/2^n$，且 $n=1$ 时同样成立。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知函数 $f(x)=1/3 x^3-1/2 a x^2$，$a in RR$。],
  parts: (
    subquestion(
      stem: [当 $a=2$ 时，求曲线 $y=f(x)$ 在点 $(3,f(3))$ 处的切线方程。],
      answers: ([$3x-y-9=0$],),
      explanation: [$f'(x)=x^2-a x$。当 $a=2$ 时，$f(3)=0$、$f'(3)=3$，故切线为 $y=3(x-3)$，即 $3x-y-9=0$。],
    ),
    subquestion(
      stem: [设函数 $g(x)=f(x)+(x-a)cos x-sin x$，讨论 $g(x)$ 的单调性并判断有无极值，有极值时求出极值。],
      answers: (
        [单调性见解析。$a<0$ 时，极大值为 $-a^3/6-sin a$，极小值为 $-a$；$a=0$ 时无极值；$a>0$ 时，极大值为 $-a$，极小值为 $-a^3/6-sin a$。],
      ),
      explanation: [求导得 $g'(x)=(x-a)(x-sin x)$。令 $h(x)=x-sin x$，则 $h'(x)=1-cos x>=0$，且导数为零的点仅为 $2k pi$（$k in ZZ$），故 $h$ 严格递增。由 $h(0)=0$，知 $x-sin x$ 与 $x$ 同号。
        #step[$a<0$][$g$ 在 $(-infinity,a)$、$(0,+infinity)$ 上递增，在 $(a,0)$ 上递减。故极大值为 $g(a)=-a^3/6-sin a$，极小值为 $g(0)=-a$。]
        #step[$a=0$][$g'(x)=x(x-sin x)>=0$，仅在 $x=0$ 时为零。因此 $g$ 在 $RR$ 上严格递增，无极值。]
        #step[$a>0$][$g$ 在 $(-infinity,0)$、$(a,+infinity)$ 上递增，在 $(0,a)$ 上递减。故极大值为 $g(0)=-a$，极小值为 $g(a)=-a^3/6-sin a$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [在平面直角坐标系 $x O y$ 中，已知椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的离心率为 $sqrt(2)/2$，椭圆 $C$ 截直线 $y=1$ 所得线段的长度为 $2sqrt(2)$。],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 的方程。],
      answers: ([$x^2/4+y^2/2=1$],),
      explanation: [由离心率得 $a^2=2b^2$。直线 $y=1$ 与椭圆的两个交点横坐标互为相反数，弦长为 $2sqrt(2)$，故 $a^2(1-1/b^2)=2$。解得 $a^2=4,b^2=2$，得到所求椭圆。],
    ),
    subquestion(
      stem: [动直线 $l:y=k x+m$（$m!=0$）交椭圆 $C$ 于 $A,B$ 两点，交 $y$ 轴于点 $M$。点 $N$ 是 $M$ 关于 $O$ 的对称点，圆 $N$ 的半径为 $abs(N O)$。设 $D$ 为 $A B$ 的中点，$D E,D F$ 与圆 $N$ 分别相切于点 $E,F$，求 $angle E D F$ 的最小值。
        #figure(ellipse-tangents())],
      answers: ([$pi/3$],),
      explanation: [联立直线与椭圆，得 $(1+2k^2)x^2+4k m x+2m^2-4=0$。两交点不同要求 $m^2<4k^2+2$。由韦达定理及中点坐标公式，
        $ D=((-2k m)/(1+2k^2), m/(1+2k^2)), quad N=(0,-m). $
        设圆的半径为 $r=abs(m)>0$，则
        $ (N D)^2/r^2=(4(k^4+3k^2+1))/(1+2k^2)^2=1+(8k^2+3)/(1+2k^2)^2. $
        该比值大于 $1$，故 $D$ 在圆外，两条切线存在。又
        $ 4-(N D)^2/r^2=(4k^2(3k^2+1))/(1+2k^2)^2>=0, $
        因而 $N D<=2r$，且等号当且仅当 $k=0$ 时成立。
        设 $angle E D F=2theta$，则 $0<theta<pi/2$，切线性质给出 $sin theta=r/(N D)>=1/2$。所以 $theta>=pi/6$，$angle E D F>=pi/3$。
        取 $k=0$ 且 $0<abs(m)<sqrt(2)$，满足两交点条件并使 $N D=2r$，故最小值 $pi/3$ 可以取得。
      ],
    ),
  ),
)
