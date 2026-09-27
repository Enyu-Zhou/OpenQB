#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016天津理.pdf",
  regions: ("天津",),
)

#let loop-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 7mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    for (y, label) in ((0, [开始]), (-10.7, [结束])) {
      rect((-0.65, y - 0.3), (0.65, y + 0.3), radius: 0.15)
      content((0, y), label)
    }
    for (y, label) in (
      (-1.15, $S=4$),
      (-2.3, $n=1$),
      (-4.9, $S=S-6$),
      (-6.3, $n=n+1$),
    ) {
      rect((-1.2, y - 0.35), (1.2, y + 0.35))
      content((0, y), label)
    }
    for (y, label) in ((-3.6, $S>=6$), (-7.7, $n>3$)) {
      line((0, y + 0.5), (1.5, y), (0, y - 0.5), (-1.5, y), close: true)
      content((0, y), label)
    }
    rect((-4.2, -5.25), (-2, -4.55))
    content((-3.1, -4.9), $S=2S$)
    line((-1, -9.65), (0.8, -9.65), (1, -8.95), (-0.8, -8.95), close: true)
    content((0, -9.3), [输出 $S$])
    for (a, b) in (
      (-0.3, -0.8),
      (-1.5, -1.95),
      (-2.65, -3.1),
      (-4.1, -4.55),
      (-5.25, -5.95),
      (-6.65, -7.2),
      (-8.2, -8.95),
      (-9.65, -10.4),
    ) {
      line((0, a), (0, b), mark: (end: ">"))
    }
    line((-1.5, -3.6), (-3.1, -3.6), (-3.1, -4.55), mark: (end: ">"))
    line((-3.1, -5.25), (-3.1, -5.6), (0, -5.6), mark: (end: ">"))
    line((1.5, -7.7), (2.7, -7.7), (2.7, -2.85), (0, -2.85), mark: (end: ">"))
    for (p, label, anchor) in (
      ((-1.9, -3.5), [否], "south"),
      ((0.2, -4.3), [是], "west"),
      ((1.85, -7.6), [否], "south"),
      ((0.2, -8.5), [是], "west"),
    ) {
      content(p, label, anchor: anchor)
    }
  })
}
#let three-views() = {
  set text(size: 9pt)
  cetz.canvas(length: 11mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    line((0, 0), (3, 0), (1.5, 3), close: true)
    line((1.5, 3), (2, 0))
    line((1.5, 3), (1, 0), stroke: (dash: figure-style.dash))
    line((4, 0), (5, 0), (4.5, 3), close: true)
    content((1.5, -0.9), [正视图])
    content((4.5, -0.9), [侧视图])
    line((0, -2.6), (2, -2.6), (3, -1.6), (1, -1.6), close: true)
    line((0, -2.6), (3, -1.6))
    line((1, -1.6), (2, -2.6))
    content((1.5, -3), [俯视图])
    for (a, b, label) in (
      ((0, -0.3), (1, -0.3), $1$),
      ((1, -0.3), (2, -0.3), $1$),
      ((2, -0.3), (3, -0.3), $1$),
      ((4, -0.3), (5, -0.3), $1$),
      ((-0.35, 0), (-0.35, 3), $3$),
    ) {
      line(a, b, mark: (start: ">", end: ">"))
      content(
        ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2),
        label,
        frame: "rect",
        fill: white,
        stroke: none,
        padding: 1pt,
      )
    }
    for x in (0, 1, 2, 3, 4, 5) { line((x, -0.18), (x, -0.42)) }
    for y in (0, 3) { line((-0.47, y), (-0.23, y)) }
  })
}
#let circle-diagram(auxiliary: false) = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (0, 0)
  let B = (3, 0)
  let E = (1, 0)
  let D = (2, -calc.sqrt(2))
  let C = (1 / 3, 2 * calc.sqrt(2) / 3)
  circle((1.5, 0), radius: 1.5)
  line(A, B, D)
  line(C, D)
  if auxiliary {
    line(A, D)
    line((2, 0), D, stroke: (dash: figure-style.dash))
    content((2, 0), $K$, anchor: "south", padding: 3pt)
  }
  for (p, label, anchor) in (
    (A, $A$, "east"),
    (B, $B$, "west"),
    (C, $C$, "south-east"),
    (D, $D$, "north-west"),
    (E, $E$, "south-west"),
  ) {
    content(p, label, anchor: anchor, padding: 3pt)
  }
})
#let solid() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((-0.4, -0.4), (1.15, 0), (0, 1), {
    let O = (0, 0, 0)
    let A = (-1, 1, 0)
    let B = (-1, -1, 0)
    let C = (1, -1, 0)
    let D = (1, 1, 0)
    let E = (-1, -1, 2)
    let F = (0, 0, 2)
    let G = (-1, 0, 0)
    let H = (-0.6, 0.6, 0.8)
    line(C, D, A, F, E, C)
    line(C, F, D)
    for (a, b) in (
      (A, B),
      (B, C),
      (B, E),
      (B, O),
      (O, F),
      (E, G),
      (E, A),
      (B, H),
    ) {
      line(a, b, stroke: (dash: figure-style.dash))
    }
    for (p, label, anchor) in (
      (A, $A$, "west"),
      (B, $B$, "south-east"),
      (C, $C$, "north-east"),
      (D, $D$, "north-west"),
      (E, $E$, "south-east"),
      (F, $F$, "south-west"),
      (G, $G$, "north-east"),
      (H, $H$, "south-west"),
      (O, $O$, "north-east"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})

#section[选择题：共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题意。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={1,2,3,4}$，$B={y|y=3x-2,x in A}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${1}$], [${4}$], [${1,3}$], [${1,4}$]),
  answers: ([D],),
  explanation: [依次代入 $x=1,2,3,4$，得 $B={1,4,7,10}$，故 $A inter B={1,4}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设变量 $x,y$ 满足约束条件 $cases(x-y+2>=0, 2x+3y-6>=0, 3x+2y-9<=0)$，则目标函数 $z=2x+5y$ 的最小值为#choice-placeholder()。],
  choices: ([$-4$], [$6$], [$10$], [$17$]),
  answers: ([B],),
  explanation: [由 $3(2x+3y)>=18$ 及 $2(3x+2y)<=18$，得 $5y>=0$。于是 $z=(2x+3y)+2y>=6$。
    当 $(x,y)=(3,0)$ 时满足全部约束且取等号，故最小值为 $6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在 $triangle A B C$ 中，若 $A B=sqrt(13),B C=3,angle C=120 degree$，则 $A C=$#choice-placeholder()。],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([A],),
  explanation: [设 $A C=t>0$。由余弦定理，$13=9+t^2-6t cos 120 degree=9+t^2+3t$，得 $(t-1)(t+4)=0$，故 $A C=1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [阅读如下的程序框图，运行相应的程序，则输出 $S$ 的值为#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$2$], [$4$], [$6$], [$8$]),
  answers: ([B],),
  explanation: [初始 $S=4,n=1$。第一次循环因 $S<6$，执行 $S=2S$，得 $S=8,n=2$；第二次因 $S>=6$，得 $S=2,n=3$；第三次因 $S<6$，得 $S=4,n=4$。此时 $n>3$，输出 $S=4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 ${a_n}$ 是首项为正数的等比数列，公比为 $q$，则“$q<0$”是“对任意的正整数 $n$，$a_(2n-1)+a_(2n)<0$”的#choice-placeholder()。],
  choices: (
    [充要条件],
    [充分而不必要条件],
    [必要而不充分条件],
    [既不充分也不必要条件],
  ),
  answers: ([C],),
  explanation: [因 $a_1>0$，且 $a_(2n-1)+a_(2n)=a_1 q^(2n-2)(1+q)$，后一个条件等价于 $q< -1$。
    $q< -1$ 必推出 $q<0$，反之不成立，例如 $q=-1/2$。故为必要而不充分条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $x^2/4-y^2/b^2=1$（$b>0$），以原点为圆心，双曲线的实半轴长为半径长的圆与双曲线的两条渐近线相交于 $A,B,C,D$ 四点，四边形 $A B C D$ 的面积为 $2b$，则双曲线的方程为#choice-placeholder()。],
  choices: (
    [$x^2/4-(3y^2)/4=1$],
    [$x^2/4-(4y^2)/3=1$],
    [$x^2/4-y^2/4=1$],
    [$x^2/4-y^2/12=1$],
  ),
  answers: ([D],),
  explanation: [设第一象限的交点为 $(u,v)$，则 $u^2+v^2=4$，$v=b u/2$，故 $u=4/sqrt(b^2+4)$，$v=(2b)/sqrt(b^2+4)$。
    四个交点组成的矩形面积为 $4u v=(32b)/(b^2+4)=2b$。因 $b>0$，解得 $b^2=12$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $triangle A B C$ 是边长为 $1$ 的等边三角形，点 $D,E$ 分别是边 $A B,B C$ 的中点，连接 $D E$ 并延长到点 $F$，使得 $D E=2E F$，则 $arrow(A F) dot arrow(B C)$ 的值为#choice-placeholder()。],
  choices: ([$-5/8$], [$1/8$], [$1/4$], [$11/8$]),
  answers: ([B],),
  explanation: [设 $bold(u)=arrow(B A)$，$bold(v)=arrow(B C)$，则 $abs(bold(u))=abs(bold(v))=1$，$bold(u) dot bold(v)=1/2$。
    由 $arrow(D E)=(bold(v)-bold(u))/2$，$arrow(D F)=3/2 arrow(D E)$，得
    $ arrow(A F)=-1/2 bold(u)+3/4 (bold(v)-bold(u))=-5/4 bold(u)+3/4 bold(v). $
    所以 $arrow(A F) dot arrow(B C)=-5/4 times 1/2+3/4=1/8$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=cases(x^2+(4a-3)x+3a & quad x<0, log_a (x+1)+1 & quad x>=0)$（$a>0$，且 $a!=1$）在 $RR$ 上单调递减，且关于 $x$ 的方程 $abs(f(x))=2-x$ 恰好有两个不相等的实数解，则 $a$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$(0,2/3]$],
    [$[2/3,3/4]$],
    [$[1/3,2/3] union {3/4}$],
    [$[1/3,2/3) union {3/4}$],
  ),
  answers: ([C],),
  explanation: [#step[由单调性限制参数][左段在 $x<0$ 上递减要求 $4a-3<=0$，右段递减要求 $0<a<1$，两段衔接要求 $3a>=f(0)=1$。故 $1/3<=a<=3/4$。]
    #step[非负半轴恰有一解][方程要求 $x<=2$。设 $r=1/a-1 in [1/3,2]$，则 $f(r)=0$。
      当 $0<=x<=r$ 时，方程等价于 $h(x)=log_a (1+x)+x-1=0$。因 $h''(x)=-1/((1+x)^2 ln a)>0$，$h$ 严格凸；而 $h(0)=-1$，$h(r)=r-2<=0$，故内部没有零点，仅当 $r=2$ 时右端点为零点。
      当 $r<=x<=2$ 时，方程等价于 $j(x)=x-3-log_a (1+x)=0$。因 $j'(x)=1-1/((1+x)ln a)>0$，且 $j(r)=r-2<=0$，$j(2)=-1-log_a 3>=0$，故恰有一解；$r=2$ 时两段的端点是同一个解。]
    #step[负半轴恰有一解][当 $x<0$ 时，$f(x)>0$，方程化为
      $ x^2+(4a-2)x+3a-2=0. $
      当 $1/3<=a<2/3$ 时，两根异号，恰有一个负根；当 $a=2/3$ 时，两根为 $0,-2/3$，仍恰有一个负根。
      当 $2/3<a<3/4$ 时，判别式 $Delta=4(4a-3)(a-1)>0$，两根之和为负、积为正，故有两个不同负根，不合题意。
      当 $a=3/4$ 时，方程为 $(x+1/2)^2=0$，仅有一个不同负根。
      综上，$a in [1/3,2/3] union {3/4}$。]],
)
#section[填空题：共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知 $a,b in RR$，$i$ 是虚数单位，若 $(1+i)(1-b i)=a$，则 $a/b$ 的值为#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [展开得 $(1+b)+(1-b)i=a$，比较实部与虚部得 $b=1,a=2$，故 $a/b=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [$(x^2-1/x)^8$ 的展开式中 $x^7$ 的系数为#fill-placeholder()。（用数字作答）],
  answers: ([$-56$],),
  explanation: [展开式的通项为 $T_(r+1)=C_8^r (x^2)^(8-r)(-1/x)^r=(-1)^r C_8^r x^(16-3r)$。
    令 $16-3r=7$，得 $r=3$，所求系数为 $-C_8^3=-56$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知一个四棱锥的底面是平行四边形，该四棱锥的三视图如图所示（单位：m），则该四棱锥的体积为#fill-placeholder()$"m"^3$。
    #figure(three-views())],
  answers: ([$2$],),
  explanation: [由俯视图，底面平行四边形的一边长为 $2$，该边上的高为 $1$，底面积为 $2$。由正视图得棱锥高为 $3$，故体积为 $V=1/3 times 2 times 3=2$（$"m"^3$）。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，$A B$ 是圆的直径，弦 $C D$ 与 $A B$ 相交于点 $E$，$B E=2A E=2$，$B D=E D$，则线段 $C E$ 的长为#fill-placeholder()。
    #figure(circle-diagram())],
  answers: ([$(2sqrt(3))/3$],),
  explanation: [过 $D$ 作 $D K perp A B$，垂足为 $K$，连接 $A D$。
    #figure(circle-diagram(auxiliary: true))
    由 $B D=E D$，得 $B K=E K=(B E)/2=1$，于是 $A K=2$。因 $A B$ 为直径，$angle A D B=90 degree$，由直角三角形斜边上的高的性质，$D K^2=A K dot B K=2$。
    故 $D E=sqrt(D K^2+E K^2)=sqrt(3)$。由相交弦定理，$C E dot D E=A E dot B E=2$，所以 $C E=2/sqrt(3)=(2sqrt(3))/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $f(x)$ 是定义在 $RR$ 上的偶函数，且在区间 $(-infinity,0)$ 上单调递增。若实数 $a$ 满足 $f(2^(abs(a-1)))>f(-sqrt(2))$，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$(1/2,3/2)$],),
  explanation: [由偶性，$f$ 在 $(0,+infinity)$ 上单调递减，且 $f(-sqrt(2))=f(sqrt(2))$。因此原不等式等价于 $2^(abs(a-1))<sqrt(2)=2^(1/2)$，即 $abs(a-1)<1/2$，解得 $1/2<a<3/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设抛物线 $cases(x=2p t^2, y=2p t)$（$t$ 为参数，$p>0$）的焦点为 $F$，准线为 $l$。过抛物线上一点 $A$ 作 $l$ 的垂线，垂足为 $B$。设 $C(7p/2,0)$，$A F$ 与 $B C$ 相交于点 $E$。若 $abs(C F)=2abs(A F)$，且 $triangle A C E$ 的面积为 $3sqrt(2)$，则 $p$ 的值为#fill-placeholder()。],
  answers: ([$sqrt(6)$],),
  explanation: [消去参数得 $y^2=2p x$，故 $F(p/2,0)$，准线为 $x=-p/2$，$C F=3p$。
    由抛物线定义，$A B=A F=3p/2$，得 $x_A=p$，$abs(y_A)=sqrt(2)p$。
    $A B parallel C F$，且 $A,B$ 在 $x$ 轴同侧，所以 $E$ 在线段 $A F$ 内，由相似三角形得 $(E F)/(E A)=(C F)/(A B)=2$。
    于是 $S_(triangle A C E)=1/3 S_(triangle A C F)=1/3 times 1/2 times 3p times sqrt(2)p=(sqrt(2)p^2)/2$。
    由其等于 $3sqrt(2)$ 及 $p>0$，得 $p=sqrt(6)$。],
)

#section[解答题：共 6 小题，共 80 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [已知函数 $f(x)=4tan x sin(pi/2-x)cos(x-pi/3)-sqrt(3)$。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的定义域与最小正周期；],
      answers: (
        [定义域为 $RR without {pi/2+k pi|k in ZZ}$，最小正周期为 $pi$。],
      ),
      explanation: [原式要求 $cos x!=0$，故定义域为 $RR without {pi/2+k pi|k in ZZ}$。在此定义域内，
        $ f(x)=4sin x cos(x-pi/3)-sqrt(3) $
        $ =sin 2x-sqrt(3)cos 2x=2sin(2x-pi/3). $
        此定义域在平移 $pi$ 后不变，且上式的最小正周期为 $pi$，故原函数最小正周期为 $pi$。],
    ),
    subquestion(
      stem: [讨论 $f(x)$ 在区间 $[-pi/4,pi/4]$ 上的单调性。],
      answers: ([在 $[-pi/4,-pi/12]$ 上递减，在 $[-pi/12,pi/4]$ 上递增。],),
      explanation: [当 $x in [-pi/4,pi/4]$ 时，$2x-pi/3 in [-(5pi)/6,pi/6]$。正弦函数在 $[-(5pi)/6,-pi/2]$ 上递减，在 $[-pi/2,pi/6]$ 上递增。
        由 $2x-pi/3=-pi/2$ 得 $x=-pi/12$，故所求递减区间为 $[-pi/4,-pi/12]$，递增区间为 $[-pi/12,pi/4]$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [某小组共 10 人，利用假期参加义工活动，已知参加义工活动次数为 $1,2,3$ 的人数分别为 $3,3,4$。现从这 10 人中随机选出 2 人作为该组代表参加座谈会。],
  parts: (
    subquestion(
      stem: [设 $A$ 为事件“选出的 2 人参加义工活动次数之和为 4”，求事件 $A$ 发生的概率；],
      answers: ([$P(A)=1/3$],),
      explanation: [共有 $C_10^2=45$ 种等可能的选法。次数之和为 4 的情形为选出 1 次和 3 次的各一人，或选出 2 次的两人，故
        $ P(A)=(C_3^1 C_4^1+C_3^2)/C_10^2=(12+3)/45=1/3. $],
    ),
    subquestion(
      stem: [设 $X$ 为选出的 2 人参加义工活动次数之差的绝对值，求随机变量 $X$ 的分布列和数学期望。],
      answers: (
        [
          #table(
            columns: 4,
            align: center,
            [$X$], [$0$], [$1$], [$2$],
            [$P$], [$4/15$], [$7/15$], [$4/15$],
          )
          $E(X)=1$。],
      ),
      explanation: [$X$ 的可能取值为 $0,1,2$，分别对应次数相同、相差一次、相差两次。由组合计数得
        $ P(X=0)=(C_3^2+C_3^2+C_4^2)/C_10^2=4/15, $
        $ P(X=1)=(C_3^1 C_3^1+C_3^1 C_4^1)/C_10^2=7/15, $
        $ P(X=2)=(C_3^1 C_4^1)/C_10^2=4/15. $
        因此分布列如答案，数学期望为 $E(X)=0 times 4/15+1 times 7/15+2 times 4/15=1$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [如图，正方形 $A B C D$ 的中心为 $O$，四边形 $O B E F$ 为矩形，平面 $O B E F perp$ 平面 $A B C D$，点 $G$ 为 $A B$ 的中点，$A B=B E=2$。
    #figure(solid())],
  parts: (
    subquestion(
      stem: [求证：$E G parallel$ 平面 $A D F$；],
      answers: ([证明见解析。],),
      explanation: [矩形中 $O F perp O B$。由两平面垂直且交线为 $O B$，得 $O F perp$ 平面 $A B C D$。
        以 $O$ 为原点，分别以 $arrow(A D),arrow(B A),arrow(O F)$ 的方向为 $x,y,z$ 轴正方向，建立空间直角坐标系，则
        $ A=(-1,1,0), quad B=(-1,-1,0), quad C=(1,-1,0), $
        $ D=(1,1,0), quad E=(-1,-1,2), quad F=(0,0,2), quad G=(-1,0,0). $
        平面 $A D F$ 的一个法向量为 $bold(n)_1=(0,2,1)$，平面方程为 $2y+z=2$。
        又 $arrow(E G)=(0,1,-2)$，故 $bold(n)_1 dot arrow(E G)=0$。点 $E$ 不满足该平面方程，故 $E G parallel$ 平面 $A D F$。],
    ),
    subquestion(
      stem: [求二面角 $O-E F-C$ 的正弦值；],
      answers: ([$sqrt(3)/3$],),
      explanation: [沿用第 (1) 问的坐标，平面 $O E F$ 的法向量可取 $bold(m)=(-1,1,0)$；由 $arrow(E F)=(1,1,0)$，$arrow(C F)=(-1,1,2)$，平面 $C E F$ 的法向量可取 $bold(n)=(1,-1,1)$。
        设两法向量夹角为 $phi$，则 $abs(cos phi)=abs(bold(m) dot bold(n))/(abs(bold(m))abs(bold(n)))=2/sqrt(6)$。
        法向量夹角与所求二面角相等或互补，所以所求正弦值为 $sqrt(1-4/6)=sqrt(3)/3$。],
    ),
    subquestion(
      stem: [设 $H$ 为线段 $A F$ 上的点，且 $A H=2/3 H F$，求直线 $B H$ 和平面 $C E F$ 所成角的正弦值。],
      answers: ([$sqrt(7)/21$],),
      explanation: [由 $A H=2/3 H F$，得 $arrow(A H)=2/5 arrow(A F)$，故 $H=(-3/5,3/5,4/5)$，$arrow(B H)=(2/5,8/5,4/5)$。
        取平面 $C E F$ 的法向量 $bold(n)=(1,-1,1)$，若线面角为 $theta$，则
        $ sin theta=abs(arrow(B H) dot bold(n))/(abs(arrow(B H))abs(bold(n))) $
        $ =(2/5)/((2sqrt(21))/5 times sqrt(3))=sqrt(7)/21. $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知 ${a_n}$ 是各项均为正数的等差数列，公差为 $d$，对任意的 $n in NN^*$，$b_n$ 是 $a_n$ 和 $a_(n+1)$ 的等比中项。],
  parts: (
    subquestion(
      stem: [设 $c_n=b_(n+1)^2-b_n^2$，$n in NN^*$，求证：数列 ${c_n}$ 是等差数列；],
      answers: ([证明见解析，公差为 $2d^2$。],),
      explanation: [由等比中项定义，$b_n^2=a_n a_(n+1)$，从而
        $ c_n=a_(n+1)a_(n+2)-a_n a_(n+1)=2d a_(n+1). $
        故 $c_(n+1)-c_n=2d(a_(n+2)-a_(n+1))=2d^2$，为常数，因此 ${c_n}$ 是等差数列。],
    ),
    subquestion(
      stem: [设 $a_1=d$，$T_n=sum_(k=1)^(2n)(-1)^k b_k^2$，$n in NN^*$，求证：$sum_(k=1)^n 1/T_k<1/(2d^2)$。],
      answers: ([证明见解析。],),
      explanation: [因 $a_1=d>0$，有 $a_n=n d$。将相邻两项配对，利用第 (1) 问，得
        $ T_n=sum_(j=1)^n (b_(2j)^2-b_(2j-1)^2)=sum_(j=1)^n 2d a_(2j) $
        $ =4d^2 sum_(j=1)^n j=2d^2 n(n+1). $
        因此裂项相消得
        $ sum_(k=1)^n 1/T_k=1/(2d^2) sum_(k=1)^n (1/k-1/(k+1)) $
        $ =1/(2d^2)(1-1/(n+1))<1/(2d^2). $],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设椭圆 $x^2/a^2+y^2/3=1$（$a>sqrt(3)$）的右焦点为 $F$，右顶点为 $A$。已知 $1/abs(O F)+1/abs(O A)=(3e)/abs(F A)$，其中 $O$ 为原点，$e$ 为椭圆的离心率。],
  parts: (
    subquestion(
      stem: [求椭圆的方程；],
      answers: ([$x^2/4+y^2/3=1$],),
      explanation: [设半焦距为 $c>0$，则 $e=c/a$，题设等式为 $1/c+1/a=(3c)/(a(a-c))$。
        化简得 $a^2-c^2=3c^2$。又 $a^2-c^2=3$，故 $c=1,a=2$，椭圆方程为 $x^2/4+y^2/3=1$。],
    ),
    subquestion(
      stem: [设过点 $A$ 的直线 $l$ 与椭圆交于点 $B$（$B$ 不在 $x$ 轴上），垂直于 $l$ 的直线与 $l$ 交于点 $M$，与 $y$ 轴交于点 $H$。若 $B F perp H F$，且 $angle M O A<=angle M A O$，求直线 $l$ 的斜率的取值范围。],
      answers: ([$(-infinity,-sqrt(6)/4] union [sqrt(6)/4,+infinity)$],),
      explanation: [过 $A(2,0)$ 的竖直线为椭圆的切线，不能交于另一点 $B$，故 $l$ 的斜率存在；又 $B$ 不在 $x$ 轴上，故斜率 $k!=0$。设 $l:y=k(x-2)$，与椭圆联立，得
        $ (4k^2+3)x^2-16k^2 x+16k^2-12=0. $
        一根为 $2$，由另一根得
        $ B=((8k^2-6)/(4k^2+3),(-12k)/(4k^2+3)). $
        设 $H=(0,h)$。由 $F=(1,0)$ 及 $B F perp H F$，得
        $ (x_B-1,y_B) dot (-1,h)=0, quad h=(9-4k^2)/(12k). $
        故 $M H:y=-x/k+(9-4k^2)/(12k)$。与 $l$ 联立，得
        $ x_M=(20k^2+9)/(12(k^2+1)). $
        此值在 $0$ 与 $2$ 之间，且 $y_M=k(x_M-2)!=0$，故 $triangle M O A$ 非退化。
        由三角形中大角对大边，题设角条件等价于 $M A<=M O$，即
        $ (x_M-2)^2+y_M^2<=x_M^2+y_M^2, quad x_M>=1. $
        代入得 $20k^2+9>=12k^2+12$，即 $k^2>=3/8$。
        反之，满足此范围的每个 $k$ 均非零，上述构造给出符合题意的 $B,H,M$。故所求范围为 $(-infinity,-sqrt(6)/4] union [sqrt(6)/4,+infinity)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设函数 $f(x)=(x-1)^3-a x-b$，$x in RR$，其中 $a,b in RR$。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的单调区间；],
      answers: (
        [当 $a<=0$ 时，在 $RR$ 上递增，无递减区间。
          当 $a>0$ 时，递增区间为
          $ (-infinity,1-sqrt(a/3)), quad (1+sqrt(a/3),+infinity). $
          递减区间为 $(1-sqrt(a/3),1+sqrt(a/3))$。],
      ),
      explanation: [求导得 $f'(x)=3(x-1)^2-a$。
        若 $a<=0$，导数非负且至多一处为零，故 $f$ 在 $RR$ 上严格递增。
        若 $a>0$，导数的两个零点为 $1-sqrt(a/3)$、$1+sqrt(a/3)$。导数在两零点外侧为正、内侧为负，故单调区间如答案。],
    ),
    subquestion(
      stem: [若 $f(x)$ 存在极值点 $x_0$，且 $f(x_1)=f(x_0)$，其中 $x_1!=x_0$，求证：$x_1+2x_0=3$；],
      answers: ([证明见解析。],),
      explanation: [由 $f'(x_0)=0$，得 $a=3(x_0-1)^2$。令 $t=x-1$，$t_0=x_0-1$，则
        $ f(x)-f(x_0)=t^3-t_0^3-3t_0^2(t-t_0)=(t-t_0)^2(t+2t_0). $
        取 $x=x_1$，因 $f(x_1)=f(x_0)$ 且 $x_1!=x_0$，得 $(x_1-1)+2(x_0-1)=0$，即 $x_1+2x_0=3$。],
    ),
    subquestion(
      stem: [设 $a>0$，函数 $g(x)=abs(f(x))$，求证：$g(x)$ 在区间 $[0,2]$ 上的最大值不小于 $1/4$。],
      answers: ([证明见解析。],),
      explanation: [记 $M=max_(x in [0,2]) abs(f(x))$，连续性保证此最大值存在。取区间内四点，直接计算得
        $ f(2)-f(0)=2-2a, quad f(3/2)-f(1/2)=1/4-a. $
        消去 $a$，得到
        $ f(2)-f(0)-2f(3/2)+2f(1/2)=3/2. $
        由三角不等式，
        $ 3/2<=abs(f(2))+abs(f(0))+2abs(f(3/2))+2abs(f(1/2))<=6M. $
        因此 $M>=1/4$，结论成立。],
    ),
  ),
)
