#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019全国1理(河南,河北,山西,江西,湖北,湖南,广东,安徽,福建,山东).pdf",
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

#let hexagram() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for i in range(6) {
    if i in (1, 2) { line((0, i * 0.3), (1.5, i * 0.3)) } else {
      line((0, i * 0.3), (0.58, i * 0.3))
      line((0.92, i * 0.3), (1.5, i * 0.3))
    }
  }
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
  stem: [已知集合 $M={x|-4<x<2}$，$N={x|x^2-x-6<0}$，则 $M inter N=$#choice-placeholder()。],
  choices: ([${x|-4<x<3}$], [${x|-4<x< -2}$], [${x|-2<x<2}$], [${x|2<x<3}$]),
  answers: ([C],),
  explanation: [由 $(x-3)(x+2)<0$ 得 $N=(-2,3)$，故 $M inter N=(-2,2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设复数 $z$ 满足 $|z-"i"|=1$，$z$ 在复平面内对应的点为 $(x,y)$，则#choice-placeholder()。],
  choices: (
    [$(x+1)^2+y^2=1$],
    [$(x-1)^2+y^2=1$],
    [$x^2+(y-1)^2=1$],
    [$x^2+(y+1)^2=1$],
  ),
  answers: ([C],),
  explanation: [由 $z=x+y "i"$ 得 $|z-"i"|=sqrt(x^2+(y-1)^2)=1$，故 $x^2+(y-1)^2=1$。],
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
  stem: [我国古代典籍《周易》用“卦”描述万物的变化。每一“重卦”由从下到上排列的 6 个爻组成，爻分为阳爻“—”和阴爻“— —”，如图就是一重卦。在所有重卦中随机取一重卦，则该重卦恰有 3 个阳爻的概率是#choice-placeholder()。
    #figure(hexagram())],
  choices: ([$5/16$], [$11/32$], [$21/32$], [$11/16$]),
  answers: ([A],),
  explanation: [共 $2^6$ 种重卦，恰有 3 个阳爻的有 $binom(6, 3)$ 种，概率为 $binom(6, 3)/2^6=5/16$。],
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
  stem: [记 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和。已知 $S_4=0$，$a_5=5$，则#choice-placeholder()。],
  choices: ([$a_n=2n-5$], [$a_n=3n-10$], [$S_n=2n^2-8n$], [$S_n=1/2 n^2-2n$]),
  answers: ([A],),
  explanation: [设公差为 $d$，则 $4a_1+6d=0$，$a_1+4d=5$，解得 $a_1=-3$、$d=2$。故 $a_n=2n-5$，$S_n=n^2-4n$。],
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
#question(
  "single-choice",
  score: 5,
  stem: [关于函数 $f(x)=sin |x|+|sin x|$ 有下述四个结论：
    ① $f(x)$ 是偶函数；
    ② $f(x)$ 在区间 $(pi/2,pi)$ 单调递增；
    ③ $f(x)$ 在 $[-pi,pi]$ 有 4 个零点；
    ④ $f(x)$ 的最大值为 2。
    其中所有正确结论的编号是#choice-placeholder()。],
  choices: ([①②④], [②④], [①④], [①③]),
  answers: ([C],),
  explanation: [由 $f(-x)=f(x)$ 知①正确。
    在 $[0,pi]$ 上，$f(x)=2sin x$，故在 $(pi/2,pi)$ 上递减，②错误；结合偶性，在 $[-pi,pi]$ 上只有 $-pi,0,pi$ 三个零点，③错误。
    总有 $f(x)<=2$，且 $f(pi/2)=2$，所以④正确。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知三棱锥 $P-A B C$ 的四个顶点在球 $O$ 的球面上，$P A=P B=P C$，$triangle A B C$ 是边长为 2 的正三角形，$E,F$ 分别是 $P A,A B$ 的中点，$angle C E F=90 degree$，则球 $O$ 的体积为#choice-placeholder()。],
  choices: ([$8sqrt(6)pi$], [$4sqrt(6)pi$], [$2sqrt(6)pi$], [$sqrt(6)pi$]),
  answers: ([D],),
  explanation: [由 $E F parallel P B$ 和 $C E perp E F$ 得 $P B perp C E$。设 $arrow(P A)=bold(u)$、$arrow(P B)=bold(v)$、$arrow(P C)=bold(w)$，三向量模均为 $s$。
    由 $A B=B C=C A=2$，两两数量积均为 $s^2-2$。又 $arrow(C E)=bold(u)/2-bold(w)$，故
    $ 0=bold(v) dot (bold(u)/2-bold(w))=-(s^2-2)/2. $
    所以 $s=sqrt(2)$，三条侧棱两两垂直，可补成棱长 $sqrt(2)$ 的正方体。球半径为其体对角线的一半 $R=sqrt(6)/2$，故 $V=4/3 pi R^3=sqrt(6)pi$。],
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
  stem: [记 $S_n$ 为等比数列 ${a_n}$ 的前 $n$ 项和。若 $a_1=1/3$，$a_4^2=a_6$，则 $S_5=$#fill-placeholder()。],
  answers: ([$121/3$],),
  explanation: [设公比为 $q!=0$。由 $(q^3/3)^2=q^5/3$ 得 $q=3$，故 $S_5=(1/3)(3^5-1)/(3-1)=121/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [甲、乙两队进行篮球决赛，采取七场四胜制（当一队赢得四场胜利时，该队获胜，决赛结束）。根据前期比赛成绩，甲队的主客场安排依次为“主主客客主客主”。设甲队主场取胜的概率为 0.6，客场取胜的概率为 0.5，且各场比赛结果相互独立，则甲队以 $4:1$ 获胜的概率是#fill-placeholder()。],
  answers: ([$0.18$],),
  explanation: [甲队必须在前四场恰输一场，并赢下第五场。前四场有两主两客，按输主场或输客场分类，所求概率为
    $
      (2 times 0.4 times 0.6 times 0.5^2+2 times 0.5 times 0.5 times 0.6^2) times 0.6=0.18.
    $],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的左、右焦点分别为 $F_1,F_2$，过 $F_1$ 的直线与 $C$ 的两条渐近线分别交于 $A,B$ 两点。若 $arrow(F_1 A)=arrow(A B)$，$arrow(F_1 B) dot arrow(F_2 B)=0$，则 $C$ 的离心率为#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [设 $F_1(-c,0)$、$F_2(c,0)$。不妨设 $A(u,(b/a)u)$。由 $A$ 是 $F_1 B$ 的中点，得 $B(2u+c,(2b/a)u)$。
    $B$ 在另一渐近线 $y=-(b/a)x$ 上，故 $2u=-(2u+c)$，得 $u=-c/4$，于是 $B(c/2,-b c/(2a))$。
    由 $arrow(F_1 B) dot arrow(F_2 B)=0$ 得 $-3c^2/4+b^2 c^2/(4a^2)=0$，即 $b^2=3a^2$，因此 $e=sqrt(1+b^2/a^2)=2$。],
)

#section[解答题：共 70 分。第 17～21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，设 $(sin B-sin C)^2=sin^2 A-sin B sin C$。],
  parts: (
    subquestion(
      stem: [求 $A$。],
      answers: ([$pi/3$],),
      explanation: [由正弦定理，原式化为 $(b-c)^2=a^2-b c$，即 $b^2+c^2-a^2=b c$。故 $cos A=1/2$，由 $A in (0,pi)$ 得 $A=pi/3$。],
    ),
    subquestion(
      stem: [若 $sqrt(2)a+b=2c$，求 $sin C$。],
      answers: ([$(sqrt(6)+sqrt(2))/4$],),
      explanation: [由正弦定理及 $B=2pi/3-C$，得 $sqrt(2)sin(pi/3)+sin(2pi/3-C)=2sin C$，整理为
        $ sin(C-pi/6)=sqrt(2)/2. $
        ∵ $C-pi/6 in (-pi/6,pi/2)$，∴ $C-pi/6=pi/4$，故 $sin C=sin(5pi/12)=(sqrt(6)+sqrt(2))/4$。],
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
      explanation: [连接 $M E$。在 $triangle B B_1 C$ 中，$arrow(M E)=arrow(B_1 C)/2$；又 $arrow(N D)=arrow(A_1 D)/2$，且 $arrow(A_1 D)=arrow(B_1 C)$，故 $arrow(M E)=arrow(N D)$。
        所以四边形 $M N D E$ 为平行四边形，$M N parallel D E$。由 $D E subset$ 平面 $C_1 D E$，$M N subset.not$ 平面 $C_1 D E$，得 $M N parallel$ 平面 $C_1 D E$。
        #figure(prism-diagram(aux: true))],
    ),
    subquestion(
      stem: [求二面角 $A-M A_1-N$ 的正弦值。],
      answers: ([$sqrt(10)/5$],),
      explanation: [以 $A$ 为原点、$A B$ 所在直线为 $x$ 轴、底面内过 $A$ 且垂直于 $A B$ 的直线为 $y$ 轴、$A A_1$ 所在直线为 $z$ 轴，建立空间直角坐标系。则
        $ A(0,0,0), quad A_1(0,0,4), quad M(2,0,2), quad N(1/2,sqrt(3)/2,2). $
        平面 $A M A_1$ 的法向量可取 $bold(u)=(0,1,0)$。由 $arrow(M A_1)=(-2,0,2)$、$arrow(M N)=(-3/2,sqrt(3)/2,0)$，平面 $M A_1 N$ 的法向量可取 $bold(v)=(1,sqrt(3),1)$。
        设所求二面角为 $theta$，则 $|cos theta|=frac(|bold(u) dot bold(v)|, |bold(u)| |bold(v)|)=sqrt(3/5)$，故 $sin theta=sqrt(1-3/5)=sqrt(10)/5$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知抛物线 $C:y^2=3x$ 的焦点为 $F$，斜率为 $3/2$ 的直线 $l$ 与 $C$ 的交点为 $A,B$，与 $x$ 轴的交点为 $P$。],
  parts: (
    subquestion(
      stem: [若 $|A F|+|B F|=4$，求 $l$ 的方程。],
      answers: ([$12x-8y-7=0$],),
      explanation: [设 $l:x=2/3 y+t$。代入抛物线方程，得 $y^2-2y-3t=0$，故两交点纵坐标满足 $y_1+y_2=2$，从而 $x_1+x_2=4/3+2t$。
        由焦点到准线的距离关系，$|A F|+|B F|=x_1+x_2+3/2=4$，得 $t=7/12$。此时判别式 $4+12t=11>0$，故直线为 $12x-8y-7=0$。],
    ),
    subquestion(
      stem: [若 $arrow(A P)=3arrow(P B)$，求 $|A B|$。],
      answers: ([$4sqrt(13)/3$],),
      explanation: [沿用 $l:x=2/3 y+t$，有 $y_1+y_2=2$。由 $arrow(A P)=3arrow(P B)$ 得 $-y_1=3y_2$，于是 $y_1=3$、$y_2=-1$。
        故 $|A B|=sqrt(1+(2/3)^2)|y_1-y_2|=4sqrt(13)/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=sin x-ln(1+x)$，$f'(x)$ 为 $f(x)$ 的导数。证明：],
  parts: (
    subquestion(
      stem: [$f'(x)$ 在区间 $(-1,pi/2)$ 存在唯一极大值点。],
      answers: ([证明见解析。],),
      explanation: [令 $g(x)=f'(x)=cos x-1/(1+x)$，则 $g'(x)=-sin x+1/(1+x)^2$。
        在 $(-1,pi/2)$ 上，$-sin x$ 与 $1/(1+x)^2$ 均严格递减，故 $g'$ 严格递减。又 $g'(0)=1>0$，$g'(pi/2)=-1+4/(pi+2)^2<0$，所以 $g'$ 在 $(0,pi/2)$ 内有唯一零点 $x_0$。
        因此 $g$ 在 $(-1,x_0)$ 递增，在 $(x_0,pi/2)$ 递减，$x_0$ 是 $f'$ 在该区间内唯一的极大值点。],
    ),
    subquestion(
      stem: [$f(x)$ 有且仅有 2 个零点。],
      answers: ([证明见解析。],),
      explanation: [#step[确定 $(-1,pi/2]$ 内的零点][
          由第（1）问，$g$ 在 $(-1,x_0)$ 递增，且 $g(0)=0$。故 $f$ 在 $(-1,0)$ 递减，在 $(0,x_0)$ 递增，而 $f(0)=0$。
          $g$ 在 $(x_0,pi/2)$ 递减，$g(x_0)>0$、$g(pi/2)<0$，故存在唯一 $x_1 in (x_0,pi/2)$ 使 $g(x_1)=0$。于是 $f$ 在 $(0,x_1)$ 递增、在 $(x_1,pi/2)$ 递减。
          又 $f(pi/2)=1-ln(1+pi/2)>0$，所以 $f$ 在 $(0,pi/2]$ 始终为正。此段只有零点 $x=0$。]
        #step[确定其余区间的零点][
          在 $[pi/2,pi]$ 上，$f'(x)=cos x-1/(1+x)<0$，且 $f(pi/2)>0$、$f(pi)=-ln(1+pi)<0$，故存在唯一零点。
          当 $x>pi$ 时，$f(x)<=1-ln(1+x)<0$，不存在零点。
          综上，$f$ 有且仅有两个零点。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [为治疗某种疾病，研制了甲、乙两种新药，希望知道哪种新药更有效，为此进行动物试验。试验方案如下：每一轮选取两只白鼠对药效进行对比试验。对于两只白鼠，随机选一只施以甲药，另一只施以乙药。一轮的治疗结果得出后，再安排下一轮试验。当其中一种药治愈的白鼠比另一种药治愈的白鼠多 4 只时，就停止试验，并认为治愈只数多的药更有效。为了方便描述问题，约定：对于每轮试验，若施以甲药的白鼠治愈且施以乙药的白鼠未治愈，则甲药得 1 分，乙药得 $-1$ 分；若施以乙药的白鼠治愈且施以甲药的白鼠未治愈，则乙药得 1 分，甲药得 $-1$ 分；若都治愈或都未治愈，则两种药均得 0 分。甲、乙两种药的治愈率分别记为 $alpha$ 和 $beta$，一轮试验中甲药的得分记为 $X$。],
  parts: (
    subquestion(
      stem: [求 $X$ 的分布列。],
      answers: (
        [#table(
          columns: 4,
          align: center,
          [$X$], [$-1$], [$0$], [$1$],
          [$P$],
          [$(1-alpha)beta$],
          [$alpha beta+(1-alpha)(1-beta)$],
          [$alpha(1-beta)$],
        )],
      ),
      explanation: [$X$ 的取值为 $-1,0,1$。由两只白鼠的治疗结果相互独立，
        $ P(X=-1)=(1-alpha)beta, quad P(X=1)=alpha(1-beta), $
        $ P(X=0)=alpha beta+(1-alpha)(1-beta). $],
    ),
    subquestion(
      stem: [若甲药、乙药在试验开始时都赋予 4 分，$p_i$（$i=0,1,dots,8$）表示“甲药的累计得分为 $i$ 时，最终认为甲药比乙药更有效”的概率，则 $p_0=0$，$p_8=1$，$p_i=a p_(i-1)+b p_i+c p_(i+1)$（$i=1,2,dots,7$），其中 $a=P(X=-1)$，$b=P(X=0)$，$c=P(X=1)$。假设 $alpha=0.5$，$beta=0.8$。],
      parts: (
        subquestion(
          stem: [证明：${p_(i+1)-p_i}$（$i=0,1,2,dots,7$）为等比数列。],
          answers: ([证明见解析。],),
          explanation: [此时 $a=0.4$、$b=0.5$、$c=0.1$，递推式化为 $5p_i=4p_(i-1)+p_(i+1)$，即
            $ p_(i+1)-p_i=4(p_i-p_(i-1)). $
            若首项 $p_1-p_0=0$，则所有差均为 0，与 $p_8-p_0=1$ 矛盾。因此该数列是公比为 4 的等比数列。],
        ),
        subquestion(
          stem: [求 $p_4$，并根据 $p_4$ 的值解释这种试验方案的合理性。],
          answers: ([$p_4=1/257$，误判概率很小，方案合理。],),
          explanation: [由（i）得 $p_(i+1)-p_i=4^i p_1$，累加可得 $p_k=p_1 (4^k-1)/3$。又 $p_8=1$，故
            $ p_4=(4^4-1)/(4^8-1)=1/(4^4+1)=1/257 approx 0.0039. $
            在甲药治愈率为 $0.5$、乙药为 $0.8$ 时，该方案误判甲药更有效的概率仅约 $0.39%$，因而在此情形下方案合理。],
        ),
      ),
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
