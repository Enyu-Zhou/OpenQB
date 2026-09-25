#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校招生全国统一考试",
  name: "新高考一卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2022/2022新高考1(山东,广东,湖南,湖北,河北,江苏,福建).pdf",
  regions: ("山东", "广东", "湖南", "湖北", "河北", "江苏", "福建"),
)

#let prism-diagram() = cetz.canvas(length: 22mm, {
  import cetz.draw: *
  let a = (0, 2, 0)
  let b = (0, 0, 0)
  let c = (2, 0, 0)
  let a1 = (0, 2, 2)
  let b1 = (0, 0, 2)
  let c1 = (2, 0, 2)
  let d = (1, 1, 1)
  oblique-project((1, 0.3), (-0.45, 0.3), (0, 1.1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a1, b)
    line(a, c, a1, stroke: (dash: figure-style.dash))
    line(a, d, b, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "north-west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "south-west"),
      (c1, $C_1$, "west"),
      (d, $D$, "south-west"),
    ) { content(p, label, anchor: anchor, padding: 0.1) }
  })
})

#let ellipse-diagram() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  let c = 13 / 8
  let a = (0, calc.sqrt(3) * c)
  let f1 = (-c, 0)
  let f2 = (c, 0)
  let d = ((-4 - 12 * calc.sqrt(3)) / 8, (3 * calc.sqrt(3) - 12) / 8)
  let e = ((-4 + 12 * calc.sqrt(3)) / 8, (3 * calc.sqrt(3) + 12) / 8)
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: false,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (7.4, 6.6),
    axis-style: "school-book",
    x-min: -3.7,
    x-max: 3.7,
    y-min: -3.3,
    y-max: 3.3,
    x-tick-step: none,
    y-tick-step: none,
    x-label: $x$,
    y-label: $y$,
    {
      plot.annotate(
        {
          circle((0, 0), radius: (2 * c, calc.sqrt(3) * c))
          line(d, a, e, d)
          line(d, f2, e, stroke: (dash: figure-style.dash))
          line(a, f2, stroke: (dash: figure-style.dash))
          content((-0.5, a.at(1) + 0.15), $A$, anchor: "south")
          content((0.12, -0.55), $O$, anchor: "west")
          for (p, label, anchor) in (
            (f1, $F_1$, "north"),
            (f2, $F_2$, "north-west"),
            (d, $D$, "north-east"),
            (e, $E$, "south-west"),
          ) { content(p, label, anchor: anchor, padding: 0.12) }
        },
        resize: false,
      )
    },
  )
})

#section[选择题。本大题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [若集合 $M={x | sqrt(x)<4}$，$N={x | 3x>=1}$，则 $M inter N=$#choice-placeholder()。],
  choices: (
    [${x | 0<=x<2}$],
    [${x | 1/3<=x<2}$],
    [${x | 3<=x<16}$],
    [${x | 1/3<=x<16}$],
  ),
  answers: ([D],),
  explanation: [根式有意义要求 $x>=0$，故 $M=[0,16)$，$N=[1/3,+infinity)$，交集为 $[1/3,16)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $i(1-z)=1$，则 $z+overline(z)=$#choice-placeholder()。],
  choices: ([$-2$], [$-1$], [$1$], [$2$]),
  answers: ([D],),
  explanation: [由 $1-z=1/i=-i$ 得 $z=1+i$，故 $z+overline(z)=2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在 $triangle A B C$ 中，点 $D$ 在边 $A B$ 上，$B D=2D A$。记 $arrow(C A)=bold(m)$，$arrow(C D)=bold(n)$，则 $arrow(C B)=$#choice-placeholder()。],
  choices: (
    [$3bold(m)-2bold(n)$],
    [$-2bold(m)+3bold(n)$],
    [$3bold(m)+2bold(n)$],
    [$2bold(m)+3bold(n)$],
  ),
  answers: ([B],),
  explanation: [$arrow(A B)=3arrow(A D)$，故 $arrow(C B)=arrow(C A)+3(arrow(C D)-arrow(C A))=-2bold(m)+3bold(n)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [南水北调工程缓解了北方一些地区水资源短缺问题，其中一部分水蓄入某水库。已知该水库水位为海拔 $148.5 "m"$ 时，相应水面的面积为 $140.0 "km"^2$；水位为海拔 $157.5 "m"$ 时，相应水面的面积为 $180.0 "km"^2$。将该水库在这两个水位间的形状看作一个棱台，则该水库水位从海拔 $148.5 "m"$ 上升到 $157.5 "m"$ 时，增加的水量约为（$sqrt(7) approx 2.65$）#choice-placeholder()。],
  choices: (
    [$1.0 times 10^9 "m"^3$],
    [$1.2 times 10^9 "m"^3$],
    [$1.4 times 10^9 "m"^3$],
    [$1.6 times 10^9 "m"^3$],
  ),
  answers: ([C],),
  explanation: [棱台高为 $9 "m"$。由棱台体积公式，增加的水量为
    $
      V=9/3(140+180+sqrt(140 times 180))times 10^6=3(320+60sqrt(7))times 10^6 approx 1.437 times 10^9("m"^3).
    $
    故最接近 $1.4 times 10^9 "m"^3$。
  ],
)
#question(
  "single-choice",
  score: 5,
  stem: [从 2 至 8 的 7 个整数中随机取 2 个不同的数，则这 2 个数互质的概率为#choice-placeholder()。],
  choices: ([$1/6$], [$1/3$], [$1/2$], [$2/3$]),
  answers: ([D],),
  explanation: [共有 $binom(7, 2)=21$ 种等可能取法。不互质的数对为四个偶数中任选两个，共 $binom(4, 2)=6$ 对，以及 $(3,6)$ 这一对。因此互质的概率为 $1-7/21=2/3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [记函数 $f(x)=sin(omega x+pi/4)+b$（$omega>0$）的最小正周期为 $T$。若 $(2pi)/3<T<pi$，且 $y=f(x)$ 的图象关于点 $((3pi)/2,2)$ 中心对称，则 $f(pi/2)=$#choice-placeholder()。],
  choices: ([$1$], [$3/2$], [$5/2$], [$3$]),
  answers: ([A],),
  explanation: [由周期条件得 $2<omega<3$。中心对称条件给出 $b=2$、$(3pi)/2 omega+pi/4=k pi$（$k in ZZ$），即 $omega=(4k-1)/6$。结合范围可得 $k=4$、$omega=5/2$，故 $f(pi/2)=sin((3pi)/2)+2=1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $a=0.1e^0.1$，$b=1/9$，$c=-ln 0.9$，则#choice-placeholder()。],
  choices: ([$a<b<c$], [$c<b<a$], [$c<a<b$], [$a<c<b$]),
  answers: ([C],),
  explanation: [
    #step[比较 $a$ 与 $b$][
      令 $u(t)=-ln(1-t)-t$，则 $u(0)=0$，且在 $(0,1)$ 上 $u'(t)=t/(1-t)>0$。取 $t=0.1$ 得 $e^0.1<10/9$，故 $a<b$。
    ]
    #step[比较 $c$ 与 $a$][
      令 $h(t)=t e^t+ln(1-t)$。由 $e^t>=1+t$，对 $0<t<=0.1$ 有
      $ h'(t)=(1+t)e^t-1/(1-t)>=(1+t)^2-1/(1-t)=(t(1-t-t^2))/(1-t)>0. $
      因 $h(0)=0$，故 $h(0.1)=a-c>0$。综上，$c<a<b$。
    ]
  ],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知正四棱锥的侧棱长为 $l$，其各顶点都在同一球面上。若该球的体积为 $36pi$，且 $3<=l<=3sqrt(3)$，则该四棱锥体积的取值范围是#choice-placeholder()。],
  choices: ([$[18,81/4]$], [$[27/4,81/4]$], [$[27/4,64/3]$], [$[18,27]$]),
  answers: ([C],),
  explanation: [
    #step[用棱锥高表示体积][
      球半径为 3。设棱锥高为 $h$，底面外接圆半径为 $r$，则球心在棱锥高所在直线上，且 $r^2+(3-h)^2=9$。因此 $r^2=6h-h^2$，$l^2=r^2+h^2=6h$，得 $h in [3/2,9/2]$。底面为正方形，面积为 $2r^2$，故
      $ V(h)=1/3 times 2r^2 h=4h^2-2/3 h^3. $
    ]
    #step[比较极值与端点值][
      $V'(h)=2h(4-h)$，故在 $[3/2,4]$ 上递增，在 $[4,9/2]$ 上递减。又 $V(3/2)=27/4$，$V(4)=64/3$，$V(9/2)=81/4$，故体积范围为 $[27/4,64/3]$。
    ]
  ],
)

#section[选择题。本大题共 4 小题，每小题 5 分，共 20 分。在每小题给出的选项中，有多项符合题目要求。全部选对的得 5 分，部分选对的得 2 分，有选错的得 0 分。]
#question(
  "multiple-choice",
  score: 5,
  stem: [已知正方体 $A B C D-A_1 B_1 C_1 D_1$，则#choice-placeholder()。],
  choices: (
    [直线 $B C_1$ 与 $D A_1$ 所成的角为 $90 degree$],
    [直线 $B C_1$ 与 $C A_1$ 所成的角为 $90 degree$],
    [直线 $B C_1$ 与平面 $B B_1 D_1 D$ 所成的角为 $45 degree$],
    [直线 $B C_1$ 与平面 $A B C D$ 所成的角为 $45 degree$],
  ),
  answers: ([ABD],),
  explanation: [
    取棱长为 1，以 $A$ 为原点，$A B$、$A D$、$A A_1$ 分别为三个坐标轴的正方向。
    #step[选项 A、B][
      $arrow(B C_1)=(0,1,1)$，$arrow(D A_1)=(0,-1,1)$，$arrow(C A_1)=(-1,-1,1)$。前一向量与后两向量的数量积均为 0，故 A、B 正确。
    ]
    #step[选项 C、D][
      平面 $B B_1 D_1 D$ 的法向量为 $(1,1,0)$，故直线 $B C_1$ 与该平面所成角的正弦值为 $1/(sqrt(2)sqrt(2))=1/2$，角为 $30 degree$，C 错误。
      底面法向量为 $(0,0,1)$，相应线面角的正弦值为 $1/sqrt(2)$，角为 $45 degree$，D 正确。
    ]
  ],
)
#question(
  "multiple-choice",
  score: 5,
  stem: [已知函数 $f(x)=x^3-x+1$，则#choice-placeholder()。],
  choices: (
    [$f(x)$ 有两个极值点],
    [$f(x)$ 有三个零点],
    [点 $(0,1)$ 是曲线 $y=f(x)$ 的对称中心],
    [直线 $y=2x$ 是曲线 $y=f(x)$ 的切线],
  ),
  answers: ([AC],),
  explanation: [
    #step[选项 A、B][
      $f'(x)=3x^2-1$，在 $x=+-1/sqrt(3)$ 处变号，故有两个极值点，A 正确。极小值 $f(1/sqrt(3))=1-2/(3sqrt(3))>0$，极大值也为正；结合三个单调区间及两端趋向，函数仅有一个零点，B 错误。
    ]
    #step[选项 C、D][
      $f(x)+f(-x)=2$，故 $(0,1)$ 是对称中心，C 正确。若 $y=2x$ 相切，切点横坐标 $t$ 须同时满足 $f'(t)=2$ 与 $f(t)=2t$。前者给出 $t=+-1$，但 $f(1)=1!=2$，$f(-1)=1!=-2$，均不满足后者，D 错误。
    ]
  ],
)
#question(
  "multiple-choice",
  score: 5,
  stem: [已知 $O$ 为坐标原点，点 $A(1,1)$ 在抛物线 $C:x^2=2p y$（$p>0$）上，过点 $B(0,-1)$ 的直线交 $C$ 于 $P$、$Q$ 两点，则#choice-placeholder()。],
  choices: (
    [$C$ 的准线为 $y=-1$],
    [直线 $A B$ 与 $C$ 相切],
    [$|O P| dot |O Q|>|O A|^2$],
    [$|B P| dot |B Q|>|B A|^2$],
  ),
  answers: ([BCD],),
  explanation: [
    #step[选项 A、B][
      代入 $A$ 得 $p=1/2$，故抛物线为 $y=x^2$，准线为 $y=-1/4$，A 错误。直线 $A B$ 为 $y=2x-1$，与抛物线联立得 $(x-1)^2=0$，故相切，B 正确。
    ]
    #step[选项 C、D][
      直线 $P Q$ 不竖直，可设为 $y=k x-1$。交点横坐标 $x_1,x_2$ 为 $x^2-k x+1=0$ 的两个不同实根，故 $|k|>2$，$x_1 x_2=1$，$x_1+x_2=k$。
      $ |O P| dot |O Q|=|x_1 x_2|sqrt((1+x_1^2)(1+x_2^2))=|k|>2=|O A|^2. $
      又 $|B P|=|x_1|sqrt(1+k^2)$，$|B Q|=|x_2|sqrt(1+k^2)$，故 $|B P| dot |B Q|=1+k^2>5=|B A|^2$。C、D 正确。
    ]
  ],
)
#question(
  "multiple-choice",
  score: 5,
  stem: [已知函数 $f(x)$ 及其导函数 $f'(x)$ 的定义域均为 $RR$，记 $g(x)=f'(x)$。若 $f(3/2-2x)$、$g(2+x)$ 均为偶函数，则#choice-placeholder()。],
  choices: ([$f(0)=0$], [$g(-1/2)=0$], [$f(-1)=f(4)$], [$g(-1)=g(2)$]),
  answers: ([BC],),
  explanation: [
    #step[选项 B、C][
      题设等价于 $f(3-x)=f(x)$、$g(4-x)=g(x)$。前式直接给出 $f(-1)=f(4)$，C 正确。将前式求导，得 $g(3-x)=-g(x)$，特别地 $g(3/2)=0$。结合后式可得 $g(x+1)=-g(x)$，故 $g(x+2)=g(x)$，于是 $g(-1/2)=g(3/2)=0$，B 正确。
    ]
    #step[选项 A、D][
      取 $f(x)=1$，题设条件均成立，但 $f(0)!=0$，故 A 不一定成立。
      取 $f(x)=sin(pi x)$，则 $g(x)=pi cos(pi x)$，也满足题设条件，而 $g(-1)=-pi!=pi=g(2)$，故 D 不一定成立。
    ]
  ],
)

#section[填空题。本大题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [$(1-y/x)(x+y)^8$ 的展开式中 $x^2 y^6$ 的系数为#fill-placeholder()（用数字作答）。],
  answers: ([$-28$],),
  explanation: [所求系数等于 $(x+y)^8$ 中 $x^2 y^6$ 的系数减去 $x^3 y^5$ 的系数，即 $binom(8, 6)-binom(8, 5)=28-56=-28$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [写出与圆 $x^2+y^2=1$ 和 $(x-3)^2+(y-4)^2=16$ 都相切的一条直线的方程#fill-placeholder()。],
  answers: ([$x=-1$（答案不唯一）],),
  explanation: [两圆的圆心分别为 $(0,0)$、$(3,4)$，半径分别为 1、4。直线 $x=-1$ 到两圆心的距离分别为 1、4，恰等于对应半径，故与两圆均相切。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若曲线 $y=(x+a)e^x$ 有两条过坐标原点的切线，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$(-infinity,-4) union (0,+infinity)$],),
  explanation: [
    #step[求切点横坐标][
      设切点横坐标为 $t$。切线过原点要求 $(t+a)e^t=t(t+a+1)e^t$，即 $t^2+a t-a=0$。两个不同切点要求 $Delta=a^2+4a>0$，得 $a< -4$ 或 $a>0$。
    ]
    #step[确认两切线不同][
      由切点方程知 $t!=1$，且切线斜率为 $k=e^t/(1-t)$。
      若 $a>0$，两根满足 $t_1<0<t_2<1$，故 $k_1<1<k_2$。
      若 $a< -4$，两根满足 $1<t_1<2<t_2$，且 $(t_1-1)(t_2-1)=1$。令 $u=t_2-1>1$，则
      $ ln|k_2|-ln|k_1|=u-1/u-2ln u>0. $
      最后一个不等式成立，是因为右端在 $u=1$ 时为 0，导数为 $(u-1)^2/u^2>0$。故两种情形下斜率均不同，所求范围如上。
    ]
  ],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$），$C$ 的上顶点为 $A$，两个焦点为 $F_1$、$F_2$，离心率为 $1/2$。过 $F_1$ 且垂直于 $A F_2$ 的直线与 $C$ 交于 $D$、$E$ 两点，$|D E|=6$，则 $triangle A D E$ 的周长是#fill-placeholder()。],
  answers: ([$13$],),
  explanation: [
    #step[利用弦长确定椭圆大小][
      设半焦距为 $c$，则 $a=2c$，$b=sqrt(3)c$。不妨取 $F_1=(-c,0)$、$F_2=(c,0)$，则 $A=(0,sqrt(3)c)$，直线 $D E$ 为 $x=sqrt(3)y-c$。代入椭圆得
      $ 13y^2-6sqrt(3)c y-9c^2=0. $
      两根之差的绝对值为 $(24c)/13$，故 $|D E|=2 times (24c)/13=6$，解得 $c=13/8$、$a=13/4$。
    ]
    #step[借助对称性求周长][
      $triangle A F_1 F_2$ 为等边三角形，所以 $D E$ 是 $A F_2$ 的垂直平分线，得 $A D=F_2 D$、$A E=F_2 E$。又焦点 $F_1$ 在弦 $D E$ 内部，故
      $ A D+A E+D E=(F_2 D+F_1 D)+(F_2 E+F_1 E)=4a=13. $
      #figure(ellipse-diagram())
    ]
  ],
)

#section[解答题。本大题共 6 小题，共 70 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 10,
  stem: [记 $S_n$ 为数列 ${a_n}$ 的前 $n$ 项和，已知 $a_1=1$，${S_n/a_n}$ 是公差为 $1/3$ 的等差数列。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式；],
      answers: ([$a_n=(n(n+1))/2$],),
      explanation: [由 $S_1/a_1=1$，得 $S_n/a_n=(n+2)/3$。当 $n>=2$ 时，将 $3S_n=(n+2)a_n$ 与 $3S_(n-1)=(n+1)a_(n-1)$ 相减，得 $(n-1)a_n=(n+1)a_(n-1)$。因此
        $ a_n=a_1 product_(k=2)^n (k+1)/(k-1)=(n(n+1))/2. $
        $n=1$ 时也成立。
      ],
    ),
    subquestion(
      stem: [证明：$1/a_1+1/a_2+dots.c+1/a_n<2$。],
      answers: ([证明见解析。],),
      explanation: [由第（1）问，$1/a_k=2/(k(k+1))=2(1/k-1/(k+1))$。裂项相消得
        $ sum_(k=1)^n 1/a_k=2(1-1/(n+1))<2. $
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [记 $triangle A B C$ 的内角 $A$、$B$、$C$ 的对边分别为 $a$、$b$、$c$，已知 $(cos A)/(1+sin A)=(sin 2B)/(1+cos 2B)$。],
  parts: (
    subquestion(
      stem: [若 $C=(2pi)/3$，求 $B$；],
      answers: ([$pi/6$],),
      explanation: [因 $A+B=pi/3$，两角均为锐角。条件化为 $(cos A)/(1+sin A)=tan B$，即 $cos A cos B=(1+sin A)sin B$，所以 $cos(A+B)=sin B$。于是 $sin B=1/2$，结合 $0<B<pi/3$ 得 $B=pi/6$。],
    ),
    subquestion(
      stem: [求 $(a^2+b^2)/c^2$ 的最小值。],
      answers: ([$4sqrt(2)-5$],),
      explanation: [
        #step[确定角之间的关系][
          原式要求 $B!=pi/2$。若 $B>pi/2$，则 $A<pi/2$，等式左侧为正而右侧 $tan B$ 为负，矛盾。故 $B$ 为锐角，进而 $A$ 也为锐角。
          利用半角恒等式，得 $tan(pi/4-A/2)=tan B$，从而 $A=pi/2-2B$，$C=pi/2+B$，且 $0<B<pi/4$。
        ]
        #step[化为单变量求最小值][
          由正弦定理，
          $
            (a^2+b^2)/c^2=(sin^2 A+sin^2 B)/(sin^2 C)=(cos^2 2B+sin^2 B)/(cos^2 B)=4cos^2 B+2/(cos^2 B)-5>=4sqrt(2)-5.
          $
          当 $cos^2 B=1/sqrt(2)$ 时等号成立，该值在 $(1/2,1)$ 内，存在符合 $0<B<pi/4$ 的角 $B$。故最小值为 $4sqrt(2)-5$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，直三棱柱 $A B C-A_1 B_1 C_1$ 的体积为 4，$triangle A_1 B C$ 的面积为 $2sqrt(2)$。
    #figure(prism-diagram())
  ],
  parts: (
    subquestion(
      stem: [求 $A$ 到平面 $A_1 B C$ 的距离；],
      answers: ([$sqrt(2)$],),
      explanation: [三棱锥 $A_1-A B C$ 的体积为棱柱体积的 $1/3$，即 $4/3$。设所求距离为 $h$，同一三棱锥换底后有 $1/3 times 2sqrt(2)h=4/3$，得 $h=sqrt(2)$。],
    ),
    subquestion(
      stem: [设 $D$ 为 $A_1 C$ 的中点，$A A_1=A B$，平面 $A_1 B C perp$ 平面 $A B B_1 A_1$，求二面角 $A-B D-C$ 的正弦值。],
      answers: ([$sqrt(3)/2$],),
      explanation: [
        #step[确定三条互相垂直的棱长][
          取 $A_1 B$ 中点 $E$。因 $A A_1=A B$，得 $A E perp A_1 B$，由两平面垂直知 $A E perp$ 平面 $A_1 B C$。故 $A E=sqrt(2)$，且 $A E perp B C$。直棱柱中又有 $B B_1 perp B C$，而直线 $A E$、$B B_1$ 相交且同在平面 $A B B_1 A_1$ 内，故 $B C perp$ 平面 $A B B_1 A_1$。
          在等腰直角三角形 $A A_1 B$ 中，$A E=sqrt(2)$ 给出 $A B=A A_1=2$、$A_1 B=2sqrt(2)$。再由 $S_(triangle A_1 B C)=1/2 A_1 B dot B C=2sqrt(2)$，得 $B C=2$。
        ]
        #step[利用法向量求角][
          以 $B$ 为原点，$B C$、$B A$、$B B_1$ 为三个坐标轴正方向，则 $A=(0,2,0)$，$C=(2,0,0)$，$A_1=(0,2,2)$，$D=(1,1,1)$。
          平面 $A B D$、$C B D$ 的法向量分别可取 $bold(m)=(1,0,-1)$、$bold(n)=(0,1,-1)$，两向量夹角余弦为 $1/2$。故所求二面角的正弦值为 $sqrt(1-1/4)=sqrt(3)/2$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [
    一医疗团队为研究某地的一种地方性疾病与当地居民的卫生习惯（卫生习惯分为良好和不够良好两类）的关系，在已患该疾病的病例中随机调查了 100 例（称为病例组），同时在未患该疾病的人群中随机调查了 100 人（称为对照组），得到如下数据：
    #table(
      columns: 3,
      align: center + horizon,
      [], [不够良好], [良好],
      [病例组], [40], [60],
      [对照组], [10], [90],
    )

    附：$K^2=(n(a d-b c)^2)/((a+b)(c+d)(a+c)(b+d))$。
    #table(
      columns: 4,
      align: center + horizon,
      [$P(K^2>=k)$], [0.050], [0.010], [0.001],
      [$k$], [3.841], [6.635], [10.828],
    )
  ],
  parts: (
    subquestion(
      stem: [能否有 99% 的把握认为患该疾病群体与未患该疾病群体的卫生习惯有差异？],
      answers: ([能。],),
      explanation: [由表中数据，$K^2=(200(40 times 90-60 times 10)^2)/(100 times 100 times 50 times 150)=24>6.635$。因此有 99% 的把握认为两群体的卫生习惯有差异。],
    ),
    subquestion(
      stem: [从该地的人群中任选一人，$A$ 表示事件“选到的人卫生习惯不够良好”，$B$ 表示事件“选到的人患有该疾病”，$(P(B | A))/(P(overline(B) | A))$ 与 $(P(B | overline(A)))/(P(overline(B) | overline(A)))$ 的比值是卫生习惯不够良好对患该疾病风险程度的一项度量指标，记该指标为 $R$。],
      parts: (
        subquestion(
          stem: [证明：$R=(P(A | B))/(P(overline(A) | B)) dot (P(overline(A) | overline(B)))/(P(A | overline(B)))$；],
          answers: ([证明见解析。],),
          explanation: [由条件概率公式，
            $
              R&=(P(A inter B))/(P(A inter overline(B))) dot (P(overline(A) inter overline(B)))/(P(overline(A) inter B)) \
              &=(P(A | B)P(B))/(P(A | overline(B))P(overline(B))) dot (P(overline(A) | overline(B))P(overline(B)))/(P(overline(A) | B)P(B)) \
              &=(P(A | B))/(P(overline(A) | B)) dot (P(overline(A) | overline(B)))/(P(A | overline(B))).
            $
          ],
        ),
        subquestion(
          stem: [利用该调查数据，给出 $P(A | B)$、$P(A | overline(B))$ 的估计值，并利用第（i）问的结果给出 $R$ 的估计值。],
          answers: ([$0.4$、$0.1$；$R$ 的估计值为 6。],),
          explanation: [由频率估计条件概率，$P(A | B)$ 的估计值为 $40/100=0.4$，$P(A | overline(B))$ 的估计值为 $10/100=0.1$。其补事件的条件概率分别估计为 0.6、0.9，故 $R$ 的估计值为 $0.4/0.6 times 0.9/0.1=6$。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知点 $A(2,1)$ 在双曲线 $C:x^2/a^2-y^2/(a^2-1)=1$（$a>1$）上，直线 $l$ 交 $C$ 于 $P$、$Q$ 两点，直线 $A P$、$A Q$ 的斜率之和为 0。],
  parts: (
    subquestion(stem: [求 $l$ 的斜率；], answers: ([$-1$],), explanation: [
      #step[用两条直线的斜率表示交点][
        将 $A$ 代入，得 $(a^2-2)^2=0$，故双曲线方程为 $x^2/2-y^2=1$。设 $A P$ 的斜率为 $t$，则 $A Q$ 的斜率为 $-t$。可写 $P=(2+u,1+t u)$，$Q=(2+v,1-t v)$，其中 $u,v!=0$。
        分别代入双曲线，解得
        $ u=(4(t-1))/(1-2t^2), quad v=(-4(t+1))/(1-2t^2). $
        若 $1-2t^2=0$，相应直线只有交点 $A$，不合题意；若 $t=0$，则 $P=Q$，也不合题意，故上述分母与 $t$ 均不为 0。
      ]
      #step[求两交点连线的斜率][
        $ u-v=(8t)/(1-2t^2)!=0, quad t(u+v)=(-8t)/(1-2t^2). $
        因此 $l$ 的斜率为 $(t(u+v))/(u-v)=-1$。
      ]
    ]),
    subquestion(
      stem: [若 $tan angle P A Q=2sqrt(2)$，求 $triangle P A Q$ 的面积。],
      answers: ([$(16sqrt(2))/9$],),
      explanation: [
        沿用第（1）问的记号，$t!=+-1$，否则 $u$ 或 $v$ 为 0。又
        $
          u v=(16(1-t^2))/(1-2t^2)^2, quad arrow(A P) dot arrow(A Q)=u v(1-t^2)>0.
        $
        故 $angle P A Q$ 为锐角，其正切值为 $(2|t u v|)/(u v(1-t^2))=(2|t|)/|1-t^2|$。令其等于 $2sqrt(2)$，平方整理得 $(2t^2-1)(t^2-2)=0$。因 $t^2!=1/2$，故 $t^2=2$，$|u v|=16/9$。
        所求面积为 $1/2 |u(-t v)-v(t u)|=|t u v|=(16sqrt(2))/9$。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=e^x-a x$ 和 $g(x)=a x-ln x$ 有相同的最小值。],
  parts: (
    subquestion(stem: [求 $a$；], answers: ([$1$],), explanation: [
      当 $a<=0$ 时，$g(x)=a x-ln x$ 随 $x$ 趋于正无穷而趋于负无穷，无最小值，故 $a>0$。
      由 $f'(x)=e^x-a$，$g'(x)=a-1/x$，两函数分别在 $x=ln a$、$x=1/a$ 处取最小值。于是 $a-a ln a=1+ln a$，即 $ln a-(a-1)/(a+1)=0$。
      令 $H(a)=ln a-(a-1)/(a+1)$，则 $H'(a)=(a^2+1)/(a(a+1)^2)>0$，且 $H(1)=0$，故唯一解为 $a=1$。
    ]),
    subquestion(
      stem: [证明：存在直线 $y=b$，其与两条曲线 $y=f(x)$ 和 $y=g(x)$ 共有三个不同的交点，并且从左到右的三个交点的横坐标成等差数列。],
      answers: ([证明见解析。],),
      explanation: [
        #step[找到两曲线的唯一公共点][
          此时 $f(x)=e^x-x$，$g(x)=x-ln x$，两函数的最小值均为 1，分别在 $x=0$、$x=1$ 处取得。在 $x>0$ 上令 $h(x)=f(x)-g(x)=e^x+ln x-2x$。由 $e^x>1+x$，有
          $ h'(x)=e^x+1/x-2>x+1/x-1>=1. $
          又 $h(x)$ 在 $x arrow.r 0^+$ 时趋于负无穷，且 $h(1)=e-2>0$，故存在唯一 $c in (0,1)$ 使 $f(c)=g(c)$。
        ]
        #step[选择水平直线并证明等差关系][
          令 $b=f(c)=g(c)>1$。由两函数的单调性及各自定义域两端的趋向，$f(x)=b$ 恰有两根 $u<0<c$，$g(x)=b$ 也恰有两根，分别在 $(0,1)$、$(1,+infinity)$ 内。
          对 $f(t)=b$ 的任一根 $t$，有 $e^t=t+b$，且 $g(e^t)=e^t-t=b$。因此 $g(x)=b$ 的两根为 $u+b$、$c+b$。因 $c+b=e^c>1$，而 $c in (0,1)$ 本身也是 $g(x)=b$ 的根，故 $u+b=c$。
          所以两曲线与 $y=b$ 共有三个不同交点，横坐标依次为 $c-b$、$c$、$c+b$，恰成公差为 $b$ 的等差数列。
        ]
      ],
    ),
  ),
)
