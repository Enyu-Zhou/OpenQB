#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2024,
  type: "普通高等学校招生全国统一考试",
  name: "全国甲卷（理科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2024/2024全国理(西藏,四川,内蒙古,陕西,青海,宁夏).pdf",
  regions: ("西藏", "四川", "内蒙古", "陕西", "青海", "宁夏"),
)

#let graph-option(kind) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: $O$,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (4.7, 3.1),
    axis-style: "school-book",
    x-min: -3.5,
    x-max: 3.5,
    y-min: -4.3,
    y-max: 4.3,
    x-label: move(dx: 8pt)[$x$],
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (
      (-2.8, move(dx: -9pt)[$-2.8$]),
      (1, move(dy: 5pt)[$1$]),
      (2.8, move(dx: 9pt)[$2.8$]),
    ),
    y-ticks: (1,),
    {
      let f(x) = if kind == "A" or kind == "C" {
        (if kind == "A" { 1 } else { -1 }) * x * x * x * (x * x - 6.76) / 8
      } else {
        (
          (if kind == "B" { 1 } else { -1 })
            * (-x * x + (calc.exp(x) - calc.exp(-x)) * calc.sin(x * 1rad))
        )
      }
      plot.add(f, domain: (-2.8, 2.8), samples: 160, style: (
        stroke: figure-style.thickness,
      ))
    },
  )
})
#let solid-figure() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  let a = (-2, 0, 0)
  let b = (-1, calc.sqrt(3), 0)
  let c = (1, calc.sqrt(3), 0)
  let d = (2, 0, 0)
  let e = (1, 0, 3)
  let f = (-1, 0, 3)
  let m = (0, 0, 0)
  oblique-project((1, 0), (-0.35, -0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, d, e, f, a)
    line(f, b, e, c)
    line(a, d, stroke: (dash: figure-style.dash))
    line(f, m, e, stroke: (dash: figure-style.dash))
    line(b, m, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (e, $E$, "south-west"),
      (f, $F$, "south-east"),
      (m, $M$, "north-west"),
    ) { content(point, label, anchor: anchor, padding: 0.12) }
  })
})

#section[选择题：本题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [若 $z=5+i$，则 $i(overline(z)+z)=$#choice-placeholder()。],
  choices: ([$10i$], [$2i$], [$10$], [$2$]),
  answers: ([A],),
  explanation: [$overline(z)+z=(5-i)+(5+i)=10$，故 $i(overline(z)+z)=10i$，选 A。],
)
#question(
  "single-choice",
  stem: [已知集合 $A={1,2,3,4,5,9}$，$B={x | sqrt(x) in A}$，则 $complement_A (A inter B)=$#choice-placeholder()。],
  choices: ([${1,4,9}$], [${3,4,9}$], [${1,2,3}$], [${2,3,5}$]),
  answers: ([D],),
  explanation: [$B={1,4,9,16,25,81}$，故 $A inter B={1,4,9}$，$complement_A (A inter B)={2,3,5}$，选 D。],
)
#question(
  "single-choice",
  stem: [若 $x,y$ 满足约束条件 $cases(4x-3y-3>=0, x-2y-2<=0, 2x+6y-9<=0)$，则 $z=x-5y$ 的最小值为#choice-placeholder()。],
  choices: ([$1/2$], [$0$], [$-5/2$], [$-7/2$]),
  answers: ([D],),
  explanation: [可行域为顶点分别为 $(0,-1)$、$(3,1/2)$、$(3/2,1)$ 的三角形。#linebreak()线性目标函数在顶点处取得最值，这三个顶点对应的 $z$ 值依次为 $5,1/2,-7/2$，故最小值为 $-7/2$，选 D。],
)
#question(
  "single-choice",
  stem: [记 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和。已知 $S_5=S_10$，$a_5=1$，则 $a_1=$#choice-placeholder()。],
  choices: ([$7/2$], [$7/3$], [$-1/3$], [$-7/11$]),
  answers: ([B],),
  explanation: [设公差为 $d$。由 $S_10-S_5=a_6+dots.c+a_10=5a_8=0$，得 $a_8=0$。#linebreak()故 $3d=a_8-a_5=-1$，$a_1=a_5-4d=7/3$，选 B。],
)
#question(
  "single-choice",
  stem: [已知双曲线的两个焦点分别为 $(0,4)$、$(0,-4)$，点 $(-6,4)$ 在该双曲线上，则该双曲线的离心率为#choice-placeholder()。],
  choices: ([$4$], [$3$], [$2$], [$sqrt(2)$]),
  answers: ([C],),
  explanation: [点 $(-6,4)$ 到两焦点的距离分别为 $6$ 和 $10$，故 $2a=10-6=4$。#linebreak()又 $c=4$，所以离心率 $e=c/a=2$，选 C。],
)
#question(
  "single-choice",
  stem: [设函数 $f(x)=(e^x+2sin x)/(1+x^2)$，则曲线 $y=f(x)$ 在点 $(0,1)$ 处的切线与两坐标轴所围成的三角形的面积为#choice-placeholder()。],
  choices: ([$1/6$], [$1/3$], [$1/2$], [$2/3$]),
  answers: ([A],),
  explanation: [$f'(0)=3$，故切线方程为 $y=3x+1$，与两坐标轴的交点为 $(-1/3,0)$、$(0,1)$。#linebreak()所求面积为 $1/2 times 1/3 times 1=1/6$，选 A。],
)
#question(
  "single-choice",
  stem: [函数 $y=-x^2+(e^x-e^(-x))sin x$ 在区间 $[-2.8,2.8]$ 的图象大致为#choice-placeholder()。],
  choices: (
    [#figure(graph-option("A"))],
    [#figure(graph-option("B"))],
    [#figure(graph-option("C"))],
    [#figure(graph-option("D"))],
  ),
  answers: ([B],),
  explanation: [$e^x-e^(-x)$ 与 $sin x$ 都是奇函数，二者的乘积为偶函数，故所给函数为偶函数，排除 A、C。#linebreak()又 $f(1)=-1+(e-e^(-1))sin 1 approx 0.978>0$，而 D 的对应函数值为负，故选 B。],
)
#question(
  "single-choice",
  stem: [已知 $(cos alpha)/(cos alpha-sin alpha)=sqrt(3)$，则 $tan(alpha+pi/4)=$#choice-placeholder()。],
  choices: ([$2sqrt(3)+1$], [$2sqrt(3)-1$], [$sqrt(3)/2$], [$1-sqrt(3)$]),
  answers: ([B],),
  explanation: [由题意，$cos alpha!=0$，故 $1/(1-tan alpha)=sqrt(3)$，得 $tan alpha=1-1/sqrt(3)$。#linebreak()于是 $tan(alpha+pi/4)=(tan alpha+1)/(1-tan alpha)=2sqrt(3)-1$，选 B。],
)
#question(
  "single-choice",
  stem: [设向量 $bold(a)=(x+1,x)$，$bold(b)=(x,2)$，则#choice-placeholder()。],
  choices: (
    [$x=-3$ 是 $bold(a) perp bold(b)$ 的必要条件],
    [$x=1+sqrt(3)$ 是 $bold(a) parallel bold(b)$ 的必要条件],
    [$x=0$ 是 $bold(a) perp bold(b)$ 的充分条件],
    [$x=-1+sqrt(3)$ 是 $bold(a) parallel bold(b)$ 的充分条件],
  ),
  answers: ([C],),
  explanation: [$bold(a) perp bold(b) <=> x(x+1)+2x=0 <=> x=0$ 或 $x=-3$，故 A 错误、C 正确。#linebreak()$bold(a) parallel bold(b) <=> 2(x+1)-x^2=0 <=> x=1 plus.minus sqrt(3)$，故 B、D 均错误。选 C。],
)
#question(
  "single-choice",
  stem: [设 $alpha,beta$ 为两个平面，$m,n$ 为两条直线，且 $alpha inter beta=m$。下述四个命题：#linebreak()
    ① 若 $m parallel n$，则 $n parallel alpha$ 或 $n parallel beta$；#linebreak()
    ② 若 $m perp n$，则 $n perp alpha$ 或 $n perp beta$；#linebreak()
    ③ 若 $n parallel alpha$ 且 $n parallel beta$，则 $m parallel n$；#linebreak()
    ④ 若 $n$ 与 $alpha,beta$ 所成的角相等，则 $m perp n$。#linebreak()
    其中所有真命题的编号是#choice-placeholder()。],
  choices: ([①③], [②④], [①②③], [①③④]),
  answers: ([A],),
  explanation: [#step[命题①、③][若 $m parallel n$，则 $n$ 不可能同时包含于 $alpha,beta$，否则 $n=m$；又 $n$ 与任一平面相交时必包含于该平面，所以 $n$ 至少平行于其中一个平面，①正确。#linebreak()若 $n$ 同时平行于两个相交平面，其方向向量同时垂直于两平面的法向量，因而与交线 $m$ 平行，③正确。]
    #step[命题②、④][取 $alpha$ 为 $x O y$ 平面，$beta$ 为 $x O z$ 平面，则 $m$ 为 $x$ 轴。#linebreak()取 $n$ 过原点且方向向量为 $(0,1,1)$，则 $m perp n$，但 $n$ 不垂直于任一平面，②错误。#linebreak()取 $n$ 的方向向量为 $(1,1,1)$，它与两平面的夹角相等，却不垂直于 $m$，④错误。故选 A。]],
)
#question(
  "single-choice",
  stem: [记 $triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$。已知 $B=60 degree$，$b^2=9/4 a c$，则 $sin A+sin C=$#choice-placeholder()。],
  choices: ([$3/2$], [$sqrt(2)$], [$sqrt(7)/2$], [$sqrt(3)/2$]),
  answers: ([C],),
  explanation: [由余弦定理，$b^2=a^2+c^2-a c=9/4 a c$，故 $(a+c)^2=21/4 a c$。#linebreak()由正弦定理，$sin A+sin C=(a+c)/b sin B=sqrt(7/3) dot sqrt(3)/2=sqrt(7)/2$，选 C。],
)
#question(
  "single-choice",
  stem: [已知 $b$ 是 $a,c$ 的等差中项，直线 $a x+b y+c=0$ 与圆 $x^2+y^2+4y-1=0$ 交于 $A,B$ 两点，则 $abs(A B)$ 的最小值为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$4$], [$2sqrt(5)$]),
  answers: ([C],),
  explanation: [由 $c=2b-a$，直线方程化为 $a(x-1)+b(y+2)=0$，故直线恒过 $P(1,-2)$。#linebreak()圆心为 $O_1(0,-2)$，半径为 $sqrt(5)$。圆心到直线的距离 $d<=abs(O_1 P)=1$，所以 $abs(A B)=2sqrt(5-d^2)>=4$。#linebreak()当直线为 $x=1$ 时等号成立，故选 C。],
)

#section[填空题：本题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  stem: [$(1/3+x)^10$ 的展开式中，各项系数中的最大值为#fill-placeholder()。],
  answers: ([$5$],),
  explanation: [设 $x^k$ 的系数为 $c_k=binom(10, k)/3^(10-k)$，则 $c_(k+1)/c_k=3(10-k)/(k+1)$。#linebreak()当 $0<=k<=7$ 时比值大于 $1$，当 $8<=k<=9$ 时比值小于 $1$，故最大系数为 $c_8=binom(10, 8)/9=5$。],
)
#question(
  "fill-in",
  stem: [已知圆台甲、乙的上底面半径均为 $r_1$，下底面半径均为 $r_2$，圆台甲、乙的母线长分别为 $2(r_2-r_1)$、$3(r_2-r_1)$，则圆台甲与乙的体积之比为#fill-placeholder()。],
  answers: ([$sqrt(6)/4$],),
  explanation: [设 $d=r_2-r_1>0$，则两圆台的高分别为 $sqrt((2d)^2-d^2)=sqrt(3)d$、$sqrt((3d)^2-d^2)=2sqrt(2)d$。#linebreak()两圆台的上下底半径相同，由 $V=pi h/3 (r_1^2+r_1 r_2+r_2^2)$，体积之比等于高之比，即 $sqrt(3)/(2sqrt(2))=sqrt(6)/4$。],
)
#question(
  "fill-in",
  stem: [已知 $a>1$ 且 $frac(1, log_8 a)-frac(1, log_a 4)=-5/2$，则 $a=$#fill-placeholder()。],
  answers: ([$64$],),
  explanation: [设 $t=log_2 a>0$，则原式化为 $3/t-t/2=-5/2$，即 $(t-6)(t+1)=0$。#linebreak()故 $t=6$，$a=2^6=64$。],
)
#question(
  "fill-in",
  stem: [有 6 个相同的球，分别标有数字 $1,2,3,4,5,6$，从中无放回地随机取 3 次，每次取 1 个球。设 $m$ 为前两次取出的球上数字的平均值，$n$ 为取出的三个球上数字的平均值，则 $m$ 与 $n$ 之差的绝对值不大于 $1/2$ 的概率为#fill-placeholder()。],
  answers: ([$7/15$],),
  explanation: [设前两球的数字为 $a,b$，第三球的数字为 $c$，则 $abs(m-n)=abs(a+b-2c)/6$，故条件等价于 $abs(a+b-2c)<=3$。#linebreak()前两球不计顺序，所有等可能情形有 $6binom(5, 2)=60$ 种。
    #table(
      columns: 7,
      align: center,
      [$c$], [$1$], [$2$], [$3$], [$4$], [$5$], [$6$],
      [满足条件的数对个数], [$1$], [$5$], [$8$], [$8$], [$5$], [$1$],
    )
    故所求概率为 $(1+5+8+8+5+1)/60=7/15$。],
)

#section[解答题：共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17～21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [某工厂进行生产线智能化升级改造。升级改造后，从该工厂甲、乙两个车间的产品中随机抽取 150 件进行检验，数据如下：
    #table(
      columns: 5,
      align: center,
      [], [优级品], [合格品], [不合格品], [总计],
      [甲车间], [$26$], [$24$], [$0$], [$50$],
      [乙车间], [$70$], [$28$], [$2$], [$100$],
      [总计], [$96$], [$52$], [$2$], [$150$],
    )],
  parts: (
    subquestion(
      stem: [填写如下列联表：
        #table(
          columns: 3,
          align: center,
          [], [优级品], [非优级品],
          [甲车间], [], [],
          [乙车间], [], [],
        )
        能否有 $95%$ 的把握认为甲、乙两车间产品的优级品率存在差异？能否有 $99%$ 的把握认为甲、乙两车间产品的优级品率存在差异？],
      answers: ([列联表见解析；有 $95%$ 的把握，没有 $99%$ 的把握。],),
      explanation: [列联表为
        #table(
          columns: 3,
          align: center,
          [], [优级品], [非优级品],
          [甲车间], [$26$], [$24$],
          [乙车间], [$70$], [$30$],
        )
        $
          K^2=(150(26 times 30-24 times 70)^2)/(50 times 100 times 96 times 54)=4.6875.
        $
        因为 $3.841<4.6875<6.635$，所以有 $95%$ 的把握认为两车间的优级品率存在差异，但没有 $99%$ 的把握。],
    ),
    subquestion(
      stem: [已知升级改造前该工厂产品的优级品率 $p=0.5$。设 $overline(p)$ 为升级改造后抽取的 $n$ 件产品的优级品率，如果 $overline(p)>p+1.65sqrt((p(1-p))/n)$，则认为该工厂产品的优级品率提高了。根据抽取的 150 件产品的数据，能否认为生产线智能化升级改造后，该工厂产品的优级品率提高了？（$sqrt(150) approx 12.247$）#linebreak()
        附：$K^2=(n(a d-b c)^2)/((a+b)(c+d)(a+c)(b+d))$。
        #table(
          columns: 4,
          align: center,
          [$P(K^2>=k)$], [$0.050$], [$0.010$], [$0.001$],
          [$k$], [$3.841$], [$6.635$], [$10.828$],
        )],
      answers: ([能认为该工厂产品的优级品率提高了。],),
      explanation: [$overline(p)=96/150=0.64$，而 $p+1.65sqrt((p(1-p))/n)=0.5+0.825/sqrt(150) approx 0.5674<0.64$。#linebreak()因此按题中标准，能认为升级改造后该工厂产品的优级品率提高了。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [记 $S_n$ 为数列 ${a_n}$ 的前 $n$ 项和，已知 $4S_n=3a_n+4$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式；],
      answers: ([$a_n=4(-3)^(n-1)$。],),
      explanation: [当 $n=1$ 时，$4a_1=3a_1+4$，得 $a_1=4$。#linebreak()当 $n>=2$ 时，将 $4S_n=3a_n+4$ 与 $4S_(n-1)=3a_(n-1)+4$ 相减，得 $4a_n=3a_n-3a_(n-1)$，即 $a_n=-3a_(n-1)$。#linebreak()故 ${a_n}$ 是首项为 $4$、公比为 $-3$ 的等比数列，$a_n=4(-3)^(n-1)$。],
    ),
    subquestion(
      stem: [设 $b_n=(-1)^(n-1)n a_n$，求数列 ${b_n}$ 的前 $n$ 项和 $T_n$。],
      answers: ([$T_n=(2n-1)3^n+1$。],),
      explanation: [由第（1）问，$b_n=4n 3^(n-1)$。错位相减得
        $ T_n-3T_n=4(1+3+dots.c+3^(n-1))-4n 3^n=2(3^n-1)-4n 3^n. $
        故 $T_n=(2n-1)3^n+1$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在以 $A,B,C,D,E,F$ 为顶点的五面体中，四边形 $A B C D$ 与四边形 $A D E F$ 均为等腰梯形，$E F parallel A D$，$B C parallel A D$，$A D=4$，$A B=B C=E F=2$，$E D=sqrt(10)$，$F B=2sqrt(3)$，$M$ 为 $A D$ 的中点。
    #figure(solid-figure())],
  parts: (
    subquestion(
      stem: [证明：$B M parallel$ 平面 $C D E$；],
      answers: ([证明见解析。],),
      explanation: [∵ $B C parallel M D$ 且 $B C=M D=2$，∴ 四边形 $B C D M$ 为平行四边形，故 $B M parallel C D$。#linebreak()又 $C D subset$ 平面 $C D E$，$B M subset.not$ 平面 $C D E$，∴ $B M parallel$ 平面 $C D E$。],
    ),
    subquestion(
      stem: [求二面角 $F-B M-E$ 的正弦值。],
      answers: ([$4sqrt(3)/13$。],),
      explanation: [#step[建立坐标系][以 $M$ 为原点，$M D$ 方向为 $x$ 轴正方向，在平面 $A B C D$ 内取指向 $B C$ 一侧的垂线为 $y$ 轴，建立空间直角坐标系。#linebreak()由等腰梯形的边长，得 $A(-2,0,0)$、$D(2,0,0)$、$B(-1,sqrt(3),0)$、$C(1,sqrt(3),0)$。#linebreak()可设 $F(-1,u,v)$、$E(1,u,v)$，其中 $v>0$。由 $A F^2=10$ 和 $F B^2=12$，得 $u^2+v^2=9$、$(u-sqrt(3))^2+v^2=12$，所以 $u=0,v=3$。]
        #step[计算二面角][平面 $F B M$、$E B M$ 的法向量可分别取 $bold(n)_1=(3sqrt(3),3,sqrt(3))$、$bold(n)_2=(3sqrt(3),3,-sqrt(3))$。#linebreak()设所求二面角为 $theta$，则
          $
            abs(cos theta)=abs(bold(n)_1 dot bold(n)_2)/(abs(bold(n)_1) abs(bold(n)_2))=33/39=11/13.
          $
          故 $sin theta=sqrt(1-(11/13)^2)=4sqrt(3)/13$。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的右焦点为 $F$，点 $M(1,3/2)$ 在 $C$ 上，且 $M F perp x$ 轴。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程；],
      answers: ([$x^2/4+y^2/3=1$。],),
      explanation: [由 $M F perp x$ 轴，得 $F(1,0)$，故 $a^2-b^2=1$。#linebreak()将 $M$ 代入椭圆方程，得 $1/(b^2+1)+9/(4b^2)=1$，即 $4b^4-9b^2-9=0$。#linebreak()因 $b^2>0$，得 $b^2=3$、$a^2=4$，故 $C$ 的方程为 $x^2/4+y^2/3=1$。],
    ),
    subquestion(
      stem: [过点 $P(4,0)$ 的直线交 $C$ 于 $A,B$ 两点，$N$ 为线段 $F P$ 的中点，直线 $N B$ 交直线 $M F$ 于点 $Q$，证明：$A Q perp y$ 轴。],
      answers: ([证明见解析。],),
      explanation: [#step[联立直线与椭圆][∵ 直线 $x=4$ 与椭圆不相交，∴ 可设 $A B:y=k(x-4)$，$A(x_1,y_1)$、$B(x_2,y_2)$。#linebreak()联立椭圆方程，得 $(3+4k^2)x^2-32k^2x+64k^2-12=0$，故
          $ x_1+x_2=32k^2/(3+4k^2), quad x_1 x_2=(64k^2-12)/(3+4k^2). $
          于是 $2x_1 x_2-5(x_1+x_2)+8=0$。]
        #step[比较纵坐标][$N(5/2,0)$，且 $x_2<=2<5/2$，故直线 $N B$ 的斜率存在。令 $x=1$，得 $Q$ 的纵坐标为 $y_Q=-3y_2/(2x_2-5)$。#linebreak()又
          $ y_1(2x_2-5)+3y_2=k(2x_1 x_2-5(x_1+x_2)+8)=0, $
          所以 $y_Q=y_1$。若 $A=Q$，则 $A,B,P,N$ 共线，这条直线只能是 $x$ 轴，从而 $A=Q=(1,0)$，与 $A$ 在椭圆上矛盾。故 $A!=Q$。因此 $A Q perp y$ 轴。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=(1-a x)ln(1+x)-x$。],
  parts: (
    subquestion(
      stem: [若 $a=-2$，求 $f(x)$ 的极值；],
      answers: ([极小值为 $0$，无极大值。],),
      explanation: [定义域为 $(-1,+infinity)$。当 $a=-2$ 时，$f'(x)=2ln(1+x)+x/(1+x)$，且 $f''(x)=2/(1+x)+1/(1+x)^2>0$。#linebreak()故 $f'$ 严格递增，又 $f'(0)=0$，所以 $f$ 在 $(-1,0)$ 上递减，在 $(0,+infinity)$ 上递增。#linebreak()因此 $f$ 在 $x=0$ 处取得极小值 $f(0)=0$，无极大值。],
    ),
    subquestion(
      stem: [当 $x>=0$ 时，$f(x)>=0$，求 $a$ 的取值范围。],
      answers: ([$(-infinity,-1/2]$。],),
      explanation: [#step[求导][$f(0)=f'(0)=0$，且
          $ f'(x)=-a ln(1+x)-((a+1)x)/(1+x), quad f''(x)=(-a x-2a-1)/(1+x)^2. $]
        #step[必要性][若 $a>-1/2$，则 $f''(0)=-2a-1<0$。由连续性，在 $0$ 右侧的某个小区间内有 $f''(x)<0$，进而 $f'(x)<f'(0)=0$、$f(x)<f(0)=0$，与题意矛盾。故必须 $a<=-1/2$。]
        #step[充分性][若 $a<=-1/2$，则对一切 $x>=0$，有 $-a x-2a-1>=0$，从而 $f''(x)>=0$。#linebreak()所以 $f'(x)>=f'(0)=0$，$f(x)>=f(0)=0$，满足题意。综上，$a$ 的取值范围为 $(-infinity,-1/2]$。]],
    ),
  ),
)
#block(
  sticky: true,
)[请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。#linebreak()在直角坐标系 $x O y$ 中，以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，曲线 $C$ 的极坐标方程为 $rho=rho cos theta+1$。],
  parts: (
    subquestion(
      stem: [写出 $C$ 的直角坐标方程；],
      answers: ([$y^2=2x+1$。],),
      explanation: [由 $rho=x+1$，两边平方得 $x^2+y^2=(x+1)^2$，即 $y^2=2x+1$。#linebreak()反之，在此抛物线上 $x>=-1/2$，故 $x+1>0$，有 $sqrt(x^2+y^2)=x+1$，没有引入增解。因此所求方程为 $y^2=2x+1$。],
    ),
    subquestion(
      stem: [设直线 $l:cases(x=t, y=t+a)$（$t$ 为参数），若 $C$ 与 $l$ 相交于 $A,B$ 两点，且 $abs(A B)=2$，求 $a$。],
      answers: ([$a=3/4$。],),
      explanation: [将参数方程代入抛物线方程，得 $t^2+2(a-1)t+a^2-1=0$。#linebreak()设对应参数为 $t_1,t_2$，则 $(t_1-t_2)^2=8(1-a)$。#linebreak()由 $abs(A B)^2=2(t_1-t_2)^2=4$，得 $16(1-a)=4$，所以 $a=3/4$。此时判别式为 $2>0$，符合有两个交点的条件。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。#linebreak()已知实数 $a,b$ 满足 $a+b>=3$。],
  parts: (
    subquestion(
      stem: [证明：$2a^2+2b^2>a+b$；],
      answers: ([证明见解析。],),
      explanation: [由 $(a-b)^2>=0$，得 $2a^2+2b^2>=(a+b)^2$。#linebreak()又 $a+b>=3>1$，所以 $(a+b)^2>a+b$。因此 $2a^2+2b^2>a+b$。],
    ),
    subquestion(
      stem: [证明：$abs(a-2b^2)+abs(b-2a^2)>=6$。],
      answers: ([证明见解析。],),
      explanation: [由绝对值三角不等式及第（1）问，得
        $ abs(a-2b^2)+abs(b-2a^2)>=abs(a+b-2a^2-2b^2)=2a^2+2b^2-(a+b). $
        设 $s=a+b>=3$，则上式不小于 $s^2-s>=9-3=6$。#linebreak()故原不等式成立，且当 $a=b=3/2$ 时等号成立。],
    ),
  ),
)
