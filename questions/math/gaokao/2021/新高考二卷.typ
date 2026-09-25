#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校招生全国统一考试",
  name: "新高考二卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2021/2021新高考2(海南,辽宁,重庆).pdf",
  regions: ("海南", "辽宁", "重庆"),
)

#let cube-option(kind) = cetz.canvas(length: 20mm, {
  import cetz.draw: *
  let (m, n, p) = (
    A: ((0, 0, 1), (1, 1, 1), (1, 1, 0.5)),
    B: ((0, 1, 1), (0, 0, 0), (0, 0, 0.5)),
    C: ((1, 0, 1), (1, 1, 0), (0, 1, 0.5)),
    D: ((1, 1, 1), (0, 1, 0), (0.5, 0, 1)),
  ).at(kind)
  let o = (0.5, 0.5, 0)
  rect((-0.25, -0.25), (1.65, 1.65), stroke: none)
  oblique-project((1, 0), (0.35, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(
      (0, 0, 0),
      (1, 0, 0),
      (1, 1, 0),
      (1, 1, 1),
      (0, 1, 1),
      (0, 0, 1),
      (0, 0, 0),
    )
    line((0, 0, 1), (1, 0, 1), (1, 1, 1))
    line((1, 0, 0), (1, 0, 1))
    line((0, 0, 0), (0, 1, 0), (1, 1, 0), stroke: (dash: figure-style.dash))
    line((0, 1, 0), (0, 1, 1), stroke: (dash: figure-style.dash))
    line(m, n, stroke: (
      dash: if kind == "B" or kind == "D" { figure-style.dash } else { none },
    ))
    line(o, p, stroke: (dash: figure-style.dash))
    for point in (o, p) {
      circle(point, radius: 1pt, fill: black, stroke: none)
    }
    content(
      m,
      $M$,
      anchor: if kind == "A" { "east" } else { "south" },
      padding: 3pt,
    )
    content(
      n,
      $N$,
      anchor: if kind == "B" { "north-east" } else if kind == "D" {
        "south-east"
      } else { "west" },
      padding: 3pt,
    )
    content(
      p,
      $P$,
      anchor: if kind == "A" { "west" } else if kind == "D" { "south" } else {
        "east"
      },
      padding: 3pt,
    )
    content(
      o,
      $O$,
      anchor: if kind == "B" or kind == "D" { "west" } else { "east" },
      padding: 3pt,
    )
  })
})

#let square-pyramid() = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (0, -1, 0)
  let b = (2, -1, 0)
  let c = (2, 1, 0)
  let d = (0, 1, 0)
  let q = (0, 0, 2)
  oblique-project((-0.35, -0.35), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(q, b, c, d, q)
    line(q, c)
    line(q, a, b, d, a, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (q, $Q$, "south"),
      (a, $A$, "north-west"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[单项选择题]
#question(
  "single-choice",
  stem: [复数 $(2-"i")/(1-3"i")$ 在复平面内对应的点所在的象限为#choice-placeholder()。],
  choices: ([第一象限], [第二象限], [第三象限], [第四象限]),
  answers: ([A],),
  explanation: [$(2-"i")/(1-3"i")=((2-"i")(1+3"i"))/10=(1+"i")/2$，实部、虚部均为正，对应点在第一象限。],
)
#question(
  "single-choice",
  stem: [若全集 $U={1,2,3,4,5,6}$，集合 $A={1,3,6}$，$B={2,3,4}$，则 $A inter (complement_U B)=$#choice-placeholder()。],
  choices: ([${3}$], [${1,6}$], [${5,6}$], [${1,3}$]),
  answers: ([B],),
  explanation: [$complement_U B={1,5,6}$，所以 $A inter (complement_U B)={1,6}$。],
)
#question(
  "single-choice",
  stem: [若抛物线 $y^2=2p x(p>0)$ 的焦点到直线 $y=x+1$ 的距离为 $sqrt(2)$，则 $p=$#choice-placeholder()。],
  choices: ([$1$], [$2$], [$2sqrt(2)$], [$4$]),
  answers: ([B],),
  explanation: [焦点为 $(p/2,0)$，到直线 $x-y+1=0$ 的距离为 $(p/2+1)/sqrt(2)=sqrt(2)$，得 $p=2$。],
)
#question(
  "single-choice",
  stem: [北斗三号全球卫星导航系统是我国航天事业的重要成果。在卫星导航系统中，地球静止同步轨道卫星的轨道位于地球赤道所在平面，轨道高度为 $36000 "km"$（轨道高度是指卫星到地球表面的最短距离），把地球看成一个球心为 $O$，半径 $r$ 为 $6400 "km"$ 的球，其上点 $A$ 的纬度是指 $O A$ 与赤道所在平面所成角的度数，地球表面能直接观测到的一颗地球静止同步轨道卫星的点的纬度的最大值记为 $alpha$，该卫星信号覆盖的地球表面面积 $S=2pi r^2(1-cos alpha)$（单位：$"km"^2$），则 $S$ 占地球表面积的百分比约为#choice-placeholder()。],
  choices: ([$26%$], [$34%$], [$42%$], [$50%$]),
  answers: ([C],),
  explanation: [设卫星为 $T$。最大纬度对应的观测线 $A T$ 与地球相切，此时 $O A perp A T$，所以 $cos alpha=(O A)/(O T)=6400/(6400+36000)=8/53$。
    因此 $S/(4pi r^2)=(1-cos alpha)/2=45/106 approx 42%$。],
)
#question(
  "single-choice",
  stem: [正四棱台的上、下底面的边长为 $2,4$，侧棱长为 $2$，则其体积为#choice-placeholder()。],
  choices: ([$56$], [$28sqrt(2)$], [$56/3$], [$28sqrt(2)/3$]),
  answers: ([D],),
  explanation: [对应顶点在底面内的水平距离为 $(4-2)/sqrt(2)=sqrt(2)$，故高为 $h=sqrt(2^2-(sqrt(2))^2)=sqrt(2)$。
    上、下底面积分别为 $4,16$，由棱台体积公式，$V=h/3(4+16+sqrt(4 times 16))=28sqrt(2)/3$。],
)
#question(
  "single-choice",
  stem: [某物理量的测量结果服从正态分布 $N(10,sigma^2)$，则下列结论中不正确的是#choice-placeholder()。],
  choices: (
    [$sigma$ 越小，该物理量一次测量结果落在 $(9.9,10.1)$ 内的概率越大],
    [该物理量一次测量结果大于 $10$ 的概率为 $0.5$],
    [该物理量一次测量结果小于 $9.99$ 的概率与大于 $10.01$ 的概率相等],
    [该物理量一次测量结果落在 $(9.9,10.2)$ 内的概率与落在 $(10,10.3)$ 内的概率相等],
  ),
  answers: ([D],),
  explanation: [记测量结果为 $X$。标准化后，$P(9.9<X<10.1)=P(abs(Z)<0.1/sigma)$，其中 $Z$ 服从标准正态分布，故 $sigma$ 越小，该概率越大，A 正确。
    正态密度曲线关于 $x=10$ 对称，所以 B、C 正确。
    比较 D 中两个区间，去掉公共部分 $(10,10.2)$，只需比较 $(9.9,10)$ 与 $(10.2,10.3)$。前者关于均值对称于 $(10,10.1)$，更靠近均值，概率严格大于后者。因此 D 错误。],
)
#question(
  "single-choice",
  stem: [若 $a=log_5 2$，$b=log_8 3$，$c=1/2$，则#choice-placeholder()。],
  choices: ([$c<b<a$], [$b<a<c$], [$a<c<b$], [$a<b<c$]),
  answers: ([C],),
  explanation: [由 $2<sqrt(5)$，得 $a<log_5 sqrt(5)=1/2$；由 $3>sqrt(8)$，得 $b>log_8 sqrt(8)=1/2$，所以 $a<c<b$。],
)
#question(
  "single-choice",
  stem: [设函数 $f(x)$ 的定义域为 $RR$，且 $f(x+2)$ 为偶函数，$f(2x+1)$ 为奇函数，则#choice-placeholder()。],
  choices: ([$f(-1/2)=0$], [$f(-1)=0$], [$f(2)=0$], [$f(4)=0$]),
  answers: ([B],),
  explanation: [由 $f(2x+1)$ 为奇函数，取 $x=0$，得 $f(1)=0$。由 $f(x+2)$ 为偶函数，得 $f(3)=f(1)=0$。再由奇性取 $x=1$，得 $f(3)=-f(-1)$，所以 $f(-1)=0$。],
)

#section[多项选择题]
#question(
  "multiple-choice",
  stem: [下列统计量中可用于度量样本 $x_1,x_2,dots,x_n$ 离散程度的有#choice-placeholder()。],
  choices: (
    [$x_1,x_2,dots,x_n$ 的标准差],
    [$x_1,x_2,dots,x_n$ 的中位数],
    [$x_1,x_2,dots,x_n$ 的极差],
    [$x_1,x_2,dots,x_n$ 的平均数],
  ),
  answers: ([AC],),
  explanation: [标准差和极差刻画样本的离散程度；中位数和平均数刻画样本的集中位置，所以选 A、C。],
)
#question(
  "multiple-choice",
  stem: [如图，下列各正方体中，$O$ 为下底面的中心，$M,N$ 为顶点，$P$ 为所在棱的中点，则满足 $M N perp O P$ 的是#choice-placeholder()。],
  choices: (
    [#figure(cube-option("A"))],
    [#figure(cube-option("B"))],
    [#figure(cube-option("C"))],
    [#figure(cube-option("D"))],
  ),
  answers: ([BC],),
  explanation: [以各图左前下顶点为原点，向右、向后、向上分别为三个坐标轴正向，棱长为 $1$，则 $O=(1/2,1/2,0)$。
    #step[选项 A][$M=(0,0,1),N=(1,1,1),P=(1,1,1/2)$，所以 $arrow(M N) dot arrow(O P)=(1,1,0) dot (1/2,1/2,1/2)=1!=0$，错误。]
    #step[选项 B][$M=(0,1,1),N=(0,0,0),P=(0,0,1/2)$，所以 $arrow(M N) dot arrow(O P)=(0,-1,-1) dot (-1/2,-1/2,1/2)=0$，正确。]
    #step[选项 C][$M=(1,0,1),N=(1,1,0),P=(0,1,1/2)$，所以 $arrow(M N) dot arrow(O P)=(0,1,-1) dot (-1/2,1/2,1/2)=0$，正确。]
    #step[选项 D][$M=(1,1,1),N=(0,1,0),P=(1/2,0,1)$，所以 $arrow(M N) dot arrow(O P)=(-1,0,-1) dot (0,-1/2,1)=-1!=0$，错误。]
  ],
)
#question(
  "multiple-choice",
  stem: [已知直线 $l:a x+b y-r^2=0$ 与圆 $C:x^2+y^2=r^2$，点 $A(a,b)$，则下列说法正确的是#choice-placeholder()。],
  choices: (
    [若点 $A$ 在圆 $C$ 上，则直线 $l$ 与圆 $C$ 相切],
    [若点 $A$ 在圆 $C$ 内，则直线 $l$ 与圆 $C$ 相离],
    [若点 $A$ 在圆 $C$ 外，则直线 $l$ 与圆 $C$ 相离],
    [若点 $A$ 在直线 $l$ 上，则直线 $l$ 与圆 $C$ 相切],
  ),
  answers: ([ABD],),
  explanation: [因题设 $l$ 为直线，$a^2+b^2>0$。圆心到直线的距离为 $d=r^2/sqrt(a^2+b^2)$。
    点 $A$ 在圆上、圆内、圆外，分别对应 $a^2+b^2=r^2$、$<r^2$、$>r^2$，从而分别有 $d=r$、$d>r$、$d<r$，直线与圆分别相切、相离、相交。因此 A、B 正确，C 错误。
    若 $A$ 在 $l$ 上，代入得 $a^2+b^2=r^2$，仍有 $d=r$，D 正确。],
)
#question(
  "multiple-choice",
  stem: [设正整数 $n=a_0 dot 2^0+a_1 dot 2^1+dots+a_(k-1) dot 2^(k-1)+a_k dot 2^k$，其中 $a_i in {0,1}$，记 $omega(n)=a_0+a_1+dots+a_k$。则#choice-placeholder()。],
  choices: (
    [$omega(2n)=omega(n)$],
    [$omega(2n+3)=omega(n)+1$],
    [$omega(8n+5)=omega(4n+3)$],
    [$omega(2^n-1)=n$],
  ),
  answers: ([ACD],),
  explanation: [$omega(n)$ 等于 $n$ 的二进制表示中数字 $1$ 的个数。
    #step[选项 A][乘以 $2$ 只在二进制末尾补一个 $0$，不改变 $1$ 的个数，正确。]
    #step[选项 B][取 $n=2$，有 $omega(2)=1$，而 $omega(7)=3!=omega(2)+1$，错误。]
    #step[选项 C][$8n+5$ 在 $n$ 的二进制末尾接上 $101$，$4n+3$ 接上 $11$，都增加两个 $1$，正确。]
    #step[选项 D][$2^n-1=2^0+2^1+dots+2^(n-1)$，二进制表示恰有 $n$ 个 $1$，正确。]
  ],
)

#section[填空题]
#question(
  "fill-in",
  stem: [已知双曲线 $C:x^2/a^2-y^2/b^2=1(a>0,b>0)$ 的离心率 $e=2$，则双曲线 $C$ 的渐近线方程为#fill-placeholder()。],
  answers: ([$y=plus.minus sqrt(3)x$],),
  explanation: [由 $c/a=2$、$c^2=a^2+b^2$，得 $b^2=3a^2$。因此渐近线为 $y=plus.minus b/a x=plus.minus sqrt(3)x$。],
)
#question(
  "fill-in",
  stem: [写出一个同时具有下列性质①②③的函数 $f(x)=$#fill-placeholder()。
    #linebreak()
    ① $f(x_1x_2)=f(x_1)f(x_2)$；
    #linebreak()
    ② 当 $x in (0,+infinity)$ 时，$f'(x)>0$；
    #linebreak()
    ③ $f'(x)$ 是奇函数。],
  answers: ([$x^2$（答案不唯一）],),
  explanation: [取 $f(x)=x^2$，则 $f(x_1x_2)=x_1^2 x_2^2=f(x_1)f(x_2)$。其导函数为 $f'(x)=2x$，在 $(0,+infinity)$ 上为正，且是奇函数，满足全部条件。],
)
#question(
  "fill-in",
  stem: [已知向量 $bold(a)+bold(b)+bold(c)=bold(0)$，$abs(bold(a))=1$，$abs(bold(b))=abs(bold(c))=2$，则 $bold(a) dot bold(b)+bold(b) dot bold(c)+bold(c) dot bold(a)=$#fill-placeholder()。],
  answers: ([$-9/2$],),
  explanation: [将 $bold(a)+bold(b)+bold(c)=bold(0)$ 两边取模的平方，得 $0=1+4+4+2(bold(a) dot bold(b)+bold(b) dot bold(c)+bold(c) dot bold(a))$，故所求为 $-9/2$。],
)
#question(
  "fill-in",
  stem: [已知函数 $f(x)=abs("e"^x-1)$，$x_1<0$，$x_2>0$，函数 $f(x)$ 的图像在点 $A(x_1,f(x_1))$ 和点 $B(x_2,f(x_2))$ 处的两条切线互相垂直，且分别交 $y$ 轴于 $M,N$ 两点，则 $abs(A M)/abs(B N)$ 的取值范围是#fill-placeholder()。],
  answers: ([$(0,1)$],),
  explanation: [两条切线的斜率分别为 $-"e"^(x_1)$、$"e"^(x_2)$，由斜率之积为 $-1$，得 $x_1+x_2=0$。
    由于 $M,N$ 的横坐标为 $0$，故 $abs(A M)=abs(x_1)sqrt(1+"e"^(2x_1))$，$abs(B N)=x_2 sqrt(1+"e"^(2x_2))$。
    因此 $abs(A M)/abs(B N)=sqrt((1+"e"^(2x_1))/(1+"e"^(-2x_1)))="e"^(x_1)$。当 $x_1$ 遍历 $(-infinity,0)$ 时，该比值遍历 $(0,1)$。],
)

#section[解答题]
#question(
  "solution",
  stem: [记 $S_n$ 是公差不为 $0$ 的等差数列 ${a_n}$ 的前 $n$ 项和，若 $a_3=S_5$，$a_2a_4=S_4$。],
  parts: (
    subquestion(
      stem: [求数列 ${a_n}$ 的通项公式；],
      answers: ([$a_n=2n-6$],),
      explanation: [由 $S_5=5a_3=a_3$，得 $a_3=0$。设公差为 $d!=0$，则 $a_2=-d,a_4=d,S_4=-2d$，所以 $-d^2=-2d$，得 $d=2$。因此 $a_n=a_3+(n-3)d=2n-6$。],
    ),
    subquestion(
      stem: [求使 $S_n>a_n$ 成立的 $n$ 的最小值。],
      answers: ([$7$],),
      explanation: [$S_n=n(a_1+a_n)/2=n(n-5)$，所以 $S_n>a_n$ 等价于 $(n-1)(n-6)>0$。由 $n$ 为正整数，得 $n>=7$，最小值为 $7$。],
    ),
  ),
)
#question(
  "solution",
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 所对的边分别为 $a,b,c$，$b=a+1$，$c=a+2$。],
  parts: (
    subquestion(
      stem: [若 $2sin C=3sin A$，求 $triangle A B C$ 的面积；],
      answers: ([$15sqrt(7)/4$],),
      explanation: [由正弦定理，$2c=3a$。结合 $c=a+2$，得 $a=4,b=5,c=6$。
        所以 $cos C=(a^2+b^2-c^2)/(2a b)=1/8$，$sin C=3sqrt(7)/8$，面积为 $1/2 a b sin C=15sqrt(7)/4$。],
    ),
    subquestion(
      stem: [是否存在正整数 $a$，使得 $triangle A B C$ 为钝角三角形？若存在，求 $a$；若不存在，说明理由。],
      answers: ([存在，$a=2$。],),
      explanation: [由三角形三边关系，$a+(a+1)>a+2$，即 $a>1$。因 $c$ 为最大边，三角形为钝角三角形当且仅当 $c^2>a^2+b^2$，即 $(a+2)^2>a^2+(a+1)^2$，化简得 $(a-3)(a+1)<0$。
        联立得 $1<a<3$，唯一正整数解为 $a=2$，此时三边为 $2,3,4$，确为钝角三角形。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在四棱锥 $Q-A B C D$ 中，底面 $A B C D$ 是正方形，$A D=2$，$Q D=Q A=sqrt(5)$，$Q C=3$。
    #figure(square-pyramid())],
  parts: (
    subquestion(
      stem: [证明：平面 $Q A D perp$ 平面 $A B C D$；],
      answers: ([证明见解析。],),
      explanation: [取 $A D$ 的中点 $O$，连接 $Q O,C O$。由 $Q A=Q D$，得 $Q O perp A D$，且 $Q O^2=5-1=4$。
        在底面正方形中，$C O^2=C D^2+D O^2=5$，所以 $Q O^2+C O^2=9=Q C^2$，得 $Q O perp C O$。
        因 $A D,C O$ 相交于 $O$，故 $Q O perp$ 平面 $A B C D$。又 $Q O subset$ 平面 $Q A D$，所以两平面垂直。],
    ),
    subquestion(
      stem: [求二面角 $B-Q D-A$ 的余弦值。],
      answers: ([$2/3$],),
      explanation: [
        #step[建立空间坐标][以 $O$ 为原点，平行于 $D C$、沿 $O D$、沿 $O Q$ 的方向分别为三个坐标轴正向，则 $A=(0,-1,0),B=(2,-1,0),D=(0,1,0),Q=(0,0,2)$。]
        #step[求垂直于棱的两个方向][记 $bold(w)=arrow(D Q)=(0,-1,2)$。将 $arrow(D A)$、$arrow(D B)$ 在棱方向的分量扣除，得到分别指向两个半平面内部、且垂直于 $Q D$ 的向量
          $
            bold(u)=arrow(D A)-(arrow(D A) dot bold(w))/(abs(bold(w))^2)bold(w)=(0,-8/5,-4/5),
          $
          $
            bold(v)=arrow(D B)-(arrow(D B) dot bold(w))/(abs(bold(w))^2)bold(w)=(2,-8/5,-4/5).
          $
          二面角的平面角即这两个向量的夹角，所以其余弦为
          $
            (bold(u) dot bold(v))/(abs(bold(u))abs(bold(v)))=(16/5)/((4/sqrt(5))(6/sqrt(5)))=2/3.
          $]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1(a>b>0)$，右焦点为 $F(sqrt(2),0)$，其离心率为 $sqrt(6)/3$。],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 的方程；],
      answers: ([$x^2/3+y^2=1$],),
      explanation: [半焦距 $c=sqrt(2)$，由 $c/a=sqrt(6)/3$，得 $a=sqrt(3)$，所以 $b^2=a^2-c^2=1$。椭圆方程为 $x^2/3+y^2=1$。],
    ),
    subquestion(
      stem: [设 $M,N$ 是椭圆 $C$ 上的两点，直线 $M N$ 与曲线 $x^2+y^2=b^2(x>0)$ 相切。证明：$M,N,F$ 三点共线的充要条件是 $abs(M N)=sqrt(3)$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[用切点统一表示直线][由第（1）问，所给曲线是单位圆的右半圆。设切点为 $(u,v)$，则 $u>0,u^2+v^2=1$，切线方程为 $u x+v y=1$。
          切线上的点可表示为 $(x,y)=(u-v t,v+u t)$，方向向量 $(-v,u)$ 的模为 $1$。代入椭圆方程，得
          $ (1+2u^2)t^2+4u v t-2u^2=0. $
          其判别式为 $24u^2>0$。设两交点对应参数为 $t_1,t_2$，则
          $ abs(M N)^2=(t_1-t_2)^2=(24u^2)/(1+2u^2)^2. $]
        #step[证明充要关系][由上式，
          $
            abs(M N)=sqrt(3) equiv 8u^2=(1+2u^2)^2 equiv (2u^2-1)^2=0 equiv u=1/sqrt(2).
          $
          另一方面，$M,N,F$ 共线等价于 $F$ 在切线上，即 $sqrt(2)u=1$，也等价于 $u=1/sqrt(2)$。因此两条件互为充要条件。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [一种微生物群体可以经过自身繁殖不断生存下来，设一个这种微生物为第 0 代，经过一次繁殖后为第 1 代，再经过一次繁殖后为第 2 代……该微生物每代繁殖的个数是相互独立的且有相同的分布列，设 $X$ 表示 1 个微生物个体繁殖下一代的个数，$P(X=i)=p_i>0(i=0,1,2,3)$。],
  parts: (
    subquestion(
      stem: [已知 $p_0=0.4,p_1=0.3,p_2=0.2,p_3=0.1$，求 $E(X)$；],
      answers: ([$1$],),
      explanation: [$E(X)=0 times 0.4+1 times 0.3+2 times 0.2+3 times 0.1=1$。],
    ),
    subquestion(
      stem: [设 $p$ 表示该种微生物经过多代繁殖后临近灭绝的概率，$p$ 是关于 $x$ 的方程 $p_0+p_1x+p_2x^2+p_3x^3=x$ 的一个最小正实根。求证：当 $E(X)<=1$ 时，$p=1$；当 $E(X)>1$ 时，$p<1$；],
      answers: ([证明见解析。],),
      explanation: [由 $p_0+p_1+p_2+p_3=1$，原方程可分解为
        $ (x-1)(p_3x^2+(p_2+p_3)x-p_0)=0. $
        令 $g(x)=p_3x^2+(p_2+p_3)x-p_0$。在 $x>0$ 上，$g'(x)=2p_3x+p_2+p_3>0$，且 $g(0)=-p_0<0$、$lim_(x->+infinity)g(x)=+infinity$，故 $g$ 有唯一正零点 $r$。因此 $p=min(1, r)$。
        又 $g(1)=p_2+2p_3-p_0=p_1+2p_2+3p_3-1=E(X)-1$。
        当 $E(X)<=1$ 时，$g(1)<=0$，由单调性得 $r>=1$，所以 $p=1$；当 $E(X)>1$ 时，$g(1)>0$，得 $0<r<1$，所以 $p=r<1$。],
    ),
    subquestion(
      stem: [根据你的理解说明第（2）问结论的实际含义。],
      answers: (
        [平均每个个体繁殖的下一代个数不超过 $1$ 时，最终灭绝的概率为 $1$；超过 $1$ 时，群体有正概率持续生存。],
      ),
      explanation: [$E(X)$ 表示每个个体繁殖下一代个数的平均值。$p=1$ 表示群体以概率 $1$ 最终灭绝；$p<1$ 表示持续生存的概率 $1-p>0$。所以平均繁殖数 $1$ 是这两种情况的分界。],
    ),
  ),
)
#question("solution", stem: [已知函数 $f(x)=(x-1)"e"^x-a x^2+b$。], parts: (
  subquestion(
    stem: [讨论 $f(x)$ 的单调性；],
    answers: ([分类讨论见解析。],),
    explanation: [$f'(x)=x("e"^x-2a)$，定义域为 $RR$。
      #step[当 $a<=0$ 时][$"e"^x-2a>0$，故 $f$ 在 $(-infinity,0)$ 上递减，在 $(0,+infinity)$ 上递增。]
      #step[当 $0<a<1/2$ 时][令 $t=ln(2a)<0$。导数依次为正、负、正，故 $f$ 在 $(-infinity,t)$、$(0,+infinity)$ 上递增，在 $(t,0)$ 上递减。]
      #step[当 $a=1/2$ 时][$f'(x)=x("e"^x-1)>=0$，且仅在 $x=0$ 处为零，故 $f$ 在 $RR$ 上严格递增。]
      #step[当 $a>1/2$ 时][令 $t=ln(2a)>0$。导数依次为正、负、正，故 $f$ 在 $(-infinity,0)$、$(t,+infinity)$ 上递增，在 $(0,t)$ 上递减。]
    ],
  ),
  subquestion(
    stem: [从下面两个条件中任选一个作为已知条件，证明：$f(x)$ 有一个零点。
      #linebreak()
      ① $1/2<a<="e"^2/2$，$b>2a$；
      #linebreak()
      ② $0<a<1/2$，$b<=2a$。],
    answers: ([证明见解析；两种条件下均恰有一个零点。],),
    explanation: [两种条件均有 $a>0$，且 $lim_(x->-infinity)f(x)=-infinity$，$lim_(x->+infinity)f(x)=+infinity$。以下分别给出证明。
      #step[选择条件①][令 $t=ln(2a)$，则 $0<t<=2$。由 $f(0)=b-1>2a-1>0$ 及第（1）问的单调性，知 $f$ 在 $(-infinity,0)$ 上恰有一个零点。
        在 $[0,+infinity)$ 上，最小值为
        $ f(t)=b-2a+a t(2-t)>0, $
        故该区间无零点，函数恰有一个零点。]
      #step[选择条件②][此时 $t=ln(2a)<0$，$f(0)=b-1<=2a-1<0$。函数在 $(0,+infinity)$ 上严格递增并趋于 $+infinity$，故恰有一个正零点。
        在 $(-infinity,0]$ 上，最大值为
        $ f(t)=b-2a+a t(2-t)<=a t(2-t)<0, $
        故该区间无零点，函数也恰有一个零点。]
    ],
  ),
))
