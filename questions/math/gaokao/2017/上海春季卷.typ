#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校春季招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2017/2017春季上海.pdf",
  regions: ("上海",),
)

#let octagon() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let s = calc.sqrt(2)
  let points = (
    (0, 0),
    (2, 0),
    (2 + s, s),
    (2 + s, 2 + s),
    (2, 2 + 2 * s),
    (0, 2 + 2 * s),
    (-s, 2 + s),
    (-s, s),
  )
  line(..points, close: true)
  let P = (-0.55 * s, 2 + 1.45 * s)
  line(points.at(0), points.at(2), mark: (end: ">"))
  line(points.at(0), P, mark: (end: ">"))
  let anchors = (
    "north",
    "north",
    "west",
    "west",
    "south-west",
    "south-east",
    "east",
    "east",
  )
  for (i, p) in points.enumerate() {
    content(p, $A_#(i + 1)$, anchor: anchors.at(i), padding: 4pt)
  }
  content(P, $P$, anchor: "south-east", padding: 4pt)
})
#let cuboid() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (0, 0, 0)
  let B = (2, 0, 0)
  let C = (2, 2, 0)
  let D = (0, 2, 0)
  let A1 = (0, 0, 3)
  let B1 = (2, 0, 3)
  let C1 = (2, 2, 3)
  let D1 = (0, 2, 3)
  oblique-project((0.9, 0), (0.3, 0.3), (0, 0.9), {
    line(A, B, C, C1, D1, A1, A)
    line(A1, B1, C1)
    line(B, B1)
    line(A1, B)
    line(A, D, C, stroke: (dash: figure-style.dash))
    line(D, D1, stroke: (dash: figure-style.dash))
    line(D, A1, C, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (A, $A$, "north-east"),
      (B, $B$, "north"),
      (C, $C$, "west"),
      (D, $D$, "south-west"),
      (A1, $A_1$, "east"),
      (B1, $B_1$, "north-west"),
      (C1, $C_1$, "south-west"),
      (D1, $D_1$, "south-east"),
    ) {
      content(p, label, anchor: anchor, padding: 4pt)
    }
  })
})
#let paths-diagram(auxiliary: false) = cetz.canvas(length: 11mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (0, 0)
  let B = (3, 0)
  let C = (0, 3)
  let D = (1.8, 2.4)
  let O1 = (3, 1.5)
  let O2 = (1, 3)
  line(B, A, C)
  line(A, D)
  circle(O1, radius: 1.5)
  circle(O2, radius: 1)
  for p in (O1, O2) { circle(p, radius: 0.035, fill: black, stroke: none) }
  if auxiliary {
    line(B, O1, D, stroke: (dash: figure-style.dash))
    line(C, O2, D, stroke: (dash: figure-style.dash))
    line(A, O1, stroke: (dash: figure-style.dash))
    content(O1, $O_1$, anchor: "west", padding: 4pt)
    content(O2, $O_2$, anchor: "south", padding: 4pt)
  }
  for (p, label, anchor) in (
    (A, $A$, "north-east"),
    (B, $B$, "north"),
    (C, $C$, "east"),
    ((2.02, 2.4), $D$, "west"),
    ((4.1, 2.55), $M_1$, "south-west"),
    ((1, 4), $M_2$, "south"),
  ) { content(p, label, anchor: anchor, padding: 4pt) }
})

#section[填空题：共 12 题，满分 54 分，第 1～6 题每题 4 分，第 7～12 题每题 5 分。]

#question(
  "fill-in",
  score: 4,
  stem: [设集合 $A={1,2,3}$，集合 $B={3,4}$，则 $A union B=$#fill-placeholder()。],
  answers: ([${1,2,3,4}$],),
  explanation: [将两集合的元素合并并去除重复元素，得 $A union B={1,2,3,4}$。],
)

#question(
  "fill-in",
  score: 4,
  stem: [不等式 $abs(x-1)<3$ 的解集为#fill-placeholder()。],
  answers: ([$(-2,4)$],),
  explanation: [由 $-3<x-1<3$，得 $-2<x<4$。],
)

#question(
  "fill-in",
  score: 4,
  stem: [若复数 $z$ 满足 $2 overline(z)-1=3+6 upright(i)$（$upright(i)$ 是虚数单位），则 $z=$#fill-placeholder()。],
  answers: ([$2-3 upright(i)$],),
  explanation: [由题意得 $overline(z)=2+3 upright(i)$，故 $z=2-3 upright(i)$。],
)

#question(
  "fill-in",
  score: 4,
  stem: [若 $cos alpha=1/3$，则 $sin(alpha-pi/2)=$#fill-placeholder()。],
  answers: ([$-1/3$],),
  explanation: [利用诱导公式，$sin(alpha-pi/2)=-cos alpha=-1/3$。],
)

#question(
  "fill-in",
  score: 4,
  stem: [若关于 $x$、$y$ 的方程组 $cases(x+2y=4, 3x+a y=6)$ 无解，则实数 $a=$#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [将第二个方程减去第一个方程的 $3$ 倍，得 $(a-6)y=-6$。当 $a !=6$ 时可唯一确定 $y$ 及 $x$；当 $a=6$ 时出现矛盾 $0=-6$。故 $a=6$。],
)

#question(
  "fill-in",
  score: 4,
  stem: [若等差数列 ${a_n}$ 的前 $5$ 项的和为 $25$，则 $a_1+a_5=$#fill-placeholder()。],
  answers: ([$10$],),
  explanation: [由等差数列求和公式，$5(a_1+a_5)/2=25$，故 $a_1+a_5=10$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [若 $P$、$Q$ 是圆 $x^2+y^2-2x+4y+4=0$ 上的动点，则 $abs(P Q)$ 的最大值为#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [圆的方程可化为 $(x-1)^2+(y+2)^2=1$，半径为 $1$。弦长不超过直径，当 $P$、$Q$ 为直径两端点时取到最大值 $2$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [已知数列 ${a_n}$ 的通项公式为 $a_n=3^n$，则 $lim_(n arrow infinity)(a_1+a_2+a_3+ dots.c+a_n)/a_n=$#fill-placeholder()。],
  answers: ([$3/2$],),
  explanation: [由等比数列求和公式，$(a_1+a_2+ dots.c+a_n)/a_n=(3(3^n-1))/(2 times 3^n)=3/2(1-3^(-n))$，故极限为 $3/2$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [若 $(x+2/x)^n$ 的二项展开式的各项系数之和为 $729$，则该展开式中常数项的值为#fill-placeholder()。],
  answers: ([$160$],),
  explanation: [令 $x=1$，得 $3^n=729$，故 $n=6$。展开式的通项为 $T_(r+1)=C_6^r 2^r x^(6-2r)$。常数项对应 $r=3$，其值为 $C_6^3 times 2^3=160$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设椭圆 $x^2/2+y^2=1$ 的左、右焦点分别为 $F_1$、$F_2$，点 $P$ 在该椭圆上，则使得 $triangle F_1 F_2 P$ 是等腰三角形的点 $P$ 的个数是#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [椭圆中 $a=sqrt(2)$、$c=1$，故 $abs(F_1 F_2)=2$。
    若 $abs(P F_1)=abs(P F_2)$，则 $P$ 是短轴的两个端点之一，共 $2$ 个。
    若 $abs(P F_1)=2$，由焦半径公式 $abs(P F_1)=sqrt(2)+x/sqrt(2)$，得 $x=2sqrt(2)-2 in (0,sqrt(2))$，对应上下对称的两个点。
    同理，$abs(P F_2)=2$ 也对应两个点，横坐标为 $2-2sqrt(2)$。
    上述三类互不重合且均构成非退化三角形，故共有 $6$ 个点。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设 $a_1$、$a_2$、$dots.c$、$a_6$ 为 $1$、$2$、$3$、$4$、$5$、$6$ 的一个排列，则满足 $abs(a_1-a_2)+abs(a_3-a_4)+abs(a_5-a_6)=3$ 的不同排列的个数为#fill-placeholder()。],
  answers: ([$48$],),
  explanation: [三个绝对值都是正整数，其和为 $3$，所以每一对数之差的绝对值均为 $1$。
    数字 $1$ 只能与 $2$ 配对，余下的 $3$ 只能与 $4$ 配对，最后是 $5$ 与 $6$ 配对。
    三对数的排列有 $3!$ 种，每对内部有 $2$ 种顺序，故共有 $3! times 2^3=48$ 种。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设 $a,b in RR$，若函数 $f(x)=x+a/x+b$ 在区间 $(1,2)$ 上有两个不同的零点，则 $f(1)$ 的取值范围为#fill-placeholder()。],
  answers: ([$(0,1)$],),
  explanation: [设两个零点为 $r,s$，则 $1<r<s<2$，且 $x f(x)=x^2+b x+a=(x-r)(x-s)$。
    因此 $f(1)=(r-1)(s-1) in (0,1)$。
    反之，对任意 $t in (0,1)$，取 $r=1+t^(2/3)$、$s=1+t^(1/3)$，则 $1<r<s<2$。令 $a=r s$、$b=-(r+s)$，便有 $f(1)=t$。
    故所求范围恰为 $(0,1)$。],
)

#section[选择题：共 4 题，每题 5 分，共 20 分。每题只有一个选项符合题意。]

#question(
  "single-choice",
  score: 5,
  stem: [函数 $f(x)=(x-1)^2$ 的单调递增区间是#choice-placeholder()。],
  choices: (
    [$[0,+infinity)$],
    [$[1,+infinity)$],
    [$(-infinity,0]$],
    [$(-infinity,1]$],
  ),
  answers: ([B],),
  explanation: [抛物线开口向上，对称轴为 $x=1$，故在 $[1,+infinity)$ 上单调递增。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $a in RR$，“$a>0$”是“$1/a>0$”的#choice-placeholder()条件。],
  choices: ([充分非必要], [必要非充分], [充要], [既非充分也非必要]),
  answers: ([C],),
  explanation: [若 $a>0$，则 $1/a>0$；若 $1/a>0$，则 $a>0$。因此两条件互为充分必要条件。],
)

#question(
  "single-choice",
  score: 5,
  stem: [过正方体中心的平面截正方体所得的截面中，不可能的图形是#choice-placeholder()。],
  choices: ([三角形], [长方形], [对角线不相等的菱形], [六边形]),
  answers: ([A],),
  explanation: [设正方体中心为 $O$。过 $O$ 的截平面关于 $O$ 中心对称，正方体也关于 $O$ 中心对称，所以截面必为中心对称图形。三角形不是中心对称图形，故不可能。
    其余三种均可出现：在正方体 $[-1,1]^3$ 中，平面 $x+y=0$ 截得长方形，平面 $z=(x+y)/2$ 截得两条对角线长分别为 $2sqrt(3)$、$2sqrt(2)$ 的菱形，平面 $x+y+z=0$ 截得六边形。],
)

#question(
  "single-choice",
  score: 5,
  stem: [如图所示，正八边形 $A_1 A_2 A_3 A_4 A_5 A_6 A_7 A_8$ 的边长为 $2$，若 $P$ 为该正八边形边上的动点，则 $arrow(A_1 A_3) dot arrow(A_1 P)$ 的取值范围为#choice-placeholder()。
    #figure(octagon())],
  choices: (
    [$[0,8+6sqrt(2)]$],
    [$[-2sqrt(2),8+6sqrt(2)]$],
    [$[-8-6sqrt(2),2sqrt(2)]$],
    [$[-8-6sqrt(2),8+6sqrt(2)]$],
  ),
  answers: ([B],),
  explanation: [以 $A_1$ 为原点，$A_1 A_2$ 为 $x$ 轴正向，正八边形内部在 $x$ 轴上方，建立平面直角坐标系。记 $s=sqrt(2)$，则 $arrow(A_1 A_3)=(2+s,s)$。
    当 $P=(x,y)$ 时，数量积为 $(2+s)x+s y$，在每条边上均为线性函数，故最值在顶点处取得。
    按 $A_1$ 至 $A_8$ 的顺序，各顶点对应的数量积依次为
    $ 0, 4+2s, 8+4s, 8+6s, 8+4s, 4+2s, 0, -2s. $
    所以最小值为 $-2sqrt(2)$，最大值为 $8+6sqrt(2)$。点 $P$ 沿边连续运动，能取遍两者之间的值，故选 B。],
)

#section[解答题：共 5 题，共 76 分。解答应写出必要的步骤。]
#question(
  "solution",
  score: 14,
  stem: [如图，长方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$A B=B C=2$，$A A_1=3$。
    #figure(cuboid())],
  parts: (
    subquestion(
      stem: [求四棱锥 $A_1-A B C D$ 的体积。],
      answers: ([$4$],),
      explanation: [底面积 $S_(A B C D)=2 times 2=4$，高为 $A A_1=3$，故体积 $V=1/3 times 4 times 3=4$。],
    ),
    subquestion(
      stem: [求异面直线 $A_1 C$ 与 $D D_1$ 所成角的大小。],
      answers: ([$arctan(2sqrt(2)/3)$],),
      explanation: [∵ $D D_1 parallel C C_1$，且 $angle A_1 C C_1$ 是锐角，所以它就是所求异面直线的夹角。
        在直角三角形 $A_1 C_1 C$ 中，$A_1 C_1=sqrt(2^2+2^2)=2sqrt(2)$，$C C_1=3$，故 $tan angle A_1 C C_1=2sqrt(2)/3$。
        所求角为 $arctan(2sqrt(2)/3)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设 $a in RR$，函数 $f(x)=(2^x+a)/(2^x+1)$。],
  parts: (
    subquestion(
      stem: [求 $a$ 的值，使得 $f(x)$ 为奇函数。],
      answers: ([$a=-1$],),
      explanation: [函数的定义域为 $RR$。若它为奇函数，则 $f(0)=(1+a)/2=0$，得 $a=-1$。
        当 $a=-1$ 时，$f(-x)=(2^(-x)-1)/(2^(-x)+1)=(1-2^x)/(1+2^x)=-f(x)$，确为奇函数。
        故 $a=-1$。],
    ),
    subquestion(
      stem: [若 $f(x)<(a+2)/2$ 对任意 $x in RR$ 成立，求 $a$ 的取值范围。],
      answers: ([$[0,2]$],),
      explanation: [令 $t=2^x>0$，原不等式等价于 $2(t+a)<(a+2)(t+1)$，即 $a t+2-a>0$ 对一切 $t>0$ 成立。
        若 $a<0$，取充分大的 $t$ 即不成立；若 $a>2$，取充分接近 $0$ 的正数 $t$ 也不成立。
        若 $0<=a<=2$，则 $a t>=0$、$2-a>=0$，且二者不同时为 $0$，所以不等式恒成立。
        故 $a in [0,2]$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [某景区欲建造两条圆形观景步道 $M_1$、$M_2$（宽度忽略不计），如图所示，已知 $A B perp A C$，$A B=A C=A D=60$（单位：米），要求圆 $M_1$ 与 $A B$、$A D$ 分别相切于点 $B$、$D$，圆 $M_2$ 与 $A C$、$A D$ 分别相切于点 $C$、$D$。
    #figure(paths-diagram())],
  parts: (
    subquestion(
      stem: [若 $angle B A D=60 degree$，求圆 $M_1$、$M_2$ 的半径（结果精确到 $0.1$ 米）。],
      answers: ([圆 $M_1$、$M_2$ 的半径分别约为 $34.6$ 米、$16.1$ 米。],),
      explanation: [设两圆的圆心为 $O_1$、$O_2$，半径分别为 $r_1$、$r_2$。圆心在相应角的平分线上，半径垂直于切线，故
        $
          r_1=60tan 30 degree=20sqrt(3) approx 34.6, quad r_2=60tan 15 degree=60(2-sqrt(3)) approx 16.1.
        $],
    ),
    subquestion(
      stem: [若观景步道 $M_1$ 与 $M_2$ 的造价分别为每米 $0.8$ 千元与每米 $0.9$ 千元，如何设计圆 $M_1$、$M_2$ 的大小，使总造价最低？最低总造价是多少？（结果精确到 $0.1$ 千元）],
      answers: (
        [两圆半径分别为 $30$ 米、$20$ 米时，总造价最低，约为 $263.9$ 千元。],
      ),
      explanation: [#step[用半角表示两圆半径][
          设 $angle B A D=2alpha$，其中 $0<alpha<pi/4$，则
          $ r_1=60tan alpha, quad r_2=60tan(pi/4-alpha). $
          令 $t=tan alpha in (0,1)$，由正切差角公式，得 $r_1=60t$、$r_2=60(1-t)/(1+t)$。
          #figure(paths-diagram(auxiliary: true))
        ]
        #step[按圆周长计算造价][
          总造价 $K$（单位：千元）为
          $
            K=0.8 times 2pi r_1+0.9 times 2pi r_2
            =12pi(8t+9(1-t)/(1+t)).
          $
          令 $u=1+t in (1,2)$，则
          $ K=12pi(8u+18/u-17)>=12pi(2sqrt(8u times 18/u)-17)=84pi. $
          当且仅当 $8u=18/u$，即 $u=3/2$、$t=1/2$ 时取等号。
          此时 $r_1=30$、$r_2=20$，最低总造价为 $84pi approx 263.9$ 千元。
        ]],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知双曲线 $Gamma:x^2-y^2/b^2=1$（$b>0$），直线 $l:y=k x+m$（$k m !=0$），$l$ 与 $Gamma$ 交于 $P$、$Q$ 两点，$P'$ 为 $P$ 关于 $y$ 轴的对称点，直线 $P' Q$ 与 $y$ 轴交于点 $N(0,n)$。],
  parts: (
    subquestion(
      stem: [若点 $(2,0)$ 是 $Gamma$ 的一个焦点，求 $Gamma$ 的渐近线方程。],
      answers: ([$y=plus.minus sqrt(3)x$],),
      explanation: [双曲线的实半轴长为 $1$，半焦距为 $2$，故 $b^2=2^2-1=3$。渐近线方程为 $y=plus.minus sqrt(3)x$。],
    ),
    subquestion(
      stem: [若 $b=1$，点 $P$ 的坐标为 $(-1,0)$，且 $arrow(N P')=3/2 arrow(P' Q)$，求 $k$ 的值。],
      answers: ([$k=plus.minus 1/2$],),
      explanation: [由 $P=(-1,0)$ 得 $P'=(1,0)$。设 $Q=(x_2,y_2)$，向量等式的横坐标给出 $1=3/2(x_2-1)$，故 $x_2=5/3$。
        将 $Q$ 代入 $x^2-y^2=1$，得 $y_2=plus.minus 4/3$。
        因此 $k=y_2/(x_2+1)=plus.minus 1/2$。这两个值均使直线与双曲线有题设的两个不同交点，并满足向量条件。],
    ),
    subquestion(
      stem: [若 $m=2$，求 $n$ 关于 $b$ 的表达式。],
      answers: ([$n=-b^2/2$],),
      explanation: [#step[求两个交点横坐标的和与积][
          设 $P=(x_1,y_1)$、$Q=(x_2,y_2)$。联立 $y=k x+2$ 与双曲线方程，得
          $ (b^2-k^2)x^2-4k x-(4+b^2)=0. $
          因为有两个不同交点，所以 $b^2-k^2 !=0$，由韦达定理，
          $ x_1+x_2=(4k)/(b^2-k^2), quad x_1 x_2=-(4+b^2)/(b^2-k^2). $
          又 $k !=0$，故 $x_1+x_2 !=0$，直线 $P' Q$ 不垂直于 $x$ 轴。
        ]
        #step[直接计算纵截距][
          $P'=(-x_1,y_1)$，所以 $P' Q$ 的纵截距为
          $
            n=(x_2 y_1+x_1 y_2)/(x_1+x_2)
            =(2k x_1 x_2+2(x_1+x_2))/(x_1+x_2)
            =2+2k (x_1 x_2)/(x_1+x_2)
            =2-(4+b^2)/2=-b^2/2.
          $
        ]],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知函数 $f(x)=log_2((1+x)/(1-x))$。],
  parts: (
    subquestion(
      stem: [解方程 $f(x)=1$。],
      answers: ([$x=1/3$],),
      explanation: [函数的定义域为 $(-1,1)$。由 $(1+x)/(1-x)=2$，解得 $x=1/3$，符合定义域。],
    ),
    subquestion(
      stem: [设 $x in (-1,1)$，$a in (1,+infinity)$，证明：$(a x-1)/(a-x) in (-1,1)$，且 $f((a x-1)/(a-x))-f(x)=-f(1/a)$。],
      answers: ([证明见解析。],),
      explanation: [令 $t=(a x-1)/(a-x)$。∵ $a-x>0$，且
        $ 1+t=((a-1)(1+x))/(a-x)>0, quad 1-t=((a+1)(1-x))/(a-x)>0, $
        ∴ $-1<t<1$。
        由上述两个等式相除，得
        $
          f(t)=log_2((a-1)/(a+1) dot (1+x)/(1-x))
          =f(x)-log_2((a+1)/(a-1))=f(x)-f(1/a).
        $
        因此所证等式成立。],
    ),
    subquestion(
      stem: [设数列 ${x_n}$ 中，$x_1 in (-1,1)$，$x_(n+1)=(-1)^(n+1)(3x_n-1)/(3-x_n)$，$n in NN^*$，求 $x_1$ 的取值范围，使得 $x_3>=x_n$ 对任意 $n in NN^*$ 成立。],
      answers: ([$(-1,1/3]$],),
      explanation: [#step[将递推关系转为四项循环][
          由第（2）问取 $a=3$，并结合取相反数仍在 $(-1,1)$ 内，归纳可知全部 $x_n in (-1,1)$。
          函数 $f$ 为奇函数，在 $(-1,1)$ 上严格递增，且 $f(1/3)=1$。
          令 $y_n=f(x_n)$，由第（2）问，得
          $ y_(n+1)=cases(y_n-1 quad &n "为奇数", 1-y_n quad &n "为偶数"). $
          设 $y_1=t$，则前五项为 $t,t-1,2-t,1-t,t$。递推式的奇偶规律每两步重复，所以 $y_(n+4)=y_n$。
        ]
        #step[比较四项并还原首项范围][
          由于 $f$ 严格递增，$x_3>=x_n$ 对一切正整数 $n$ 成立，等价于
          $ 2-t>=t, quad 2-t>=t-1, quad 2-t>=1-t. $
          即 $t<=1$，也就是 $f(x_1)<=f(1/3)$。
          结合 $x_1 in (-1,1)$，得 $x_1 in (-1,1/3]$。
        ]],
    ),
  ),
)
