#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷理科",
  source: "https://gkb-cms.oss-cn-beijing.aliyuncs.com/attachs/ohr/2017/06/08/201811_593940831681d.pdf",
  regions: ("天津",),
)
#let loop-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((-0.6, 0.3), (0.6, -0.3), radius: 0.15)
    content((0, 0), [开始])
    line((-0.85, -1), (1, -1), (0.85, -1.7), (-1, -1.7), close: true)
    content((0, -1.35), [输入 $N$])
    line((0, -2.4), (2.6, -3.1), (0, -3.8), (-2.6, -3.1), close: true)
    content((0, -3.1), [$N$ 能被 $3$ 整除？])
    rect((-0.85, -4.5), (0.85, -5.6))
    content((0, -5.05), $N=N/3$)
    rect((2.5, -4.7), (4.7, -5.4))
    content((3.6, -5.05), $N=N-1$)
    line((0, -6.4), (1.5, -7), (0, -7.6), (-1.5, -7), close: true)
    content((0, -7), $N<=3$)
    line((-0.85, -8.4), (1, -8.4), (0.85, -9.1), (-1, -9.1), close: true)
    content((0, -8.75), [输出 $N$])
    rect((-0.6, -9.8), (0.6, -10.4), radius: 0.15)
    content((0, -10.1), [结束])
    for (a, b) in (
      ((0, -0.3), (0, -1)),
      ((0, -1.7), (0, -2.4)),
      ((0, -3.8), (0, -4.5)),
      ((0, -5.6), (0, -6.4)),
      ((0, -7.6), (0, -8.4)),
      ((0, -9.1), (0, -9.8)),
    ) { line(a, b, mark: (end: ">")) }
    line((2.6, -3.1), (3.6, -3.1), (3.6, -4.7), mark: (end: ">"))
    line((3.6, -5.4), (3.6, -6), (0, -6), mark: (end: ">"))
    line((-1.5, -7), (-3, -7), (-3, -2.05), (0, -2.05), mark: (end: ">"))
    for (p, label) in (
      ((0.3, -4.05), [是]),
      ((0.3, -7.9), [是]),
      ((2.8, -2.9), [否]),
      ((-1.9, -6.8), [否]),
    ) { content(p, label) }
  })
}

#let pyramid() = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (0, 4, 0)
  let p = (0, 0, 4)
  let d = (0, 0, 2)
  let e = (0, 2, 2)
  let m = (0, 0, 1)
  let n = (1, 2, 0)
  oblique-project((-0.6, -0.3), (0.6, -0.15), (0, 0.9), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, b, c, p)
    line(b, e, n)
    for (u, v) in ((p, a), (a, b), (a, c), (b, d), (d, e), (m, e), (m, n)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    for (pt, label, anchor) in (
      (a, $A$, "north"),
      (b, $B$, "east"),
      (c, $C$, "west"),
      (p, $P$, "south"),
      (d, $D$, "east"),
      (e, $E$, "west"),
      (m, $M$, "east"),
      (n, $N$, "north"),
    ) { content(pt, label, anchor: anchor, padding: 3pt) }
  })
})
#section[选择题：共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={1,2,6}$，$B={2,4}$，$C={x in RR | -1<=x<=5}$，则 $(A union B) inter C=$#choice-placeholder()。],
  choices: ([${2}$], [${1,2,4}$], [${1,2,4,6}$], [${x in RR | -1<=x<=5}$]),
  answers: ([B],),
  explanation: [$A union B={1,2,4,6}$，与 $C$ 取交集得到 ${1,2,4}$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设变量 $x,y$ 满足约束条件 $cases(2x+y>=0, x+2y-2>=0, x<=0, y<=3)$，则目标函数 $z=x+y$ 的最大值为#choice-placeholder()。],
  choices: ([$2/3$], [$1$], [$3/2$], [$3$]),
  answers: ([D],),
  explanation: [由 $x<=0,y<=3$ 得 $z=x+y<=3$。点 $(0,3)$ 满足全部约束并使等号成立，故最大值为 $3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [阅读程序框图，运行相应的程序，若输入 $N$ 的值为 $24$，则输出 $N$ 的值为#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$0$], [$1$], [$2$], [$3$]),
  answers: ([C],),
  explanation: [$N$ 依次变化为 $24 arrow 8 arrow 7 arrow 6 arrow 2$，此时满足 $N<=3$，故输出 $2$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $theta in RR$，则“$abs(theta-pi/12)<pi/12$”是“$sin theta<1/2$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [前者等价于 $0<theta<pi/6$，可推出 $sin theta<1/2$。但 $theta=0$ 满足后者而不满足前者，故为充分而不必要条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的左焦点为 $F$，离心率为 $sqrt(2)$。若经过 $F$ 和 $P(0,4)$ 两点的直线平行于双曲线的一条渐近线，则双曲线的方程为#choice-placeholder()。],
  choices: (
    [$x^2/4-y^2/4=1$],
    [$x^2/8-y^2/8=1$],
    [$x^2/4-y^2/8=1$],
    [$x^2/8-y^2/4=1$],
  ),
  answers: ([B],),
  explanation: [由 $c/a=sqrt(2)$、$c^2=a^2+b^2$，得 $a=b$，渐近线斜率为 $plus.minus 1$。直线 $F P$ 的斜率为 $4/c>0$，故 $4/c=1$，得 $c=4$，进而 $a^2=b^2=8$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知奇函数 $f(x)$ 在 $RR$ 上是增函数，$g(x)=x f(x)$。若 $a=g(-log_2 5.1)$，$b=g(2^0.8)$，$c=g(3)$，则 $a,b,c$ 的大小关系为#choice-placeholder()。],
  choices: ([$a<b<c$], [$c<b<a$], [$b<a<c$], [$b<c<a$]),
  answers: ([C],),
  explanation: [$g(-x)=(-x)f(-x)=x f(x)=g(x)$，所以 $g$ 为偶函数。又 $f(0)=0$，当 $0<u<v$ 时有 $0<f(u)<f(v)$，从而 $u f(u)<v f(v)$，故 $g$ 在 $(0,+infinity)$ 上递增。由 $0<2^0.8<2<log_2 5.1<3$，得 $b<a<c$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=2sin(omega x+phi)$，$x in RR$，其中 $omega>0$，$abs(phi)<pi$。若 $f((5pi)/8)=2$，$f((11pi)/8)=0$，且 $f(x)$ 的最小正周期大于 $2pi$，则#choice-placeholder()。],
  choices: (
    [$omega=2/3,phi=pi/12$],
    [$omega=2/3,phi=-(11pi)/12$],
    [$omega=1/3,phi=-(11pi)/24$],
    [$omega=1/3,phi=(7pi)/24$],
  ),
  answers: ([A],),
  explanation: [周期条件给出 $0<omega<1$。自最大值点 $x=(5pi)/8$ 向右到零点 $(11pi)/8$，相位增加 $(3pi)/4 omega in (0,(3pi)/4)$，只能等于 $pi/2$，故 $omega=2/3$。再由 $(5pi)/12+phi=pi/2+2k pi$，结合 $abs(phi)<pi$ 得 $phi=pi/12$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=cases(x^2-x+3 quad &x<=1, x+2/x quad &x>1)$，设 $a in RR$，若关于 $x$ 的不等式 $f(x)>=abs(x/2+a)$ 在 $RR$ 上恒成立，则 $a$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$[-47/16,2]$],
    [$[-47/16,39/16]$],
    [$[-2sqrt(3),2]$],
    [$[-2sqrt(3),39/16]$],
  ),
  answers: ([A],),
  explanation: [原不等式等价于 $-f(x)-x/2<=a<=f(x)-x/2$。
    #step[$x<=1$][
      $-f(x)-x/2=-(x-1/4)^2-47/16<= -47/16$，且在 $x=1/4$ 时取等号；
      $f(x)-x/2=(x-3/4)^2+39/16>=39/16$，且在 $x=3/4$ 时取等号。
      故此时恒成立等价于 $-47/16<=a<=39/16$。
    ]
    #step[$x>1$][
      $3x/2+2/x>=2sqrt(3)$，等号在 $x=2/sqrt(3)>1$ 时取得；
      $x/2+2/x>=2$，等号在 $x=2$ 时取得。
      故此时恒成立等价于 $-2sqrt(3)<=a<=2$。
    ]
    两个范围取交集，得到 $[-47/16,2]$。
  ],
)
#section[填空题：共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知 $a in RR$，$i$ 为虚数单位，若 $(a-i)/(2+i)$ 为实数，则 $a$ 的值为#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [$(a-i)/(2+i)=((a-i)(2-i))/5=(2a-1)/5-(a+2)/5 i$，虚部为零要求 $a=-2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知一个正方体的所有顶点在一个球面上，若这个正方体的表面积为 $18$，则这个球的体积为#fill-placeholder()。],
  answers: ([$(9pi)/2$],),
  explanation: [设正方体棱长为 $s$，则 $6s^2=18$，$s=sqrt(3)$。外接球直径等于体对角线 $sqrt(3)s=3$，半径为 $3/2$，故体积 $V=4/3 pi(3/2)^3=(9pi)/2$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [在极坐标系中，直线 $4rho cos(theta-pi/6)+1=0$ 与圆 $rho=2sin theta$ 的公共点的个数为#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [化为直角坐标方程，直线为 $2sqrt(3)x+2y+1=0$，圆为 $x^2+(y-1)^2=1$。圆心到直线的距离为 $3/4<1$，故直线与圆有 $2$ 个公共点。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $a,b in RR$，$a b>0$，则 $(a^4+4b^4+1)/(a b)$ 的最小值为#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [由 $a^4+4b^4>=4a^2 b^2$，得
    $ (a^4+4b^4+1)/(a b)>=4a b+1/(a b)>=4. $
    两步等号要求 $a^2=2b^2$ 且 $a b=1/2$，如取 $a=2^(-1/4),b=2^(-3/4)$ 即可同时满足，所以最小值为 $4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $triangle A B C$ 中，$angle A=60 degree$，$A B=3$，$A C=2$。若 $arrow(B D)=2arrow(D C)$，$arrow(A E)=lambda arrow(A C)-arrow(A B)$（$lambda in RR$），且 $arrow(A D) dot arrow(A E)=-4$，则 $lambda$ 的值为#fill-placeholder()。],
  answers: ([$3/11$],),
  explanation: [由分点关系，$arrow(A D)=1/3 arrow(A B)+2/3 arrow(A C)$，且 $arrow(A B) dot arrow(A C)=3 times 2 times cos 60 degree=3$。因此
    $ arrow(A D) dot arrow(A E)=lambda+8/3 lambda-3-2=(11lambda)/3-5=-4, $
    解得 $lambda=3/11$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [用数字 $1,2,3,4,5,6,7,8,9$ 组成没有重复数字，且至多有一个数字是偶数的四位数，这样的四位数一共有#fill-placeholder()个。（用数字作答）],
  answers: ([$1080$],),
  explanation: [四个数字全为奇数的有 $A_5^4=120$ 个；恰有一个偶数的有 $C_4^1 C_5^3 A_4^4=960$ 个。两类相加得 $1080$。],
)
#section[解答题：共 6 小题，共 80 分。解答应写出文字说明、证明过程或演算步骤。]

#question(
  "solution",
  score: 13,
  stem: [在 $triangle A B C$ 中，内角 $A,B,C$ 所对的边分别为 $a,b,c$。已知 $a>b$，$a=5,c=6$，$sin B=3/5$。],
  parts: (
    subquestion(
      stem: [求 $b$ 和 $sin A$ 的值。],
      answers: ([$b=sqrt(13)$，$sin A=3sqrt(13)/13$。],),
      explanation: [由 $a>b$ 得 $A>B$，故 $B<pi/2$，从而 $cos B=4/5$。由余弦定理，$b^2=5^2+6^2-2 times 5 times 6 times 4/5=13$，所以 $b=sqrt(13)$。由正弦定理，$sin A=(a sin B)/b=3sqrt(13)/13$。],
    ),
    subquestion(
      stem: [求 $sin(2A+pi/4)$ 的值。],
      answers: ([$7sqrt(2)/26$],),
      explanation: [因 $a<c$，得 $A<C$，所以 $A<pi/2$，从而 $cos A=2sqrt(13)/13$。于是 $sin 2A=12/13$、$cos 2A=-5/13$，故
        $ sin(2A+pi/4)=(sin 2A+cos 2A)/sqrt(2)=7sqrt(2)/26. $
      ],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [从甲地到乙地要经过 $3$ 个十字路口，设各路口信号灯工作相互独立，且在各路口遇到红灯的概率分别为 $1/2,1/3,1/4$。],
  parts: (
    subquestion(
      stem: [记 $X$ 表示一辆车从甲地到乙地遇到红灯的个数，求随机变量 $X$ 的分布列和数学期望。],
      answers: ([分布列见解析，$E(X)=13/12$。],),
      explanation: [$X$ 的可能取值为 $0,1,2,3$。根据独立性，
        $ P(X=0)=1/2 times 2/3 times 3/4=1/4, $
        $
          P(X=1)=1/2 times 2/3 times 3/4+1/2 times 1/3 times 3/4+1/2 times 2/3 times 1/4=11/24,
        $
        $ P(X=3)=1/2 times 1/3 times 1/4=1/24, $
        $ P(X=2)=1-P(X=0)-P(X=1)-P(X=3)=1/4. $
        因此分布列为
        #table(
          columns: 5,
          align: center,
          [$X$], [$0$], [$1$], [$2$], [$3$],
          [$P$], [$1/4$], [$11/24$], [$1/4$], [$1/24$],
        )
        $ E(X)=0 times 1/4+1 times 11/24+2 times 1/4+3 times 1/24=13/12. $
      ],
    ),
    subquestion(
      stem: [若有 $2$ 辆车独立地从甲地到乙地，求这 $2$ 辆车共遇到 $1$ 个红灯的概率。],
      answers: ([$11/48$],),
      explanation: [只有第一辆遇到一次、第二辆未遇到，或第一辆未遇到、第二辆遇到一次这两种互斥情形。因此所求概率为 $2 times 11/24 times 1/4=11/48$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [如图，在三棱锥 $P-A B C$ 中，$P A perp$ 底面 $A B C$，$angle B A C=90 degree$。点 $D,E,N$ 分别为棱 $P A,P C,B C$ 的中点，$M$ 是线段 $A D$ 的中点，$P A=A C=4$，$A B=2$。
    #figure(pyramid())
  ],
  parts: (
    subquestion(
      stem: [求证：$M N parallel$ 平面 $B D E$。],
      answers: ([证明见解析。],),
      explanation: [以 $A$ 为原点，$A B,A C,A P$ 分别为 $x,y,z$ 轴正方向建立空间直角坐标系。则
        $ A(0,0,0), B(2,0,0), C(0,4,0), P(0,0,4), $
        $ D(0,0,2), E(0,2,2), M(0,0,1), N(1,2,0). $
        平面 $B D E$ 的方程为 $x+z=2$，法向量为 $(1,0,1)$。而 $arrow(M N)=(1,2,-1)$，与该法向量垂直，且 $M$ 不在平面内，故 $M N parallel$ 平面 $B D E$。
      ],
    ),
    subquestion(
      stem: [求二面角 $C-E M-N$ 的正弦值。],
      answers: ([$sqrt(105)/21$],),
      explanation: [沿用第（1）问的坐标系。平面 $C E M$ 为 $x=0$，可取法向量 $bold(n)_1=(1,0,0)$。由 $arrow(E M)=(0,-2,-1)$、$arrow(M N)=(1,2,-1)$，可取平面 $E M N$ 的法向量 $bold(n)_2=(-4,1,-2)$。
        两法向量夹角余弦的绝对值为 $4/sqrt(21)$，所以所求二面角的正弦值为 $sqrt(1-16/21)=sqrt(105)/21$。
      ],
    ),
    subquestion(
      stem: [已知点 $H$ 在棱 $P A$ 上，且直线 $N H$ 与直线 $B E$ 所成角的余弦值为 $sqrt(7)/21$，求线段 $A H$ 的长。],
      answers: ([$1/2$ 或 $8/5$。],),
      explanation: [设 $A H=t$，$0<=t<=4$，则 $H=(0,0,t)$，$arrow(N H)=(-1,-2,t)$，$arrow(B E)=(-2,2,2)$。由两直线所成角的公式，
        $ abs(2t-2)/(sqrt(t^2+5) times 2sqrt(3))=sqrt(7)/21. $
        两边平方整理得 $10t^2-21t+8=0$，解得 $t=1/2$ 或 $t=8/5$。二者均在 $[0,4]$ 内并满足原式，故均可取。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知 ${a_n}$ 为等差数列，前 $n$ 项和为 $S_n$（$n in NN^*$），${b_n}$ 是首项为 $2$ 的等比数列，且公比大于 $0$，$b_2+b_3=12$，$b_3=a_4-2a_1$，$S_11=11b_4$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 和 ${b_n}$ 的通项公式。],
      answers: ([$a_n=3n-2$，$b_n=2^n$。],),
      explanation: [设公差为 $d$、公比为 $q>0$。由 $2q+2q^2=12$ 得 $(q-2)(q+3)=0$，所以 $q=2$，$b_n=2^n$。再由 $b_3=a_4-2a_1$、$S_11=11b_4$ 得
        $ cases(3d-a_1=8, a_1+5d=16). $
        解得 $d=3,a_1=1$，所以 $a_n=3n-2$。],
    ),

    subquestion(
      stem: [求数列 ${a_(2n) b_(2n-1)}$ 的前 $n$ 项和（$n in NN^*$）。],
      answers: ([$((3n-2)4^(n+1)+8)/3$],),
      explanation: [由第（1）问，$a_(2k)b_(2k-1)=(6k-2)2^(2k-1)=(3k-1)4^k$。记前 $n$ 项和为 $T_n$，错位相减得
        $ 4T_n-T_n=(3n-1)4^(n+1)-8-3 sum_(k=2)^n 4^k $
        $ =(3n-1)4^(n+1)-8-(4^(n+1)-16)=(3n-2)4^(n+1)+8. $
        因此 $T_n=((3n-2)4^(n+1)+8)/3$。当 $n=1$ 时中间的和为空和，上式仍成立。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的左焦点为 $F$，右顶点为 $A$，离心率为 $1/2$。已知 $A$ 是抛物线 $y^2=2p x$（$p>0$）的焦点，$F$ 到抛物线的准线 $l$ 的距离为 $1/2$。],
  parts: (
    subquestion(
      stem: [求椭圆的方程和抛物线的方程。],
      answers: ([椭圆：$x^2+4y^2/3=1$；抛物线：$y^2=4x$。],),
      explanation: [设 $F=(-c,0)$，则 $c/a=1/2$，且 $p/2=a$，准线为 $x=-a$。由 $a>c$，$F$ 到准线的距离为 $a-c=1/2$。解得 $a=1,c=1/2,p=2$，从而 $b^2=3/4$，得到所求方程。],
    ),
    subquestion(
      stem: [设 $l$ 上两点 $P,Q$ 关于 $x$ 轴对称，直线 $A P$ 与椭圆相交于点 $B$（$B$ 异于点 $A$），直线 $B Q$ 与 $x$ 轴相交于点 $D$。若 $triangle A P D$ 的面积为 $sqrt(6)/2$，求直线 $A P$ 的方程。],
      answers: ([$3x+sqrt(6)y-3=0$ 或 $3x-sqrt(6)y-3=0$。],),
      explanation: [此时 $A=(1,0)$、$l: x=-1$。面积不为零，故 $A P$ 不为水平线；又 $A P$ 经过准线上一点，故不为竖直线。设 $A P: x=t y+1$，其中 $t!=0$，得 $P=(-1,-2/t)$、$Q=(-1,2/t)$。
        联立椭圆与直线方程，得 $(3t^2+4)y^2+6t y=0$。除去点 $A$，得到
        $ B=((4-3t^2)/(3t^2+4),(-6t)/(3t^2+4)). $
        将 $y=0$ 代入直线 $B Q$ 的方程，得 $D=((2-3t^2)/(3t^2+2),0)$，故 $A D=6t^2/(3t^2+2)$。
        由面积条件，
        $ 1/2 times (6t^2)/(3t^2+2) times 2/abs(t)=sqrt(6)/2, $
        整理为 $3abs(t)^2-2sqrt(6)abs(t)+2=0$，即 $(sqrt(3)abs(t)-sqrt(2))^2=0$。所以 $t=plus.minus sqrt(6)/3$，得到上述两条直线。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设 $a in ZZ$，已知定义在 $RR$ 上的函数 $f(x)=2x^4+3x^3-3x^2-6x+a$ 在区间 $(1,2)$ 内有一个零点 $x_0$，$g(x)$ 为 $f(x)$ 的导函数。],
  parts: (
    subquestion(
      stem: [求 $g(x)$ 的单调区间。],
      answers: (
        [单调递增区间为 $(-infinity,-1)$、$(1/4,+infinity)$，单调递减区间为 $(-1,1/4)$。],
      ),
      explanation: [$g(x)=8x^3+9x^2-6x-6$，$g'(x)=24x^2+18x-6=6(x+1)(4x-1)$。由导数符号可得所述单调区间。],
    ),
    subquestion(
      stem: [设 $m in [1,x_0) union (x_0,2]$，函数 $h(x)=g(x)(m-x_0)-f(m)$，求证：$h(m)h(x_0)<0$。],
      answers: ([证明见解析。],),
      explanation: [由第（1）问知 $g'(x)>0$ 在 $[1,2]$ 上成立。
        #step[证明 $h(m)>0$][令 $u(x)=g(x)(x-x_0)-f(x)$，则 $u'(x)=g'(x)(x-x_0)$。故 $u$ 在 $[1,x_0]$ 上严格递减，在 $[x_0,2]$ 上严格递增。因此 $h(m)=u(m)>u(x_0)=0$。]
        #step[证明 $h(x_0)<0$][令 $v(x)=g(x_0)(x-x_0)-f(x)$，则 $v'(x)=g(x_0)-g(x)$。因 $g$ 严格递增，$v$ 在 $[1,x_0]$ 上严格递增，在 $[x_0,2]$ 上严格递减。因此 $h(x_0)=v(m)<v(x_0)=0$。]
        综上，$h(m)h(x_0)<0$。
      ],
    ),
    subquestion(
      stem: [求证：存在大于 $0$ 的常数 $A$，使得对于任意的正整数 $p,q$，且 $p/q in [1,x_0) union (x_0,2]$，满足 $abs(p/q-x_0)>=1/(A q^4)$。],
      answers: ([证明见解析，可取 $A=82$。],),
      explanation: [在 $[1,2]$ 上，$3=g(1)<=g(x)<=g(2)=82$，故 $f$ 严格递增，$x_0$ 是该区间内唯一零点。
        令 $m=p/q$。由第（2）问及 $h$ 的连续性，在 $m$ 与 $x_0$ 之间存在 $xi$，满足 $h(xi)=0$，即 $f(p/q)=g(xi)(p/q-x_0)$。所以
        $ abs(p/q-x_0)=abs(f(p/q))/g(xi)>=abs(f(p/q))/82. $
        由于 $p/q!=x_0$，有 $f(p/q)!=0$；又 $a,p,q$ 均为整数，因此
        $ q^4 f(p/q)=2p^4+3p^3 q-3p^2 q^2-6p q^3+a q^4 $
        是非零整数，其绝对值至少为 $1$。故 $abs(f(p/q))>=1/q^4$，进而 $abs(p/q-x_0)>=1/(82q^4)$。取常数 $A=82>0$ 即可。
      ],
    ),
  ),
)
