#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "山东卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017山东理.pdf",
  regions: ("山东",),
)
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
#let prime-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((-0.6, 0.3), (0.6, -0.3), radius: 0.15)
    content((0, 0), [开始])
    line((-1.2, -1), (1.4, -1), (1.2, -1.7), (-1.4, -1.7), close: true)
    content((0, -1.35), [输入正整数 $x$])
    rect((-0.7, -2.3), (0.7, -2.9))
    content((0, -2.6), $b=2$)
    line((0, -3.5), (1.3, -4), (0, -4.5), (-1.3, -4), close: true)
    content((0, -4), $b^2>x$)
    line((0, -5.2), (1.7, -5.7), (0, -6.2), (-1.7, -5.7), close: true)
    content((0, -5.7), [$x$ 能被 $b$ 整除])
    rect((-0.7, -6.9), (0.7, -7.5))
    content((0, -7.2), $a=0$)
    rect((2.2, -5.4), (3.6, -6))
    content((2.9, -5.7), $a=1$)
    rect((-3.6, -3.7), (-2, -4.3))
    content((-2.8, -4), $b=b+1$)
    line((-0.8, -8.2), (1, -8.2), (0.8, -8.9), (-1, -8.9), close: true)
    content((0, -8.55), [输出 $a$])
    rect((-0.6, -9.5), (0.6, -10.1), radius: 0.15)
    content((0, -9.8), [结束])
    for (u, v) in (
      ((0, -0.3), (0, -1)),
      ((0, -1.7), (0, -2.3)),
      ((0, -2.9), (0, -3.5)),
      ((0, -4.5), (0, -5.2)),
      ((0, -6.2), (0, -6.9)),
      ((0, -7.5), (0, -8.2)),
      ((0, -8.9), (0, -9.5)),
    ) { line(u, v, mark: (end: ">")) }
    line((1.3, -4), (2.9, -4), (2.9, -5.4), mark: (end: ">"))
    line((2.9, -6), (2.9, -7.85), (0, -7.85), mark: (end: ">"))
    line((-1.7, -5.7), (-2.8, -5.7), (-2.8, -4.3), mark: (end: ">"))
    line((-2.8, -3.7), (-2.8, -3.2), (0, -3.2), mark: (end: ">"))
    content((1.75, -3.8), [是])
    content((0.2, -4.85), [否], anchor: "west")
    content((-2.1, -5.5), [否])
    content((0.2, -6.55), [是], anchor: "west")
  })
}
#let cylinder-sector(auxiliary: false) = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (0, 0, 3)
  let b = (0, 0, 0)
  let c = (-1, calc.sqrt(3), 0)
  let d = (-1, calc.sqrt(3), 3)
  let e = (2, 0, 0)
  let f = (2, 0, 3)
  let g = (1, calc.sqrt(3), 3)
  let p = (0, 2, 0)
  oblique-project((-0.7, -0.35), (0.7, -0.35 / calc.sqrt(3)), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(e, f, a, d, c)
    for z in (0, 3) {
      scope({
        translate((0, 0, z))
        arc((2, 0), start: 0deg, stop: 120deg, radius: 2)
      })
    }
    for (u, v) in (
      (a, b),
      (b, c),
      (b, e),
      (a, g),
      (a, e),
      (a, c),
      (g, e),
      (g, c),
      (a, p),
      (b, p),
    ) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    if auxiliary {
      let h = (0.5, calc.sqrt(3) / 2, 3)
      line(e, h, c, e, stroke: (dash: figure-style.dash))
      content(h, $H$, anchor: "south-west", padding: 3pt)
    }
    for (pt, label, anchor) in (
      (a, $A$, "south"),
      (b, $B$, "south-east"),
      (c, $C$, "west"),
      (d, $D$, "west"),
      (e, $E$, "north-east"),
      (f, $F$, "east"),

      (p, $P$, "north"),
    ) { content(pt, label, anchor: anchor, padding: 3pt) }
    content(g, $G$, anchor: "north-west", padding: 6pt)
  })
})
#let sequence-area() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
  ))
  plot.plot(
    size: (9.5, 4.8),
    axis-style: "school-book",
    x-min: 0,
    x-max: 9.5,
    y-min: 0,
    y-max: 4.8,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((1, $x_1$), (2, $x_2$), (4, $x_3$), (8, $x_4$)),
    {
      plot.annotate(resize: false, {
        line((1, 1), (2, 2), (4, 3), (8, 4), (9, 4.125))
        for (i, x) in (1, 2, 4, 8).enumerate() {
          line((x, 0), (x, i + 1), stroke: (dash: figure-style.dash))
          circle((x, i + 1), radius: 0.04, fill: black, stroke: none)
          content((x, i + 1), $P_#(i + 1)$, anchor: "south", padding: 3pt)
        }
      })
    },
  )
})
#let tangent-circle() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
  ))
  let k = 0.3
  let slope = calc.sqrt(2) / (4 * k)
  let cx = 1 / calc.sqrt(0.5 + slope * slope)
  let cy = slope * cx
  let oc = calc.sqrt(cx * cx + cy * cy)
  let r = 2 / 3 * calc.sqrt(2 * (1 + k * k) * (1 + 8 * k * k)) / (1 + 2 * k * k)
  let mx = cx * (1 + r / oc)
  let my = cy * (1 + r / oc)
  let l2 = mx * mx + my * my
  let scale = 1 - r * r / l2
  let t = r * calc.sqrt(l2 - r * r) / l2
  let s = (scale * mx - t * my, scale * my + t * mx)
  let v = (scale * mx + t * my, scale * my - t * mx)
  let mid = calc.sqrt(3) * k / (1 + 2 * k * k)
  let delta = calc.sqrt(2 + 16 * k * k) / (2 * (1 + 2 * k * k))
  let a = (mid + delta, k * (mid + delta) - calc.sqrt(3) / 2)
  let b = (mid - delta, k * (mid - delta) - calc.sqrt(3) / 2)
  plot.plot(
    size: (5.2, 4.7),
    axis-style: "school-book",
    x-min: -1.8,
    x-max: 3.4,
    y-min: -1.3,
    y-max: 3.4,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.annotate(resize: false, {
        circle((0, 0), radius: (calc.sqrt(2), 1))
        circle((mx, my), radius: r)
        line(
          (-1.25, -1.25 * k - calc.sqrt(3) / 2),
          (3, 3 * k - calc.sqrt(3) / 2),
        )
        line(s, (0, 0), v)
        line((0, 0), (mx, my))
        circle((mx, my), radius: 0.03, fill: black, stroke: none)
        for (pt, label, anchor) in (
          (a, $A$, "north"),
          (b, $B$, "north-east"),
          ((cx - 0.28, cy - 0.18), $C$, "center"),
          ((mx, my), $M$, "south-west"),
          (s, $S$, "east"),
          (v, $T$, "west"),
          ((3, 3 * k - calc.sqrt(3) / 2), $l$, "north"),
        ) { content(pt, label, anchor: anchor, padding: 3pt) }
      })
    },
  )
})

#section[选择题：共 10 小题，每小题 5 分，共 50 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $y=sqrt(4-x^2)$ 的定义域为 $A$，函数 $y=ln(1-x)$ 的定义域为 $B$，则 $A inter B=$#choice-placeholder()。],
  choices: ([$(1,2)$], [$(1,2]$], [$(-2,1)$], [$[-2,1)$]),
  answers: ([D],),
  explanation: [$A=[-2,2]$，$B=(-infinity,1)$，故 $A inter B=[-2,1)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a in RR$，$i$ 是虚数单位，若 $z=a+sqrt(3)i$，$z dot overline(z)=4$，则 $a=$#choice-placeholder()。],
  choices: (
    [$1$ 或 $-1$],
    [$sqrt(7)$ 或 $-sqrt(7)$],
    [$-sqrt(3)$],
    [$sqrt(3)$],
  ),
  answers: ([A],),
  explanation: [$z overline(z)=a^2+3=4$，所以 $a=plus.minus 1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知命题 $p:forall x>0,ln(x+1)>0$；命题 $q$：若 $a>b$，则 $a^2>b^2$。下列命题为真命题的是#choice-placeholder()。],
  choices: ([$p and q$], [$p and not q$], [$not p and q$], [$not p and not q$]),
  answers: ([B],),
  explanation: [$x>0$ 时 $x+1>1$，故 $p$ 为真。取 $a=1,b=-2$，有 $a>b$ 而 $a^2<b^2$，故 $q$ 为假。因此 $p and not q$ 为真。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $x,y$ 满足约束条件 $cases(x-y+3<=0, 3x+y+5<=0, x+3>=0)$，则 $z=x+2y$ 的最大值是#choice-placeholder()。],
  choices: ([$0$], [$2$], [$5$], [$6$]),
  answers: ([C],),
  explanation: [由 $y<=-3x-5$、$x>=-3$，有 $z=x+2y<=-5x-10<=5$。当 $x=-3,y=4$ 时满足所有约束且取等号，故最大值为 $5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [为了研究某班学生的脚长 $x$（单位：厘米）和身高 $y$（单位：厘米）的关系，从该班随机抽取 $10$ 名学生，根据测量数据的散点图可以看出 $y$ 与 $x$ 之间有线性相关关系，设其回归直线方程为 $hat(y)=hat(b)x+hat(a)$。已知 $sum_(i=1)^10 x_i=225$，$sum_(i=1)^10 y_i=1600$，$hat(b)=4$。该班某学生的脚长为 $24$，据此估计其身高为#choice-placeholder()。],
  choices: ([$160$], [$163$], [$166$], [$170$]),
  answers: ([C],),
  explanation: [回归直线过样本中心 $(overline(x),overline(y))=(22.5,160)$，故 $hat(a)=160-4 times 22.5=70$。当 $x=24$ 时，$hat(y)=4 times 24+70=166$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行两次如图所示的程序框图，若第一次输入的 $x$ 值为 $7$，第二次输入的 $x$ 值为 $9$，则第一次、第二次输出的 $a$ 值分别为#choice-placeholder()。
    #figure(prime-chart())],
  choices: ([$0,0$], [$1,1$], [$0,1$], [$1,0$]),
  answers: ([D],),
  explanation: [输入 $7$ 时，$b=2$ 不能整除 $7$，故 $b$ 增至 $3$；此时 $b^2>7$，输出 $1$。输入 $9$ 时，$b$ 增至 $3$ 后，$b^2>9$ 不成立，而 $3$ 整除 $9$，输出 $0$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $a>b>0$，且 $a b=1$，则下列不等式成立的是#choice-placeholder()。],
  choices: (
    [$a+1/b<b/2^a<log_2(a+b)$],
    [$b/2^a<log_2(a+b)<a+1/b$],
    [$a+1/b<log_2(a+b)<b/2^a$],
    [$log_2(a+b)<a+1/b<b/2^a$],
  ),
  answers: ([B],),
  explanation: [由条件得 $a>1$、$0<b<1$，且 $a+b>2$，所以 $b/2^a<1<log_2(a+b)$。
    对 $t>=2$，函数 $t-log_2 t$ 的导数为 $1-1/(t ln 2)>0$，而 $2-log_2 2=1>0$，故 $log_2 t<t$。
    因此 $log_2(a+b)<log_2(2a)<2a=a+1/b$，选 B。],
)
#question(
  "single-choice",
  score: 5,
  stem: [从分别标有 $1,2,dots,9$ 的 $9$ 张卡片中不放回地随机抽取 $2$ 次，每次抽取 $1$ 张，则抽到的 $2$ 张卡片上的数奇偶性不同的概率是#choice-placeholder()。],
  choices: ([$5/18$], [$4/9$], [$5/9$], [$7/9$]),
  answers: ([C],),
  explanation: [奇数卡片 $5$ 张，偶数卡片 $4$ 张。所求概率为 $2 times 5 times 4/(9 times 8)=5/9$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 的对边分别为 $a,b,c$。若 $triangle A B C$ 为锐角三角形，且满足 $sin B(1+2cos C)=2sin A cos C+cos A sin C$，则下列等式成立的是#choice-placeholder()。],
  choices: ([$a=2b$], [$b=2a$], [$A=2B$], [$B=2A$]),
  answers: ([A],),
  explanation: [由 $sin B=sin(A+C)=sin A cos C+cos A sin C$，代入条件并整理得 $2sin B cos C=sin A cos C$。锐角三角形中 $cos C>0$，故 $sin A=2sin B$，由正弦定理得 $a=2b$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知当 $x in [0,1]$ 时，函数 $y=(m x-1)^2$ 的图象与 $y=sqrt(x)+m$ 的图象有且只有一个交点，则正实数 $m$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$(0,1] union [2sqrt(3),+infinity)$],
    [$(0,1] union [3,+infinity)$],
    [$(0,sqrt(2)] union [2sqrt(3),+infinity)$],
    [$(0,sqrt(2)] union [3,+infinity)$],
  ),
  answers: ([B],),
  explanation: [设 $F(x)=(m x-1)^2-sqrt(x)-m$。
    #step[$0<m<=1$][$F$ 在 $[0,1]$ 上严格递减，且 $F(0)=1-m>=0$、$F(1)=m(m-3)<0$，因此恰有一个零点。]
    #step[$m>1$][当 $0<=x<=1/m$ 时，$(m x-1)^2<=1<m+sqrt(x)$，没有交点。在 $[1/m,1]$ 上，
      $ F'(x)=2m(m x-1)-1/(2sqrt(x)), quad F''(x)=2m^2+1/(4x^(3/2))>0. $
      $F'(1/m)<0$，故 $F$ 或一直递减，或先减后增。结合 $F(1/m)<0$，恰有一个零点等价于 $F(1)=m(m-3)>=0$，即 $m>=3$。]
    综上，$m in (0,1] union [3,+infinity)$。
  ],
)
#section[填空题：共 5 小题，每小题 5 分，共 25 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知 $(1+3x)^n$ 的展开式中含有 $x^2$ 项的系数是 $54$，则 $n=$#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [由 $C_n^2 times 3^2=54$，得 $n(n-1)=12$，结合 $n$ 为正整数，解得 $n=4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $bold(e)_1,bold(e)_2$ 是互相垂直的单位向量，若 $sqrt(3)bold(e)_1-bold(e)_2$ 与 $bold(e)_1+lambda bold(e)_2$ 的夹角为 $60 degree$，则实数 $lambda$ 的值是#fill-placeholder()。],
  answers: ([$sqrt(3)/3$],),
  explanation: [由数量积及夹角公式得 $(sqrt(3)-lambda)/(2sqrt(1+lambda^2))=1/2$，即 $sqrt(3)-lambda=sqrt(1+lambda^2)$。两边平方，得 $2sqrt(3)lambda=2$，故 $lambda=sqrt(3)/3$，代回满足原等式。],
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
  stem: [在平面直角坐标系 $x O y$ 中，双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的右支与焦点为 $F$ 的抛物线 $x^2=2p y$（$p>0$）交于 $A,B$ 两点。若 $abs(A F)+abs(B F)=4abs(O F)$，则该双曲线的渐近线方程为#fill-placeholder()。],
  answers: ([$y=plus.minus sqrt(2)/2 x$],),
  explanation: [抛物线焦点为 $(0,p/2)$，准线为 $y=-p/2$。由抛物线定义得 $y_A+y_B+p=2p$，即 $y_A+y_B=p$。
    将 $x^2=2p y$ 代入双曲线，得 $a^2 y^2-2p b^2 y+a^2 b^2=0$。右支上每个 $y$ 只对应一个正的 $x$，故两交点的纵坐标为两个不同的根。由韦达定理，$y_A+y_B=2p b^2/a^2=p$，得 $a^2=2b^2$。所以渐近线为 $y=plus.minus b/a x=plus.minus sqrt(2)/2 x$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [若函数 $e^x f(x)$（$e=2.71828 dots$ 是自然对数的底数）在 $f(x)$ 的定义域上单调递增，则称函数 $f(x)$ 具有 $M$ 性质。下列函数中所有具有 $M$ 性质的函数的序号为#fill-placeholder()。
    ① $f(x)=2^(-x)$；② $f(x)=3^(-x)$；③ $f(x)=x^3$；④ $f(x)=x^2+2$。],
  answers: ([①④],),
  explanation: [①中，$e^x f(x)=(e/2)^x$，因 $e/2>1$ 而递增。
    ②中，$e^x f(x)=(e/3)^x$，因 $0<e/3<1$ 而递减。
    ③中，$(e^x x^3)'=e^x x^2(x+3)$ 在 $x< -3$ 时为负，不合要求。
    ④中，$[e^x (x^2+2)]'=e^x [(x+1)^2+1]>0$，符合要求。
    因此具有 $M$ 性质的是①④。],
)
#section[解答题：共 6 小题，共 75 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 12,
  stem: [设函数 $f(x)=sin(omega x-pi/6)+sin(omega x-pi/2)$，其中 $0<omega<3$，已知 $f(pi/6)=0$。],
  parts: (
    subquestion(
      stem: [求 $omega$。],
      answers: ([$2$],),
      explanation: [和差化积得 $f(x)=sqrt(3)sin(omega x-pi/3)$。由 $f(pi/6)=0$，有 $omega pi/6-pi/3=k pi$（$k in ZZ$），即 $omega=6k+2$。结合 $0<omega<3$，得 $omega=2$。],
    ),
    subquestion(
      stem: [将函数 $y=f(x)$ 的图象上各点的横坐标伸长为原来的 $2$ 倍（纵坐标不变），再将得到的图象向左平移 $pi/4$ 个单位，得到函数 $y=g(x)$ 的图象，求 $g(x)$ 在 $[-pi/4,3pi/4]$ 上的最小值。],
      answers: ([$-3/2$],),
      explanation: [伸长后为 $y=f(x/2)=sqrt(3)sin(x-pi/3)$，再左移得 $g(x)=sqrt(3)sin(x-pi/12)$。
        当 $x in [-pi/4,3pi/4]$ 时，$x-pi/12 in [-pi/3,2pi/3]$，正弦的最小值为 $-sqrt(3)/2$，在 $x=-pi/4$ 时取得。因此 $g$ 的最小值为 $-3/2$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，几何体是圆柱的一部分，它是由矩形 $A B C D$（及其内部）以 $A B$ 边所在直线为旋转轴旋转 $120 degree$ 得到的，$G$ 是 $overparen(D F)$ 的中点。
    #figure(cylinder-sector())],
  parts: (
    subquestion(
      stem: [设 $P$ 是 $overparen(C E)$ 上的一点，且 $A P perp B E$，求 $angle C B P$ 的大小。],
      answers: ([$30 degree$],),
      explanation: [圆柱的轴 $A B$ 垂直于底面，故 $B E perp A B$。又 $B E perp A P$，且 $A B$ 与 $A P$ 交于 $A$，故 $B E perp$ 平面 $A B P$，从而 $B E perp B P$。由于 $P$ 在 $120 degree$ 的弧 $C E$ 上，$angle C B P=angle C B E-angle P B E=120 degree-90 degree=30 degree$。],
    ),
    subquestion(
      stem: [当 $A B=3,A D=2$ 时，求二面角 $E-A G-C$ 的大小。],
      answers: ([$60 degree$],),
      explanation: [取 $A G$ 的中点 $H$，连接 $E H,C H,E C$。
        #figure(cylinder-sector(auxiliary: true))
        因 $G$ 为弧 $D F$ 的中点，$angle F A G=angle G A D=60 degree$，所以 $triangle A F G$、$triangle A G D$ 都是边长为 $2$ 的等边三角形。
        由 $E F=C D=3$ 且均垂直于上底面，得
        $ A E=G E=A C=G C=sqrt(2^2+3^2)=sqrt(13). $
        因而 $E H perp A G$、$C H perp A G$，$angle E H C$ 就是所求二面角的平面角。
        $ E H=C H=sqrt(13-1)=2sqrt(3). $
        底面中，$B E=B C=2$、$angle E B C=120 degree$，故 $E C=2sqrt(3)$。于是 $triangle E H C$ 为等边三角形，所求二面角为 $60 degree$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [在心理学研究中，常采用对比试验的方法评价不同心理暗示对人的影响，具体方法如下：将参加试验的志愿者随机分成两组，一组接受甲种心理暗示，另一组接受乙种心理暗示，通过对比这两组志愿者接受心理暗示后的结果来评价两种心理暗示的作用。现有 $6$ 名男志愿者 $A_1,A_2,A_3,A_4,A_5,A_6$ 和 $4$ 名女志愿者 $B_1,B_2,B_3,B_4$，从中随机抽取 $5$ 人接受甲种心理暗示，另 $5$ 人接受乙种心理暗示。],
  parts: (
    subquestion(
      stem: [求接受甲种心理暗示的志愿者中包含 $A_1$ 但不包含 $B_1$ 的概率。],
      answers: ([$5/18$],),
      explanation: [甲组共有 $C_10^5$ 种等可能的选法。固定选入 $A_1$、不选 $B_1$ 后，其余 $4$ 人从剩余 $8$ 人中选，有 $C_8^4$ 种。因此所求概率为 $C_8^4/C_10^5=70/252=5/18$。],
    ),
    subquestion(
      stem: [用 $X$ 表示接受乙种心理暗示的女志愿者人数，求 $X$ 的分布列与数学期望 $E X$。],
      answers: ([分布列见解析，$E X=2$。],),
      explanation: [$X$ 的可能取值为 $0,1,2,3,4$，且 $P(X=k)=(C_4^k C_6^(5-k))/C_10^5$。分布列为
        #table(
          columns: 6,
          align: center,
          [$X$], [$0$], [$1$], [$2$], [$3$], [$4$],
          [$P$], [$1/42$], [$5/21$], [$10/21$], [$5/21$], [$1/42$],
        )
        因此 $E X=0 times 1/42+1 times 5/21+2 times 10/21+3 times 5/21+4 times 1/42=2$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知 ${x_n}$ 是各项均为正数的等比数列，且 $x_1+x_2=3$，$x_3-x_2=2$。],
  parts: (
    subquestion(
      stem: [求数列 ${x_n}$ 的通项公式。],
      answers: ([$x_n=2^(n-1)$],),
      explanation: [设公比为 $q>0$。由 $x_1(1+q)=3$、$x_1 q(q-1)=2$，消去 $x_1$ 得 $3q^2-5q-2=0$，即 $(3q+1)(q-2)=0$。因此 $q=2$、$x_1=1$，从而 $x_n=2^(n-1)$。],
    ),
    subquestion(
      stem: [如图，在平面直角坐标系 $x O y$ 中，依次连接点 $P_1(x_1,1),P_2(x_2,2),dots,P_(n+1)(x_(n+1),n+1)$ 得到折线 $P_1 P_2 dots P_(n+1)$，求由该折线与直线 $y=0$、$x=x_1$、$x=x_(n+1)$ 所围成的区域的面积 $T_n$。
        #figure(sequence-area())],
      answers: ([$T_n=((2n-1)2^n+1)/2$],),
      explanation: [第 $k$ 段折线下方是两条平行边分别为 $k,k+1$、间距为 $x_(k+1)-x_k=2^(k-1)$ 的梯形，其面积为
        $ S_k=(k+k+1)/2 times 2^(k-1)=(2k+1)2^(k-2). $
        注意到
        $ S_k=(2k-1)2^(k-1)-(2k-3)2^(k-2), $
        累加消去中间项，得
        $ T_n=sum_(k=1)^n S_k=(2n-1)2^(n-1)+1/2=((2n-1)2^n+1)/2. $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知函数 $f(x)=x^2+2cos x$，$g(x)=e^x (cos x-sin x+2x-2)$，其中 $e=2.71828 dots$ 是自然对数的底数。],
  parts: (
    subquestion(
      stem: [求曲线 $y=f(x)$ 在点 $(pi,f(pi))$ 处的切线方程。],
      answers: ([$y=2pi x-pi^2-2$],),
      explanation: [$f'(x)=2x-2sin x$，故 $f'(pi)=2pi$、$f(pi)=pi^2-2$。切线方程为 $y-(pi^2-2)=2pi(x-pi)$，即 $y=2pi x-pi^2-2$。],
    ),
    subquestion(
      stem: [令 $h(x)=g(x)-a f(x)$（$a in RR$），讨论 $h(x)$ 的单调性并判断有无极值，有极值时求出极值。],
      answers: ([单调性与极值的分类结果见解析。],),
      explanation: [求导并整理得
        $ h'(x)=2(e^x-a)(x-sin x). $
        令 $u(x)=x-sin x$，则 $u'(x)=1-cos x>=0$，且导数仅在离散点 $2k pi$（$k in ZZ$）处为零，故 $u$ 严格递增。结合 $u(0)=0$，可知 $x-sin x$ 与 $x$ 同号。
        当 $a>0$ 时，记
        $ V(a)=h(ln a)=-a[(ln a)^2-2ln a+sin(ln a)+cos(ln a)+2]. $
        另有 $h(0)=-2a-1$。
        #step[$a<=0$][$e^x-a>0$，所以 $h$ 在 $(-infinity,0)$ 上递减，在 $(0,+infinity)$ 上递增。极小值为 $-2a-1$，无极大值。]
        #step[$0<a<1$][此时 $ln a<0$。$h$ 在 $(-infinity,ln a)$、$(0,+infinity)$ 上递增，在 $(ln a,0)$ 上递减。极大值为 $V(a)$，极小值为 $-2a-1$。]
        #step[$a=1$][$h'(x)=2(e^x-1)(x-sin x)>=0$，且仅在 $x=0$ 时为零。因此 $h$ 在 $RR$ 上严格递增，无极值。]
        #step[$a>1$][此时 $ln a>0$。$h$ 在 $(-infinity,0)$、$(ln a,+infinity)$ 上递增，在 $(0,ln a)$ 上递减。极大值为 $-2a-1$，极小值为 $V(a)$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [在平面直角坐标系 $x O y$ 中，椭圆 $E:x^2/a^2+y^2/b^2=1$（$a>b>0$）的离心率为 $sqrt(2)/2$，焦距为 $2$。],
  parts: (
    subquestion(
      stem: [求椭圆 $E$ 的方程。],
      answers: ([$x^2/2+y^2=1$],),
      explanation: [由 $2c=2$ 得 $c=1$，由 $c/a=sqrt(2)/2$ 得 $a=sqrt(2)$，再由 $b^2=a^2-c^2$ 得 $b^2=1$。所以椭圆为 $x^2/2+y^2=1$。],
    ),
    subquestion(
      stem: [如图，直线 $l:y=k_1 x-sqrt(3)/2$ 交椭圆 $E$ 于 $A,B$ 两点，$C$ 是椭圆 $E$ 上的一点，直线 $O C$ 的斜率为 $k_2$，且 $k_1 k_2=sqrt(2)/4$。$M$ 是线段 $O C$ 延长线上一点，且 $abs(M C):abs(A B)=2:3$，$⊙M$ 的半径为 $abs(M C)$，$O S,O T$ 是 $⊙M$ 的两条切线，切点分别为 $S,T$。求 $angle S O T$ 的最大值，并求取得最大值时直线 $l$ 的斜率。
        #figure(tangent-circle())],
      answers: (
        [$angle S O T$ 的最大值为 $pi/3$，此时 $k_1=plus.minus sqrt(2)/2$。],
      ),
      explanation: [
        #step[计算弦长与半径][记 $u=k_1^2>0$。将直线方程代入椭圆，得
          $ (4u+2)x^2-4sqrt(3)k_1 x-1=0. $
          判别式为 $8(8u+1)>0$，故直线始终与椭圆有两个不同的交点。由韦达定理，
          $ x_A+x_B=(2sqrt(3)k_1)/(2u+1), quad x_A x_B=-1/(2(2u+1)), $
          $ abs(A B)^2=(1+u)[(x_A+x_B)^2-4x_A x_B]=(2(1+u)(1+8u))/(1+2u)^2. $
          圆的半径 $r=abs(M C)=2/3 abs(A B)$，故
          $ r^2=(8(1+u)(1+8u))/(9(1+2u)^2). $
        ]
        #step[计算圆心到原点的距离][由 $k_2^2=1/(8u)$ 及 $y_C=k_2 x_C$，得
          $ abs(O C)^2=(1+k_2^2)/(1/2+k_2^2)=(1+8u)/(1+4u). $
          因此
          $ abs(O C)^2/r^2=(9(1+2u)^2)/(8(1+4u)(1+u)), $
          $ abs(O C)^2/r^2-1=(2u-1)^2/(8(1+4u)(1+u))>=0. $
          故 $abs(O C)>=r$，等号当且仅当 $u=1/2$ 时成立。又 $O,C,M$ 依次共线，$abs(O M)=abs(O C)+r>=2r$。
        ]
        #step[求切线夹角][设 $angle S O T=2theta$，其中 $0<theta<pi/2$。由切线性质，
          $ sin theta=r/abs(O M)<=1/2. $
          所以 $angle S O T<=pi/3$。当且仅当 $u=1/2$，即 $k_1=plus.minus sqrt(2)/2$ 时取等号；这些斜率均满足题设相交条件，故最大值为 $pi/3$。
        ]
      ],
    ),
  ),
)
