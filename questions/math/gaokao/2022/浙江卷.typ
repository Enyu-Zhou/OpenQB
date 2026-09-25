#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校招生全国统一考试",
  name: "浙江卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2022/2022浙江.pdf",
  regions: ("浙江",),
)

#let three-views() = cetz.canvas(length: 5mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for dx in (0, 6.8) {
    scope({
      translate((dx, 0))
      line((-2, 0), (-1, 2), (-1, 4))
      line(
        ..range(0, 181, step: 3).map(i => (
          calc.cos(i * 1deg),
          4 + calc.sin(i * 1deg),
        )),
      )
      line((1, 4), (1, 2), (2, 0), (-2, 0))
      line((-1, 2), (1, 2))
      line((-1, 4), (1, 4))
      for (a, b, label) in ((-2, -1, $1$), (-1, 1, $2$), (1, 2, $1$)) {
        line((a, -0.1), (a, -0.7))
        content(((a + b) / 2, -0.45), label)
      }
      line((2, -0.1), (2, -0.7))
      content((0, -1.55), if dx == 0 { [正视图] } else { [侧视图] })
    })
  }
  for (a, b, label) in ((0, 2, $2$), (2, 4, $2$), (4, 5, $1$)) {
    line((2.45, a), (3.05, a))
    content((2.75, (a + b) / 2), label)
  }
  line((2.45, 5), (3.05, 5))
  circle((0, -4.6), radius: 2)
  circle((0, -4.6), radius: 1)
  content((0, -7.3), [俯视图])
})
#let prism-diagram() = cetz.canvas(length: 28mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (0.5, -calc.sqrt(3) / 2, 0)
  let c = (1, 0, 0)
  let a1 = (0, 0, 1)
  let b1 = (b.at(0), b.at(1), 1)
  let c1 = (1, 0, 1)
  let e = (0.75, -calc.sqrt(3) / 4, 0)
  let f = (0.25, 0, 1)
  oblique-project((1, 0), (-0.35, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, c, stroke: (dash: figure-style.dash))
    line(e, f, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "south-west"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south"),
      (e, $E$, "west"),
      (f, $F$, "south"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let folded-diagram() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  let s = calc.sqrt(3)
  let a = (5, s, 0)
  let b = (0, s, 0)
  let c = (0, -s, 0)
  let d = (3, -s, 0)
  let e = (1, 0, 3)
  let f = (0, 0, 3)
  let m = (3, s / 2, 1.5)
  let n = (0, 0, 0)
  oblique-project((-1, 0), (0.2, -0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, f, e, d, a)
    line(a, e)
    line(b, m)
    line(d, c, b, stroke: (dash: figure-style.dash))
    line(c, f, n, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "south-east"),
      (d, $D$, "east"),
      (e, $E$, "south-east"),
      (f, $F$, "south-west"),
      (m, $M$, "north"),
      (n, $N$, "west"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let ellipse-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.1,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
    shared-zero: $O$,
  ))
  plot.plot(
    size: (8.4, 4.2),
    axis-style: "school-book",
    x-min: -4,
    x-max: 6.5,
    y-min: -1.5,
    y-max: 3.75,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.annotate(resize: false, {
        let k = 0.12
        let v = k * k + 1 / 12
        let x1 = (-k - calc.sqrt(k * k + 3 * v)) / (2 * v)
        let x2 = (-k + calc.sqrt(k * k + 3 * v)) / (2 * v)
        let a = (x1, k * x1 + 0.5)
        let b = (x2, k * x2 + 0.5)
        let xc = 4 * x1 / ((2 * k + 1) * x1 - 1)
        let xd = 4 * x2 / ((2 * k + 1) * x2 - 1)
        let c = (xc, -xc / 2 + 3)
        let d = (xd, -xd / 2 + 3)
        line(
          ..range(0, 361, step: 3).map(i => (
            calc.sqrt(12) * calc.cos(i * 1deg),
            calc.sin(i * 1deg),
          )),
        )
        line(a, b)
        line(a, c)
        line((0, 1), d)
        line((-0.8, 3.4), (6.1, -0.05))
        for (p, label, anchor) in (
          (a, $A$, "south-east"),
          (b, $B$, "north-east"),
          ((0, 1), $P$, "south-east"),
          ((0.15, 0.5), $Q$, "north-west"),
          (c, $C$, "south"),
          (d, $D$, "south-west"),
        ) {
          content(p, label, anchor: anchor, padding: 2pt)
        }
      })
    },
  )
})

#section[选择题]
#question(
  "single-choice",
  stem: [设集合 $A={1,2}$，$B={2,4,6}$，则 $A union B=$#choice-placeholder()。],
  choices: ([${2}$], [${1,2}$], [${2,4,6}$], [${1,2,4,6}$]),
  answers: ([D],),
  explanation: [并集包含属于 $A$ 或属于 $B$ 的所有元素，故 $A union B={1,2,4,6}$。],
)
#question(
  "single-choice",
  stem: [已知 $a,b in RR$，$a+3"i"=(b+"i")"i"$（$"i"$ 为虚数单位），则#choice-placeholder()。],
  choices: ([$a=1,b=-3$], [$a=-1,b=3$], [$a=-1,b=-3$], [$a=1,b=3$]),
  answers: ([B],),
  explanation: [右边为 $-1+b"i"$，比较实部和虚部，得 $a=-1,b=3$。],
)
#question(
  "single-choice",
  stem: [若实数 $x,y$ 满足约束条件 $cases(x-2>=0, 2x+y-7<=0, x-y-2<=0)$，则 $z=3x+4y$ 的最大值是#choice-placeholder()。],
  choices: ([$20$], [$18$], [$13$], [$6$]),
  answers: ([B],),
  explanation: [∵ $y<=7-2x$ 且 $x>=2$，故 $z<=3x+4(7-2x)=28-5x<=18$。
    当 $x=2,y=3$ 时，全部约束均满足，且 $z=18$，故最大值为 $18$。],
)
#question(
  "single-choice",
  stem: [设 $x in RR$，则“$sin x=1$”是“$cos x=0$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [由 $sin^2 x+cos^2 x=1$，$sin x=1$ 可推出 $cos x=0$。反之，$cos x=0$ 时也可能有 $sin x=-1$，故为充分不必要条件。],
)
#question(
  "single-choice",
  stem: [某几何体的三视图如图所示（单位：$"cm"$），则该几何体的体积（单位：$"cm"^3$）是#choice-placeholder()。
    #figure(three-views())],
  choices: ([$22pi$], [$8pi$], [$22/3 pi$], [$16/3 pi$]),
  answers: ([C],),
  explanation: [该几何体由半球、圆柱和圆台组成。半球半径为 $1$；圆柱半径为 $1$、高为 $2$；圆台上、下底面半径分别为 $1,2$，高为 $2$。
    $
      V=1/2 dot 4/3 pi dot 1^3+pi dot 1^2 dot 2+1/3 pi dot 2(1^2+1 times 2+2^2)=22/3 pi.
    $],
)
#question(
  "single-choice",
  stem: [为了得到函数 $y=2sin 3x$ 的图像，只要把函数 $y=2sin(3x+pi/5)$ 图像上所有的点#choice-placeholder()。],
  choices: (
    [向左平移 $pi/5$ 个单位长度],
    [向右平移 $pi/5$ 个单位长度],
    [向左平移 $pi/15$ 个单位长度],
    [向右平移 $pi/15$ 个单位长度],
  ),
  answers: ([D],),
  explanation: [将原函数图像向右平移 $pi/15$ 个单位长度后，得到 $y=2sin(3(x-pi/15)+pi/5)=2sin 3x$。],
)
#question(
  "single-choice",
  stem: [已知 $2^a=5$，$log_8 3=b$，则 $4^(a-3b)=$#choice-placeholder()。],
  choices: ([$25$], [$5$], [$25/9$], [$5/3$]),
  answers: ([C],),
  explanation: [∵ $2^(3b)=8^b=3$，故 $4^(a-3b)=(2^a/2^(3b))^2=25/9$。],
)
#question(
  "single-choice",
  stem: [如图，已知正三棱柱 $A B C-A_1 B_1 C_1$，$A C=A A_1$，$E,F$ 分别是棱 $B C,A_1 C_1$ 上的点。记 $E F$ 与 $A A_1$ 所成的角为 $alpha$，$E F$ 与平面 $A B C$ 所成的角为 $beta$，二面角 $F-B C-A$ 的平面角为 $gamma$，则#choice-placeholder()。
    #figure(prism-diagram())],
  choices: (
    [$alpha<=beta<=gamma$],
    [$beta<=alpha<=gamma$],
    [$beta<=gamma<=alpha$],
    [$alpha<=gamma<=beta$],
  ),
  answers: ([A],),
  explanation: [设 $F$ 在底面上的射影为 $H$，则 $H$ 在 $A C$ 上，$F H=A A_1=A C$。底面等边三角形中任意两点的距离不超过边长，故 $E H<=F H$。
    若 $E H>0$，则 $tan alpha=(E H)/(F H)<=1$，且 $alpha+beta=pi/2$，所以 $alpha<=beta$。
    设 $H$ 到 $B C$ 的距离为 $h$，则 $h<=E H$。当 $h>0$ 时，$tan gamma=(F H)/h>=(F H)/(E H)=tan beta$，故 $beta<=gamma$；$h=0$ 时，$gamma=pi/2$，结论仍成立。
    若 $E H=0$，则 $alpha=0,beta=gamma=pi/2$，同样成立。],
)
#question(
  "single-choice",
  stem: [已知 $a,b in RR$，若对任意 $x in RR$，$a abs(x-b)+abs(x-4)-abs(2x-5)>=0$，则#choice-placeholder()。],
  choices: ([$a<=1,b>=3$], [$a<=1,b<=3$], [$a>=1,b>=3$], [$a>=1,b<=3$]),
  answers: ([D],),
  explanation: [令 $x arrow +infinity$，原不等式两边除以 $x$ 后取极限，得 $a+1-2>=0$，故 $a>=1$。
    取 $x=b$，得 $abs(b-4)>=abs(2b-5)$。平方并整理，得 $-3(b-1)(b-3)>=0$，故 $1<=b<=3$。因此 D 正确。],
)
#question(
  "single-choice",
  stem: [已知数列 $\{a_n\}$ 满足 $a_1=1$，$a_(n+1)=a_n-1/3 a_n^2(n in NN^*)$，则#choice-placeholder()。],
  choices: (
    [$2<100a_100<5/2$],
    [$5/2<100a_100<3$],
    [$3<100a_100<7/2$],
    [$7/2<100a_100<4$],
  ),
  answers: ([B],),
  explanation: [
    #step[估计上界][由递推式归纳可知，$0<a_(n+1)<a_n<=1$。记 $delta_n=1/a_(n+1)-1/a_n=1/(3-a_n)>1/3$。
      累加得 $1/a_n>1+(n-1)/3=(n+2)/3$（$n>=2$），故 $100a_100<300/102<3$。]
    #step[估计下界][由 $a_n<=1$，得 $delta_n<=1/2$。当 $n>=5$ 时，$a_n<3/(n+2)<=3/7$，故 $delta_n<7/18$。
      ∴ $1/a_100=1+sum_(n=1)^99 delta_n<1+4 times 1/2+95 times 7/18=719/18<40$。
      所以 $100a_100>5/2$，选 B。]
  ],
)

#section[填空题]
#question(
  "fill-in",
  stem: [我国南宋数学家秦九韶提出了从三角形三边求面积的“三斜求积”法。用公式表示为 $S=sqrt(1/4[c^2 a^2-((c^2+a^2-b^2)/2)^2])$，其中 $a,b,c$ 是三角形的三边，$S$ 是三角形的面积。设三角形的三边 $a=sqrt(2),b=sqrt(3),c=2$，则面积 $S=$#fill-placeholder()。],
  answers: ([$sqrt(23)/4$],),
  explanation: [代入公式，得 $S=sqrt(1/4[4 times 2-((4+2-3)/2)^2])=sqrt(23)/4$。],
)
#question(
  "fill-in",
  stem: [已知多项式 $(x+2)(x-1)^4=a_0+a_1 x+a_2 x^2+a_3 x^3+a_4 x^4+a_5 x^5$，则 $a_2=$#fill-placeholder()，$a_1+a_2+a_3+a_4+a_5=$#fill-placeholder()。],
  answers: ([$8$], [$-2$]),
  explanation: [$x^2$ 的系数为 $-C_4^1+2C_4^2=-4+12=8$。令 $x=0$，得 $a_0=2$；令 $x=1$，得 $sum_(k=0)^5 a_k=0$，故所求系数和为 $-2$。],
)
#question(
  "fill-in",
  stem: [若 $3sin alpha-sin beta=sqrt(10)$，$alpha+beta=pi/2$，则 $sin alpha=$#fill-placeholder()，$cos 2beta=$#fill-placeholder()。],
  answers: ([$3sqrt(10)/10$], [$4/5$]),
  explanation: [由 $sin beta=cos alpha$，得 $3sin alpha-cos alpha=sqrt(10)$。
    柯西不等式给出 $3sin alpha-cos alpha<=sqrt(10)sqrt(sin^2 alpha+cos^2 alpha)=sqrt(10)$，等号成立要求 $(sin alpha,cos alpha)=(3/sqrt(10),-1/sqrt(10))$。
    故 $sin alpha=3sqrt(10)/10$，$cos 2beta=2cos^2 beta-1=2sin^2 alpha-1=4/5$。],
)
#question(
  "fill-in",
  stem: [已知函数 $f(x)=cases(-x^2+2 & quad x<=1, x+1/x-1 & quad x>1)$，则 $f(f(1/2))=$#fill-placeholder()；若当 $x in [a,b]$ 时，$1<=f(x)<=3$，则 $b-a$ 的最大值是#fill-placeholder()。],
  answers: ([$37/28$], [$3+sqrt(3)$]),
  explanation: [$f(1/2)=7/4$，故 $f(f(1/2))=7/4+4/7-1=37/28$。
    当 $x<=1$ 时，$1<=2-x^2<=3$ 等价于 $-1<=x<=1$；当 $x>1$ 时，$1<=x+1/x-1<=3$ 等价于 $1<x<=2+sqrt(3)$。
    因此 $[a,b] subset.eq [-1,2+sqrt(3)]$，最大长度为 $3+sqrt(3)$。],
)
#question(
  "fill-in",
  stem: [现有 7 张卡片，分别写上数字 1、2、2、3、4、5、6。从这 7 张卡片中随机抽取 3 张，记所抽取卡片上数字的最小值为 $xi$，则 $P(xi=2)=$#fill-placeholder()，$E(xi)=$#fill-placeholder()。],
  answers: ([$16/35$], [$12/7$]),
  explanation: [共有 $C_7^3=35$ 种等可能的抽取方式。$xi=1,2,3,4$ 对应的方式数分别为 $C_6^2=15$、$C_6^3-C_4^3=16$、$C_3^2=3$、$1$。
    故 $P(xi=2)=16/35$，$E(xi)=(1 times 15+2 times 16+3 times 3+4 times 1)/35=12/7$。],
)
#question(
  "fill-in",
  stem: [已知双曲线 $x^2/a^2-y^2/b^2=1(a>0,b>0)$ 的左焦点为 $F$，过 $F$ 且斜率为 $b/(4a)$ 的直线交双曲线于点 $A(x_1,y_1)$，交双曲线的渐近线于点 $B(x_2,y_2)$，且 $x_1<0<x_2$。若 $abs(F B)=3abs(F A)$，则双曲线的离心率是#fill-placeholder()。],
  answers: ([$3sqrt(6)/4$],),
  explanation: [设 $c=sqrt(a^2+b^2)$，则 $F=(-c,0)$，直线为 $y=b/(4a)(x+c)$。由 $x_2>0$，$B$ 在渐近线 $y=b/a x$ 上，联立得 $B=(c/3,(b c)/(3a))$。
    根据距离比，$A$ 有两个候选位置：$(-5c/9,(b c)/(9a))$ 或 $(-13c/9,-(b c)/(9a))$。
    后者代入双曲线，得到 $c^2/a^2=81/168<1$，与 $c>a$ 矛盾。
    前者代入得 $(25c^2)/(81a^2)-(c^2)/(81a^2)=1$，故离心率 $e=c/a=sqrt(81/24)=3sqrt(6)/4$。],
)
#question(
  "fill-in",
  stem: [设点 $P$ 在单位圆的内接正八边形 $A_1 A_2 dots.c A_8$ 的边 $A_1 A_2$ 上，则 $arrow(P A_1)^2+arrow(P A_2)^2+dots.c+arrow(P A_8)^2$ 的取值范围是#fill-placeholder()。],
  answers: ([$[12+2sqrt(2),16]$],),
  explanation: [设圆心为 $O$，由正八边形的对称性，$sum_(i=1)^8 arrow(O A_i)=arrow(0)$，故
    $
      sum_(i=1)^8 arrow(P A_i)^2=sum_(i=1)^8 (arrow(O A_i)-arrow(O P))^2=8+8abs(O P)^2.
    $
    $P$ 在边上运动时，$cos(pi/8)<=abs(O P)<=1$。因此所求范围为 $[8+8cos^2(pi/8),16]=[12+2sqrt(2),16]$。],
)

#section[解答题]
#question(
  "solution",
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 所对的边分别为 $a,b,c$。已知 $4a=sqrt(5)c$，$cos C=3/5$。],
  parts: (
    subquestion(
      stem: [求 $sin A$ 的值。],
      answers: ([$sqrt(5)/5$],),
      explanation: [∵ $0<C<pi$，故 $sin C=4/5$。由正弦定理，$sin A=a/c sin C=sqrt(5)/4 times 4/5=sqrt(5)/5$。],
    ),
    subquestion(
      stem: [若 $b=11$，求 $triangle A B C$ 的面积。],
      answers: ([$22$],),
      explanation: [∵ $c^2=16a^2/5$，由余弦定理，$3/5=(a^2+121-16a^2/5)/(22a)$，整理得 $a^2+6a-55=0$。
        由 $a>0$，得 $a=5$。故面积 $S=1/2 a b sin C=1/2 times 5 times 11 times 4/5=22$。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，已知 $A B C D$ 和 $C D E F$ 都是直角梯形，$A B parallel D C$，$D C parallel E F$，$A B=5,D C=3,E F=1$，$angle B A D=angle C D E=60 degree$，二面角 $F-D C-B$ 的平面角为 $60 degree$。设 $M,N$ 分别为 $A E,B C$ 的中点。
    #figure(folded-diagram())],
  parts: (
    subquestion(
      stem: [证明：$F N perp A D$。],
      answers: ([证明见解析。],),
      explanation: [由两直角梯形的边长及角度，得 $B C=(5-3)tan 60 degree=2sqrt(3)$，$C F=(3-1)tan 60 degree=2sqrt(3)$。
        ∵ $D C perp B C$ 且 $D C perp C F$，故 $D C perp$ 平面 $B C F$，$angle B C F$ 即给定二面角的平面角，等于 $60 degree$。
        ∴ $triangle B C F$ 为等边三角形。$N$ 为 $B C$ 的中点，故 $F N perp B C$；又 $F N perp D C$，所以 $F N perp$ 平面 $A B C D$，从而 $F N perp A D$。],
    ),
    subquestion(
      stem: [求直线 $B M$ 与平面 $A D E$ 所成角的正弦值。],
      answers: ([$5sqrt(7)/14$],),
      explanation: [以 $N$ 为原点，平行于 $B A$ 的方向、$N B$ 的方向、$N F$ 的方向分别为 $x,y,z$ 轴正方向，建立空间直角坐标系。
        则 $A=(5,sqrt(3),0)$，$B=(0,sqrt(3),0)$，$D=(3,-sqrt(3),0)$，$E=(1,0,3)$，$M=(3,sqrt(3)/2,3/2)$。
        $arrow(A D)=(-2,-2sqrt(3),0)$，$arrow(D E)=(-2,sqrt(3),3)$，平面 $A D E$ 的一个法向量为 $arrow(n)=(sqrt(3),-1,sqrt(3))$。
        又 $arrow(B M)=(3,-sqrt(3)/2,3/2)$，故所求角 $theta$ 满足
        $
          sin theta=abs(arrow(n) dot arrow(B M))/(abs(arrow(n)) abs(arrow(B M)))=(5sqrt(3))/(sqrt(7) dot 2sqrt(3))=5sqrt(7)/14.
        $],
    ),
  ),
)
#question(
  "solution",
  stem: [已知等差数列 $\{a_n\}$ 的首项 $a_1=-1$，公差 $d>1$。记 $\{a_n\}$ 的前 $n$ 项和为 $S_n$（$n in NN^*$）。],
  parts: (
    subquestion(
      stem: [若 $S_4-2a_2 a_3+6=0$，求 $S_n$。],
      answers: ([$S_n=(3n^2-5n)/2$],),
      explanation: [由 $a_n=-1+(n-1)d$，得 $S_4=-4+6d$。代入条件，得 $-4+6d-2(d-1)(2d-1)+6=0$，即 $d(d-3)=0$。
        ∵ $d>1$，故 $d=3$，$a_n=3n-4$，$S_n=n(a_1+a_n)/2=(3n^2-5n)/2$。],
    ),
    subquestion(
      stem: [若对于每个 $n in NN^*$，存在实数 $c_n$，使 $a_n+c_n,a_(n+1)+4c_n,a_(n+2)+15c_n$ 成等比数列，求 $d$ 的取值范围。],
      answers: ([$(1,2]$],),
      explanation: [
        #step[由等比关系求必要条件][令 $A=a_n=(n-1)d-1$，$c=c_n$，则 $(A+d+4c)^2=(A+c)(A+2d+15c)$，整理得
          $ c^2+(6d-8A)c+d^2=0. $
          判别式为 $Delta=(14d-8n d+8)^2-4d^2=32[(n-2)d-1][(2n-3)d-2]$。
          取 $n=2$，由 $Delta>=0$ 得 $d<=2$，因此必须有 $1<d<=2$。]
        #step[验证存在非零的等比三项][设 $1<d<=2$。当 $n=1$ 时，上述两个因子均为负；$n=2$ 时两者乘积非负；$n>=3$ 时两者均为正，故每个 $n$ 的方程都有实根。
          当 $n=1,2$ 时，取较小根 $c=4A-3d-sqrt((4A-3d)^2-d^2)$。
          $n=1$ 时，$c< -4-3d$，所求三项均为负；$n=2$ 时，$c<=d-4$，三项依次不超过 $2d-5$、$6d-17$、$18d-61$，也均为负。
          当 $n>=3$ 时，$A>d>0$，方程两根的和 $8A-6d>0$、积 $d^2>0$，故两根均为正，任取一根，所求三项均为正。
          以上三项均非零，且中间一项的平方等于两端之积，确实构成等比数列。故 $d in (1,2]$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，已知椭圆 $x^2/12+y^2=1$。设 $A,B$ 是椭圆上异于 $P(0,1)$ 的两点，且点 $Q(0,1/2)$ 在线段 $A B$ 上，直线 $P A,P B$ 分别交直线 $y=-1/2 x+3$ 于 $C,D$ 两点。
    #figure(ellipse-diagram())],
  parts: (
    subquestion(
      stem: [求点 $P$ 到椭圆上点的距离的最大值。],
      answers: ([$12sqrt(11)/11$],),
      explanation: [设椭圆上的点为 $H(x,y)$，则 $x^2=12(1-y^2)$，$-1<=y<=1$。
        $ abs(P H)^2=x^2+(y-1)^2=13-11y^2-2y=144/11-11(y+1/11)^2<=144/11. $
        当 $y=-1/11$ 时等号成立，故所求最大值为 $12sqrt(11)/11$。],
    ),
    subquestion(
      stem: [求 $abs(C D)$ 的最小值。],
      answers: ([$6sqrt(5)/5$],),
      explanation: [
        #step[用弦的斜率表示交点][若 $A B$ 垂直于 $x$ 轴，则必包含顶点 $P$，与题意矛盾，故可设 $A B:y=k x+1/2$。
          令 $A=(x_1,y_1)$，$B=(x_2,y_2)$，联立椭圆方程，得 $(k^2+1/12)x^2+k x-3/4=0$，所以
          $ x_1+x_2=-(12k)/(12k^2+1), quad x_1 x_2=-9/(12k^2+1). $
          由 $P A:y=(y_1-1)/x_1 x+1$ 与目标直线联立，得 $x_C=(4x_1)/((2k+1)x_1-1)$；同理 $x_D=(4x_2)/((2k+1)x_2-1)$。]
        #step[化简长度并求最小值][由韦达定理，得
          $ abs(x_1-x_2)=(6sqrt(16k^2+1))/(12k^2+1), $
          $ [(2k+1)x_1-1][(2k+1)x_2-1]=-(8(3k+1))/(12k^2+1). $
          分母非零，故 $k!=-1/3$。因此
          $
            abs(C D)=sqrt(5)/2 abs(x_C-x_D)=(3sqrt(5))/2 dot sqrt(16k^2+1)/abs(3k+1).
          $
          由柯西不等式，$(3k+1)^2=((3/4) dot 4k+1)^2<=25/16(16k^2+1)$，所以 $abs(C D)>=6sqrt(5)/5$。
          当且仅当 $k=3/16$ 时等号成立，此时所有交点均满足题意，故最小值为 $6sqrt(5)/5$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [设函数 $f(x)=e/(2x)+ln x(x>0)$。（$e=2.71828 dots.c$ 是自然对数的底数）],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的单调区间。],
      answers: (
        [单调递减区间为 $(0,e/2)$，单调递增区间为 $(e/2,+infinity)$。],
      ),
      explanation: [$f'(x)=-e/(2x^2)+1/x=(2x-e)/(2x^2)$。在 $(0,e/2)$ 上，$f'(x)<0$；在 $(e/2,+infinity)$ 上，$f'(x)>0$。故所求区间如上。],
    ),
    subquestion(
      stem: [已知 $a,b in RR$，曲线 $y=f(x)$ 上不同的三点 $(x_1,f(x_1))$、$(x_2,f(x_2))$、$(x_3,f(x_3))$ 处的切线都经过点 $(a,b)$。证明：],
      parts: (
        subquestion(
          stem: [若 $a>e$，则 $0<b-f(a)<1/2(a/e-1)$。],
          answers: ([证明见解析。],),
          explanation: [
            #step[把切线条件转为三个零点][切点横坐标满足 $f'(x)(x-a)-f(x)+b=0$。记
              $
                g(x)=1-(a+e)/x+(e a)/(2x^2)-ln x+b, quad g'(x)=-((x-e)(x-a))/x^3.
              $
              当 $a>e$ 时，$g$ 在 $(0,e)$ 和 $(a,+infinity)$ 上递减，在 $(e,a)$ 上递增。由有三个不同零点，必有 $g(e)<0<g(a)$。]
            #step[利用极值位置估计纵坐标][代入得 $g(e)=b-1-a/(2e)<0$，$g(a)=b-f(a)>0$，故 $f(a)<b<1+a/(2e)$。
              由第（1）问，$a>e$ 时有 $f(a)>f(e)=3/2$，所以
              $ 0<b-f(a)<1+a/(2e)-3/2=1/2(a/e-1). $]
          ],
        ),
        subquestion(
          stem: [若 $0<a<e$，$x_1<x_2<x_3$，则 $2/e+(e-a)/(6e^2)<1/x_1+1/x_3<2/a-(e-a)/(6e^2)$。],
          answers: ([证明见解析。],),
          explanation: [
            #step[确定零点位置并作代换][沿用上问的 $g$。当 $0<a<e$ 时，$g$ 在 $(0,a)$、$(e,+infinity)$ 上递减，在 $(a,e)$ 上递增。三个不同零点必满足 $0<x_1<a<x_2<e<x_3$。
              令 $m=a/e in (0,1)$，$t_1=e/x_1$，$t_3=e/x_3$，$S=t_1+t_3$，$k=t_1/t_3$，则 $t_1>1/m$、$0<t_3<1$，故 $k>1/m>1$。
              将 $t=e/x$ 代入 $g(x)=0$，得 $m/2 t^2-(m+1)t+ln t+b=0$。分别代入 $t_1,t_3$ 后相减，再乘以 $S/(t_1-t_3)$，得
              $ m/2 S^2-(m+1)S+L=0, quad L=(k+1)/(k-1)ln k. $]
            #step[估计对数项][令 $r=(k-1)/(k+1) in (0,1)$。设 $H(r)=ln((1+r)/(1-r))-2r-2/3 r^3$，则 $H(0)=0$，$H'(r)=(2r^4)/(1-r^2)>0$，所以
              $ L=1/r ln((1+r)/(1-r))>2+2/3 r^2. $
              又 $r>(1-m)/(1+m)>(1-m)/2$，故
              $ L>2+(1-m)^2/6>2+((1-m)^2(12-m))/72=:T. $]
            #step[将二次式的符号转为所需范围][令 $u=2+(1-m)/6$，$v=2/m-(1-m)/6$，则 $u<v$，$u+v=2+2/m$，且 $m/2 u v=T$。
              利用第一步的等式，得 $m/2(S-u)(S-v)=T-L<0$，故 $u<S<v$。
              将 $S=e(1/x_1+1/x_3)$、$m=a/e$ 代回，并除以 $e$，即得
              $ 2/e+(e-a)/(6e^2)<1/x_1+1/x_3<2/a-(e-a)/(6e^2). $]
          ],
        ),
      ),
    ),
  ),
)
