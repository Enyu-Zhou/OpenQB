#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校招生全国统一考试",
  name: "全国乙卷（文科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2022/2022全国乙文(河南,山西,江西,安徽,陕西,甘肃,青海,内蒙古,黑龙江,吉林,.宁夏,新疆).pdf",
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

#let flowchart() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.6, 6.85), (0.6, 7.35), radius: 0.25)
  content((0, 7.1), [开始])
  line((-2.3, 6.1), (2.1, 6.1), (2.3, 6.6), (-2.1, 6.6), close: true)
  content((0, 6.35), [输入 $a=1,b=1,n=1$])
  rect((-1, 5.05), (1, 5.55))
  content((0, 5.3), [$b=b+2a$])
  rect((-2, 3.95), (2, 4.45))
  content((0, 4.2), [$a=b-a,n=n+1$])
  line((0, 3.65), (2.4, 2.6), (0, 1.55), (-2.4, 2.6), close: true)
  content((0, 2.6), [$abs(b^2/a^2-2)<0.01$])
  line((-0.95, 0.75), (0.75, 0.75), (0.95, 1.25), (-0.75, 1.25), close: true)
  content((0, 1), [输出 $n$])
  rect((-0.6, -0.25), (0.6, 0.25), radius: 0.25)
  content((0, 0), [结束])
  for (y1, y2) in (
    (6.85, 6.6),
    (6.1, 5.55),
    (5.05, 4.45),
    (3.95, 3.65),
    (1.55, 1.25),
    (0.75, 0.25),
  ) {
    line((0, y1), (0, y2), mark: (end: ">"))
  }
  line((-2.4, 2.6), (-3, 2.6), (-3, 5.8), (0, 5.8), mark: (end: ">"))
  content((-2.55, 2.45), [否], anchor: "north")
  content((0.6, 1.5), [是], anchor: "west")
})

#let tetrahedron() = cetz.canvas(length: 23mm, {
  import cetz.draw: *
  let a = (1, 0, 0)
  let c = (-1, 0, 0)
  let e = (0, 0, 0)
  let b = (0, calc.sqrt(3), 0)
  let d = (0, 0, 1)
  let f = (0, calc.sqrt(3) / 4, 3 / 4)
  oblique-project((-0.42, -0.42), (1, 0), (0, 1.15), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, d, b, a)
    line(a, f)
    line(a, c, d, e, b, c, f, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "west"),
      (c, $C$, "north-west"),
      (d, $D$, "south"),
      (e, $E$, "north-west"),
      (f, $F$, "south-west"),
    ) {
      content(p, label, anchor: anchor, padding: if p == c { 6pt } else { 3pt })
    }
  })
})

#let stem-leaf() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((-0.45, -0.4), (-0.45, 6.3))
  line((0.45, -0.4), (0.45, 6.3))
  line((-2.6, 5.7), (4, 5.7))
  content((-1.5, 6), [甲])
  content((2.2, 6), [乙])
  let left-leaves = (
    (6, 1),
    (8, 5, 3, 0),
    (7, 5, 3, 2),
    (6, 4, 2, 1),
    (4, 2),
    (),
  )
  let right-leaves = (
    (),
    (3,),
    (4, 6),
    (1, 2, 2, 5, 6, 6, 6, 6),
    (0, 2, 3, 8),
    (1,),
  )
  for row in range(6) {
    content((0, 5 - row), str(5 + row) + ".")
    let leaves = left-leaves.at(row)
    for (i, n) in leaves.enumerate() {
      content((-0.8 - 0.4 * (leaves.len() - 1 - i), 5 - row), str(n))
    }
    for (i, n) in right-leaves.at(row).enumerate() {
      content((0.8 + 0.4 * i, 5 - row), str(n))
    }
  }
})

#let rational-graph() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(axes: (
    stroke: figure-style.thickness,
    overshoot: 0.12,
    shared-zero: $O$,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (4.9, 3.5),
    axis-style: "school-book",
    x-min: -3.5,
    x-max: 3.5,
    y-min: -2.5,
    y-max: 2.5,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (-3, 1, 3),
    y-ticks: (1,),
    {
      plot.add(
        x => (-x * x * x + 3 * x) / (x * x + 1),
        domain: (-3, 3),
        samples: 120,
        style: (stroke: figure-style.thickness),
      )
    },
  )
})


#section[选择题]
#question(
  "single-choice",
  stem: [集合 $M={2,4,6,8,10}$，$N={x | -1<x<6}$，则 $M inter N=$#choice-placeholder()。],
  choices: ([${2,4}$], [${2,4,6}$], [${2,4,6,8}$], [${2,4,6,8,10}$]),
  answers: ([A],),
  explanation: [$M$ 中满足 $-1<x<6$ 的元素为 $2,4$，故 $M inter N={2,4}$。],
)
#question(
  "single-choice",
  stem: [设 $(1+2"i")a+b=2"i"$，其中 $a,b$ 为实数，则#choice-placeholder()。],
  choices: ([$a=1,b=-1$], [$a=1,b=1$], [$a=-1,b=1$], [$a=-1,b=-1$]),
  answers: ([A],),
  explanation: [比较实部和虚部，得 $a+b=0$、$2a=2$，所以 $a=1,b=-1$。],
)
#question(
  "single-choice",
  stem: [已知向量 $bold(a)=(2,1)$，$bold(b)=(-2,4)$，则 $abs(bold(a)-bold(b))=$#choice-placeholder()。],
  choices: ([$2$], [$3$], [$4$], [$5$]),
  answers: ([D],),
  explanation: [$bold(a)-bold(b)=(4,-3)$，故 $abs(bold(a)-bold(b))=sqrt(4^2+(-3)^2)=5$。],
)
#question(
  "single-choice",
  stem: [分别统计了甲、乙两位同学 16 周的各周课外体育运动时长（单位：$"h"$），得如下茎叶图：
    #figure(stem-leaf())
    则下列结论中错误的是#choice-placeholder()。],
  choices: (
    [甲同学周课外体育运动时长的样本中位数为 $7.4$],
    [乙同学周课外体育运动时长的样本平均数大于 $8$],
    [甲同学周课外体育运动时长大于 $8$ 的概率的估计值大于 $0.4$],
    [乙同学周课外体育运动时长大于 $8$ 的概率的估计值大于 $0.6$],
  ),
  answers: ([C],),
  explanation: [
    #step[选项 A][甲的数据由小到大排列后，第 8、9 个数分别为 $7.3,7.5$，中位数为 $(7.3+7.5)/2=7.4$，正确。]
    #step[选项 B][乙的 16 个数据之和为 $136.1$，样本平均数为 $136.1/16=8.50625>8$，正确。]
    #step[选项 C][甲的数据中大于 $8$ 的有 6 个，概率的估计值为 $6/16=0.375<0.4$，错误。]
    #step[选项 D][乙的数据中大于 $8$ 的有 13 个，概率的估计值为 $13/16=0.8125>0.6$，正确。]
  ],
)
#question(
  "single-choice",
  stem: [若 $x,y$ 满足约束条件 $cases(x+y>=2, x+2y<=4, y>=0)$，则 $z=2x-y$ 的最大值是#choice-placeholder()。],
  choices: ([$-2$], [$4$], [$8$], [$12$]),
  answers: ([C],),
  explanation: [由约束条件，$2x-y=2(x+2y)-5y<=8$。当 $(x,y)=(4,0)$ 时满足全部约束且取等号，所以最大值为 $8$。],
)
#question(
  "single-choice",
  stem: [设 $F$ 为抛物线 $C:y^2=4x$ 的焦点，点 $A$ 在 $C$ 上，点 $B(3,0)$。若 $abs(A F)=abs(B F)$，则 $abs(A B)=$#choice-placeholder()。],
  choices: ([$2$], [$2sqrt(2)$], [$3$], [$3sqrt(2)$]),
  answers: ([B],),
  explanation: [$F=(1,0)$，所以 $abs(A F)=abs(B F)=2$。由抛物线定义，$x_A+1=2$，得 $x_A=1$，从而 $y_A=plus.minus 2$。故 $abs(A B)=sqrt((3-1)^2+2^2)=2sqrt(2)$。],
)
#question(
  "single-choice",
  stem: [执行如图的程序框图，输出的 $n=$#choice-placeholder()。
    #figure(flowchart())],
  choices: ([$3$], [$4$], [$5$], [$6$]),
  answers: ([B],),
  explanation: [每轮先更新 $b$，再用更新后的 $b$ 计算 $a$，依次得到：
    #block(breakable: false)[#table(
      columns: 4,
      align: center,
      [$n$], [$a$], [$b$], [$abs(b^2/a^2-2)$],
      [$2$], [$2$], [$3$], [$1/4$],
      [$3$], [$5$], [$7$], [$1/25$],
      [$4$], [$12$], [$17$], [$1/144$],
    )]
    当 $n=4$ 时首次满足 $1/144<0.01$，输出 $4$。],
)
#question(
  "single-choice",
  stem: [如图是下列四个函数中的某个函数在 $[-3,3]$ 的大致图像，则该函数是#choice-placeholder()。
    #figure(rational-graph())],
  choices: (
    [$y=(-x^3+3x)/(x^2+1)$],
    [$y=(x^3-x)/(x^2+1)$],
    [$y=(2x cos x)/(x^2+1)$],
    [$y=(2sin x)/(x^2+1)$],
  ),
  answers: ([A],),
  explanation: [由图可知 $f(-3)>1$。当 $x=-3$ 时，A 的函数值为 $9/5$，B 的函数值为 $-12/5$；C、D 的函数值的绝对值分别不超过 $3/5$、$1/5$。故只有 A 符合图像。],
)
#question(
  "single-choice",
  stem: [在正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$E,F$ 分别为 $A B,B C$ 的中点，则#choice-placeholder()。],
  choices: (
    [平面 $B_1 E F perp$ 平面 $B D D_1$],
    [平面 $B_1 E F perp$ 平面 $A_1 B D$],
    [平面 $B_1 E F parallel$ 平面 $A_1 A C$],
    [平面 $B_1 E F parallel$ 平面 $A_1 C_1 D$],
  ),
  answers: ([A],),
  explanation: [在 $triangle A B C$ 中，$E F parallel A C$。正方体中 $A C perp B D$，且 $A C perp D D_1$，所以 $A C perp$ 平面 $B D D_1$，从而 $E F perp$ 平面 $B D D_1$。又 $E F subset$ 平面 $B_1 E F$，故两平面垂直，A 正确。],
)
#question(
  "single-choice",
  stem: [已知等比数列 ${a_n}$ 的前 3 项和为 $168$，$a_2-a_5=42$，则 $a_6=$#choice-placeholder()。],
  choices: ([$14$], [$12$], [$6$], [$3$]),
  answers: ([D],),
  explanation: [设公比为 $q$，则 $a_1(1+q+q^2)=168$，$a_1 q(1-q^3)=42$。两式相除，得 $q(1-q)=1/4$，所以 $(q-1/2)^2=0$，$q=1/2$。从而 $a_1=96$，$a_6=96 times (1/2)^5=3$。],
)
#question(
  "single-choice",
  stem: [函数 $f(x)=cos x+(x+1)sin x+1$ 在区间 $[0,2pi]$ 的最小值、最大值分别为#choice-placeholder()。],
  choices: (
    [$-pi/2,pi/2$],
    [$-3pi/2,pi/2$],
    [$-pi/2,pi/2+2$],
    [$-3pi/2,pi/2+2$],
  ),
  answers: ([D],),
  explanation: [$f'(x)=(x+1)cos x$，在 $(0,pi/2)$、$(3pi/2,2pi)$ 上为正，在 $(pi/2,3pi/2)$ 上为负。
    比较 $f(0)=f(2pi)=2$、$f(pi/2)=pi/2+2$、$f(3pi/2)=-3pi/2$，得最小值为 $-3pi/2$，最大值为 $pi/2+2$。],
)
#question(
  "single-choice",
  stem: [已知球 $O$ 的半径为 $1$，四棱锥的顶点为 $O$，底面的四个顶点均在球 $O$ 的球面上，则当该四棱锥的体积最大时，其高为#choice-placeholder()。],
  choices: ([$1/3$], [$1/2$], [$sqrt(3)/3$], [$sqrt(2)/2$]),
  answers: ([C],),
  explanation: [设高为 $h$，底面所在截面圆的半径为 $r=sqrt(1-h^2)$。底面四边形两条对角线均不超过 $2r$，故面积 $S<=1/2 times 2r times 2r=2r^2$，当底面为正方形时取等号。
    因此 $V<=2/3 h(1-h^2)$。对 $h in (0,1)$，右侧导数为 $2/3(1-3h^2)$，先正后负，在 $h=sqrt(3)/3$ 时取得最大值。],
)

#section[填空题]
#question(
  "fill-in",
  stem: [记 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和。若 $2S_3=3S_2+6$，则公差 $d=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [由 $S_3=3a_1+3d$、$S_2=2a_1+d$，得 $2(3a_1+3d)=3(2a_1+d)+6$，所以 $d=2$。],
)
#question(
  "fill-in",
  stem: [从甲、乙等 5 名同学中随机选 3 名参加社区服务工作，则甲、乙都入选的概率为#fill-placeholder()。],
  answers: ([$3/10$],),
  explanation: [共有 $binom(5, 3)=10$ 种等可能的选法；甲、乙都入选时，只需从其余 3 人中再选 1 人，有 3 种选法，故概率为 $3/10$。],
)
#question(
  "fill-in",
  stem: [过四点 $(0,0),(4,0),(-1,1),(4,2)$ 中的三点的一个圆的方程为#fill-placeholder()。],
  answers: ([$(x-2)^2+(y-1)^2=5$（答案不唯一）],),
  explanation: [取 $(0,0),(4,0),(4,2)$ 三点，前两点连线的垂直平分线为 $x=2$，后两点连线的垂直平分线为 $y=1$，所以圆心为 $(2,1)$，半径平方为 $5$，得到 $(x-2)^2+(y-1)^2=5$。],
)
#question(
  "fill-in",
  stem: [若函数 $f(x)=ln abs(a+1/(1-x))+b$ 是奇函数，则 $a=$#fill-placeholder()，$b=$#fill-placeholder()。],
  answers: ([$-1/2$], [$ln 2$]),
  explanation: [当 $a=0$ 时，定义域为 $RR without {1}$，不关于原点对称，故 $a!=0$。
    此时定义域为 $RR without {1,1+1/a}$。由奇函数定义域关于原点对称，得 $1+1/a=-1$，所以 $a=-1/2$。
    又 $0$ 在定义域内，$f(0)=ln(1/2)+b=0$，得 $b=ln 2$。
    代回得到 $f(x)=ln abs((1+x)/(1-x))$，其定义域为 $RR without {-1,1}$，且 $f(-x)=-f(x)$，符合题意。],
)

#section[解答题]
#question(
  "solution",
  stem: [记 $triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $sin C sin(A-B)=sin B sin(C-A)$。],
  parts: (
    subquestion(
      stem: [若 $A=2B$，求 $C$；],
      answers: ([$5pi/8$],),
      explanation: [将 $A=2B$ 代入已知等式，约去 $sin B>0$，得 $sin C=sin(C-A)$。
        由 $-pi<C-A<pi$ 及 $sin C>0$，知 $0<C-A<pi$。又 $C!=C-A$，所以 $C+(C-A)=pi$。
        联立 $A+B+C=pi$、$A=2B$，得 $B=pi/8,A=pi/4,C=5pi/8$。],
    ),
    subquestion(
      stem: [证明：$2a^2=b^2+c^2$；],
      answers: ([证明见解析。],),
      explanation: [展开两角差的正弦并移项，得
        $ sin A(sin C cos B+sin B cos C)=2sin B sin C cos A. $
        由 $sin(B+C)=sin A$，得 $sin^2 A=2sin B sin C cos A$。再由正弦定理，得 $a^2=2b c cos A$。结合余弦定理 $a^2=b^2+c^2-2b c cos A$，即得 $2a^2=b^2+c^2$。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，四面体 $A B C D$ 中，$A D perp C D$，$A D=C D$，$angle A D B=angle B D C$，$E$ 为 $A C$ 的中点。
    #figure(tetrahedron())],
  parts: (
    subquestion(
      stem: [证明：平面 $B E D perp$ 平面 $A C D$；],
      answers: ([证明见解析。],),
      explanation: [由 $A D=C D$、$angle A D B=angle C D B$ 及公共边 $D B$，得 $triangle A D B$ 与 $triangle C D B$ 全等，故 $A B=C B$。又 $E$ 为 $A C$ 的中点，故 $B E perp A C$，$D E perp A C$。
        $B E,D E$ 为平面 $B E D$ 内的两条相交直线，所以 $A C perp$ 平面 $B E D$。由 $A C subset$ 平面 $A C D$，得两平面垂直。],
    ),
    subquestion(
      stem: [设 $A B=B D=2$，$angle A C B=60 degree$，点 $F$ 在 $B D$ 上。当 $triangle A F C$ 的面积最小时，求三棱锥 $F-A B C$ 的体积。],
      answers: ([$sqrt(3)/4$],),
      explanation: [
        #step[确定底面及高][由第（1）问，$A B=C B=2$，结合 $angle A C B=60 degree$，知 $triangle A B C$ 为边长为 $2$ 的等边三角形。因此 $A E=C E=1$，$B E=sqrt(3)$，$S_(triangle A B C)=sqrt(3)$。
          直角三角形 $A D C$ 中，$D E=(A C)/2=1$。由 $D E^2+B E^2=B D^2$，得 $D E perp B E$。又 $D E perp A C$，故 $D E perp$ 平面 $A B C$。]
        #step[求最小面积对应的体积][因 $A C perp$ 平面 $B E D$，故 $A C perp E F$，从而 $S_(triangle A F C)=1/2 A C dot E F$。当 $E F perp B D$ 时面积最小。
          在直角三角形 $B E D$ 中，由射影定理，$D F=(D E^2)/(B D)=1/2$，故 $(B F)/(B D)=3/4$。点 $F$ 到平面 $A B C$ 的距离为 $3/4 D E=3/4$，所以
          $ V_(F-A B C)=1/3 times sqrt(3) times 3/4=sqrt(3)/4. $]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [某地经过多年的环境治理，已将荒山改造成了绿水青山。为估计一林区某种树木的总材积量，随机选取了 10 棵这种树木，测量每棵树的根部横截面积（单位：$"m"^2$）和材积量（单位：$"m"^3$），得到如下数据：
    #text(size: 9pt)[#table(
      columns: (auto, ..(1fr,) * 11),
      align: center,
      inset: 4pt,
      [样本号 $i$], [$1$],
      [$2$], [$3$],
      [$4$], [$5$],
      [$6$], [$7$],
      [$8$], [$9$],
      [$10$], [总和],
      [根部横截面积 $x_i$], [$0.04$],
      [$0.06$], [$0.04$],
      [$0.08$], [$0.08$],
      [$0.05$], [$0.05$],
      [$0.07$], [$0.07$],
      [$0.06$], [$0.6$],
      [材积量 $y_i$], [$0.25$],
      [$0.40$], [$0.22$],
      [$0.54$], [$0.51$],
      [$0.34$], [$0.36$],
      [$0.46$], [$0.42$],
      [$0.40$], [$3.9$],
    )]
    并计算得 $sum_(i=1)^10 x_i^2=0.038$，$sum_(i=1)^10 y_i^2=1.6158$，$sum_(i=1)^10 x_i y_i=0.2474$。
    附：相关系数 $r=(sum_(i=1)^n (x_i-overline(x))(y_i-overline(y)))/sqrt(sum_(i=1)^n (x_i-overline(x))^2 sum_(i=1)^n (y_i-overline(y))^2)$，$sqrt(1.896) approx 1.377$。],
  parts: (
    subquestion(
      stem: [估计该林区这种树木平均一棵的根部横截面积与平均一棵的材积量；],
      answers: ([$0.06 "m"^2$，$0.39 "m"^3$。],),
      explanation: [用样本均值估计总体均值，$overline(x)=0.6/10=0.06$，$overline(y)=3.9/10=0.39$，分别得到 $0.06 "m"^2$ 和 $0.39 "m"^3$。],
    ),
    subquestion(
      stem: [求该林区这种树木的根部横截面积与材积量的样本相关系数（精确到 $0.01$）；],
      answers: ([$0.97$],),
      explanation: [将样本数据代入，得
        $
          r=(0.2474-10 times 0.06 times 0.39)/sqrt((0.038-10 times 0.06^2)(1.6158-10 times 0.39^2))=0.0134/sqrt(0.0001896) approx 0.97.
        $],
    ),
    subquestion(
      stem: [现测量了该林区所有这种树木的根部横截面积，并得到所有这种树木的根部横截面积总和为 $186 "m"^2$。已知树木的材积量与其根部横截面积近似成正比。利用以上数据给出该林区这种树木的总材积量的估计值。],
      answers: ([$1209 "m"^3$],),
      explanation: [用样本总材积量与总根部横截面积之比估计比例系数，得 $3.9/0.6=6.5$。所以总材积量的估计值为 $6.5 times 186=1209("m"^3)$。],
    ),
  ),
)
#question("solution", stem: [已知函数 $f(x)=a x-1/x-(a+1)ln x$。], parts: (
  subquestion(
    stem: [当 $a=0$ 时，求 $f(x)$ 的最大值；],
    answers: ([$-1$],),
    explanation: [定义域为 $(0,+infinity)$。当 $a=0$ 时，$f'(x)=(1-x)/x^2$，所以 $f$ 在 $(0,1)$ 上递增，在 $(1,+infinity)$ 上递减，最大值为 $f(1)=-1$。],
  ),
  subquestion(
    stem: [若 $f(x)$ 恰有一个零点，求 $a$ 的取值范围。],
    answers: ([$(0,+infinity)$],),
    explanation: [
      #step[排除 $a<=0$][由 $f'(x)=((a x-1)(x-1))/x^2$，当 $a<=0$ 时，$a x-1<0$，故 $f$ 在 $(0,1)$ 递增，在 $(1,+infinity)$ 递减。此时最大值 $f(1)=a-1<0$，没有零点。]
      #step[讨论 $0<a<1$][导数在 $(0,1)$ 为正，在 $(1,1/a)$ 为负，在 $(1/a,+infinity)$ 为正。
        因 $f(1)=a-1<0$，故 $(0,1/a]$ 上无零点；在 $(1/a,+infinity)$ 上严格递增，且 $lim_(x->+infinity)f(x)=+infinity$，所以恰有一个零点。]
      #step[讨论 $a=1$][$f'(x)=(x-1)^2/x^2>=0$，且仅在 $x=1$ 时为零，故 $f$ 严格递增。由 $f(1)=0$，知恰有一个零点。]
      #step[讨论 $a>1$][导数在 $(0,1/a)$ 为正，在 $(1/a,1)$ 为负，在 $(1,+infinity)$ 为正。
        在 $[1/a,+infinity)$ 上，$f(x)>=f(1)=a-1>0$，无零点；在 $(0,1/a)$ 上严格递增，且 $lim_(x->0^+)f(x)=-infinity$，故恰有一个零点。
        综上，所求范围为 $(0,+infinity)$。]
    ],
  ),
))
#question(
  "solution",
  stem: [已知椭圆 $E$ 的中心为坐标原点，对称轴为 $x$ 轴、$y$ 轴，且过 $A(0,-2),B(3/2,-1)$ 两点。],
  parts: (
    subquestion(
      stem: [求 $E$ 的方程；],
      answers: ([$x^2/3+y^2/4=1$],),
      explanation: [设椭圆方程为 $u x^2+v y^2=1$，由所过两点，得 $4v=1$、$9/4 u+v=1$，故 $u=1/3,v=1/4$，所求方程为 $x^2/3+y^2/4=1$。],
    ),
    subquestion(
      stem: [设过点 $P(1,-2)$ 的直线交 $E$ 于 $M,N$ 两点，过 $M$ 且平行于 $x$ 轴的直线与线段 $A B$ 交于点 $T$，点 $H$ 满足 $arrow(M T)=arrow(T H)$。证明：直线 $H N$ 过定点。],
      answers: ([过定点 $(0,-2)$。],),
      explanation: [
        #step[统一表示割线与交点][水平直线 $y=-2$ 与椭圆只有一个交点，故所给直线可设为 $x=1+k(y+2)$，其中 $k=0$ 包括竖直线情形。
          令 $u=y+2$，联立椭圆方程，得
          $ (4k^2+3)u^2+(8k-12)u+4=0. $
          设 $M,N$ 对应的根为 $u_1,u_2$，则 $u_1+u_2=(12-8k)/(4k^2+3)$，$u_1u_2=4/(4k^2+3)$，且 $x_M=1+k u_1,x_N=1+k u_2$。]
        #step[验证定点与 $H,N$ 共线][直线 $A B$ 为 $x=3/2(y+2)$，故 $T=(3u_1/2,u_1-2)$，由向量条件，得 $H=(3u_1-x_M,u_1-2)$。
          对点 $A=(0,-2)$，有
          $
            (3u_1-x_M)u_2-x_N u_1
            =3u_1u_2-x_M u_2-x_N u_1
            =(3-2k)u_1u_2-(u_1+u_2)=0.
          $
          因 $u_1!=u_2$，$H,N$ 是不同点；又 $u_1u_2!=0$，故上式表明 $arrow(A H) parallel arrow(A N)$，即 $A,H,N$ 共线。因此 $H N$ 始终经过定点 $(0,-2)$。]
      ],
    ),
  ),
)

#section[选考题（从下面两题中任选一题作答）]
#question(
  "solution",
  stem: [在直角坐标系 $x O y$ 中，曲线 $C$ 的参数方程为 $cases(x=sqrt(3)cos 2t, y=2sin t)$（$t$ 为参数）。以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，已知直线 $l$ 的极坐标方程为 $rho sin(theta+pi/3)+m=0$。],
  parts: (
    subquestion(
      stem: [写出 $l$ 的直角坐标方程；],
      answers: ([$sqrt(3)x+y+2m=0$],),
      explanation: [由 $rho sin(theta+pi/3)=1/2 rho sin theta+sqrt(3)/2 rho cos theta$，代入 $x=rho cos theta,y=rho sin theta$，得 $sqrt(3)x+y+2m=0$。],
    ),
    subquestion(
      stem: [若 $l$ 与 $C$ 有公共点，求 $m$ 的取值范围。],
      answers: ([$[-19/12,5/2]$],),
      explanation: [将参数方程代入直线方程，得 $3cos 2t+2sin t+2m=0$。令 $u=sin t in [-1,1]$，则
        $ m=3u^2-u-3/2=3(u-1/6)^2-19/12. $
        该二次函数在 $u=1/6$ 时取最小值 $-19/12$，在 $u=-1$ 时取最大值 $5/2$，且在区间内连续。因此所求范围为 $[-19/12,5/2]$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知 $a,b,c$ 都是正数，且 $a^(3/2)+b^(3/2)+c^(3/2)=1$，证明：],
  parts: (
    subquestion(
      stem: [$a b c<=1/9$；],
      answers: ([证明见解析。],),
      explanation: [由均值不等式，$1=a^(3/2)+b^(3/2)+c^(3/2)>=3sqrt(a b c)$，所以 $a b c<=1/9$。当且仅当 $a=b=c=3^(-2/3)$ 时取等号。],
    ),
    subquestion(
      stem: [$a/(b+c)+b/(a+c)+c/(a+b)<=1/(2sqrt(a b c))$。],
      answers: ([证明见解析。],),
      explanation: [由 $b+c>=2sqrt(b c)$，得 $a/(b+c)<=a/(2sqrt(b c))=a^(3/2)/(2sqrt(a b c))$。同理得到另外两式，相加即得
        $
          a/(b+c)+b/(a+c)+c/(a+b)<=(a^(3/2)+b^(3/2)+c^(3/2))/(2sqrt(a b c))=1/(2sqrt(a b c)).
        $
        当且仅当 $a=b=c=3^(-2/3)$ 时取等号。],
    ),
  ),
)
