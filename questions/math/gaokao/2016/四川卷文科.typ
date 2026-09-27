#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "四川卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016四川文.pdf",
  regions: ("四川",),
)
#let algorithm() = {
  set text(size: 9pt)
  cetz.canvas(length: 6mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    for (y, label) in ((0, [开始]), (-10.2, [结束])) {
      rect((-0.8, y - 0.35), (0.8, y + 0.35), radius: 0.2)
      content((0, y), label)
    }
    for (y, label) in ((-1.5, [输入 $n,x$]), (-8.7, [输出 $v$])) {
      line(
        (-1.1, y - 0.4),
        (0.9, y - 0.4),
        (1.1, y + 0.4),
        (-0.9, y + 0.4),
        close: true,
      )
      content((0, y), label)
    }
    for (x, y, label) in (
      (0, -3, $v=1$),
      (0, -4.5, $i=n-1$),
      (3.8, -6.4, $v=v x+i$),
      (3.8, -4.9, $i=i-1$),
    ) {
      let half-width = if x == 0 { 1.1 } else { 1.5 }
      rect((x - half-width, y - 0.4), (x + half-width, y + 0.4))
      content((x, y), label)
    }
    line((0, -5.8), (1.4, -6.4), (0, -7), (-1.4, -6.4), close: true)
    content((0, -6.4), $i>=0$)
    for (a, b) in (
      (-0.35, -1.1),
      (-1.9, -2.6),
      (-3.4, -4.1),
      (-4.9, -5.8),
      (-7, -8.3),
      (-9.1, -9.85),
    ) {
      line((0, a), (0, b), mark: (end: ">"))
    }
    line((1.4, -6.4), (2.3, -6.4), mark: (end: ">"))
    line((3.8, -6), (3.8, -5.3), mark: (end: ">"))
    line(
      (3.8, -4.5),
      (3.8, -3.9),
      (1.8, -3.9),
      (1.8, -5.35),
      (0, -5.35),
      mark: (end: ">"),
    )
    content((1.9, -6.3), [是], anchor: "south")
    content((0.2, -7.6), [否], anchor: "west")
  })
}
#let water-histogram() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      tick: (length: 0),
      shared-zero: $0$,
      x: (label: (anchor: "west", offset: 0.2cm)),
    ))
    plot.plot(
      size: (10, 6.5),
      x-min: 0,
      x-max: 5,
      y-min: 0,
      y-max: 0.62,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: range(1, 10).map(i => i / 2),
      y-ticks: (
        (0.04, [0.04]),
        (0.08, [0.08]),
        (0.12, [0.12]),
        (0.16, [0.16]),
        (0.3, $a$),
        (0.42, [0.42]),
        (0.50, [0.50]),
      ),
      x-label: [月均用水量（吨）],
      y-label: [频率 / 组距],
      axis-style: "school-book",
      {
        plot.annotate(resize: false, {
          let heights = (0.08, 0.16, 0.3, 0.42, 0.50, 0.3, 0.12, 0.08, 0.04)
          for (i, h) in heights.enumerate() {
            line((i / 2, h), ((i + 1) / 2, h))
            if i > 0 {
              line((i / 2, 0), (i / 2, calc.max(h, heights.at(i - 1))))
            }
          }
          line((4.5, 0), (4.5, 0.04))
        })
      },
    )
  })
}
#let views() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let r = calc.sqrt(3)
    for (y, flip, label) in ((0, 1, [正视图]), (-2.4, -1, [俯视图])) {
      line((-r, y), (0, y + flip), (r, y), close: true)
      line((0, y), (0, y + flip))
      line((-r - 0.4, y), (-r - 0.4, y + flip), mark: (start: "|", end: "|"))
      content((-r - 0.5, y + flip / 2), $1$, anchor: "east")
      let dim-y = y - 0.3 * flip
      line((-r, dim-y), (r, dim-y), mark: (start: "|", end: "|"))
      line((0, dim-y - 0.06), (0, dim-y + 0.06))
      for x in (-r / 2, r / 2) {
        content((x, dim-y - 0.15 * flip), $sqrt(3)$, anchor: if flip == 1 {
          "north"
        } else { "south" })
      }
      content(
        (0, y - if flip == 1 { 0.85 } else { 1.25 }),
        label,
        anchor: "north",
      )
    }
    line((3.1, 0), (3.1, 1), (4.1, 0), close: true)
    line((2.8, 0), (2.8, 1), mark: (start: "|", end: "|"))
    content((2.7, 0.5), $1$, anchor: "east")
    line((3.1, -0.3), (4.1, -0.3), mark: (start: "|", end: "|"))
    content((3.6, -0.45), $1$, anchor: "north")
    content((3.6, -0.85), [侧视图], anchor: "north")
  })
}
#let pyramid(aux: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 14mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    oblique-project((1, 0), (0.2, 0.4), (0, 1.3), {
      let a = (0, 0, 0)
      let b = (1, 1, 0)
      let c = (2, 1, 0)
      let d = (2, 0, 0)
      let p = (0, 0, 2)
      line(a, p, d, a)
      line(p, c, d)
      for (u, v) in ((a, b), (b, c), (b, d), (p, b)) {
        line(u, v, stroke: (dash: figure-style.dash))
      }
      if aux {
        let m = (1, 0, 0)
        line(b, m, c, stroke: (dash: figure-style.dash))
        content(m, $M$, anchor: "north", padding: 0.09)
      }
      for (v, label, anchor) in (
        (a, $A$, "north-east"),
        (b, $B$, "south"),
        (c, $C$, "west"),
        (d, $D$, "north-west"),
        (p, $P$, "south"),
      ) {
        content(v, label, anchor: anchor, padding: 0.09)
      }
    })
  })
}
#section[选择题：共 10 小题，每小题 5 分，共 50 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设 $i$ 为虚数单位，则复数 $(1+i)^2=$#choice-placeholder()。],
  choices: ([$0$], [$2$], [$2i$], [$2+2i$]),
  answers: ([C],),
  explanation: [$(1+i)^2=1+2i+i^2=2i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={x | 1<=x<=5}$，$ZZ$ 为整数集，则集合 $A inter ZZ$ 中元素的个数是#choice-placeholder()。],
  choices: ([$6$], [$5$], [$4$], [$3$]),
  answers: ([B],),
  explanation: [$A inter ZZ={1,2,3,4,5}$，共有 $5$ 个元素。],
)
#question(
  "single-choice",
  score: 5,
  stem: [抛物线 $y^2=4x$ 的焦点坐标是#choice-placeholder()。],
  choices: ([$(0,2)$], [$(0,1)$], [$(2,0)$], [$(1,0)$]),
  answers: ([D],),
  explanation: [与标准方程 $y^2=2p x$ 比较，得 $p=2$，焦点为 $(p/2,0)=(1,0)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [为了得到函数 $y=sin(x+pi/3)$ 的图象，只需把函数 $y=sin x$ 的图象上所有的点#choice-placeholder()。],
  choices: (
    [向左平行移动 $pi/3$ 个单位长度],
    [向右平行移动 $pi/3$ 个单位长度],
    [向上平行移动 $pi/3$ 个单位长度],
    [向下平行移动 $pi/3$ 个单位长度],
  ),
  answers: ([A],),
  explanation: [将 $y=sin x$ 的图象向左平移 $pi/3$ 个单位长度，即得 $y=sin(x+pi/3)$ 的图象。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $p$：实数 $x,y$ 满足 $x>1$ 且 $y>1$，$q$：实数 $x,y$ 满足 $x+y>2$，则 $p$ 是 $q$ 的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [由 $x>1$ 且 $y>1$ 可推出 $x+y>2$；但 $x=1,y=2$ 满足 $q$，不满足 $p$，所以 $p$ 是 $q$ 的充分不必要条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a$ 为函数 $f(x)=x^3-12x$ 的极小值点，则 $a=$#choice-placeholder()。],
  choices: ([$-4$], [$-2$], [$4$], [$2$]),
  answers: ([D],),
  explanation: [$f'(x)=3(x-2)(x+2)$，在 $x=2$ 两侧由负变正，故 $x=2$ 是极小值点，$a=2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某公司为激励创新，计划逐年加大研发资金投入。若该公司 2015 年全年投入研发资金 130 万元，在此基础上，每年投入的研发资金比上一年增长 $12%$，则该公司全年投入的研发资金开始超过 200 万元的年份是#choice-placeholder()。
    （参考数据：$lg 1.12 approx 0.05,lg 1.3 approx 0.11,lg 2 approx 0.30$）],
  choices: ([2018 年], [2019 年], [2020 年], [2021 年]),
  answers: ([B],),
  explanation: [设经过 $n$ 年后首次超过 200 万元，则 $130 times 1.12^n>200$，即
    $ n>(lg 2-lg 1.3)/(lg 1.12) approx 3.8. $
    最小整数 $n=4$，对应年份为 $2015+4=2019$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [秦九韶是我国南宋时期的数学家，普州（现四川省安岳县）人，他在所著的《数书九章》中提出的多项式求值的秦九韶算法，至今仍是比较先进的算法。如图所示的程序框图给出了利用秦九韶算法求某多项式值的一个实例，若输入 $n,x$ 的值分别为 $3,2$，则输出 $v$ 的值为#choice-placeholder()。
    #figure(algorithm())],
  choices: ([$35$], [$20$], [$18$], [$9$]),
  answers: ([C],),
  explanation: [初始 $v=1,i=2$。当 $i=2,1,0$ 时，$v$ 依次更新为 $4,9,18$；随后 $i=-1$，退出循环，输出 $18$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知正三角形 $A B C$ 的边长为 $2sqrt(3)$，平面 $A B C$ 内的动点 $P,M$ 满足 $abs(arrow(A P))=1$，$arrow(P M)=arrow(M C)$，则 $abs(arrow(B M))^2$ 的最大值是#choice-placeholder()。],
  choices: ([$43/4$], [$49/4$], [$(37+6sqrt(3))/4$], [$(37+2sqrt(33))/4$]),
  answers: ([B],),
  explanation: [设 $G$ 为 $A C$ 的中点，则 $B G=3$。又 $M$ 为 $P C$ 的中点，故 $arrow(G M)=1/2 arrow(A P)$。点 $M$ 在以 $G$ 为圆心、$1/2$ 为半径的圆上运动，$B M$ 的最大值为 $3+1/2=7/2$，所求最大值为 $49/4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设直线 $l_1,l_2$ 分别是函数 $f(x)=cases(-ln x quad & 0<x<1, ln x quad & x>1)$ 图象上点 $P_1,P_2$ 处的切线，$l_1$ 与 $l_2$ 垂直相交于点 $P$，且 $l_1,l_2$ 分别与 $y$ 轴相交于点 $A,B$，则 $triangle P A B$ 的面积的取值范围是#choice-placeholder()。],
  choices: ([$(0,1)$], [$(0,2)$], [$(0,+infinity)$], [$(1,+infinity)$]),
  answers: ([A],),
  explanation: [两条切线斜率异号，切点分处两段。不妨设右段切点横坐标为 $t>1$，则由斜率乘积为 $-1$，左段切点横坐标为 $1/t$。两条切线为
    $ y=x/t+ln t-1, quad y=-t x+ln t+1. $
    从而 $abs(A B)=2$，$x_P=2t/(t^2+1)$，面积为 $S(t)=2t/(t^2+1)$。
    $S'(t)=2(1-t^2)/(t^2+1)^2<0$，且当 $t$ 从 $1$ 右侧趋向 $+infinity$ 时，$S$ 从 $1$ 趋向 $0$，故值域为 $(0,1)$。],
)
#section[填空题：共 5 小题，每小题 5 分，共 25 分。]
#question(
  "fill-in",
  score: 5,
  stem: [$sin 750 degree=$#fill-placeholder()。],
  answers: ([$1/2$],),
  explanation: [$sin 750 degree=sin(720 degree+30 degree)=sin 30 degree=1/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知某三棱锥的三视图如图所示，则该三棱锥的体积是#fill-placeholder()。
    #figure(views())],
  answers: ([$sqrt(3)/3$],),
  explanation: [以俯视图中的三角形所在平面为底面，底边长 $2sqrt(3)$，对应高为 $1$，底面积为 $sqrt(3)$。由正视图和侧视图可知棱锥的高为 $1$，所以 $V=1/3 times sqrt(3) times 1=sqrt(3)/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [从 $2,3,8,9$ 任取两个不同的数值，分别记为 $a,b$，则 $log_a b$ 为整数的概率是#fill-placeholder()。],
  answers: ([$1/6$],),
  explanation: [有序数对 $(a,b)$ 共 $4 times 3=12$ 种，其中使 $log_a b$ 为整数的只有 $(2,8),(3,9)$，所以概率为 $2/12=1/6$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若函数 $f(x)$ 是定义在 $RR$ 上的周期为 $2$ 的奇函数，当 $0<x<1$ 时，$f(x)=4^x$，则 $f(-5/2)+f(2)=$#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [由奇性得 $f(0)=0$，再由周期性得 $f(2)=0$。又 $f(-5/2)=f(-1/2)=-f(1/2)=-2$，所以所求值为 $-2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系中，当 $P(x,y)$ 不是原点时，定义 $P$ 的“伴随点”为 $P'(y/(x^2+y^2),(-x)/(x^2+y^2))$；当 $P$ 是原点时，定义 $P$ 的“伴随点”为它自身。现有下列命题：
    ① 若点 $A$ 的“伴随点”是点 $A'$，则点 $A'$ 的“伴随点”是点 $A$；\
    ② 单位圆上的“伴随点”仍在单位圆上；\
    ③ 若两点关于 $x$ 轴对称，则它们的“伴随点”关于 $y$ 轴对称；\
    ④ 若三点在同一条直线上，则它们的“伴随点”一定共线。
    其中的真命题是#fill-placeholder()。（写出所有真命题的序号）],
  answers: ([②③],),
  explanation: [#step[命题①][$A=(1,0)$ 的伴随点为 $(0,-1)$，后者的伴随点为 $(-1,0)$，故①错误。]
    #step[命题②][当 $x^2+y^2=1$ 时，伴随点为 $(y,-x)$，仍满足单位圆方程，故②正确。]
    #step[命题③][关于 $x$ 轴对称的两点 $(x,y),(x,-y)$，其伴随点横坐标互为相反数、纵坐标相等，故③正确。]
    #step[命题④][共线三点 $(0,1),(1,1),(-1,1)$ 的伴随点分别为 $(1,0),(1/2,-1/2),(1/2,1/2)$，这三点不共线，故④错误。]],
)
#section[解答题：共 6 小题，共 75 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 12,
  stem: [我国是世界上严重缺水的国家，某市为了制定合理的节水方案，对居民用水情况进行了调查，通过抽样，获得了某年 100 位居民每人的月均用水量（单位：吨），将数据按照 $[0,0.5),[0.5,1),dots,[4,4.5]$ 分成 9 组，制成了如图所示的频率分布直方图。
    #figure(water-histogram())],
  parts: (
    subquestion(
      stem: [求直方图中 $a$ 的值；],
      answers: ([$a=0.30$。],),
      explanation: [由各矩形面积之和为 $1$，有 $0.5(0.08+0.16+a+0.42+0.50+a+0.12+0.08+0.04)=1$，解得 $a=0.30$。],
    ),
    subquestion(
      stem: [设该市有 30 万居民，估计全市居民中月均用水量不低于 3 吨的人数，并说明理由；],
      answers: ([约 $36000$ 人。],),
      explanation: [样本中月均用水量不低于 $3$ 吨的频率为 $0.5(0.12+0.08+0.04)=0.12$。用样本频率估计总体比例，人数约为 $300000 times 0.12=36000$。],
    ),
    subquestion(
      stem: [估计居民月均用水量的中位数。],
      answers: ([约 $2.04$ 吨。],),
      explanation: [低于 $2$ 吨的频率为 $0.5(0.08+0.16+0.30+0.42)=0.48$，低于 $2.5$ 吨的频率为 $0.73$，故中位数在 $[2,2.5)$ 内。按组内均匀分布估计，由 $0.48+0.50(x-2)=0.50$，得中位数约为 $2.04$ 吨。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在四棱锥 $P-A B C D$ 中，$P A perp C D$，$A D parallel B C$，$angle A D C=angle P A B=90 degree$，$B C=C D=1/2 A D$。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [在平面 $P A D$ 内找一点 $M$，使得直线 $C M parallel$ 平面 $P A B$，并说明理由；],
      answers: ([取 $A D$ 的中点 $M$ 即可。],),
      explanation: [取 $A D$ 的中点 $M$，则 $A M parallel B C$ 且 $A M=B C$，所以四边形 $A M C B$ 为平行四边形，$C M parallel A B$。
        平面 $P A B$ 与底面交于 $A B$，而 $C M$ 是底面内与 $A B$ 不重合的平行线，因此 $C M$ 不在平面 $P A B$ 内，故 $C M parallel$ 平面 $P A B$。
        #figure(pyramid(aux: true))],
    ),
    subquestion(
      stem: [证明：平面 $P A B perp$ 平面 $P B D$。],
      answers: ([证明见解析。],),
      explanation: [由 $P A perp A B$、$P A perp C D$，且 $A B,C D$ 不平行，得 $P A perp$ 平面 $A B C D$，所以 $P A perp B D$。
        取第一问中的中点 $M$。因为 $B C parallel M D$ 且 $B C=M D$，四边形 $B C D M$ 为平行四边形，从而 $B M=C D=(A D)/2=A M=M D$。
        因此 $A,B,D$ 在以 $M$ 为圆心、$A D$ 为直径的圆上，$angle A B D=90 degree$，即 $A B perp B D$。
        由 $A B$ 与 $P A$ 相交，得 $B D perp$ 平面 $P A B$；又 $B D$ 在平面 $P B D$ 内，故平面 $P A B perp$ 平面 $P B D$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 所对的边分别是 $a,b,c$，且 $(cos A)/a+(cos B)/b=(sin C)/c$。],
  parts: (
    subquestion(
      stem: [证明：$sin A sin B=sin C$；],
      answers: ([证明见解析。],),
      explanation: [由正弦定理得 $(cos A)/(sin A)+(cos B)/(sin B)=1$，两边乘以 $sin A sin B$，得 $sin(A+B)=sin A sin B$。又 $A+B=pi-C$，故 $sin A sin B=sin C$。],
    ),
    subquestion(
      stem: [若 $b^2+c^2-a^2=6/5 b c$，求 $tan B$。],
      answers: ([$tan B=4$。],),
      explanation: [由余弦定理，$cos A=3/5$，$sin A=4/5$。将 $sin C=sin(A+B)$ 代入第一问结论，得 $(sin A-cos A)sin B=sin A cos B$，即 $sin B=4cos B$。因 $sin B>0$，有 $cos B>0$，所以 $tan B=4$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知数列 ${a_n}$ 的首项为 $1$，$S_n$ 为数列 ${a_n}$ 的前 $n$ 项和，$S_(n+1)=q S_n+1$，其中 $q>0,n in NN^*$。],
  parts: (
    subquestion(
      stem: [若 $a_2,a_3,a_2+a_3$ 成等差数列，求数列 ${a_n}$ 的通项公式；],
      answers: ([$a_n=2^(n-1)$。],),
      explanation: [由 $S_2=q S_1+1=q+1$ 得 $a_2=q a_1=q$。对 $n>=2$，两相邻递推式相减得 $a_(n+1)=q a_n$，故 $a_n=q^(n-1)$。
        由等差条件，$2a_3=a_2+(a_2+a_3)$，得 $a_3=2a_2$，所以 $q=2$，$a_n=2^(n-1)$。],
    ),
    subquestion(
      stem: [设双曲线 $x^2-y^2/a_n^2=1$ 的离心率为 $e_n$，且 $e_2=2$，求 $e_1^2+e_2^2+dots+e_n^2$。],
      answers: ([$n+(3^n-1)/2$。],),
      explanation: [一般地 $a_n=q^(n-1)$，由离心率公式，$e_n^2=1+a_n^2=1+q^(2n-2)$。由 $e_2=2$ 得 $q^2=3$，所以
        $ sum_(k=1)^n e_k^2=n+sum_(k=1)^n 3^(k-1)=n+(3^n-1)/2. $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知椭圆 $E:x^2/a^2+y^2/b^2=1$（$a>b>0$）的一个焦点与短轴的两个端点是正三角形的三个顶点，点 $P(sqrt(3),1/2)$ 在椭圆 $E$ 上。],
  parts: (
    subquestion(
      stem: [求椭圆 $E$ 的方程；],
      answers: ([$x^2/4+y^2=1$。],),
      explanation: [正三角形的边长为 $2b$，而焦点到短轴端点的距离为 $a$，故 $a=2b$。代入点 $P$ 得 $3/(4b^2)+1/(4b^2)=1$，所以 $b^2=1,a^2=4$，椭圆方程为 $x^2/4+y^2=1$。],
    ),
    subquestion(
      stem: [设不过原点 $O$ 且斜率为 $1/2$ 的直线 $l$ 与椭圆 $E$ 交于不同的两点 $A,B$，线段 $A B$ 的中点为 $M$，直线 $O M$ 与椭圆 $E$ 交于 $C,D$，证明：$abs(M A)dot abs(M B)=abs(M C)dot abs(M D)$。],
      answers: ([证明见解析。],),
      explanation: [设 $l:y=x/2+m$，其中 $m!=0$。与椭圆联立得 $x^2+2m x+2m^2-2=0$，由两交点不同，得 $m^2<2$。
        设 $A,B$ 的横坐标为 $x_1,x_2$，则 $x_1+x_2=-2m$，$x_1x_2=2m^2-2$，因此 $M=(-m,m/2)$，直线 $O M$ 为 $y=-x/2$，与椭圆的交点横坐标为 $plus.minus sqrt(2)$。
        因 $abs(m)<sqrt(2)$，$M$ 在线段 $C D$ 内，从而
        $ abs(M C)dot abs(M D)=(1+1/4)(sqrt(2)-m)(sqrt(2)+m)=5/4(2-m^2). $
        又 $M$ 为 $A B$ 的中点，所以
        $
          abs(M A)dot abs(M B)=1/4 abs(A B)^2=5/16((x_1+x_2)^2-4x_1x_2)=5/4(2-m^2).
        $
        两式相等，结论成立。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设函数 $f(x)=a x^2-a-ln x$，$g(x)=1/x-e/e^x$，其中 $a in RR$，$e=2.718dots$ 为自然对数的底数。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性；],
      answers: (
        [当 $a<=0$ 时，在 $(0,+infinity)$ 上单调递减；当 $a>0$ 时，在 $(0,1/sqrt(2a)]$ 上单调递减，在 $[1/sqrt(2a),+infinity)$ 上单调递增。],
      ),
      explanation: [定义域为 $(0,+infinity)$，$f'(x)=2a x-1/x=(2a x^2-1)/x$。若 $a<=0$，则恒有 $f'(x)<0$；若 $a>0$，导数在 $x=1/sqrt(2a)$ 左侧为负、右侧为正，由此得到所述单调区间。],
    ),
    subquestion(
      stem: [证明：当 $x>1$ 时，$g(x)>0$；],
      answers: ([证明见解析。],),
      explanation: [令 $s(x)=e^(x-1)-x$，则 $s(1)=0$。当 $x>1$ 时，$s'(x)=e^(x-1)-1>0$，所以 $e^(x-1)>x>0$。取倒数得 $e^(1-x)<1/x$，因此 $g(x)>0$。],
    ),
    subquestion(
      stem: [确定 $a$ 的所有可能取值，使得 $f(x)>g(x)$ 在区间 $(1,+infinity)$ 内恒成立。],
      answers: ([$a in [1/2,+infinity)$。],),
      explanation: [令 $h(x)=a(x^2-1)-ln x-1/x+e^(1-x)$，则 $h(1)=0$，且
        $ h'(x)=2a x-1/x+1/x^2-e^(1-x), quad h'(1)=2a-1. $
        #step[必要性][若 $a<1/2$，则 $h'(1)<0$。由导数的连续性，$h$ 在 $1$ 右侧的某个邻域内严格递减，因而存在 $x>1$ 使 $h(x)<0$，与题意矛盾。因此 $a>=1/2$。]
        #step[充分性][当 $x>1$ 时，$x-1-ln x>0$（其在 $x=1$ 处为 $0$，导数 $1-1/x>0$），所以 $e^(1-x)<1/x$。若 $a>=1/2$，则
          $ h'(x)>x-2/x+1/x^2=((x-1)(x^2+x-1))/x^2>0. $
          故对所有 $x>1$，$h(x)>h(1)=0$，满足题意。综上，$a in [1/2,+infinity)$。]],
    ),
  ),
)
