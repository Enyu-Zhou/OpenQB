#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019上海.pdf",
  regions: ("上海",),
)

#let cuboid-diagram() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (3, 0, 0)
  let c = (3, 4, 0)
  let d = (0, 4, 0)
  let a1 = (0, 0, 5)
  let b1 = (3, 0, 5)
  let c1 = (3, 4, 5)
  let d1 = (0, 4, 5)
  let m = (3, 0, 2)
  oblique-project((-0.35, -0.32), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(b, c, d, d1, a1, b1, b)
    line(b1, c1, d1)
    line(c, c1)
    line(b, a, d, stroke: (dash: figure-style.dash))
    line(a, a1, stroke: (dash: figure-style.dash))
    line(m, a1, c, stroke: (dash: figure-style.dash))
    line(m, c)
    for (p, label, anchor) in (
      (a, $A$, "south-east"),
      (b, $B$, "north-east"),
      (c, $C$, "north-west"),
      (d, $D$, "west"),
      (a1, $A_1$, "south-east"),
      (b1, $B_1$, "east"),
      (c1, $C_1$, "west"),
      (d1, $D_1$, "south-west"),
      (m, $M$, "east"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})
#let coast-diagram(aux: false) = cetz.canvas(length: 1.6mm, {
  import cetz.draw: *
  let db = 39.2
  let angle-a = calc.asin(db * calc.sin(58deg) / 40)
  let angle-b = 180deg - 58deg - angle-a
  let da = 40 * calc.sin(angle-b) / calc.sin(58deg)
  let d = (0, 0)
  let b = (0, db)
  let a = (-da * calc.sin(58deg), da * calc.cos(58deg))
  let dc = db * calc.cos(22deg)
  let c = (dc * calc.sin(22deg), dc * calc.cos(22deg))
  let radius = db * calc.sin(22deg) / calc.sqrt(2)
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  line(a, b)
  line(a, d, b, c, d)
  arc(b, start: 112deg, stop: 22deg, radius: radius)
  for (origin, start, stop, r, label, lp) in (
    (d, 90deg, 148deg, 8, $58 degree$, (-8, 8.5)),
    (d, 68deg, 90deg, 12, $22 degree$, (3.3, 15.5)),
    (b, -90deg, -22deg, 6, $68 degree$, (6.7, 32)),
  ) {
    arc(
      (origin.at(0) + r * calc.cos(start), origin.at(1) + r * calc.sin(start)),
      start: start,
      stop: stop,
      radius: r,
    )
    content(lp, label)
  }
  if aux {
    let t = db * calc.cos(angle-b) / 40
    let h = (
      b.at(0) + t * (a.at(0) - b.at(0)),
      b.at(1) + t * (a.at(1) - b.at(1)),
    )
    line(d, h, stroke: (dash: figure-style.dash))
    content(h, $H$, anchor: "south-east", padding: 3pt)
  }
  for (p, label, anchor) in (
    (a, $A$, "east"),
    (b, $B$, "south-east"),
    (c, $C$, "west"),
    (d, $D$, "north"),
  ) {
    content(p, label, anchor: anchor, padding: 3pt)
  }
})
#let folded-diagram() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  let a = calc.sqrt(2)
  set-style(axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.1,
    shared-zero: move(dx: -5pt)[$O$],
    tick: (stroke: figure-style.thickness),
  ))
  plot.plot(
    size: (6, 4),
    axis-style: "school-book",
    x-min: 0,
    x-max: 6,
    y-min: 0,
    y-max: 4,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.add(
        domain: (1 + 2 / (4 + a), 1 + a),
        x => 2 / (x - 1) - a,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.add(
        domain: (1 + a, 6),
        x => a - 2 / (x - 1),
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.annotate({
        set-style(stroke: figure-style.thickness)
        let origin = (1 + a, 0)
        let p = (1 + a / 2, a)
        let q = (1 + 2 * a, a / 2)
        line((1, 0), (1, 4), stroke: (dash: figure-style.dash))
        line((0, a), (6, a), stroke: (dash: figure-style.dash))
        line(p, origin, q)
        content(origin, $A$, anchor: "north", padding: 3pt)
        content(p, $P$, anchor: "south-west", padding: 3pt)
        content(q, $Q$, anchor: "south-west", padding: 3pt)
        content((1, 0), [$1$], anchor: "north", padding: 3pt)
        content((0, a), [$sqrt(2)$], anchor: "east", padding: 3pt)
      })
    },
  )
})

#section[填空题：本题共 12 小题，第 1～6 题每小题 4 分，第 7～12 题每小题 5 分，共 54 分。]
#question(
  "fill-in",
  score: 4,
  stem: [已知集合 $A=(-infinity,3)$，$B=(2,+infinity)$，则 $A inter B=$#fill-placeholder()。],
  answers: ([$(2,3)$],),
  explanation: [同时满足 $x<3$ 与 $x>2$，故 $A inter B=(2,3)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知 $z in CC$，且 $1/(z-5)="i"$，其中 $"i"$ 为虚数单位，则 $z=$#fill-placeholder()。],
  answers: ([$5-"i"$],),
  explanation: [由 $z-5=1/"i"=-"i"$，得 $z=5-"i"$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知向量 $bold(a)=(1,0,2)$，$bold(b)=(2,1,0)$，则 $bold(a)$ 与 $bold(b)$ 的夹角为#fill-placeholder()。],
  answers: ([$arccos(2/5)$],),
  explanation: [设夹角为 $theta$，则 $cos theta=(bold(a) dot bold(b))/(|bold(a)| |bold(b)|)=2/(sqrt(5) times sqrt(5))=2/5$，故 $theta=arccos(2/5)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [二项式 $(2x+1)^5$ 的展开式中，含 $x^2$ 项的系数为#fill-placeholder()。],
  answers: ([$40$],),
  explanation: [含 $x^2$ 的项为 $binom(5, 2)(2x)^2=40x^2$，系数为 $40$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知 $x,y$ 满足 $cases(x>=0, y>=0, x+y<=2)$，则 $z=2x-3y$ 的最小值为#fill-placeholder()。],
  answers: ([$-6$],),
  explanation: [由 $x>=0$、$y<=2$ 得 $2x-3y>=-6$。当 $x=0,y=2$ 时满足全部约束且等号成立，故最小值为 $-6$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知函数 $f(x)$ 的周期为 $1$，且当 $0<x<=1$ 时，$f(x)=-log_2 x$，则 $f(3/2)=$#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [由周期性，$f(3/2)=f(1/2)=-log_2 (1/2)=1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y in RR^+$，且 $1/x+2y=3$，则 $y/x$ 的最大值为#fill-placeholder()。],
  answers: ([$9/8$],),
  explanation: [$y/x=(3-2y)y=-2(y-3/4)^2+9/8<=9/8$。当 $y=3/4,x=2/3$ 时等号成立。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知数列 ${a_n}$ 的前 $n$ 项和为 $S_n$，且 $S_n+a_n=2$，则 $S_5=$#fill-placeholder()。],
  answers: ([$31/16$],),
  explanation: [取 $n=1$ 得 $a_1=1$。当 $n>=2$ 时，相邻两式相减得 $a_n+a_n-a_(n-1)=0$，即 $a_n=1/2 a_(n-1)$。
    因而 $S_5=(1-(1/2)^5)/(1-1/2)=31/16$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [过抛物线 $y^2=4x$ 的焦点 $F$ 且垂直于 $x$ 轴的直线与抛物线交于 $A,B$ 两点，$A$ 在 $B$ 的上方。$M$ 为抛物线上一点，若 $arrow(O M)=lambda arrow(O A)+(lambda-2)arrow(O B)$，则 $lambda=$#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [由 $F(1,0)$ 得 $A(1,2)$、$B(1,-2)$，故 $M(2lambda-2,4)$。代入抛物线方程，得 $16=4(2lambda-2)$，解得 $lambda=3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某三位数密码锁，每位数字从 $0$～$9$ 中随机选取，其中恰有两位数字相同的概率为#fill-placeholder()。],
  answers: ([$27/100$],),
  explanation: [密码共有 $10^3$ 种等可能结果。选重复数字有 $10$ 种，选重复的两个位置有 $binom(3, 2)$ 种，另一位数字有 $9$ 种，故概率为 $(10 times binom(3, 2) times 9)/10^3=27/100$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知数列 ${a_n}$ 满足 $a_n<a_(n+1)$，点 $P_n (n,a_n)$ 在双曲线 $x^2/6-y^2/2=1$ 上（$n>=3$），则 $lim_(n -> infinity)|P_n P_(n+1)|=$#fill-placeholder()。],
  answers: ([$2sqrt(3)/3$],),
  explanation: [由双曲线方程，$a_n=plus.minus sqrt(n^2/3-2)$。
    当 $n$ 足够大时，$sqrt(n^2/3-2)>|a_3|$，负根小于 $a_3$，与数列递增矛盾，故最终均取正根。
    有理化得
    $ a_(n+1)-a_n=frac((2n+1)/3, sqrt((n+1)^2/3-2)+sqrt(n^2/3-2))->1/sqrt(3). $
    因而 $lim_(n -> infinity)|P_n P_(n+1)|=sqrt(1+1/3)=2sqrt(3)/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [常数 $a>0$。将函数 $y=2/x$（$x>0$）的图象先向右平移 1 个单位，再向下平移 $a$ 个单位，然后将所得图象在 $x$ 轴下方的部分沿 $x$ 轴向上翻折，其余部分不变，得到函数 $f(x)=|2/(x-1)-a|$（$x>1$）的图象 $L$。当 $a=a_0$ 时，$L$ 与 $x$ 轴交于 $A$，在 $L$ 上任取一点 $P$（$P!=A$），总存在一点 $Q in L$，使得 $A P perp A Q$ 且 $A P=A Q$，则 $a_0=$#fill-placeholder()。],
  answers: ([$sqrt(2)$],),
  explanation: [#step[利用两支的极限确定参数][
      令 $b=2/a$，则 $A(1+b,0)$。以 $A$ 为原点平移坐标，记 $u=x-1-b$、$v=y$，曲线成为 $v=(a|u|)/(u+b)$（$u>-b$）。
      取左支点 $P(-s,a s/(b-s))$，其中 $0<s<b$。满足垂直且等长的两个点由 $P$ 绕原点旋转 $plus.minus 90 degree$ 得到，只有 $Q(a s/(b-s),s)$ 在上半平面。
      当 $s->b^-$ 时，$Q$ 的横坐标趋于 $+infinity$，纵坐标趋于 $b$；而曲线右支的水平渐近线为 $v=a$，故 $a=b$。因此 $a^2=2$，得 $a=sqrt(2)$。]
    #step[验证所有点均满足条件][
      当 $a=b=sqrt(2)$ 时，对上述左支点，令 $t=a s/(a-s)>0$，则右支在 $u=t$ 处的纵坐标为 $a t/(a+t)=s$，所以 $Q$ 确在右支。
      反之，任意右支点 $(t,a t/(a+t))$ 旋转 $90 degree$ 后为 $(-a t/(a+t),t)$，也在左支。故所有非 $A$ 点均有对应点，参数符合要求。
      #figure(folded-diagram())]],
)

#section[选择题：本题共 4 小题，每小题 5 分，共 20 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [直线 $2x-y+c=0$ 的一个方向向量可以是#choice-placeholder()。],
  choices: ([$(2,-1)$], [$(2,1)$], [$(-1,2)$], [$(1,2)$]),
  answers: ([D],),
  explanation: [方向向量与法向量 $(2,-1)$ 垂直，而 $(2,-1) dot (1,2)=0$，故选 D。],
)
#question(
  "single-choice",
  score: 5,
  stem: [一个直角三角形的两条直角边长分别为 1 和 2，将该三角形分别绕这两条直角边旋转一周，得到的两个圆锥的体积之比为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$4$], [$8$]),
  answers: ([B],),
  explanation: [绕长为 $1$ 的直角边旋转所得圆锥的体积为 $V_1=1/3 pi times 2^2 times 1=4pi/3$；绕长为 $2$ 的直角边旋转所得圆锥的体积为 $V_2=1/3 pi times 1^2 times 2=2pi/3$，故 $V_1/V_2=2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $omega in RR$，函数 $f(x)=(x-6)^2 sin(omega x)$。若存在常数 $a in RR$，使 $f(x+a)$ 为偶函数，则 $omega$ 可能的值为#choice-placeholder()。],
  choices: ([$pi/2$], [$pi/3$], [$pi/4$], [$pi/5$]),
  answers: ([C],),
  explanation: [取 $omega=pi/4$、$a=6$，则
    $ f(x+6)=x^2 sin(pi x/4+3pi/2)=-x^2 cos(pi x/4), $
    是偶函数，故选 C。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $tan alpha dot tan beta=tan(alpha+beta)$，有以下两个判断：
    ① 存在第一象限角 $alpha$ 与第三象限角 $beta$ 满足条件；
    ② 存在第二象限角 $alpha$ 与第四象限角 $beta$ 满足条件。
    那么#choice-placeholder()。],
  choices: ([①②均正确], [①②均错误], [①正确，②错误], [①错误，②正确]),
  answers: ([D],),
  explanation: [令 $u=tan alpha$、$v=tan beta$，由正切和角公式，条件等价于 $u v(1-u v)=u+v$，且 $u v!=1$。
    #step[判断①][若 $u,v>0$，令 $p=u v>0$，则 $p(1-p)=u+v>0$，从而 $p<1$。但 $p(1-p)<p<2sqrt(p)<=u+v$，矛盾，故①错误。]
    #step[判断②][取第二象限角 $alpha=3pi/4$，并取第四象限角 $beta$ 使 $tan beta=-1-sqrt(2)$。则
      $ tan alpha tan beta=1+sqrt(2)=(-2-sqrt(2))/(-sqrt(2))=tan(alpha+beta), $
      故②正确。]],
)

#section[解答题：本题共 5 小题，共 76 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [如图，在长方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$M$ 为 $B B_1$ 上一点，$B M=2$，$A D=4$，$C D=3$，$A A_1=5$。
    #figure(cuboid-diagram())],
  parts: (
    subquestion(
      stem: [求直线 $A_1 C$ 与平面 $A B C D$ 所成的角。],
      answers: ([$pi/4$],),
      explanation: [∵ $A A_1 perp "平面" A B C D$，∴所求角为 $angle A_1 C A$。
        $A C=sqrt((A B)^2+(A D)^2)=5=A A_1$，故直角三角形 $A A_1 C$ 为等腰直角三角形，所求角为 $pi/4$。],
    ),
    subquestion(
      stem: [求点 $A$ 到平面 $A_1 M C$ 的距离。],
      answers: ([$10/3$],),
      explanation: [以 $A$ 为原点，分别以 $A B,A D,A A_1$ 所在直线为 $x,y,z$ 轴，则 $A_1(0,0,5)$、$M(3,0,2)$、$C(3,4,0)$。
        向量 $bold(n)=(2,1,2)$ 同时垂直于 $arrow(A_1 M)=(3,0,-3)$、$arrow(M C)=(0,4,-2)$，故平面 $A_1 M C$ 的方程为 $2x+y+2z-10=0$。
        点 $A(0,0,0)$ 到该平面的距离为 $10/sqrt(2^2+1^2+2^2)=10/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知 $f(x)=a x+1/(x+1)$（$a in RR$）。],
  parts: (
    subquestion(
      stem: [当 $a=1$ 时，求不等式 $f(x)+1<f(x+1)$ 的解集。],
      answers: ([$(-2,-1)$],),
      explanation: [须有 $x!=-1,-2$。代入后化简得 $1/(x+1)<1/(x+2)$，即 $1/((x+1)(x+2))<0$，解得 $-2<x< -1$。],
    ),
    subquestion(
      stem: [若 $f(x)$ 在 $[1,2]$ 上有零点，求 $a$ 的取值范围。],
      answers: ([$[-1/2,-1/6]$],),
      explanation: [$f(x)=0 equiv a=-1/(x(x+1))$。当 $x in [1,2]$ 时，$x(x+1)$ 从 $2$ 严格递增到 $6$，故 $-1/(x(x+1))$ 的值域为 $[-1/2,-1/6]$，即所求范围。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，某段海岸线可近似看作一条曲线，由线段 $A B$ 和四分之一圆弧 $B C$ 构成。$D$ 为一海岛，$B$ 在 $D$ 的正北方向，$B,D$ 相距 39.2 千米；$A$ 在 $D$ 的北偏西 $58 degree$ 方向，$C$ 在 $D$ 的北偏东 $22 degree$ 方向，且 $C$ 在 $B$ 的南偏东 $68 degree$ 方向。
    #figure(coast-diagram())],
  parts: (
    subquestion(
      stem: [若沿圆弧 $B C$ 建观光道，计算该观光道的长度。（精确到 0.001 千米）],
      answers: ([约 $16.310$ 千米。],),
      explanation: [在 $triangle B C D$ 中，$angle B D C=22 degree$、$angle D B C=68 degree$，故 $angle B C D=90 degree$，弦长 $B C=39.2sin 22 degree$。
        四分之一圆弧对应的圆心角为 $90 degree$，故圆的半径为 $R=(B C)/sqrt(2)$，观光道长为
        $ l=pi R/2=(39.2pi sin 22 degree)/(2sqrt(2)) approx 16.310 $（千米）。],
    ),
    subquestion(
      stem: [现规划在该海岸线上选取一点 $E$，修建从 $E$ 直通 $D$ 的公路桥。已知 $A,B$ 相距 40 千米，求公路桥 $D E$ 的最短长度。（精确到 0.001 千米）],
      answers: ([约 $35.752$ 千米。],),
      explanation: [#step[求 $D$ 到线段 $A B$ 的最短距离][
          由正弦定理，$sin angle B A D=(39.2sin 58 degree)/40$。因 $A B>B D$，故 $angle B A D<58 degree$，应取锐角，约为 $56.210575 degree$。
          从而 $angle A B D approx 65.789425 degree$。作 $D H perp A B$，则
          $ B H=39.2cos angle A B D approx 16.076 in (0,40), $
          故垂足 $H$ 在线段 $A B$ 内，最短距离为 $D H=39.2sin angle A B D approx 35.752$（千米）。]
        #step[与圆弧部分比较][
          图中圆弧 $B C$ 位于直线 $B C$ 背向 $D$ 的一侧，且 $D C perp B C$，故弧上任意点 $E$ 都有 $D E>=D C$。
          $D C=39.2cos 22 degree approx 36.346>35.752$。因此公路桥的最短长度约为 $35.752$ 千米，取 $E=H$ 时达到。
          #figure(coast-diagram(aux: true))]],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知椭圆 $x^2/8+y^2/4=1$，$F_1,F_2$ 分别为左、右焦点，直线 $l$ 过 $F_2$ 交椭圆于 $A,B$ 两点。],
  parts: (
    subquestion(
      stem: [若直线 $l$ 垂直于 $x$ 轴，求 $|A B|$。],
      answers: ([$2sqrt(2)$],),
      explanation: [焦点 $F_1(-2,0)$、$F_2(2,0)$。令 $x=2$，得 $y=plus.minus sqrt(2)$，故 $|A B|=2sqrt(2)$。],
    ),
    subquestion(
      stem: [当 $angle F_1 A B=90 degree$，且 $A$ 在 $x$ 轴上方时，求 $A,B$ 的坐标。],
      answers: ([$A(0,2)$，$B(8/3,-2/3)$],),
      explanation: [因 $F_2$ 在线段 $A B$ 内，故 $arrow(A F_1) dot arrow(A F_2)=0$。设 $A(x,y)$，则 $x^2+y^2=4$。
        与 $x^2/8+y^2/4=1$ 联立得 $x=0$，结合 $y>0$ 得 $A(0,2)$。
        直线 $l$ 为 $y=2-x$，代入椭圆方程得 $3x^2-8x=0$，另一交点为 $B(8/3,-2/3)$。],
    ),
    subquestion(
      stem: [设直线 $A F_1$ 交 $y$ 轴于 $M$，直线 $B F_1$ 交 $y$ 轴于 $N$。是否存在直线 $l$，使 $S_(triangle F_1 A B)=S_(triangle F_1 M N)$？若存在，求出直线 $l$ 的方程；若不存在，说明理由。],
      answers: ([存在，$x+sqrt(3)y-2=0$ 或 $x-sqrt(3)y-2=0$。],),
      explanation: [#step[用纵坐标表示面积][
          构成三角形要求 $l$ 不为 $x$ 轴，故可设 $l:x=m y+2$。记 $A(x_1,y_1)$、$B(x_2,y_2)$。
          代入椭圆方程，得 $(m^2+2)y^2+4m y-4=0$，故
          $ y_1+y_2=-4m/(m^2+2), quad y_1 y_2=-4/(m^2+2). $
          因 $F_2$ 在线段 $A B$ 内，故 $S_(triangle F_1 A B)=2|y_1-y_2|$。
          $A F_1$、$B F_1$ 与 $y$ 轴有交点要求 $x_1+2!=0$、$x_2+2!=0$。此时 $M,N$ 的纵坐标分别为 $(2y_1)/(m y_1+4)$、$(2y_2)/(m y_2+4)$，故
          $ S_(triangle F_1 M N)=abs(frac(8(y_1-y_2), (m y_1+4)(m y_2+4))). $]
        #step[解面积相等条件并验证][
          ∵ $y_1!=y_2$，∴两面积相等当且仅当 $|(m y_1+4)(m y_2+4)|=4$。
          由韦达定理，
          $ (m y_1+4)(m y_2+4)=m^2 y_1 y_2+4m(y_1+y_2)+16=(32-4m^2)/(m^2+2). $
          因而 $|8-m^2|=m^2+2$，解得 $m^2=3$。
          此时两交点互异、上述分母非零，确实符合条件，故直线为 $x+sqrt(3)y-2=0$ 或 $x-sqrt(3)y-2=0$。]],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [数列 ${a_n}$ 有 100 项，$a_1=a$。对任意整数 $n in [2,100]$，都存在整数 $i in [1,n-1]$，使 $a_n=a_i+d$。若 $a_k$ 与其之前某一项相等，则称 $a_k$ 具有性质 $P$。],
  parts: (
    subquestion(
      stem: [若 $a_1=1$，$d=2$，求 $a_4$ 所有可能的值。],
      answers: ([$3,5,7$],),
      explanation: [必有 $a_2=3$，而 $a_3=3$ 或 $5$。由 $a_4=a_i+2$（$i=1,2,3$），可得 $a_4$ 只能为 $3,5,7$，且分别由前四项 $(1,3,3,3)$、$(1,3,3,5)$、$(1,3,5,7)$ 实现。],
    ),
    subquestion(
      stem: [若 ${a_n}$ 不是等差数列，证明：${a_n}$ 中存在具有性质 $P$ 的项。],
      answers: ([证明见解析。],),
      explanation: [证明其逆否命题。假设没有具有性质 $P$ 的项，则各项互不相同，故 $d!=0$。
        归纳证明 $a_n=a+(n-1)d$。$n=1,2$ 时成立；若前 $n-1$ 项成立，则 $a_n=a_i+d=a+i d$。若 $i<=n-2$，则 $a_n=a_(i+1)$，矛盾，故 $i=n-1$，结论成立。
        因此数列必为等差数列，原命题得证。],
    ),
    subquestion(
      stem: [若 ${a_n}$ 中恰有三项具有性质 $P$，这三项的和为 $c$，用 $a,d,c$ 表示 $a_1+a_2+dot.c+a_100$。],
      answers: ([$97a+4656d+c$],),
      explanation: [若 $d=0$，则有 99 项具有性质 $P$，故 $d!=0$。
        删除三项重复项，按原顺序得到 97 项数列 ${b_k}$。每个值首次出现的项均被保留，因此 $a_n=a_i+d$ 仍保证每个 $b_k$ 等于某个前项加 $d$。
        ${b_k}$ 无重复项，依第（2）问得 $b_k=a+(k-1)d$，故
        $
          sum_(n=1)^100 a_n=sum_(k=1)^97 b_k+c=97a+(97 times 96)/2 d+c=97a+4656d+c.
        $],
    ),
  ),
)
