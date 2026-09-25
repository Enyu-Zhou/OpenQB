#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2022/2022上海.pdf",
  regions: ("上海",),
)

#let cube-diagram() = cetz.canvas(length: 28mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (1, 0, 0)
  let c = (1, 1, 0)
  let d = (0, 1, 0)
  let a1 = (0, 0, 1)
  let b1 = (1, 0, 1)
  let c1 = (1, 1, 1)
  let d1 = (0, 1, 1)
  let p = (0.5, 0, 0)
  let q = (1, 0.5, 0)
  let r = (1, 0, 0.5)
  let s = (0.5, 1, 0)
  oblique-project((1, 0), (0.38, 0.3), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(a1, s, stroke: (dash: figure-style.dash))
    line(b1, d, stroke: (dash: figure-style.dash))
    for v in (p, q, r, s) {
      circle(v, radius: 0.015, fill: black, stroke: none)
    }
    for (v, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "south-east"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
      (p, $P$, "north"),
      (q, $Q$, "north-west"),
      (r, $R$, "west"),
      (s, $S$, "north"),
    ) { content(v, label, anchor: anchor, padding: 0.06) }
  })
})

#let pyramid-diagram() = cetz.canvas(length: 24mm, {
  import cetz.draw: *
  let a = (-1, 0, 0)
  let c = (1, 0, 0)
  let b = (0, calc.sqrt(3), 0)
  let o = (0, 0, 0)
  let p = (0, 0, calc.sqrt(3))
  let m = (0.5, calc.sqrt(3) / 2, 0)
  oblique-project((1, 0), (-0.2, -0.3), (0, 0.72), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, p, a)
    line(p, b)
    line(a, c, stroke: (dash: figure-style.dash))
    line(p, o, stroke: (dash: figure-style.dash))
    for (v, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (p, $P$, "south"),
      (o, $O$, "south-west"),
      (m, $M$, "north-west"),
    ) { content(v, label, anchor: anchor, padding: 0.07) }
  })
})

#let pentagon-diagram() = cetz.canvas(length: 2.5mm, {
  import cetz.draw: *
  let a = (-10, 0)
  let b = (10, 0)
  let c = (13, 3 * calc.sqrt(3))
  let d = (-13, 3 * calc.sqrt(3))
  let o = (0, 0)
  let m = (0, 14)
  let p = (14 * calc.cos(52deg), 14 * calc.sin(52deg))
  let q = (-p.at(0), p.at(1))
  let beta = calc.asin(3 * calc.sqrt(3) / 14)
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  line(d, a, b, c)
  line(
    ..range(101).map(i => {
      let t = beta + (180deg - 2 * beta) * i / 100
      (14 * calc.cos(t), 14 * calc.sin(t))
    }),
  )
  line(c, p, m, q, d, stroke: (dash: figure-style.dash))
  line(d, c, stroke: (dash: figure-style.dash))
  line(o, m, stroke: (dash: figure-style.dash))
  for (v, label, anchor) in (
    (a, $A$, "north"),
    (b, $B$, "north"),
    (c, $C$, "west"),
    (d, $D$, "east"),
    (o, $O$, "north"),
    (m, $M$, "south"),
    (p, $P$, "south-west"),
    (q, $Q$, "south-east"),
  ) { content(v, label, anchor: anchor, padding: 0.55) }
})

#section[填空题。本大题共 12 题，满分 54 分，第 1～6 题每题 4 分，第 7～12 题每题 5 分。]
#question(
  "fill-in",
  score: 4,
  stem: [若复数 $z=1+i$（其中 $i$ 为虚数单位），则 $2 overline(z)=$#fill-placeholder()。],
  answers: ([$2-2i$],),
  explanation: [$overline(z)=1-i$，故 $2 overline(z)=2-2i$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [双曲线 $x^2/9-y^2=1$ 的实轴长为#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [$a^2=9$，$a=3$，故实轴长为 $2a=6$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [函数 $y=cos^2 x-sin^2 x+1$ 的最小正周期为#fill-placeholder()。],
  answers: ([$pi$],),
  explanation: [$y=cos 2x+1$，最小正周期为 $2pi/2=pi$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设 $a$ 为常数，若行列式 $mat(delim: "|", a, 1; 3, 2)$ 的值与行列式 $mat(delim: "|", a, 0; 4, 1)$ 的值相等，则 $a=$#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [两行列式的值分别为 $2a-3$ 和 $a$，故 $2a-3=a$，解得 $a=3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [若圆柱的高为 4，底面积为 $9pi$，则该圆柱的侧面积为#fill-placeholder()。],
  answers: ([$24pi$],),
  explanation: [由 $pi r^2=9pi$ 得底面半径 $r=3$，故侧面积为 $2pi r h=2pi times 3 times 4=24pi$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [若实数 $x,y$ 满足 $x-y<=0$，$x+y-1>=0$，则 $z=x+2y$ 的最小值为#fill-placeholder()。],
  answers: ([$3/2$],),
  explanation: [$x+2y=3/2(x+y)-1/2(x-y)>=3/2$，当 $x=y=1/2$ 时等号成立。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $(3+x)^n$ 的二项展开式中，若 $x^2$ 的系数是常数项的 5 倍，则 $n=$#fill-placeholder()。],
  answers: ([$10$],),
  explanation: [由 $upright(C)_n^2 3^(n-2)=5 times 3^n$ 得 $n(n-1)=90$。∵ $n$ 为正整数，∴ $n=10$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $a$ 为常数，若函数 $f(x)=cases(a^2 x-1 & quad x<0, x+a & quad x>0, 0 & quad x=0)$ 为奇函数，则实数 $a=$#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [当 $x>0$ 时，$f(-x)=-a^2 x-1=-f(x)=-x-a$，故 $a^2=1$ 且 $a=1$。反之，$a=1$ 时正、负两支满足奇函数关系，且 $f(0)=0$，符合条件。],
)
#question(
  "fill-in",
  score: 5,
  stem: [为了检测学生的身体素质指标，需从游泳类 1 项、球类 3 项、田径类 4 项，共 8 项项目中随机抽取 4 项进行测试，每一类都被抽到的概率为#fill-placeholder()。（结果用最简分数表示）],
  answers: ([$3/7$],),
  explanation: [游泳项目必须抽到，其余 3 项只能按“球类 1 项、田径类 2 项”或“球类 2 项、田径类 1 项”分配。故概率为
    $
      (upright(C)_3^1 upright(C)_4^2+upright(C)_3^2 upright(C)_4^1)/(upright(C)_8^4)=(18+12)/70=3/7.
    $
  ],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知等差数列 ${a_n}$ 的公差不为零，$S_n$ 为其前 $n$ 项和。若 $S_5=0$，则 $S_1,S_2,dots.c,S_100$ 这 100 个数中所有不同数值的个数为#fill-placeholder()。],
  answers: ([$98$],),
  explanation: [设公差为 $d!=0$。由 $S_5=5(a_1+2d)=0$ 得 $a_1=-2d$，故 $S_n=d/2 n(n-5)$。对于不同正整数 $m,n$，$S_m=S_n$ 等价于 $(m-n)(m+n-5)=0$，即 $m+n=5$。因此仅有 $S_1=S_4$、$S_2=S_3$ 两组重复，故不同数值共有 $100-2=98$ 个。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知平面非零向量 $bold(a),bold(b),bold(c)$ 的模均为 $lambda$，若 $bold(a) dot bold(b)=0$，$bold(a) dot bold(c)=2$，$bold(b) dot bold(c)=1$，则 $lambda=$#fill-placeholder()。],
  answers: ([$root(4, 5)$],),
  explanation: [以互相垂直的 $bold(a),bold(b)$ 的方向为坐标轴方向，可设 $bold(a)=(lambda,0)$，$bold(b)=(0,lambda)$。由内积条件得 $bold(c)=(2/lambda,1/lambda)$，故 $lambda^2=4/lambda^2+1/lambda^2$，即 $lambda^4=5$。∵ $lambda>0$，∴ $lambda=root(4, 5)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设函数 $y=f(x)$ 的定义域为 $[0,+infinity)$，值域为 $A$，且对定义域中任意实数 $x$ 均成立 $f(x)=f(1/(x+1))$。若 ${y | y=f(x),x in [0,a]}=A$，则实数 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$[(sqrt(5)-1)/2,+infinity)$],),
  explanation: [
    本题按“保证任意满足条件的函数都能在该区间取遍值域”理解。
    记 $alpha=(sqrt(5)-1)/2$，则 $1/(1+alpha)=alpha$。
    若 $a>=alpha$，对于 $x<=alpha$，已有 $x in [0,a]$；对于 $x>alpha$，有 $0<1/(1+x)<alpha<=a$，且对应函数值相同。因此 $[0,a]$ 能取遍值域。
    若 $0<=a<alpha$，取 $f(alpha)=1$，其余点处 $f(x)=0$。由于 $1/(1+x)=alpha$ 当且仅当 $x=alpha$，该函数满足题设，但在 $[0,a]$ 上取不到 1。故不能保证取遍值域。
    ∴ 所求范围为 $[alpha,+infinity)$。若只针对某个特定函数，范围可能更大，例如常函数在任意 $a>=0$ 时均满足要求。
  ],
)

#section[选择题。本大题共 4 题，每题 5 分，共 20 分。每题有且只有一个正确选项。]
#question(
  "single-choice",
  score: 5,
  stem: [若集合 $A=[-1,2)$，$B=ZZ$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${-2,-1,0,1}$], [${-1,0,1}$], [${-1,0}$], [${-1}$]),
  answers: ([B],),
  explanation: [区间 $[-1,2)$ 中的整数为 $-1,0,1$，故交集为 ${-1,0,1}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若实数 $a,b$ 满足 $a>b>0$，则下列不等式中，恒成立的是#choice-placeholder()。],
  choices: (
    [$a+b>2 sqrt(a b)$],
    [$a+b<2 sqrt(a b)$],
    [$a/2+2b>2 sqrt(a b)$],
    [$a/2+2b<2 sqrt(a b)$],
  ),
  answers: ([A],),
  explanation: [∵ $a>b>0$，∴ $a+b-2 sqrt(a b)=(sqrt(a)-sqrt(b))^2>0$，A 恒成立，B 不成立。又 $a/2+2b>=2 sqrt(a b)$，当 $a=4b$ 时等号成立，此时仍满足 $a>b>0$，故 C、D 均不恒成立。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，在正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$P,Q,R,S$ 分别为棱 $A B,B C,B B_1,C D$ 的中点，连接 $A_1 S,B_1 D$。对于空间任意两点 $M,N$，若线段 $M N$ 上不存在也在线段 $A_1 S,B_1 D$ 上的点，则称 $M,N$ 两点“可视”。下列选项中与点 $D_1$ “可视”的点为#choice-placeholder()。
    #figure(cube-diagram())
  ],
  choices: ([点 $P$], [点 $B$], [点 $R$], [点 $Q$]),
  answers: ([D],),
  explanation: [
    #step[排除 $P,B,R$][
      四边形 $A_1 D_1 S P$ 为平行四边形，其对角线 $A_1 S$ 与 $D_1 P$ 相交，故 $P$ 不可视。
      矩形 $D_1 B_1 B D$ 的对角线 $D_1 B$ 与 $B_1 D$ 相交，故 $B$ 不可视。
      在同一矩形中，$R$ 在边 $B B_1$ 的内部，线段 $D_1 R$ 也与对角线 $D B_1$ 相交，故 $R$ 不可视。
    ]
    #step[验证 $Q$][
      $Q$ 不在平面 $A_1 D_1 S P$ 内，而 $D_1$ 在该平面内但不在 $A_1 S$ 上，故线段 $D_1 Q$ 与 $A_1 S$ 不相交。
      同理，$Q$ 不在平面 $D_1 B_1 B D$ 内，$D_1$ 不在 $B_1 D$ 上，故 $D_1 Q$ 与 $B_1 D$ 不相交。因此 $Q$ 可视。
    ]
  ],
)
#question(
  "single-choice",
  score: 5,
  stem: [在平面直角坐标系中，设点集 $Omega={(x,y) | (x-k)^2+(y-k^2)^2=4|k|,k in ZZ}$，有结论：
    #parbreak()
    ① 存在直线 $l$，使得 $Omega$ 中不存在点在 $l$ 上，但存在点在 $l$ 两侧；
    #parbreak()
    ② 存在直线 $l$，使得 $Omega$ 中存在无数个点在 $l$ 上。
    #parbreak()
    关于以上两个结论，正确的判断是#choice-placeholder()。
  ],
  choices: (
    [① 成立，② 成立],
    [① 成立，② 不成立],
    [① 不成立，② 成立],
    [① 不成立，② 不成立],
  ),
  answers: ([B],),
  explanation: [
    当 $k!=0$ 时，对应圆的圆心为 $(k,k^2)$，半径为 $2 sqrt(|k|)$；$k=0$ 时只有原点。
    #step[结论①][
      取 $l:y=41/2$。若 $|k|<=4$，圆上点的纵坐标不超过 $k^2+2 sqrt(|k|)<=20$；若 $|k|>=5$，纵坐标不小于 $k^2-2 sqrt(|k|)>=25-2 sqrt(5)>41/2$。这里 $t^2-2 sqrt(t)$ 在 $t>=5$ 上严格递增。
      因此没有圆与 $l$ 相交，且两侧均有 $Omega$ 中的点，① 成立。
    ]
    #step[结论②][
      对任意竖直直线 $x=c$，圆心到直线的距离为 $|k-c|$，当 $|k|$ 充分大时，该距离大于 $2 sqrt(|k|)$。
      对任意非竖直直线 $y=u x+v$，圆心到直线的距离为 $(|k^2-u k-v|)/sqrt(1+u^2)$；当 $|k|$ 趋于无穷时，其与半径 $2 sqrt(|k|)$ 的比值趋于无穷。
      故任一直线都只可能与有限个圆相交，每个圆至多贡献两个交点，再加可能的原点，总交点数仍有限。② 不成立。
    ]
  ],
)

#section[解答题。本大题共 5 题，共 76 分。]
#question(
  "solution",
  score: 14,
  stem: [如图，已知三棱锥 $P-A B C$，底面 $A B C$ 为等边三角形，$O$ 为 $A C$ 的中点，$A P=A C=2$，且 $P O perp$ 底面 $A B C$。
    #figure(pyramid-diagram())
  ],
  parts: (
    subquestion(
      stem: [求三棱锥 $P-A B C$ 的体积 $V$。],
      answers: ([$V=1$],),
      explanation: [∵ $A O=1$，$P O perp A O$，∴ $P O=sqrt(A P^2-A O^2)=sqrt(3)$。底面面积为 $S_(triangle A B C)=sqrt(3)/4 times 2^2=sqrt(3)$，故 $V=1/3 times sqrt(3) times sqrt(3)=1$。],
    ),
    subquestion(
      stem: [若 $M$ 为 $B C$ 的中点，求 $P M$ 与平面 $P A C$ 所成角的大小。],
      answers: ([$arcsin(sqrt(3)/4)$],),
      explanation: [
        取 $N$ 为 $O C$ 中点，则 $M N parallel B O$，$M N=(B O)/2=sqrt(3)/2$。
        等边三角形中 $B O perp A C$，又 $B O perp P O$，故 $B O perp$ 平面 $P A C$。因此 $N$ 为 $M$ 在平面 $P A C$ 上的射影。
        $O M=(A B)/2=1$，且 $P O perp O M$，故 $P M=sqrt(P O^2+O M^2)=2$。
        设所求角为 $theta$，则 $sin theta=(M N)/(P M)=sqrt(3)/4$，故 $theta=arcsin(sqrt(3)/4)$。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设 $a$ 为常数，$f(x)=log_3(a+x)+log_3(6-x)$。],
  parts: (
    subquestion(
      stem: [若将函数 $y=f(x)$ 的图象向下移 $m$（$m>0$）个单位后，其图象经过 $(3,0),(5,0)$ 两点，求实数 $a$ 和 $m$ 的值。],
      answers: ([$a=-2$，$m=1$。],),
      explanation: [由题意，$f(3)=f(5)=m$，且 $a>-3$。故 $3(a+3)=a+5$，得 $a=-2$，再代入得 $m=log_3 3=1$，满足 $m>0$。],
    ),
    subquestion(
      stem: [若 $a>-3$ 且 $a!=0$，解不等式 $f(x)<=f(6-x)$。],
      answers: (
        [当 $-3<a<0$ 时，解集为 $(-a,3]$；当 $a>0$ 时，解集为 $[3,6)$。],
      ),
      explanation: [
        两端均有定义要求 $-a<x<6$，且 $0<x<a+6$。
        在此范围内，由对数函数的单调性，不等式等价于
        $ (a+x)(6-x)<=x(a+6-x), quad a(x-3)>=0. $
        若 $-3<a<0$，则 $x<=3$，与定义范围取交集得 $-a<x<=3$。
        若 $a>0$，则 $x>=3$，与定义范围取交集得 $3<=x<6$。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，$A D=B C=6$，$A B=20$，$angle D A B=angle A B C=120 degree$，$O$ 为 $A B$ 中点。曲线 $C D$ 上任意一点到点 $O$ 的距离均相等，$P,M,Q$ 为曲线 $C D$ 上的点，且 $M O perp A B$，点 $P$ 与点 $Q$ 关于直线 $O M$ 对称。
    #figure(pentagon-diagram())
  ],
  parts: (
    subquestion(
      stem: [若点 $P$ 与点 $C$ 重合，求 $angle P O B$ 的大小。],
      answers: ([$arcsin(3 sqrt(3)/14)$],),
      explanation: [由余弦定理，$O C^2=10^2+6^2-2 times 10 times 6 cos 120 degree=196$，故 $O C=14$。由正弦定理，$sin angle C O B=(6 sin 120 degree)/14=3 sqrt(3)/14$。又 $angle C O B$ 为锐角，故所求角为 $arcsin(3 sqrt(3)/14)$。],
    ),
    subquestion(
      stem: [点 $P$ 在何位置时，五边形 $M Q A B P$ 的面积 $S$ 取到最大值？并求出该最大值。],
      answers: (
        [如图，当 $P$ 在弧 $C M$ 上且 $tan angle P O M=7/5$ 时，$S$ 取得最大值 $28 sqrt(74)$。],
      ),
      explanation: [
        设 $alpha=angle P O M$，则 $O P=O Q=O M=14$，且 $angle B O P=pi/2-alpha$。
        由对称性，
        $
          S=2(S_(triangle B O P)+S_(triangle P O M))=140 cos alpha+196 sin alpha.
        $
        由柯西不等式，$S<=sqrt(140^2+196^2)=28 sqrt(74)$，等号当且仅当 $tan alpha=196/140=7/5$ 时成立。
        此时 $cos alpha=5/sqrt(74)>3 sqrt(3)/14=cos angle C O M$，故 $0<alpha<angle C O M$，点 $P$ 确在弧 $C M$ 内，最大值可取得。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [设椭圆 $Gamma:x^2/a^2+y^2/b^2=1$（$a>b>0$），$F_1(-sqrt(2),0)$，$F_2(sqrt(2),0)$ 为 $Gamma$ 的焦点，$A$ 为 $Gamma$ 的下顶点，$M$ 为直线 $l:x+y-4 sqrt(2)=0$ 上一点。],
  parts: (
    subquestion(
      stem: [若 $a=2$，且 $A M$ 的中点在 $x$ 轴上，求点 $M$ 的坐标。],
      answers: ([$M=(3 sqrt(2),sqrt(2))$],),
      explanation: [$b^2=a^2-2=2$，故 $A=(0,-sqrt(2))$。由中点纵坐标为 0 得 $y_M=sqrt(2)$，代入 $l$ 得 $x_M=3 sqrt(2)$。],
    ),
    subquestion(
      stem: [若直线 $l$ 与 $y$ 轴的交点为 $B$，直线 $A M$ 经过点 $F_2$，且在 $triangle A B M$ 中有一内角的余弦值为 $3/5$，求 $b$ 的值。],
      answers: ([$b=3 sqrt(2)/4$ 或 $b=sqrt(2)/7$。],),
      explanation: [
        $A=(0,-b)$，$B=(0,4 sqrt(2))$。直线 $A F_2$ 斜率为 $b/sqrt(2)>0$，与 $l$ 的交点 $M$ 在 $B$ 的右下方、$A$ 的右上方，故 $angle A B M=pi/4$。
        记 $alpha=angle B A M$，则 $0<alpha<pi/2$，$tan alpha=sqrt(2)/b$。
        若 $cos alpha=3/5$，则 $tan alpha=4/3$，得 $b=3 sqrt(2)/4$。
        若 $cos angle B M A=3/5$，则该角为锐角，正弦为 $4/5$，从而
        $ cos alpha=-cos(pi/4+angle B M A)=sqrt(2)/10, $
        $ sin alpha=sin(pi/4+angle B M A)=7 sqrt(2)/10. $
        故 $tan alpha=7$，得 $b=sqrt(2)/7$。两种情形均满足题意。
      ],
    ),
    subquestion(
      stem: [若 $Gamma$ 上一点 $P$ 到 $l$ 的距离为 $d$，且 $|P F_1|+|P F_2|+d=6$，求 $d$ 的最小值。],
      answers: ([$8/3$],),
      explanation: [
        #step[将存在条件化为关于 $a$ 的不等式][
          由椭圆定义，$d=6-2a>=0$，故 $sqrt(2)<a<=3$，且 $b^2=a^2-2$。
          设 $P=(a cos t,b sin t)$，则 $|x_P+y_P|<=sqrt(a^2+b^2)=sqrt(2a^2-2)<=4<4 sqrt(2)$，故椭圆全部在 $l$ 的左下方。
          ∴ $d=4-(a cos t+b sin t)/sqrt(2)$。与 $d=6-2a$ 联立得
          $ a cos t+b sin t=2 sqrt(2)(a-1). $
          左侧的取值范围为 $[-sqrt(2a^2-2),sqrt(2a^2-2)]$，故存在这样的 $P$ 当且仅当
          $ 2 sqrt(2)(a-1)<=sqrt(2a^2-2), quad (a-1)(3a-5)<=0. $
          结合 $a>sqrt(2)$，得 $sqrt(2)<a<=5/3$。
        ]
        #step[求最小值并验证能取到][
          $d=6-2a>=6-2 times 5/3=8/3$。当 $a=5/3$ 时，$b=sqrt(7)/3>0$，可取使 $a cos t+b sin t$ 达到最大值的点 $P$，故等号可以成立。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [在数列 ${a_n}$ 中，$a_1=1$，$a_2=3$，对任意 $n in NN^*$ 且 $n>=2$，均存在正整数 $i in [1,n-1]$，满足 $a_(n+1)=2a_n-a_i$。],
  parts: (
    subquestion(
      stem: [求 $a_4$ 所有可能的值。],
      answers: ([$7$ 或 $9$。],),
      explanation: [$a_3=2a_2-a_1=5$，故 $a_4=2a_3-a_1=9$ 或 $a_4=2a_3-a_2=7$。],
    ),
    subquestion(
      stem: [命题 $p$：若 $a_1,a_2,dots.c,a_8$ 成等差数列，则 $a_9<30$。证明 $p$ 是真命题，同时写出 $p$ 的逆命题 $q$，并判断命题 $q$ 是真命题还是假命题，说明理由。],
      answers: (
        [$p$ 为真命题；逆命题 $q$ 为“若 $a_9<30$，则 $a_1,a_2,dots.c,a_8$ 成等差数列”，是假命题。],
      ),
      explanation: [
        若前 8 项成等差数列，则公差为 2，$a_n=2n-1$（$1<=n<=8$）。因此 $a_9=2a_8-a_i=30-a_i<30$，$p$ 为真命题。
        对于逆命题，取前 9 项为
        $ 1,3,5,7,9,11,13,17,21. $
        前 7 项按 $a_(n+1)=2a_n-a_(n-1)$ 生成，$a_8=2a_7-a_5=17$，$a_9=2a_8-a_7=21$，以后也可按递推条件继续生成。此时 $a_9<30$，但前 8 项不是等差数列，故 $q$ 为假命题。
      ],
    ),
    subquestion(
      stem: [若 $a_(2m)=3^m$（$m in NN^*$），求数列 ${a_n}$ 的通项公式。],
      answers: (
        [$a_n=cases(1 & quad n=1, 3^(n/2) & quad n "为偶数", 5 times 3^((n-3)/2) & quad n>=3 "且为奇数")$。],
      ),
      explanation: [
        #step[证明各项为正奇数且严格递增][
          $a_1=1<a_2=3$。若前 $n$ 项为递增的正奇数，则 $a_(n+1)-a_n=a_n-a_i>0$，且 $2a_n-a_i$ 仍为奇数。由归纳法，结论对所有项成立。
        ]
        #step[归纳确定奇数项][
          已知 $a_3=5$。假设已确定截至 $a_(2m)$ 的各项，其中 $m>=2$，特别地 $a_(2m-1)=5 times 3^(m-2)$。
          由递推条件，存在 $j<=2m-1$、$i<=2m$，使
          $ a_(2m+1)=2 times 3^m-a_j, quad 3^(m+1)=2a_(2m+1)-a_i. $
          消去 $a_(2m+1)$ 得 $2a_j+a_i=3^m$。
          若 $j=2m-1$，则 $2a_j=10 times 3^(m-2)>3^m$，矛盾。故 $j<=2m-2$；又 $a_i<3^m=a_(2m)$，故 $i<=2m-1$。
          若 $j<2m-2$，则 $a_j<3^(m-1)$，从而 $a_i=3^m-2a_j>3^(m-1)=a_(2m-2)$，故只能 $i=2m-1$。于是
          $ a_j=(3^m-5 times 3^(m-2))/2=2 times 3^(m-2), $
          这为偶数，与所有项均为奇数矛盾。因此 $j=2m-2$，得到
          $ a_(2m+1)=2 times 3^m-3^(m-1)=5 times 3^(m-1). $
          归纳完成，结合给定的偶数项，即得所求通项。
        ]
        验证：$a_3=2a_2-a_1$，$a_4=2a_3-a_1$；对 $m>=2$，有 $a_(2m+1)=2a_(2m)-a_(2m-2)$，$a_(2m+2)=2a_(2m+1)-a_(2m-2)$，下标均合法，故该通项符合题意。
      ],
    ),
  ),
)
