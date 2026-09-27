#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "浙江卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016浙江理.pdf",
  regions: ("浙江",),
)
#let point-sequences() = {
  set text(size: 9pt)
  cetz.canvas(length: 11mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let xs = (0.8, 1.55, 2.3, 4.2, 4.95)
    let a(x) = (x, 0.45 * x + 0.7)
    let b(x) = (1.15 * x + 0.05, 0)
    for i in (0, 1, 3) {
      line(
        a(xs.at(i)),
        b(xs.at(i)),
        b(xs.at(i + 1)),
        close: true,
        fill: luma(90%),
        stroke: none,
      )
    }
    line((0.1, 0), (6.1, 0))
    line(a(0.1), a(5.6))
    for (i, x) in xs.enumerate() {
      line(a(x), b(x))
      if i in (0, 1, 3) { line(a(x), b(xs.at(i + 1))) }
      let suffix = ([$1$], [$2$], [$3$], [$n$], [$n+1$]).at(i)
      content(a(x), $A_#suffix$, anchor: "south-east", padding: 0.08)
      content(b(x), $B_#suffix$, anchor: "north", padding: 0.08)
    }
    for (x, label) in ((1.26, $S_1$), (2.09, $S_2$), (5.05, $S_n$)) {
      content((x, 0.28), label)
    }
    content((3.2, -0.17), $dots$)
    content(a(3.2), $dots$, anchor: "south", padding: 0.1)
  })
}

#let three-views() = {
  set text(size: 9pt)
  cetz.canvas(length: 7mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    line((0, 0), (4, 0), (4, 4), (2, 4), (2, 2), (0, 2), close: true)
    line((2, 0), (2, 2))
    line((6, 0), (10, 0), (10, 2), (8, 2), (8, 4), (6, 4), close: true)
    line((6, 2), (8, 2))
    line((8, 0), (8, 2), stroke: (dash: figure-style.dash))
    line((0, -6), (2, -6), (2, -4), (4, -4), (4, -2), (0, -2), close: true)
    line((2, -4), (2, -2))
    for (x, label) in ((2, [正视图]), (8, [侧视图])) {
      content((x, -0.5), label, anchor: "north")
    }
    content((2, -6.5), [俯视图], anchor: "north")
    for x in (0, 2, 6, 8) {
      line((x, 4.4), (x + 2, 4.4), mark: (start: ">", end: ">"))
      content((x + 1, 4.5), $2$, anchor: "south")
    }
    for x in (0, 2, 4, 6, 8, 10) { line((x, 4.15), (x, 4.65)) }
    for y in (0, 2) {
      line((4.55, y), (4.55, y + 2), mark: (start: ">", end: ">"))
      content((4.75, y + 1), $2$, anchor: "west")
    }
    for y in (0, 2, 4) { line((4.2, y), (4.8, y)) }
  })
}

#let tetrahedron() = {
  set text(size: 9pt)
  cetz.canvas(length: 16mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    oblique-project((0.8, 0.65), (1, -0.65 * calc.sqrt(3)), (-0.08, 0.6), {
      let a = (0, 0, 0)
      let b = (calc.sqrt(3), 1, 0)
      let c = (2 * calc.sqrt(3), 0, 0)
      let d = (calc.sqrt(3), 0, 0)
      let p = (calc.sqrt(3), 0, calc.sqrt(3))
      line(a, b, c, p, d, a)
      line(d, b, p)
      line(d, c, stroke: (dash: figure-style.dash))
      for (pt, label, anchor) in (
        (a, $A$, "north-east"),
        (b, $B$, "north-west"),
        (c, $C$, "south-west"),
        (d, $D$, "east"),
        (p, $P$, "south-east"),
      ) {
        content(pt, label, anchor: anchor, padding: 0.1)
      }
    })
  })
}

#let frustum(auxiliary: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 17mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    oblique-project((-1, 0), (-0.45, -0.6), (-0.12, 1.4), {
      let a = (3, 0, 0)
      let b = (0, 2, 0)
      let c = (0, 0, 0)
      let d = (1.5, 0.5, calc.sqrt(3) / 2)
      let e = (0, 1.5, calc.sqrt(3) / 2)
      let f = (0, 0.5, calc.sqrt(3) / 2)
      line(a, b, c, f, d, a)
      line(d, e, f)
      line(b, e)
      line(b, f)
      line(a, c, stroke: (dash: figure-style.dash))
      for (pt, label, anchor) in (
        (a, $A$, "east"),
        (b, $B$, "north"),
        (c, $C$, "west"),
        (d, $D$, "south-east"),
        (e, $E$, if auxiliary { "west" } else { "east" }),
        (f, $F$, "west"),
      ) {
        content(pt, label, anchor: anchor, padding: 0.1)
      }
      if auxiliary {
        let k = (0, 1, calc.sqrt(3))
        let q = (6 / 13, 11 / 13, 11 * calc.sqrt(3) / 13)
        line(d, k, f)
        line(e, k)
        line(f, q, b, stroke: (dash: figure-style.dash))
        content(k, $K$, anchor: "south", padding: 0.1)
        content(q, $Q$, anchor: "east", padding: 0.12)
      }
    })
  })
}

#let ellipse-diagram() = {
  set text(size: 9pt)
  cetz.canvas(length: 12mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $O$,
      tick: (stroke: figure-style.thickness, length: 0),
    ))
    plot.plot(
      size: (5.2, 3.4),
      x-min: -2.5,
      x-max: 2.7,
      y-min: -1.6,
      y-max: 1.8,
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "school-book",
      {
        plot.annotate(resize: false, {
          line(
            ..range(181).map(i => (2 * calc.cos(i * 2deg), calc.sin(i * 2deg))),
          )
          content((0.08, 1.12), $A$, anchor: "south-west")
        })
      },
    )
  })
}

#section[选择题：共 8 小题，每小题 5 分，共 40 分。每小题给出的四个选项中，只有一项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $P={x in RR | 1<=x<=3}$，$Q={x in RR | x^2>=4}$，则 $P union (complement_RR Q)=$#choice-placeholder()。],
  choices: (
    [$[2,3]$],
    [$(-2,3]$],
    [$[1,2)$],
    [$(-infinity,-2] union [1,+infinity)$],
  ),
  answers: ([B],),
  explanation: [由 $Q=(-infinity,-2] union [2,+infinity)$，得 $complement_RR Q=(-2,2)$。因此 $P union (complement_RR Q)=(-2,3]$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知互相垂直的平面 $alpha,beta$ 交于直线 $l$。若直线 $m,n$ 满足 $m parallel alpha$，$n perp beta$，则#choice-placeholder()。],
  choices: ([$m parallel l$], [$m parallel n$], [$n perp l$], [$m perp n$]),
  answers: ([C],),
  explanation: [因 $l subset beta$，$n perp beta$，故 $n perp l$，选 C。$m parallel alpha$ 不能确定 $m$ 与 $l,n$ 的方向关系，其余结论均不一定成立。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在平面上，过点 $P$ 作直线 $l$ 的垂线所得的垂足称为点 $P$ 在直线 $l$ 上的投影。由区域 $cases(x-2<=0, x+y>=0, x-3y+4>=0)$ 中的点在直线 $x+y-2=0$ 上的投影构成的线段记为 $A B$，则 $abs(A B)=$#choice-placeholder()。],
  choices: ([$2sqrt(2)$], [$4$], [$3sqrt(2)$], [$6$]),
  answers: ([C],),
  explanation: [可行域为顶点 $(-1,1),(2,-2),(2,2)$ 构成的三角形。沿投影直线的单位方向向量 $(1/sqrt(2),-1/sqrt(2))$，投影坐标为 $(x-y)/sqrt(2)$。
    线性函数 $x-y$ 在三个顶点的值分别为 $-2,4,0$，故投影线段长为 $(4-(-2))/sqrt(2)=3sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [命题“$forall x in RR, exists n in NN^*$，使得 $n>=x^2$”的否定形式是#choice-placeholder()。],
  choices: (
    [ $forall x in RR, exists n in NN^*$，使得 $n<x^2$ ],
    [ $forall x in RR, forall n in NN^*$，使得 $n<x^2$ ],
    [ $exists x in RR, exists n in NN^*$，使得 $n<x^2$ ],
    [ $exists x in RR, forall n in NN^*$，使得 $n<x^2$ ],
  ),
  answers: ([D],),
  explanation: [依次将全称量词改为存在量词、存在量词改为全称量词，并否定结论，得“$exists x in RR, forall n in NN^*$，使得 $n<x^2$”。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=sin^2 x+b sin x+c$，则 $f(x)$ 的最小正周期#choice-placeholder()。],
  choices: (
    [与 $b$ 有关，且与 $c$ 有关],
    [与 $b$ 有关，但与 $c$ 无关],
    [与 $b$ 无关，且与 $c$ 无关],
    [与 $b$ 无关，但与 $c$ 有关],
  ),
  answers: ([B],),
  explanation: [将函数写为 $f(x)=-1/2 cos 2x+b sin x+c+1/2$。当 $b=0$ 时，最小正周期为 $pi$；当 $b!=0$ 时，最小正周期为 $2pi$。常数 $c$ 只使图象上下平移，不改变周期。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，点列 ${A_n}$，${B_n}$ 分别在某锐角的两边上，且 $abs(A_n A_(n+1))=abs(A_(n+1) A_(n+2))$，$A_n!=A_(n+2)$，$n in NN^*$，$abs(B_n B_(n+1))=abs(B_(n+1) B_(n+2))$，$B_n!=B_(n+2)$，$n in NN^*$（$P!=Q$ 表示点 $P$ 与 $Q$ 不重合）。若 $d_n=abs(A_n B_n)$，$S_n$ 为 $triangle A_n B_n B_(n+1)$ 的面积，则#choice-placeholder()。
    #figure(point-sequences())],
  choices: (
    [${S_n}$ 是等差数列],
    [${S_n^2}$ 是等差数列],
    [${d_n}$ 是等差数列],
    [${d_n^2}$ 是等差数列],
  ),
  answers: ([A],),
  explanation: [相邻距离相等且不折返，点列沿各自射线等距递进。设 $abs(A_n A_(n+1))=p>0$，$abs(B_n B_(n+1))=q>0$，两射线夹角为 $theta$。若 $A_n$ 到另一边所在直线的距离为 $h_n$，则
    $ h_(n+1)-h_n=p sin theta, quad S_n=1/2 q h_n. $
    故 $S_(n+1)-S_n=1/2 p q sin theta$ 为常数，${S_n}$ 为等差数列。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知椭圆 $C_1:x^2/m^2+y^2=1$（$m>1$）与双曲线 $C_2:x^2/n^2-y^2=1$（$n>0$）的焦点重合，$e_1,e_2$ 分别为 $C_1,C_2$ 的离心率，则#choice-placeholder()。],
  choices: (
    [$m>n$ 且 $e_1 e_2>1$],
    [$m>n$ 且 $e_1 e_2<1$],
    [$m<n$ 且 $e_1 e_2>1$],
    [$m<n$ 且 $e_1 e_2<1$],
  ),
  answers: ([A],),
  explanation: [由焦点重合，得 $m^2-1=n^2+1$，故 $m^2=n^2+2$，从而 $m>n$。又
    $ (e_1 e_2)^2=((n^2+1)^2)/(n^2(n^2+2))=1+1/(n^2(n^2+2))>1. $
    因 $e_1,e_2>0$，故 $e_1 e_2>1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知实数 $a,b,c$，下列结论正确的是#choice-placeholder()。],
  choices: (
    [若 $abs(a^2+b+c)+abs(a+b^2+c)<=1$，则 $a^2+b^2+c^2<100$],
    [若 $abs(a^2+b+c)+abs(a^2+b-c)<=1$，则 $a^2+b^2+c^2<100$],
    [若 $abs(a+b+c^2)+abs(a+b-c^2)<=1$，则 $a^2+b^2+c^2<100$],
    [若 $abs(a^2+b+c)+abs(a+b^2-c)<=1$，则 $a^2+b^2+c^2<100$],
  ),
  answers: ([D],),
  explanation: [
    #step[选项 A、B、C][分别取 $(a,b,c)=(10,10,-110)$、$(10,-100,0)$、$(100,-100,0)$，各选项中的条件均成立，但 $a^2+b^2+c^2>100$，故均错误。]
    #step[选项 D][由三角不等式，$abs(a^2+a+b^2+b)<=1$，所以
      $ (a+1/2)^2+(b+1/2)^2<=3/2. $
      因此 $abs(a),abs(b)<=1/2+sqrt(3/2)<2$。又 $abs(a^2+b+c)<=1$，故 $abs(c)<=1+a^2+abs(b)<7$。
      于是 $a^2+b^2+c^2<4+4+49=57<100$，D 正确。]
  ],
)
#section[填空题：共 7 小题，多空题每题 6 分，单空题每题 4 分，共 36 分。]
#question(
  "fill-in",
  score: 4,
  stem: [若抛物线 $y^2=4x$ 上的点 $M$ 到焦点的距离为 $10$，则 $M$ 到 $y$ 轴的距离是#fill-placeholder()。],
  answers: ([$9$],),
  explanation: [抛物线准线为 $x=-1$。由抛物线定义，$x_M+1=10$，得 $x_M=9$，故到 $y$ 轴的距离为 $9$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知 $2cos^2 x+sin 2x=A sin(omega x+phi)+b$（$A>0$），则 $A=$#fill-placeholder()，$b=$#fill-placeholder()。],
  answers: ([$sqrt(2)$], [$1$]),
  explanation: [由 $2cos^2 x+sin 2x=1+cos 2x+sin 2x=sqrt(2)sin(2x+pi/4)+1$，得 $A=sqrt(2),b=1$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [某几何体的三视图如图所示（单位：cm），则该几何体的表面积是#fill-placeholder()$"cm"^2$，体积是#fill-placeholder()$"cm"^3$。
    #figure(three-views())],
  answers: ([$72$], [$32$]),
  explanation: [由三视图还原，几何体由四个棱长为 $2$ cm 的小正方体组成，共有三处完整面相接。每处接合使两个面不再外露，故
    $ S=(4 times 6-2 times 3)times 2^2=72 ("cm"^2), $
    $ V=4 times 2^3=32 ("cm"^3). $],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知 $a>b>1$。若 $log_a b+log_b a=5/2$，$a^b=b^a$，则 $a=$#fill-placeholder()，$b=$#fill-placeholder()。],
  answers: ([$4$], [$2$]),
  explanation: [令 $t=log_b a>1$，则 $t+1/t=5/2$，解得 $t=2$（另一根 $1/2$ 舍去），故 $a=b^2$。代入 $a^b=b^a$，得 $b^(2b)=b^(b^2)$。由 $b>1$，有 $2b=b^2$，所以 $b=2,a=4$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [设数列 ${a_n}$ 的前 $n$ 项和为 $S_n$。若 $S_2=4$，$a_(n+1)=2S_n+1$，$n in NN^*$，则 $a_1=$#fill-placeholder()，$S_5=$#fill-placeholder()。],
  answers: ([$1$], [$121$]),
  explanation: [由 $a_1+a_2=4$，$a_2=2a_1+1$，得 $a_1=1,a_2=3$。当 $n>=2$ 时，两式相减得 $a_(n+1)-a_n=2(S_n-S_(n-1))=2a_n$，即 $a_(n+1)=3a_n$。又 $a_2=3a_1$，故 $a_n=3^(n-1)$，$S_5=(3^5-1)/2=121$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [如图，在 $triangle A B C$ 中，$A B=B C=2$，$angle A B C=120 degree$。若平面 $A B C$ 外的点 $P$ 和线段 $A C$ 上的点 $D$，满足 $P D=D A$，$P B=B A$，则四面体 $P B C D$ 的体积的最大值是#fill-placeholder()。
    #figure(tetrahedron())],
  answers: ([$1/2$],),
  explanation: [由余弦定理，$A C=2sqrt(3)$，$angle B A C=angle B C A=30 degree$。设 $A D=x$，则 $0<x<2sqrt(3)$，并有
    $ B D^2=x^2-2sqrt(3)x+4=(x-sqrt(3))^2+1. $
    因 $P D=A D,P B=A B$，$triangle P B D$ 与 $triangle A B D$ 全等。故 $P$ 到 $B D$ 的距离为 $x/(B D)$。点 $P$ 到平面 $A B C$ 的距离不超过该值，且
    $ S_(triangle B C D)=1/2 (2sqrt(3)-x). $
    于是
    $ V_(P B C D)<=x(2sqrt(3)-x)/(6sqrt((x-sqrt(3))^2+1))<=3/6=1/2. $
    这里分子 $x(2sqrt(3)-x)=3-(x-sqrt(3))^2<=3$，分母中的根式不小于 $1$。
    当 $D$ 为 $A C$ 的中点，在过 $D$ 垂直于平面 $A B C$ 的直线上取 $P D=sqrt(3)$ 时，有 $P B=2$，所有等号同时成立，故最大值为 $1/2$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知向量 $bold(a),bold(b)$，$abs(bold(a))=1$，$abs(bold(b))=2$。若对任意单位向量 $bold(e)$，均有 $abs(bold(a) dot bold(e))+abs(bold(b) dot bold(e))<=sqrt(6)$，则 $bold(a) dot bold(b)$ 的最大值是#fill-placeholder()。],
  answers: ([$1/2$],),
  explanation: [取 $bold(e)=(bold(a)+bold(b))/abs(bold(a)+bold(b))$，由三角不等式得
    $
      abs(bold(a)+bold(b))=(bold(a)+bold(b))dot bold(e)<=abs(bold(a)dot bold(e))+abs(bold(b)dot bold(e))<=sqrt(6).
    $
    平方后得 $5+2bold(a)dot bold(b)<=6$，所以 $bold(a)dot bold(b)<=1/2$。
    还须验证此界可以取到。取长度分别为 $1,2$、夹角余弦为 $1/4$ 的两向量，则其数量积为 $1/2$，且 $abs(bold(a)+bold(b))=sqrt(6)$、$abs(bold(a)-bold(b))=2$。
    对任意单位向量 $bold(e)$，有
    $
      abs(bold(a)dot bold(e))+abs(bold(b)dot bold(e)) = max{abs((bold(a)+bold(b))dot bold(e)),abs((bold(a)-bold(b))dot bold(e))} <=sqrt(6).
    $
    故所求最大值为 $1/2$。],
)
#section[解答题：共 5 小题，共 74 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [在 $triangle A B C$ 中，内角 $A,B,C$ 所对的边分别为 $a,b,c$。已知 $b+c=2a cos B$。],
  parts: (
    subquestion(
      stem: [证明：$A=2B$；],
      answers: ([证明见解析。],),
      explanation: [由正弦定理，$sin B+sin C=2sin A cos B$。将 $sin C=sin(A+B)$ 代入并整理，得
        $ sin B=sin A cos B-cos A sin B=sin(A-B). $
        因 $-pi<A-B<pi$ 且 $sin B>0$，所以 $0<A-B<pi$。故 $B=A-B$ 或 $B=pi-(A-B)$。后者给出 $A=pi$，不合题意，故 $A=2B$。],
    ),
    subquestion(
      stem: [若 $triangle A B C$ 的面积 $S=a^2/4$，求角 $A$ 的大小。],
      answers: ([$pi/2$ 或 $pi/4$],),
      explanation: [由 $1/2 a b sin C=a^2/4$ 及正弦定理，得 $2sin B sin C=sin A=sin 2B$，所以 $sin C=cos B$。由 $A=2B$ 及内角和，知 $0<B<pi/3$，故 $C=pi/2-B$ 或 $C=pi/2+B$。
        前者结合 $A+B+C=pi$ 给出 $A=pi/2$；后者结合 $A=2B$ 给出 $B=pi/8,A=pi/4$。两者均满足三角形内角条件。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，在三棱台 $A B C-D E F$ 中，平面 $B C F E perp$ 平面 $A B C$，$angle A C B=90 degree$，$B E=E F=F C=1$，$B C=2$，$A C=3$。
    #figure(frustum())],
  parts: (
    subquestion(
      stem: [求证：$B F perp$ 平面 $A C F D$；],
      answers: ([证明见解析。],),
      explanation: [延长 $A D,B E,C F$，交于点 $K$。
        #figure(frustum(auxiliary: true))
        因两个平面垂直、交线为 $B C$，且 $A C perp B C$，得 $A C perp$ 平面 $B C F E$，所以 $A C perp B F$。
        由 $E F parallel B C$ 和 $(E F)/(B C)=1/2$，得 $(K E)/(K B)=(K F)/(K C)=1/2$。故 $K B=2B E=2$，$K C=2F C=2$。
        因此 $triangle K B C$ 为等边三角形，$F$ 是 $K C$ 的中点，故 $B F perp K C$。
        $A C,K C$ 是平面 $A C F D$ 内相交于 $C$ 的两条直线，故 $B F perp$ 平面 $A C F D$。],
    ),
    subquestion(
      stem: [求二面角 $B-A D-F$ 的平面角的余弦值。],
      answers: ([$sqrt(3)/4$],),
      explanation: [沿用上图，过 $F$ 作 $F Q perp A K$，垂足为 $Q$，连接 $B Q$。由第 (1) 问，$B F perp$ 平面 $A C K$，故 $B F perp A K$，又 $F Q perp A K$，从而 $A K perp$ 平面 $B F Q$，所以 $B Q perp A K$。
        因此 $angle B Q F$ 为所求二面角的平面角。
        在直角三角形 $A C K$ 中，$A C=3,K C=2$，故 $A K=sqrt(13)$，$sin angle A K C=3/sqrt(13)$。又 $K F=1$，所以
        $ F Q=K F sin angle A K C=3/sqrt(13). $
        在等边三角形 $K B C$ 中，$B F=sqrt(3)$，且 $B F perp F Q$，于是
        $
          B Q=sqrt(3+9/13)=sqrt(48/13), quad cos angle B Q F=(F Q)/(B Q)=sqrt(3)/4.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知 $a>=3$，函数 $F(x)=min{2abs(x-1),x^2-2a x+4a-2}$，其中
    $ min{p,q}=cases(p & quad p<=q, q & quad p>q). $],
  parts: (
    subquestion(
      stem: [求使得等式 $F(x)=x^2-2a x+4a-2$ 成立的 $x$ 的取值范围；],
      answers: ([$[2,2a]$],),
      explanation: [设 $f(x)=2abs(x-1)$，$g(x)=x^2-2a x+4a-2$。所求条件等价于 $g(x)<=f(x)$。
        当 $x<=1$ 时，$g(x)-f(x)=x^2+2(a-1)(2-x)>0$；当 $x>1$ 时，$g(x)-f(x)=(x-2)(x-2a)$。
        因 $a>=3$，故所求范围为 $[2,2a]$。],
    ),
    subquestion(parts: (
      subquestion(
        stem: [求 $F(x)$ 的最小值 $m(a)$；],
        answers: (
          [$m(a)=cases(0 & quad 3<=a<=2+sqrt(2), -a^2+4a-2 & quad a>2+sqrt(2))$],
        ),
        explanation: [由 $f(x)>=f(1)=0$，$g(x)>=g(a)=-a^2+4a-2$，知 $F(x)>=min{0,-a^2+4a-2}$，且在 $x=1$ 或 $x=a$ 处可取到较小值。
          因 $a>=3$，$-a^2+4a-2>=0$ 等价于 $a<=2+sqrt(2)$，故
          $
            m(a)=cases(0 & quad 3<=a<=2+sqrt(2), -a^2+4a-2 & quad a>2+sqrt(2)).
          $],
      ),
      subquestion(
        stem: [求 $F(x)$ 在区间 $[0,6]$ 上的最大值 $M(a)$。],
        answers: ([$M(a)=cases(34-8a & quad 3<=a<4, 2 & quad a>=4)$],),
        explanation: [因 $2a>=6$，由第 (1) 问，在 $[0,2]$ 上 $F(x)=2abs(x-1)$，其最大值为 $2$；在 $[2,6]$ 上 $F(x)=g(x)$。
          $g$ 为开口向上的二次函数，在闭区间上的最大值取于端点，故该段最大值为 $max{g(2),g(6)}=max{2,34-8a}$。
          因此
          $ M(a)=cases(34-8a & quad 3<=a<4, 2 & quad a>=4). $],
      ),
    )),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，设椭圆 $x^2/a^2+y^2=1$（$a>1$）。
    #figure(ellipse-diagram())],
  parts: (
    subquestion(
      stem: [求直线 $y=k x+1$ 被椭圆截得的线段长（用 $a,k$ 表示）；],
      answers: ([$(2a^2 abs(k)sqrt(1+k^2))/(1+a^2 k^2)$],),
      explanation: [将 $y=k x+1$ 代入椭圆，得 $(1+a^2 k^2)x^2+2a^2 k x=0$，故两个交点的横坐标为 $0$ 和 $-(2a^2 k)/(1+a^2 k^2)$。于是弦长为
        $
          sqrt(1+k^2)abs(0+(2a^2 k)/(1+a^2 k^2))=(2a^2 abs(k)sqrt(1+k^2))/(1+a^2 k^2).
        $
        当 $k=0$ 时，直线为椭圆的切线，上式给出退化弦长 $0$。],
    ),
    subquestion(
      stem: [若任意以点 $A(0,1)$ 为圆心的圆与椭圆至多有 3 个公共点，求椭圆离心率的取值范围。],
      answers: ([$(0,sqrt(2)/2]$],),
      explanation: [设椭圆上的点为 $P(x,y)$，则 $-1<=y<=1$。消去 $x^2=a^2(1-y^2)$，得
        $ A P^2=x^2+(y-1)^2=(1-a^2)y^2-2y+a^2+1=:h(y). $
        对 $-1<y<1$，每个 $y$ 对应椭圆上左右对称的两个点；对 $y=plus.minus 1$，仅对应一个点。因此只需研究 $h(y)=r^2$ 在 $[-1,1]$ 上的根数。
        #step[当 $1<a^2<=2$ 时][$h'(y)=2(1-a^2)y-2<0$ 对 $-1<y<1$ 成立，故 $h$ 在 $[-1,1]$ 上严格递减。每个半径至多对应一个 $y$，圆与椭圆至多有两个公共点，满足要求。]
        #step[当 $a^2>2$ 时][$h$ 的最大值点 $y_0=-1/(a^2-1)$ 在 $(-1,0)$ 内，且 $h(y_0)>h(-1)=4>h(1)=0$。任取 $4<r^2<h(y_0)$，方程 $h(y)=r^2$ 在 $(-1,y_0)$ 与 $(y_0,1)$ 内各有一根，得到四个不同的公共点，不满足要求。]
        故 $1<a<=sqrt(2)$。由 $e=sqrt(1-1/a^2)$，得 $0<e<=sqrt(2)/2$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [设数列 ${a_n}$ 满足 $abs(a_n-a_(n+1)/2)<=1$，$n in NN^*$。],
  parts: (
    subquestion(
      stem: [证明：$abs(a_n)>=2^(n-1)(abs(a_1)-2)$，$n in NN^*$；],
      answers: ([证明见解析。],),
      explanation: [由三角不等式，$abs(a_n)<=abs(a_n-a_(n+1)/2)+abs(a_(n+1))/2<=1+abs(a_(n+1))/2$，故
        $ abs(a_(n+1))-2>=2(abs(a_n)-2). $
        逐次迭代得 $abs(a_n)-2>=2^(n-1)(abs(a_1)-2)$，于是
        $ abs(a_n)>=2+2^(n-1)(abs(a_1)-2)>=2^(n-1)(abs(a_1)-2). $
        $n=1$ 时也显然成立。],
    ),
    subquestion(
      stem: [若 $abs(a_n)<=(3/2)^n$，$n in NN^*$，证明：$abs(a_n)<=2$，$n in NN^*$。],
      answers: ([证明见解析。],),
      explanation: [固定任意 $n in NN^*$。将第 (1) 问的递推关系从第 $n$ 项开始迭代 $m$ 次，得
        $ abs(a_(n+m))-2>=2^m dot (abs(a_n)-2). $
        因而
        $
          abs(a_n)<=2+(abs(a_(n+m))-2)/2^m<=2+(3/2)^(n+m)/2^m =2+(3/2)^n dot (3/4)^m.
        $
        令正整数 $m$ 趋于无穷，右侧趋于 $2$，所以 $abs(a_n)<=2$。由 $n$ 的任意性，命题成立。],
    ),
  ),
)
