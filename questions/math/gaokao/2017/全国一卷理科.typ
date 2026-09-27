#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017全国1理(河南,河北,山西,江西,湖北,湖南,广东,安徽,福建).pdf",
  regions: (
    "河南",
    "河北",
    "山西",
    "江西",
    "湖北",
    "湖南",
    "广东",
    "安徽",
    "福建",
  ),
)

#let taiji() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let rim = range(61).map(i => (
    calc.cos(-90deg + i * 3deg),
    calc.sin(-90deg + i * 3deg),
  ))
  line(..rim, close: true, fill: black, stroke: none)
  circle((0, 0.5), radius: 0.5, fill: black, stroke: none)
  circle((0, -0.5), radius: 0.5, fill: white, stroke: none)
  circle((0, 0.5), radius: 0.09, fill: white, stroke: none)
  circle((0, -0.5), radius: 0.09, fill: black, stroke: none)
  circle((0, 0), radius: 1)
  line((-1, -1), (1, -1), (1, 1), (-1, 1), close: true)
  for (p, label, anchor) in (
    ((-1, 1), $A$, "south-east"),
    ((1, 1), $B$, "south-west"),
    ((1, -1), $C$, "north-west"),
    ((-1, -1), $D$, "north-east"),
  ) {
    content(p, label, anchor: anchor, padding: 2pt)
  }
})
#let solid-views() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((0, 0), (2, 0), (2, 4), (0, 2), close: true)
  line((0, 2), (2, 2))
  line((3, 0), (5, 0), (5, 2), (3, 4), close: true)
  line((3, 2), (5, 2))
  line((0, -1), (2, -1), (2, -3), close: true)
})
#let loop-chart() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (y, label) in ((0, [开始]), (-10.4, [结束])) {
    rect((-0.7, y - 0.35), (0.7, y + 0.35), radius: 0.2)
    content((0, y), text(size: 9pt, label))
  }
  for (y, label) in ((-1.7, [输入 $n=0$]), (-8.6, [输出 $n$])) {
    line(
      (-1.2, y - 0.4),
      (0.9, y - 0.4),
      (1.2, y + 0.4),
      (-0.9, y + 0.4),
      close: true,
    )
    content((0, y), text(size: 9pt, label))
  }
  rect((-1.4, -3.8), (1.4, -3))
  content((0, -3.4), text(size: 9pt)[$A=3^n-2^n$])
  line((0, -4.8), (2, -5.6), (0, -6.4), (-2, -5.6), close: true)
  rect((-4.5, -4.5), (-2.5, -3.7))
  for (a, b) in (
    ((0, -0.35), (0, -1.3)),
    ((0, -2.1), (0, -3)),
    ((0, -3.8), (0, -4.8)),
    ((0, -6.4), (0, -8.2)),
    ((0, -9), (0, -10.05)),
  ) {
    line(a, b, mark: (end: ">"))
  }
  line((-2, -5.6), (-3.5, -5.6), (-3.5, -4.5), mark: (end: ">"))
  line((-3.5, -3.7), (-3.5, -2.6), (0, -2.6), mark: (end: ">"))
  content((-2.15, -5.6), text(size: 9pt)[是], anchor: "north", padding: 2pt)
  content((0, -7.1), text(size: 9pt)[否], anchor: "west", padding: 3pt)
})
#let folded-net() = cetz.canvas(length: 6mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let polar(r, t) = (r * calc.cos(t), r * calc.sin(t))
  let a = polar(2.5, 120deg)
  let b = polar(2.5, 240deg)
  let c = polar(2.5, 0deg)
  let d = polar(5, 300deg)
  let e = polar(5, 60deg)
  let f = polar(5, 180deg)
  circle((0, 0), radius: 5)
  line(a, b, c, close: true)
  line(a, e, c, d, b, f, close: true, stroke: (dash: figure-style.dash))
  circle((0, 0), radius: 0.06, fill: black, stroke: none)
  for (p, label, anchor) in (
    (a, $A$, "south-east"),
    (b, $B$, "north-east"),
    (c, $C$, "west"),
    (d, $D$, "north-west"),
    (e, $E$, "south-west"),
    (f, $F$, "east"),
    ((0, 0), $O$, "north-west"),
  ) {
    content(p, label, anchor: anchor, padding: 2pt)
  }
})
#let pyramid() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (0, 0, 0)
  let b = (0, 1, 0)
  let d = (calc.sqrt(2), 0, 0)
  let c = (calc.sqrt(2), 1, 0)
  let p = (calc.sqrt(2) / 2, 0, calc.sqrt(2) / 2)
  oblique-project((0.7, 0.5), (2.1, 0), (-0.3, 1.8), {
    line(a, b, c, p, a)
    line(p, b)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(p, d, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "north"),
      (p, $P$, "south"),
    ) {
      content(point, label, anchor: anchor, padding: 3pt)
    }
  })
})

#section[选择题：共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x|x<1}$，$B={x|3^x<1}$，则#choice-placeholder()。],
  choices: (
    [$A inter B={x|x<0}$],
    [$A union B=RR$],
    [$A union B={x|x>1}$],
    [$A inter B=emptyset$],
  ),
  answers: ([A],),
  explanation: [$B={x|x<0} subset A$，∴ $A inter B=B$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，正方形 $A B C D$ 内的图形来自中国古代的太极图，正方形内切圆中的黑色部分和白色部分关于正方形的中心成中心对称。在正方形内随机取一点，则此点取自黑色部分的概率是#choice-placeholder()。
    #figure(taiji())],
  choices: ([$1/4$], [$pi/8$], [$1/2$], [$pi/4$]),
  answers: ([B],),
  explanation: [设圆的半径为 $r$，黑色部分的面积为 $1/2 pi r^2$，正方形面积为 $4r^2$，所求概率为 $pi/8$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设有下面四个命题：\
    $p_1$：若复数 $z$ 满足 $1/z in RR$，则 $z in RR$；\
    $p_2$：若复数 $z$ 满足 $z^2 in RR$，则 $z in RR$；\
    $p_3$：若复数 $z_1$、$z_2$ 满足 $z_1 z_2 in RR$，则 $z_1=overline(z_2)$；\
    $p_4$：若复数 $z in RR$，则 $overline(z) in RR$。\
    其中的真命题为#choice-placeholder()。],
  choices: ([$p_1,p_3$], [$p_1,p_4$], [$p_2,p_3$], [$p_2,p_4$]),
  answers: ([B],),
  explanation: [$1/z$ 为非零实数时，其倒数 $z$ 也是实数，故 $p_1$ 真；取 $z=i$ 可否定 $p_2$；取 $z_1=z_2=i$ 可否定 $p_3$；实数的共轭仍是自身，故 $p_4$ 真。],
)
#question(
  "single-choice",
  score: 5,
  stem: [记 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和。若 $a_4+a_5=24$，$S_6=48$，则 ${a_n}$ 的公差为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$4$], [$8$]),
  answers: ([C],),
  explanation: [设公差为 $d$，则 $2a_1+7d=24$，$2a_1+5d=S_6/3=16$。两式相减得 $2d=8$，∴ $d=4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $f(x)$ 在 $(-infinity,+infinity)$ 单调递减，且为奇函数。若 $f(1)=-1$，则满足 $-1<=f(x-2)<=1$ 的 $x$ 的取值范围是#choice-placeholder()。],
  choices: ([$[-2,2]$], [$[-1,1]$], [$[0,4]$], [$[1,3]$]),
  answers: ([D],),
  explanation: [$f(-1)=1$，故原不等式等价于 $f(1)<=f(x-2)<=f(-1)$。由单调性得 $-1<=x-2<=1$，即 $1<=x<=3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$(1+1/x^2)(1+x)^6$ 展开式中 $x^2$ 的系数为#choice-placeholder()。],
  choices: ([$15$], [$20$], [$30$], [$35$]),
  answers: ([C],),
  explanation: [所求系数为 $binom(6, 2)+binom(6, 4)=15+15=30$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某多面体的三视图如图所示，其中正视图和左视图都由正方形和等腰直角三角形组成，正方形的边长为 2，俯视图为等腰直角三角形。该多面体的各个面中有若干个是梯形，这些梯形的面积之和为#choice-placeholder()。
    #figure(solid-views())],
  choices: ([$10$], [$12$], [$14$], [$16$]),
  answers: ([B],),
  explanation: [由俯视图知，底面是直角边长为 2 的等腰直角三角形；由正视图和左视图知，直角顶点处的棱高为 4，其余两条竖直棱高为 2。因此有两个全等的直角梯形面，每个梯形的平行边长为 2、4，高为 2，面积之和为 $2 times (2+4) times 2/2=12$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，程序框图是为了求出满足 $3^n-2^n>1000$ 的最小偶数 $n$，那么在菱形和矩形两个空白框中，可以分别填入#choice-placeholder()。
    #figure(loop-chart())],
  choices: (
    [$A>1000$ 和 $n=n+1$],
    [$A>1000$ 和 $n=n+2$],
    [$A<=1000$ 和 $n=n+1$],
    [$A<=1000$ 和 $n=n+2$],
  ),
  answers: ([D],),
  explanation: [从 $n=0$ 开始每次增加 2，依次检验偶数。当 $A<=1000$ 时继续循环，否则输出 $n$，故选 D。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知曲线 $C_1:y=cos x$，$C_2:y=sin(2x+2pi/3)$，则下面结论正确的是#choice-placeholder()。],
  choices: (
    [把 $C_1$ 上各点的横坐标伸长到原来的 2 倍，纵坐标不变，再把得到的曲线向右平移 $pi/6$ 个单位长度，得到曲线 $C_2$],
    [把 $C_1$ 上各点的横坐标伸长到原来的 2 倍，纵坐标不变，再把得到的曲线向左平移 $pi/12$ 个单位长度，得到曲线 $C_2$],
    [把 $C_1$ 上各点的横坐标缩短到原来的 $1/2$ 倍，纵坐标不变，再把得到的曲线向右平移 $pi/6$ 个单位长度，得到曲线 $C_2$],
    [把 $C_1$ 上各点的横坐标缩短到原来的 $1/2$ 倍，纵坐标不变，再把得到的曲线向左平移 $pi/12$ 个单位长度，得到曲线 $C_2$],
  ),
  answers: ([D],),
  explanation: [$sin(2x+2pi/3)=cos(2x+pi/6)=cos(2(x+pi/12))$，故先将横坐标缩短到原来的 $1/2$ 倍，再向左平移 $pi/12$ 个单位长度。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $F$ 为抛物线 $C:y^2=4x$ 的焦点，过 $F$ 作两条互相垂直的直线 $l_1$、$l_2$，直线 $l_1$ 与 $C$ 交于 $A$、$B$ 两点，直线 $l_2$ 与 $C$ 交于 $D$、$E$ 两点，则 $|A B|+|D E|$ 的最小值为#choice-placeholder()。],
  choices: ([$16$], [$14$], [$12$], [$10$]),
  answers: ([A],),
  explanation: [两条直线均与抛物线有两个交点，故斜率均存在且非零。设其斜率分别为 $k$、$-1/k$。由 $y=k(x-1)$ 与 $y^2=4x$ 联立，得两交点横坐标之和为 $2+4/k^2$。由抛物线定义，$|A B|=x_A+x_B+2=4+4/k^2$，同理 $|D E|=4+4k^2$。∴ $|A B|+|D E|=8+4(k^2+1/k^2)>=16$，当 $k^2=1$ 时取等号。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $x$、$y$、$z$ 为正数，且 $2^x=3^y=5^z$，则#choice-placeholder()。],
  choices: ([$2x<3y<5z$], [$5z<2x<3y$], [$3y<5z<2x$], [$3y<2x<5z$]),
  answers: ([D],),
  explanation: [设公共值为 $t>1$，则 $(2x)/(3y)=(2ln 3)/(3ln 2)=(ln 9)/(ln 8)>1$，$(2x)/(5z)=(2ln 5)/(5ln 2)=(ln 25)/(ln 32)<1$，∴ $3y<2x<5z$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [几位大学生响应国家的创业号召，开发了一款应用软件。为激发大家学习数学的兴趣，他们推出了“解数学题获取软件激活码”的活动。这款软件的激活码为下面数学问题的答案：已知数列 $1,1,2,1,2,4,1,2,4,8,1,2,4,8,16,dots$，其中第一项是 $2^0$，接下来的两项是 $2^0$、$2^1$，再接下来的三项是 $2^0$、$2^1$、$2^2$，依此类推。求满足如下条件的最小整数 $N$：$N>100$ 且该数列的前 $N$ 项和为 2 的整数幂。那么该款软件的激活码是#choice-placeholder()。],
  choices: ([$440$], [$330$], [$220$], [$110$]),
  answers: ([A],),
  explanation: [设前 $N$ 项包含完整的前 $k$ 组及第 $k+1$ 组的前 $t$ 项，其中 $0<=t<=k$，则
    $ N=k(k+1)/2+t, quad S_N=sum_(j=1)^k (2^j-1)+(2^t-1)=2^(k+1)+2^t-k-3. $
    ∵ $N>100$，∴ $k>=13$。此时 $2^k<S_N<2^(k+2)$，若 $S_N$ 是 2 的整数幂，只能为 $2^(k+1)$，即 $2^t=k+3$。
    当 $k=13$ 时，$t=4$，但 $N=95$，不合题意；当 $14<=k<=28$ 时，$17<=k+3<=31$，无解。下一组解为 $k=29$、$t=5$，此时 $N=29 times 30/2+5=440$，即所求最小值。],
)
#section[填空题：共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知向量 $bold(a)$、$bold(b)$ 的夹角为 $60 degree$，$|bold(a)|=2$，$|bold(b)|=1$，则 $|bold(a)+2bold(b)|=$#fill-placeholder()。],
  answers: ([$2sqrt(3)$],),
  explanation: [$|bold(a)+2bold(b)|^2=|bold(a)|^2+4|bold(b)|^2+4bold(a) dot bold(b)=4+4+4 times 2 times 1 times cos 60 degree=12$，故结果为 $2sqrt(3)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $x$、$y$ 满足约束条件 $cases(x+2y<=1, 2x+y>=-1, x-y<=0)$，则 $z=3x-2y$ 的最小值为#fill-placeholder()。],
  answers: ([$-5$],),
  explanation: [$z=8/3(2x+y)-7/3(x+2y)>=-8/3-7/3=-5$。当 $(x,y)=(-1,1)$ 时满足全部约束条件且取等号，故最小值为 $-5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0$，$b>0$）的右顶点为 $A$，以 $A$ 为圆心、$b$ 为半径作圆 $A$，圆 $A$ 与双曲线 $C$ 的一条渐近线交于 $M$、$N$ 两点。若 $angle M A N=60 degree$，则 $C$ 的离心率为#fill-placeholder()。],
  answers: ([$(2sqrt(3))/3$],),
  explanation: [点 $A(a,0)$ 到渐近线 $b x-a y=0$ 的距离为 $a b/sqrt(a^2+b^2)=a b/c$。另一方面，等腰三角形 $A M N$ 的顶角为 $60 degree$，该距离为 $b cos 30 degree=sqrt(3)b/2$，故 $a/c=sqrt(3)/2$，∴ $e=c/a=(2sqrt(3))/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，圆形纸片的圆心为 $O$，半径为 $5 "cm"$，该纸片上的等边三角形 $A B C$ 的中心为 $O$。$D$、$E$、$F$ 为圆 $O$ 上的点，$triangle D B C$、$triangle E C A$、$triangle F A B$ 分别是以 $B C$、$C A$、$A B$ 为底边的等腰三角形。沿虚线剪开后，分别以 $B C$、$C A$、$A B$ 为折痕折起 $triangle D B C$、$triangle E C A$、$triangle F A B$，使得 $D$、$E$、$F$ 重合，得到三棱锥。当 $triangle A B C$ 的边长变化时，所得三棱锥体积（单位：$"cm"^3$）的最大值为#fill-placeholder()。
    #figure(folded-net())],
  answers: ([$4sqrt(15)$],),
  explanation: [设底边长为 $x$，底面中心到边的距离为 $r=sqrt(3)x/6$。折叠后侧面斜高为 $5-r$，锥高 $h$ 满足 $h^2=(5-r)^2-r^2=25-(5sqrt(3))/3 x$，故 $0<x<5sqrt(3)$。
    $ V^2=(1/3 dot sqrt(3)/4 x^2 h)^2=1/48 x^4(25-(5sqrt(3))/3 x). $
    其导数为 $1/48 x^3(100-(25sqrt(3))/3 x)$，在 $x=4sqrt(3)$ 两侧先正后负，故此时体积最大。此时底面积为 $12sqrt(3)$，$h=sqrt(5)$，∴ $V_max=4sqrt(15)$。],
)
#section[解答题：共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17～21 题为必考题，每个试题考生都必须作答；第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [$triangle A B C$ 的内角 $A$、$B$、$C$ 的对边分别为 $a$、$b$、$c$，已知 $triangle A B C$ 的面积为 $a^2/(3sin A)$。],
  parts: (
    subquestion(
      stem: [求 $sin B sin C$。],
      answers: ([$2/3$],),
      explanation: [由 $1/2 b c sin A=a^2/(3sin A)$，得 $frac(b c, a^2)sin^2 A=2/3$。由正弦定理，左边为 $sin B sin C$，故 $sin B sin C=2/3$。],
    ),
    subquestion(
      stem: [若 $6cos B cos C=1$，$a=3$，求 $triangle A B C$ 的周长。],
      answers: ([$3+sqrt(33)$],),
      explanation: [$cos(B+C)=cos B cos C-sin B sin C=1/6-2/3=-1/2$，∴ $cos A=1/2$，$A=pi/3$。由面积条件得 $b c=2a^2/(3sin^2 A)=8$。由余弦定理，$9=b^2+c^2-b c=(b+c)^2-3b c$，故 $b+c=sqrt(33)$，周长为 $3+sqrt(33)$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在四棱锥 $P-A B C D$ 中，$A B parallel C D$，且 $angle B A P=angle C D P=90 degree$。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [证明：平面 $P A B perp$ 平面 $P A D$。],
      answers: ([证明见解析。],),
      explanation: [∵ $A B perp A P$，$C D perp P D$，$A B parallel C D$，∴ $A B perp P D$。又 $A P inter P D={P}$，故 $A B perp$ 平面 $P A D$。∵ $A B subset$ 平面 $P A B$，∴ 平面 $P A B perp$ 平面 $P A D$。],
    ),
    subquestion(
      stem: [若 $P A=P D=A B=D C$，$angle A P D=90 degree$，求二面角 $A-P B-C$ 的余弦值。],
      answers: ([$-sqrt(3)/3$],),
      explanation: [以 $P$ 为原点，$arrow(P A)$、$arrow(P D)$ 及与 $arrow(A B)$ 同向的方向为三个坐标轴正方向，公共棱长为单位长度，则 $A(1,0,0)$、$D(0,1,0)$、$B(1,0,1)$、$C(0,1,1)$。
        将 $arrow(P A)$、$arrow(P C)$ 分别减去其沿 $arrow(P B)$ 的分量，得到垂直于棱 $P B$ 且分别指向两半平面的向量
        $ bold(u)=(1/2,0,-1/2), quad bold(v)=(-1/2,1,1/2). $
        二者夹角就是所求二面角，故其余弦值为 $frac(bold(u) dot bold(v), |bold(u)| |bold(v)|)=frac(-1/2, sqrt(1/2)sqrt(3/2))=-sqrt(3)/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [为了监控某种零件的一条生产线的生产过程，检验员每天从该生产线上随机抽取 16 个零件，并测量其尺寸（单位：$"cm"$）。根据长期生产经验，可以认为这条生产线正常状态下生产的零件的尺寸服从正态分布 $N(mu,sigma^2)$。],
  parts: (
    subquestion(
      stem: [假设生产状态正常，记 $X$ 表示一天内抽取的 16 个零件中其尺寸在 $(mu-3sigma,mu+3sigma)$ 之外的零件数，求 $P(X>=1)$ 及 $X$ 的数学期望。],
      answers: ([$P(X>=1) approx 0.0408$，$E(X)=0.0416$。],),
      explanation: [一个零件的尺寸超出该区间的概率为 $p=1-0.9974=0.0026$，故 $X tilde B(16,0.0026)$。∴ $P(X>=1)=1-P(X=0)=1-0.9974^16 approx 0.0408$，$E(X)=16 times 0.0026=0.0416$。],
    ),
    subquestion(
      stem: [一天内抽检零件中，如果出现了尺寸在 $(mu-3sigma,mu+3sigma)$ 之外的零件，就认为这条生产线在这一天的生产过程可能出现了异常情况，需对当天的生产过程进行检查。],
      parts: (
        subquestion(
          stem: [试说明上述监控生产过程方法的合理性。],
          answers: ([正常状态下触发检查的概率较小，故该方法合理。],),
          explanation: [由第 (1) 问，正常生产时触发检查的概率约为 $0.0408$，属于小概率事件。因此，一旦发生，就有理由怀疑生产过程异常并进行检查；这并不等于断定生产线必然异常。],
        ),
        subquestion(
          stem: [下面是检验员在一天内抽取的 16 个零件的尺寸：
            #table(
              columns: 8,
              stroke: none,
              inset: 4pt,
              [9.95], [10.12], [9.96], [9.96], [10.01], [9.92], [9.98], [10.04],
              [10.26],
              [9.91],
              [10.13],
              [10.02],
              [9.22],
              [10.04],
              [10.05],
              [9.95],
            )
            经计算得 $overline(x)=1/16 sum_(i=1)^16 x_i=9.97$，
            $
              s=sqrt(1/16 sum_(i=1)^16(x_i-overline(x))^2)=sqrt(1/16(sum_(i=1)^16 x_i^2-16overline(x)^2)) approx 0.212,
            $
            其中 $x_i$ 为抽取的第 $i$ 个零件的尺寸，$i=1,2,dots,16$。用样本平均数 $overline(x)$ 作为 $mu$ 的估计值 $hat(mu)$，用样本标准差 $s$ 作为 $sigma$ 的估计值 $hat(sigma)$，利用估计值判断是否需对当天的生产过程进行检查。剔除 $(hat(mu)-3hat(sigma),hat(mu)+3hat(sigma))$ 之外的数据，用剩下的数据估计 $mu$ 和 $sigma$（精确到 $0.01$）。
            附：若随机变量 $Z$ 服从正态分布 $N(mu,sigma^2)$，则 $P(mu-3sigma<Z<mu+3sigma)=0.9974$，$0.9974^16 approx 0.9592$，$sqrt(0.008) approx 0.09$。],
          answers: (
            [需要检查；$mu$ 的估计值为 $10.02$，$sigma$ 的估计值为 $0.09$。],
          ),
          explanation: [估计区间为 $(9.97-3 times 0.212,9.97+3 times 0.212)=(9.334,10.606)$，数据 $9.22$ 在区间外，因此需要检查。
            剔除 $9.22$ 后，剩下 15 个数据的平均数为 $(16 times 9.97-9.22)/15=10.02$；直接对剩下数据计算方差得 $0.008146dots approx 0.008$，标准差约为 $0.09$。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$），四点 $P_1(1,1)$、$P_2(0,1)$、$P_3(-1,sqrt(3)/2)$、$P_4(1,sqrt(3)/2)$ 中恰有三点在椭圆 $C$ 上。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程。],
      answers: ([$x^2/4+y^2=1$],),
      explanation: [∵ $P_3$、$P_4$ 关于 $y$ 轴对称，且四点中恰有三点在椭圆上，∴ $P_3$、$P_4$ 均在椭圆上。若 $P_1$ 也在椭圆上，则同一横坐标 $x=1$ 对应两个不同的正纵坐标，不可能。因此第三点为 $P_2$。代入得 $b^2=1$，$1/a^2+3/4=1$，故 $a^2=4$，椭圆方程为 $x^2/4+y^2=1$。],
    ),
    subquestion(
      stem: [设直线 $l$ 不经过 $P_2$ 点且与 $C$ 相交于 $A$、$B$ 两点，若直线 $P_2 A$ 与直线 $P_2 B$ 的斜率的和为 $-1$，证明：$l$ 过定点。],
      answers: ([$l$ 过定点 $(2,-1)$。],),
      explanation: [#step[排除竖直直线][若 $l:x=m$，两交点关于 $x$ 轴对称，故两条连线的斜率和为 $-2/m=-1$，得 $m=2$。但 $x=2$ 与椭圆相切，不合题意。]
        #step[利用韦达定理][设 $l:y=k x+t$，$A(x_1,y_1)$、$B(x_2,y_2)$。由题意，$t!=1$，且两条连线的斜率存在，故 $x_1 x_2!=0$。联立得
          $ (1+4k^2)x^2+8k t x+4t^2-4=0, $
          ∴ $x_1+x_2=(-8k t)/(1+4k^2)$，$x_1 x_2=(4t^2-4)/(1+4k^2)$，从而 $t!=-1$。
          $
            -1=frac(y_1-1, x_1)+frac(y_2-1, x_2)=2k+(t-1)frac(x_1+x_2, x_1 x_2)=frac(2k, t+1).
          $
          ∴ $t=-2k-1$，直线方程为 $y=k(x-2)-1$，故恒过定点 $(2,-1)$。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=a e^(2x)+(a-2)e^x-x$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性。],
      answers: (
        [当 $a<=0$ 时，在 $RR$ 上单调递减；当 $a>0$ 时，在 $(-infinity,-ln a)$ 上单调递减，在 $(-ln a,+infinity)$ 上单调递增。],
      ),
      explanation: [$f'(x)=2a e^(2x)+(a-2)e^x-1=(a e^x-1)(2e^x+1)$。若 $a<=0$，则 $f'(x)<0$；若 $a>0$，则 $f'(x)$ 在 $x=-ln a$ 两侧依次为负、正，故有上述单调性。],
    ),
    subquestion(
      stem: [若 $f(x)$ 有两个零点，求 $a$ 的取值范围。],
      answers: ([$(0,1)$],),
      explanation: [若 $a<=0$，函数严格递减，至多有一个零点。若 $a>0$，由第 (1) 问，其最小值为 $f(-ln a)=1-1/a+ln a$。
        当 $a>=1$ 时，该值非负，函数至多有一个零点；当 $0<a<1$ 时，该值为负，且 $lim_(x->-infinity)f(x)=+infinity$、$lim_(x->+infinity)f(x)=+infinity$。由连续性和两侧严格单调性，恰有两个零点。因此 $a in (0,1)$。],
    ),
  ),
)
#section[选考题：共 10 分。请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [［选修 4—4：坐标系与参数方程］在直角坐标系 $x O y$ 中，曲线 $C$ 的参数方程为 $cases(x=3cos theta, y=sin theta)$（$theta$ 为参数），直线 $l$ 的参数方程为 $cases(x=a+4t, y=1-t)$（$t$ 为参数）。],
  parts: (
    subquestion(
      stem: [若 $a=-1$，求 $C$ 与 $l$ 的交点坐标。],
      answers: ([$(3,0)$，$(-21/25,24/25)$。],),
      explanation: [曲线的普通方程为 $x^2/9+y^2=1$，直线为 $x+4y-3=0$。代入 $x=3-4y$，得 $25y^2-24y=0$，即 $y=0$ 或 $y=24/25$，故两交点为 $(3,0)$、$(-21/25,24/25)$。],
    ),
    subquestion(
      stem: [若 $C$ 上的点到 $l$ 距离的最大值为 $sqrt(17)$，求 $a$。],
      answers: ([$a=8$ 或 $a=-16$。],),
      explanation: [$l:x+4y-a-4=0$。点 $(3cos theta,sin theta)$ 到 $l$ 的距离为 $frac(|3cos theta+4sin theta-a-4|, sqrt(17))$。∵ $3cos theta+4sin theta$ 的值域为 $[-5,5]$，∴ 距离的最大值为 $(5+|a+4|)/sqrt(17)$。令其等于 $sqrt(17)$，得 $|a+4|=12$，故 $a=8$ 或 $a=-16$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [［选修 4—5：不等式选讲］已知函数 $f(x)=-x^2+a x+4$，$g(x)=|x+1|+|x-1|$。],
  parts: (
    subquestion(
      stem: [当 $a=1$ 时，求不等式 $f(x)>=g(x)$ 的解集。],
      answers: ([$[-1,(-1+sqrt(17))/2]$],),
      explanation: [当 $x< -1$ 时，不等式为 $x^2-3x-4<=0$，与 $x< -1$ 无公共解；当 $-1<=x<=1$ 时，为 $x^2-x-2<=0$，该段全部满足；当 $x>1$ 时，为 $x^2+x-4<=0$，得 $1<x<=(-1+sqrt(17))/2$。合并得解集为 $[-1,(-1+sqrt(17))/2]$。],
    ),
    subquestion(
      stem: [若不等式 $f(x)>=g(x)$ 的解集包含 $[-1,1]$，求 $a$ 的取值范围。],
      answers: ([$[-1,1]$],),
      explanation: [在 $[-1,1]$ 上，$g(x)=2$，故要求 $f(x)>=2$ 恒成立。二次函数 $f(x)$ 开口向下，区间最小值在端点取得，故等价于 $f(-1)=3-a>=2$ 且 $f(1)=3+a>=2$，即 $-1<=a<=1$。],
    ),
  ),
)
