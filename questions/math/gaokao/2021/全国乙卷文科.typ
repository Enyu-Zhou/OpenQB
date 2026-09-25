#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校招生全国统一考试",
  name: "全国乙卷（文科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2021/2021全国乙文(河南,山西,江西,安徽,陕西,甘肃,青海,内蒙古,黑龙江,吉林,.宁夏,新疆).pdf",
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

#let pyramid-diagram() = cetz.canvas(length: 23mm, {
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
    for (u, v) in ((a, d), (d, c), (d, p), (a, m), (b, d)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
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
  stem: [已知全集 $U={1,2,3,4,5}$，集合 $M={1,2},N={3,4}$，则 $complement_U (M union N)=$#choice-placeholder()。],
  choices: ([$\{5\}$], [$\{1,2\}$], [$\{3,4\}$], [$\{1,2,3,4\}$]),
  answers: ([A],),
  explanation: [由 $M union N={1,2,3,4}$，可得 $complement_U (M union N)={5}$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $i z=4+3i$，则 $z=$#choice-placeholder()。],
  choices: ([$-3-4i$], [$-3+4i$], [$3-4i$], [$3+4i$]),
  answers: ([C],),
  explanation: [$z=(4+3i)/i=-i(4+3i)=3-4i$。],
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
  stem: [函数 $f(x)=sin(x/3)+cos(x/3)$ 的最小正周期和最大值分别是#choice-placeholder()。],
  choices: (
    [$3pi$ 和 $sqrt(2)$],
    [$3pi$ 和 $2$],
    [$6pi$ 和 $sqrt(2)$],
    [$6pi$ 和 $2$],
  ),
  answers: ([C],),
  explanation: [由辅助角公式，$f(x)=sqrt(2)sin(x/3+pi/4)$，故最小正周期为 $(2pi)/(1/3)=6pi$，最大值为 $sqrt(2)$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(x+y>=4, x-y<=2, y<=3)$，则 $z=3x+y$ 的最小值为#choice-placeholder()。],
  choices: ([$18$], [$10$], [$6$], [$4$]),
  answers: ([C],),
  explanation: [由 $x+y>=4,y<=3$，得 $z=3(x+y)-2y>=12-6=6$。
    当 $(x,y)=(1,3)$ 时，满足全部约束条件且 $z=6$，故最小值为 $6$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [$cos^2(pi/12)-cos^2((5pi)/12)=$#choice-placeholder()。],
  choices: ([$1/2$], [$sqrt(3)/3$], [$sqrt(2)/2$], [$sqrt(3)/2$]),
  answers: ([D],),
  explanation: [因为 $(5pi)/12=pi/2-pi/12$，所以
    $
      cos^2(pi/12)-cos^2((5pi)/12)=cos^2(pi/12)-sin^2(pi/12)=cos(pi/6)=sqrt(3)/2.
    $],
)

#question(
  "single-choice",
  score: 5,
  stem: [在区间 $(0,1/2)$ 随机取一个数，则取到的数小于 $1/3$ 的概率为#choice-placeholder()。],
  choices: ([$3/4$], [$2/3$], [$1/3$], [$1/6$]),
  answers: ([B],),
  explanation: [由长度型几何概型，所求概率为 $P=(1/3-0)/(1/2-0)=2/3$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [下列函数中最小值为 $4$ 的是#choice-placeholder()。],
  choices: (
    [$y=x^2+2x+4$],
    [$y=|sin x|+4/(|sin x|)$],
    [$y=2^x+2^(2-x)$],
    [$y=ln x+4/(ln x)$],
  ),
  answers: ([C],),
  explanation: [#step[选项 A][$x^2+2x+4=(x+1)^2+3$，最小值为 $3$。]
    #step[选项 B][令 $t=|sin x|$，则 $0<t<=1$，且 $t+4/t-5=((t-1)(t-4))/t>=0$，等号在 $t=1$ 时取得，故最小值为 $5$。]
    #step[选项 C][$2^x+2^(2-x)>=2sqrt(2^x times 2^(2-x))=4$，当且仅当 $x=1$ 时取等号，故最小值为 $4$。]
    #step[选项 D][取 $x=e^(-1)$，函数值为 $-1-4=-5<4$，不符合题意。]],
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
  explanation: [连接 $B C_1,P C_1$，因为 $A D_1 parallel B C_1$，所求角等于直线 $B P$ 与 $B C_1$ 所成的角。
    设正方体棱长为 $2$。$P$ 为上底面中心，所以 $B_1 P=P C_1=sqrt(2)$。又 $B B_1 perp "平面" A_1 B_1 C_1 D_1$，故
    $ B P=sqrt(B B_1^2+B_1 P^2)=sqrt(6),quad B C_1=2sqrt(2). $
    在 $triangle B P C_1$ 中，由余弦定理，
    $ cos angle P B C_1=(6+8-2)/(2sqrt(6) times 2sqrt(2))=sqrt(3)/2. $
    因而所求角为 $pi/6$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $B$ 是椭圆 $C:x^2/5+y^2=1$ 的上顶点，点 $P$ 在 $C$ 上，则 $|P B|$ 的最大值是#choice-placeholder()。],
  choices: ([$5/2$], [$sqrt(6)$], [$sqrt(5)$], [$2$]),
  answers: ([A],),
  explanation: [设 $P=(x,y)$，则 $x^2=5(1-y^2)$，$-1<=y<=1$，而 $B=(0,1)$。因此
    $ |P B|^2=x^2+(y-1)^2=5(1-y^2)+(y-1)^2=-4(y+1/4)^2+25/4. $
    当 $y=-1/4$ 时取到最大值 $25/4$，所以 $|P B|$ 的最大值为 $5/2$。],
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


#section[填空题]
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)=(2,5),bold(b)=(lambda,4)$，若 $bold(a) parallel bold(b)$，则 $lambda=$#fill-placeholder()。],
  answers: ([$8/5$],),
  explanation: [由向量平行的坐标条件，$2 times 4-5lambda=0$，得 $lambda=8/5$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [双曲线 $x^2/4-y^2/5=1$ 的右焦点到直线 $x+2y-8=0$ 的距离为#fill-placeholder()。],
  answers: ([$sqrt(5)$],),
  explanation: [由 $c=sqrt(4+5)=3$，右焦点为 $(3,0)$，故所求距离为 $d=(|3+2 times 0-8|)/sqrt(1^2+2^2)=sqrt(5)$。],
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
  stem: [如图，四棱锥 $P-A B C D$ 的底面是矩形，$P D perp "底面" A B C D$，$M$ 为 $B C$ 的中点，且 $P B perp A M$。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [证明：平面 $P A M perp "平面" P B D$；],
      answers: ([证明见解析。],),
      explanation: [因为 $P D perp "底面" A B C D$，且 $A M$ 在底面内，所以 $P D perp A M$。
        又 $P B perp A M$，$P D inter P B={P}$，因此 $A M perp "平面" P B D$。
        由于 $A M$ 在平面 $P A M$ 内，故平面 $P A M perp "平面" P B D$。],
    ),
    subquestion(
      stem: [若 $P D=D C=1$，求四棱锥 $P-A B C D$ 的体积。],
      answers: ([$sqrt(2)/3$。],),
      explanation: [由上一问，$A M perp B D$。矩形中 $A B perp A D$，所以 $angle A D B=angle B A M$；又 $angle B A D=angle A B M=90 degree$，故 $triangle A B D ∽ triangle B M A$。
        因此 $(A D)/(A B)=(A B)/(B M)$。设 $B C=t>0$，则 $A D=t,A B=1,B M=t/2$，从而 $t^2/2=1$，得 $t=sqrt(2)$。
        所以四棱锥的体积为 $V=1/3 A B times B C times P D=sqrt(2)/3$。],
    ),
  ),
)

#question(
  "solution",
  score: 12,
  stem: [设 $\{a_n\}$ 是首项为 $1$ 的等比数列，数列 $\{b_n\}$ 满足 $b_n=(n a_n)/3$。已知 $a_1,3a_2,9a_3$ 成等差数列。],
  parts: (
    subquestion(
      stem: [求 $\{a_n\}$ 和 $\{b_n\}$ 的通项公式；],
      answers: ([$a_n=(1/3)^(n-1)$，$b_n=n/3^n$。],),
      explanation: [设等比数列的公比为 $q$，则 $a_2=q,a_3=q^2$。由等差条件，$6q=1+9q^2$，即 $(3q-1)^2=0$，所以 $q=1/3$。
        故 $a_n=(1/3)^(n-1)$，$b_n=(n a_n)/3=n/3^n$。],
    ),
    subquestion(
      stem: [记 $S_n$ 和 $T_n$ 分别为 $\{a_n\}$ 和 $\{b_n\}$ 的前 $n$ 项和，证明 $T_n<S_n/2$。],
      answers: ([证明见解析。],),
      explanation: [直接对 $S_n-2T_n$ 裂项求和。由上一问，对每个正整数 $k$，
        $ a_k-2b_k=(3-2k)/3^k=k/3^k-(k-1)/3^(k-1). $
        两边从 $k=1$ 到 $k=n$ 求和，中间项相消，得
        $ S_n-2T_n=n/3^n>0. $
        因此 $T_n<S_n/2$。],
    ),
  ),
)

#question(
  "solution",
  score: 12,
  stem: [已知抛物线 $C:y^2=2p x$（$p>0$）的焦点 $F$ 到准线的距离为 $2$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程；],
      answers: ([$y^2=4x$。],),
      explanation: [焦点为 $F(p/2,0)$，准线为 $x=-p/2$，二者的距离为 $p$，故 $p=2$，抛物线方程为 $y^2=4x$。],
    ),
    subquestion(
      stem: [已知 $O$ 为坐标原点，点 $P$ 在 $C$ 上，点 $Q$ 满足 $arrow(P Q)=9arrow(Q F)$，求直线 $O Q$ 斜率的最大值。],
      answers: ([$1/3$。],),
      explanation: [设 $P=(t^2/4,t)$，其中 $t in RR$。由 $F=(1,0)$ 及向量关系，$10Q=P+9F$，即
        $ Q=((t^2+36)/40,t/10). $
        $Q$ 的横坐标恒正，故直线 $O Q$ 的斜率为 $k=(4t)/(t^2+36)$。
        因为
        $ 1/3-k=1/3-(4t)/(t^2+36)=(t-6)^2/(3(t^2+36))>=0, $
        且等号在 $t=6$ 时取得，所以斜率的最大值为 $1/3$。],
    ),
  ),
)

#question(
  "solution",
  score: 12,
  stem: [设函数 $f(x)=x^3-x^2+a x+1$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性；],
      answers: (
        [当 $a>=1/3$ 时，在 $RR$ 上递增。
          当 $a<1/3$ 时，记 $x_1=(1-sqrt(1-3a))/3,x_2=(1+sqrt(1-3a))/3$，则在 $(-infinity,x_1)$、$(x_2,+infinity)$ 上递增，在 $(x_1,x_2)$ 上递减。],
      ),
      explanation: [导数 $f'(x)=3x^2-2x+a=3(x-1/3)^2+a-1/3$。
        #step[当 $a>=1/3$ 时][导数非负，且至多在一个点为零，所以 $f$ 在 $RR$ 上递增。]
        #step[当 $a<1/3$ 时][导数有两个不同零点
          $ x_1=(1-sqrt(1-3a))/3,quad x_2=(1+sqrt(1-3a))/3. $
          由于二次项系数为正，导数在两根外为正、两根间为负，故递增区间为 $(-infinity,x_1)$、$(x_2,+infinity)$，递减区间为 $(x_1,x_2)$。]],
    ),
    subquestion(
      stem: [求曲线 $y=f(x)$ 过坐标原点的切线与曲线 $y=f(x)$ 的公共点的坐标。],
      answers: ([$(1,a+1)$ 和 $(-1,-a-1)$。],),
      explanation: [#step[求过原点的切线][设切点横坐标为 $t$，切线为 $y=f'(t)(x-t)+f(t)$。
          切线过原点，故 $f(t)-t f'(t)=0$，整理得
          $ 2t^3-t^2-1=(t-1)(2t^2+t+1)=0. $
          因为 $2t^2+t+1=2(t+1/4)^2+7/8>0$，所以 $t=1$。
          此时 $f(1)=a+1,f'(1)=a+1$，切线为 $y=(a+1)x$。]
        #step[求全部公共点][联立切线与曲线，得
          $ x^3-x^2+a x+1=(a+1)x,quad (x-1)^2(x+1)=0. $
          故 $x=1$ 或 $x=-1$，对应公共点为 $(1,a+1)$、$(-1,-a-1)$。]],
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

