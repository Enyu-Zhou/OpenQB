#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2024,
  type: "普通高等学校招生全国统一考试",
  name: "新课标一卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2024/2024新高考1(山东,广东,湖南,湖北,河北,江苏,福建,浙江,河南,江西,安徽).pdf",
  regions: (
    "山东",
    "广东",
    "湖南",
    "湖北",
    "河北",
    "江苏",
    "福建",
    "浙江",
    "河南",
    "江西",
    "安徽",
  ),
)

#let ribbon-figure() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.15,
    shared-zero: $O$,
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (5, 4),
    axis-style: "school-book",
    x-min: -1.1,
    x-max: 3.4,
    y-min: -2.2,
    y-max: 2.2,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      for sign in (-1, 1) {
        for domain in ((-1.05, 0), (0, 2 * calc.sqrt(2))) {
          plot.add(
            x => (
              sign * calc.abs(x) * calc.sqrt(calc.max(0, 8 - x * x)) / (x + 2)
            ),
            domain: domain,
            samples: 200,
            style: (stroke: figure-style.thickness),
          )
        }
      }
      plot.annotate(resize: false, {
        circle((2, 0), radius: 0.04, fill: black, stroke: none)
        content((2, 0), $F$, anchor: "north", padding: 0.12)
        content((-0.95, 1.4), $C$, anchor: "east", padding: 0.1)
      })
    },
  )
})
#let pyramid-figure() = cetz.canvas(length: 22mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let c = (2, 0, 0)
  let b = (1.5, -calc.sqrt(3) / 2, 0)
  let d = (0.5, calc.sqrt(3) / 2, 0)
  let p = (0, 0, 2)
  oblique-project((1, 0), (0.25, 0.6), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, a, b, c, p)
    line(p, b)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(a, c, stroke: (dash: figure-style.dash))
    line(p, d, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-west"),
      (p, $P$, "south"),
    ) {
      content(point, label, anchor: anchor, padding: 0.1)
    }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [已知集合 $A={x | -5<x^3<5}$，$B={-3,-1,0,2,3}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${-1,0}$], [${2,3}$], [${-3,-1,0}$], [${-1,0,2}$]),
  answers: ([A],),
  explanation: [$A=(-root(3, 5),root(3, 5))$，$B$ 中只有 $-1,0$ 属于 $A$，故选 A。],
)
#question(
  "single-choice",
  stem: [若 $z/(z-1)=1+i$，则 $z=$#choice-placeholder()。],
  choices: ([$-1-i$], [$-1+i$], [$1-i$], [$1+i$]),
  answers: ([C],),
  explanation: [由 $z=(1+i)(z-1)$，得 $i z=1+i$，故 $z=1-i$，选 C。],
)
#question(
  "single-choice",
  stem: [已知向量 $bold(a)=(0,1)$，$bold(b)=(2,x)$，若 $bold(b) perp (bold(b)-4bold(a))$，则 $x=$#choice-placeholder()。],
  choices: ([$-2$], [$-1$], [$1$], [$2$]),
  answers: ([D],),
  explanation: [$bold(b) dot (bold(b)-4bold(a))=4+x(x-4)=(x-2)^2=0$，故 $x=2$，选 D。],
)
#question(
  "single-choice",
  stem: [已知 $cos(alpha+beta)=m$，$tan alpha tan beta=2$，则 $cos(alpha-beta)=$#choice-placeholder()。],
  choices: ([$-3m$], [$-m/3$], [$m/3$], [$3m$]),
  answers: ([A],),
  explanation: [由 $sin alpha sin beta=2cos alpha cos beta$，得 $m=-cos alpha cos beta$，故 $cos(alpha-beta)=3cos alpha cos beta=-3m$，选 A。],
)
#question(
  "single-choice",
  stem: [已知圆柱和圆锥的底面半径相等，侧面积相等，且它们的高均为 $sqrt(3)$，则圆锥的体积为#choice-placeholder()。],
  choices: ([$2sqrt(3)pi$], [$3sqrt(3)pi$], [$6sqrt(3)pi$], [$9sqrt(3)pi$]),
  answers: ([B],),
  explanation: [设底面半径为 $r$，圆锥母线长为 $l$。由侧面积相等，得 $2pi r sqrt(3)=pi r l$，故 $l=2sqrt(3)$。#linebreak()∴ $r^2=l^2-3=9$，圆锥体积为 $1/3 pi r^2 sqrt(3)=3sqrt(3)pi$，选 B。],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x)=cases(-x^2-2a x-a & quad x<0, e^x+ln(x+1) & quad x>=0)$ 在 $RR$ 上单调递增，则 $a$ 的取值范围是#choice-placeholder()。],
  choices: ([$(-infinity,0]$], [$[-1,0]$], [$[-1,1]$], [$[0,+infinity)$]),
  answers: ([B],),
  explanation: [在 $x<0$ 时，$f'(x)=-2x-2a$，该段递增当且仅当 $a<=0$。#linebreak()在 $x>=0$ 时，$e^x+ln(x+1)$ 严格递增。两段衔接还须满足 $lim_(x->0^-) f(x)=-a<=f(0)=1$，即 $a>=-1$。#linebreak()∴ $a in [-1,0]$，选 B。],
)
#question(
  "single-choice",
  stem: [当 $x in [0,2pi]$ 时，曲线 $y=sin x$ 与 $y=2sin(3x-pi/6)$ 的交点个数为#choice-placeholder()。],
  choices: ([$3$], [$4$], [$6$], [$8$]),
  answers: ([C],),
  explanation: [记 $g(x)=2sin(3x-pi/6)-sin x$。若 $g(x)=0$，则 $abs(sin(3x-pi/6))<=1/2$，故 $x$ 必在六个区间 $I_k=[k pi/3,k pi/3+pi/9]$（$k=0,1,dots,5$）或为 $2pi$。#linebreak()在 $I_k$ 上，$abs(cos(3x-pi/6))>=sqrt(3)/2$，所以 $g'(x)=6cos(3x-pi/6)-cos x$ 的符号恒为 $(-1)^k$。#linebreak()各区间两端的 $g$ 值异号，故每个区间恰有一个零点；而 $g(2pi)=-1$。因此共有 6 个交点，选 C。],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x)$ 的定义域为 $RR$，$f(x)>f(x-1)+f(x-2)$，且当 $x<3$ 时 $f(x)=x$，则下列结论中一定正确的是#choice-placeholder()。],
  choices: ([$f(10)>100$], [$f(20)>1000$], [$f(10)<1000$], [$f(20)<10000$]),
  answers: ([B],),
  explanation: [由 $f(1)=1$、$f(2)=2$ 递推，得 $f(3)>3$，$f(4)>5$，依次可得
    $ f(10)>89, quad f(15)>987, quad f(16)>1597. $
    继续递推，$f(20)>10946>1000$，故 B 一定正确，选 B。],
)

#section[选择题：本题共 3 小题，每小题 6 分，共 18 分。在每小题给出的选项中，有多项符合题目要求。全部选对的得 6 分，部分选对的得部分分，有选错的得 0 分。]
#question(
  "multiple-choice",
  stem: [随着“一带一路”国际合作的深入，某茶叶种植区多措并举推动茶叶出口。为了解推动出口后的亩收入（单位：万元）情况，从该种植区抽取样本，得到推动出口后亩收入的样本均值 $overline(x)=2.1$，样本方差 $s^2=0.01$。已知该种植区以往的亩收入 $X$ 服从正态分布 $N(1.8,0.1^2)$，假设推动出口后的亩收入 $Y$ 服从正态分布 $N(overline(x),s^2)$，则#choice-placeholder()。（若随机变量 $Z$ 服从正态分布 $N(mu,sigma^2)$，则 $P(Z<mu+sigma) approx 0.8413$）],
  choices: ([$P(X>2)>0.2$], [$P(X>2)<0.5$], [$P(Y>2)>0.5$], [$P(Y>2)<0.8$]),
  answers: ([BC],),
  explanation: [$P(X>2)<P(X>1.9) approx 1-0.8413=0.1587<0.2$，故 A 错误、B 正确。#linebreak()由正态分布的对称性，$P(Y>2)=P(Y<2.2) approx 0.8413$，故 C 正确、D 错误，选 BC。],
)
#question(
  "multiple-choice",
  stem: [设函数 $f(x)=(x-1)^2(x-4)$，则#choice-placeholder()。],
  choices: (
    [$x=3$ 是 $f(x)$ 的极小值点],
    [当 $0<x<1$ 时，$f(x)<f(x^2)$],
    [当 $1<x<2$ 时，$-4<f(2x-1)<0$],
    [当 $-1<x<0$ 时，$f(2-x)>f(x)$],
  ),
  answers: ([ACD],),
  explanation: [
    #step[选项 A、B、C][$f'(x)=3(x-1)(x-3)$，故 $f$ 在 $(-infinity,1)$、$(3,+infinity)$ 上递增，在 $(1,3)$ 上递减。#linebreak()∴ $x=3$ 为极小值点，A 正确；当 $0<x<1$ 时，$x^2<x$，故 $f(x^2)<f(x)$，B 错误。#linebreak()当 $1<x<2$ 时，$1<2x-1<3$，所以 $f(3)=-4<f(2x-1)<f(1)=0$，C 正确。]
    #step[选项 D][$f(2-x)-f(x)=2(1-x)^3>0$（$-1<x<0$），故 D 正确。选 ACD。]
  ],
)
#question(
  "multiple-choice",
  stem: [设计一条美丽的丝带，其造型可以看作图中曲线 $C$ 的一部分。已知 $C$ 过坐标原点 $O$，且 $C$ 上的点满足：横坐标大于 $-2$；到点 $F(2,0)$ 的距离与到定直线 $x=a$（$a<0$）的距离之积为 $4$。则#choice-placeholder()。
    #figure(ribbon-figure())],
  choices: (
    [$a=-2$],
    [点 $(2sqrt(2),0)$ 在 $C$ 上],
    [$C$ 在第一象限的点的纵坐标的最大值为 $1$],
    [当点 $(x_0,y_0)$ 在 $C$ 上时，$y_0<=4/(x_0+2)$],
  ),
  answers: ([ABD],),
  explanation: [
    #step[求曲线方程][将 $O(0,0)$ 代入，得 $2abs(a)=4$，由 $a<0$ 得 $a=-2$，A 正确。#linebreak()曲线满足 $(x+2)sqrt((x-2)^2+y^2)=4$（$x>-2$），故
      $ y^2=16/(x+2)^2-(x-2)^2=(x^2(8-x^2))/(x+2)^2. $]
    #step[判断 B、C、D][点 $(2sqrt(2),0)$ 满足方程，B 正确。#linebreak()取 $x=3/2$，可得曲线上第一象限的点 $(3/2,3sqrt(23)/14)$，其纵坐标大于 $1$，C 错误。#linebreak()又 $y<=abs(y)<=sqrt((x-2)^2+y^2)=4/(x+2)$，D 正确。故选 ABD。]
  ],
)

#section[填空题：本题共 3 小题，每小题 5 分，共 15 分。]
#question(
  "fill-in",
  stem: [设双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的左、右焦点分别为 $F_1,F_2$，过 $F_2$ 作平行于 $y$ 轴的直线交 $C$ 于 $A,B$ 两点。若 $abs(F_1 A)=13$，$abs(A B)=10$，则 $C$ 的离心率为#fill-placeholder()。],
  answers: ([$3/2$],),
  explanation: [由对称性，$abs(F_2 A)=5$。根据双曲线定义，$2a=13-5=8$，故 $a=4$。#linebreak()又 $triangle F_1 F_2 A$ 为直角三角形，$4c^2+25=169$，故 $c=6$，离心率 $e=c/a=3/2$。],
)
#question(
  "fill-in",
  stem: [若曲线 $y=e^x+x$ 在点 $(0,1)$ 处的切线也是曲线 $y=ln(x+1)+a$ 的切线，则 $a=$#fill-placeholder()。],
  answers: ([$ln 2$],),
  explanation: [前一曲线在 $(0,1)$ 处的切线为 $y=2x+1$。设它与后一曲线切于横坐标为 $t$ 的点，则 $1/(t+1)=2$，故 $t=-1/2$。#linebreak()切点在直线上，其纵坐标为 $0$，故 $ln(1/2)+a=0$，得到 $a=ln 2$。],
)
#question(
  "fill-in",
  stem: [甲、乙两人各有四张卡片，每张卡片上标有一个数字，甲的卡片上分别标有数字 $1,3,5,7$，乙的卡片上分别标有数字 $2,4,6,8$。两人进行四轮比赛。在每轮比赛中，两人各自从自己持有的卡片中随机选一张，并比较所选卡片上数字的大小，数字大的人得 $1$ 分，数字小的人得 $0$ 分，然后各自弃置此轮所选的卡片（弃置的卡片在此后的轮次中不能使用）。则四轮比赛后，甲的总得分不小于 $2$ 的概率为#fill-placeholder()。],
  answers: ([$1/2$],),
  explanation: [可固定甲的出牌顺序为 $1,3,5,7$，乙的 $4!$ 种排列等可能。按乙与甲的 $1$ 配对的数字分类，在剩余的 $3!$ 种排列中，甲至少得 $2$ 分的种数如下：
    #table(
      columns: 5,
      align: center,
      [与 $1$ 配对的数字], [$2$], [$4$], [$6$], [$8$],
      [有利排列数], [$1$], [$2$], [$4$], [$5$],
    )
    所以所求概率为 $(1+2+4+5)/24=1/2$。],
)

#section[解答题：本题共 5 小题，共 77 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [记 $triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$。已知 $sin C=sqrt(2)cos B$，$a^2+b^2-c^2=sqrt(2)a b$。],
  parts: (
    subquestion(
      stem: [求 $B$；],
      answers: ([$pi/3$],),
      explanation: [由余弦定理，$cos C=(a^2+b^2-c^2)/(2a b)=sqrt(2)/2$，故 $C=pi/4$。#linebreak()由 $sin C=sqrt(2)cos B$，得 $cos B=1/2$，所以 $B=pi/3$。],
    ),
    subquestion(
      stem: [若 $triangle A B C$ 的面积为 $3+sqrt(3)$，求 $c$。],
      answers: ([$2sqrt(2)$],),
      explanation: [$A=pi-B-C=(5pi)/12$，$sin A=(sqrt(6)+sqrt(2))/4$。由正弦定理，
        $ S=1/2 a b sin C=(c^2 sin A sin B)/(2sin C). $
        代入 $S=3+sqrt(3)$，得 $c^2=8$，所以 $c=2sqrt(2)$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知 $A(0,3)$ 和 $P(3,3/2)$ 为椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）上两点。],
  parts: (
    subquestion(
      stem: [求 $C$ 的离心率；],
      answers: ([$1/2$],),
      explanation: [由 $A$ 在椭圆上，得 $b^2=9$。代入 $P$ 得 $9/a^2+1/4=1$，故 $a^2=12$，$c^2=a^2-b^2=3$，离心率为 $c/a=1/2$。],
    ),
    subquestion(
      stem: [若过 $P$ 的直线 $l$ 交 $C$ 于另一点 $B$，且 $triangle A B P$ 的面积为 $9$，求 $l$ 的方程。],
      answers: ([$y=x/2$ 或 $y=3x/2-3$。],),
      explanation: [设 $B(u,v)$。由面积条件，
        $ 1/2 abs(3(v-3)+3/2 u)=9, quad abs(u+2v-6)=12. $
        椭圆上有 $abs(u+2v)<=sqrt(12+36)=4sqrt(3)<18$，因此只能 $u+2v=-6$。#linebreak()与 $u^2/12+v^2/9=1$ 联立，得 $2v^2+9v+9=0$，故 $B=(-3,-3/2)$ 或 $(0,-3)$。#linebreak()分别连接 $P$ 与两点，得 $l:y=x/2$ 或 $l:y=3x/2-3$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，四棱锥 $P-A B C D$ 中，$P A perp$ 底面 $A B C D$，$P A=A C=2$，$B C=1$，$A B=sqrt(3)$。
    #figure(pyramid-figure())],
  parts: (
    subquestion(
      stem: [若 $A D perp P B$，证明：$A D parallel$ 平面 $P B C$；],
      answers: ([证明见解析。],),
      explanation: [∵ $P A perp$ 底面，∴ $P A perp A D$。又 $P A$ 与 $P B$ 相交，故 $A D perp$ 平面 $P A B$，从而 $A D perp A B$。#linebreak()由 $A B^2+B C^2=A C^2$，得 $A B perp B C$。底面内同垂直于 $A B$ 的两条直线平行，故 $A D parallel B C$。#linebreak()又 $B C subset$ 平面 $P B C$，$A D$ 不在该平面内，故 $A D parallel$ 平面 $P B C$。],
    ),
    subquestion(
      stem: [若 $A D perp D C$，且二面角 $A-C P-D$ 的正弦值为 $sqrt(42)/7$，求 $A D$。],
      answers: ([$sqrt(3)$],),
      explanation: [
        #step[建立坐标系][以 $A$ 为原点，$A C$ 为 $x$ 轴正方向，$A P$ 为 $z$ 轴正方向，在底面内建立直角坐标系。设 $D(s,t,0)$，则 $C(2,0,0)$、$P(0,0,2)$。#linebreak()由 $A D perp D C$，得 $s^2+t^2=2s$，即 $t^2=s(2-s)$。四边形不退化，故 $t!=0$、$0<s<2$。]
        #step[利用二面角][平面 $A C P$ 的法向量为 $(0,1,0)$；平面 $D C P$ 的法向量可取 $(t,2-s,t)$。#linebreak()二面角余弦的平方为 $1-42/49=1/7$，所以
          $ (2-s)^2/(2t^2+(2-s)^2)=(2-s)/(s+2)=1/7. $
          解得 $s=3/2$，故 $A D=sqrt(s^2+t^2)=sqrt(2s)=sqrt(3)$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 17,
  stem: [已知函数 $f(x)=ln(x/(2-x))+a x+b(x-1)^3$。],
  parts: (
    subquestion(
      stem: [若 $b=0$，且 $f'(x)>=0$，求 $a$ 的最小值；],
      answers: ([$-2$],),
      explanation: [定义域为 $(0,2)$。当 $b=0$ 时，$f'(x)=2/(x(2-x))+a$。#linebreak()∵ $0<x(2-x)<=1$，∴ $2/(x(2-x))>=2$，且 $x=1$ 时取等号。故 $f'(x)>=0$ 恒成立当且仅当 $a>=-2$，最小值为 $-2$。],
    ),
    subquestion(
      stem: [证明：曲线 $y=f(x)$ 是中心对称图形；],
      answers: ([对称中心为 $(1,a)$。],),
      explanation: [定义域 $(0,2)$ 关于 $1$ 对称，且
        $ f(2-x)=ln((2-x)/x)+a(2-x)-b(x-1)^3=2a-f(x). $
        所以曲线关于点 $(1,a)$ 中心对称。],
    ),
    subquestion(
      stem: [若 $f(x)>-2$ 当且仅当 $1<x<2$，求 $b$ 的取值范围。],
      answers: ([$[-2/3,+infinity)$],),
      explanation: [
        #step[确定 $a$][由连续性与题设，$f(1)=-2$，因此 $a=-2$。由上一问的对称性，只需保证 $f(1+t)+2>0$ 对 $0<t<1$ 恒成立。]
        #step[确定 $b$][记 $g(t)=f(1+t)+2=ln((1+t)/(1-t))-2t+b t^3$，则 $g(0)=0$，且
          $ g'(t)=t^2(2/(1-t^2)+3b). $
          若 $b>=-2/3$，则 $0<t<1$ 时 $g'(t)>0$，故 $g(t)>0$。#linebreak()若 $b< -2/3$，则 $2/(1-t^2)+3b$ 在 $t=0$ 附近为负，故足够小的正 $t$ 满足 $g(t)<0$，与题设矛盾。#linebreak()∴ $b in [-2/3,+infinity)$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 17,
  stem: [设 $m$ 为正整数，数列 $a_1,a_2,dots,a_(4m+2)$ 是公差不为 $0$ 的等差数列，若从中删去两项 $a_i$ 和 $a_j$（$i<j$）后剩余的 $4m$ 项可被平均分为 $m$ 组，且每组的 $4$ 个数都能构成等差数列，则称数列 $a_1,a_2,dots,a_(4m+2)$ 是 $(i,j)$-可分数列。],
  parts: (
    subquestion(
      stem: [写出所有的 $(i,j)$，$1<=i<j<=6$，使得数列 $a_1,a_2,dots,a_6$ 是 $(i,j)$-可分数列；],
      answers: ([$(1,2)$、$(1,6)$、$(5,6)$。],),
      explanation: [公差不为 $0$，四项构成等差数列等价于四个下标构成等差数列。#linebreak()在 $1,2,dots,6$ 中，四项等差数列的公差只能为 $1$，故保留的下标只能为 $(1,2,3,4)$、$(2,3,4,5)$、$(3,4,5,6)$。对应删去 $(5,6)$、$(1,6)$、$(1,2)$。],
    ),
    subquestion(
      stem: [当 $m>=3$ 时，证明：数列 $a_1,a_2,dots,a_(4m+2)$ 是 $(2,13)$-可分数列；],
      answers: ([证明见解析。],),
      explanation: [在前 $14$ 项中删去 $a_2,a_13$ 后，将余项按下标分为
        $ (1,4,7,10), quad (3,6,9,12), quad (5,8,11,14). $
        每组下标的公差均为 $3$，故对应的四项构成等差数列。#linebreak()其后 $15,16,dots,4m+2$ 共有 $4(m-3)$ 个下标，按连续四个一组即可，结论成立。],
    ),
    subquestion(
      stem: [从 $1,2,dots,4m+2$ 中一次任取两个数 $i$ 和 $j$（$i<j$），记数列 $a_1,a_2,dots,a_(4m+2)$ 是 $(i,j)$-可分数列的概率为 $P_m$，证明：$P_m>1/8$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[第一类可行删法][取 $i=4r+1$、$j=4s+2$，其中 $0<=r<=s<=m$。删去这两项后，之前、中间、之后的连续下标段长度分别为 $4r$、$4(s-r)$、$4(m-s)$，均可按连续四个分组。#linebreak()这类删法共有 $(m+1)(m+2)/2$ 种。]
        #step[第二类可行删法][取 $i=4r+2$、$j=4s+1$，其中 $0<=r$、$r+2<=s<=m$，记 $k=s-r>=2$。#linebreak()区间 $4r+1,dots,4s+2$ 外的下标可按连续四个分组。区间内统一减去 $4r$ 后，需将 $1,dots,4k+2$ 中除 $2,4k+1$ 外的数分组。可取
          $ (1,k+1,2k+1,3k+1), quad (k+2,2k+2,3k+2,4k+2), $
          以及 $(h,k+h,2k+h,3k+h)$（$h=3,dots,k$，$k=2$ 时无此部分）。#linebreak()各组分别覆盖模 $k$ 的各个剩余类，恰好覆盖所有未删下标，且每组公差为 $k$。这类删法共有 $m(m-1)/2$ 种。]
        #step[计算概率下界][两类删法互不相同，故可行删法至少有 $m^2+m+1$ 种。因此
          $ P_m >= (m^2+m+1)/binom(4m+2, 2)=(m^2+m+1)/((2m+1)(4m+1))>1/8. $
          最后一步由 $8(m^2+m+1)-(2m+1)(4m+1)=2m+7>0$ 得到。]
      ],
    ),
  ),
)
