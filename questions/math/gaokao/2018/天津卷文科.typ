#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018天津文.pdf",
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

#let vector-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (0.2, 2.2)
  let m = (-calc.sqrt(3) / 2, 0.5)
  let n = (calc.sqrt(3), 1)
  let b = (3 * m.at(0) - 2 * a.at(0), 3 * m.at(1) - 2 * a.at(1))
  let c = (3 * n.at(0) - 2 * a.at(0), 3 * n.at(1) - 2 * a.at(1))
  let o = (0, 0)
  line(a, b, c, close: true)
  line(m, o, n)
  for (p, label, anchor) in (
    (a, $A$, "south"),
    (b, $B$, "north-east"),
    (c, $C$, "west"),
    (m, $M$, "east"),
    (n, $N$, "south-west"),
    (o, $O$, "north"),
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
  oblique-project((1, 0), (0.4, 0.4), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1, d1)
    line(a1, b)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d1, d, b, stroke: (dash: figure-style.dash))
    line(a1, d, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "north-east"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south"),
      (d1, $D_1$, "south"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})
#let tetrahedron(auxiliary: false) = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (1, calc.sqrt(3), 0)
  let d = (0, 0, 2 * calc.sqrt(3))
  let m = (1, 0, 0)
  let n = (0.5, calc.sqrt(3) / 2, 0)
  oblique-project((-0.5, -0.6), (0.15, -0.6), (0.8, -0.15), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, d, a, c)
    line(b, d, stroke: (dash: figure-style.dash))
    line(m, d, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(m, n, d)
      line(c, m)
      content(n, $N$, anchor: "north-east", padding: 2pt)
    }
    for (p, label, anchor) in (
      (a, $A$, "south"),
      (b, $B$, "east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (m, $M$, "east"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={1,2,3,4}$，$B={-1,0,2,3}$，$C={x in RR | -1<=x<2}$，则 $(A union B) inter C=$#choice-placeholder()。],
  choices: ([${-1,1}$], [${0,1}$], [${-1,0,1}$], [${2,3,4}$]),
  answers: ([C],),
  explanation: [$A union B={-1,0,1,2,3,4}$，与 $C=[-1,2)$ 取交集，得 ${-1,0,1}$。],
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
  stem: [设 $x in RR$，则“$x^3>8$”是“$|x|>2$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [前者等价于 $x>2$，后者等价于 $x>2$ 或 $x< -2$。前者能推出后者，而后者不能推出前者，故为充分而不必要条件。],
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
  stem: [已知 $a=log_3 (7/2)$，$b=(1/4)^(1/3)$，$c=log_(1/3) (1/5)$，则 $a,b,c$ 的大小关系为#choice-placeholder()。],
  choices: ([$a>b>c$], [$b>a>c$], [$c>b>a$], [$c>a>b$]),
  answers: ([D],),
  explanation: [∵ $5>7/2>3$，∴ $c=log_3 5>log_3 (7/2)=a>1$，又 $0<b<1$，故 $c>a>b$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [将函数 $y=sin(2x+pi/5)$ 的图象向右平移 $pi/10$ 个单位长度，所得图象对应的函数#choice-placeholder()。],
  choices: (
    [在区间 $[-pi/4,pi/4]$ 上单调递增],
    [在区间 $[-pi/4,0]$ 上单调递减],
    [在区间 $[pi/4,pi/2]$ 上单调递增],
    [在区间 $[pi/2,pi]$ 上单调递减],
  ),
  answers: ([A],),
  explanation: [平移后为 $y=sin(2(x-pi/10)+pi/5)=sin 2x$。
    其单调递增区间为 $[k pi-pi/4,k pi+pi/4]$（$k in ZZ$），取 $k=0$ 即得选项 A。
    选项 B 所给区间上函数递增，选项 C 所给区间上函数递减，选项 D 所给区间上函数先减后增。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的离心率为 $2$，过右焦点且垂直于 $x$ 轴的直线与双曲线交于 $A,B$ 两点。设 $A,B$ 到双曲线同一条渐近线的距离分别为 $d_1$ 和 $d_2$，且 $d_1+d_2=6$，则双曲线的方程为#choice-placeholder()。],
  choices: (
    [$x^2/3-y^2/9=1$],
    [$x^2/9-y^2/3=1$],
    [$x^2/4-y^2/12=1$],
    [$x^2/12-y^2/4=1$],
  ),
  answers: ([A],),
  explanation: [设半焦距为 $c$，则 $A,B$ 的坐标为 $(c,±b^2/a)$。取渐近线 $b x-a y=0$，由 $c>b>0$，得
    $ d_1+d_2=(b c-b^2)/c+(b c+b^2)/c=2b=6. $
    故 $b=3$。又 $c=2a$、$c^2=a^2+b^2$，得 $a^2=3$，所求方程为 $x^2/3-y^2/9=1$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [在如图的平面图形中，已知 $O M=1$，$O N=2$，$angle M O N=120 degree$，$arrow(B M)=2arrow(M A)$，$arrow(C N)=2arrow(N A)$，则 $arrow(B C) dot arrow(O M)$ 的值为#choice-placeholder()。
    #figure(vector-diagram())],
  choices: ([$-15$], [$-9$], [$-6$], [$0$]),
  answers: ([C],),
  explanation: [由题设，$M,N$ 分别为 $A B,A C$ 上靠近 $A$ 的三等分点，所以 $arrow(B C)=3arrow(M N)=3(arrow(O N)-arrow(O M))$。
    ∴ $arrow(B C) dot arrow(O M)=3(O N dot O M cos 120 degree-O M^2)=3(2 times 1 times (-1/2)-1)=-6$。],
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
  stem: [已知函数 $f(x)=e^x ln x$，$f'(x)$ 为 $f(x)$ 的导函数，则 $f'(1)$ 的值为#fill-placeholder()。],
  answers: ([$e$],),
  explanation: [$f'(x)=e^x ln x+e^x/x$，故 $f'(1)=e ln 1+e=e$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，已知正方体 $A B C D-A_1 B_1 C_1 D_1$ 的棱长为 $1$，则四棱锥 $A_1-B B_1 D_1 D$ 的体积为#fill-placeholder()。
    #figure(cube-diagram())],
  answers: ([$1/3$],),
  explanation: [底面 $B B_1 D_1 D$ 是长为 $sqrt(2)$、宽为 $1$ 的矩形，面积为 $sqrt(2)$。
    设顶面中心为 $O$，则 $A_1 O perp B_1 D_1$，且 $A_1 O perp D D_1$，所以 $A_1 O$ 垂直底面 $B B_1 D_1 D$，锥高为 $sqrt(2)/2$。
    因而体积为 $1/3 times sqrt(2) times sqrt(2)/2=1/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系中，经过三点 $(0,0),(1,1),(2,0)$ 的圆的方程为#fill-placeholder()。],
  answers: ([$x^2+y^2-2x=0$。],),
  explanation: [由三点构成的三角形在 $(1,1)$ 处为直角，圆的直径端点为 $(0,0)$、$(2,0)$。
    所以圆心为 $(1,0)$、半径为 $1$，方程为 $(x-1)^2+y^2=1$，即 $x^2+y^2-2x=0$。],
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
  stem: [已知 $a in RR$，函数 $f(x)=cases(x^2+2x+a-2 & quad x<=0, -x^2+2x-2a & quad x>0)$。若对任意 $x in [-3,+infinity)$，$f(x)<=|x|$ 恒成立，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$[1/8,2]$],),
  explanation: [当 $-3<=x<=0$ 时，不等式等价于 $a<=-x^2-3x+2$。右侧在该区间的最小值为 $2$，故需 $a<=2$。
    当 $x>0$ 时，不等式等价于 $a>=(x-x^2)/2=1/8-1/2(x-1/2)^2$。右侧最大值为 $1/8$，故需 $a>=1/8$。
    两者合并得 $a in [1/8,2]$。],
)
#section[解答题：本题共 6 小题，共 80 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [已知某校甲、乙、丙三个年级的学生志愿者人数分别为 $240,160,160$。现采用分层抽样的方法从中抽取 $7$ 名同学去某敬老院参加献爱心活动。],
  parts: (
    subquestion(
      stem: [应从甲、乙、丙三个年级的学生志愿者中分别抽取多少人？],
      answers: ([分别抽取 $3,2,2$ 人。],),
      explanation: [三个年级人数之比为 $240:160:160=3:2:2$，按比例抽取 $7$ 人，应分别抽取 $3,2,2$ 人。],
    ),
    subquestion(
      stem: [设抽出的 $7$ 名同学分别用 $A,B,C,D,E,F,G$ 表示，现从中随机抽取 $2$ 名同学承担敬老院的卫生工作。],
      parts: (
        subquestion(
          stem: [试用所给字母列举出所有可能的抽取结果。],
          answers: ([共 $21$ 种，具体结果见解析。],),
          explanation: [用无序集合表示抽出的两名同学，所有结果为
            $ {A,B}, {A,C}, {A,D}, {A,E}, {A,F}, {A,G}, $
            $ {B,C}, {B,D}, {B,E}, {B,F}, {B,G}, $
            $ {C,D}, {C,E}, {C,F}, {C,G}, $
            $ {D,E}, {D,F}, {D,G}, {E,F}, {E,G}, {F,G}. $
            共 $6+5+4+3+2+1=21$ 种。],
        ),
        subquestion(
          stem: [设 $M$ 为事件“抽取的 $2$ 名同学来自同一年级”，求事件 $M$ 发生的概率。],
          answers: ([$5/21$],),
          explanation: [不妨设来自甲年级的为 $A,B,C$，乙年级的为 $D,E$，丙年级的为 $F,G$。
            同一年级的抽取结果为 ${A,B}$、${A,C}$、${B,C}$、${D,E}$、${F,G}$，共 $5$ 种。
            所有 $21$ 种结果等可能，故 $P(M)=5/21$。],
        ),
      ),
    ),
  ),
)
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
  stem: [如图，在四面体 $A B C D$ 中，$triangle A B C$ 是等边三角形，平面 $A B C perp$ 平面 $A B D$，点 $M$ 为棱 $A B$ 的中点，$A B=2$，$A D=2sqrt(3)$，$angle B A D=90 degree$。
    #figure(tetrahedron())],
  parts: (
    subquestion(
      stem: [求证：$A D perp B C$。],
      answers: ([证明见解析。],),
      explanation: [由平面 $A B C perp$ 平面 $A B D$，交线为 $A B$，且 $A D perp A B$，得 $A D perp$ 平面 $A B C$。
        ∵ $B C subset$ 平面 $A B C$，∴ $A D perp B C$。],
    ),
    subquestion(
      stem: [求异面直线 $B C$ 与 $M D$ 所成角的余弦值。],
      answers: ([$sqrt(13)/26$],),
      explanation: [取 $A C$ 的中点 $N$，连接 $M N,D N$，则 $M N parallel B C$，$M N=(B C)/2=1$。
        由第（1）问，$A D perp A M$、$A D perp A N$，又 $A M=A N=1$，故 $D M=D N=sqrt(12+1)=sqrt(13)$。
        在等腰三角形 $D M N$ 中，$angle D M N$ 为锐角，故是两异面直线所成的角。其余弦为 $frac(M N, 2D M)=1/(2sqrt(13))=sqrt(13)/26$。
        #figure(tetrahedron(auxiliary: true))],
    ),
    subquestion(
      stem: [求直线 $C D$ 与平面 $A B D$ 所成角的正弦值。],
      answers: ([$sqrt(3)/4$],),
      explanation: [连接 $C M$。由等边三角形性质，$C M perp A B$、$C M=sqrt(3)$。
        再由两平面垂直，得 $C M perp$ 平面 $A B D$，因此 $angle C D M$ 为直线 $C D$ 与该平面所成的角。
        又 $C D=sqrt(A C^2+A D^2)=sqrt(4+12)=4$，故 $sin angle C D M=frac(C M, C D)=sqrt(3)/4$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设 ${a_n}$ 是等差数列，其前 $n$ 项和为 $S_n$（$n in NN^*$），${b_n}$ 是等比数列，公比大于 $0$，其前 $n$ 项和为 $T_n$（$n in NN^*$）。已知 $b_1=1$，$b_3=b_2+2$，$b_4=a_3+a_5$，$b_5=a_4+2a_6$。],
  parts: (
    subquestion(
      stem: [求 $S_n$ 和 $T_n$。],
      answers: ([$S_n=n(n+1)/2$，$T_n=2^n-1$。],),
      explanation: [设等比数列公比为 $q>0$，则 $q^2=q+2$，故 $q=2$，$b_n=2^(n-1)$，$T_n=2^n-1$。
        设等差数列公差为 $d$，由后两个条件得 $a_1+3d=4$、$3a_1+13d=16$，解得 $a_1=d=1$，故 $a_n=n$，$S_n=n(n+1)/2$。],
    ),
    subquestion(
      stem: [若 $S_n+(T_1+T_2+dots+T_n)=a_n+4b_n$，求正整数 $n$ 的值。],
      answers: ([$n=4$。],),
      explanation: [由 $T_1+T_2+dots+T_n=sum_(k=1)^n (2^k-1)=2^(n+1)-n-2$，原方程化为
        $ n(n+1)/2+2^(n+1)-n-2=n+2^(n+1), $
        即 $n^2-3n-4=0$，解得 $n=4$ 或 $-1$。∵ $n$ 为正整数，∴ $n=4$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的右顶点为 $A$，上顶点为 $B$。已知椭圆的离心率为 $sqrt(5)/3$，$|A B|=sqrt(13)$。],
  parts: (
    subquestion(
      stem: [求椭圆的方程。],
      answers: ([$x^2/9+y^2/4=1$。],),
      explanation: [由 $c^2/a^2=5/9$、$a^2=b^2+c^2$ 得 $2a=3b$。又 $a^2+b^2=|A B|^2=13$，故 $a=3$、$b=2$。
        因此椭圆方程为 $x^2/9+y^2/4=1$。],
    ),
    subquestion(
      stem: [设直线 $l:y=k x$（$k<0$）与椭圆交于 $P,Q$ 两点，$l$ 与直线 $A B$ 交于点 $M$，且点 $P,M$ 均在第四象限。若 $triangle B P M$ 的面积是 $triangle B P Q$ 面积的 $2$ 倍，求 $k$ 的值。],
      answers: ([$k=-1/2$。],),
      explanation: [#step[由面积比确定点的位置关系][设 $P=(x_1,y_1)$，则 $x_1>0$、$Q=(-x_1,-y_1)$。由 $A=(3,0)$、$B=(0,2)$，得直线 $A B:2x+3y=6$。
          设 $M=(x_2,y_2)$，因其在第四象限，故 $x_2>3>x_1$。
          两三角形对直线 $l$ 的高相同，故 $|P M|=2|P Q|$，从而 $x_2-x_1=4x_1$，即 $x_2=5x_1$。]
        #step[求斜率][联立直线与椭圆、直线 $A B$，得 $x_1=6/sqrt(9k^2+4)$、$x_2=6/(2+3k)$。
          ∵ $x_2>0$，∴ $2+3k>0$。由 $x_2=5x_1$ 得 $sqrt(9k^2+4)=5(2+3k)$。
          平方并整理得 $18k^2+25k+8=0$，解得 $k=-1/2$ 或 $-8/9$。后者不满足 $2+3k>0$，舍去。
          故 $k=-1/2$。]],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设函数 $f(x)=(x-t_1)(x-t_2)(x-t_3)$，其中 $t_1,t_2,t_3 in RR$，且 $t_1,t_2,t_3$ 是公差为 $d$ 的等差数列。],
  parts: (
    subquestion(
      stem: [若 $t_2=0$，$d=1$，求曲线 $y=f(x)$ 在点 $(0,f(0))$ 处的切线方程。],
      answers: ([$y=-x$。],),
      explanation: [此时 $t_1=-1$、$t_3=1$，故 $f(x)=(x+1)x(x-1)=x^3-x$。
        ∵ $f(0)=0$，$f'(0)=-1$，∴ 切线方程为 $y=-x$。],
    ),
    subquestion(
      stem: [若 $d=3$，求 $f(x)$ 的极值。],
      answers: ([极大值为 $6sqrt(3)$，极小值为 $-6sqrt(3)$。],),
      explanation: [令 $u=x-t_2$，则 $f(x)=(u+3)u(u-3)=u^3-9u$，所以 $f'(x)=3u^2-9$。
        导数在 $u< -sqrt(3)$ 和 $u>sqrt(3)$ 时为正，在 $-sqrt(3)<u<sqrt(3)$ 时为负。
        故在 $x=t_2-sqrt(3)$ 处取得极大值 $6sqrt(3)$，在 $x=t_2+sqrt(3)$ 处取得极小值 $-6sqrt(3)$。],
    ),
    subquestion(
      stem: [若曲线 $y=f(x)$ 与直线 $y=-(x-t_2)-6sqrt(3)$ 有三个互异的公共点，求 $d$ 的取值范围。],
      answers: ([$(-infinity,-sqrt(10)) union (sqrt(10),+infinity)$],),
      explanation: [#step[化为三次函数的零点问题][令 $u=x-t_2$，交点方程化为 $G(u)=u^3+(1-d^2)u+6sqrt(3)=0$。
          若 $d^2<=1$，则 $G'(u)=3u^2+1-d^2>=0$，$G$ 在 $RR$ 上严格递增，不可能有三个不同零点。]
        #step[利用极值确定范围][若 $d^2>1$，令 $s=sqrt((d^2-1)/3)>0$，则 $G'(u)=3(u^2-s^2)$。
          $G$ 在 $(-infinity,-s]$、$[s,+infinity)$ 上递增，在 $[-s,s]$ 上递减；极大值为 $G(-s)=2s^3+6sqrt(3)>0$，极小值为 $G(s)=6sqrt(3)-2s^3$。
          由于三次项系数为正，两端函数值分别趋向负、正无穷，所以恰有三个不同零点的充要条件为 $G(s)<0$。
          即 $s^3>3sqrt(3)$，等价于 $s>sqrt(3)$，也即 $d^2>10$。
          故 $d in (-infinity,-sqrt(10)) union (sqrt(10),+infinity)$。]],
    ),
  ),
)
