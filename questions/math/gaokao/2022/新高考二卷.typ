#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校招生全国统一考试",
  name: "新高考二卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2022/2022新高考2(海南,辽宁,重庆).pdf",
  regions: ("海南", "辽宁", "重庆"),
)

#let roof-frame() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  let heights = (0, 0.5, 1.2, 2, 2.9, 2, 1.2, 0.5, 0)
  oblique-project((0.8, 0), (-0.7, 0.25), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    for y in (0, 4) {
      for x in (if y == 0 { (1, 7) } else { (1,) }) {
        line((x, y, -2.5), (x, y, 0.5))
      }
      for (x, z) in heights.enumerate() {
        if x < (if y == 0 { 8 } else { 4 }) {
          line((x, y, z), (x + 1, y, heights.at(x + 1)))
        }
      }
      for (x, z) in (if y == 0 { ((1, 0.5), (2, 1.2), (3, 2)) } else { () }) {
        line((x, y, z), (8 - x, y, z))
        line((x + 1, y, z), (x + 1, y, heights.at(x + 1)))
        if x < 3 {
          line((7 - x, y, z), (7 - x, y, heights.at(x + 1)))
        }
      }
    }
    for x in range(5) {
      line((x, 0, heights.at(x)), (x, 4, heights.at(x)))
    }
    for (x, label, prime) in (
      (4, $A$, $A'$),
      (3, $B$, $B'$),
      (2, $C$, $C'$),
      (1, $D$, $D'$),
    ) {
      content(
        if x == 3 { (3.1, 0, 1.9) } else { (x, 0, heights.at(x)) },
        label,
        anchor: if x == 4 { "south-west" } else { "north-west" },
        padding: 0.12,
      )
      content((x, 4, heights.at(x)), prime, anchor: "south-east", padding: 0.08)
    }
    content((0, 0, 0), $O$, anchor: "east", padding: 0.1)
  })
})

#let roof-section() = cetz.canvas(length: 8mm, {
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
    size: (8.8, 4),
    axis-style: "school-book",
    x-min: 0,
    x-max: 8.8,
    y-min: 0,
    y-max: 4,
    x-tick-step: none,
    y-tick-step: none,
    x-label: $x$,
    y-label: $y$,
    {
      plot.annotate(resize: false, {
        let heights = (0, 0.5, 1.2, 2, 2.9, 2, 1.2, 0.5, 0)
        line(..heights.enumerate().map(((x, y)) => (x, y)))
        for i in range(1, 5) {
          let y0 = heights.at(i - 1)
          line((i, y0), (i, heights.at(i)))
          if i < 4 {
            line((i, heights.at(i)), (8 - i, heights.at(i)))
            line((8 - i, y0), (8 - i, heights.at(i)))
          }
        }
        for (i, label, foot) in (
          (1, $D$, $D_1$),
          (2, $C$, $C_1$),
          (3, $B$, $B_1$),
          (4, $A$, $A_1$),
        ) {
          content(
            (i, heights.at(i)),
            label,
            anchor: "south-east",
            padding: 0.08,
          )
          content((i, heights.at(i - 1)), foot, anchor: "north", padding: 0.08)
        }
      })
    },
  )
})

#let volume-diagram() = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  let a = (0, 2, 0)
  let b = (2, 2, 0)
  let c = (2, 0, 0)
  let d = (0, 0, 0)
  let e = (0, 0, 2)
  let f = (2, 2, 1)
  oblique-project((1, 0), (-0.55, -0.45), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, e, a)
    line(a, f, c)
    line(e, f, b)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, e, stroke: (dash: figure-style.dash))
    line(a, c, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (e, $E$, "south-east"),
      (f, $F$, "south-west"),
    ) { content(p, label, anchor: anchor, padding: 0.1) }
  })
})

#let age-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let heights = (
      0.001,
      0.002,
      0.012,
      0.017,
      0.023,
      0.020,
      0.017,
      0.006,
      0.002,
    )
    let levels = (0.001, 0.002, 0.006, 0.012, 0.017, 0.020, 0.023)
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: [0],
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
        length: 0,
        label: (offset: 0.08),
      ),
      x: (label: (anchor: "west", offset: 0.15)),
      y: (label: (anchor: "south-west", offset: 0.1)),
    ))
    plot.plot(
      size: (9.5, 6.6),
      axis-style: "school-book",
      x-min: 0,
      x-max: 95,
      y-min: 0,
      y-max: 0.026,
      x-tick-step: none,
      x-ticks: range(10, 91, step: 10),
      y-tick-step: none,
      y-ticks: levels.map(v => (
        v,
        (if v < 0.01 { "0.00" } else { "0.0" })
          + str(int(calc.round(v * 1000))),
      )),
      x-label: [年龄（岁）],
      y-label: [频率/组距],
      {
        plot.annotate(resize: false, {
          for (i, h) in heights.enumerate() {
            line((10 * i, h), (10 * (i + 1), h))
            if i > 0 {
              line((10 * i, 0), (10 * i, calc.max(h, heights.at(i - 1))))
            }
          }
          line((90, 0), (90, heights.last()))
          for level in levels {
            let i = heights.position(h => h >= level)
            if i > 0 {
              line((0, level), (10 * i, level), stroke: (
                dash: figure-style.dash,
              ))
            }
          }
        })
      },
    )
  })
}

#let pyramid-diagram() = cetz.canvas(length: 11mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (4 * calc.sqrt(3), 0, 0)
  let c = (0, 12, 0)
  let o = (2 * calc.sqrt(3), 2, 0)
  let p = (2 * calc.sqrt(3), 2, 3)
  let e = (3 * calc.sqrt(3), 1, 1.5)
  oblique-project((0.7, 0), (-0.25, 0.25), (0, 1.4), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, p, c, a, p)
    line(a, e)
    line(c, b, stroke: (dash: figure-style.dash))
    line(c, e, o, p, stroke: (dash: figure-style.dash))
    for (v, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "east"),
      (p, $P$, "south"),
      (e, $E$, "west"),
      (o, $O$, "north"),
    ) { content(v, label, anchor: anchor, padding: 0.1) }
  })
})

#section[选择题。本大题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={-1,1,2,4}$，$B={x | |x-1|<=1}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${-1,2}$], [${1,2}$], [${1,4}$], [${-1,4}$]),
  answers: ([B],),
  explanation: [$B=[0,2]$，故 $A inter B={1,2}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$(2+2i)(1-2i)=$#choice-placeholder()。],
  choices: ([$-2+4i$], [$-2-4i$], [$6+2i$], [$6-2i$]),
  answers: ([D],),
  explanation: [原式 $=2-4i+2i-4i^2=6-2i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [图 1 是中国古代建筑中的举架结构，$A A'$、$B B'$、$C C'$、$D D'$ 是桁，相邻桁的水平距离称为步，垂直距离称为举。图 2 是某古代建筑屋顶截面的示意图，其中 $D D_1$、$C C_1$、$B B_1$、$A A_1$ 是举，$O D_1$、$D C_1$、$C B_1$、$B A_1$ 是相等的步，相邻桁的举步之比分别为 $(D D_1)/(O D_1)=0.5$，$(C C_1)/(D C_1)=k_1$，$(B B_1)/(C B_1)=k_2$，$(A A_1)/(B A_1)=k_3$。已知 $k_1,k_2,k_3$ 成公差为 0.1 的等差数列，且直线 $O A$ 的斜率为 0.725，则 $k_3=$#choice-placeholder()。
    #figure(grid(
      columns: (auto, auto),
      column-gutter: 8mm,
      align: center + bottom,
      [#roof-frame()\ 图 1], [#roof-section()\ 图 2],
    ))
  ],
  choices: ([$0.75$], [$0.8$], [$0.85$], [$0.9$]),
  answers: ([D],),
  explanation: [设每一步的长度为 $d$，则 $A$ 的横坐标为 $4d$，纵坐标为 $(0.5+k_1+k_2+k_3)d$。因此 $(0.5+3k_2)/4=0.725$，解得 $k_2=0.8$，故 $k_3=0.9$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知向量 $bold(a)=(3,4)$，$bold(b)=(1,0)$，$bold(c)=bold(a)+t bold(b)$，若 $chevron.l bold(a),bold(c) chevron.r=chevron.l bold(b),bold(c) chevron.r$，则 $t=$#choice-placeholder()。],
  choices: ([$-6$], [$-5$], [$5$], [$6$]),
  answers: ([C],),
  explanation: [$bold(c)=(3+t,4)!=bold(0)$，夹角相等可得 $(25+3t)/(5|bold(c)|)=(3+t)/(|bold(c)|)$，即 $25+3t=15+5t$，所以 $t=5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [甲、乙、丙、丁、戊 5 名同学站成一排参加文艺汇演，若甲不站在两端，丙和丁相邻，则不同排列方式共有#choice-placeholder()。],
  choices: ([12 种], [24 种], [36 种], [48 种]),
  answers: ([B],),
  explanation: [将丙、丁捆绑，内部有 2 种次序，全部排列共 $2 times 4!=48$ 种。其中甲站两端的有 $2 times 2 times 3!=24$ 种，故符合条件的有 $48-24=24$ 种。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $sin(alpha+beta)+cos(alpha+beta)=2sqrt(2)cos(alpha+pi/4)sin beta$，则#choice-placeholder()。],
  choices: (
    [$tan(alpha-beta)=1$],
    [$tan(alpha+beta)=1$],
    [$tan(alpha-beta)=-1$],
    [$tan(alpha+beta)=-1$],
  ),
  answers: ([C],),
  explanation: [右端化为 $2(cos alpha-sin alpha)sin beta$。展开左端并移项，得 $sin(alpha-beta)+cos(alpha-beta)=0$。此时 $cos(alpha-beta)!=0$，否则正弦也为 0，矛盾。因此 $tan(alpha-beta)=-1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知正三棱台的高为 1，上、下底面的边长分别为 $3sqrt(3)$ 和 $4sqrt(3)$，其顶点都在同一球面上，则该球的表面积为#choice-placeholder()。],
  choices: ([$100pi$], [$128pi$], [$144pi$], [$192pi$]),
  answers: ([A],),
  explanation: [两底面外接圆的半径分别为 3、4，球心在两圆心的连线上。令下底面圆心的高度为 0，上底面圆心的高度为 1，球心高度为 $z$，则 $4^2+z^2=3^2+(1-z)^2$，解得 $z=-3$。球半径平方为 $R^2=16+9=25$，故表面积为 $4pi R^2=100pi$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)$ 的定义域为 $RR$，且 $f(x+y)+f(x-y)=f(x)f(y)$，$f(1)=1$，则 $sum_(k=1)^22 f(k)=$#choice-placeholder()。],
  choices: ([$-3$], [$-2$], [$0$], [$1$]),
  answers: ([A],),
  explanation: [令 $x=1,y=0$，得 $f(0)=2$。再令 $y=1$，得 $f(x+1)=f(x)-f(x-1)$。由此整数点的函数值依次为 $f(1)=1$、$f(2)=-1$、$f(3)=-2$、$f(4)=-1$、$f(5)=1$、$f(6)=2$，之后每六项重复，每六项的和为 0。因此所求和为 $f(1)+f(2)+f(3)+f(4)=-3$。],
)

#section[选择题。本大题共 4 小题，每小题 5 分，共 20 分。在每小题给出的选项中，有多项符合题目要求。全部选对的得 5 分，部分选对的得 2 分，有选错的得 0 分。]
#question(
  "multiple-choice",
  score: 5,
  stem: [已知函数 $f(x)=sin(2x+phi)$（$0<phi<pi$）的图象关于点 $((2pi)/3,0)$ 中心对称，则#choice-placeholder()。],
  choices: (
    [$f(x)$ 在区间 $(0,(5pi)/12)$ 单调递减],
    [$f(x)$ 在区间 $(-pi/12,(11pi)/12)$ 有两个极值点],
    [直线 $x=(7pi)/6$ 是曲线 $y=f(x)$ 的对称轴],
    [直线 $y=sqrt(3)/2-x$ 是曲线 $y=f(x)$ 的切线],
  ),
  answers: ([AD],),
  explanation: [
    由中心对称条件，$(4pi)/3+phi=k pi$（$k in ZZ$）。结合 $0<phi<pi$，得 $phi=(2pi)/3$。
    #step[选项 A、B][
      当 $x in (0,(5pi)/12)$ 时，相位 $2x+(2pi)/3 in ((2pi)/3,(3pi)/2)$，余弦为负，故 $f'(x)<0$，A 正确。
      当 $x in (-pi/12,(11pi)/12)$ 时，相位在 $(pi/2,(5pi)/2)$ 内，其中仅有 $(3pi)/2$ 对应极值点，B 错误。
    ]
    #step[选项 C、D][
      $x=(7pi)/6$ 对应的相位为 $3pi$，不满足对称轴所需的 $pi/2+k pi$，C 错误。
      $f(0)=sqrt(3)/2$，$f'(0)=2cos((2pi)/3)=-1$，故在 $x=0$ 处的切线为 $y=sqrt(3)/2-x$，D 正确。
    ]
  ],
)
#question(
  "multiple-choice",
  score: 5,
  stem: [已知 $O$ 为坐标原点，过抛物线 $C:y^2=2p x$（$p>0$）的焦点 $F$ 的直线与 $C$ 交于 $A$、$B$ 两点，其中 $A$ 在第一象限，点 $M(p,0)$。若 $|A F|=|A M|$，则#choice-placeholder()。],
  choices: (
    [直线 $A B$ 的斜率为 $2sqrt(6)$],
    [$|O B|=|O F|$],
    [$|A B|>4|O F|$],
    [$angle O A M+angle O B M<180 degree$],
  ),
  answers: ([ACD],),
  explanation: [
    #step[求交点坐标][
      $F=(p/2,0)$，由 $|A F|=|A M|$ 知 $A$ 在 $F M$ 的垂直平分线上，得 $x_A=(3p)/4$。因 $A$ 在第一象限，$y_A=(sqrt(6)p)/2$，所以直线 $A B$ 的斜率为 $2sqrt(6)$，A 正确。
      将 $y=2sqrt(6)(x-p/2)$ 代入抛物线，得 $12x^2-13p x+3p^2=0$，另一根为 $p/3$。故 $B=(p/3,-(sqrt(6)p)/3)$。
    ]
    #step[选项 B、C][
      $|O B|=(sqrt(7)p)/3!=p/2=|O F|$，B 错误。由焦点弦性质，
      $ |A B|=|A F|+|B F|=(3p)/4+p/2+p/3+p/2=(25p)/12>2p=4|O F|, $
      C 正确。
    ]
    #step[选项 D][
      $arrow(A O) dot arrow(A M)=(21p^2)/16>0$，$arrow(B O) dot arrow(B M)=(4p^2)/9>0$，故两角均为锐角，其和小于 $180 degree$，D 正确。
    ]
  ],
)
#question(
  "multiple-choice",
  score: 5,
  stem: [如图，四边形 $A B C D$ 为正方形，$E D perp$ 平面 $A B C D$，$F B parallel E D$，$A B=E D=2F B$。记三棱锥 $E-A C D$、$F-A B C$、$F-A C E$ 的体积分别为 $V_1,V_2,V_3$，则#choice-placeholder()。
    #figure(volume-diagram())
  ],
  choices: ([$V_3=2V_2$], [$V_3=V_1$], [$V_3=V_1+V_2$], [$2V_3=3V_1$]),
  answers: ([CD],),
  explanation: [
    #step[求前两个体积][
      体积之间的比例与棱长的单位无关，不妨设 $A B=E D=2$、$F B=1$。两个底面三角形面积均为 2，故 $V_1=1/3 times 2 times 2=4/3$，$V_2=1/3 times 2 times 1=2/3$。
    ]
    #step[求第三个体积并比较][
      以 $D$ 为原点，$D C$、$D A$、$D E$ 为三个坐标轴正方向，则 $A=(0,2,0)$，$C=(2,0,0)$，$E=(0,0,2)$，$F=(2,2,1)$。
      $triangle A C E$ 是边长为 $2sqrt(2)$ 的正三角形，面积为 $2sqrt(3)$；其所在平面为 $x+y+z=2$，点 $F$ 到该平面的距离为 $(|2+2+1-2|)/sqrt(3)=sqrt(3)$。因此 $V_3=1/3 times 2sqrt(3)times sqrt(3)=2$。
      故 $V_3=V_1+V_2$、$2V_3=3V_1$，C、D 正确，A、B 错误。
    ]
  ],
)
#question(
  "multiple-choice",
  score: 5,
  stem: [若 $x,y$ 满足 $x^2+y^2-x y=1$，则#choice-placeholder()。],
  choices: ([$x+y<=1$], [$x+y>=-2$], [$x^2+y^2<=2$], [$x^2+y^2>=1$]),
  answers: ([BC],),
  explanation: [令 $u=x+y$、$v=x-y$，则条件化为 $u^2+3v^2=4$。所以 $-2<=u<=2$，B 正确；又 $x^2+y^2=(u^2+v^2)/2=2-v^2 in [2/3,2]$，C 正确。
    取 $x=y=1$，有 $x+y=2>1$，A 错误；取 $x=-y=1/sqrt(3)$，有 $x^2+y^2=2/3<1$，D 错误。
  ],
)

#section[填空题。本大题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知随机变量 $X$ 服从正态分布 $N(2,sigma^2)$，且 $P(2<X<=2.5)=0.36$，则 $P(X>2.5)=$#fill-placeholder()。],
  answers: ([$0.14$],),
  explanation: [正态分布关于均值 2 对称，故 $P(X>2)=0.5$。因此 $P(X>2.5)=0.5-0.36=0.14$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [曲线 $y=ln|x|$ 过坐标原点的两条切线的方程为#fill-placeholder()、#fill-placeholder()。],
  answers: ([$y=x/e$], [$y=-x/e$]),
  explanation: [在切点横坐标 $t!=0$ 处，导数为 $1/t$，切线方程为 $y-ln|t|=(x-t)/t$。令其过原点，得 $ln|t|=1$，即 $t=+-e$，从而两条切线为 $y=+-x/e$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设点 $A(-2,3)$、$B(0,a)$，若直线 $A B$ 关于 $y=a$ 对称的直线与圆 $(x+3)^2+(y+2)^2=1$ 有公共点，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$[1/3,3/2]$],),
  explanation: [关于 $y=a$ 对称后，$B$ 不变，$A$ 变为 $A'(-2,2a-3)$，所以对称直线为 $(a-3)x+2y-2a=0$。圆心为 $(-3,-2)$、半径为 1，有公共点等价于圆心到直线的距离不超过 1，即
    $ (|5-5a|)/sqrt((a-3)^2+4)<=1. $
    平方整理得 $6a^2-11a+3<=0$，解得 $a in [1/3,3/2]$。
  ],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知直线 $l$ 与椭圆 $x^2/6+y^2/3=1$ 在第一象限交于 $A$、$B$ 两点，$l$ 与 $x$ 轴、$y$ 轴分别交于 $M$、$N$ 两点，且 $|M A|=|N B|$，$|M N|=2sqrt(3)$，则 $l$ 的方程为#fill-placeholder()。],
  answers: ([$x+sqrt(2)y-2sqrt(2)=0$],),
  explanation: [
    #step[确定两个线段的中点相同][
      沿直线 $M N$ 取有向坐标，使 $M$、$N$ 的坐标为 0、$L=2sqrt(3)$，$A$、$B$ 的坐标为 $s,t$。由 $|s|=|t-L|$ 得 $s+t=L$ 或 $s-t=-L$。
      第一象限内的椭圆点满足 $0<x<sqrt(6)$、$0<y<sqrt(3)$，故 $|A B|<3<L$，排除第二种情况。因此 $A B$ 与 $M N$ 的中点相同。
    ]
    #step[用点差法求截距][
      设 $M=(u,0)$、$N=(0,v)$，$A=(x_1,y_1)$、$B=(x_2,y_2)$，则 $u=x_1+x_2>0$、$v=y_1+y_2>0$。两点的椭圆方程相减，得
      $ (x_1-x_2)u+2(y_1-y_2)v=0. $
      因直线斜率为 $-v/u$，有 $u^2=2v^2$。又 $u^2+v^2=|M N|^2=12$，故 $u=2sqrt(2)$、$v=2$，所求直线为 $x+sqrt(2)y-2sqrt(2)=0$。
    ]
  ],
)

#section[解答题。本大题共 6 小题，共 70 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 10,
  stem: [已知 ${a_n}$ 为等差数列，${b_n}$ 是公比为 2 的等比数列，且 $a_2-b_2=a_3-b_3=b_4-a_4$。],
  parts: (
    subquestion(
      stem: [证明：$a_1=b_1$；],
      answers: ([证明见解析。],),
      explanation: [设等差数列的公差为 $d$。由 $a_2-b_2=a_3-b_3$，得 $a_1+d-2b_1=a_1+2d-4b_1$，所以 $d=2b_1$。
        由 $a_2-b_2=b_4-a_4$，得 $2a_1+4d=10b_1$。代入 $d=2b_1$，即得 $a_1=b_1$。
      ],
    ),
    subquestion(
      stem: [求集合 ${k | b_k=a_m+a_1,1<=m<=500}$ 中元素的个数。],
      answers: ([$9$],),
      explanation: [由第（1）问，$a_m=(2m-1)b_1$、$b_k=2^(k-1)b_1$。等比数列首项 $b_1!=0$，故 $b_k=a_m+a_1$ 等价于 $2^(k-1)=2m$，即 $m=2^(k-2)$。
        因 $m,k$ 均为正整数且 $1<=m<=500$，得 $k=2,3,dots.c,10$，共有 9 个。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [记 $triangle A B C$ 的内角 $A$、$B$、$C$ 的对边分别为 $a$、$b$、$c$，分别以 $a$、$b$、$c$ 为边长的三个正三角形的面积依次为 $S_1,S_2,S_3$。已知 $S_1-S_2+S_3=sqrt(3)/2$，$sin B=1/3$。],
  parts: (
    subquestion(
      stem: [求 $triangle A B C$ 的面积；],
      answers: ([$sqrt(2)/8$],),
      explanation: [由正三角形面积公式，得 $sqrt(3)/4(a^2-b^2+c^2)=sqrt(3)/2$，所以 $a^2+c^2-b^2=2$。由余弦定理，$a c cos B=1$，故 $cos B>0$。
        结合 $sin B=1/3$ 得 $cos B=(2sqrt(2))/3$，所以 $a c=(3sqrt(2))/4$。因此 $S_(triangle A B C)=1/2 a c sin B=sqrt(2)/8$。
      ],
    ),
    subquestion(
      stem: [若 $sin A sin C=sqrt(2)/3$，求 $b$。],
      answers: ([$1/2$],),
      explanation: [由正弦定理，$(a c)/b^2=(sin A sin C)/(sin^2 B)=3sqrt(2)$。代入 $a c=(3sqrt(2))/4$，得 $b^2=1/4$，故 $b=1/2$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [在某地区进行流行病学调查，随机调查了 100 位某种疾病患者的年龄，得到如下的样本数据的频率分布直方图：
    #figure(age-chart())
  ],
  parts: (
    subquestion(
      stem: [估计该地区这种疾病患者的平均年龄（同一组中的数据用该组区间的中点值为代表）；],
      answers: ([47.9 岁],),
      explanation: [各组频率为组距 10 与相应矩形高度的乘积，依次为 $0.01,0.02,0.12,0.17,0.23,0.20,0.17,0.06,0.02$。因此平均年龄估计为
        $
          overline(x)=5 times 0.01+15 times 0.02+25 times 0.12+35 times 0.17+45 times 0.23 \
          +55 times 0.20+65 times 0.17+75 times 0.06+85 times 0.02=47.9.
        $
      ],
    ),
    subquestion(
      stem: [估计该地区一位这种疾病患者的年龄位于区间 $[20,70)$ 的概率；],
      answers: ([$0.89$],),
      explanation: [用频率估计概率，得 $0.12+0.17+0.23+0.20+0.17=0.89$。],
    ),
    subquestion(
      stem: [已知该地区这种疾病的患病率为 0.1%，该地区年龄位于区间 $[40,50)$ 的人口占该地区总人口的 16%。从该地区中任选一人，若此人的年龄位于区间 $[40,50)$，求此人患这种疾病的概率（以样本数据中患者的年龄位于各区间的频率作为患者的年龄位于该区间的概率，精确到 0.0001）。],
      answers: ([$0.0014$],),
      explanation: [记 $A$ 为“年龄位于 $[40,50)$”，$B$ 为“患这种疾病”。已知 $P(A)=0.16$，$P(B)=0.001$，由直方图估计 $P(A | B)=0.23$。所以
        $
          P(B | A)=(P(A | B)P(B))/(P(A))=(0.23 times 0.001)/0.16=0.0014375 approx 0.0014.
        $
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，$P O$ 是三棱锥 $P-A B C$ 的高，$P A=P B$，$A B perp A C$，$E$ 是 $P B$ 的中点。
    #figure(pyramid-diagram())
  ],
  parts: (
    subquestion(
      stem: [证明：$O E parallel$ 平面 $P A C$；],
      answers: ([证明见解析。],),
      explanation: [由 $P O perp$ 平面 $A B C$ 及 $P A=P B$，得 $O A=O B$。取 $B$ 关于 $O$ 的对称点 $D$，则 $O$ 是 $B D$ 的中点，且 $O A=O B=O D$，所以 $A$ 在以 $B D$ 为直径的圆上，$A B perp A D$。
        又 $A B perp A C$，故 $A$、$C$、$D$ 共线。三角形 $P B D$ 中，$O$、$E$ 分别为 $B D$、$B P$ 的中点，故 $O E parallel P D$。因 $P D subset$ 平面 $P A C$，$O E subset.not$ 平面 $P A C$，故 $O E parallel$ 平面 $P A C$。
      ],
    ),
    subquestion(
      stem: [若 $angle A B O=angle C B O=30 degree$，$P O=3$，$P A=5$，求二面角 $C-A E-B$ 的正弦值。],
      answers: ([$11/13$],),
      explanation: [
        #step[确定点的坐标][
          沿用第（1）问的点 $D$。由 $O A=sqrt(5^2-3^2)=4$，得 $B D=8$。在直角三角形 $A B D$ 中，$A D=4$、$A B=4sqrt(3)$。又 $angle A B C=60 degree$，故 $A C=A B tan 60 degree=12$。
          以 $A$ 为原点，$A B$、$A C$ 及过 $A$ 平行于 $O P$ 的射线为三个坐标轴正方向，则
          $ B=(4sqrt(3),0,0), quad C=(0,12,0), quad O=(2sqrt(3),2,0), $
          $ P=(2sqrt(3),2,3), quad E=(3sqrt(3),1,3/2). $
        ]
        #step[求法向量并计算正弦值][
          平面 $A E B$ 的法向量可取 $bold(n)=(0,-3,2)$，平面 $A E C$ 的法向量可取 $bold(m)=(sqrt(3),0,-6)$。两法向量夹角余弦的绝对值为
          $
            (|bold(n) dot bold(m)|)/(|bold(n)| |bold(m)|)=12/(sqrt(13)sqrt(39))=(4sqrt(3))/13.
          $
          因此二面角的正弦值为 $sqrt(1-48/169)=11/13$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的右焦点为 $F(2,0)$，渐近线方程为 $y=+-sqrt(3)x$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程；],
      answers: ([$x^2-y^2/3=1$],),
      explanation: [由 $a^2+b^2=4$、$b/a=sqrt(3)$，得 $a^2=1$、$b^2=3$，故双曲线为 $x^2-y^2/3=1$。],
    ),
    subquestion(
      stem: [过 $F$ 的直线与 $C$ 的两条渐近线分别交于 $A$、$B$ 两点，点 $P(x_1,y_1)$、$Q(x_2,y_2)$ 在 $C$ 上，且 $x_1>x_2>0$，$y_1>0$。过 $P$ 且斜率为 $-sqrt(3)$ 的直线与过 $Q$ 且斜率为 $sqrt(3)$ 的直线交于点 $M$。从下面①②③中选取两个作为条件，证明另外一个成立：

        ① $M$ 在 $A B$ 上；② $P Q parallel A B$；③ $|M A|=|M B|$。

        注：若选择不同的组合分别解答，则按第一个解答计分。
      ],
      answers: ([选择①②为条件，证明③，见解析。],),
      explanation: [
        #step[用渐近线方向简化坐标关系][
          选择①②为条件。令 $u=x+y/sqrt(3)$、$v=x-y/sqrt(3)$，则双曲线方程化为 $u v=1$，两条渐近线分别为 $u=0$、$v=0$。这一可逆线性变换保持直线的平行关系和线段中点。
          设 $P$、$Q$ 对应的坐标为 $(s,1/s)$、$(t,1/t)$。右支上 $x>(|y|)/sqrt(3)$，故 $s,t>0$，且 $s!=t$。过 $P$ 的指定直线为 $u=s$，过 $Q$ 的指定直线为 $v=1/t$，所以 $M$ 对应 $(s,1/t)$。
        ]
        #step[证明 $M$ 为 $A B$ 的中点][
          $P Q$ 在变换后的坐标中斜率为 $(1/s-1/t)/(s-t)=-1/(s t)$。由①②，直线 $A B$ 的方程为
          $ v-1/t=-1/(s t)(u-s), quad u/s+t v=2. $
          它与 $v=0$、$u=0$ 的交点分别为 $(2s,0)$、$(0,2/t)$，中点为 $(s,1/t)$，恰是 $M$。还原到原平面，$M$ 仍为 $A B$ 的中点，故 $|M A|=|M B|$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=x e^(a x)-e^x$。],
  parts: (
    subquestion(
      stem: [当 $a=1$ 时，讨论 $f(x)$ 的单调性；],
      answers: (
        [在 $(-infinity,0)$ 上单调递减，在 $(0,+infinity)$ 上单调递增。],
      ),
      explanation: [此时 $f(x)=(x-1)e^x$，$f'(x)=x e^x$。当 $x<0$ 时导数为负，当 $x>0$ 时导数为正，故单调区间如上。],
    ),
    subquestion(
      stem: [当 $x>0$ 时，$f(x)< -1$，求 $a$ 的取值范围；],
      answers: ([$(-infinity,1/2]$],),
      explanation: [
        #step[证明必要性][
          令 $h(x)=x e^(a x)-e^x+1$，则 $h(0)=h'(0)=0$，$h''(0)=2a-1$。若 $a>1/2$，由 $h''$ 连续知，在 0 右侧的某个小区间内 $h''(x)>0$，进而 $h'(x)>0$、$h(x)>0$，与题设矛盾。故必有 $a<=1/2$。
        ]
        #step[证明充分性][
          令 $H(x)=e^(x/2)-e^(-x/2)-x$，则 $H(0)=0$，且对 $x>0$，
          $ H'(x)=1/2(e^(x/2)+e^(-x/2))-1>0. $
          因此 $x<e^(x/2)-e^(-x/2)$，即 $x e^(x/2)<e^x-1$。当 $a<=1/2$ 时，$x e^(a x)<=x e^(x/2)<e^x-1$，满足题意。综上，$a in (-infinity,1/2]$。
        ]
      ],
    ),
    subquestion(
      stem: [设 $n in NN^*$，证明：$1/sqrt(1^2+1)+1/sqrt(2^2+2)+dots.c+1/sqrt(n^2+n)>ln(n+1)$。],
      answers: ([证明见解析。],),
      explanation: [第（2）问已证，对一切 $x>0$ 有 $x e^(x/2)<e^x-1$。令 $x=ln((k+1)/k)$（$k in NN^*$），得
        $ ln((k+1)/k)sqrt((k+1)/k)<1/k, $
        即 $ln(k+1)-ln k<1/sqrt(k(k+1))$。从 $k=1$ 到 $n$ 相加，便有
        $ sum_(k=1)^n 1/sqrt(k^2+k)>sum_(k=1)^n (ln(k+1)-ln k)=ln(n+1). $
      ],
    ),
  ),
)
