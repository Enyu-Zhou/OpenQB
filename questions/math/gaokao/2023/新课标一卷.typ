#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2023,
  type: "普通高等学校招生全国统一考试",
  name: "新课标一卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2023/2023新高考1(山东,广东,湖南,湖北,河北,江苏,福建,浙江).pdf",
  regions: ("山东", "广东", "湖南", "湖北", "河北", "江苏", "福建", "浙江"),
)

#let prism-diagram() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (2, 2, 0)
  let d = (0, 2, 0)
  let a1 = (0, 0, 4)
  let b1 = (2, 0, 4)
  let c1 = (2, 2, 4)
  let d1 = (0, 2, 4)
  let a2 = (0, 0, 1)
  let b2 = (2, 0, 2)
  let c2 = (2, 2, 3)
  let d2 = (0, 2, 2)
  let p = (2, 0, 3)
  oblique-project((0.4, 0.4), (-1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(d, a, b, b1, c1, d1, d)
    line(a, a1, b1)
    line(a1, d1)
    line(d2, a2, p)
    for edge in ((d, c, b), (c, c1), (a2, c2, d2), (b2, c2, p)) {
      line(..edge, stroke: (dash: figure-style.dash))
    }
    for (point, label, anchor) in (
      (a, $A$, "north"),
      (b, $B$, "west"),
      (c, $C$, "south-east"),
      (d, $D$, "east"),
      (a1, $A_1$, "south"),
      (b1, $B_1$, "south-west"),
      (c1, $C_1$, "south-east"),
      (d1, $D_1$, "east"),
      (a2, $A_2$, "west"),
      (b2, $B_2$, "west"),
      (c2, $C_2$, "east"),
      (d2, $D_2$, "east"),
      (p, $P$, "west"),
    ) { content(point, label, anchor: anchor, padding: 0.12) }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [已知集合 $M={-2,-1,0,1,2}$，$N={x | x^2-x-6>=0}$，则 $M inter N=$#choice-placeholder()。],
  choices: ([${-2,-1,0,1}$], [${0,1,2}$], [${-2}$], [${2}$]),
  answers: ([C],),
  explanation: [$x^2-x-6=(x+2)(x-3)>=0$，得 $x<=-2$ 或 $x>=3$，故 $M inter N={-2}$。],
)
#question(
  "single-choice",
  stem: [已知 $z=(1-"i")/(2+2"i")$，则 $z-overline(z)=$#choice-placeholder()。],
  choices: ([$-"i"$], [$"i"$], [$0$], [$1$]),
  answers: ([A],),
  explanation: [$z=(1-"i")^2/4=-"i"/2$，故 $z-overline(z)=-"i"$。],
)
#question(
  "single-choice",
  stem: [已知向量 $arrow(a)=(1,1)$，$arrow(b)=(1,-1)$。若 $(arrow(a)+lambda arrow(b)) perp (arrow(a)+mu arrow(b))$，则#choice-placeholder()。],
  choices: (
    [$lambda+mu=1$],
    [$lambda+mu=-1$],
    [$lambda mu=1$],
    [$lambda mu=-1$],
  ),
  answers: ([D],),
  explanation: [∵ $arrow(a) dot arrow(b)=0$，$abs(arrow(a))^2=abs(arrow(b))^2=2$，∴ 垂直条件化为 $2+2lambda mu=0$，即 $lambda mu=-1$。],
)
#question(
  "single-choice",
  stem: [设函数 $f(x)=2^(x(x-a))$ 在区间 $(0,1)$ 上单调递减，则 $a$ 的取值范围是#choice-placeholder()。],
  choices: ([$(-infinity,-2]$], [$[-2,0)$], [$(0,2]$], [$[2,+infinity)$]),
  answers: ([D],),
  explanation: [指数函数 $2^t$ 严格递增，故要求 $x^2-a x$ 在 $(0,1)$ 上递减，即其对称轴 $x=a/2$ 不在 $1$ 左侧。因此 $a>=2$。],
)
#question(
  "single-choice",
  stem: [设椭圆 $C_1:x^2/a^2+y^2=1$（$a>1$），$C_2:x^2/4+y^2=1$ 的离心率分别为 $e_1,e_2$。若 $e_2=sqrt(3)e_1$，则 $a=$#choice-placeholder()。],
  choices: ([$(2sqrt(3))/3$], [$sqrt(2)$], [$sqrt(3)$], [$sqrt(6)$]),
  answers: ([A],),
  explanation: [$e_2=sqrt(3)/2$，故 $e_1=1/2$。由 $e_1^2=1-1/a^2=1/4$，得 $a^2=4/3$，即 $a=(2sqrt(3))/3$。],
)
#question(
  "single-choice",
  stem: [过点 $(0,-2)$ 与圆 $x^2+y^2-4x-1=0$ 相切的两条直线的夹角为 $alpha$，则 $sin alpha=$#choice-placeholder()。],
  choices: ([$1$], [$sqrt(15)/4$], [$sqrt(10)/4$], [$sqrt(6)/4$]),
  answers: ([B],),
  explanation: [圆心为 $O_1=(2,0)$，半径为 $sqrt(5)$。记所给点为 $P$、一个切点为 $T$，则 $P O_1=2sqrt(2)$，$P T=sqrt(3)$。
    令 $theta=angle T P O_1$，则两切线所成角的正弦等于 $sin 2theta$，故
    $
      sin alpha=2 times sqrt(5)/(2sqrt(2)) times sqrt(3)/(2sqrt(2))=sqrt(15)/4.
    $],
)
#question(
  "single-choice",
  stem: [记 $S_n$ 为数列 ${a_n}$ 的前 $n$ 项和。设甲：${a_n}$ 为等差数列；乙：${S_n/n}$ 为等差数列，则#choice-placeholder()。],
  choices: (
    [甲是乙的充分条件但不是必要条件],
    [甲是乙的必要条件但不是充分条件],
    [甲是乙的充要条件],
    [甲既不是乙的充分条件也不是乙的必要条件],
  ),
  answers: ([C],),
  explanation: [若 $a_n=a_1+(n-1)d$，则 $S_n/n=a_1+(n-1)d/2$，为等差数列。
    反之，若 $S_n/n=u+(n-1)v$，则 $S_n=v n^2+(u-v)n$。相邻两项和相减，得 $a_n=u+2(n-1)v$，对 $n=1$ 也成立，故 ${a_n}$ 为等差数列。],
)
#question(
  "single-choice",
  stem: [已知 $sin(alpha-beta)=1/3$，$cos alpha sin beta=1/6$，则 $cos(2alpha+2beta)=$#choice-placeholder()。],
  choices: ([$7/9$], [$1/9$], [$-1/9$], [$-7/9$]),
  answers: ([B],),
  explanation: [$sin(alpha+beta)=sin(alpha-beta)+2cos alpha sin beta=2/3$，故 $cos(2alpha+2beta)=1-2(2/3)^2=1/9$。],
)

#section[选择题：本题共 4 小题，每小题 5 分，共 20 分。在每小题给出的选项中，有多项符合题目要求。全部选对得 5 分，部分选对得 2 分，有选错的得 0 分。]
#question(
  "multiple-choice",
  stem: [有一组样本数据 $x_1,x_2,dots.c,x_6$，其中 $x_1$ 是最小值，$x_6$ 是最大值，则#choice-placeholder()。],
  choices: (
    [$x_2,x_3,x_4,x_5$ 的平均数等于 $x_1,x_2,dots.c,x_6$ 的平均数],
    [$x_2,x_3,x_4,x_5$ 的中位数等于 $x_1,x_2,dots.c,x_6$ 的中位数],
    [$x_2,x_3,x_4,x_5$ 的标准差不小于 $x_1,x_2,dots.c,x_6$ 的标准差],
    [$x_2,x_3,x_4,x_5$ 的极差不大于 $x_1,x_2,dots.c,x_6$ 的极差],
  ),
  answers: ([BD],),
  explanation: [删去一个最大值和一个最小值，排序后中间两个数不变，中位数不变，B 正确；极差不会增大，D 正确。
    取数据 $0,1,1,1,1,3$，删去两端后均值由 $7/6$ 变为 $1$，标准差由正数变为 $0$，故 A、C 均不成立。],
)
#question(
  "multiple-choice",
  stem: [噪声污染问题越来越受到重视。用声压级来度量声音的强弱，定义声压级 $L_p=20 times lg(p/p_0)$，其中常数 $p_0$（$p_0>0$）是听觉下限阈值，$p$ 是实际声压。下表为不同声源的声压级：
    #table(
      columns: 3,
      align: center,
      [声源], [与声源的距离/m], [声压级/dB],
      [燃油汽车], [$10$], [$60 tilde 90$],
      [混合动力汽车], [$10$], [$50 tilde 60$],
      [电动汽车], [$10$], [$40$],
    )
    已知在距离燃油汽车、混合动力汽车、电动汽车 $10$ m 处测得实际声压分别为 $p_1,p_2,p_3$，则#choice-placeholder()。],
  choices: ([$p_1>=p_2$], [$p_2>10p_3$], [$p_3=100p_0$], [$p_1<=100p_2$]),
  answers: ([ACD],),
  explanation: [由定义得 $p=p_0 10^(L_p/20)$，故
    $
      p_1 in [10^3 p_0,10^(9/2)p_0], quad p_2 in [10^(5/2)p_0,10^3 p_0], quad p_3=10^2 p_0.
    $
    因此 $p_1>=p_2$，$p_3=100p_0$，$p_1/p_2<=10^2=100$；而 $p_2<=10p_3$。故选 A、C、D。],
)
#question(
  "multiple-choice",
  stem: [已知函数 $f(x)$ 的定义域为 $RR$，$f(x y)=y^2 f(x)+x^2 f(y)$，则#choice-placeholder()。],
  choices: (
    [$f(0)=0$],
    [$f(1)=0$],
    [$f(x)$ 是偶函数],
    [$x=0$ 为 $f(x)$ 的极小值点],
  ),
  answers: ([ABC],),
  explanation: [令 $x=y=0$，得 $f(0)=0$；令 $x=y=1$，得 $f(1)=2f(1)$，故 $f(1)=0$。
    再令 $x=y=-1$，得 $f(-1)=0$。令 $y=-1$，得 $f(-x)=f(x)$，故为偶函数。
    取 $f(x)=cases(x^2 ln abs(x)&quad x!=0, 0&quad x=0)$，可验证满足题设关系，但 $0<abs(x)<1$ 时 $f(x)<f(0)$，所以 $0$ 不是极小值点。故选 A、B、C。],
)
#question(
  "multiple-choice",
  stem: [下列物体中，能被整体放入棱长为 $1$（单位：m）的正方体容器（容器壁厚度忽略不计）内的有#choice-placeholder()。],
  choices: (
    [直径为 $0.99$ m 的球体],
    [所有棱长均为 $1.4$ m 的四面体],
    [底面直径为 $0.01$ m，高为 $1.8$ m 的圆柱体],
    [底面直径为 $1.2$ m，高为 $0.01$ m 的圆柱体],
  ),
  answers: ([ABD],),
  explanation: [
    #step[选项 A、B][直径小于 $1$ 的球显然可以放入。正方体中隔一个顶点取一点，所得四面体六条棱均为 $sqrt(2)>1.4$，将其以中心为基准缩小即可放入选项 B 的正四面体。]
    #step[选项 C][圆柱轴线上两端点相距 $1.8>sqrt(3)$，超过容器内任意两点间的最大距离，不能放入。]
    #step[选项 D][将圆柱轴线沿正方体体对角线放置，两者中心重合。轴线单位向量为 $(1,1,1)/sqrt(3)$。
      底面圆在每个坐标轴方向的投影宽度均为 $1.2sqrt(2/3)$，高度贡献的宽度为 $0.01/sqrt(3)$。总宽度为
      $ 1.2sqrt(2/3)+0.01/sqrt(3) approx 0.986<1. $
      所以圆柱可整体放入正方体。]
  ],
)

#section[填空题：本题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  stem: [某学校开设了 $4$ 门体育类选修课和 $4$ 门艺术类选修课，学生需从这 $8$ 门课中选修 $2$ 门或 $3$ 门课，并且每类选修课至少选修 $1$ 门，则不同的选课方案共有#fill-placeholder() 种。（用数字作答）],
  answers: ([$64$],),
  explanation: [选 $2$ 门时有 $4 times 4=16$ 种；选 $3$ 门时有 $2binom(4, 2) times 4=48$ 种。合计 $16+48=64$ 种。],
)
#question(
  "fill-in",
  stem: [在正四棱台 $A B C D-A_1 B_1 C_1 D_1$ 中，$A B=2$，$A_1 B_1=1$，$A A_1=sqrt(2)$，则该棱台的体积为#fill-placeholder()。],
  answers: ([$(7sqrt(6))/6$],),
  explanation: [侧棱在底面上的投影长为 $sqrt((1/2)^2+(1/2)^2)=sqrt(2)/2$，故高为 $h=sqrt(2-1/2)=sqrt(6)/2$。
    上下底面积分别为 $1,4$，故体积 $V=h/3(1+4+sqrt(1 times 4))=(7sqrt(6))/6$。],
)
#question(
  "fill-in",
  stem: [已知函数 $f(x)=cos omega x-1$（$omega>0$）在区间 $[0,2pi]$ 上有且仅有 $3$ 个零点，则 $omega$ 的取值范围是#fill-placeholder()。],
  answers: ([$[2,3)$],),
  explanation: [零点满足 $omega x=2k pi$。区间内含 $x=0$，其余正零点为 $(2pi)/omega,(4pi)/omega,dots.c$。
    恰有三个零点要求 $(4pi)/omega<=2pi<(6pi)/omega$，即 $2<=omega<3$。],
)
#question(
  "fill-in",
  stem: [已知双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的左、右焦点分别为 $F_1,F_2$。点 $A$ 在 $C$ 上，点 $B$ 在 $y$ 轴上，$arrow(F_1 A) perp arrow(F_1 B)$，$arrow(F_2 A)=-2/3 arrow(F_2 B)$，则 $C$ 的离心率为#fill-placeholder()。],
  answers: ([$(3sqrt(5))/5$],),
  explanation: [设 $F_1=(-c,0)$，$F_2=(c,0)$，$B=(0,t)$。由向量等式，得 $A=(5c/3,-2t/3)$。
    垂直条件给出 $(8c/3)c-(2t/3)t=0$，故 $t^2=4c^2$。
    将 $A$ 代入双曲线方程，并令 $u=c^2/a^2>1$，得
    $ (25u)/9-(16u)/(9(u-1))=1, quad 25u^2-50u+9=0. $
    两根为 $9/5,1/5$，取 $u=9/5$，故离心率 $e=sqrt(u)=(3sqrt(5))/5$。],
)

#section[解答题：本题共 6 小题，共 70 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 10,
  stem: [已知在 $triangle A B C$ 中，$A+B=3C$，$2sin(A-C)=sin B$。],
  parts: (
    subquestion(
      stem: [求 $sin A$。],
      answers: ([$(3sqrt(10))/10$],),
      explanation: [由 $A+B+C=pi$，得 $C=pi/4$，$B=3pi/4-A$。于是
        $ 2(sin A-cos A)=sin A+cos A, quad sin A=3cos A. $
        因 $0<A<pi$，故 $cos A>0$，从而 $sin A=(3sqrt(10))/10$，$cos A=sqrt(10)/10$。],
    ),
    subquestion(
      stem: [设 $A B=5$，求 $A B$ 边上的高。],
      answers: ([$6$],),
      explanation: [由上一问，$sin B=sin(3pi/4-A)=2/sqrt(5)$。由正弦定理，高为
        $ h=A C sin A=(5sin B)/(sin C)sin A=6. $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在正四棱柱 $A B C D-A_1 B_1 C_1 D_1$ 中，$A B=2$，$A A_1=4$，点 $A_2,B_2,C_2,D_2$ 分别在棱 $A A_1,B B_1,C C_1,D D_1$ 上，且 $A A_2=1$，$B B_2=D D_2=2$，$C C_2=3$。#figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [证明：$B_2 C_2 parallel A_2 D_2$。],
      answers: ([证明见解析。],),
      explanation: [以 $A$ 为原点，$A B,A D,A A_1$ 的方向分别为 $x,y,z$ 轴正方向，建立空间直角坐标系，则
        $ A_2=(0,0,1), quad B_2=(2,0,2), quad C_2=(2,2,3), quad D_2=(0,2,2). $
        因 $arrow(B_2 C_2)=arrow(A_2 D_2)=(0,2,1)$，且两直线不重合，故 $B_2 C_2 parallel A_2 D_2$。],
    ),
    subquestion(
      stem: [点 $P$ 在棱 $B B_1$ 上，若二面角 $P-A_2 C_2-D_2$ 为 $150 degree$，求 $B_2 P$。],
      answers: ([$1$],),
      explanation: [
        #step[作垂直于棱的向量][沿用上一问的坐标系，设 $P=(2,0,t)$，$0<=t<=4$。棱的方向向量为 $bold(e)=(2,2,2)$。
          从 $arrow(A_2 D_2)$、$arrow(A_2 P)$ 中减去各自在 $bold(e)$ 上的投影，得到
          $ bold(u)=(-1,1,0), quad bold(v)=((5-t)/3,-(t+1)/3,(2(t-2))/3). $
          两向量分别指向二面角两个半平面的内部，故其夹角就是所求二面角的平面角。]
        #step[求距离][由 $bold(u) dot bold(v)=-2$，$abs(bold(u))=sqrt(2)$，$abs(bold(v))^2=2/3((t-2)^2+3)$，得
          $ cos 150 degree=-sqrt(3)/sqrt((t-2)^2+3)=-sqrt(3)/2. $
          所以 $(t-2)^2=1$，$t=1$ 或 $t=3$，均在棱上。因此 $B_2 P=abs(t-2)=1$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=a("e"^x+a)-x$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性。],
      answers: (
        [当 $a<=0$ 时，在 $RR$ 上单调递减；当 $a>0$ 时，在 $(-infinity,-ln a)$ 上单调递减，在 $(-ln a,+infinity)$ 上单调递增。],
      ),
      explanation: [定义域为 $RR$，$f'(x)=a "e"^x-1$。
        若 $a<=0$，则 $f'(x)<0$ 恒成立。
        若 $a>0$，则 $f'(x)<0$ 等价于 $x< -ln a$，$f'(x)>0$ 等价于 $x>-ln a$，由此得到所述单调区间。],
    ),
    subquestion(
      stem: [证明：当 $a>0$ 时，$f(x)>2ln a+3/2$。],
      answers: ([证明见解析。],),
      explanation: [由上一问，$f(x)>=f(-ln a)=1+a^2+ln a$。
        设 $g(a)=a^2-ln a$，则 $g'(a)=2a-1/a$，所以 $g$ 在 $(0,1/sqrt(2))$ 上递减，在 $(1/sqrt(2),+infinity)$ 上递增，故
        $ a^2-ln a>=g(1/sqrt(2))=(1+ln 2)/2>1/2. $
        因此 $f(x)>=2ln a+1+(a^2-ln a)>2ln a+3/2$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设等差数列 $a_n$ 的公差为 $d$，且 $d>1$。令 $b_n=(n^2+n)/a_n$，记 $S_n,T_n$ 分别为数列 $a_n,b_n$ 的前 $n$ 项和。],
  parts: (
    subquestion(
      stem: [若 $3a_2=3a_1+a_3$，$S_3+T_3=21$，求 $a_n$ 的通项公式。],
      answers: ([$a_n=3n$],),
      explanation: [由 $3(a_1+d)=3a_1+(a_1+2d)$，得 $a_1=d$，故 $a_n=d n$，$b_n=(n+1)/d$。
        因此 $6d+9/d=21$，即 $(2d-1)(d-3)=0$。由 $d>1$，得 $d=3$，故 $a_n=3n$。],
    ),
    subquestion(
      stem: [若 $b_n$ 为等差数列，且 $S_99-T_99=99$，求 $d$。],
      answers: ([$51/50$],),
      explanation: [
        #step[利用等差条件][设 $a_n=d n+c$，$b_n=e n+f$，则 $n^2+n=(d n+c)(e n+f)$ 对所有正整数 $n$ 成立。比较系数得
          $ d e=1, quad d f+c e=1, quad c f=0. $]
        #step[分情况求公差][若 $c=0$，则 $e=f=1/d$，从而 $a_n=d n$，$b_n=(n+1)/d$。
          由 $S_99-T_99=99$，得 $4950d-5049/d=99$，即
          $ 50d^2-d-51=(50d-51)(d+1)=0. $
          因 $d>1$，得 $d=51/50$。
          若 $f=0$，则 $c=d$，$e=1/d$，故 $a_n=d(n+1)$，$b_n=n/d$。
          此时 $5049d-4950/d=99$，即 $(51d+50)(d-1)=0$，两根均不满足 $d>1$。
          综上，$d=51/50$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [甲、乙两人投篮，每次由其中一人投篮，规则如下：若命中则此人继续投篮，若未命中则换另一人投篮。无论之前投篮情况如何，甲每次投篮命中的概率均为 $0.6$，乙每次投篮命中的概率均为 $0.8$。由抽签确定第一次投篮的人，第一次投篮的人是甲、乙的概率各为 $0.5$。],
  parts: (
    subquestion(
      stem: [求第 $2$ 次投篮的人是乙的概率。],
      answers: ([$0.6$],),
      explanation: [第 $2$ 次由乙投篮对应“甲先投且未中”或“乙先投且命中”，故概率为 $0.5 times 0.4+0.5 times 0.8=0.6$。],
    ),
    subquestion(
      stem: [求第 $i$ 次投篮的人是甲的概率。],
      answers: ([$1/3+1/6(2/5)^(i-1)$],),
      explanation: [记所求概率为 $p_i$，则 $p_1=1/2$，且
        $ p_(i+1)=0.6p_i+0.2(1-p_i)=2/5 p_i+1/5. $
        因此 $p_(i+1)-1/3=2/5(p_i-1/3)$，故 $p_i=1/3+1/6(2/5)^(i-1)$。],
    ),
    subquestion(
      stem: [已知：若随机变量 $X_i$ 只取 $0$ 和 $1$，且 $P(X_i=1)=q_i$，$P(X_i=0)=1-q_i$（$i=1,2,dots.c,n$），则 $E(X_1+X_2+dots.c+X_n)=q_1+q_2+dots.c+q_n$。记前 $n$ 次（即从第 $1$ 次到第 $n$ 次）投篮中甲投篮的次数为 $Y$，求 $E(Y)$。],
      answers: ([$n/3+5/18(1-(2/5)^n)$],),
      explanation: [令 $X_i$ 表示第 $i$ 次是否由甲投篮：由甲投取 $1$，否则取 $0$。则 $Y=sum_(i=1)^n X_i$，且 $P(X_i=1)=p_i$。由所给结论与等比数列求和公式，
        $
          E(Y)=sum_(i=1)^n p_i=n/3+1/6 dot (1-(2/5)^n)/(1-2/5)=n/3+5/18(1-(2/5)^n).
        $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知点 $P$ 到 $x$ 轴的距离等于点 $P$ 到点 $(0,1/2)$ 的距离，记动点 $P$ 的轨迹为 $W$。],
  parts: (
    subquestion(
      stem: [求 $W$ 的方程。],
      answers: ([$y=x^2+1/4$],),
      explanation: [设 $P=(x,y)$，则 $abs(y)=sqrt(x^2+(y-1/2)^2)$，平方并整理得 $y=x^2+1/4$。
        反之，方程上的点满足上述距离关系，故这就是轨迹方程。],
    ),
    subquestion(
      stem: [若矩形 $A B C D$ 有三个顶点在 $W$ 上，证明：矩形 $A B C D$ 的周长大于 $3sqrt(3)$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[用相邻两边的斜率表示长度][不妨设 $A,B,C$ 在 $W$ 上，横坐标分别为 $a,b,c$。三个横坐标两两不同，故 $A B,B C$ 的斜率分别为 $a+b,b+c$。
          由 $A B perp B C$，得 $(a+b)(b+c)=-1$。必要时交换 $A,C$ 并将图形关于 $y$ 轴反射，可设 $a+b=k>=1$，$b+c=-1/k$。
          令 $u=a-b$，$v=c-b$，则 $u-v=k+1/k$，且
          $ A B=abs(u)sqrt(1+k^2), quad B C=abs(v)sqrt(1+1/k^2). $]
        #step[证明周长下界][若 $k=1$，则 $A B+B C=sqrt(2)(abs(u)+abs(v))>=2sqrt(2)>(3sqrt(3))/2$。
          若 $k>1$，由于 $u!=0$，有
          $
            A B+B C > sqrt(1+1/k^2)(abs(u)+abs(v)) >= sqrt(1+1/k^2)(k+1/k) = (k^2+1)^(3/2)/k^2.
          $
          令 $t=k^2$，由
          $ 4(t+1)^3-27t^2=(t-2)^2(4t+1)>=0, $
          得 $(t+1)^(3/2)/t>=(3sqrt(3))/2$。所以两种情况下均有 $2(A B+B C)>3sqrt(3)$，即结论成立。]
      ],
    ),
  ),
)
