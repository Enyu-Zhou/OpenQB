#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2021/2021天津.pdf",
  regions: ("天津",),
)

#let function-choice(index) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: move(dx: 2pt)[$O$],
    x: (
      tick: (
        label: (anchor: if index < 2 { "north-west" } else { "north-east" }),
      ),
    ),
    y: (tick: (label: (offset: 0.5))),
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (4, 3.2),
    axis-style: "school-book",
    x-min: -4.5,
    x-max: 4.5,
    y-min: -0.2,
    y-max: 0.18,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (1,),
    y-ticks: ((0.15, [0.15]),),
    {
      for domain in ((-4.3, -0.65), (0.65, 4.3)) {
        plot.add(
          x => {
            let y = calc.ln(calc.abs(x)) / (x * x + 2)
            if index == 0 { if x < 0 { -y } else { y } } else if index == 1 {
              y
            } else if index == 2 { if x < 0 { y } else { -y } } else { -y }
          },
          domain: domain,
          samples: 100,
          style: (stroke: (paint: black, thickness: figure-style.thickness)),
        )
      }
    },
  )
})

#let score-histogram() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let heights = (0.035, 0.02, 0.03, 0.04, 0.05, 0.025, 0.03, 0.02)
    let levels = (0.02, 0.025, 0.03, 0.035, 0.04, 0.045, 0.05)
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: $0$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      x: (label: (anchor: "west", offset: 0.18)),
    ))
    plot.plot(
      size: (8, 5.2),
      axis-style: "school-book",
      x-min: 62,
      x-max: 101,
      x-break: true,
      y-min: 0,
      y-max: 0.057,
      x-label: [评分],
      y-label: [$"频率"/"组距"$],
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: range(66, 99, step: 4),
      y-ticks: levels.zip((
        "0.020",
        "0.025",
        "0.030",
        "0.035",
        "0.040",
        "0.045",
        "0.050",
      )),
      {
        plot.annotate(resize: false, {
          for (i, h) in heights.enumerate() {
            let x = 66 + 4 * i
            line((x, h), (x + 4, h))
            line(
              (x, 0),
              (x, calc.max(h, if i == 0 { 0 } else { heights.at(i - 1) })),
            )
          }
          line((98, 0), (98, heights.last()))
          for level in levels.filter(v => v != 0.045) {
            let i = heights.position(h => h >= level)
            line((62, level), (66 + 4 * i, level), stroke: (
              dash: figure-style.dash,
            ))
          }
        })
      },
    )
  })
}

#let cube-diagram() = cetz.canvas(length: 16mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (2, 2, 0)
  let d = (0, 2, 0)
  let a1 = (0, 0, 2)
  let b1 = (2, 0, 2)
  let c1 = (2, 2, 2)
  let d1 = (0, 2, 2)
  let e = (2, 1, 0)
  let f = (1, 2, 0)
  oblique-project((-0.35, -0.35), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(b, c, d, d1, a1, b1, b)
    line(b1, c1, d1)
    line(c, c1)
    line(b, a, d, stroke: (dash: figure-style.dash))
    line(a, a1, stroke: (dash: figure-style.dash))
    line(a1, c1, e)
    line(a1, e, stroke: (dash: figure-style.dash))
    line(a, c1, stroke: (dash: figure-style.dash))
    line(d1, f)
    for (p, label, anchor) in (
      (a, $A$, "south-east"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (a1, $A_1$, "south"),
      (b1, $B_1$, "east"),
      (c1, $C_1$, "west"),
      (d1, $D_1$, "south"),
      (e, $E$, "north"),
      (f, $F$, "north-west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#let triangle-diagram() = cetz.canvas(length: 45mm, {
  import cetz.draw: *
  let a = (0.5, calc.sqrt(3) / 2)
  let b = (0, 0)
  let c = (1, 0)
  let d = (0.6, 0)
  let e = (0.15, 0.15 * calc.sqrt(3))
  let f = (0.8, 0.2 * calc.sqrt(3))
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  line(a, b, c, close: true)
  line(e, d, f)
  line(a, d, stroke: (dash: figure-style.dash))
  for (p, label, anchor) in (
    (a, $A$, "south"),
    (b, $B$, "north-east"),
    (c, $C$, "north-west"),
    (d, $D$, "north"),
    (e, $E$, "east"),
    (f, $F$, "west"),
  ) { content(p, label, anchor: anchor, padding: 3pt) }
})

#section[单项选择题]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={-1,0,1},B={1,3,5},C={0,2,4}$，则 $(A inter B) union C=$#choice-placeholder()。],
  choices: ([$\{0\}$], [$\{0,1,3,5\}$], [$\{0,1,2,4\}$], [$\{0,2,3,4\}$]),
  answers: ([C],),
  explanation: [$A inter B={1}$，故 $(A inter B) union C={0,1,2,4}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a in RR$，则“$a>6$”是“$a^2>36$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [$a>6 arrow a^2>36$，但 $a^2>36$ 还允许 $a< -6$，不能推出 $a>6$，故为充分不必要条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $f(x)=(ln |x|)/(x^2+2)$ 的图象大致为#choice-placeholder()。],
  choices: (
    [#figure(function-choice(0))],
    [#figure(function-choice(1))],
    [#figure(function-choice(2))],
    [#figure(function-choice(3))],
  ),
  answers: ([B],),
  explanation: [定义域为 $RR without {0}$，且 $f(-x)=f(x)$，故图象关于 $y$ 轴对称，排除 A、C。
    当 $0<x<1$ 时，$ln x<0$，故 $f(x)<0$，排除 D，选 B。],
)
#question(
  "single-choice",
  score: 5,
  stem: [从某网络平台推荐的影视作品中抽取 $400$ 部，统计其评分数据，将所得 $400$ 个评分数据分为 $8$ 组：$[66,70),[70,74),dots,[94,98]$，并整理得到如下的频率分布直方图，则评分在区间 $[82,86)$ 内的影视作品数量是#choice-placeholder()。
    #figure(score-histogram())],
  choices: ([$20$], [$40$], [$64$], [$80$]),
  answers: ([D],),
  explanation: [区间 $[82,86)$ 对应矩形的高为 $0.050$，组距为 $4$，故频率为 $0.050 times 4=0.2$，数量为 $400 times 0.2=80$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $a=log_2 0.3,b=log_(1/2) 0.4,c=0.4^0.3$，则三者大小关系为#choice-placeholder()。],
  choices: ([$a<b<c$], [$c<a<b$], [$b<c<a$], [$a<c<b$]),
  answers: ([D],),
  explanation: [$a<log_2 1=0$，$b>log_(1/2)(1/2)=1$，而 $0<c<1$，故 $a<c<b$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [两个圆锥的底面是一个球的同一截面，顶点均在球面上，若球的体积为 $(32pi)/3$，两个圆锥的高之比为 $1:3$，则这两个圆锥的体积之和为#choice-placeholder()。],
  choices: ([$3pi$], [$4pi$], [$9pi$], [$12pi$]),
  answers: ([B],),
  explanation: [由 $4/3 pi R^3=(32pi)/3$，得球半径 $R=2$。两个圆锥的高之和为球的直径 $4$，且比为 $1:3$，所以高分别为 $1,3$。
    截面圆心到球心的距离为 $1$，故底面半径平方 $r^2=2^2-1^2=3$。
    $ V_1+V_2=1/3 pi r^2(1+3)=4pi. $],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $2^a=5^b=10$，则 $1/a+1/b=$#choice-placeholder()。],
  choices: ([$-1$], [$lg 7$], [$1$], [$log_7 10$]),
  answers: ([C],),
  explanation: [两边取常用对数，得 $a lg 2=b lg 5=1$，故 $1/a+1/b=lg 2+lg 5=lg 10=1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的右焦点与抛物线 $y^2=2p x$（$p>0$）的焦点重合，抛物线的准线交双曲线于 $A,B$ 两点，交双曲线的渐近线于 $C,D$ 两点。若 $|C D|=sqrt(2)|A B|$，则双曲线的离心率为#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$sqrt(3)$], [$2$], [$3$]),
  answers: ([A],),
  explanation: [设公共焦点为 $(c,0)$，则抛物线的准线为 $x=-c$，且 $c^2=a^2+b^2$。
    在双曲线方程中令 $x=-c$，得 $y=plus.minus b^2/a$，故 $|A B|=(2b^2)/a$。
    在渐近线 $y=plus.minus (b/a)x$ 中令 $x=-c$，得 $|C D|=(2b c)/a$。
    由已知条件得 $c=sqrt(2)b$，从而 $a^2=c^2-b^2=c^2/2$，故 $e=c/a=sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $a in RR$，函数 $f(x)=cases(cos(2pi x-2pi a) & quad x<a, x^2-2(a+1)x+a^2+5 & quad x>=a)$，若函数 $f(x)$ 在区间 $(0,+infinity)$ 内恰有 $6$ 个零点，则 $a$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$(2,9/4] union (5/2,11/4]$],
    [$(7/4,2] union (5/2,11/4]$],
    [$(2,9/4] union [11/4,3)$],
    [$(7/4,2) union [11/4,3)$],
  ),
  answers: ([A],),
  explanation: [若 $a<=0$，正半轴上只有二次函数这一段，至多有两个零点，不符合题意。以下设 $a>0$。
    #step[余弦段的零点个数][在 $0<x<a$ 内，零点依次为
      $ x=a-(2j-1)/4,quad j=1,2,dots,quad (2j-1)/4<a. $
      因此有 $4$ 个零点当且仅当 $7/4<a<=9/4$；有 $5$ 个零点当且仅当 $9/4<a<=11/4$；有 $6$ 个零点当且仅当 $11/4<a<=13/4$。]
    #step[二次函数段的零点个数][二次式为 $(x-a-1)^2+4-2a$。在 $x>=a$ 上，零点个数为
      $ cases(0 & quad a<2, 1 & quad a=2, 2 & quad 2<a<=5/2, 1 & quad a>5/2). $
      其中 $a>2$ 时两根为 $a+1 plus.minus sqrt(2a-4)$，较小根在 $x>=a$ 内当且仅当 $a<=5/2$。]
    #step[合并计数][总数为 $6$ 只能由“$4+2$”“$5+1$”或“$6+0$”组成。
      “$4+2$”给出 $2<a<=9/4$；“$5+1$”给出 $5/2<a<=11/4$；“$6+0$”不可能。
      故所求范围为 $(2,9/4] union (5/2,11/4]$。]
  ],
)

#section[填空题]
#question(
  "fill-in",
  score: 5,
  stem: [$i$ 是虚数单位，复数 $(9+2i)/(2+i)=$#fill-placeholder()。],
  answers: ([$4-i$],),
  explanation: [$(9+2i)/(2+i)=((9+2i)(2-i))/((2+i)(2-i))=(20-5i)/5=4-i$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $(2x^3+1/x)^6$ 的展开式中，$x^6$ 的系数是#fill-placeholder()。],
  answers: ([$160$],),
  explanation: [通项为 $binom(6, r)2^(6-r)x^(18-4r)$。令 $18-4r=6$，得 $r=3$，故所求系数为 $binom(6, 3)2^3=160$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若斜率为 $sqrt(3)$ 的直线与 $y$ 轴交于点 $A$，与圆 $x^2+(y-1)^2=1$ 相切于点 $B$，则 $|A B|=$#fill-placeholder()。],
  answers: ([$sqrt(3)$],),
  explanation: [设切线为 $y=sqrt(3)x+t$，圆心为 $C(0,1)$，半径为 $1$。
    相切给出 $frac(|t-1|, sqrt(3+1))=1$，故 $|A C|=|t-1|=2$。
    ∵ $C B perp A B$，∴ $|A B|=sqrt(|A C|^2-|C B|^2)=sqrt(3)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $a>0,b>0$，则 $1/a+a/b^2+b$ 的最小值为#fill-placeholder()。],
  answers: ([$2sqrt(2)$],),
  explanation: [由基本不等式，
    $ 1/a+a/b^2+b>=2sqrt(1/a dot a/b^2)+b=2/b+b>=2sqrt(2). $
    两次等号同时成立当且仅当 $1/a=a/b^2$ 且 $2/b=b$，即 $a=b=sqrt(2)$，故最小值为 $2sqrt(2)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [甲、乙两人在每次猜谜活动中各猜一个谜语，若一方猜对且另一方猜错，则猜对的一方获胜，否则本次平局。已知每次活动中，甲、乙猜对的概率分别为 $5/6$ 和 $1/5$，且每次活动中甲、乙猜对与否互不影响，各次活动也互不影响，则一次活动中，甲获胜的概率为#fill-placeholder()；$3$ 次活动中，甲至少获胜 $2$ 次的概率为#fill-placeholder()。],
  answers: ([$2/3$], [$20/27$]),
  explanation: [一次活动中，甲获胜的概率为 $p=5/6 times (1-1/5)=2/3$。
    三次活动相互独立，甲至少获胜两次的概率为
    $ binom(3, 2)p^2(1-p)+p^3=3 times (2/3)^2 times 1/3+(2/3)^3=20/27. $],
)
#question(
  "fill-in",
  score: 5,
  stem: [在边长为 $1$ 的等边三角形 $A B C$ 中，$D$ 为线段 $B C$ 上的动点，$D E perp A B$ 且交 $A B$ 于点 $E$，$D F parallel A B$ 且交 $A C$ 于点 $F$，则 $|2arrow(B E)+arrow(D F)|$ 的值为#fill-placeholder()；$(arrow(D E)+arrow(D F)) dot arrow(D A)$ 的最小值为#fill-placeholder()。],
  answers: ([$1$], [$11/20$]),
  explanation: [设 $B E=t in [0,1/2]$，则 $B D=2t,D E=sqrt(3)t,D F=D C=1-2t,E A=1-t$。
    #figure(triangle-diagram())
    #step[求向量和的模][$arrow(B E),arrow(D F)$ 均沿 $B A$ 方向，故
      $ |2arrow(B E)+arrow(D F)|=2t+(1-2t)=1. $]
    #step[求数量积的最小值][∵ $arrow(D A)=arrow(D E)+arrow(E A)$，且 $D E perp D F,D E perp E A$，故
      $
        (arrow(D E)+arrow(D F)) dot arrow(D A)
        =D E^2+arrow(D F) dot arrow(E A)
        =3t^2+(1-2t)(1-t)
        =5(t-3/10)^2+11/20.
      $
      当 $t=3/10$ 时取最小值 $11/20$。]
  ],
)

#section[解答题]
#question(
  "solution",
  score: 14,
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 对边分别为 $a,b,c$，且 $sin A:sin B:sin C=2:1:sqrt(2)$，$b=sqrt(2)$。],
  parts: (
    subquestion(
      stem: [求 $a$ 的值；],
      answers: ([$2sqrt(2)$。],),
      explanation: [由正弦定理，$a:b:c=sin A:sin B:sin C=2:1:sqrt(2)$，故 $a=2b=2sqrt(2)$，$c=sqrt(2)b=2$。],
    ),
    subquestion(
      stem: [求 $cos C$ 的值；],
      answers: ([$3/4$。],),
      explanation: [由余弦定理，$cos C=(a^2+b^2-c^2)/(2a b)=(8+2-4)/(2 times 2sqrt(2) times sqrt(2))=3/4$。],
    ),
    subquestion(
      stem: [求 $sin(2C-pi/6)$ 的值。],
      answers: ([$(3sqrt(21)-1)/16$。],),
      explanation: [∵ $0<C<pi$，故 $sin C=sqrt(1-(3/4)^2)=sqrt(7)/4$。
        $ sin 2C=2sin C cos C=(3sqrt(7))/8,quad cos 2C=2cos^2 C-1=1/8. $
        ∴
        $
          sin(2C-pi/6)=sin 2C cos(pi/6)-cos 2C sin(pi/6)
          =(3sqrt(7))/8 times sqrt(3)/2-1/8 times 1/2=(3sqrt(21)-1)/16.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，在棱长为 $2$ 的正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$E,F$ 分别为棱 $B C,C D$ 的中点。
    #figure(cube-diagram())],
  parts: (
    subquestion(
      stem: [求证：$D_1 F parallel$ 平面 $A_1 E C_1$；],
      answers: ([证明见解析。],),
      explanation: [以 $A$ 为原点，$A B,A D,A A_1$ 的方向为三个坐标轴正向，则
        $ A_1=(0,0,2),C_1=(2,2,2),D_1=(0,2,2),E=(2,1,0),F=(1,2,0). $
        $ arrow(A_1 C_1)=(2,2,0),quad arrow(A_1 E)=(2,1,-2). $
        平面 $A_1 E C_1$ 的一个法向量为 $bold(n)=(2,-2,1)$，平面方程为 $2x-2y+z-2=0$。
        又 $arrow(D_1 F)=(1,0,-2)$，有 $arrow(D_1 F) dot bold(n)=0$，且 $D_1$ 不在此平面内，故 $D_1 F parallel$ 平面 $A_1 E C_1$。],
    ),
    subquestion(
      stem: [求直线 $A C_1$ 与平面 $A_1 E C_1$ 所成角的正弦值；],
      answers: ([$sqrt(3)/9$。],),
      explanation: [沿用上一问的坐标系，$arrow(A C_1)=(2,2,2)$。设所成角为 $theta$，则
        $
          sin theta=abs(arrow(A C_1) dot bold(n))/(|arrow(A C_1)| |bold(n)|)=2/(2sqrt(3) times 3)=sqrt(3)/9.
        $],
    ),
    subquestion(
      stem: [求二面角 $A-A_1 C_1-E$ 的正弦值。],
      answers: ([$1/3$。],),
      explanation: [平面 $A A_1 C_1$ 的一个法向量为 $bold(m)=(1,-1,0)$。设两法向量夹角为 $alpha$，则
        $
          cos alpha=(bold(m) dot bold(n))/(|bold(m)| |bold(n)|)=4/(sqrt(2) times 3)=(2sqrt(2))/3.
        $
        二面角与两法向量夹角相等或互补，正弦相同，故所求正弦值为 $sqrt(1-((2sqrt(2))/3)^2)=1/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的右焦点为 $F$，上顶点为 $B$，离心率为 $(2sqrt(5))/5$，且 $|B F|=sqrt(5)$。],
  parts: (
    subquestion(
      stem: [求椭圆的方程；],
      answers: ([$x^2/5+y^2=1$。],),
      explanation: [设焦距的一半为 $c$，则 $|B F|=sqrt(b^2+c^2)=a=sqrt(5)$，故 $c=e a=2$，$b^2=a^2-c^2=1$。
        ∴ 椭圆方程为 $x^2/5+y^2=1$。],
    ),
    subquestion(
      stem: [直线 $l$ 与椭圆有唯一的公共点 $M$，与 $y$ 轴的正半轴交于点 $N$。过 $N$ 与 $B F$ 垂直的直线交 $x$ 轴于点 $P$。若 $M P parallel B F$，求直线 $l$ 的方程。],
      answers: ([$x-y+sqrt(6)=0$。],),
      explanation: [直线 $l$ 与 $y$ 轴相交且不重合，故可设 $l:y=k x+d$，其中 $d>0$。
        #step[由相切求切点][与椭圆联立，得
          $ (1+5k^2)x^2+10k d x+5d^2-5=0. $
          仅有一个公共点，故 $Delta=20(1+5k^2-d^2)=0$，即 $d^2=1+5k^2$。
          二次方程的重根为 $x_M=-(5k d)/(1+5k^2)=-(5k)/d$，从而
          $ M=(-(5k)/d,1/d),quad N=(0,d). $]
        #step[利用垂直、平行条件][由 $B(0,1),F(2,0)$，得 $k_(B F)=-1/2$。所以 $N P$ 的方程为 $y=2x+d$，$P=(-d/2,0)$。
          ∵ $M P parallel B F$，而 $(1,2)$ 垂直于 $B F$，故
          $
            (-(5k)/d+d/2,1/d) dot (1,2)=0,
            quad d^2=10k-4.
          $
          结合 $d^2=1+5k^2$，得 $5(k-1)^2=0$，故 $k=1,d=sqrt(6)$。
          ∴ $l:x-y+sqrt(6)=0$，代回满足各条件。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知 $\{a_n\}$ 是公差为 $2$ 的等差数列，其前 $8$ 项的和为 $64$。$\{b_n\}$ 是公比大于 $0$ 的等比数列，$b_1=4,b_3-b_2=48$。],
  parts: (
    subquestion(
      stem: [求 $\{a_n\}$ 和 $\{b_n\}$ 的通项公式；],
      answers: ([$a_n=2n-1,b_n=4^n$（$n in NN^*$）。],),
      explanation: [由 $8a_1+(8 times 7)/2 times 2=64$，得 $a_1=1$，故 $a_n=2n-1$。
        设等比数列公比为 $q>0$，则 $4q^2-4q=48$，即 $(q-4)(q+3)=0$，故 $q=4$，$b_n=4^n$。],
    ),
    subquestion(
      stem: [记 $c_n=b_(2n)+1/b_n$，$n in NN^*$。],
      parts: (
        subquestion(
          stem: [证明：$\{c_n^2-c_(2n)\}$ 是等比数列；],
          answers: ([证明见解析，首项为 $8$，公比为 $4$。],),
          explanation: [$c_n=4^(2n)+4^(-n)$，所以
            $ c_n^2-c_(2n)=(4^(2n)+4^(-n))^2-(4^(4n)+4^(-2n))=2 times 4^n. $
            ∴ $\{c_n^2-c_(2n)\}$ 是首项为 $8$，公比为 $4$ 的等比数列。],
        ),
        subquestion(
          stem: [证明：$sum_(k=1)^n sqrt((a_k a_(k+1))/(c_k^2-c_(2k)))<2sqrt(2)$（$n in NN^*$）。],
          answers: ([证明见解析。],),
          explanation: [由前面结论，对任意正整数 $k$，
            $
              sqrt((a_k a_(k+1))/(c_k^2-c_(2k)))=sqrt((4k^2-1)/(2 times 4^k))<(sqrt(2)k)/2^k.
            $
            记 $T_n=sum_(k=1)^n k/2^k$，由错位相减，
            $ T_n-1/2 T_n=sum_(k=1)^n 1/2^k-n/2^(n+1)=1-1/2^n-n/2^(n+1), $
            故 $T_n=2-(n+2)/2^n<2$。因此
            $
              sum_(k=1)^n sqrt((a_k a_(k+1))/(c_k^2-c_(2k)))<sqrt(2)T_n<2sqrt(2).
            $],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知 $a>0$，函数 $f(x)=a x-x e^x$。],
  parts: (
    subquestion(
      stem: [求曲线 $y=f(x)$ 在点 $(0,f(0))$ 处的切线方程；],
      answers: ([$y=(a-1)x$。],),
      explanation: [$f(0)=0$，$f'(x)=a-(x+1)e^x$，故 $f'(0)=a-1$，所求切线为 $y=(a-1)x$。],
    ),
    subquestion(
      stem: [证明 $f(x)$ 存在唯一的极值点；],
      answers: ([证明见解析。],),
      explanation: [令 $g(x)=(x+1)e^x$，则 $f'(x)=a-g(x)$。
        当 $x<=-1$ 时，$g(x)<=0<a$，所以 $f'(x)>0$。
        当 $x>-1$ 时，$g'(x)=(x+2)e^x>0$，且 $g(-1)=0$，$lim_(x arrow +infinity)g(x)=+infinity$。
        因此存在唯一的 $t>-1$，使 $g(t)=a$。
        当 $x<t$ 时 $f'(x)>0$，当 $x>t$ 时 $f'(x)<0$，故 $f$ 先增后减，$x=t$ 是唯一的极值点，也是全局最大值点。],
    ),
    subquestion(
      stem: [若存在 $a$，使得 $f(x)<=a+b$ 对任意 $x in RR$ 成立，求实数 $b$ 的取值范围。],
      answers: ([$[-e,+infinity)$。],),
      explanation: [#step[必要性][令 $x=1$，则 $f(1)=a-e<=a+b$，故 $b>=-e$。]
        #step[充分性][任取 $b>=-e$，选择 $a=2e>0$。此时 $(1+1)e^1=a$，由上一问，$f$ 在 $x=1$ 处取得全局最大值 $f(1)=e$。
          因此对一切 $x in RR$，均有 $f(x)<=e=2e-e<=a+b$。
          综上，所求范围为 $[-e,+infinity)$。]
      ],
    ),
  ),
)
