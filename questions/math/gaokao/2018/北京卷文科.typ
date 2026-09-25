#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018北京文.pdf",
  regions: ("北京",),
)

#let flowchart() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.6, 6.6), (0.6, 7.1), radius: 0.18)
  content((0, 6.85), [开始])
  rect((-1.1, 5.55), (1.1, 6.05))
  content((0, 5.8), [$k=1,s=1$])
  rect((-2.4, 4.1), (2.4, 5.1))
  content((0, 4.6), [$s=s+(-1)^k dot 1/(1+k)$])
  rect((-1.1, 3.1), (1.1, 3.6))
  content((0, 3.35), [$k=k+1$])
  line((0, 2.6), (1.1, 2.15), (0, 1.7), (-1.1, 2.15), close: true)
  content((0, 2.15), [$k>=3?$])
  line((-1.1, 0.7), (0.9, 0.7), (1.1, 1.2), (-0.9, 1.2), close: true)
  content((0, 0.95), [输出 $s$])
  rect((-0.6, -0.3), (0.6, 0.2), radius: 0.18)
  content((0, -0.05), [结束])
  for (a, b) in (
    (6.6, 6.05),
    (5.55, 5.1),
    (4.1, 3.6),
    (3.1, 2.6),
    (1.7, 1.2),
    (0.7, 0.2),
  ) { line((0, a), (0, b), mark: (end: ">")) }
  line((1.1, 2.15), (2.8, 2.15), (2.8, 5.3), (0.2, 5.3), mark: (end: ">"))
  line((0.2, 5.3), (0, 5.3))
  content((1.4, 2.2), [否], anchor: "south")
  content((0.2, 1.45), [是], anchor: "west")
})
#let views() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((0, 3.4), (2, 3.4), (0, 5.4), close: true)
  line((0, 5.4), (1, 3.4))
  line((3.5, 3.4), (5.5, 3.4), (3.5, 5.4), close: true)
  line((0, 0), (1, 0), (2, 2), (0, 2), close: true)
  line((0, 2), (1, 0))
  for (pos, label) in (
    ((-0.3, 4.4), [$2$]),
    ((0.5, 3.1), [$1$]),
    ((1.5, 3.1), [$1$]),
    ((4.5, 3.1), [$2$]),
  ) { content(pos, label) }
  for (pos, label) in (
    ((1, 2.6), [正（主）视图]),
    ((4.5, 2.6), [侧（左）视图]),
    ((1, -0.4), [俯视图]),
  ) { content(pos, text(size: 9pt, label)) }
})

#let circle-arcs() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: move(dx: -5pt)[$O$],
  ))
  plot.plot(
    size: (4.8, 4.8),
    axis-style: "school-book",
    x-min: -1.4,
    x-max: 1.4,
    y-min: -1.4,
    y-max: 1.4,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      for (lo, hi, dashed) in (
        (0, 35, false),
        (35, 60, true),
        (60, 90, false),
        (90, 105, true),
        (105, 140, false),
        (140, 180, true),
        (180, 215, false),
        (215, 360, true),
      ) {
        plot.add(
          range(lo, hi + 1).map(t => (calc.cos(t * 1deg), calc.sin(t * 1deg))),
          style: (
            stroke: (
              paint: black,
              thickness: figure-style.thickness,
              dash: if dashed { figure-style.dash } else { "solid" },
            ),
          ),
        )
      }
      plot.annotate({
        for (theta, label, anchor) in (
          (0, $A$, "south-west"),
          (35, $B$, "south-west"),
          (60, $C$, "south-west"),
          (90, $D$, "south-west"),
          (105, $E$, "south-east"),
          (140, $F$, "south-east"),
          (180, $G$, "north-east"),
          (215, $H$, "north-east"),
        ) {
          content(
            (calc.cos(theta * 1deg), calc.sin(theta * 1deg)),
            label,
            anchor: anchor,
            padding: 2pt,
          )
        }
      })
    },
  )
})
#let pyramid-diagram(auxiliary: false) = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  let a = (-1, 0, 0)
  let b = (-1, 1.4, 0)
  let c = (1, 1.4, 0)
  let d = (1, 0, 0)
  let p = (0, 0, 1)
  let e = (0, 0, 0)
  let f = (-0.5, 0.7, 0.5)
  let g = (0.5, 0.7, 0.5)
  oblique-project((0.9, 0.15), (0.9, -0.2), (0, 1.7), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, a, b, c, p)
    line(p, b)
    for (u, v) in ((p, d), (a, d), (d, c), (p, e), (e, f)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    if auxiliary {
      line(f, g, d, stroke: (dash: figure-style.dash))
      content(g, $G$, anchor: "south-west", padding: 3pt)
    }
    for (point, label, anchor) in (
      (p, $P$, "south"),
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-west"),
      (e, $E$, "north-east"),
      (f, $F$, "south-west"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x | |x|<2}$，$B={-2,0,1,2}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${0,1}$], [${-1,0,1}$], [${-2,0,1,2}$], [${-1,0,1,2}$]),
  answers: ([A],),
  explanation: [$A=(-2,2)$，故 $B$ 中属于 $A$ 的元素为 $0,1$，即 $A inter B={0,1}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在复平面内，复数 $1/(1-"i")$ 的共轭复数对应的点位于#choice-placeholder()。],
  choices: ([第一象限], [第二象限], [第三象限], [第四象限]),
  answers: ([D],),
  explanation: [$1/(1-"i")=(1+"i")/2$，其共轭复数为 $1/2-1/2 "i"$，对应点 $(1/2,-1/2)$ 在第四象限。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图所示的程序框图，输出的 $s$ 值为#choice-placeholder()。
    #figure(flowchart())],
  choices: ([$1/2$], [$5/6$], [$7/6$], [$7/12$]),
  answers: ([B],),
  explanation: [初始 $k=1$、$s=1$。第一次循环后 $s=1-1/2=1/2$、$k=2$，继续循环。
    第二次循环后 $s=1/2+1/3=5/6$、$k=3$，满足退出条件，故输出 $5/6$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [设 $a,b,c,d$ 是非零实数，则“$a d=b c$”是“$a,b,c,d$ 成等比数列”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([B],),
  explanation: [若四个数成等比数列，设公比为 $q$，则 $b=a q$、$c=a q^2$、$d=a q^3$，因此 $a d=b c=a^2 q^3$。
    反之，取 $a=1,b=2,c=3,d=6$，虽有 $a d=b c=6$，但相邻两项的比为 $2,3/2,2$，不成等比数列。
    故为必要而不充分条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [“十二平均律”是通用的音律体系，明代朱载堉最早用数学方法计算出半音比例，为这个理论的发展做出了重要贡献。十二平均律将一个纯八度音程分成十二份，依次得到十三个单音，从第二个单音起，每一个单音的频率与它的前一个单音的频率的比都等于 $root(12, 2)$。若第一个单音的频率为 $f$，则第八个单音的频率为#choice-placeholder()。],
  choices: (
    [$root(3, 2)f$],
    [$root(3, 2^2)f$],
    [$root(12, 2^5)f$],
    [$root(12, 2^7)f$],
  ),
  answers: ([D],),
  explanation: [各单音频率构成首项为 $f$、公比为 $root(12, 2)$ 的等比数列，故第八项为 $f(root(12, 2))^7=root(12, 2^7)f$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某四棱锥的三视图如图所示，在此四棱锥的侧面中，直角三角形的个数为#choice-placeholder()。
    #figure(views())],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([C],),
  explanation: [由三视图，可取底面顶点 $A=(0,0,0)$、$B=(1,0,0)$、$C=(2,2,0)$、$D=(0,2,0)$，顶点 $P=(0,2,2)$。
    ∵ $P D$ 垂直底面，∴ 侧面 $P A D$、$P C D$ 为直角三角形。又 $P A perp A B$，故 $P A B$ 也是直角三角形。
    侧面 $P B C$ 的三边平方为 $P B^2=9$、$P C^2=8$、$B C^2=5$，不满足勾股关系。
    故共有 $3$ 个。],
)

#question(
  "single-choice",
  score: 5,
  stem: [在平面直角坐标系中，$overparen(A B),overparen(C D),overparen(E F),overparen(G H)$ 是圆 $x^2+y^2=1$ 上的四段弧（如图），点 $P$ 在其中一段上，角 $alpha$ 以 $O x$ 为始边，$O P$ 为终边。若 $tan alpha<cos alpha<sin alpha$，则 $P$ 所在的圆弧是#choice-placeholder()。
    #figure(circle-arcs())],
  choices: (
    [$overparen(A B)$],
    [$overparen(C D)$],
    [$overparen(E F)$],
    [$overparen(G H)$],
  ),
  answers: ([C],),
  explanation: [弧 $A B$、$C D$ 在第一象限内的点满足 $tan alpha=frac(sin alpha, cos alpha)>sin alpha$，与题设不符；坐标轴上的端点也不满足题设。
    弧 $G H$ 在第三象限内的点满足 $tan alpha>0>cos alpha$，也不合题意。
    因此点 $P$ 只能在第二象限的弧 $E F$ 上。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={(x,y) | x-y>=1,a x+y>4,x-a y<=2}$，则#choice-placeholder()。],
  choices: (
    [对任意实数 $a$，$(2,1) in A$],
    [对任意实数 $a$，$(2,1) in.not A$],
    [当且仅当 $a<0$ 时，$(2,1) in.not A$],
    [当且仅当 $a<=3/2$ 时，$(2,1) in.not A$],
  ),
  answers: ([D],),
  explanation: [将 $(2,1)$ 代入三个不等式，得 $1>=1$、$2a+1>4$、$2-a<=2$，同时成立的充要条件为 $a>3/2$。
    所以 $(2,1) in.not A$ 的充要条件为 $a<=3/2$。],
)

#section[填空题：本题共 6 小题，每小题 5 分，共 30 分。]

#question(
  "fill-in",
  score: 5,
  stem: [设向量 $bold(a)=(1,0)$，$bold(b)=(-1,m)$。若 $bold(a) perp (m bold(a)-bold(b))$，则 $m=$#fill-placeholder()。],
  answers: ([$-1$],),
  explanation: [$m bold(a)-bold(b)=(m+1,-m)$。由垂直关系，$bold(a) dot (m bold(a)-bold(b))=m+1=0$，故 $m=-1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知直线 $l$ 过点 $(1,0)$ 且垂直于 $x$ 轴。若 $l$ 被抛物线 $y^2=4a x$ 截得的线段长为 $4$，则抛物线的焦点坐标为#fill-placeholder()。],
  answers: ([$(1,0)$],),
  explanation: [直线为 $x=1$。由抛物线关于 $x$ 轴对称，两个交点为 $(1,2)$、$(1,-2)$。
    代入得 $4=4a$，故 $a=1$，抛物线为 $y^2=4x$，焦点为 $(1,0)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [能说明“若 $a>b$，则 $1/a<1/b$”为假命题的一组 $a,b$ 的值依次为#fill-placeholder()。],
  answers: ([$1,-1$（答案不唯一）。],),
  explanation: [取 $a=1$、$b=-1$，则 $a>b$，但 $1/a=1>-1=1/b$，构成反例。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若双曲线 $x^2/a^2-y^2/4=1$（$a>0$）的离心率为 $sqrt(5)/2$，则 $a=$#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [由离心率公式，$(a^2+4)/a^2=5/4$，故 $a^2=16$。由 $a>0$ 得 $a=4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足 $x+1<=y<=2x$，则 $2y-x$ 的最小值是#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [由 $x+1<=2x$ 得 $x>=1$，所以 $2y-x>=2(x+1)-x=x+2>=3$。
    当 $(x,y)=(1,2)$ 时满足条件且取等，故最小值为 $3$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [若 $triangle A B C$ 的面积为 $sqrt(3)/4(a^2+c^2-b^2)$，且 $angle C$ 为钝角，则 $angle B=$#fill-placeholder()；$c/a$ 的取值范围是#fill-placeholder()。],
  answers: ([$pi/3$], [$(2,+infinity)$]),
  explanation: [由面积公式与余弦定理，$1/2 a c sin B=sqrt(3)/4 times 2a c cos B$，故 $tan B=sqrt(3)$，从而 $B=pi/3$。
    ∵ $C>pi/2$，∴ $0<A<pi/6$。由正弦定理，
    $ c/a=(sin C)/(sin A)=sin(2pi/3-A)/(sin A)=sqrt(3)/(2tan A)+1/2. $
    当 $A in (0,pi/6)$ 时，$tan A in (0,1/sqrt(3))$，所以 $c/a$ 的取值范围为 $(2,+infinity)$。],
)
#section[解答题：本题共 6 小题，共 80 分。解答应写出文字说明、演算步骤或证明过程。]
#question(
  "solution",
  score: 13,
  stem: [设 ${a_n}$ 是等差数列，且 $a_1=ln 2$，$a_2+a_3=5ln 2$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=n ln 2$],),
      explanation: [设公差为 $d$，则 $a_2+a_3=2ln 2+3d=5ln 2$，得 $d=ln 2$。
        故 $a_n=a_1+(n-1)d=n ln 2$。],
    ),
    subquestion(
      stem: [求 $e^(a_1)+e^(a_2)+dots+e^(a_n)$。],
      answers: ([$2^(n+1)-2$],),
      explanation: [由 $e^(a_k)=e^(k ln 2)=2^k$，利用等比数列求和公式得
        $
          e^(a_1)+e^(a_2)+dots+e^(a_n)=2+2^2+dots+2^n=(2(2^n-1))/(2-1)=2^(n+1)-2.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知函数 $f(x)=sin^2 x+sqrt(3)sin x cos x$。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的最小正周期。],
      answers: ([$pi$],),
      explanation: [由二倍角公式，
        $ f(x)=(1-cos 2x)/2+sqrt(3)/2 sin 2x=sin(2x-pi/6)+1/2. $
        故最小正周期为 $(2pi)/2=pi$。],
    ),
    subquestion(
      stem: [若 $f(x)$ 在区间 $[-pi/3,m]$ 上的最大值为 $3/2$，求 $m$ 的最小值。],
      answers: ([$pi/3$],),
      explanation: [由第（1）问，$f(x)=3/2$ 当且仅当 $2x-pi/6=pi/2+2k pi$，即 $x=pi/3+k pi$（$k in ZZ$）。
        不小于 $-pi/3$ 的最小的这样的 $x$ 为 $pi/3$。因此区间必须包含 $pi/3$，故 $m$ 的最小值为 $pi/3$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [电影公司随机收集了电影的有关数据，经分类整理得到下表：
    #table(
      columns: 7,
      align: center,
      [电影类型], [第一类], [第二类], [第三类], [第四类], [第五类], [第六类],
      [电影部数], [140], [50], [300], [200], [800], [510],
      [好评率], [0.4], [0.2], [0.15], [0.25], [0.2], [0.1],
    )
    好评率是指：一类电影中获得好评的部数与该类电影的部数的比值。],
  parts: (
    subquestion(
      stem: [从电影公司收集的电影中随机选取 $1$ 部，求这部电影是获得好评的第四类电影的概率。],
      answers: ([$0.025$],),
      explanation: [总电影部数为 $140+50+300+200+800+510=2000$，其中第四类获得好评的有 $200 times 0.25=50$ 部。
        所求概率为 $50/2000=0.025$。],
    ),

    subquestion(
      stem: [随机选取 $1$ 部电影，估计这部电影没有获得好评的概率。],
      answers: ([$0.814$],),
      explanation: [样本中获得好评的电影部数为
        $
          140 times 0.4+50 times 0.2+300 times 0.15+200 times 0.25+800 times 0.2+510 times 0.1=372.
        $
        因此没有获得好评的概率估计为 $1-372/2000=0.814$。],
    ),
    subquestion(
      stem: [电影公司为增加投资回报，拟改变投资策略，这将导致不同类型电影的好评率发生变化。假设表格中只有两类电影的好评率数据发生变化，那么哪类电影的好评率增加 $0.1$，哪类电影的好评率减少 $0.1$，使得获得好评的电影总部数与样本中的电影总部数的比值达到最大？（只需写出结论）],
      answers: (
        [第五类电影的好评率增加 $0.1$，第二类电影的好评率减少 $0.1$。],
      ),
      explanation: [样本总数不变，好评电影总数的增量为 $0.1$ 乘以增加好评率那一类的部数，再减去 $0.1$ 乘以减少好评率那一类的部数。
        因而应在部数最多的第五类增加好评率，在部数最少的第二类减少好评率，且调整后的好评率仍在 $[0,1]$ 内。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在四棱锥 $P-A B C D$ 中，底面 $A B C D$ 为矩形，平面 $P A D perp$ 平面 $A B C D$，$P A perp P D$，$P A=P D$，$E,F$ 分别为 $A D,P B$ 的中点。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [求证：$P E perp B C$。],
      answers: ([证明见解析。],),
      explanation: [∵ $P A=P D$，$E$ 为 $A D$ 的中点，∴ $P E perp A D$。
        又矩形 $A B C D$ 中 $B C parallel A D$，故 $P E perp B C$。],
    ),
    subquestion(
      stem: [求证：平面 $P A B perp$ 平面 $P C D$。],
      answers: ([证明见解析。],),
      explanation: [∵ 平面 $P A D perp$ 平面 $A B C D$，交线为 $A D$，且 $A B perp A D$，∴ $A B perp$ 平面 $P A D$，故 $A B perp P D$。
        又 $P A perp P D$，$P A inter A B=A$，故 $P D perp$ 平面 $P A B$。
        ∵ $P D subset$ 平面 $P C D$，∴ 平面 $P A B perp$ 平面 $P C D$。],
    ),
    subquestion(
      stem: [求证：$E F parallel$ 平面 $P C D$。],
      answers: ([证明见解析。],),
      explanation: [取 $P C$ 的中点 $G$，连接 $F G,D G$。
        由三角形中位线定理，$F G parallel B C$，$F G=(B C)/2$。又 $E D parallel B C$，$E D=(A D)/2=(B C)/2$，故四边形 $E F G D$ 是平行四边形，从而 $E F parallel D G$。
        ∵ $D G subset$ 平面 $P C D$，$E F$ 不在该平面内，∴ $E F parallel$ 平面 $P C D$。
        #figure(pyramid-diagram(auxiliary: true))],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设函数 $f(x)=[a x^2-(3a+1)x+3a+2]e^x$。],
  parts: (
    subquestion(
      stem: [若曲线 $y=f(x)$ 在点 $(2,f(2))$ 处的切线斜率为 $0$，求 $a$。],
      answers: ([$a=1/2$。],),
      explanation: [$f'(x)=[a x^2-(a+1)x+1]e^x=(a x-1)(x-1)e^x$。
        令 $f'(2)=(2a-1)e^2=0$，得 $a=1/2$。],
    ),
    subquestion(
      stem: [若 $f(x)$ 在 $x=1$ 处取得极小值，求 $a$ 的取值范围。],
      answers: ([$(1,+infinity)$],),
      explanation: [当 $a>1$ 时，在 $1$ 的充分小邻域内 $a x-1>0$，故导数在 $1$ 左侧为负、右侧为正，$x=1$ 是极小值点。
        当 $a<1$ 时，在该点附近 $a x-1<0$，导数在左侧为正、右侧为负，所以 $x=1$ 是极大值点。
        当 $a=1$ 时，$f'(x)=(x-1)^2 e^x>=0$，函数在 $RR$ 上递增，该点不是极值点。
        因此 $a in (1,+infinity)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知椭圆 $M:x^2/a^2+y^2/b^2=1$（$a>b>0$）的离心率为 $sqrt(6)/3$，焦距为 $2sqrt(2)$。斜率为 $k$ 的直线 $l$ 与椭圆 $M$ 有两个不同的交点 $A,B$。],
  parts: (
    subquestion(
      stem: [求椭圆 $M$ 的方程。],
      answers: ([$x^2/3+y^2=1$。],),
      explanation: [由焦距 $2c=2sqrt(2)$ 得 $c=sqrt(2)$。又 $c/a=sqrt(6)/3$，故 $a^2=3$、$b^2=a^2-c^2=1$，椭圆方程为 $x^2/3+y^2=1$。],
    ),
    subquestion(
      stem: [若 $k=1$，求 $|A B|$ 的最大值。],
      answers: ([$sqrt(6)$],),
      explanation: [设 $l:y=x+t$，代入椭圆方程得 $4x^2+6t x+3t^2-3=0$。
        判别式 $Delta=48-12t^2>0$，即 $t^2<4$。设两根为 $x_1,x_2$，则
        $
          |A B|=sqrt(2)|x_1-x_2|=sqrt(2) sqrt(48-12t^2)/4=sqrt(6)/2 sqrt(4-t^2)<=sqrt(6).
        $
        当 $t=0$ 时取等，故最大值为 $sqrt(6)$。],
    ),
    subquestion(
      stem: [设 $P(-2,0)$，直线 $P A$ 与椭圆 $M$ 的另一个交点为 $C$，直线 $P B$ 与椭圆 $M$ 的另一个交点为 $D$。若 $C,D$ 和点 $Q(-7/4,1/4)$ 共线，求 $k$。],
      answers: ([$k=1$。],),
      explanation: [#step[表示直线上另一个交点][设 $A=(x_1,y_1)$、$B=(x_2,y_2)$，则 $x_i^2+3y_i^2=3$。
          因为 $|x_1|<=sqrt(3)<2$，直线 $P A$ 的斜率为 $r=y_1/(x_1+2)$。将 $y=r(x+2)$ 代入椭圆方程，得
          $ (1+3r^2)x^2+12r^2 x+12r^2-3=0. $
          由两根之和 $x_1+x_C=-12r^2/(1+3r^2)$，代入 $3y_1^2=3-x_1^2$，整理得
          $ C=((-7x_1-12)/(4x_1+7),y_1/(4x_1+7)). $
          同理 $D=((-7x_2-12)/(4x_2+7),y_2/(4x_2+7))$。因 $4x_i+7>=7-4sqrt(3)>0$，上述分母均非零。]
        #step[利用共线条件][计算 $Q C$ 的斜率，有
          $ x_C+7/4=1/(4(4x_1+7)),quad y_C-1/4=(4y_1-4x_1-7)/(4(4x_1+7)), $
          故 $k_(Q C)=4(y_1-x_1)-7$。同理 $k_(Q D)=4(y_2-x_2)-7$。
          由 $C,D,Q$ 共线，得 $y_1-x_1=y_2-x_2$。又 $A != B$ 且直线 $l$ 的斜率存在，故
          $ k=(y_1-y_2)/(x_1-x_2)=1. $]],
    ),
  ),
)
