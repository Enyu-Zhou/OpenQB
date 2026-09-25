#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019全国1文(河南,河北,山西,江西,湖北,湖南,广东,安徽,福建,山东).pdf",
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
    "山东",
  ),
)

#let graph-choice(kind) = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: $O$,
    x: (label: (anchor: "west", offset: 0.2)),
    y: (label: (anchor: "south", offset: 0.25)),
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (5.2, 2.7),
    axis-style: "school-book",
    x-min: -3.6,
    x-max: 3.6,
    y-min: -1.55,
    y-max: 1.55,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((-calc.pi, $-pi$), (calc.pi, $pi$)),
    y-ticks: (1,),
    {
      if kind == "A" {
        plot.annotate({
          bezier((-calc.pi, 1.1), (-0.65, -0.18), (-1.55, 1.15), (-1.45, -0.24))
          bezier((-0.65, -0.18), (0, 0), (-0.3, -0.2), (-0.1, -0.12))
        })
        plot.add(
          x => (calc.sin(x) + x) / (calc.cos(x) + x * x),
          domain: (0, calc.pi),
          style: (stroke: (paint: black, thickness: figure-style.thickness)),
        )
      } else {
        let factor = if kind == "B" { 0.42 } else if kind == "C" { -1 } else {
          1
        }
        plot.add(
          x => factor * (calc.sin(x) + x) / (calc.cos(x) + x * x),
          domain: (-calc.pi, calc.pi),
          style: (stroke: (paint: black, thickness: figure-style.thickness)),
        )
      }
    },
  )
})

#let flowchart() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.65, 7.6), (0.65, 8.3), radius: 0.16)
  content((0, 7.95), [开始])
  rect((-0.9, 5.8), (0.9, 7.1))
  content((0, 6.45), [$A=1/2$])
  rect((-0.9, 4.6), (0.9, 5.3))
  content((0, 4.95), [$k=1$])
  line((0, 4), (1.15, 3.5), (0, 3), (-1.15, 3.5), close: true)
  content((0, 3.5), [$k<=2$])
  rect((-0.95, 1.5), (0.95, 2.45))
  rect((-1.15, 0), (1.15, 0.7))
  content((0, 0.35), [$k=k+1$])
  line((2, 1.7), (4.3, 1.7), (4.55, 2.45), (2.25, 2.45), close: true)
  content((3.275, 2.075), [输出 $A$])
  rect((2.6, 0.15), (3.95, 0.85), radius: 0.16)
  content((3.275, 0.5), [结束])
  for (a, b) in (
    ((0, 7.6), (0, 7.1)),
    ((0, 5.8), (0, 5.3)),
    ((0, 4.6), (0, 4)),
    ((0, 3), (0, 2.45)),
    ((0, 1.5), (0, 0.7)),
    ((3.275, 1.7), (3.275, 0.85)),
  ) { line(a, b, mark: (end: ">")) }
  line((1.15, 3.5), (3.275, 3.5), (3.275, 2.45), mark: (end: ">"))
  line((-1.15, 0.35), (-1.7, 0.35), (-1.7, 4.3), (0, 4.3), mark: (end: ">"))
  content((0.12, 2.72), [是], anchor: "west")
  content((1.5, 3.55), [否], anchor: "south")
})

#let prism-diagram(aux: false) = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let d = (1, calc.sqrt(3), 0)
  let c = (3, calc.sqrt(3), 0)
  let a1 = (0, 0, 4)
  let b1 = (2, 0, 4)
  let d1 = (1, calc.sqrt(3), 4)
  let c1 = (3, calc.sqrt(3), 4)
  let e = (2.5, calc.sqrt(3) / 2, 0)
  let m = (2, 0, 2)
  let n = (0.5, calc.sqrt(3) / 2, 2)
  oblique-project((1, 0), (0.25, 0.4), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(c1, e)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(a1, d, e, stroke: (dash: figure-style.dash))
    line(d, c1, stroke: (dash: figure-style.dash))
    line(n, m, stroke: (dash: figure-style.dash))
    if aux { line(m, e, stroke: (dash: figure-style.dash)) }
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "south"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
      (e, $E$, "north-west"),
      (m, $M$, "south-east"),
      (n, $N$, "east"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})


#section[选择题：本题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设 $z=(3-"i")/(1+2"i")$，则 $|z|=$#choice-placeholder()。],
  choices: ([$2$], [$sqrt(3)$], [$sqrt(2)$], [$1$]),
  answers: ([C],),
  explanation: [由复数模的运算性质，$|z|=frac(|3-"i"|, |1+2"i"|)=sqrt(10)/sqrt(5)=sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $U={1,2,3,4,5,6,7}$，$A={2,3,4,5}$，$B={2,3,6,7}$，则 $B inter complement_U A=$#choice-placeholder()。],
  choices: ([${1,6}$], [${1,7}$], [${6,7}$], [${1,6,7}$]),
  answers: ([C],),
  explanation: [由 $complement_U A={1,6,7}$，得 $B inter complement_U A={6,7}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a=log_2 0.2$，$b=2^0.2$，$c=0.2^0.3$，则#choice-placeholder()。],
  choices: ([$a<b<c$], [$a<c<b$], [$c<a<b$], [$b<c<a$]),
  answers: ([B],),
  explanation: [∵ $a<0$，$0<c<1$，$b>1$，∴ $a<c<b$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [古希腊时期，人们认为最美人体的头顶至肚脐的长度与肚脐至足底的长度之比是 $(sqrt(5)-1)/2$（$(sqrt(5)-1)/2 approx 0.618$，称为黄金分割比例），著名的“断臂维纳斯”便是如此。此外，最美人体的头顶至咽喉的长度与咽喉至肚脐的长度之比也是 $(sqrt(5)-1)/2$。若某人满足上述两个黄金分割比例，且腿长为 105 cm，头顶至脖子下端的长度为 26 cm，则其身高可能是#choice-placeholder()。],
  choices: ([165 cm], [175 cm], [185 cm], [190 cm]),
  answers: ([B],),
  explanation: [设 $r=(sqrt(5)-1)/2$，肚脐至足底长为 $L$，头顶至咽喉长为 $h$，身高为 $H$。则 $H=(1+r)L$，且 $h/(r L-h)=r$，由 $r^2+r=1$ 得 $h=r^3 L$。
    肚脐高于腿根，故 $L>105$；咽喉高于脖子下端，故 $h<26$。因此
    $ 105(1+r)<H<26(1+r)/r^3, $
    下、上界分别约为 169.894 cm 和 178.207 cm。四个选项中只有 175 cm 符合。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $f(x)=(sin x+x)/(cos x+x^2)$ 在 $[-pi,pi]$ 的图象大致为#choice-placeholder()。],
  choices: (
    [#figure(graph-choice("A"))],
    [#figure(graph-choice("B"))],
    [#figure(graph-choice("C"))],
    [#figure(graph-choice("D"))],
  ),
  answers: ([D],),
  explanation: [分子为奇函数，分母为偶函数，故 $f$ 为奇函数，排除 A。
    $f(pi)=pi/(pi^2-1)>0$，排除 C；$f(pi/2)=(4+2pi)/pi^2>1$，排除 B，选 D。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某学校为了解 1000 名新生的身体素质，将这些学生编号为 $1,2,dots,1000$，从这些新生中用系统抽样方法等距抽取 100 名学生进行体质测验。若 46 号学生被抽到，则下面 4 名学生中被抽到的是#choice-placeholder()。],
  choices: ([8 号学生], [200 号学生], [616 号学生], [815 号学生]),
  answers: ([C],),
  explanation: [抽样间隔为 $1000/100=10$，故被抽到的编号为 $6+10k$（$k=0,1,dots,99$）。四个选项中只有 616 除以 10 的余数为 6，选 C。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$tan 255 degree=$#choice-placeholder()。],
  choices: ([$-2-sqrt(3)$], [$-2+sqrt(3)$], [$2-sqrt(3)$], [$2+sqrt(3)$]),
  answers: ([D],),
  explanation: [$tan 255 degree=tan 75 degree=(tan 45 degree+tan 30 degree)/(1-tan 45 degree tan 30 degree)=2+sqrt(3)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知非零向量 $bold(a),bold(b)$ 满足 $|bold(a)|=2|bold(b)|$，且 $(bold(a)-bold(b)) perp bold(b)$，则 $bold(a)$ 与 $bold(b)$ 的夹角为#choice-placeholder()。],
  choices: ([$pi/6$], [$pi/3$], [$2pi/3$], [$5pi/6$]),
  answers: ([B],),
  explanation: [由垂直关系得 $bold(a) dot bold(b)=|bold(b)|^2$，所以夹角 $theta$ 满足 $cos theta=frac(bold(a) dot bold(b), |bold(a)| |bold(b)|)=1/2$，故 $theta=pi/3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图是求 $frac(1, 2+frac(1, 2+1/2))$ 的程序框图，图中空白框中应填入#choice-placeholder()。
    #figure(flowchart())],
  choices: ([$A=1/(2+A)$], [$A=2+1/A$], [$A=1/(1+2A)$], [$A=1+1/(2A)$]),
  answers: ([A],),
  explanation: [从 $A=1/2$ 开始，循环两次，每次将原值代入 $1/(2+A)$，依次得到 $1/(2+1/2)$、$frac(1, 2+frac(1, 2+1/2))$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的一条渐近线的倾斜角为 $130 degree$，则 $C$ 的离心率为#choice-placeholder()。],
  choices: (
    [$2sin 40 degree$],
    [$2cos 40 degree$],
    [$1/(sin 50 degree)$],
    [$1/(cos 50 degree)$],
  ),
  answers: ([D],),
  explanation: [由 $-b/a=tan 130 degree=-tan 50 degree$，得 $e=sqrt(1+b^2/a^2)=sqrt(1+tan^2 50 degree)=1/(cos 50 degree)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $a sin A-b sin B=4c sin C$，$cos A=-1/4$，则 $b/c=$#choice-placeholder()。],
  choices: ([$6$], [$5$], [$4$], [$3$]),
  answers: ([A],),
  explanation: [由正弦定理得 $a^2-b^2=4c^2$。代入余弦定理，得 $cos A=(b^2+c^2-a^2)/(2b c)=-(3c)/(2b)=-1/4$，故 $b/c=6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知椭圆 $C$ 的焦点为 $F_1(-1,0)$、$F_2(1,0)$，过 $F_2$ 的直线与 $C$ 交于 $A,B$ 两点。若 $|A F_2|=2|F_2 B|$，$|A B|=|B F_1|$，则 $C$ 的方程为#choice-placeholder()。],
  choices: (
    [$x^2/2+y^2=1$],
    [$x^2/3+y^2/2=1$],
    [$x^2/4+y^2/3=1$],
    [$x^2/5+y^2/4=1$],
  ),
  answers: ([B],),
  explanation: [设 $|B F_2|=t$，则 $|A F_2|=2t$，$|B F_1|=|A B|=3t$。由椭圆定义，$2a=4t$、$|A F_1|=2t$。
    在 $triangle A F_1 B$ 中，由余弦定理得 $cos angle F_1 A B=1/3$。在 $triangle A F_1 F_2$ 中，
    $ 4=(2t)^2+(2t)^2-2(2t)^2 times 1/3=16t^2/3. $
    ∴ $a^2=4t^2=3$，$b^2=a^2-1=2$，选 B。],
)

#section[填空题：本题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [曲线 $y=3(x^2+x)e^x$ 在点 $(0,0)$ 处的切线方程为#fill-placeholder()。],
  answers: ([$3x-y=0$],),
  explanation: [求导得 $y'=3(x^2+3x+1)e^x$，在 $x=0$ 处的斜率为 3，故切线为 $y=3x$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [记 $S_n$ 为等比数列 ${a_n}$ 的前 $n$ 项和。若 $a_1=1$，$S_3=3/4$，则 $S_4=$#fill-placeholder()。],
  answers: ([$5/8$],),
  explanation: [设公比为 $q$，由 $1+q+q^2=3/4$ 得 $(q+1/2)^2=0$，所以 $q=-1/2$。故 $S_4=S_3+a_4=3/4+(-1/2)^3=5/8$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [函数 $f(x)=sin(2x+3pi/2)-3cos x$ 的最小值为#fill-placeholder()。],
  answers: ([$-4$],),
  explanation: [由 $sin(2x+3pi/2)>=-1$、$-3cos x>=-3$，得 $f(x)>=-4$。当 $x=0$ 时，两式同时取等号，故最小值为 $-4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $angle A C B=90 degree$，$P$ 为平面 $A B C$ 外一点，$P C=2$，点 $P$ 到 $angle A C B$ 两边 $A C,B C$ 的距离均为 $sqrt(3)$，那么 $P$ 到平面 $A B C$ 的距离为#fill-placeholder()。],
  answers: ([$sqrt(2)$],),
  explanation: [设 $P$ 在平面 $A B C$ 上的射影为 $H$，从 $H$ 向 $A C,B C$ 作垂线，垂足分别为 $D,E$。由三垂线定理，$P D perp A C$、$P E perp B C$，故 $P D^2=P E^2=3$。
    由 $A C perp B C$ 得 $H D^2+H E^2=C H^2$，因此
    $ 6=P D^2+P E^2=2P H^2+H D^2+H E^2=P H^2+P C^2=P H^2+4. $
    所求距离为 $P H=sqrt(2)$。],
)

#section[解答题：共 70 分。第 17～21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [某商场为提高服务质量，随机调查了 50 名男顾客和 50 名女顾客，每位顾客对该商场的服务给出满意或不满意的评价，得到下面列联表：
    #table(
      columns: 3,
      align: center,
      [], [满意], [不满意],
      [男顾客], [40], [10],
      [女顾客], [30], [20],
    )
    附：$K^2=(n(a d-b c)^2)/((a+b)(c+d)(a+c)(b+d))$。
    #table(
      columns: 4,
      align: center,
      [$P(K^2>=k)$], [0.050], [0.010], [0.001],
      [$k$], [3.841], [6.635], [10.828],
    )],
  parts: (
    subquestion(
      stem: [分别估计男、女顾客对该商场服务满意的概率。],
      answers: ([$4/5$，$3/5$。],),
      explanation: [用样本频率估计概率，男顾客满意的概率为 $40/50=4/5$，女顾客满意的概率为 $30/50=3/5$。],
    ),
    subquestion(
      stem: [能否有 $95%$ 的把握认为男、女顾客对该商场服务的评价有差异？],
      answers: ([能。],),
      explanation: [由列联表计算，
        $
          K^2=frac(100(40 times 20-10 times 30)^2, 50 times 50 times 70 times 30)=100/21 approx 4.762>3.841.
        $
        因此有 $95%$ 的把握认为男、女顾客对该商场服务的评价有差异。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [记 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和，已知 $S_9=-a_5$。],
  parts: (
    subquestion(
      stem: [若 $a_3=4$，求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=10-2n$],),
      explanation: [由等差数列性质，$S_9=9a_5=-a_5$，故 $a_5=0$。设公差为 $d$，则 $2d=a_5-a_3=-4$，故 $d=-2$，于是 $a_n=a_5+(n-5)d=10-2n$。],
    ),
    subquestion(
      stem: [若 $a_1>0$，求使得 $S_n>=a_n$ 的 $n$ 的取值范围。],
      answers: ([$n in {1,2,dots,10}$],),
      explanation: [由 $a_5=0$ 得 $a_1=-4d>0$，故 $d<0$。于是 $a_n=(n-5)d$，$S_n=n(n-9)d/2$，所以
        $ S_n-a_n=((n-1)(n-10))/2 d>=0 <=> (n-1)(n-10)<=0. $
        结合 $n in NN^*$，得 $n in {1,2,dots,10}$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，直四棱柱 $A B C D-A_1 B_1 C_1 D_1$ 的底面是菱形，$A A_1=4$，$A B=2$，$angle B A D=60 degree$，$E,M,N$ 分别是 $B C,B B_1,A_1 D$ 的中点。
    #figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [证明：$M N parallel$ 平面 $C_1 D E$。],
      answers: ([证明见解析。],),
      explanation: [连接 $M E$。在 $triangle B B_1 C$ 中，$M E parallel B_1 C$ 且 $M E=(B_1 C)/2$。又 $A_1 D parallel B_1 C$ 且 $A_1 D=B_1 C$，所以 $N D parallel M E$ 且 $N D=M E$。
        故四边形 $M N D E$ 为平行四边形，$M N parallel D E$。由 $D E subset$ 平面 $C_1 D E$，$M N subset.not$ 平面 $C_1 D E$，得 $M N parallel$ 平面 $C_1 D E$。
        #figure(prism-diagram(aux: true))],
    ),
    subquestion(
      stem: [求点 $C$ 到平面 $C_1 D E$ 的距离。],
      answers: ([$4sqrt(17)/17$],),
      explanation: [∵ $triangle B C D$ 是边长为 2 的正三角形，$E$ 为 $B C$ 中点，∴ $D E perp B C$，$D E=sqrt(3)$，$C E=1$。
        又 $C C_1 perp$ 平面 $A B C D$，故 $D E perp C C_1$，从而 $D E perp$ 平面 $B C C_1 B_1$，所以 $D E perp E C_1$。由 $C_1 E=sqrt(4^2+1^2)=sqrt(17)$ 得
        $
          S_(triangle C_1 D E)=sqrt(51)/2, quad V_(C_1-C D E)=1/3 times (sqrt(3)/2) times 4=2sqrt(3)/3.
        $
        设所求距离为 $h$，等体积得 $1/3 times sqrt(51)/2 times h=2sqrt(3)/3$，故 $h=4/sqrt(17)=4sqrt(17)/17$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=2sin x-x cos x-x$，$f'(x)$ 为 $f(x)$ 的导数。],
  parts: (
    subquestion(
      stem: [证明：$f'(x)$ 在区间 $(0,pi)$ 存在唯一零点。],
      answers: ([证明见解析。],),
      explanation: [令 $g(x)=f'(x)=cos x+x sin x-1$，则 $g'(x)=x cos x$，故 $g$ 在 $(0,pi/2)$ 严格递增，在 $(pi/2,pi)$ 严格递减。
        ∵ $g(0)=0$，∴ $g$ 在 $(0,pi/2]$ 内为正。又 $g(pi/2)=pi/2-1>0$、$g(pi)=-2<0$，由连续性与严格单调性，$g$ 在 $(pi/2,pi)$ 存在唯一零点，原结论得证。],
    ),
    subquestion(
      stem: [若 $x in [0,pi]$ 时，$f(x)>=a x$，求 $a$ 的取值范围。],
      answers: ([$(-infinity,0]$],),
      explanation: [取 $x=pi$，由 $f(pi)=0>=a pi$ 得 $a<=0$，这是必要条件。
        由第（1）问，$f'$ 在 $(0,pi)$ 先正后负，因此 $f$ 先增后减，又 $f(0)=f(pi)=0$，故 $f(x)>=0$ 对所有 $x in [0,pi]$ 成立。
        当 $a<=0$ 时，$a x<=0<=f(x)$，故该条件也充分。因此 $a in (-infinity,0]$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知点 $A,B$ 关于坐标原点 $O$ 对称，$|A B|=4$，圆 $M$ 过点 $A,B$ 且与直线 $x+2=0$ 相切。],
  parts: (
    subquestion(
      stem: [若 $A$ 在直线 $x+y=0$ 上，求圆 $M$ 的半径。],
      answers: ([2 或 6。],),
      explanation: [由 $O$ 为弦 $A B$ 的中点、$O A=2$，圆心 $M$ 在 $A B$ 的垂直平分线 $y=x$ 上，设 $M(u,u)$、半径为 $r$。
        由弦心距关系及相切条件，$r^2=O M^2+O A^2=2u^2+4=(u+2)^2$，得 $u(u-4)=0$。
        故 $u=0$ 或 4，相应半径 $r=|u+2|$ 为 2 或 6。],
    ),
    subquestion(
      stem: [是否存在定点 $P$，使得当 $A$ 运动时，$|M A|-|M P|$ 为定值？并说明理由。],
      answers: ([存在，$P(1,0)$，定值为 1。],),
      explanation: [设 $M(x,y)$、圆半径为 $r$。因 $O$ 为弦 $A B$ 的中点且 $O A=2$，有 $r^2=O M^2+4=x^2+y^2+4$。相切条件给出 $r^2=(x+2)^2$，故 $y^2=4x$。
        从而 $x>=0$，$|M A|=r=x+2$。取定点 $P(1,0)$，则
        $ |M P|=sqrt((x-1)^2+y^2)=sqrt((x-1)^2+4x)=x+1. $
        因此 $|M A|-|M P|=1$，此结论也包含 $M=O$ 的情形，故所求定点存在。],
    ),
  ),
)

#section[选考题：共 10 分。请考生在第 22、23 题中任选一题作答，如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。
    在直角坐标系 $x O y$ 中，曲线 $C$ 的参数方程为 $cases(x=(1-t^2)/(1+t^2), y=(4t)/(1+t^2))$（$t$ 为参数），以坐标原点 $O$ 为极点，$x$ 轴的正半轴为极轴建立极坐标系，直线 $l$ 的极坐标方程为 $2rho cos theta+sqrt(3)rho sin theta+11=0$。],
  parts: (
    subquestion(
      stem: [求 $C$ 和 $l$ 的直角坐标方程。],
      answers: ([$C:x^2+y^2/4=1$（$-1<x<=1$）；$l:2x+sqrt(3)y+11=0$。],),
      explanation: [消参得 $x^2+y^2/4=1$，且 $x>-1$。反代 $t=y/(2(1+x))$ 可知，曲线恰为该椭圆除去 $(-1,0)$。
        由 $x=rho cos theta$、$y=rho sin theta$，得 $l:2x+sqrt(3)y+11=0$。],
    ),
    subquestion(
      stem: [求 $C$ 上的点到 $l$ 距离的最小值。],
      answers: ([$sqrt(7)$],),
      explanation: [椭圆上的点可写为 $(cos phi,2sin phi)$，到 $l$ 的距离为
        $
          d=frac(|2cos phi+2sqrt(3)sin phi+11|, sqrt(7))=frac(11+4sin(phi+pi/6), sqrt(7))>=sqrt(7).
        $
        在 $(x,y)=(-1/2,-sqrt(3))$ 处取等号，该点对应 $t=-sqrt(3)$，确在 $C$ 上，故最小值为 $sqrt(7)$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。
    已知 $a,b,c$ 为正数，且满足 $a b c=1$。证明：],
  parts: (
    subquestion(
      stem: [$1/a+1/b+1/c<=a^2+b^2+c^2$。],
      answers: ([证明见解析。],),
      explanation: [由 $a^2+b^2>=2a b$ 等三个不等式相加，得 $a^2+b^2+c^2>=a b+b c+c a=1/a+1/b+1/c$。等号当且仅当 $a=b=c=1$ 时成立。],
    ),
    subquestion(
      stem: [$(a+b)^3+(b+c)^3+(c+a)^3>=24$。],
      answers: ([证明见解析。],),
      explanation: [由 $a+b>=2sqrt(a b)$ 等三个均值不等式相乘，得 $(a+b)(b+c)(c+a)>=8a b c=8$。再次应用均值不等式，
        $ (a+b)^3+(b+c)^3+(c+a)^3>=3(a+b)(b+c)(c+a)>=24. $
        当且仅当 $a=b=c=1$ 时等号成立。],
    ),
  ),
)
