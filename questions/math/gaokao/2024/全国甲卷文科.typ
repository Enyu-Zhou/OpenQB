#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2024,
  type: "普通高等学校招生全国统一考试",
  name: "全国甲卷（文科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2024/2024全国文(西藏,四川,内蒙古,陕西,青海,宁夏).pdf",
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
    line(f, b)
    line(e, c)
    line(a, d, stroke: (dash: figure-style.dash))
    line(b, m, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (e, $E$, "south-west"),
      (f, $F$, "south-east"),
      (m, $M$, "south"),
    ) { content(point, label, anchor: anchor, padding: 0.12) }
  })
})



#section[选择题：本题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]

#question(
  "single-choice",
  stem: [若 $z=sqrt(2)"i"$，则 $z overline(z)=$#choice-placeholder()。],
  choices: ([$-2$], [$-sqrt(2)$], [$sqrt(2)$], [$2$]),
  answers: ([D],),
  explanation: [$z overline(z)=sqrt(2)"i" times (-sqrt(2)"i")=2$。],
)

#question(
  "single-choice",
  stem: [已知集合 $A={1,2,3,4,5,9}$，$B={x | x+1 in A}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${1,2,3}$], [${3,4,9}$], [${1,2,3,4}$], [${2,3,4,5}$]),
  answers: ([C],),
  explanation: [$B={0,1,2,3,4,8}$，故 $A inter B={1,2,3,4}$。],
)

#question(
  "single-choice",
  stem: [设向量 $arrow(a)=(x+1,x)$，$arrow(b)=(x,2)$，$arrow(c)=(1,1)$。若 $arrow(a)-2arrow(b)$ 与 $arrow(c)$ 共线，则 $x=$#choice-placeholder()。],
  choices: ([$5/2$], [$1/2$], [$-1/2$], [$-5/2$]),
  answers: ([A],),
  explanation: [$arrow(a)-2arrow(b)=(1-x,x-4)$。由共线条件，$1-x=x-4$，故 $x=5/2$。],
)

#question(
  "single-choice",
  stem: [某独唱比赛的决赛阶段共有甲、乙、丙、丁四人参加，每人出场一次，出场次序由随机抽签确定。则丙不是第一个出场，且甲或乙最后出场的概率是#choice-placeholder()。],
  choices: ([$1/6$], [$1/4$], [$1/3$], [$1/2$]),
  answers: ([C],),
  explanation: [四人的出场次序共有 $4!=24$ 种。末位选甲或乙有 $2$ 种选择，剩余三人的排列中排除丙在首位的 $2!$ 种，有 $3!-2!=4$ 种。
    故所求概率为 $(2 times 4)/24=1/3$。],
)

#question(
  "single-choice",
  stem: [记 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和。已知 $S_9=1$，则 $a_3+a_7=$#choice-placeholder()。],
  choices: ([$1/9$], [$2/9$], [$1/3$], [$2/3$]),
  answers: ([B],),
  explanation: [$S_9=9a_5=1$，而 $a_3+a_7=2a_5$，故所求值为 $2/9$。],
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
  stem: [直线 $2x-y-2=0$ 与圆 $x^2+y^2-6x-8y=0$ 交于 $A,B$ 两点，则 $abs(A B)=$#choice-placeholder()。],
  choices: ([$4$], [$5$], [$8$], [$10$]),
  answers: ([D],),
  explanation: [圆的方程为 $(x-3)^2+(y-4)^2=25$，圆心 $(3,4)$ 在所给直线上，因此弦 $A B$ 是直径，长为 $10$。],
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

#section[填空题：本题共 4 小题，每小题 5 分，共 20 分。]

#question(
  "fill-in",
  stem: [函数 $f(x)=sin x-sqrt(3)cos x$ 在区间 $[0,pi]$ 上的最大值为#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [$f(x)=2sin(x-pi/3)$。当 $x=(5pi)/6 in [0,pi]$ 时取得最大值 $2$。],
)

#question(
  "fill-in",
  stem: [已知圆台甲、乙的上底面半径均为 $r_1$，下底面半径均为 $r_2$，圆台甲、乙的母线长分别为 $2(r_2-r_1)$、$3(r_2-r_1)$，则圆台甲与乙的体积之比为#fill-placeholder()。],
  answers: ([$sqrt(6)/4$],),
  explanation: [设 $d=r_2-r_1>0$。两圆台的高分别为 $sqrt((2d)^2-d^2)=sqrt(3)d$、$sqrt((3d)^2-d^2)=2sqrt(2)d$。
    由圆台体积公式 $V=1/3 pi h(r_1^2+r_1 r_2+r_2^2)$，两者体积比等于高之比，即 $sqrt(3)/(2sqrt(2))=sqrt(6)/4$。],
)

#question(
  "fill-in",
  stem: [已知 $a>1$ 且 $1/(log_8 a)-1/(log_a 4)=-5/2$，则 $a=$#fill-placeholder()。],
  answers: ([$64$],),
  explanation: [设 $t=log_2 a>0$，则 $3/t-t/2=-5/2$，即 $t^2-5t-6=0$。
    由 $t>0$，得 $t=6$，故 $a=2^6=64$。],
)

#question(
  "fill-in",
  stem: [当 $x>0$ 时，曲线 $y=x^3-3x$ 与曲线 $y=-(x-1)^2+a$ 有两个交点，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$(-2,1)$],),
  explanation: [联立两曲线得 $a=g(x)=x^3+x^2-5x+1$，其中 $x>0$。
    $g'(x)=3x^2+2x-5=(3x+5)(x-1)$，故 $g$ 在 $(0,1)$ 上递减，在 $(1,+infinity)$ 上递增。
    又 $g(0)=1$，$g(1)=-2$，且 $g(x)$ 随 $x$ 趋向正无穷而趋向正无穷，因此恰有两个正数解的条件为 $-2<a<1$。],
)

#section[解答题：共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17～21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]

#question(
  "solution",
  score: 12,
  stem: [记 $S_n$ 为等比数列 ${a_n}$ 的前 $n$ 项和，已知 $2S_n=3a_(n+1)-3$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式；],
      answers: ([$a_n=(5/3)^(n-1)$。],),
      explanation: [将 $2S_(n+1)=3a_(n+2)-3$ 与 $2S_n=3a_(n+1)-3$ 相减，得 $2a_(n+1)=3a_(n+2)-3a_(n+1)$。
        因此公比为 $q=5/3$。再由 $2a_1=3a_2-3=5a_1-3$，得 $a_1=1$，故 $a_n=(5/3)^(n-1)$。],
    ),
    subquestion(
      stem: [求数列 ${S_n}$ 的前 $n$ 项和。],
      answers: ([$15/4((5/3)^n-1)-(3n)/2$。],),
      explanation: [等比数列求和得 $S_n=3/2((5/3)^n-1)$。故
        $
          sum_(k=1)^n S_k=3/2 sum_(k=1)^n (5/3)^k-(3n)/2=15/4((5/3)^n-1)-(3n)/2.
        $],
    ),
  ),
)

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
  stem: [如图，在以 $A,B,C,D,E,F$ 为顶点的五面体中，四边形 $A B C D$ 与四边形 $A D E F$ 均为等腰梯形，$E F parallel A D$，$B C parallel A D$，$A D=4$，$A B=B C=E F=2$，$E D=sqrt(10)$，$F B=2sqrt(3)$，$M$ 为 $A D$ 的中点。
    #figure(solid-figure())],
  parts: (
    subquestion(
      stem: [证明：$B M parallel$ 平面 $C D E$；],
      answers: ([证明见解析。],),
      explanation: [∵ $B C parallel M D$ 且 $B C=M D=2$，∴ 四边形 $B C D M$ 为平行四边形，故 $B M parallel C D$。#linebreak()又 $C D subset$ 平面 $C D E$，$B M subset.not$ 平面 $C D E$，∴ $B M parallel$ 平面 $C D E$。],
    ),
    subquestion(
      stem: [求 $M$ 到平面 $F A B$ 的距离。],
      answers: ([$6/sqrt(13)$。],),
      explanation: [
        #step[确定点的坐标][以 $M$ 为原点，$M D$ 为 $x$ 轴正方向，在平面 $A B C D$ 内取指向 $B C$ 一侧的垂线为 $y$ 轴，建立空间直角坐标系。
          由边长可得 $A=(-2,0,0)$，$B=(-1,sqrt(3),0)$，$D=(2,0,0)$。设 $F=(-1,u,v)$，$E=(1,u,v)$，其中 $v>0$。
          由 $A F^2=10$、$F B^2=12$，得 $u^2+v^2=9$、$(u-sqrt(3))^2+v^2=12$，所以 $u=0,v=3$。]
        #step[计算点到平面的距离][平面 $F A B$ 的法向量可取 $arrow(n)=(3sqrt(3),-3,-sqrt(3))$，其方程为 $3sqrt(3)(x+2)-3y-sqrt(3)z=0$。
          故 $M$ 到此平面的距离为 $abs(6sqrt(3))/sqrt(27+9+3)=6/sqrt(13)$。]
      ],
    ),
  ),
)

#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=a(x-1)-ln x+1$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性；],
      answers: (
        [当 $a<=0$ 时，在 $(0,+infinity)$ 上单调递减；当 $a>0$ 时，在 $(0,1/a)$ 上单调递减，在 $(1/a,+infinity)$ 上单调递增。],
      ),
      explanation: [定义域为 $(0,+infinity)$，$f'(x)=a-1/x$。
        若 $a<=0$，则 $f'(x)<0$，函数严格递减。
        若 $a>0$，则 $0<x<1/a$ 时导数为负，$x>1/a$ 时导数为正，故得所述单调区间。],
    ),
    subquestion(
      stem: [设 $a<=2$，证明：当 $x>1$ 时，$f(x)<e^(x-1)$。],
      answers: ([证明见解析。],),
      explanation: [∵ $a<=2$，$x>1$，∴ $f(x)<=2x-1-ln x$。
        令 $h(x)=e^(x-1)-2x+1+ln x$，则 $h(1)=h'(1)=0$，且
        $ h''(x)=e^(x-1)-1/x^2>0 quad (x>1). $
        所以 $h'(x)>0$，进而 $h(x)>0$。因此 $f(x)<=2x-1-ln x<e^(x-1)$。],
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
