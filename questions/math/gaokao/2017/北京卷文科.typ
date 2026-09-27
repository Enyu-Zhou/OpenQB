#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017北京文.pdf",
  regions: ("北京",),
)
#let loop-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((-0.65, 0.3), (0.65, -0.3), radius: 0.15)
    content((0, 0), [开始])
    rect((-1.3, -1), (1.3, -1.7))
    content((0, -1.35), $k=0,s=1$)
    line((0, -4.2), (1.5, -4.8), (0, -5.4), (-1.5, -4.8), close: true)
    content((0, -4.8), $k<3$)
    rect((2.2, -3.1), (4, -3.8))
    content((3.1, -3.45), $k=k+1$)
    rect((2.2, -1.75), (4, -2.85))
    content((3.1, -2.3), $s=(s+1)/s$)
    line((-0.85, -6), (0.95, -6), (0.7, -6.7), (-1.1, -6.7), close: true)
    content((0, -6.35), [输出 $s$])
    rect((-0.65, -7.35), (0.65, -7.95), radius: 0.15)
    content((0, -7.65), [结束])
    for (a, b) in (
      ((0, -0.3), (0, -1)),
      ((0, -1.7), (0, -4.2)),
      ((0, -5.4), (0, -6)),
      ((0, -6.7), (0, -7.35)),
      ((3.1, -3.1), (3.1, -2.85)),
    ) { line(a, b, mark: (end: ">")) }
    line((1.5, -4.8), (3.1, -4.8), (3.1, -3.8), mark: (end: ">"))
    line((2.2, -2.3), (0, -2.3), mark: (end: ">"))
    content((1.8, -4.7), [是], anchor: "south")
    content((0.15, -5.6), [否], anchor: "west")
  })
}
#let three-views() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((0, 0), (2.5, 0), (0, 2), close: true)
  line((4, 0), (5.5, 0), (5.5, 2), close: true)
  rect((0, -3), (2.5, -1.5))
  line((0, -3), (2.5, -1.5))
  line((0, -1.5), (2.5, -3), stroke: (dash: figure-style.dash))
  content((1.25, -0.75), [正（主）视图])
  content((4.75, -0.75), [侧（左）视图])
  content((1.25, -3.4), [俯视图])
  for (x1, x2, label) in ((0, 2.5, $5$), (4, 5.5, $3$)) {
    line((x1, -0.22), (x2, -0.22), mark: (start: ">", end: ">"))
    for x in (x1, x2) { line((x, -0.05), (x, -0.4)) }
    content(
      ((x1 + x2) / 2, -0.22),
      label,
      frame: "rect",
      fill: white,
      stroke: none,
      padding: 1pt,
    )
  }
  line((-0.22, 0), (-0.22, 2), mark: (start: ">", end: ">"))
  line((-0.4, 0), (-0.05, 0))
  line((-0.4, 2), (-0.05, 2))
  content(
    (-0.22, 1),
    $4$,
    frame: "rect",
    fill: white,
    stroke: none,
    padding: 1pt,
  )
})
#let histogram() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: $0$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
    ))
    plot.plot(
      size: (10, 4.5),
      axis-style: "school-book",
      x-min: 0,
      x-max: 100,
      y-min: 0,
      y-max: 0.05,
      x-label: [分数],
      y-label: [$"频率"/"组距"$],
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (20, 30, 40, 50, 60, 70, 80, 90),
      y-ticks: (0.01, 0.02, 0.04),
      {
        plot.annotate(resize: false, {
          let heights = (0.002, 0.003, 0.005, 0.01, 0.02, 0.04, 0.02)
          for (i, h) in heights.enumerate() {
            let x = 20 + 10 * i
            line((x, h), (x + 10, h))
            if i == 0 { line((x, 0), (x, h)) }
            line(
              (x + 10, 0),
              (x + 10, calc.max(h, heights.at(calc.min(i + 1, 6)))),
            )
          }
          for (h, end) in ((0.01, 50), (0.02, 60), (0.04, 70)) {
            line((0, h), (end, h), stroke: (dash: figure-style.dash))
          }
        })
      },
    )
  })
}
#let pyramid() = cetz.canvas(length: 22mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (2, 2, 0)
  let p = (0, 0, 2)
  let d = (1, 1, 0)
  let e = (1, 1, 1)
  oblique-project((1, 0), (0.5, 0.3), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, a, b, c, p)
    line(p, b)
    line(b, e)
    for (u, v) in ((a, c), (b, d), (d, e)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    for (pt, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (p, $P$, "south"),
      (d, $D$, "north"),
      (e, $E$, "south-west"),
    ) { content(pt, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：共 8 小题，每小题 5 分，共 40 分。在每小题列出的四个选项中，选出符合题目要求的一项。]
#question(
  "single-choice",
  score: 5,
  stem: [已知全集 $U=RR$，集合 $A={x|x< -2 #text[或] x>2}$，则 $complement_U A=$#choice-placeholder()。],
  choices: (
    [$(-2,2)$],
    [$(-infinity,-2) union (2,+infinity)$],
    [$[-2,2]$],
    [$(-infinity,-2] union [2,+infinity)$],
  ),
  answers: ([C],),
  explanation: [在全集 $RR$ 中，去掉 $x< -2$ 和 $x>2$ 的部分，剩余 $-2<=x<=2$，故补集为 $[-2,2]$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若复数 $(1-i)(a+i)$ 在复平面内对应的点在第二象限，则实数 $a$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$(-infinity,1)$],
    [$(-infinity,-1)$],
    [$(1,+infinity)$],
    [$(-1,+infinity)$],
  ),
  answers: ([B],),
  explanation: [$(1-i)(a+i)=a+1+(1-a)i$。第二象限要求 $a+1<0$ 且 $1-a>0$，故 $a< -1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图所示的程序框图，输出的 $s$ 值为#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$2$], [$3/2$], [$5/3$], [$8/5$]),
  answers: ([C],),
  explanation: [初始 $k=0,s=1$。三次循环后，$(k,s)$ 依次为 $(1,2)$、$(2,3/2)$、$(3,5/3)$，此时 $k<3$ 不成立，输出 $s=5/3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $x,y$ 满足 $cases(x<=3, x+y>=2, y<=x)$，则 $x+2y$ 的最大值为#choice-placeholder()。],
  choices: ([$1$], [$3$], [$5$], [$9$]),
  answers: ([D],),
  explanation: [由 $y<=x<=3$，得 $x+2y<=3x<=9$。当 $(x,y)=(3,3)$ 时满足所有约束且等号成立，故最大值为 $9$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=3^x-(1/3)^x$，则 $f(x)$#choice-placeholder()。],
  choices: (
    [是偶函数，且在 $RR$ 上是增函数],
    [是奇函数，且在 $RR$ 上是增函数],
    [是偶函数，且在 $RR$ 上是减函数],
    [是奇函数，且在 $RR$ 上是减函数],
  ),
  answers: ([B],),
  explanation: [定义域为 $RR$，且 $f(-x)=3^(-x)-3^x=-f(x)$，故为奇函数。$3^x$ 与 $-3^(-x)$ 都在 $RR$ 上严格递增，其和也严格递增。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某三棱锥的三视图如图所示，则该三棱锥的体积为#choice-placeholder()。
    #figure(three-views())],
  choices: ([$60$], [$30$], [$20$], [$10$]),
  answers: ([D],),
  explanation: [由三视图，三棱锥可放入长、宽、高分别为 $5,3,4$ 的长方体中，底面是长方体底面的一半，高为 $4$。所以 $V=1/3 times (1/2 times 5 times 3)times 4=10$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $bold(m),bold(n)$ 为非零向量，则“存在负数 $lambda$，使得 $bold(m)=lambda bold(n)$”是“$bold(m) dot bold(n)<0$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [若 $bold(m)=lambda bold(n)$ 且 $lambda<0$，则 $bold(m) dot bold(n)=lambda abs(bold(n))^2<0$，充分性成立。反之，取 $bold(m)=(1,0)$、$bold(n)=(-1,1)$，数量积为 $-1$，但两向量不共线，不存在所述 $lambda$，故不是必要条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [根据有关资料，围棋状态空间复杂度的上限 $M$ 约为 $3^361$，而可观测宇宙中普通物质的原子总数 $N$ 约为 $10^80$，则下列各数中与 $M/N$ 最接近的是#choice-placeholder()。（参考数据：$lg 3 approx 0.48$）],
  choices: ([$10^33$], [$10^53$], [$10^73$], [$10^93$]),
  answers: ([D],),
  explanation: [$lg(M/N) approx 361lg 3-80 approx 361 times 0.48-80=93.28$，故最接近的是 $10^93$。],
)
#section[填空题：共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，角 $alpha$ 与角 $beta$ 均以 $O x$ 为始边，它们的终边关于 $y$ 轴对称，若 $sin alpha=1/3$，则 $sin beta=$#fill-placeholder()。],
  answers: ([$1/3$],),
  explanation: [关于 $y$ 轴对称的单位圆上两点纵坐标相同，所以 $sin beta=sin alpha=1/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若双曲线 $x^2-y^2/m=1$ 的离心率为 $sqrt(3)$，则实数 $m=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [方程表示双曲线要求 $m>0$。由 $a^2=1,b^2=m$，得 $e^2=(a^2+b^2)/a^2=1+m=3$，故 $m=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $x>=0,y>=0$，且 $x+y=1$，则 $x^2+y^2$ 的取值范围是#fill-placeholder()。],
  answers: ([$[1/2,1]$],),
  explanation: [由 $(x-y)^2>=0$ 得 $x^2+y^2>=(x+y)^2/2=1/2$；又 $x y>=0$，故 $x^2+y^2=(x+y)^2-2x y<=1$。当 $x=y=1/2$ 时取最小值，当 $(x,y)=(0,1)$ 或 $(1,0)$ 时取最大值。函数沿线段连续，故取值范围为 $[1/2,1]$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知点 $P$ 在圆 $x^2+y^2=1$ 上，点 $A$ 的坐标为 $(-2,0)$，$O$ 为原点，则 $arrow(A O) dot arrow(A P)$ 的最大值为#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [设 $P=(x,y)$，则 $arrow(A O)=(2,0)$、$arrow(A P)=(x+2,y)$，故数量积为 $2x+4$。圆上 $x<=1$，所以最大值为 $6$，在 $P=(1,0)$ 处取得。],
)
#question(
  "fill-in",
  score: 5,
  stem: [能够说明“设 $a,b,c$ 是任意实数。若 $a>b>c$，则 $a+b>c$”是假命题的一组整数 $a,b,c$ 的值依次为#fill-placeholder()。],
  answers: ([$-1,-2,-3$（答案不唯一）],),
  explanation: [取 $a=-1,b=-2,c=-3$，有 $a>b>c$，但 $a+b=-3=c$，不满足 $a+b>c$，故构成反例。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某学习小组由学生和教师组成，人员构成同时满足以下三个条件：
    ① 男学生人数多于女学生人数；

    ② 女学生人数多于教师人数；

    ③ 教师人数的两倍多于男学生人数。

    （1）若教师人数为 $4$，则女学生人数的最大值为#fill-placeholder()；

    （2）该小组人数的最小值为#fill-placeholder()。
  ],
  answers: ([$6$], [$12$]),
  explanation: [设教师、女学生、男学生人数依次为 $t,g,b$，则 $t<g<b<2t$，且均为整数。
    当 $t=4$ 时，$4<g<b<8$，所以 $g<=6$，取 $(g,b)=(6,7)$ 可达最大值 $6$。
    一般地，$g>=t+1$、$b>=t+2$，结合 $b<=2t-1$ 得 $t>=3$。因此总人数至少为 $t+(t+1)+(t+2)>=12$，取 $(t,g,b)=(3,4,5)$ 即可达到。],
)
#section[解答题：共 6 小题，共 80 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [已知等差数列 ${a_n}$ 和等比数列 ${b_n}$ 满足 $a_1=b_1=1$，$a_2+a_4=10$，$b_2 b_4=a_5$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=2n-1$],),
      explanation: [设公差为 $d$，由 $(1+d)+(1+3d)=10$ 得 $d=2$，所以 $a_n=1+2(n-1)=2n-1$。],
    ),
    subquestion(
      stem: [求和：$b_1+b_3+b_5+dots+b_(2n-1)$。],
      answers: ([$(3^n-1)/2$],),
      explanation: [由第（1）问 $a_5=9$。设等比数列公比为 $q$，则 $b_2 b_4=q times q^3=q^4=9$，从而 $q^2=3$。奇数项构成首项为 $1$、公比为 $3$ 的等比数列，故 $b_1+b_3+dots+b_(2n-1)=(3^n-1)/(3-1)=(3^n-1)/2$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知函数 $f(x)=sqrt(3)cos(2x-pi/3)-2sin x cos x$。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的最小正周期。],
      answers: ([$pi$],),
      explanation: [利用和差角及倍角公式，
        $
          f(x)=sqrt(3)/2 cos 2x+3/2 sin 2x-sin 2x=sqrt(3)/2 cos 2x+1/2 sin 2x=sin(2x+pi/3).
        $
        因此最小正周期为 $T=(2pi)/2=pi$。],
    ),
    subquestion(
      stem: [求证：当 $x in [-pi/4,pi/4]$ 时，$f(x)>=-1/2$。],
      answers: ([证明见解析。],),
      explanation: [由 $x in [-pi/4,pi/4]$ 得 $2x+pi/3 in [-pi/6,(5pi)/6]$。正弦函数在 $[-pi/6,pi/2]$ 上递增，在 $[pi/2,(5pi)/6]$ 上递减，故该区间上的最小值为 $sin(-pi/6)=-1/2$。所以 $f(x)>=-1/2$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [某大学艺术专业 $400$ 名学生参加某次测评，根据男女学生人数比例，使用分层抽样的方法从中随机抽取了 $100$ 名学生，记录他们的分数，将数据分成 $7$ 组：$[20,30),[30,40),dots,[80,90]$，并整理得到如下频率分布直方图：
    #figure(histogram())],
  parts: (
    subquestion(
      stem: [从总体的 $400$ 名学生中随机抽取一人，估计其分数小于 $70$ 的概率。],
      answers: ([$0.4$],),
      explanation: [分数不小于 $70$ 的频率为 $(0.04+0.02)times 10=0.6$，所以所求概率估计为 $1-0.6=0.4$。],
    ),
    subquestion(
      stem: [已知样本中分数小于 $40$ 的学生有 $5$ 人，试估计总体中分数在区间 $[40,50)$ 内的人数。],
      answers: ([$20$ 人],),
      explanation: [分数不小于 $50$ 的频率为 $(0.01+0.02+0.04+0.02)times 10=0.9$，故 $[40,50)$ 内的频率为 $1-0.9-5/100=0.05$。总体中该区间人数估计为 $400 times 0.05=20$ 人。],
    ),
    subquestion(
      stem: [已知样本中有一半男生的分数不小于 $70$，且样本中分数不小于 $70$ 的男女生人数相等。试估计总体中男生和女生人数的比例。],
      answers: ([$3:2$],),
      explanation: [样本中分数不小于 $70$ 的共有 $100 times 0.6=60$ 人，其中男生 $30$ 人。这是样本中男生人数的一半，故样本中男生为 $60$ 人，女生为 $40$ 人。由分层抽样，总体男女生人数比例估计为 $60:40=3:2$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在三棱锥 $P-A B C$ 中，$P A perp A B$，$P A perp B C$，$A B perp B C$，$P A=A B=B C=2$，$D$ 为线段 $A C$ 的中点，$E$ 为线段 $P C$ 上一点。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [求证：$P A perp B D$。],
      answers: ([证明见解析。],),
      explanation: [∵ $P A perp A B$、$P A perp B C$，且 $A B inter B C={B}$，∴ $P A perp$ 平面 $A B C$。又 $B D subset$ 平面 $A B C$，故 $P A perp B D$。],
    ),
    subquestion(
      stem: [求证：平面 $B D E perp$ 平面 $P A C$。],
      answers: ([证明见解析。],),
      explanation: [由 $A B=B C$ 且 $D$ 为 $A C$ 中点，得 $B D perp A C$。又由第（1）问 $B D perp P A$，且 $P A inter A C={A}$，故 $B D perp$ 平面 $P A C$。因为 $B D subset$ 平面 $B D E$，所以平面 $B D E perp$ 平面 $P A C$。],
    ),
    subquestion(
      stem: [当 $P A parallel$ 平面 $B D E$ 时，求三棱锥 $E-B C D$ 的体积。],
      answers: ([$1/3$],),
      explanation: [平面 $P A C$ 与平面 $B D E$ 相交于 $D E$，由 $P A parallel$ 平面 $B D E$ 得 $D E parallel P A$。$D$ 是 $A C$ 中点，所以 $E$ 是 $P C$ 中点，$D E=P A/2=1$。由 $P A perp$ 平面 $A B C$ 知 $D E perp$ 平面 $A B C$，即 $D E$ 为锥高。
        $
          S_(triangle B C D)=1/2 S_(triangle A B C)=1/2 times 1/2 times 2 times 2=1,
        $
        故 $V_(E-B C D)=1/3 S_(triangle B C D) times D E=1/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知椭圆 $C$ 的两个顶点分别为 $A(-2,0)$、$B(2,0)$，焦点在 $x$ 轴上，离心率为 $sqrt(3)/2$。],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 的方程。],
      answers: ([$x^2/4+y^2=1$],),
      explanation: [由题意 $a=2$、$c/a=sqrt(3)/2$，得 $c=sqrt(3)$，故 $b^2=a^2-c^2=1$，椭圆方程为 $x^2/4+y^2=1$。],
    ),
    subquestion(
      stem: [点 $D$ 为 $x$ 轴上一点，过 $D$ 作 $x$ 轴的垂线交椭圆 $C$ 于不同的两点 $M,N$，过 $D$ 作 $A M$ 的垂线交 $B N$ 于点 $E$。求证：$triangle B D E$ 与 $triangle B D N$ 的面积之比为 $4:5$。],
      answers: ([证明见解析。],),
      explanation: [设 $D=(u,0)$、$M=(u,v)$、$N=(u,-v)$，其中 $-2<u<2$、$v!=0$，且 $4-u^2=4v^2$。直线 $D E$ 和 $B N$ 的方程分别为
        $ y=-(u+2)/v (x-u),quad y=v/(2-u)(x-2). $
        将第二式写为 $x=2+(2-u)y/v$，代入第一式得
        $ y=-(4-u^2)/v -(4-u^2)/v^2 y=-4v-4y, $
        故 $y_E=-4v/5$。两个三角形的底边同为 $B D$，高分别为 $abs(y_E)$、$abs(v)$，所以
        $ S_(triangle B D E)/S_(triangle B D N)=abs(y_E)/abs(v)=4/5. $],
    ),
  ),
)
#question("solution", score: 13, stem: [已知函数 $f(x)=e^x cos x-x$。], parts: (
  subquestion(
    stem: [求曲线 $y=f(x)$ 在点 $(0,f(0))$ 处的切线方程。],
    answers: ([$y=1$],),
    explanation: [$f'(x)=e^x (cos x-sin x)-1$，故 $f(0)=1$、$f'(0)=0$。切线方程为 $y=1$。],
  ),
  subquestion(
    stem: [求函数 $f(x)$ 在区间 $[0,pi/2]$ 上的最大值和最小值。],
    answers: ([最大值为 $1$，最小值为 $-pi/2$。],),
    explanation: [设 $g(x)=f'(x)$，则 $g'(x)=-2e^x sin x$。在 $(0,pi/2)$ 上，$g'(x)<0$，故 $g$ 严格递减。又 $g(0)=0$，所以 $f'(x)<0$（$0<x<=pi/2$），因此 $f$ 在 $[0,pi/2]$ 上严格递减。故最大值为 $f(0)=1$，最小值为 $f(pi/2)=-pi/2$。],
  ),
))
