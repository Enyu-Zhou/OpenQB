#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018天津理.pdf",
  regions: ("天津",),
)

#let flowchart() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.7, 10), (0.7, 10.6), radius: 0.18)
  content((0, 10.3), [开始])
  line((-1, 8.9), (0.8, 8.9), (1, 9.5), (-0.8, 9.5), close: true)
  content((0, 9.2), [输入 $N$])
  rect((-1.4, 7.8), (1.4, 8.4))
  content((0, 8.1), [$i=2,T=0$])
  line((0, 7.2), (3, 6.4), (0, 5.6), (-3, 6.4), close: true)
  content((0, 6.4), [$N/i$ 是整数？])
  rect((-1.2, 4.4), (1.2, 5))
  content((0, 4.7), [$T=T+1$])
  rect((-1.1, 3.3), (1.1, 3.9))
  content((0, 3.6), [$i=i+1$])
  line((0, 2.8), (1.3, 2.3), (0, 1.8), (-1.3, 2.3), close: true)
  content((0, 2.3), [$i>=5?$])
  line((-1, 0.7), (0.8, 0.7), (1, 1.3), (-0.8, 1.3), close: true)
  content((0, 1), [输出 $T$])
  rect((-0.7, -0.4), (0.7, 0.2), radius: 0.18)
  content((0, -0.1), [结束])
  for (a, b) in (
    (10, 9.5),
    (8.9, 8.4),
    (7.8, 7.2),
    (5.6, 5),
    (4.4, 3.9),
    (3.3, 2.8),
    (1.8, 1.3),
    (0.7, 0.2),
  ) { line((0, a), (0, b), mark: (end: ">")) }
  line((3, 6.4), (3.6, 6.4), (3.6, 4.15), (0.2, 4.15), mark: (end: ">"))
  line((0.2, 4.15), (0, 4.15))
  line((-1.3, 2.3), (-3.6, 2.3), (-3.6, 7.5), (-0.2, 7.5), mark: (end: ">"))
  line((-0.2, 7.5), (0, 7.5))
  for (pos, label) in (
    ((0.4, 5.3), [是]),
    ((3.2, 6.7), [否]),
    ((-1.7, 2.6), [否]),
    ((0.4, 1.55), [是]),
  ) { content(pos, label) }
})
#let quadrilateral() = cetz.canvas(length: 21mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (0, 0)
  let b = (calc.sqrt(3) / 2, 0.5)
  let c = (0, 2)
  let d = (-calc.sqrt(3) / 2, 0.5)
  let e = (-0.3 * calc.sqrt(3), 1.1)
  line(a, b, c, d, close: true)
  line(a, e, b)
  for (p, label, anchor) in (
    (a, $A$, "north"),
    (b, $B$, "west"),
    (c, $C$, "south"),
    (d, $D$, "east"),
    (e, $E$, "east"),
  ) { content(p, label, anchor: anchor, padding: 3pt) }
})
#let cube-diagram() = cetz.canvas(length: 29mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (1, 0, 0)
  let c = (1, 1, 0)
  let d = (0, 1, 0)
  let a1 = (0, 0, 1)
  let b1 = (1, 0, 1)
  let c1 = (1, 1, 1)
  let d1 = (0, 1, 1)
  let e = (0, 0.5, 0.5)
  let f = (0.5, 0, 0.5)
  let g = (1, 0.5, 0.5)
  let h = (0.5, 1, 0.5)
  let m = (0.5, 0.5, 1)
  oblique-project((1, 0), (0.4, 0.4), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(e, f, g, h, close: true, stroke: (dash: figure-style.dash))
    for p in (e, f, g, h) { line(m, p, stroke: (dash: figure-style.dash)) }
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "north-east"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "north-west"),
      (c1, $C_1$, "south"),
      (d1, $D_1$, "south"),
      (e, $E$, "east"),
      (f, $F$, "north"),
      (g, $G$, "west"),
      (h, $H$, "north"),
      (m, $M$, "south"),
    ) { content(p, label, anchor: anchor, padding: 2pt) }
  })
})
#let solid-diagram() = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  let d = (0, 0, 0)
  let a = (2, 0, 0)
  let b = (1, 2, 0)
  let c = (0, 2, 0)
  let e = (2, 0, 2)
  let f = (0, 1, 2)
  let g = (0, 0, 2)
  let m = (0, 1.5, 1)
  let n = (1, 0, 2)
  oblique-project((-0.4, -0.4), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, e, g, f, c, b, a)
    line(e, f, b, e)
    for (u, v) in ((a, d), (d, c), (d, g), (d, e), (e, c), (n, m)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    for (p, label, anchor) in (
      (a, $A$, "north"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "north-east"),
      (e, $E$, "east"),
      (f, $F$, "south-west"),
      (g, $G$, "south"),
      (m, $M$, "west"),
      (n, $N$, "south-east"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [设全集为 $RR$，集合 $A={x | 0<x<2}$，$B={x | x>=1}$，则 $A inter (complement_(RR) B)=$#choice-placeholder()。],
  choices: (
    [${x | 0<x<=1}$],
    [${x | 0<x<1}$],
    [${x | 1<=x<2}$],
    [${x | 0<x<2}$],
  ),
  answers: ([B],),
  explanation: [$complement_(RR) B=(-infinity,1)$，故 $A inter (complement_(RR) B)=(0,1)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设变量 $x,y$ 满足约束条件 $cases(x+y<=5, 2x-y<=4, -x+y<=1, y>=0)$，则目标函数 $z=3x+5y$ 的最大值为#choice-placeholder()。],
  choices: ([$6$], [$19$], [$21$], [$45$]),
  answers: ([C],),
  explanation: [将第一个不等式乘以 $4$，再加上第三个不等式，得 $3x+5y<=21$。
    当 $(x,y)=(2,3)$ 时，所有约束均满足且取等，故最大值为 $21$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [阅读如图所示的程序框图，运行相应的程序，若输入 $N$ 的值为 $20$，则输出 $T$ 的值为#choice-placeholder()。
    #figure(flowchart())],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([B],),
  explanation: [程序依次检查 $i=2,3,4$ 是否整除 $20$。其中 $2,4$ 能整除，$3$ 不能，因此 $T$ 累加两次，输出 $2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $x in RR$，则“$|x-1/2|<1/2$”是“$x^3<1$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [前者等价于 $0<x<1$，后者等价于 $x<1$。∵ $(0,1)$ 是 $(-infinity,1)$ 的真子集，∴ 前者是后者的充分而不必要条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a=log_2 e$，$b=ln 2$，$c=log_(1/2) (1/3)$，则 $a,b,c$ 的大小关系为#choice-placeholder()。],
  choices: ([$a>b>c$], [$b>a>c$], [$c>b>a$], [$c>a>b$]),
  answers: ([D],),
  explanation: [∵ $2<e<3$，∴ $c=log_2 3>log_2 e=a>1$，而 $0<b=ln 2<1$，故 $c>a>b$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [将函数 $y=sin(2x+pi/5)$ 的图象向右平移 $pi/10$ 个单位长度，所得图象对应的函数#choice-placeholder()。],
  choices: (
    [在区间 $[3pi/4,5pi/4]$ 上单调递增],
    [在区间 $[3pi/4,pi]$ 上单调递减],
    [在区间 $[5pi/4,3pi/2]$ 上单调递增],
    [在区间 $[3pi/2,2pi]$ 上单调递减],
  ),
  answers: ([A],),
  explanation: [平移后为 $y=sin(2(x-pi/10)+pi/5)=sin 2x$。
    其单调递增区间为 $[k pi-pi/4,k pi+pi/4]$（$k in ZZ$），取 $k=1$ 即得选项 A。
    选项 B 所给区间上函数递增，选项 C 所给区间上函数递减，选项 D 所给区间上函数先减后增。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的离心率为 $2$，过右焦点且垂直于 $x$ 轴的直线与双曲线交于 $A,B$ 两点。设 $A,B$ 到双曲线同一条渐近线的距离分别为 $d_1$ 和 $d_2$，且 $d_1+d_2=6$，则双曲线的方程为#choice-placeholder()。],
  choices: (
    [$x^2/4-y^2/12=1$],
    [$x^2/12-y^2/4=1$],
    [$x^2/3-y^2/9=1$],
    [$x^2/9-y^2/3=1$],
  ),
  answers: ([C],),
  explanation: [设半焦距为 $c$，则 $A,B$ 的坐标为 $(c,±b^2/a)$。取渐近线 $b x-a y=0$，由 $c>b>0$，得
    $ d_1+d_2=(b c-b^2)/c+(b c+b^2)/c=2b=6. $
    故 $b=3$。又 $c=2a$、$c^2=a^2+b^2$，得 $a^2=3$，所求方程为 $x^2/3-y^2/9=1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，在平面四边形 $A B C D$ 中，$A B perp B C$，$A D perp C D$，$angle B A D=120 degree$，$A B=A D=1$。若点 $E$ 为边 $C D$ 上的动点，则 $arrow(A E) dot arrow(B E)$ 的最小值为#choice-placeholder()。
    #figure(quadrilateral())],
  choices: ([$21/16$], [$3/2$], [$25/16$], [$3$]),
  answers: ([A],),
  explanation: [两个直角三角形 $A B C$、$A D C$ 由斜边、直角边对应相等而全等，故 $B C=C D$，$A C$ 平分 $angle B A D$，从而 $B C=C D=sqrt(3)$。
    设 $arrow(D E)=t arrow(D C)$，$0<=t<=1$，由 $arrow(A D) perp arrow(D C)$ 得
    $
      arrow(A E) dot arrow(B E)=(arrow(A D)+t arrow(D C)) dot (arrow(B D)+t arrow(D C))=3t^2-3/2 t+3/2=3(t-1/4)^2+21/16.
    $
    当 $t=1/4$ 时取到最小值 $21/16$。],
)
#section[填空题：本题共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [$"i"$ 是虚数单位，复数 $(6+7"i")/(1+2"i")=$#fill-placeholder()。],
  answers: ([$4-"i"$],),
  explanation: [乘以分母的共轭复数，得 $(6+7"i")/(1+2"i")=((6+7"i")(1-2"i"))/5=(20-5"i")/5=4-"i"$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $(x-1/(2sqrt(x)))^5$ 的展开式中，$x^2$ 的系数为#fill-placeholder()。],
  answers: ([$5/2$],),
  explanation: [通项为 $T_(r+1)=binom(5, r)(-1/2)^r x^(5-3r/2)$。令 $5-3r/2=2$，得 $r=2$，故所求系数为 $binom(5, 2)/4=5/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知正方体 $A B C D-A_1 B_1 C_1 D_1$ 的棱长为 $1$，除面 $A B C D$ 外，该正方体其余各面的中心分别为点 $E,F,G,H,M$（如图），则四棱锥 $M-E F G H$ 的体积为#fill-placeholder()。
    #figure(cube-diagram())],
  answers: ([$1/12$],),
  explanation: [四个侧面中心所在的平面平行于底面，$E F G H$ 是边长为 $sqrt(2)/2$ 的正方形，面积为 $1/2$。
    顶点 $M$ 到该平面的距离为 $1/2$，故体积为 $1/3 times 1/2 times 1/2=1/12$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知圆 $x^2+y^2-2x=0$ 的圆心为 $C$，直线 $cases(x=-1+sqrt(2)/2 t, y=3-sqrt(2)/2 t)$（$t$ 为参数）与该圆相交于 $A,B$ 两点，则 $triangle A B C$ 的面积为#fill-placeholder()。],
  answers: ([$1/2$],),
  explanation: [圆心 $C=(1,0)$、半径 $r=1$，直线的普通方程为 $x+y-2=0$。
    圆心到直线的距离为 $d=1/sqrt(2)$，弦长 $|A B|=2sqrt(1-d^2)=sqrt(2)$，故面积为 $1/2 |A B|d=1/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $a,b in RR$，且 $a-3b+6=0$，则 $2^a+1/8^b$ 的最小值为#fill-placeholder()。],
  answers: ([$1/4$],),
  explanation: [由 $a-3b=-6$，得 $2^a+2^(-3b)>=2sqrt(2^(a-3b))=1/4$。
    当 $a=-3$、$b=1$ 时，满足条件且两项相等，故最小值为 $1/4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $a>0$，函数 $f(x)=cases(x^2+2a x+a & quad x<=0, -x^2+2a x-2a & quad x>0)$。若关于 $x$ 的方程 $f(x)=a x$ 恰有 $2$ 个互异的实数解，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$(4,8)$],),
  explanation: [当 $x<=0$ 时，方程为 $x^2+a x+a=0$，判别式为 $a(a-4)$；有实根时，由两根和为 $-a<0$、积为 $a>0$，所有实根均为负。
    当 $x>0$ 时，方程为 $x^2-a x+2a=0$，判别式为 $a(a-8)$；有实根时，两根均为正。
    故 $0<a<4$、$a=4$、$4<a<8$、$a=8$、$a>8$ 时，不同实根个数依次为 $0,1,2,3,4$。
    因此所求范围为 $(4,8)$。],
)
#section[解答题：本题共 6 小题，共 80 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [在 $triangle A B C$ 中，内角 $A,B,C$ 所对的边分别为 $a,b,c$。已知 $b sin A=a cos(B-pi/6)$。],
  parts: (
    subquestion(
      stem: [求角 $B$ 的大小。],
      answers: ([$pi/3$],),
      explanation: [由正弦定理，$b sin A=a sin B$，所以 $sin B=cos(B-pi/6)=sqrt(3)/2 cos B+1/2 sin B$。
        故 $sin B=sqrt(3)cos B$。∵ $0<B<pi$，∴ $B=pi/3$。],
    ),
    subquestion(
      stem: [设 $a=2$，$c=3$，求 $b$ 和 $sin(2A-B)$ 的值。],
      answers: ([$b=sqrt(7)$，$sin(2A-B)=3sqrt(3)/14$。],),
      explanation: [由余弦定理，$b^2=4+9-2 times 2 times 3 times 1/2=7$，故 $b=sqrt(7)$。
        由正弦定理，$sin A=(a sin B)/b=sqrt(3)/sqrt(7)$；又 $a<c$，故 $A<pi/2$，$cos A=2/sqrt(7)$。
        于是 $sin 2A=4sqrt(3)/7$、$cos 2A=1/7$，所以
        $
          sin(2A-B)=sin 2A cos B-cos 2A sin B=4sqrt(3)/7 times 1/2-1/7 times sqrt(3)/2=3sqrt(3)/14.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知某单位甲、乙、丙三个部门的员工人数分别为 $24,16,16$。现采用分层抽样的方法从中抽取 $7$ 人，进行睡眠时间的调查。],
  parts: (
    subquestion(
      stem: [应从甲、乙、丙三个部门的员工中分别抽取多少人？],
      answers: ([分别抽取 $3,2,2$ 人。],),
      explanation: [三个部门人数之比为 $24:16:16=3:2:2$，按比例抽取 $7$ 人，应分别抽取 $3,2,2$ 人。],
    ),
    subquestion(
      stem: [若抽出的 $7$ 人中有 $4$ 人睡眠不足，$3$ 人睡眠充足，现从这 $7$ 人中随机抽取 $3$ 人做进一步的身体检查。],
      parts: (
        subquestion(
          stem: [用 $X$ 表示抽取的 $3$ 人中睡眠不足的员工人数，求随机变量 $X$ 的分布列与数学期望。],
          answers: (
            [#table(
                columns: 5,
                align: center,
                [$X$], [$0$], [$1$], [$2$], [$3$],
                [$P$], [$1/35$], [$12/35$], [$18/35$], [$4/35$],
              )
              $E(X)=12/7$。],
          ),
          explanation: [$X$ 的可能取值为 $0,1,2,3$，且 $P(X=k)=(binom(4, k)binom(3, 3-k))/binom(7, 3)$。
            代入得四个概率依次为 $1/35,12/35,18/35,4/35$，所以 $E(X)=(0+12+36+12)/35=12/7$。],
        ),
        subquestion(
          stem: [设 $A$ 为事件“抽取的 $3$ 人中，既有睡眠充足的员工，也有睡眠不足的员工”，求事件 $A$ 发生的概率。],
          answers: ([$6/7$],),
          explanation: [事件 $A$ 对应 $X=1$ 或 $X=2$，二者互斥，故 $P(A)=12/35+18/35=6/7$。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [如图，$A D parallel B C$ 且 $A D=2B C$，$A D perp C D$，$E G parallel A D$ 且 $E G=A D$，$C D parallel F G$ 且 $C D=2F G$，$D G perp$ 平面 $A B C D$，$D A=D C=D G=2$。
    #figure(solid-diagram())],
  parts: (
    subquestion(
      stem: [若 $M$ 为 $C F$ 的中点，$N$ 为 $E G$ 的中点，求证：$M N parallel$ 平面 $C D E$。],
      answers: ([证明见解析。],),
      explanation: [以 $D$ 为原点，$D A,D C,D G$ 的方向分别为 $x,y,z$ 轴正方向，建立空间直角坐标系，则
        $ D=(0,0,0),quad A=(2,0,0),quad B=(1,2,0),quad C=(0,2,0), $
        $ E=(2,0,2),quad F=(0,1,2),quad G=(0,0,2). $
        故 $M=(0,3/2,1)$、$N=(1,0,2)$，平面 $C D E$ 的方程为 $x-z=0$。
        直线 $M N$ 上的点为 $(t,3/2-3t/2,1+t)$，始终有 $x-z=-1$，所以直线与平面不相交，即 $M N parallel$ 平面 $C D E$。],
    ),
    subquestion(
      stem: [求二面角 $E-B C-F$ 的正弦值。],
      answers: ([$sqrt(10)/10$],),
      explanation: [沿用第（1）问的坐标系，平面 $B C E$ 的一个法向量为 $bold(n)=(0,1,1)$，平面 $B C F$ 的一个法向量为 $bold(m)=(0,2,1)$。
        两法向量夹角的余弦为 $3/sqrt(10)$。二面角的平面角与该夹角相等或互补，故其正弦为 $sqrt(1-9/10)=sqrt(10)/10$。],
    ),
    subquestion(
      stem: [若点 $P$ 在线段 $D G$ 上，且直线 $B P$ 与平面 $A D G E$ 所成的角为 $60 degree$，求线段 $D P$ 的长。],
      answers: ([$sqrt(3)/3$],),
      explanation: [设 $D P=h$，$0<=h<=2$，则 $P=(0,0,h)$、$arrow(B P)=(-1,-2,h)$。
        平面 $A D G E$ 为 $y=0$，法向量可取 $(0,1,0)$，所以 $sin 60 degree=2/sqrt(h^2+5)$。
        解得 $h^2=1/3$，由 $h>=0$ 得 $D P=sqrt(3)/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设 ${a_n}$ 是等比数列，公比大于 $0$，其前 $n$ 项和为 $S_n$（$n in NN^*$），${b_n}$ 是等差数列。已知 $a_1=1$，$a_3=a_2+2$，$a_4=b_3+b_5$，$a_5=b_4+2b_6$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 和 ${b_n}$ 的通项公式。],
      answers: ([$a_n=2^(n-1)$，$b_n=n$。],),
      explanation: [设等比数列公比为 $q>0$，则 $q^2=q+2$，故 $q=2$，$a_n=2^(n-1)$。
        设等差数列公差为 $d$，由后两个条件得 $b_1+3d=4$、$3b_1+13d=16$，解得 $b_1=d=1$，故 $b_n=n$。],
    ),
    subquestion(
      stem: [设数列 ${S_n}$ 的前 $n$ 项和为 $T_n$（$n in NN^*$）。],
      parts: (
        subquestion(
          stem: [求 $T_n$。],
          answers: ([$T_n=2^(n+1)-n-2$。],),
          explanation: [$S_n=2^n-1$，故 $T_n=sum_(k=1)^n (2^k-1)=2^(n+1)-2-n$。],
        ),
        subquestion(
          stem: [证明 $sum_(k=1)^n frac((T_k+b_(k+2))b_k, (k+1)(k+2))=2^(n+2)/(n+2)-2$（$n in NN^*$）。],
          answers: ([证明见解析。],),
          explanation: [由前两问，
            $
              frac((T_k+b_(k+2))b_k, (k+1)(k+2))=frac(k 2^(k+1), (k+1)(k+2))=2^(k+2)/(k+2)-2^(k+1)/(k+1).
            $
            裂项相消得
            $
              sum_(k=1)^n frac((T_k+b_(k+2))b_k, (k+1)(k+2))=2^(n+2)/(n+2)-2^2/2=2^(n+2)/(n+2)-2.
            $],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的左焦点为 $F$，上顶点为 $B$。已知椭圆的离心率为 $sqrt(5)/3$，点 $A$ 的坐标为 $(b,0)$，且 $|F B| dot |A B|=6sqrt(2)$。],
  parts: (
    subquestion(
      stem: [求椭圆的方程。],
      answers: ([$x^2/9+y^2/4=1$。],),
      explanation: [由 $c^2/a^2=5/9$、$a^2=b^2+c^2$ 得 $2a=3b$。
        又 $|F B|=a$、$|A B|=sqrt(2)b$，故 $a b=6$。解得 $a=3$、$b=2$，椭圆方程为 $x^2/9+y^2/4=1$。],
    ),
    subquestion(
      stem: [设直线 $l:y=k x$（$k>0$）与椭圆在第一象限的交点为 $P$，且 $l$ 与直线 $A B$ 交于点 $Q$。若 $frac(|A Q|, |P Q|)=5sqrt(2)/4 sin angle A O Q$（$O$ 为原点），求 $k$ 的值。],
      answers: ([$k=1/2$ 或 $k=11/28$。],),
      explanation: [#step[将长度条件化为纵坐标关系][由 $A=(2,0)$、$B=(0,2)$，得直线 $A B:x+y=2$。
          点 $Q$ 在开线段 $A B$ 内，也在椭圆内部。设 $P,Q$ 的纵坐标分别为 $y_1,y_2$，则 $y_1>y_2>0$。
          ∵ $|A Q|=sqrt(2)y_2$，$|P Q|sin angle A O Q=y_1-y_2$，∴ 题给条件等价于 $sqrt(2)y_2=5sqrt(2)/4(y_1-y_2)$，即 $5y_1=9y_2$。]
        #step[解关于斜率的方程][分别联立直线与椭圆、直线 $A B$，得 $y_1=6k/sqrt(9k^2+4)$、$y_2=2k/(k+1)$。
          代入并约去正数 $k$，得 $5(k+1)=3sqrt(9k^2+4)$，两边均为正，平方得 $56k^2-50k+11=0$。
          解得 $k=1/2$ 或 $11/28$，两者均满足原式。]],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知函数 $f(x)=a^x$，$g(x)=log_a x$，其中 $a>1$。],
  parts: (
    subquestion(
      stem: [求函数 $h(x)=f(x)-x ln a$ 的单调区间。],
      answers: (
        [单调递减区间为 $(-infinity,0]$，单调递增区间为 $[0,+infinity)$。],
      ),
      explanation: [$h'(x)=(a^x-1)ln a$。∵ $a>1$，∴ 当 $x<0$ 时导数为负，当 $x>0$ 时导数为正。
        故 $h$ 在 $(-infinity,0]$ 上递减，在 $[0,+infinity)$ 上递增，且最小值为 $h(0)=1$。],
    ),
    subquestion(
      stem: [若曲线 $y=f(x)$ 在点 $(x_1,f(x_1))$ 处的切线与曲线 $y=g(x)$ 在点 $(x_2,g(x_2))$ 处的切线平行，证明 $x_1+g(x_2)=-(2ln ln a)/(ln a)$。],
      answers: ([证明见解析。],),
      explanation: [两切线斜率相等，故 $a^(x_1)ln a=1/(x_2 ln a)$，即 $x_2 a^(x_1)(ln a)^2=1$。
        两边取自然对数，得 $ln x_2+x_1 ln a+2ln ln a=0$。除以 $ln a>0$ 即得 $x_1+g(x_2)=-(2ln ln a)/(ln a)$。],
    ),
    subquestion(
      stem: [证明当 $a>=e^(1/e)$ 时，存在直线 $l$，使 $l$ 是曲线 $y=f(x)$ 的切线，也是曲线 $y=g(x)$ 的切线。],
      answers: ([证明见解析。],),
      explanation: [#step[用斜率表示两条切线][记 $L=ln a>0$。任给斜率 $t>0$，两曲线相应切点的横坐标分别为
          $ x_1=ln(t/L)/L,quad x_2=1/(t L). $
          指数曲线的切线纵截距为 $t/L-t ln(t/L)/L$，对数曲线的切线纵截距为 $-ln(t L)/L-1/L$。
          因此两条切线重合的充要条件为
          $ phi(t)=ln(t L)+t-t ln(t/L)+1=0. $]
        #step[证明截距差存在零点][由 $a>=e^(1/e)$ 得 $ln L>=-1$，故 $phi(1)=2+2ln L>=0$。
          取充分大的正数 $N$，使 $N>ln L$ 且 $N>1+2ln L+L$，令 $t_0=L e^(-N)$，则 $0<t_0<1$。
          由第（1）问的最小值结论，代入 $x=N/L$ 得 $e^N>=1+N$，所以
          $ phi(t_0)=1+2ln L-N+L(1+N)e^(-N)<=1+2ln L-N+L<0. $
          ∵ $phi$ 在 $[t_0,1]$ 上连续，∴ 存在 $t in (t_0,1]$ 使 $phi(t)=0$。
          对应两条切线斜率、纵截距均相同，故存在所求公切线。]],
    ),
  ),
)
