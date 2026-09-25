#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校招生全国统一考试",
  name: "全国乙卷（理科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2022/2022全国乙理(河南,山西,江西,安徽,陕西,甘肃,青海,内蒙古,黑龙江,吉林,.宁夏,新疆).pdf",
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

#section[选择题]
#question(
  "single-choice",
  stem: [设全集 $U={1,2,3,4,5}$，集合 $M$ 满足 $complement_U M={1,3}$，则#choice-placeholder()。],
  choices: ([$2 in M$], [$3 in M$], [$4 in.not M$], [$5 in.not M$]),
  answers: ([A],),
  explanation: [$M=U without {1,3}={2,4,5}$，故 $2 in M$。],
)
#question(
  "single-choice",
  stem: [已知 $z=1-2"i"$，且 $z+a overline(z)+b=0$，其中 $a,b$ 为实数，则#choice-placeholder()。],
  choices: ([$a=1,b=-2$], [$a=-1,b=2$], [$a=1,b=2$], [$a=-1,b=-2$]),
  answers: ([A],),
  explanation: [代入得 $(1+a+b)+(2a-2)"i"=0$。由实部、虚部均为零，得 $a=1,b=-2$。],
)
#question(
  "single-choice",
  stem: [已知向量 $bold(a),bold(b)$ 满足 $abs(bold(a))=1$，$abs(bold(b))=sqrt(3)$，$abs(bold(a)-2bold(b))=3$，则 $bold(a) dot bold(b)=$#choice-placeholder()。],
  choices: ([$-2$], [$-1$], [$1$], [$2$]),
  answers: ([C],),
  explanation: [由 $9=abs(bold(a)-2bold(b))^2=1-4bold(a) dot bold(b)+4 times 3$，得 $bold(a) dot bold(b)=1$。],
)
#question(
  "single-choice",
  stem: [嫦娥二号卫星在完成探月任务后，继续进行深空探测，成为我国第一颗环绕太阳飞行的人造行星。为研究嫦娥二号绕日周期与地球绕日周期的比值，用到数列 ${b_n}$：
    $
      b_1=1+1/alpha_1,quad b_2=1+1/(alpha_1+1/alpha_2),quad b_3=1+1/(alpha_1+1/(alpha_2+1/alpha_3)), dots
    $
    依此类推，其中 $alpha_k in NN^*(k=1,2,dots)$，则#choice-placeholder()。],
  choices: ([$b_1<b_5$], [$b_3<b_8$], [$b_6<b_2$], [$b_4<b_7$]),
  answers: ([D],),
  explanation: [固定前四层，令
    $ H(t)=1+1/(alpha_1+1/(alpha_2+1/(alpha_3+1/t)))quad(t>0). $
    四次取倒数使 $H$ 严格递增。$b_4=H(alpha_4)$，而 $b_7=H(alpha_4+1/(alpha_5+1/(alpha_6+1/alpha_7)))$，所以 $b_4<b_7$，D 正确。
    同理，固定奇数层得到严格递减的复合函数，故 $b_1>b_5$、$b_3>b_8$；固定两层得到严格递增的复合函数，故 $b_2<b_6$。],
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
    #table(
      columns: 4,
      align: center,
      [$n$], [$a$], [$b$], [$abs(b^2/a^2-2)$],
      [$2$], [$2$], [$3$], [$1/4$],
      [$3$], [$5$], [$7$], [$1/25$],
      [$4$], [$12$], [$17$], [$1/144$],
    )
    当 $n=4$ 时首次满足 $1/144<0.01$，输出 $4$。],
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
  stem: [已知球 $O$ 的半径为 $1$，四棱锥的顶点为 $O$，底面的四个顶点均在球 $O$ 的球面上，则当该四棱锥的体积最大时，其高为#choice-placeholder()。],
  choices: ([$1/3$], [$1/2$], [$sqrt(3)/3$], [$sqrt(2)/2$]),
  answers: ([C],),
  explanation: [设高为 $h$，底面所在截面圆的半径为 $r=sqrt(1-h^2)$。底面四边形两条对角线均不超过 $2r$，故面积 $S<=1/2 times 2r times 2r=2r^2$，当底面为正方形时取等号。
    因此 $V<=2/3 h(1-h^2)$。对 $h in (0,1)$，右侧导数为 $2/3(1-3h^2)$，先正后负，在 $h=sqrt(3)/3$ 时取得最大值。],
)
#question(
  "single-choice",
  stem: [某棋手与甲、乙、丙三位棋手各比赛一盘，各盘比赛结果相互独立。已知该棋手与甲、乙、丙比赛获胜的概率分别为 $p_1,p_2,p_3$，且 $p_3>p_2>p_1>0$。记该棋手连胜两盘的概率为 $p$，则#choice-placeholder()。],
  choices: (
    [$p$ 与该棋手和甲、乙、丙的比赛次序无关],
    [该棋手在第二盘与甲比赛，$p$ 最大],
    [该棋手在第二盘与乙比赛，$p$ 最大],
    [该棋手在第二盘与丙比赛，$p$ 最大],
  ),
  answers: ([D],),
  explanation: [连胜两盘即“前两盘均胜”或“后两盘均胜”，其中三盘全胜只能计一次。若第二盘获胜概率为 $p_i$，另两盘为 $p_j,p_k$，则 $P_i=p_i (p_j+p_k)-p_1p_2p_3$。
    比较得 $P_3-P_2=p_1(p_3-p_2)>0$，$P_3-P_1=p_2(p_3-p_1)>0$，故第二盘与丙比赛时概率最大。],
)

// 原卷按单选题命制，但现有条件同时允许 A、C；保留题干并在解析中说明。
#question(
  "multiple-choice",
  stem: [双曲线 $C$ 的两个焦点为 $F_1,F_2$，以 $C$ 的实轴为直径的圆记为 $D$，过 $F_1$ 作 $D$ 的切线与 $C$ 交于 $M,N$ 两点，且 $cos angle F_1 N F_2=3/5$，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$sqrt(5)/2$], [$3/2$], [$sqrt(13)/2$], [$sqrt(17)/2$]),
  answers: ([AC],),
  explanation: [原卷将本题列为单选题，但题干未限定两交点在双曲线的不同支上，按现有条件 A、C 均成立，不能唯一确定一个选项。
    #step[求出全部可能值][设双曲线的半实轴、半虚轴长分别为 $a,b$，半焦距为 $c$，记 $u=abs(N F_1),v=abs(N F_2)$。由双曲线定义，$abs(u-v)=2a$；在 $triangle F_1 N F_2$ 中用余弦定理，得
      $ 4c^2=u^2+v^2-6/5 u v=4a^2+4/5 u v, $
      所以 $u v=5b^2$。圆心到切线的距离为 $a$，而圆心是 $F_1 F_2$ 的中点，所以 $F_2$ 到切线的距离为 $2a$。又 $sin angle F_1 N F_2=4/5$，得 $4/5 v=2a$，即 $v=5a/2$，$u=2b^2/a$。
      因此 $abs(2b^2/a-5a/2)=2a$，得 $b^2/a^2=1/4$ 或 $9/4$，离心率分别为 $sqrt(5)/2$、$sqrt(13)/2$。]
    #step[验证两种情形均可实现][取 $a=2,b=1$，过左焦点的切线 $y=2(x+sqrt(5))$ 与双曲线 $x^2/4-y^2=1$ 有两个不同交点。取其中 $N=(-6sqrt(5)/5,-2sqrt(5)/5)$，有 $u=1,v=5$，从而所求余弦为 $3/5$。
      取 $a=2,b=3$，切线 $y=2/3(x+sqrt(13))$ 与 $x^2/4-y^2/9=1$ 有两个不同交点。取 $N=(14sqrt(13)/13,18sqrt(13)/13)$，有 $u=9,v=5$，同样满足余弦为 $3/5$。]
  ],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x),g(x)$ 的定义域均为 $RR$，且 $f(x)+g(2-x)=5$，$g(x)-f(x-4)=7$。若 $y=g(x)$ 的图像关于直线 $x=2$ 对称，$g(2)=4$，则 $sum_(k=1)^22 f(k)=$#choice-placeholder()。],
  choices: ([$-21$], [$-22$], [$-23$], [$-24$]),
  answers: ([D],),
  explanation: [由对称性，$g(2-x)=g(x+2)=f(x-2)+7$，所以 $f(x)+f(x-2)=-2$，进而 $f(x+4)=f(x)$。
    由 $f(0)+g(2)=5$，得 $f(0)=1$，$f(2)=-3$。将第二个条件中的 $x$ 换为 $x+4$，再消去 $f(x)$，得 $g(x+4)+g(2-x)=12$。取 $x=-1$，得 $g(3)=6$；又 $g(1)=g(3)$，故 $f(1)=5-g(1)=-1$。
    每连续四项的和为 $-4$，所以 $sum_(k=1)^22 f(k)=5 times (-4)+f(1)+f(2)=-24$。],
)
#section[填空题]
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
  stem: [记函数 $f(x)=cos(omega x+phi)(omega>0,0<phi<pi)$ 的最小正周期为 $T$。若 $f(T)=sqrt(3)/2$，$x=pi/9$ 为 $f(x)$ 的零点，则 $omega$ 的最小值为#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [$T=2pi/omega$，所以 $f(T)=cos phi=sqrt(3)/2$。结合 $0<phi<pi$，得 $phi=pi/6$。由 $cos(omega pi/9+pi/6)=0$，得 $omega=3+9k(k in ZZ)$。由 $omega>0$，最小值为 $3$。],
)
#question(
  "fill-in",
  stem: [已知 $x=x_1$ 和 $x=x_2$ 分别是函数 $f(x)=2a^x-"e" x^2(a>0 "且" a!=1)$ 的极小值点和极大值点。若 $x_1<x_2$，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$(1/"e",1)$],),
  explanation: [令 $t=ln a!=0$，则 $f'(x)=2t "e"^(t x)-2"e" x$，驻点满足 $x$ 与 $t$ 同号。再令 $u=t x>0$，则
    $ f'(x)=(2"e"^(u+1))/t (t^2/"e"-u "e"^(-u)). $
    函数 $u "e"^(-u)$ 在 $(0,1)$ 递增、在 $(1,+infinity)$ 递减，最大值为 $1/"e"$，故出现两个极值点当且仅当 $0<t^2<1$。
    若 $t>0$，随 $x$ 增大，导数符号依次为正、负、正，极大值点在极小值点左侧，不符题意。若 $t<0$，$u$ 随 $x$ 减小而增大，结合前式中的负系数，导数符号依次为负、正、负，恰为左极小、右极大。
    因此 $-1<t<0$，即 $1/"e"<a<1$。],
)

#section[解答题]
#question(
  "solution",
  stem: [记 $triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $sin C sin(A-B)=sin B sin(C-A)$。],
  parts: (
    subquestion(
      stem: [证明：$2a^2=b^2+c^2$；],
      answers: ([证明见解析。],),
      explanation: [展开两角差的正弦并移项，得
        $ sin A(sin C cos B+sin B cos C)=2sin B sin C cos A. $
        由 $sin(B+C)=sin A$，得 $sin^2 A=2sin B sin C cos A$。再由正弦定理，得 $a^2=2b c cos A$。结合余弦定理 $a^2=b^2+c^2-2b c cos A$，即得 $2a^2=b^2+c^2$。],
    ),
    subquestion(
      stem: [若 $a=5$，$cos A=25/31$，求 $triangle A B C$ 的周长。],
      answers: ([$14$],),
      explanation: [由第（1）问，$b^2+c^2=50$，且 $25=2b c dot 25/31$，故 $b c=31/2$。所以 $(b+c)^2=50+31=81$，$b+c=9$，周长为 $5+9=14$。],
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
      stem: [设 $A B=B D=2$，$angle A C B=60 degree$，点 $F$ 在 $B D$ 上。当 $triangle A F C$ 的面积最小时，求 $C F$ 与平面 $A B D$ 所成的角的正弦值。],
      answers: ([$4sqrt(3)/7$],),
      explanation: [
        #step[确定最小面积对应的位置][由第（1）问，$A B=C B=2$，再由 $angle A C B=60 degree$，知 $triangle A B C$ 为等边三角形。因此 $A E=C E=1$，$B E=sqrt(3)$。直角三角形 $A D C$ 中，$D E=(A C)/2=1$。由 $D E^2+B E^2=B D^2$，得 $D E perp B E$。
          因 $A C perp$ 平面 $B E D$，对任意 $F in B D$，都有 $A C perp E F$，所以 $S_(triangle A F C)=1/2 A C dot E F$。当 $E F perp B D$ 时面积最小，垂足在 $B D$ 内部。]
        #step[求线面角][以 $E$ 为原点，$E A,E B,E D$ 的方向分别为三个坐标轴正向，则
          $ A=(1,0,0),quad C=(-1,0,0),quad B=(0,sqrt(3),0),quad D=(0,0,1). $
          设 $F=D+t(B-D)=(0,sqrt(3)t,1-t)$，由 $arrow(E F) dot arrow(D B)=0$，得 $3t-(1-t)=0$，即 $t=1/4$，故 $arrow(C F)=(1,sqrt(3)/4,3/4)$。
          平面 $A B D$ 的一个法向量为 $bold(n)=(sqrt(3),1,sqrt(3))$。所求角记为 $theta$，则
          $
            sin theta=abs(bold(n) dot arrow(C F))/(abs(bold(n)) abs(arrow(C F)))=(2sqrt(3))/(sqrt(7) dot sqrt(7)/2)=4sqrt(3)/7.
          $]
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
#question("solution", stem: [已知函数 $f(x)=ln(1+x)+a x "e"^(-x)$。], parts: (
  subquestion(
    stem: [当 $a=1$ 时，求曲线 $y=f(x)$ 在点 $(0,f(0))$ 处的切线方程；],
    answers: ([$y=2x$],),
    explanation: [$f(0)=0$，$f'(x)=1/(1+x)+a(1-x)"e"^(-x)$，所以 $a=1$ 时 $f'(0)=2$，切线方程为 $y=2x$。],
  ),
  subquestion(
    stem: [若 $f(x)$ 在区间 $(-1,0),(0,+infinity)$ 各恰有一个零点，求 $a$ 的取值范围。],
    answers: ([$(-infinity,-1)$],),
    explanation: [
      #step[排除 $a>=-1$][记 $g(x)="e"^x+a(1-x^2)$，则 $f'(x)=g(x)/((1+x)"e"^x)$，二者在定义域上同号。
        若 $a>=0$，则 $-1<x<0$ 时 $ln(1+x)<0$ 且 $a x "e"^(-x)<=0$，故 $f(x)<0$，无零点。
        若 $-1<=a<0$，则 $x>0$ 时 $g'(x)="e"^x-2a x>0$，从而 $g(x)>g(0)=1+a>=0$，所以 $f(x)>f(0)=0$，也不合题意。]
      #step[验证 $a< -1$ 时正半轴恰有一个零点][此时 $g'(x)>0(x>0)$，且 $g(0)=1+a<0$、$g(1)="e">0$，故 $g$ 在 $(0,1)$ 有唯一零点 $s$。函数 $f$ 在 $(0,s)$ 递减，在 $(s,+infinity)$ 递增，且 $f(s)<f(0)=0$。由 $lim_(x->+infinity)f(x)=+infinity$，知 $f$ 在 $(0,+infinity)$ 恰有一个零点。]
      #step[验证负区间恰有一个零点][$g''(x)="e"^x-2a>0$，而 $g'(-1)=1/"e"+2a<0$、$g'(0)=1>0$，故 $g'$ 在 $(-1,0)$ 有唯一零点 $t$，$g$ 先减后增。
        在 $(t,0)$ 上，$g(x)<g(0)=1+a<0$；又 $g(-1)=1/"e">0$，所以 $g$ 在 $(-1,t)$ 有唯一零点 $r$。因此 $f$ 在 $(-1,r)$ 递增，在 $(r,0)$ 递减，且 $f(r)>f(0)=0$。结合 $lim_(x->-1^+)f(x)=-infinity$，知 $(-1,0)$ 内也恰有一个零点。
        综上，$a$ 的取值范围为 $(-infinity,-1)$。]
    ],
  ),
))
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
