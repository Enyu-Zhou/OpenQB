#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, space-axes, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校招生全国统一考试",
  name: "全国乙卷（理科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2021/2021全国乙理(河南,山西,江西,安徽,陕西,甘肃,青海,内蒙古,黑龙江,吉林,.宁夏,新疆).pdf",
  regions: (
    "河南",
    "山西",
    "江西",
    "安徽",
    "陕西",
    "甘肃",
    "青海",
    "内蒙古",
    "黑龙江",
    "吉林",
    "宁夏",
    "新疆",
  ),
)

#let island-diagram() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (0, 0)
  let b = (0, 3)
  let e = (3.2, 0)
  let d = (3.2, 0.8)
  let h = (48 / 11, 0)
  let g = (5.4, 0)
  let f = (5.4, 0.8)
  let c = (81 / 11, 0)
  line(
    (-2, 0),
    (-1.6, 0.15),
    (-1.3, 0.6),
    (-1.1, 0.7),
    (-0.9, 1.1),
    (-0.6, 1.3),
    (-0.5, 1.9),
    (-0.25, 2.25),
    b,
    (0.2, 2.3),
    (0.6, 1.95),
    (0.7, 1.2),
    (1.05, 0.85),
    (1.2, 0.4),
    (2.3, 0),
    (-2, 0),
  )
  line((2.3, 0), c, stroke: (dash: figure-style.dash))
  for (u, v) in ((a, b), (b, h), (b, c), (e, d), (g, f)) {
    line(u, v, stroke: (dash: figure-style.dash))
  }
  for (p, label, anchor) in (
    (a, $A$, "north"),
    (b, $B$, "south"),
    (c, $C$, "west"),
    (d, $D$, "south"),
    (e, $E$, "north"),
    (f, $F$, "south"),
    (g, $G$, "north"),
    (h, $H$, "north"),
  ) { content(p, label, anchor: anchor, padding: 3pt) }
})

#let projection-view(index) = cetz.canvas(length: 14mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let height = if index <= 3 { 1 } else { 2 }
  if index == 1 { line((0, 0), (2, 0), (2, 1), close: true) }
  if index == 2 or index == 3 {
    line((0, 0), (2, 0), (1, 1), close: true)
    line((1, 0), (1, 1), stroke: (
      dash: if index == 3 { figure-style.dash } else { none },
    ))
  }
  if index == 4 { line((0, 0), (2, 1), (0, 2), close: true) }
  if index == 5 {
    line((0, 1), (2, 0), (2, 2), close: true)
    line((0, 1), (2, 1))
  }
  for x in (0, 2) { line((x, -0.13), (x, -0.34)) }
  line((0, -0.24), (0.78, -0.24))
  line((1.22, -0.24), (2, -0.24))
  content((1, -0.24), $2$)
  let x = if index == 4 { -0.24 } else { 2.24 }
  for y in (0, height) { line((x - 0.10, y), (x + 0.10, y)) }
  line((x, 0), (x, height / 2 - 0.17))
  line((x, height / 2 + 0.17), (x, height))
  content((x, height / 2), if index <= 3 { $1$ } else { $2$ })
  content((1, -0.56), ([图①], [图②], [图③], [图④], [图⑤]).at(index - 1))
})

#let tetrahedron-diagram() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let d = (0, 2, 0)
  let f = (2, 1, 0)
  let e = (2, 1, 1)
  oblique-project((1, 0), (-0.35, -0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, d, f, e, a)
    line(d, e)
    line(a, f, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "south-east"),
      (d, $D$, "north-east"),
      (f, $F$, "north-west"),
      (e, $E$, "south-west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#let pyramid-diagram(axes: false) = cetz.canvas(length: 23mm, {
  import cetz.draw: *
  let s = calc.sqrt(2)
  let d = (0, 0, 0)
  let a = (s, 0, 0)
  let c = (0, 1, 0)
  let b = (s, 1, 0)
  let p = (0, 0, 1)
  let m = (s / 2, 1, 0)
  oblique-project((-0.45, -0.45), (1.4, 0), (0, 1.7), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, p, a)
    line(p, b)
    line(p, m)
    for (u, v) in ((a, d), (d, c), (d, p), (a, m)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    if axes { space-axes((s, 1, 1), (2.05, 1.35, 1.3)) }
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north-west"),
      (c, $C$, "south-west"),
      (d, $D$, "south-east"),
      (p, $P$, "south-east"),
      (m, $M$, "north-west"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题]
#question(
  "single-choice",
  score: 5,
  stem: [设 $2(z+overline(z))+3(z-overline(z))=4+6i$，则 $z=$#choice-placeholder()。],
  choices: ([$1-2i$], [$1+2i$], [$1+i$], [$1-i$]),
  answers: ([C],),
  explanation: [设 $z=a+b i$，则原式为 $4a+6b i=4+6i$。比较实部、虚部，得 $a=b=1$，所以 $z=1+i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $S=\{s | s=2n+1,n in ZZ\}$，$T=\{t | t=4n+1,n in ZZ\}$，则 $S inter T=$#choice-placeholder()。],
  choices: ([$emptyset$], [$S$], [$T$], [$ZZ$]),
  answers: ([C],),
  explanation: [对任意整数 $n$，$4n+1=2(2n)+1$ 是奇数，故 $T subset.eq S$，所以 $S inter T=T$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知命题 $p:exists x in RR,sin x<1$；命题 $q:forall x in RR,e^(|x|)>=1$，则下列命题中为真命题的是#choice-placeholder()。],
  choices: ([$p and q$], [$not p and q$], [$p and not q$], [$not(p or q)$]),
  answers: ([A],),
  explanation: [取 $x=0$，有 $sin 0=0<1$，故 $p$ 为真。又 $|x|>=0$，所以 $e^(|x|)>=e^0=1$，故 $q$ 为真。因此 $p and q$ 为真，其余命题均为假。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=(1-x)/(1+x)$，则下列函数中是奇函数的是#choice-placeholder()。],
  choices: ([$f(x-1)-1$], [$f(x-1)+1$], [$f(x+1)-1$], [$f(x+1)+1$]),
  answers: ([B],),
  explanation: [由 $f(x)=-1+2/(1+x)$，得 $f(x-1)+1=2/x$，其定义域为 $RR without \{0\}$，且满足奇函数的定义。
    A 为 $2/x-2$，不满足奇函数关系；C、D 的定义域均为 $RR without \{-2\}$，不关于原点对称。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$P$ 为 $B_1 D_1$ 的中点，则直线 $P B$ 与 $A D_1$ 所成角为#choice-placeholder()。],
  choices: ([$pi/2$], [$pi/3$], [$pi/4$], [$pi/6$]),
  answers: ([D],),
  explanation: [以 $A$ 为原点，沿 $A B,A D,A A_1$ 建立空间直角坐标系，设棱长为 $2$，则
    $ B=(2,0,0),quad D_1=(0,2,2),quad P=(1,1,2). $
    因此 $arrow(B P)=(-1,1,2)$，$arrow(A D_1)=(0,2,2)$。设所求角为 $theta$，则
    $
      cos theta=(|arrow(B P) dot arrow(A D_1)|)/(|arrow(B P)| |arrow(A D_1)|)=6/(sqrt(6) times sqrt(8))=sqrt(3)/2.
    $
    故 $theta=pi/6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [将 5 名北京冬奥会志愿者分配到花样滑冰、短道速滑、冰球和冰壶 4 个项目进行培训，每名志愿者只分配到 1 个项目，每个项目至少分配 1 名志愿者，则不同的分配方案共有#choice-placeholder()。],
  choices: ([60 种], [120 种], [240 种], [480 种]),
  answers: ([C],),
  explanation: [人数只能分成 $2,1,1,1$。先选出同组的 $2$ 人，再把这一组与其余 $3$ 人分配到 $4$ 个不同项目，共有 $binom(5, 2) times 4!=240$ 种方案。],
)
#question(
  "single-choice",
  score: 5,
  stem: [把函数 $y=f(x)$ 图象上所有点的横坐标缩短到原来的 $1/2$ 倍，纵坐标不变，再把所得曲线向右平移 $pi/3$ 个单位长度，得到函数 $y=sin(x-pi/4)$ 的图象，则 $f(x)=$#choice-placeholder()。],
  choices: (
    [$sin(x/2-(7pi)/12)$],
    [$sin(x/2+pi/12)$],
    [$sin(2x-(7pi)/12)$],
    [$sin(2x+pi/12)$],
  ),
  answers: ([B],),
  explanation: [按变换顺序，所得函数为 $y=f(2(x-pi/3))$。令 $t=2(x-pi/3)$，则 $x=t/2+pi/3$，所以
    $ f(t)=sin(t/2+pi/3-pi/4)=sin(t/2+pi/12). $],
)
#question(
  "single-choice",
  score: 5,
  stem: [在区间 $(0,1)$ 和 $(1,2)$ 中各随机取 1 个数，则两数之和大于 $7/4$ 的概率为#choice-placeholder()。],
  choices: ([$7/9$], [$23/32$], [$9/32$], [$2/9$]),
  answers: ([B],),
  explanation: [设两数为 $x,y$，样本区域是 $0<x<1,1<y<2$，面积为 $1$。
    其中 $x+y<=7/4$ 的区域为直角三角形，两条直角边均为 $3/4$，面积为 $1/2 times (3/4)^2=9/32$，故所求概率为 $1-9/32=23/32$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [魏晋时期刘徽编写的《海岛算经》是关于测量的数学著作，其中第一题是测量海岛的高。如图，点 $E,H,G$ 在水平线 $A C$ 上，$D E$ 和 $F G$ 是两个垂直于水平面且等高的测量标杆的高度，称为“表高”，$E G$ 称为“表距”，$G C$ 和 $E H$ 都称为“表目距”，$G C$ 与 $E H$ 的差称为“表目距的差”，则海岛的高 $A B=$#choice-placeholder()。
    #figure(island-diagram())],
  choices: (
    [$frac("表高" times "表距", "表目距的差")+"表高"$],
    [$frac("表高" times "表距", "表目距的差")-"表高"$],
    [$frac("表高" times "表距", "表目距的差")+"表距"$],
    [$frac("表高" times "表距", "表目距的差")-"表距"$],
  ),
  answers: ([A],),
  explanation: [由相似三角形，$(D E)/(A B)=(E H)/(A H)=(G C)/(A C)$，利用比例的性质得
    $ (D E)/(A B)=(G C-E H)/(A C-A H)=(G C-E H)/(E G+G C-E H). $
    因此 $A B=(D E times E G)/(G C-E H)+D E$，即选 A。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $a!=0$，若 $x=a$ 是函数 $f(x)=a(x-a)^2(x-b)$ 的极大值点，则#choice-placeholder()。],
  choices: ([$a<b$], [$a>b$], [$a b<a^2$], [$a b>a^2$]),
  answers: ([D],),
  explanation: [若 $a=b$，则 $f(x)=a(x-a)^3$ 没有极值，不合题意。故 $a!=b$。
    因为 $f(a)=0$，且在 $a$ 附近 $(x-a)^2>0$，极大值条件要求 $a(x-b)<0$，故 $a(a-b)<0$，即 $a b>a^2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $B$ 是椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的上顶点，若 $C$ 上任意一点 $P$ 都满足 $|P B|<=2b$，则 $C$ 的离心率的取值范围是#choice-placeholder()。],
  choices: ([$[sqrt(2)/2,1)$], [$[1/2,1)$], [$(0,sqrt(2)/2]$], [$(0,1/2]$]),
  answers: ([C],),
  explanation: [设 $P=(x,y)$，记 $c^2=a^2-b^2$。利用椭圆方程，
    $ |P B|^2-4b^2=-(y+b)/b^2 (c^2 y+3b^3-a^2 b). $
    当 $y>-b$ 时，要求右端不大于 $0$，等价于 $c^2 y+3b^3-a^2 b>=0$；当 $y=-b$ 时等号成立。
    括号中的一次式随 $y$ 递增，其在 $[-b,b]$ 上的最小值为 $2b(2b^2-a^2)$。因此条件等价于 $a^2<=2b^2$。
    故 $e^2=1-b^2/a^2<=1/2$，结合 $a>b>0$，得 $e in (0,sqrt(2)/2]$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $a=2ln 1.01$，$b=ln 1.02$，$c=sqrt(1.04)-1$，则#choice-placeholder()。],
  choices: ([$a<b<c$], [$b<c<a$], [$b<a<c$], [$c<a<b$]),
  answers: ([B],),
  explanation: [#step[比较 $b$ 与 $c$][令 $u(x)=ln(1+2x)-sqrt(1+4x)+1$，则 $u(0)=0$。
      当 $x>0$ 时，$(1+2x)^2>1+4x$，故
      $ u'(x)=2/(1+2x)-2/sqrt(1+4x)<0. $
      所以 $u(0.01)<0$，即 $b<c$。]
    #step[比较 $a$ 与 $c$][令 $v(x)=2ln(1+x)-sqrt(1+4x)+1$，则 $v(0)=0$。
      当 $0<x<2$ 时，$1+4x-(1+x)^2=x(2-x)>0$，故
      $ v'(x)=2/(1+x)-2/sqrt(1+4x)>0. $
      所以 $v(0.01)>0$，即 $c<a$。综上，$b<c<a$。]],
)

#section[填空题]
#question(
  "fill-in",
  score: 5,
  stem: [已知双曲线 $C:x^2/m-y^2=1$（$m>0$）的一条渐近线为 $sqrt(3)x+m y=0$，则 $C$ 的焦距为#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [渐近线斜率的绝对值为 $1/sqrt(m)=sqrt(3)/m$，解得 $m=3$。因此 $c=sqrt(m+1)=2$，焦距 $2c=4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)=(1,3),bold(b)=(3,4)$，$(bold(a)-lambda bold(b)) perp bold(b)$，则 $lambda=$#fill-placeholder()。],
  answers: ([$3/5$],),
  explanation: [由数量积为零，得 $bold(a) dot bold(b)-lambda |bold(b)|^2=15-25lambda=0$，故 $lambda=3/5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [记 $triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，面积为 $sqrt(3)$，$B=60 degree$，$a^2+c^2=3a c$，则 $b=$#fill-placeholder()。],
  answers: ([$2sqrt(2)$],),
  explanation: [由面积公式 $sqrt(3)=1/2 a c sin 60 degree=sqrt(3)/4 a c$，得 $a c=4$。
    再由余弦定理，$b^2=a^2+c^2-2a c cos 60 degree=3a c-a c=8$，故 $b=2sqrt(2)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [以图①为正视图，在图②③④⑤中选两个分别作为侧视图和俯视图，组成某个三棱锥的三视图，则所选侧视图和俯视图的编号依次为#fill-placeholder()。（写出符合要求的一组答案即可）
    #figure(grid(
      columns: (auto, auto, auto),
      column-gutter: 8mm,
      row-gutter: 5mm,
      projection-view(1), projection-view(2), projection-view(3),
      projection-view(4), projection-view(5),
    ))],
  answers: ([③④（或②⑤）。],),
  explanation: [以③④为例，可构造三棱锥 $E-A D F$，取
    $ A=(0,0,0),quad D=(0,2,0),quad F=(2,1,0),quad E=(2,1,1). $
    #figure(tetrahedron-diagram())
    向 $x O z$ 平面投影得到宽 $2$、高 $1$ 的直角三角形，即图①；从 $x$ 轴负方向观察，侧视图是底边长 $2$、高 $1$ 的等腰三角形，棱 $E F$ 被前方的面 $E A D$ 遮挡，对应图③。
    俯视时 $E,F$ 重合，所得三角形对应图④，因此③④是一组符合要求的答案。],
)

#section[解答题]
#question(
  "solution",
  score: 12,
  stem: [某厂研制了一种生产高精产品的设备，为检验新设备生产产品的某项指标有无提高，用一台旧设备和一台新设备各生产了 10 件产品，得到各件产品该项指标数据如下：
    #table(
      columns: 11,
      align: center,
      inset: 4pt,
      [旧设备],
      [9.8],
      [10.3],
      [10.0],
      [10.2],
      [9.9],
      [9.8],
      [10.0],
      [10.1],
      [10.2],
      [9.7],

      [新设备],
      [10.1],
      [10.4],
      [10.1],
      [10.0],
      [10.1],
      [10.3],
      [10.6],
      [10.5],
      [10.4],
      [10.5],
    )
    旧设备和新设备生产产品的该项指标的样本平均值分别记为 $overline(x)$ 和 $overline(y)$，样本方差分别记为 $s_1^2$ 和 $s_2^2$。],
  parts: (
    subquestion(
      stem: [求 $overline(x),overline(y),s_1^2,s_2^2$；],
      answers: ([$overline(x)=10,overline(y)=10.3,s_1^2=0.036,s_2^2=0.04$。],),
      explanation: [旧、新设备的样本数据总和分别为 $100,103$，所以 $overline(x)=10,overline(y)=10.3$。
        以各自的平均值为中心，离差平方和分别为 $0.36,0.40$，故
        $ s_1^2=0.36/10=0.036,quad s_2^2=0.40/10=0.04. $],
    ),
    subquestion(
      stem: [判断新设备生产产品的该项指标的均值较旧设备是否有显著提高（如果 $overline(y)-overline(x)>=2sqrt((s_1^2+s_2^2)/10)$，则认为新设备生产产品的该项指标的均值较旧设备有显著提高，否则不认为有显著提高）。],
      answers: ([有显著提高。],),
      explanation: [均值之差为 $0.3>0$，而阈值的平方为
        $
          (2sqrt((s_1^2+s_2^2)/10))^2=4 times (0.036+0.04)/10=0.0304<0.09=0.3^2.
        $
        因此满足题设判据，认为有显著提高。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，四棱锥 $P-A B C D$ 的底面是矩形，$P D perp "底面" A B C D$，$P D=D C=1$，$M$ 为 $B C$ 的中点，且 $P B perp A M$。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [求 $B C$；],
      answers: ([$sqrt(2)$。],),
      explanation: [以 $D$ 为原点，沿 $D A,D C,D P$ 建立空间直角坐标系，设 $B C=t>0$，则
        $ A=(t,0,0),quad B=(t,1,0),quad P=(0,0,1),quad M=(t/2,1,0). $
        由 $P B perp A M$，得 $(t,1,-1) dot (-t/2,1,0)=1-t^2/2=0$，故 $B C=t=sqrt(2)$。
        #figure(pyramid-diagram(axes: true))],
    ),
    subquestion(
      stem: [求二面角 $A-P M-B$ 的正弦值。],
      answers: ([$sqrt(70)/14$。],),
      explanation: [沿用上述坐标系，$arrow(A M)=(-sqrt(2)/2,1,0)$，$arrow(A P)=(-sqrt(2),0,1)$，可取平面 $P A M$ 的法向量为 $bold(m)=(sqrt(2),1,2)$。
        $arrow(B M)=(-sqrt(2)/2,0,0)$，$arrow(B P)=(-sqrt(2),-1,1)$，可取平面 $P B M$ 的法向量为 $bold(n)=(0,1,1)$。
        两法向量夹角与二面角相等或互补，正弦相同，故所求正弦值为
        $
          sqrt(1-(bold(m) dot bold(n))^2/(|bold(m)|^2 |bold(n)|^2))=sqrt(1-9/14)=sqrt(70)/14.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [记 $S_n$ 为数列 $\{a_n\}$ 的前 $n$ 项和，$b_n$ 为数列 $\{S_n\}$ 的前 $n$ 项积，已知 $2/S_n+1/b_n=2$。],
  parts: (
    subquestion(
      stem: [证明：数列 $\{b_n\}$ 是等差数列；],
      answers: ([证明见解析，首项为 $3/2$，公差为 $1/2$。],),
      explanation: [由题设分式有意义，$S_n,b_n$ 均不为零。当 $n=1$ 时，$S_1=b_1$，得 $3/b_1=2$，所以 $b_1=3/2$。
        对 $n>=2$，由 $b_n=b_(n-1)S_n$，把已知等式乘以 $b_n$，得 $2b_(n-1)+1=2b_n$。
        故 $b_n-b_(n-1)=1/2$，所以 $\{b_n\}$ 是等差数列。],
    ),
    subquestion(
      stem: [求 $\{a_n\}$ 的通项公式。],
      answers: ([$a_n=cases(3/2 & quad n=1, -1/(n(n+1)) & quad n>=2)$。],),
      explanation: [由上一问，$b_n=(n+2)/2$。代回已知条件，得 $S_n=(n+2)/(n+1)$。
        当 $n=1$ 时，$a_1=S_1=3/2$；当 $n>=2$ 时，
        $ a_n=S_n-S_(n-1)=(n+2)/(n+1)-(n+1)/n=-1/(n(n+1)). $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设函数 $f(x)=ln(a-x)$，已知 $x=0$ 是函数 $y=x f(x)$ 的极值点。],
  parts: (
    subquestion(
      stem: [求 $a$；],
      answers: ([$a=1$。],),
      explanation: [由 $x=0$ 在定义域内知 $a>0$。令 $h(x)=x ln(a-x)$，则 $h'(x)=ln(a-x)-x/(a-x)$。
        极值点处导数为零，故 $h'(0)=ln a=0$，得 $a=1$。
        此时 $x<0$ 时 $h'(x)>0$，$0<x<1$ 时 $h'(x)<0$，确实在 $x=0$ 处取得极大值。],
    ),
    subquestion(
      stem: [设函数 $g(x)=(x+f(x))/(x f(x))$，证明：$g(x)<1$。],
      answers: ([证明见解析。],),
      explanation: [#step[确定分母符号][由上一问，$f(x)=ln(1-x)$，$g$ 的定义域为 $(-infinity,0) union (0,1)$。
          在这两个区间内，$x$ 与 $ln(1-x)$ 异号，故 $x ln(1-x)<0$。
          因此 $g(x)<1$ 等价于
          $ x+(1-x)ln(1-x)>0. $]
        #step[利用函数的最小值证明][令 $t=1-x>0$，且 $t!=1$。设 $phi(t)=1-t+t ln t$，则 $phi'(t)=ln t$。
          $phi$ 在 $(0,1)$ 上递减，在 $(1,+infinity)$ 上递增，故当 $t!=1$ 时，$phi(t)>phi(1)=0$。
          因而所需不等式成立，即 $g(x)<1$。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知抛物线 $C:x^2=2p y$（$p>0$）的焦点为 $F$，且 $F$ 与圆 $M:x^2+(y+4)^2=1$ 上的点的距离的最小值为 $4$。],
  parts: (
    subquestion(
      stem: [求 $p$；],
      answers: ([$p=2$。],),
      explanation: [焦点为 $F(0,p/2)$，圆心为 $M(0,-4)$，圆的半径为 $1$。
        因为 $p>0$，$F$ 在圆外，故最短距离为 $|F M|-1=p/2+3=4$，解得 $p=2$。],
    ),
    subquestion(
      stem: [若点 $P$ 在圆 $M$ 上，$P A,P B$ 是 $C$ 的两条切线，$A,B$ 是切点，求 $triangle P A B$ 面积的最大值。],
      answers: ([$20sqrt(5)$。],),
      explanation: [#step[求切点弦方程][抛物线为 $y=x^2/4$。设 $P=(u,v)$，切点横坐标为 $x_1,x_2$。
          由导数，横坐标为 $x_i$ 的切点处切线为 $y=x_i x/2-x_i^2/4$。
          代入 $P$，得 $x_i^2-2u x_i+4v=0$，故 $x_1+x_2=2u,x_1 x_2=4v$。
          两切点均满足 $u x-2y-2v=0$，所以这就是 $A B$ 的方程。]
        #step[计算三角形面积][圆上点满足 $-5<=v<=-3$，所以 $u^2-4v>0$，上述方程总有两个不同实根。
          因此
          $ |A B|=sqrt(1+u^2/4) |x_1-x_2|=sqrt((u^2+4)(u^2-4v)). $
          点 $P$ 到 $A B$ 的距离为 $d=(u^2-4v)/sqrt(u^2+4)$，故
          $ S_(triangle P A B)=1/2 |A B| d=1/2 (u^2-4v)^(3/2). $]
        #step[在圆上求最大值][由 $u^2+(v+4)^2=1$，得
          $ u^2-4v=1-(v+4)^2-4v=21-(v+6)^2. $
          当 $-5<=v<=-3$ 时，上式最大值为 $20$，在 $v=-5,u=0$ 时取得。
          故面积最大值为 $1/2 times 20^(3/2)=20sqrt(5)$。]],
    ),
  ),
)

#section[选考题：请从第 22、23 题中任选一题作答。]
#question(
  "solution",
  score: 10,
  stem: [在直角坐标系 $x O y$ 中，$⊙C$ 的圆心为 $C(2,1)$，半径为 $1$。],
  parts: (
    subquestion(
      stem: [写出 $⊙C$ 的一个参数方程；],
      answers: ([$cases(x=2+cos t, y=1+sin t)$（$t$ 为参数，$0<=t<2pi$）。],),
      explanation: [由圆心和半径，圆的方程为 $(x-2)^2+(y-1)^2=1$，令 $x-2=cos t,y-1=sin t$ 即可。],
    ),
    subquestion(
      stem: [过点 $F(4,1)$ 作 $⊙C$ 的两条切线，以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，求这两条切线的极坐标方程。],
      answers: (
        [$rho(cos theta-sqrt(3)sin theta)=4-sqrt(3)$ 和 $rho(cos theta+sqrt(3)sin theta)=4+sqrt(3)$。],
      ),
      explanation: [竖直线 $x=4$ 到圆心的距离为 $2$，不相切。故设切线为 $y-1=k(x-4)$。
        由圆心到直线的距离等于半径，得 $(2|k|)/sqrt(k^2+1)=1$，所以 $k=plus.minus sqrt(3)/3$。
        两条切线可写为 $x-sqrt(3)y=4-sqrt(3)$ 和 $x+sqrt(3)y=4+sqrt(3)$。
        代入 $x=rho cos theta,y=rho sin theta$，即得答案中的极坐标方程。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [已知函数 $f(x)=|x-a|+|x+3|$。],
  parts: (
    subquestion(
      stem: [当 $a=1$ 时，求不等式 $f(x)>=6$ 的解集；],
      answers: ([$(-infinity,-4] union [2,+infinity)$。],),
      explanation: [此时
        $ f(x)=cases(-2x-2 & quad x<=-3, 4 & quad -3<x<1, 2x+2 & quad x>=1). $
        分段求解 $f(x)>=6$，得 $x<=-4$ 或 $x>=2$。],
    ),
    subquestion(
      stem: [若 $f(x)>-a$，求 $a$ 的取值范围。],
      answers: ([$(-3/2,+infinity)$。],),
      explanation: [题意要求对所有实数 $x$ 成立。由绝对值的几何意义，$f(x)$ 的最小值为 $|a+3|$，在 $a$ 与 $-3$ 之间取得。
        因此条件等价于 $|a+3|>-a$。
        若 $a<=-3$，则 $-a-3>-a$ 无解；若 $a>-3$，则 $a+3>-a$，得 $a>-3/2$。
        综上，$a in (-3/2,+infinity)$。],
    ),
  ),
)
