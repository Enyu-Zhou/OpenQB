#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2022/2022天津.pdf",
  regions: ("天津",),
)

#let function-choice(index) = cetz.canvas(length: 9mm, {
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
    size: (3.5, 3.3),
    axis-style: "school-book",
    x-min: -2.2,
    x-max: 2.2,
    y-min: -2.8,
    y-max: 2.8,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (1,),
    {
      for domain in ((-2.1, -1), (-1, -0.33), (0.33, 1), (1, 2.1)) {
        plot.add(
          x => {
            let y = calc.abs(x * x - 1) / x
            if index == 0 { y } else if index == 1 { -y } else if index == 2 {
              calc.abs(y)
            } else { -calc.abs(y) }
          },
          domain: domain,
          samples: 70,
          style: (stroke: (paint: black, thickness: figure-style.thickness)),
        )
      }
    },
  )
})

#let temperature-diagram() = {
  set text(size: 8pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let heights = (0.4, 1.3, 1.55, 0.6, 0.5, 0.65)
    let levels = (0.4, 0.5, 0.6, 0.65, 1.3, 1.55)
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: false,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      x: (label: (anchor: "west", offset: 0.25)),
    ))
    plot.plot(
      size: (8, 6.8),
      axis-style: "school-book",
      x-min: 13.42,
      x-break: true,
      x-max: 14.85,
      y-min: 0,
      y-max: 1.75,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: range(7).map(i => (
        13.55 + i * 0.2,
        str(calc.round(13.55 + i * 0.2, digits: 2)),
      )),
      y-ticks: levels.map(v => (
        v,
        if v == 0.6 { [#move(dy: 1.5pt)[0.60]] } else if v == 0.65 {
          [#move(dy: -1.5pt)[0.65]]
        } else { str(v) },
      )),
      x-label: [全球年平均#linebreak()气温/°C],
      y-label: [频率/组距],
      {
        plot.annotate(resize: false, {
          for (i, h) in heights.enumerate() {
            let x = 13.55 + 0.2 * i
            rect((x, 0), (x + 0.2, h), stroke: none, fill: luma(88%))
          }
          for (i, h) in heights.enumerate() {
            let x = 13.55 + 0.2 * i
            line((x, h), (x + 0.2, h))
            line(
              (x, 0),
              (x, calc.max(h, if i == 0 { 0 } else { heights.at(i - 1) })),
            )
          }
          line((14.75, 0), (14.75, heights.last()))
          for level in levels {
            let i = heights.position(h => h >= level)
            line((13.42, level), (13.55 + 0.2 * i, level), stroke: (
              dash: figure-style.dash,
            ))
          }
        })
      },
    )
  })
}

#let roof-diagram() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  let s = 3 * calc.sqrt(3)
  let a = (0, s, 0)
  let b = (0, 0, 0)
  let c = (s, 0, 0)
  let d = (s, s, 0)
  let e = (s / 2, 0, 1.5)
  let f = (s / 2, s, 1.5)
  let g = (0, s / 2, 1.5)
  let h = (s, s / 2, 1.5)
  let o = (s / 2, s / 2, 1.5)
  // 后侧斜边与前方水平屋脊的投影交点，作为虚实线分界。
  let t = 1 - (0.28 - 0.04 * 0.14 / 0.9) * s / 3
  let left-cut = (s * t / 2, s, 1.5 * t)
  let right-cut = (s * (1 - t / 2), s, 1.5 * t)
  oblique-project((0.9, 0.04), (0.14, 0.28), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(b, c, d)
    line(b, a, d, stroke: (dash: figure-style.dash))
    line(a, left-cut, stroke: (dash: figure-style.dash))
    line(d, right-cut, stroke: (dash: figure-style.dash))
    line(left-cut, f, right-cut)
    line(a, o, d, stroke: (dash: figure-style.dash))
    line(a, g, stroke: (dash: figure-style.dash))
    line(d, h)
    line(b, e, c, h)
    line(g, b)
    line(e, o, f)
    line(g, o, h)
    line(b, o, c)
    for (v, label, anchor) in (
      (a, $A$, "north-west"),
      (b, $B$, "north-east"),
      (c, $C$, "north-west"),
      (d, $D$, "west"),
      (e, $E$, "north"),
    ) {
      content(v, label, anchor: anchor, padding: 0.1)
    }
  })
})

#let prism-diagram() = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (0, 2, 0)
  let a1 = (0, 0, 2)
  let b1 = (2, 0, 2)
  let c1 = (0, 2, 2)
  let d = (1, 0, 2)
  let e = (0, 0, 1)
  let f = (0.5, 1, 1)
  oblique-project((1, -0.2), (0, 1), (0.65, 0.2), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, b1, c1, c, a)
    line(c, b)
    line(a, a1, b1, stroke: (dash: figure-style.dash))
    line(a1, c1, stroke: (dash: figure-style.dash))
    line(c, d, stroke: (dash: figure-style.dash))
    line(b, e, f, stroke: (dash: figure-style.dash))
    for (v, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "east"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south"),
      (d, $D$, "north"),
      (e, $E$, "south-east"),
      (f, $F$, "east"),
    ) { content(v, label, anchor: anchor, padding: 0.1) }
  })
})

#section[选择题]
#question(
  "single-choice",
  stem: [设全集 $U={-2,-1,0,1,2}$，集合 $A={0,1,2}$，$B={-1,2}$，则 $A inter (complement_U B)=$#choice-placeholder()。],
  choices: ([${0,1}$], [${0,1,2}$], [${-1,1,2}$], [${-1,0,1,2}$]),
  answers: ([A],),
  explanation: [$complement_U B={-2,0,1}$，∴ $A inter (complement_U B)={0,1}$。],
)
#question(
  "single-choice",
  stem: [“$x$ 为整数”是“$2x+1$ 为整数”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [若 $x$ 为整数，则 $2x+1$ 为整数；反之不成立，例如 $x=1/2$ 时 $2x+1=2$。],
)
#question(
  "single-choice",
  stem: [函数 $y=(|x^2-1|)/x$ 的图象大致为#choice-placeholder()。],
  choices: (for i in range(4) { ([#figure(function-choice(i))],) }),
  answers: ([A],),
  explanation: [定义域为 $RR without {0}$，函数为奇函数，且 $x>0$ 时 $y>=0$。当 $x in (0,1)$ 时，$y=1/x-x$ 单调递减；当 $x>1$ 时，$y=x-1/x$ 单调递增，并经过 $(1,0)$。故选 A。],
)
#question(
  "single-choice",
  stem: [将 1916 年到 2015 年的全球年平均气温（单位：°C），共 100 个数据，分成 6 组：$[13.55,13.75)$，$[13.75,13.95)$，$[13.95,14.15)$，$[14.15,14.35)$，$[14.35,14.55)$，$[14.55,14.75]$，并整理得到如下的频率分布直方图，则全球年平均气温在区间 $[14.35,14.75]$ 内的有#choice-placeholder()。
    #figure(temperature-diagram())
  ],
  choices: ([22 年], [23 年], [25 年], [35 年]),
  answers: ([B],),
  explanation: [所求频率为 $(0.50+0.65) times 0.2=0.23$，故共有 $100 times 0.23=23$ 年。],
)
#question(
  "single-choice",
  stem: [设 $a=2^0.7$，$b=(1/3)^0.7$，$c=log_2 (1/3)$，则 $a,b,c$ 的大小关系为#choice-placeholder()。],
  choices: ([$a<b<c$], [$c<a<b$], [$b<c<a$], [$c<b<a$]),
  answers: ([D],),
  explanation: [$a>1$，$0<b<1$，$c<0$，故 $c<b<a$。],
)
#question(
  "single-choice",
  stem: [化简 $(2 log_4 3+log_8 3)(log_3 2+log_9 2)=$#choice-placeholder()。],
  choices: ([$1$], [$5/4$], [$2$], [$5/2$]),
  answers: ([C],),
  explanation: [由换底公式，原式 $=(1+1/3) log_2 3 times (1+1/2) log_3 2=2$。],
)
#question(
  "single-choice",
  stem: [已知双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的左、右焦点分别为 $F_1,F_2$，抛物线 $y^2=4 sqrt(5) x$ 的准线 $l$ 经过 $F_1$，且 $l$ 与双曲线的一条渐近线交于点 $A$。若 $angle F_1 F_2 A=pi/4$，则双曲线的方程为#choice-placeholder()。],
  choices: (
    [$x^2/16-y^2/4=1$],
    [$x^2/4-y^2/16=1$],
    [$x^2/4-y^2=1$],
    [$x^2-y^2/4=1$],
  ),
  answers: ([D],),
  explanation: [抛物线准线为 $x=-sqrt(5)$，故 $c=sqrt(5)$。∵ $angle F_1 F_2 A=pi/4$，∴ $|A F_1|=|F_1 F_2|=2c$。又渐近线为 $y=plus.minus (b/a)x$，∴ $b/a=2$。由 $a^2+b^2=5$ 得 $a^2=1$，$b^2=4$。],
)
#question(
  "single-choice",
  stem: [十字歇山顶是中国古代建筑屋顶的经典样式之一，图 1 所示故宫角楼的顶部即为十字歇山顶。其上部可视为由两个相同的直三棱柱交叠而成的几何体（图 2）。这两个直三棱柱有一个公共侧面 $A B C D$。在底面 $B C E$ 中，若 $B E=C E=3$，$angle B E C=120 degree$，则该几何体的体积为#choice-placeholder()。
    #figure(grid(
      columns: (auto, auto),
      column-gutter: 12mm,
      row-gutter: 3mm,
      align: center + bottom,
      image("assets/天津卷-角楼.png", width: 35mm), roof-diagram(),
      [图 1], [图 2],
    ))
  ],
  choices: ([$27/2$], [$27 sqrt(3)/2$], [$27$], [$27 sqrt(3)$]),
  answers: ([C],),
  explanation: [
    两个相同的直三棱柱沿互相垂直的方向放置，故公共侧面为正方形。
    由余弦定理得 $B C^2=3^2+3^2-2 times 3 times 3 cos 120 degree=27$。
    等腰三角形 $B C E$ 底边上的高为 $h=sqrt(3^2-((B C)/2)^2)=3/2$。
    每个直三棱柱的体积为 $1/2 times (3 sqrt(3))^2 times 3/2=81/4$。
    两柱重叠部分是以 $A B C D$ 为底、高为 $h$ 的四棱锥，其体积为 $1/3 times 27 times 3/2=27/2$。
    ∴ 所求体积为 $2 times 81/4-27/2=27$。
  ],
)
#question(
  "single-choice",
  stem: [关于函数 $f(x)=1/2 sin 2x$，给出下列结论：
    #parbreak()
    ① $f(x)$ 的最小正周期是 $2pi$；
    #parbreak()
    ② $f(x)$ 在区间 $[-pi/4,pi/4]$ 上单调递增；
    #parbreak()
    ③ 当 $x in [-pi/6,pi/3]$ 时，$f(x)$ 的取值范围为 $[-sqrt(3)/4,sqrt(3)/4]$；
    #parbreak()
    ④ $f(x)$ 的图象可以由函数 $g(x)=1/2 sin(2x+pi/4)$ 的图象向左平移 $pi/8$ 个单位长度得到。
    #parbreak()
    其中正确结论的个数为#choice-placeholder()。
  ],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([A],),
  explanation: [① 最小正周期为 $pi$，错误。② 此时 $2x in [-pi/2,pi/2]$，正确。③ 值域为 $[-sqrt(3)/4,1/2]$，错误。④ 应向右平移 $pi/8$ 个单位长度，错误。故只有 1 个正确结论。],
)

#section[填空题]
#question(
  "fill-in",
  stem: [已知 $i$ 是虚数单位，化简 $(11-3i)/(1+2i)$ 的结果为#fill-placeholder()。],
  answers: ([$1-5i$],),
  explanation: [原式 $=((11-3i)(1-2i))/((1+2i)(1-2i))=(5-25i)/5=1-5i$。],
)
#question(
  "fill-in",
  stem: [在 $(sqrt(x)+3/x^2)^5$ 的展开式中，常数项是#fill-placeholder()。],
  answers: ([$15$],),
  explanation: [通项为 $T_(r+1)=upright(C)_5^r 3^r x^((5-5r)/2)$，$r=0,1,dots.c,5$。令指数为 0，得 $r=1$，故常数项为 $upright(C)_5^1 times 3=15$。],
)
#question(
  "fill-in",
  stem: [若直线 $x-y+m=0$（$m>0$）被圆 $(x-1)^2+(y-1)^2=3$ 截得的弦长等于 $m$，则 $m$ 的值为#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [圆心 $(1,1)$ 到直线的距离为 $m/sqrt(2)$。由半径、半弦长和弦心距组成的直角三角形，得 $(m/2)^2+(m/sqrt(2))^2=3$，又 $m>0$，故 $m=2$。],
)
#question(
  "fill-in",
  stem: [现有 52 张扑克牌（去掉大小王），每次取一张，取后不放回，则两次都抽到 A 的概率为#fill-placeholder()；在第一次抽到 A 的条件下，第二次也抽到 A 的概率为#fill-placeholder()。],
  answers: ([$1/221$], [$1/17$]),
  explanation: [两次都抽到 A 的概率为 $4/52 times 3/51=1/221$。第一次抽到 A 后，剩余 51 张中有 3 张 A，故条件概率为 $3/51=1/17$。],
)
#question(
  "fill-in",
  stem: [在 $triangle A B C$ 中，点 $D$ 为 $A C$ 的中点，点 $E$ 满足 $arrow(C B)=2 arrow(B E)$。记 $arrow(C A)=bold(a)$，$arrow(C B)=bold(b)$，用 $bold(a),bold(b)$ 表示 $arrow(D E)=$#fill-placeholder()；若 $A B perp D E$，则 $angle A C B$ 的最大值为#fill-placeholder()。],
  answers: ([$(3 bold(b)-bold(a))/2$], [$pi/6$]),
  explanation: [
    $arrow(C E)=arrow(C B)+arrow(B E)=3/2 bold(b)$，故 $arrow(D E)=3/2 bold(b)-1/2 bold(a)$。
    由 $A B perp D E$ 得 $(bold(b)-bold(a)) dot (3 bold(b)-bold(a))=0$，即
    $ |bold(a)|^2+3 |bold(b)|^2=4 bold(a) dot bold(b). $
    ∴ $cos angle A C B=(|bold(a)|^2+3 |bold(b)|^2)/(4 |bold(a)| |bold(b)|)>=sqrt(3)/2$。
    等号当且仅当 $|bold(a)|=sqrt(3)|bold(b)|$ 时成立，此时可以构成三角形，故最大值为 $pi/6$。
  ],
)
#question(
  "fill-in",
  stem: [设 $a in RR$。对任意实数 $x$，用 $f(x)$ 表示 $|x|-2$，$x^2-a x+3a-5$ 中的较小者。若函数 $f(x)$ 至少有 3 个零点，则 $a$ 的取值范围为#fill-placeholder()。],
  answers: ([$[10,+infinity)$],),
  explanation: [
    #step[确定零点可能出现的位置][
      记 $q(x)=x^2-a x+3a-5$。当 $|x|<2$ 时，$f(x)<0$；当 $|x|>2$ 时，$f(x)=0$ 当且仅当 $q(x)=0$。
      又 $q(-2)=5a-1$，$q(2)=a-1$，故 $-2$ 是零点当且仅当 $a>=1/5$，$2$ 是零点当且仅当 $a>=1$。
    ]
    #step[排除 $a<1$][
      若 $a<1/5$，两个端点均不是零点，二次函数至多提供 2 个零点。
      若 $1/5<=a<1$，则 $q(-2)>=0$，$q(2)<0$。二次函数的一根在 $[-2,2)$ 内，另一根大于 2，故 $f$ 至多有 $-2$ 和大于 2 的一个零点。
    ]
    #step[讨论 $a>=1$][
      此时 $plus.minus 2$ 均为零点。在 $x< -2$ 上，$q'(x)=2x-a<0$，且 $q(-2)>0$，无其他零点。
      要在 $x>2$ 出现零点，必须使抛物线顶点位于 2 的右侧，且最小值非正，即
      $ a/2>2, quad Delta=a^2-12a+20=(a-2)(a-10)>=0. $
      两式等价于 $a>=10$。此时 $q(2)>0$，顶点右移且最小值非正，确实至少有一根大于 2。因此所求范围为 $[10,+infinity)$。
    ]
  ],
)

#section[解答题]
#question(
  "solution",
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 所对的边分别为 $a,b,c$。已知 $a=sqrt(6)$，$b=2c$，$cos A=-1/4$。],
  parts: (
    subquestion(
      stem: [求 $c$ 的值。],
      answers: ([$c=1$],),
      explanation: [由余弦定理，$6=b^2+c^2-2b c cos A=4c^2+c^2+c^2=6c^2$。∵ $c>0$，∴ $c=1$。],
    ),
    subquestion(
      stem: [求 $sin B$ 的值。],
      answers: ([$sqrt(10)/4$],),
      explanation: [$b=2$，$sin A=sqrt(1-cos^2 A)=sqrt(15)/4$。由正弦定理，$sin B=b/a sin A=sqrt(10)/4$。],
    ),
    subquestion(
      stem: [求 $sin(2A-B)$ 的值。],
      answers: ([$sqrt(10)/8$],),
      explanation: [
        ∵ $cos A<0$，∴ $A$ 为钝角，$B$ 为锐角，故 $cos B=sqrt(1-sin^2 B)=sqrt(6)/4$。
        $sin 2A=-sqrt(15)/8$，$cos 2A=-7/8$，从而
        $
          sin(2A-B)=sin 2A cos B-cos 2A sin B=-sqrt(90)/32+7 sqrt(10)/32=sqrt(10)/8.
        $
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在直三棱柱 $A B C-A_1 B_1 C_1$ 中，$A C perp A B$，点 $D,E,F$ 分别为 $A_1 B_1$，$A A_1$，$C D$ 的中点，$A B=A C=A A_1=2$。
    #figure(prism-diagram())
  ],
  parts: (
    subquestion(
      stem: [求证：$E F parallel$ 平面 $A B C$。],
      answers: ([证明见解析。],),
    ),
    subquestion(
      stem: [求直线 $B E$ 与平面 $C C_1 D$ 所成角的正弦值。],
      answers: ([$4/5$],),
    ),
    subquestion(
      stem: [求平面 $A_1 C D$ 与平面 $C C_1 D$ 夹角的余弦值。],
      answers: ([$sqrt(10)/10$],),
    ),
  ),
  explanation: [
    以 $A$ 为原点，$arrow(A B),arrow(A C),arrow(A A_1)$ 的方向分别为 $x,y,z$ 轴正方向建立空间直角坐标系，则
    $ A=(0,0,0), quad B=(2,0,0), quad C=(0,2,0), $
    $
      A_1=(0,0,2), quad C_1=(0,2,2), quad D=(1,0,2), quad E=(0,0,1), quad F=(1/2,1,1).
    $
    #step[第（1）问][
      $arrow(E F)=(1/2,1,0)$，与平面 $A B C$ 的法向量 $(0,0,1)$ 垂直，且 $E in.not$ 平面 $A B C$，故 $E F parallel$ 平面 $A B C$。
    ]
    #step[第（2）问][
      $arrow(C C_1)=(0,0,2)$，$arrow(C D)=(1,-2,2)$，取平面 $C C_1 D$ 的法向量 $bold(n)=(2,1,0)$。
      又 $arrow(B E)=(-2,0,1)$，故所求角 $theta$ 满足
      $
        sin theta=(|arrow(B E) dot bold(n)|)/(|arrow(B E)| |bold(n)|)=4/(sqrt(5) sqrt(5))=4/5.
      $
    ]
    #step[第（3）问][
      $arrow(A_1 C)=(0,2,-2)$，$arrow(A_1 D)=(1,0,0)$，取平面 $A_1 C D$ 的法向量 $bold(m)=(0,1,1)$。
      所求夹角 $alpha$ 满足 $cos alpha=(|bold(m) dot bold(n)|)/(|bold(m)| |bold(n)|)=1/sqrt(10)=sqrt(10)/10$。
    ]
  ],
)
#question(
  "solution",
  stem: [设 ${a_n}$ 为等差数列，${b_n}$ 为等比数列，且 $a_1=b_1=a_2-b_2=a_3-b_3=1$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 和 ${b_n}$ 的通项公式。],
      answers: ([$a_n=2n-1$，$b_n=2^(n-1)$。],),
      explanation: [设公差为 $d$，公比为 $q$，则 $a_n=1+(n-1)d$，$b_n=q^(n-1)$。由题意得 $d=q$，$2d=q^2$。∵ 等比数列的公比 $q!=0$，∴ $d=q=2$。故 $a_n=2n-1$，$b_n=2^(n-1)$。],
    ),
    subquestion(
      stem: [记 ${a_n}$ 的前 $n$ 项和为 $S_n$。求证：$(S_(n+1)+a_(n+1))b_n=S_(n+1)b_(n+1)-S_n b_n$。],
      answers: ([证明见解析。],),
      explanation: [∵ $b_(n+1)=2b_n$，$S_(n+1)-S_n=a_(n+1)$，∴
        $ S_(n+1)b_(n+1)-S_n b_n=(2S_(n+1)-S_n)b_n=(S_(n+1)+a_(n+1))b_n. $
      ],
    ),
    subquestion(
      stem: [求 $sum_(k=1)^(2n) [a_(k+1)-(-1)^k a_k]b_k$。],
      answers: ([$8/9 ((3n-1)4^n+1)$],),
      explanation: [
        #step[将相邻两项合并][
          对 $j=1,2,dots.c,n$，有
          $ (a_(2j)+a_(2j-1))b_(2j-1)+(a_(2j+1)-a_(2j))b_(2j) $
          $ =(8j-4)2^(2j-2)+2 times 2^(2j-1)=8j times 4^(j-1). $
          ∴ 原式为 $8 T_n$，其中 $T_n=sum_(j=1)^n j 4^(j-1)$。
        ]
        #step[错位相减求和][
          $3T_n=4T_n-T_n=n 4^n-(1+4+dots.c+4^(n-1))=n 4^n-(4^n-1)/3$。
          故原式为 $8/9 ((3n-1)4^n+1)$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的右焦点 $F$、右顶点 $A$ 和上顶点 $B$ 满足 $(|B F|)/(|A B|)=sqrt(3)/2$。],
  parts: (
    subquestion(
      stem: [求椭圆的离心率。],
      answers: ([$sqrt(6)/3$],),
      explanation: [$|B F|=a$，$|A B|=sqrt(a^2+b^2)$，故 $a^2/(a^2+b^2)=3/4$，即 $a^2=3b^2$。∴ $e=sqrt(1-b^2/a^2)=sqrt(6)/3$。],
    ),
    subquestion(
      stem: [直线 $l$ 与椭圆有唯一公共点 $M$，与 $y$ 轴相交于点 $N$（$N$ 异于 $M$）。记 $O$ 为原点，若 $|O M|=|O N|$，且 $triangle M O N$ 的面积为 $sqrt(3)$，求椭圆的方程。],
      answers: ([$x^2/6+y^2/2=1$],),
      explanation: [
        #step[由切线与等长条件求点的坐标关系][
          设 $b^2=t>0$，则 $a^2=3t$。设切点 $M=(u,v)$，有 $u^2+3v^2=3t$。
          椭圆在 $M$ 处的切线为 $u x/(3t)+v y/t=1$。∵ 切线与 $y$ 轴相交且 $N!=M$，∴ $v!=0$，$u!=0$，且 $N=(0,t/v)$。
          由 $|O M|=|O N|$ 得 $3t-2v^2=t^2/v^2$，整理得
          $ (v^2-t)(2v^2-t)=0. $
          若 $v^2=t$，则 $u=0$，与 $N!=M$ 矛盾。因此 $v^2=t/2$，$u^2=3t/2$。
        ]
        #step[利用面积确定参数][
          $S_(triangle M O N)=1/2 |u| |O N|=1/2 sqrt(3t/2) sqrt(2t)=sqrt(3)t/2=sqrt(3)$，故 $t=2$。
          ∴ 椭圆方程为 $x^2/6+y^2/2=1$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知 $a,b in RR$，函数 $f(x)=e^x-a sin x$，$g(x)=b sqrt(x)$。],
  parts: (
    subquestion(
      stem: [求曲线 $y=f(x)$ 在点 $(0,f(0))$ 处的切线方程。],
      answers: ([$y=(1-a)x+1$],),
      explanation: [$f'(x)=e^x-a cos x$，$f'(0)=1-a$，$f(0)=1$，故切线方程为 $y=(1-a)x+1$。],
    ),
    subquestion(stem: [若曲线 $y=f(x)$ 和 $y=g(x)$ 有公共点，], parts: (
      subquestion(
        stem: [当 $a=0$ 时，求 $b$ 的取值范围。],
        answers: ([$[sqrt(2e),+infinity)$],),
        explanation: [
          $x=0$ 时两函数值分别为 1 和 0，故公共点的横坐标必大于 0。
          当 $a=0$ 时，公共点条件等价于 $b=h(x)=e^x/sqrt(x)$，$x>0$。
          $h'(x)=(e^x (2x-1))/(2x^(3/2))$，故 $h$ 在 $(0,1/2)$ 上递减，在 $(1/2,+infinity)$ 上递增，最小值为 $h(1/2)=sqrt(2e)$。
          又 $x arrow.r +infinity$ 时 $h(x) arrow.r +infinity$，故所求范围为 $[sqrt(2e),+infinity)$。
        ],
      ),
      subquestion(
        stem: [求证：$a^2+b^2>e$。],
        answers: ([证明见解析。],),
        explanation: [
          设公共点横坐标为 $x>0$，则 $e^x=a sin x+b sqrt(x)$。由柯西不等式，
          $ e^(2x)<=(a^2+b^2)(sin^2 x+x). $
          当 $0<x<=1$ 时，$sin^2 x<x^2<=x$；当 $x>1$ 时，$sin^2 x<=1<x$。故恒有 $sin^2 x<x$。
          ∴ $a^2+b^2>=e^(2x)/(sin^2 x+x)>e^(2x)/(2x)$。
          令 $H(x)=e^(2x)/(2x)$，则 $H'(x)=(e^(2x)(2x-1))/(2x^2)$，故 $H$ 在 $x=1/2$ 处取得最小值 $e$。
          因此 $a^2+b^2>e$。
        ],
      ),
    )),
  ),
)
