#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "四川卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016四川理.pdf",
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
#let front-view() = {
  set text(size: 9pt)
  cetz.canvas(length: 12mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let r = calc.sqrt(3)
    line((-r, 0), (0, 1), (r, 0), close: true)
    line((0, 0), (0, 1))
    line((-r - 0.35, 0), (-r - 0.35, 1), mark: (start: "|", end: "|"))
    content((-r - 0.45, 0.5), $1$, anchor: "east")
    line((-r, -0.3), (r, -0.3), mark: (start: "|", end: "|"))
    line((0, -0.24), (0, -0.36))
    for (a, b) in ((-r, 0), (0, r)) {
      content(((a + b) / 2, -0.4), $sqrt(3)$, anchor: "north")
    }
    content((0, -0.9), [正视图], anchor: "north")
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
        (0.4, [0.40]),
        (0.52, [0.52]),
      ),
      x-label: [月均用水量（吨）],
      y-label: [频率 / 组距],
      axis-style: "school-book",
      {
        plot.annotate(resize: false, {
          let heights = (0.08, 0.16, 0.3, 0.4, 0.52, 0.3, 0.12, 0.08, 0.04)
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
#let pyramid(aux: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 16mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    oblique-project((1, 0), (0.2, 0.4), (0, 1.3), {
      let a = (0, 0, 0)
      let b = (1, 1, 0)
      let c = (2, 1, 0)
      let d = (2, 0, 0)
      let e = (1, 0, 0)
      let p = (0, 0, 2)
      line(a, p, d, a)
      line(p, c, d)
      line(p, e)
      for (u, v) in ((a, b), (b, c), (p, b), (b, e), (b, d)) {
        line(u, v, stroke: (dash: figure-style.dash))
      }
      if aux {
        let h = (0.5, -0.5, 0)
        line(e, h, a, stroke: (dash: figure-style.dash))
        line(p, h)
        content(h, $H$, anchor: "north", padding: 0.08)
      }
      line(e, c, stroke: (dash: figure-style.dash))
      for (v, label, anchor) in (
        (a, $A$, "north-east"),
        (b, $B$, "south"),
        (c, $C$, "west"),
        (d, $D$, "north-west"),
        (e, $E$, "north"),
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
  stem: [设集合 $A={x | -2<=x<=2}$，$ZZ$ 为整数集，则 $A inter ZZ$ 中元素的个数是#choice-placeholder()。],
  choices: ([$3$], [$4$], [$5$], [$6$]),
  answers: ([C],),
  explanation: [$A inter ZZ={-2,-1,0,1,2}$，共有 $5$ 个元素。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $i$ 为虚数单位，则 $(x+i)^6$ 的展开式中含 $x^4$ 的项为#choice-placeholder()。],
  choices: ([$-15x^4$], [$15x^4$], [$-20i x^4$], [$20i x^4$]),
  answers: ([A],),
  explanation: [由二项式定理，所求项为 $binom(6, 2)x^4 i^2=-15x^4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [为了得到函数 $y=sin(2x-pi/3)$ 的图象，只需把函数 $y=sin 2x$ 的图象上所有的点#choice-placeholder()。],
  choices: (
    [向左平行移动 $pi/3$ 个单位长度],
    [向右平行移动 $pi/3$ 个单位长度],
    [向左平行移动 $pi/6$ 个单位长度],
    [向右平行移动 $pi/6$ 个单位长度],
  ),
  answers: ([D],),
  explanation: [$sin(2x-pi/3)=sin(2(x-pi/6))$，故向右平移 $pi/6$ 个单位长度。],
)
#question(
  "single-choice",
  score: 5,
  stem: [用数字 $1,2,3,4,5$ 组成没有重复数字的五位数，其中奇数的个数为#choice-placeholder()。],
  choices: ([$24$], [$48$], [$60$], [$72$]),
  answers: ([D],),
  explanation: [个位有 $1,3,5$ 三种选择，其余四个数字任意排列，共 $3 times 4! =72$ 个。],
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
  choices: ([$9$], [$18$], [$20$], [$35$]),
  answers: ([B],),
  explanation: [初始 $v=1,i=2$。当 $i=2,1,0$ 时，$v$ 依次更新为 $4,9,18$；随后 $i=-1$，退出循环，输出 $18$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $p$：实数 $x,y$ 满足 $(x-1)^2+(y-1)^2<=2$，$q$：实数 $x,y$ 满足 $cases(y>=x-1, y>=1-x, y<=1)$，则 $p$ 是 $q$ 的#choice-placeholder()。],
  choices: (
    [必要不充分条件],
    [充分不必要条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [由 $q$ 得 $0<=y<=1$ 且 $abs(x-1)<=y$，故
    $ (x-1)^2+(y-1)^2<=y^2+(1-y)^2<=1<2. $
    所以 $q$ 能推出 $p$。而点 $(1,2)$ 满足 $p$，不满足 $q$，故 $p$ 是 $q$ 的必要不充分条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $O$ 为坐标原点，$P$ 是以 $F$ 为焦点的抛物线 $y^2=2p x$（$p>0$）上任意一点，$M$ 是线段 $P F$ 上的点，且 $abs(P M)=2abs(M F)$，则直线 $O M$ 的斜率的最大值为#choice-placeholder()。],
  choices: ([$sqrt(3)/3$], [$2/3$], [$sqrt(2)/2$], [$1$]),
  answers: ([C],),
  explanation: [设 $P=(t^2/(2p),t)$，则 $F=(p/2,0)$，$M=((t^2+2p^2)/(6p),t/3)$，所以
    $ k_(O M)=(2p t)/(t^2+2p^2). $
    当 $t<=0$ 时斜率不正；当 $t>0$ 时，由 $t^2+2p^2>=2sqrt(2)p t$ 得 $k_(O M)<=sqrt(2)/2$，等号在 $t=sqrt(2)p$ 时成立。],
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
#question(
  "single-choice",
  score: 5,
  stem: [在平面内，定点 $A,B,C,D$ 满足 $abs(arrow(D A))=abs(arrow(D B))=abs(arrow(D C))$，$arrow(D A) dot arrow(D B)=arrow(D B) dot arrow(D C)=arrow(D C) dot arrow(D A)=-2$，动点 $P,M$ 满足 $abs(arrow(A P))=1$，$arrow(P M)=arrow(M C)$，则 $abs(arrow(B M))^2$ 的最大值是#choice-placeholder()。],
  choices: ([$43/4$], [$49/4$], [$(37+6sqrt(3))/4$], [$(37+2sqrt(33))/4$]),
  answers: ([B],),
  explanation: [设 $D A=D B=D C=r$，则 $A B^2=B C^2=C A^2=2r^2+4$，所以 $triangle A B C$ 为等边三角形，$D$ 为其外心。由 $A B^2=3r^2$ 得 $r=2$，边长为 $2sqrt(3)$。
    设 $G$ 为 $A C$ 的中点，则 $B G=3$。又 $M$ 为 $P C$ 的中点，故 $arrow(G M)=1/2 arrow(A P)$。点 $M$ 在以 $G$ 为圆心、$1/2$ 为半径的圆上运动，$B M$ 的最大值为 $3+1/2=7/2$，所求最大值为 $49/4$。],
)
#section[填空题：共 5 小题，每小题 5 分，共 25 分。]
#question(
  "fill-in",
  score: 5,
  stem: [$cos^2(pi/8)-sin^2(pi/8)=$#fill-placeholder()。],
  answers: ([$sqrt(2)/2$],),
  explanation: [由二倍角公式，原式等于 $cos(pi/4)=sqrt(2)/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [同时抛掷两枚质地均匀的硬币，当至少有一枚硬币正面向上时，就说这次试验成功，则在 2 次试验中成功次数 $X$ 的均值是#fill-placeholder()。],
  answers: ([$3/2$],),
  explanation: [每次成功的概率为 $1-(1/2)^2=3/4$，故 $X tilde B(2,3/4)$，$E(X)=2 times 3/4=3/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知三棱锥的四个面都是腰长为 $2$ 的等腰三角形，该三棱锥的正视图如图所示，则该三棱锥的体积是#fill-placeholder()。
    #figure(front-view())],
  answers: ([$sqrt(3)/3$],),
  explanation: [将正视图左右端点对应的顶点记为 $B,C$，上端点对应的顶点记为 $P$，投影位于底边中点的顶点记为 $A$。
    由于 $B C$ 的投影长为 $2sqrt(3)>2$，在等腰三角形 $A B C,P B C$ 中，$B C$ 均为底边，故 $A B=A C=P B=P C=2$。
    $P B,P C$ 的投影长也均为 $sqrt(3+1)=2$，因此它们平行于投影面，$triangle P B C$ 的面积为 $sqrt(3)$。$A$ 到该平面的距离为 $sqrt(2^2-(sqrt(3))^2)=1$，所以 $V=1/3 times sqrt(3) times 1=sqrt(3)/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)$ 是定义在 $RR$ 上的周期为 $2$ 的奇函数，当 $0<x<1$ 时，$f(x)=4^x$，则 $f(-5/2)+f(1)=$#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [由周期性和奇性，$f(1)=f(-1)=-f(1)$，故 $f(1)=0$。又 $f(-5/2)=f(-1/2)=-f(1/2)=-2$，所以所求值为 $-2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系中，当 $P(x,y)$ 不是原点时，定义 $P$ 的“伴随点”为 $P'(y/(x^2+y^2),(-x)/(x^2+y^2))$；当 $P$ 是原点时，定义 $P$ 的“伴随点”为它自身。平面曲线 $C$ 上所有点的“伴随点”所构成的曲线 $C'$ 定义为曲线 $C$ 的“伴随曲线”。现有下列命题：
    ① 若点 $A$ 的“伴随点”是点 $A'$，则点 $A'$ 的“伴随点”是点 $A$；\
    ② 单位圆的“伴随曲线”是它自身；\
    ③ 若曲线 $C$ 关于 $x$ 轴对称，则其“伴随曲线”$C'$ 关于 $y$ 轴对称；\
    ④ 一条直线的“伴随曲线”是一条直线。
    其中的真命题是#fill-placeholder()。（写出所有真命题的序号）],
  answers: ([②③],),
  explanation: [#step[命题①][非零点 $(x,y)$ 连续作两次变换得到 $(-x,-y)$，故①错误。]
    #step[命题②][单位圆上 $x^2+y^2=1$，变换为 $(y,-x)$，相当于旋转 $90 degree$，仍遍历整个单位圆，故②正确。]
    #step[命题③][关于 $x$ 轴对称的两点 $(x,y),(x,-y)$，其伴随点的横坐标互为相反数、纵坐标相等，故③正确。]
    #step[命题④][直线 $y=1$ 上的点变换为 $u=1/(x^2+1),v=-x/(x^2+1)$，满足 $(u-1/2)^2+v^2=1/4$ 且 $(u,v)!=(0,0)$，构成去掉原点的圆，故④错误。]],
)
#section[解答题：共 6 小题，共 75 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 12,
  stem: [我国是世界上严重缺水的国家，某市政府为了鼓励居民节约用水，计划调整居民生活用水收费方案，拟确定一个合理的月用水量标准 $x$（吨），一位居民的月用水量不超过 $x$ 的部分按平价收费，超出 $x$ 的部分按议价收费。为了了解居民用水情况，通过抽样，获得了某年 100 位居民每人的月均用水量（单位：吨），将数据按照 $[0,0.5),[0.5,1),dots,[4,4.5)$ 分成 9 组，制成了如图所示的频率分布直方图。
    #figure(water-histogram())],
  parts: (
    subquestion(
      stem: [求直方图中 $a$ 的值；],
      answers: ([$a=0.30$。],),
      explanation: [各矩形面积之和为 $1$，所以 $0.5(0.08+0.16+a+0.40+0.52+a+0.12+0.08+0.04)=1$，解得 $a=0.30$。],
    ),
    subquestion(
      stem: [设该市有 30 万居民，估计全市居民中月均用水量不低于 3 吨的人数，并说明理由；],
      answers: ([约 $36000$ 人。],),
      explanation: [样本中月均用水量不低于 3 吨的频率为 $0.5(0.12+0.08+0.04)=0.12$。用样本频率估计总体比例，人数约为 $300000 times 0.12=36000$。],
    ),
    subquestion(
      stem: [若该市政府希望使 $85%$ 的居民每月的用水量不超过标准 $x$（吨），估计 $x$ 的值，并说明理由。],
      answers: ([$x approx 2.9$。],),
      explanation: [月均用水量低于 $2.5$ 吨的频率为 $0.5(0.08+0.16+0.30+0.40+0.52)=0.73$，低于 $3$ 吨的频率为 $0.88$。将组内数据近似看作均匀分布，由 $0.73+0.30(x-2.5)=0.85$，得 $x=2.9$。],
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
  stem: [如图，在四棱锥 $P-A B C D$ 中，$A D parallel B C$，$angle A D C=angle P A B=90 degree$，$B C=C D=1/2 A D$，$E$ 为边 $A D$ 的中点，异面直线 $P A$ 与 $C D$ 所成的角为 $90 degree$。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [在平面 $P A B$ 内找一点 $M$，使得直线 $C M parallel$ 平面 $P B E$，并说明理由；],
      answers: ([延长 $A B$ 与 $D C$ 交于 $M$ 即可。],),
      explanation: [由 $A D parallel B C$ 且 $A D=2B C$，$triangle M B C ∽ triangle M A D$，得 $M B=M A/2$，故 $B$ 为 $M A$ 的中点。又 $E$ 为 $A D$ 的中点，故 $B E parallel M D$，从而 $C M parallel B E$。
        平面 $P B E$ 与底面交于 $B E$，而 $C M$ 与 $B E$ 为两条不同的平行线，故 $C M$ 不在平面 $P B E$ 内，所以 $C M parallel$ 平面 $P B E$。],
    ),
    subquestion(
      stem: [若二面角 $P-C D-A$ 的大小为 $45 degree$，求直线 $P A$ 与平面 $P C E$ 所成角的正弦值。],
      answers: ([$1/3$。],),
      explanation: [#step[确定棱锥的高][由 $P A perp A B$ 及 $P A perp C D$，且 $A B,C D$ 不平行，得 $P A perp$ 平面 $A B C D$。又 $C D perp A D$，故 $C D perp$ 平面 $P A D$，二面角的平面角为 $angle P D A=45 degree$，所以 $P A=A D$。]
        #step[作垂线求角][设 $A D=2t$，则 $A E=E D=C D=t$。在底面内，作 $A H perp C E$，垂足 $H$ 在 $C E$ 的延长线上。由等腰直角三角形 $C D E$ 的关系，$A H=t/sqrt(2)$。
          ∵ $P A perp C E$，$A H perp C E$，∴ $C E perp$ 平面 $P A H$。过 $A$ 作 $A K perp P H$，则 $A K perp C E$，从而 $A K perp$ 平面 $P C E$，所求角为 $angle A P H$。
          $ sin angle A P H=(A H)/(P H)=(t/sqrt(2))/sqrt((2t)^2+t^2/2)=1/3. $
          #figure(pyramid(aux: true))]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知数列 ${a_n}$ 的首项为 $1$，$S_n$ 为数列 ${a_n}$ 的前 $n$ 项和，$S_(n+1)=q S_n+1$，其中 $q>0,n in NN^*$。],
  parts: (
    subquestion(
      stem: [若 $2a_2,a_3,a_2+2$ 成等差数列，求 $a_n$ 的通项公式；],
      answers: ([$a_n=2^(n-1)$。],),
      explanation: [由 $S_2=q S_1+1=q+1$，得 $a_2=q=q a_1$。对 $n>=2$，两相邻递推式相减得 $a_(n+1)=q a_n$，所以 $a_n=q^(n-1)$。
        等差条件给出 $2a_3=3a_2+2$，即 $2q^2=3q+2$。由 $q>0$，得 $q=2$，故 $a_n=2^(n-1)$。],
    ),
    subquestion(
      stem: [设双曲线 $x^2-y^2/a_n^2=1$ 的离心率为 $e_n$，且 $e_2=5/3$，证明：$e_1+e_2+dots+e_n>(4^n-3^n)/3^(n-1)$。],
      answers: ([证明见解析。],),
      explanation: [一般地 $a_n=q^(n-1)>0$，且 $e_n=sqrt(1+a_n^2)>a_n$。由 $sqrt(1+q^2)=5/3$ 得 $q=4/3$，故
        $
          sum_(k=1)^n e_k>sum_(k=1)^n (4/3)^(k-1)=3((4/3)^n-1)=(4^n-3^n)/3^(n-1).
        $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知椭圆 $E:x^2/a^2+y^2/b^2=1$（$a>b>0$）的两个焦点与短轴的一个端点是直角三角形的 3 个顶点，直线 $l:y=-x+3$ 与椭圆 $E$ 有且只有一个公共点 $T$。],
  parts: (
    subquestion(
      stem: [求椭圆 $E$ 的方程及点 $T$ 的坐标；],
      answers: ([$x^2/6+y^2/3=1$，$T=(2,1)$。],),
      explanation: [设焦半距为 $c$，由题设构成的等腰直角三角形得 $b=c$，所以 $a^2=2b^2$。将 $y=3-x$ 代入 $x^2+2y^2=2b^2$，得 $3x^2-12x+18-2b^2=0$。相切要求判别式为 $0$，故 $b^2=3$，$a^2=6$，切点为 $(2,1)$。],
    ),
    subquestion(
      stem: [设 $O$ 是坐标原点，直线 $l'$ 平行于 $O T$，与椭圆 $E$ 交于不同的两点 $A,B$，且与直线 $l$ 交于点 $P$。证明：存在常数 $lambda$，使得 $abs(P T)^2=lambda abs(P A) dot abs(P B)$，并求 $lambda$ 的值。],
      answers: ([$lambda=4/5$。],),
      explanation: [设 $l':y=x/2+m$，与椭圆联立得 $3x^2+4m x+4m^2-12=0$。设两交点横坐标为 $x_1,x_2$，则
        $ x_1+x_2=-4m/3, quad x_1x_2=(4m^2-12)/3. $
        与 $l$ 联立得 $P=(2-2m/3,1+2m/3)$，因此 $abs(P T)^2=8m^2/9$。又
        $ (x_P-x_1)(x_P-x_2)=x_P^2+4m/3 x_P+(4m^2-12)/3=8m^2/9. $
        所以
        $ abs(P A)dot abs(P B)=(1+(1/2)^2)abs((x_P-x_1)(x_P-x_2))=10m^2/9. $
        从而 $abs(P T)^2=4/5 abs(P A)dot abs(P B)$，常数 $lambda=4/5$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设函数 $f(x)=a x^2-a-ln x$，其中 $a in RR$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性；],
      answers: (
        [当 $a<=0$ 时，在 $(0,+infinity)$ 上单调递减；当 $a>0$ 时，在 $(0,1/sqrt(2a)]$ 上单调递减，在 $[1/sqrt(2a),+infinity)$ 上单调递增。],
      ),
      explanation: [定义域为 $(0,+infinity)$，$f'(x)=2a x-1/x=(2a x^2-1)/x$。若 $a<=0$，则恒有 $f'(x)<0$；若 $a>0$，导数在 $x=1/sqrt(2a)$ 左侧为负、右侧为正，由此得到所述单调区间。],
    ),
    subquestion(
      stem: [确定 $a$ 的所有可能取值，使得 $f(x)>1/x-e^(1-x)$ 在区间 $(1,+infinity)$ 内恒成立（$e=2.718dots$ 为自然对数的底数）。],
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
