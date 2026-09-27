#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, space-axes, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017上海.pdf",
  regions: ("上海",),
)

#let cuboid() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let D = (0, 0, 0)
  let A = (4, 0, 0)
  let B = (4, 3, 0)
  let C = (0, 3, 0)
  let D1 = (0, 0, 2)
  let A1 = (4, 0, 2)
  let B1 = (4, 3, 2)
  let C1 = (0, 3, 2)
  oblique-project((-0.4, -0.35), (0.9, 0), (0, 1), {
    line(A, B, C, C1, D1, A1, A)
    line(A1, B1, C1)
    line(B, B1)
    line(A, D, C, stroke: (dash: figure-style.dash))
    line(D, D1, stroke: (dash: figure-style.dash))
    space-axes((4, 3, 2), (5.2, 3.8, 2.8))
    for (p, label, anchor) in (
      (A, $A$, "east"),
      (B, $B$, "north"),
      (C, $C$, "north-west"),
      (D, $D$, "east"),
      (A1, $A_1$, "east"),
      (B1, $B_1$, "north-west"),
      (C1, $C_1$, "south-west"),
      (D1, $D_1$, "east"),
    ) {
      content(p, label, anchor: anchor, padding: 4pt)
    }
  })
})
#let lattice() = {
  set text(size: 9pt)
  cetz.canvas(length: 7mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    for x in range(8) { line((x, 0), (x, 5), stroke: (paint: gray)) }
    for y in range(6) { line((0, y), (7, y), stroke: (paint: gray)) }
    for (x, y) in ((1, 0), (0, 3), (4, 4), (7, 1)) {
      line(
        (x, y + 0.18),
        (x - 0.16, y - 0.09),
        (x + 0.16, y - 0.09),
        close: true,
        fill: black,
        stroke: none,
      )
    }
    for p in ((0, 4), (3, 2), (4, 2), (6, 5)) {
      circle(p, radius: 0.06, fill: black, stroke: none)
    }
    content((0, 4), $P_1$, anchor: "east", padding: 3pt)
    content((2.5, 2.45), $P_2$)
    content((4.5, 2.45), $P_3$)
    content((6, 5), $P_4$, anchor: "south", padding: 3pt)
  })
}
#let prism(auxiliary: false) = cetz.canvas(
  length: if auxiliary { 12mm } else { 14mm },
  {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let A = (0, 0, 0)
    let B = (-4, 0, 0)
    let C = (0, 2, 0)
    let A1 = (0, 0, 5)
    let B1 = (-4, 0, 5)
    let C1 = (0, 2, 5)
    let M = (-2, 1, 0)
    oblique-project((0.75, 0), (0.25, 0.4), (0, 0.75), {
      line(B, A, C, C1, A1, B1, B)
      line(B1, C1)
      line(A, A1)
      line(B, C, stroke: (dash: figure-style.dash))
      if auxiliary {
        line(A, M, A1, stroke: (dash: figure-style.dash))
        content(M, $M$, anchor: "south-east", padding: 4pt)
      }
      for (p, label, anchor) in (
        (A, $A$, "north"),
        (B, $B$, "north-east"),
        (C, $C$, "west"),
        (A1, $A_1$, "north-west"),
        (B1, $B_1$, "east"),
        (C1, $C_1$, "south"),
      ) {
        content(p, label, anchor: anchor, padding: 4pt)
      }
    })
  },
)
#let ellipse-auxiliary() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    shared-zero: $O$,
  ))
  plot.plot(
    size: (5.8, 3.2),
    axis-style: "school-book",
    x-min: -3.4,
    x-max: 2.4,
    y-min: -1.4,
    y-max: 1.8,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.annotate(resize: false, {
        let A = (0, 1)
        let P = (8 * calc.sqrt(5) / 9, -1 / 9)
        let M = (calc.sqrt(5) / 3, 0)
        let Q = (-4 * calc.sqrt(5) / 3, 1 / 3)
        let C = (-2 * calc.sqrt(5) / 3, 2 / 3)
        circle((0, 0), radius: (2, 1))
        line(Q, A, M)
        line(Q, P)
        for (p, label, anchor) in (
          (A, $A$, "south-west"),
          (P, $P$, "north-west"),
          (M, $M$, "south-west"),
          (Q, $Q$, "north"),
          (C, $C$, "south-east"),
        ) {
          content(p, label, anchor: anchor, padding: 4pt)
        }
      })
    },
  )
})

#section[填空题：共 12 题，满分 54 分，第 1～6 题每题 4 分，第 7～12 题每题 5 分。]
#question(
  "fill-in",
  score: 4,
  stem: [已知集合 $A={1,2,3,4}$，集合 $B={3,4,5}$，则 $A inter B=$#fill-placeholder()。],
  answers: ([${3,4}$],),
  explanation: [同时属于两个集合的元素为 $3,4$，所以 $A inter B={3,4}$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [若排列数 $P_6^m=6 times 5 times 4$，则 $m=$#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [由排列数公式，$P_6^m=6 times 5 times dots times (6-m+1)$，故 $P_6^3=6 times 5 times 4$，得到 $m=3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [不等式 $(x-1)/x>1$ 的解集为#fill-placeholder()。],
  answers: ([$(-infinity,0)$],),
  explanation: [原不等式等价于 $-1/x>0$，故 $x<0$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知球的体积为 $36pi$，则该球主视图的面积等于#fill-placeholder()。],
  answers: ([$9pi$],),
  explanation: [设球半径为 $r$，由 $4/3 pi r^3=36pi$ 得 $r=3$。主视图为半径 $3$ 的圆，其面积为 $pi r^2=9pi$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知复数 $z$ 满足 $z+3/z=0$，则 $abs(z)=$#fill-placeholder()。],
  answers: ([$sqrt(3)$],),
  explanation: [原式有意义，故 $z!=0$。两边乘以 $z$，得 $z^2=-3$，取模有 $abs(z)^2=3$，故 $abs(z)=sqrt(3)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设双曲线 $x^2/9-y^2/b^2=1$（$b>0$）的焦点为 $F_1,F_2$，$P$ 为该双曲线上的一点，若 $abs(P F_1)=5$，则 $abs(P F_2)=$#fill-placeholder()。],
  answers: ([$11$],),
  explanation: [双曲线的实半轴长为 $3$，故 $abs(abs(P F_2)-abs(P F_1))=6$。代入得 $abs(P F_2)=11$ 或 $-1$，舍去负值，答案为 $11$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，以长方体 $A B C D-A_1 B_1 C_1 D_1$ 的顶点 $D$ 为坐标原点，过 $D$ 的三条棱所在的直线为坐标轴，建立空间直角坐标系。若 $arrow(D B_1)$ 的坐标为 $(4,3,2)$，则 $arrow(A C_1)$ 的坐标是#fill-placeholder()。
    #figure(cuboid())],
  answers: ([$(-4,3,2)$],),
  explanation: [由图中的坐标轴方向，$A=(4,0,0)$、$C_1=(0,3,2)$，故 $arrow(A C_1)=C_1-A=(-4,3,2)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [定义在 $(0,+infinity)$ 上的函数 $y=f(x)$ 的反函数为 $y=f^(-1)(x)$，若 $g(x)=cases(3^x-1 quad &x<=0, f(x) quad &x>0)$ 为奇函数，则 $f^(-1)(x)=2$ 的解为#fill-placeholder()。],
  answers: ([$x=8/9$],),
  explanation: [对 $t>0$，$f(t)=g(t)=-g(-t)=1-3^(-t)$。由反函数的定义，$f^(-1)(x)=2$ 等价于 $x=f(2)=1-3^(-2)=8/9$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知四个函数：① $y=-x$；② $y=-1/x$；③ $y=x^3$；④ $y=x^(1/2)$。从中任选 2 个，则事件“所选 2 个函数的图象有且仅有一个公共点”的概率为#fill-placeholder()。],
  answers: ([$1/3$],),
  explanation: [共有 $C_4^2=6$ 种等可能的选择。逐一联立可得：①②有两个交点；①③、①④均只有交点 $(0,0)$；②③无交点，因为方程给出 $x^4=-1$；②④在共同定义域 $x>0$ 上一负一正，无交点；③④有交点 $(0,0),(1,1)$。
    因此符合条件的有两种，概率为 $2/6=1/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知数列 ${a_n}$ 和 ${b_n}$，其中 $a_n=n^2$（$n in NN^*$），${b_n}$ 的项是互不相等的正整数。若对于任意 $n in NN^*$，${b_n}$ 的第 $a_n$ 项都等于 ${a_n}$ 的第 $b_n$ 项，则 $(lg(b_1 b_4 b_9 b_16))/(lg(b_1 b_2 b_3 b_4))=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [题设即 $b_(n^2)=a_(b_n)=b_n^2$。取 $n=1,2,3,4$，相乘得 $b_1 b_4 b_9 b_16=(b_1 b_2 b_3 b_4)^2$。
    四个互不相等的正整数之积大于 $1$，对数分母非零。取对数可得所求比值为 $2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $alpha_1,alpha_2 in RR$，且 $1/(2+sin alpha_1)+1/(2+sin(2alpha_2))=2$，则 $abs(10pi-alpha_1-alpha_2)$ 的最小值等于#fill-placeholder()。],
  answers: ([$pi/4$],),
  explanation: [两个分式都不大于 $1$，它们的和等于 $2$，故必须同时等于 $1$，即 $sin alpha_1=sin(2alpha_2)=-1$。
    所以 $alpha_1=-pi/2+2k pi$、$alpha_2=-pi/4+l pi$，其中 $k,l in ZZ$。因此 $alpha_1+alpha_2=-3pi/4+m pi$，且 $m=2k+l$ 可以取任意整数。
    所求最小值为 $pi min_(m in ZZ) abs(43/4-m)=pi/4$，在 $m=11$ 时取得。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，用 35 个单位正方形拼成一个矩形，点 $P_1,P_2,P_3,P_4$ 以及四个标记为“▲”的点在正方形的顶点处。设集合 $Omega={P_1,P_2,P_3,P_4}$，点 $P in Omega$，过 $P$ 作直线 $l_P$，使得不在 $l_P$ 上的“▲”的点分布在 $l_P$ 的两侧。用 $D_1(l_P)$ 和 $D_2(l_P)$ 分别表示 $l_P$ 一侧和另一侧的“▲”的点到 $l_P$ 的距离之和。若过 $P$ 的直线 $l_P$ 中有且只有一条满足 $D_1(l_P)=D_2(l_P)$，则 $Omega$ 中所有这样的 $P$ 为#fill-placeholder()。
    #figure(lattice())],
  answers: ([$P_1,P_3,P_4$],),
  explanation: [以矩形左下角为原点、水平向右与竖直向上为坐标轴正方向，四个三角标记的坐标为 $(1,0),(0,3),(4,4),(7,1)$。四点坐标的平均值为 $G=(3,2)=P_2$。
    设直线为 $a x+b y+c=0$，其中 $a,b$ 不全为零。两侧距离和相等，当且仅当四点的有向距离之和为零，即
    $ (a(1+0+4+7)+b(0+3+4+1)+4c)/sqrt(a^2+b^2)=0, $
    也就是 $3a+2b+c=0$，等价于直线经过 $G$。
    四个标记不共线，故任何过 $G$ 的直线都不会使所有标记落在直线上；有向距离和为零又保证直线两侧都有标记，满足题设。
    因此过 $P_2$ 有无穷多条这样的直线，而过其他三个点各只有一条，即 $P_1 G,P_3 G,P_4 G$。答案为 $P_1,P_3,P_4$。],
)

#section[选择题：共 4 题，每题 5 分，共 20 分。每题有且只有一个正确选项。]
#question(
  "single-choice",
  score: 5,
  stem: [关于 $x,y$ 的二元一次方程组 $cases(x+5y=0, 2x+3y=4)$ 的系数行列式 $D$ 为#choice-placeholder()。],
  choices: (
    [$mat(delim: "|", 0, 5; 4, 3)$],
    [$mat(delim: "|", 1, 0; 2, 4)$],
    [$mat(delim: "|", 1, 5; 2, 3)$],
    [$mat(delim: "|", 6, 0; 5, 4)$],
  ),
  answers: ([C],),
  explanation: [按方程的顺序，将 $x,y$ 的系数分别排成两列，得系数行列式 $D=mat(delim: "|", 1, 5; 2, 3)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在数列 ${a_n}$ 中，$a_n=(-1/2)^n$（$n in NN^*$），则 $lim_(n->infinity) a_n$#choice-placeholder()。],
  choices: ([等于 $-1/2$], [等于 $0$], [等于 $1/2$], [不存在]),
  answers: ([B],),
  explanation: [由于 $abs(a_n)=(1/2)^n->0$，由夹逼可知 $a_n->0$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a,b,c$ 为实常数，数列 ${x_n}$ 的通项 $x_n=a n^2+b n+c$（$n in NN^*$），则“存在 $k in NN^*$，使得 $x_(100+k),x_(200+k),x_(300+k)$ 成等差数列”的一个必要条件是#choice-placeholder()。],
  choices: ([$a>=0$], [$b<=0$], [$c=0$], [$a-2b+c=0$]),
  answers: ([A],),
  explanation: [等差条件等价于 $x_(100+k)+x_(300+k)-2x_(200+k)=20000a=0$，即 $a=0$，因此必有 $a>=0$。
    当 $a=0,b=1,c=1$ 时，原条件成立，但 B、C、D 均不成立，所以只有 A 是必要条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，已知椭圆 $C_1:x^2/36+y^2/4=1$ 和 $C_2:x^2+y^2/9=1$。$P$ 为 $C_1$ 上的动点，$Q$ 为 $C_2$ 上的动点，$w$ 是 $arrow(O P)dot arrow(O Q)$ 的最大值。记 $Omega={(P,Q)|P "在" C_1 "上",Q "在" C_2 "上",arrow(O P)dot arrow(O Q)=w}$，则 $Omega$ 中#choice-placeholder()。],
  choices: (
    [元素个数为 $2$],
    [元素个数为 $4$],
    [元素个数为 $8$],
    [含有无穷个元素],
  ),
  answers: ([D],),
  explanation: [设 $P=(6cos u,2sin u)$、$Q=(cos v,3sin v)$，则
    $ arrow(O P)dot arrow(O Q)=6cos u cos v+6sin u sin v=6cos(u-v)<=6. $
    对任意 $u in [0,2pi)$，取 $v=u$ 均可达到最大值 $w=6$，且得到不同的点对 $(P,Q)$，所以 $Omega$ 有无穷多个元素。],
)

#section[解答题：共 5 题，共 76 分。解答应写出必要的步骤。]
#question(
  "solution",
  score: 14,
  stem: [如图，直三棱柱 $A B C-A_1 B_1 C_1$ 的底面为直角三角形，两直角边 $A B$ 和 $A C$ 的长分别为 $4$ 和 $2$，侧棱 $A A_1$ 的长为 $5$。
    #figure(prism())],
  parts: (
    subquestion(
      stem: [求三棱柱 $A B C-A_1 B_1 C_1$ 的体积。],
      answers: ([$20$],),
      explanation: [底面积 $S_(triangle A B C)=1/2 times 4 times 2=4$，直棱柱的高为 $5$，故体积为 $V=4 times 5=20$。],
    ),
    subquestion(
      stem: [设 $M$ 是 $B C$ 中点，求直线 $A_1 M$ 与平面 $A B C$ 所成角的大小。],
      answers: ([$arctan sqrt(5)$],),
      explanation: [直棱柱中 $A_1 A perp$ 平面 $A B C$，所以 $A M$ 为 $A_1 M$ 在底面内的射影，所求角为 $angle A_1 M A$。
        由直角三角形斜边中线性质，$A M=B C/2=sqrt(4^2+2^2)/2=sqrt(5)$，故 $tan angle A_1 M A=(A A_1)/(A M)=5/sqrt(5)=sqrt(5)$。
        因而所求角为 $arctan sqrt(5)$。
        #figure(prism(auxiliary: true))],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知函数 $f(x)=cos^2 x-sin^2 x+1/2$，$x in (0,pi)$。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的单调递增区间。],
      answers: ([$[pi/2,pi)$],),
      explanation: [$f(x)=cos 2x+1/2$。当 $x in (0,pi)$ 时，$2x in (0,2pi)$，余弦在 $[pi,2pi)$ 上递增，故 $f$ 的单调递增区间为 $[pi/2,pi)$。],
    ),
    subquestion(
      stem: [设 $triangle A B C$ 为锐角三角形，角 $A$ 所对边 $a=sqrt(19)$，角 $B$ 所对边 $b=5$。若 $f(A)=0$，求 $triangle A B C$ 的面积。],
      answers: ([$15sqrt(3)/4$],),
      explanation: [由 $cos 2A=-1/2$ 且 $0<A<pi/2$，得 $A=pi/3$。设 $c=A B$，由余弦定理，$19=25+c^2-5c$，即 $(c-2)(c-3)=0$。
        若 $c=2$，则 $cos B=(19+4-25)/(2sqrt(19) times 2)<0$，与锐角三角形矛盾，故 $c=3$。此时三边平方满足 $25<19+9$，确为锐角三角形。
        所以 $S_(triangle A B C)=1/2 b c sin A=1/2 times 5 times 3 times sqrt(3)/2=15sqrt(3)/4$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [根据预测，某地第 $n$（$n in NN^*$）个月共享单车的投放量和损失量分别为 $a_n$ 和 $b_n$（单位：辆），其中 $a_n=cases(5n^4+15 quad &1<=n<=3, -10n+470 quad &n>=4)$，$b_n=n+5$。第 $n$ 个月底的共享单车的保有量是前 $n$ 个月的累计投放量与累计损失量的差。],
  parts: (
    subquestion(
      stem: [求该地区第 4 个月底的共享单车的保有量。],
      answers: ([$935$ 辆],),
      explanation: [前四个月的投放量分别为 $20,95,420,430$，损失量分别为 $6,7,8,9$，因此第 4 个月底的保有量为 $20+95+420+430-(6+7+8+9)=935$（辆）。],
    ),
    subquestion(
      stem: [已知该地共享单车停放点第 $n$ 个月底的单车容纳量 $S_n=-4(n-46)^2+8800$（单位：辆）。设在某月底，共享单车保有量达到最大，问该保有量是否超出了此时停放点的单车容纳量？],
      answers: (
        [超出。第 $42$ 个月底保有量最大，为 $8782$ 辆，比当时容纳量多 $46$ 辆。],
      ),
      explanation: [设第 $n$ 个月底的保有量为 $T_n$。前三个月的净增加量分别为 $14,88,412$，均为正，且 $T_3=514$。
        当 $n>=4$ 时，第 $n$ 个月的净增加量为 $a_n-b_n=465-11n$。它在 $4<=n<=42$ 时为正，在 $n>=43$ 时为负，故保有量在第 $42$ 个月底达到最大。
        利用等差数列求和，
        $ T_42=514+sum_(n=4)^42 (465-11n)=514+(421+3)times 39/2=8782. $
        此时停放点容量为 $S_42=-4(42-46)^2+8800=8736$（辆），$8782-8736=46$（辆），所以最大保有量超出容量 $46$ 辆。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [在平面直角坐标系 $x O y$ 中，已知椭圆 $Gamma:x^2/4+y^2=1$，$A$ 为 $Gamma$ 的上顶点，$P$ 为 $Gamma$ 上异于上、下顶点的动点，$M$ 为 $x$ 轴正半轴上的动点。],
  parts: (
    subquestion(
      stem: [若 $P$ 在第一象限，且 $abs(O P)=sqrt(2)$，求 $P$ 的坐标。],
      answers: ([$(2sqrt(3)/3,sqrt(6)/3)$],),
      explanation: [设 $P=(x,y)$，其中 $x,y>0$。由 $x^2+y^2=2$、$x^2/4+y^2=1$，相减得 $x^2=4/3$，再得 $y^2=2/3$。结合第一象限条件，$P=(2sqrt(3)/3,sqrt(6)/3)$。],
    ),
    subquestion(
      stem: [设 $P=(8/5,3/5)$，若以 $A,P,M$ 为顶点的三角形是直角三角形，求 $M$ 的横坐标。],
      answers: ([$3/5,1,29/20$],),
      explanation: [设 $M=(t,0)$，其中 $t>0$，而 $A=(0,1)$。按直角所在顶点分类。
        若直角在 $A$，则 $arrow(A P)dot arrow(A M)=8/5 t+2/5=0$，得 $t=-1/4$，不符合条件。
        若直角在 $P$，则 $arrow(P A)dot arrow(P M)=-8/5 (t-8/5)-6/25=0$，得 $t=29/20$。
        若直角在 $M$，则 $arrow(M A)dot arrow(M P)=t^2-8/5 t+3/5=0$，得 $(5t-3)(t-1)=0$，即 $t=3/5$ 或 $1$。
        三个正值均构成非退化直角三角形，故所求横坐标为 $3/5,1,29/20$。],
    ),
    subquestion(
      stem: [若 $abs(M A)=abs(M P)$，直线 $A Q$ 与 $Gamma$ 交于另一点 $C$，且 $arrow(A Q)=2arrow(A C)$，$arrow(P Q)=4arrow(P M)$，求直线 $A Q$ 的方程。],
      answers: ([$y=sqrt(5)/10 x+1$],),
      explanation: [
        #step[用点的坐标表示各条件][设 $P=(u,v)$、$M=(m,0)$，其中 $u!=0,m>0$，且 $u^2/4+v^2=1$。
          由 $M A=M P$，得 $m^2+1=(m-u)^2+v^2$。代入椭圆方程后为 $2m u=3u^2/4$，所以 $m=3u/8$，且 $u>0$。
          由 $arrow(P Q)=4arrow(P M)$，得 $Q=(4m-3u,-3v)=(-3u/2,-3v)$。又由 $arrow(A Q)=2arrow(A C)$，$C$ 为 $A Q$ 的中点，故 $C=(-3u/4,(1-3v)/2)$。
        ]
        #step[利用另一交点仍在椭圆上][将 $C$ 代入椭圆方程，得 $9u^2/64+(1-3v)^2/4=1$。结合 $u^2=4(1-v^2)$，整理为
          $ 9v^2-8v-1=(9v+1)(v-1)=0. $
          $v=1$ 对应上顶点，与题设矛盾，故 $v=-1/9$。又 $u>0$，所以 $u=8sqrt(5)/9$，从而 $Q=(-4sqrt(5)/3,1/3)$。
          直线经过 $A=(0,1)$，斜率为 $(1/3-1)/(-4sqrt(5)/3)=sqrt(5)/10$，所以 $A Q:y=sqrt(5)/10 x+1$。
          此时 $M=(sqrt(5)/3,0)$ 在正半轴上，$C=(-2sqrt(5)/3,2/3)$ 与 $A$ 不同，各条件均满足。
          #figure(ellipse-auxiliary())
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [设定义在 $RR$ 上的函数 $f(x)$ 满足：对于任意的 $x_1,x_2 in RR$，当 $x_1<x_2$ 时，都有 $f(x_1)<=f(x_2)$。],
  parts: (
    subquestion(
      stem: [若 $f(x)=a x^3+1$，求 $a$ 的取值范围。],
      answers: ([$[0,+infinity)$],),
      explanation: [由 $f(0)<=f(1)$，得 $1<=a+1$，故 $a>=0$。反之，$x^3$ 严格递增，当 $a>=0$ 时，$a x^3+1$ 满足题设，故范围为 $[0,+infinity)$。],
    ),
    subquestion(
      stem: [若 $f(x)$ 是周期函数，证明：$f(x)$ 是常值函数。],
      answers: ([证明见解析。],),
      explanation: [设 $T>0$ 为 $f$ 的一个周期。任取 $u<v$，可取正整数 $n$ 使 $u+n T>=v$。由单调性与周期性，
        $ f(u)<=f(v)<=f(u+n T)=f(u). $
        因而 $f(u)=f(v)$。由于 $u,v$ 任意，$f$ 为常值函数。],
    ),
    subquestion(
      stem: [设 $f(x)$ 恒大于零，$g(x)$ 是定义在 $RR$ 上的、恒大于零的周期函数，$M$ 是 $g(x)$ 的最大值。函数 $h(x)=f(x)g(x)$。证明：“$h(x)$ 是周期函数”的充要条件是“$f(x)$ 是常值函数”。],
      answers: ([证明见解析。],),
      explanation: [
        #step[充分性][若 $f(x)=c>0$，设 $S>0$ 是 $g$ 的一个周期，则 $h(x+S)=c g(x+S)=c g(x)=h(x)$，所以 $h$ 为周期函数。
        ]
        #step[必要性：先证明左侧为常值][设 $T>0$ 是 $h$ 的一个周期，$S>0$ 是 $g$ 的一个周期。取 $r$ 使 $g(r)=M$，并记 $c=f(r)>0$。
          对任意正整数 $n$，由周期性，
          $ f(r-n T)g(r-n T)=h(r-n T)=h(r)=c M. $
          又 $0<f(r-n T)<=c$、$0<g(r-n T)<=M$，因此 $f(r-n T)=c$。
          任取 $x<=r$，选 $n$ 足够大使 $r-n T<=x$，由单调性得 $c=f(r-n T)<=f(x)<=f(r)=c$，故 $f(x)=c$。
        ]
        #step[必要性：扩展到全体实数][对任意 $x in RR$，取正整数 $k$ 使 $x-k T<=r$，便有
          $ h(x)=h(x-k T)=c g(x-k T)<=c M. $
          而对任意正整数 $n$，$g(r+n S)=M$，所以 $f(r+n S)M=h(r+n S)<=c M$，即 $f(r+n S)<=c$。由单调性又有 $f(r+n S)>=f(r)=c$，故等号成立。
          对任意 $x>r$，选 $n$ 使 $r+n S>=x$，再由 $c=f(r)<=f(x)<=f(r+n S)=c$，得 $f(x)=c$。
          结合左侧已证结论，$f$ 在 $RR$ 上恒等于 $c$，必要性得证。
        ]
      ],
    ),
  ),
)
