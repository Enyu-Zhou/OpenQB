#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2023,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2023/2023天津.pdf",
  regions: ("天津",),
)

#let function-diagram() = cetz.canvas(length: 10mm, {
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
    size: (6.4, 4.2),
    axis-style: "school-book",
    x-min: -4,
    x-max: 4,
    y-min: -0.9,
    y-max: 5.4,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (-2, 2),
    y-ticks: (2, 4),
    {
      plot.add(
        x => 5 * calc.cos(x * 1rad) / (x * x + 1),
        domain: (-4, 4),
        samples: 180,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
    },
  )
})

#let iris-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for angle in (10deg, 130deg, 250deg) {
    scope({
      rotate(angle)
      bezier((0, 0), (0, 1.7), (-0.85, 0.8), (-0.55, 1.9))
      bezier((0, 1.7), (0, 0), (0.65, 2), (0.75, 0.65))
      bezier((0, 0), (0, 1.5), (0.1, 0.7), (-0.1, 1.1))
    })
  }
  for angle in (70deg, 190deg, 310deg) {
    scope({
      rotate(angle)
      bezier((0, 0), (0.15, 1.1), (-0.6, 0.5), (-0.45, 1.5))
      bezier((0.15, 1.1), (0, 0), (0.6, 1.3), (0.25, 0.35))
    })
  }
})

#let iris-scatter() = {
  set text(size: 8pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let points = (
      (4.89, 4.51),
      (5.59, 4.92),
      (5.69, 5.03),
      (5.79, 5.13),
      (5.89, 5.13),
      (5.98, 5.04),
      (5.98, 4.84),
      (6.08, 4.93),
      (6.17, 4.84),
      (6.28, 4.93),
      (6.28, 5.03),
      (6.28, 5.14),
      (6.38, 5.54),
      (6.38, 5.64),
      (6.49, 5.54),
      (6.48, 5.14),
      (6.47, 5.24),
      (6.38, 5.34),
      (6.18, 5.44),
      (6.08, 5.63),
      (6.29, 5.64),
      (6.48, 5.84),
      (6.27, 6.04),
      (6.68, 5.84),
      (6.69, 5.74),
      (6.68, 5.64),
      (6.78, 5.54),
      (6.68, 5.23),
      (6.88, 5.13),
      (6.88, 5.43),
      (6.88, 5.73),
      (6.78, 5.94),
      (7.08, 5.93),
      (7.17, 5.84),
      (7.18, 6.05),
      (7.18, 6.15),
      (7.37, 6.15),
      (7.28, 6.34),
      (7.68, 6.13),
      (7.57, 6.64),
      (7.67, 6.75),
      (7.65, 6.94),
      (7.88, 6.44),
    )
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.1,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
        label: (offset: 0.07),
      ),
      x: (label: (anchor: "west", offset: 0.2)),
      y: (label: (anchor: "south-west", offset: 0.15)),
      grid: (
        stroke: (
          paint: black,
          thickness: figure-style.thickness,
          dash: figure-style.dash,
        ),
      ),
    ))
    plot.plot(
      size: (6.2, 5.3),
      axis-style: "school-book",
      x-min: 4.6,
      x-max: 8.4,
      y-min: 4.2,
      y-max: 7.2,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: range(48, 85, step: 4).map(v => v / 10),
      y-ticks: range(44, 73, step: 4).map(v => v / 10),
      x-label: move(dx: 5pt, dy: -8pt)[花萼长度],
      y-label: [花瓣长度],
      x-grid: true,
      y-grid: true,
      {
        plot.annotate(resize: false, {
          for point in points {
            circle(point, radius: 0.028, fill: black, stroke: none)
          }
        })
      },
    )
  })
}

#let frustum-diagram() = cetz.canvas(length: 20mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (0, 2, 0)
  let a1 = (0, 0, 2)
  let b1 = (1, 0, 2)
  let c1 = (0, 1, 2)
  let m = (1, 1, 0)
  let n = (1, 0, 0)
  oblique-project((-0.5, -0.4), (0.9, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(b, c, c1, a1, b1, b)
    line(b1, c1, m)
    line(a1, a, b, stroke: (dash: figure-style.dash))
    line(a, c, stroke: (dash: figure-style.dash))
    line(a, m, stroke: (dash: figure-style.dash))
    line(a1, n, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "south-east"),
      (b, $B$, "north-east"),
      (c, $C$, "west"),
      (a1, $A_1$, "south"),
      (b1, $B_1$, "east"),
      (c1, $C_1$, "south-west"),
      (m, $M$, "north"),
      (n, $N$, "east"),
    ) { content(point, label, anchor: anchor, padding: 0.07) }
  })
})

#section[选择题：本大题共 9 小题，每小题 5 分，共 45 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [已知集合 $U={1,2,3,4,5}$，$A={1,3}$，$B={1,2,4}$，则 $(complement_U B) union A=$#choice-placeholder()。],
  choices: ([${1,3,5}$], [${1,3}$], [${1,2,4}$], [${1,2,4,5}$]),
  answers: ([A],),
  explanation: [$complement_U B={3,5}$，所以 $(complement_U B) union A={1,3,5}$。],
)
#question(
  "single-choice",
  stem: [已知 $a,b in RR$，则“$a^2=b^2$”是“$a^2+b^2=2a b$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([B],),
  explanation: [$a^2+b^2=2a b$ 等价于 $(a-b)^2=0$，即 $a=b$，能推出 $a^2=b^2$。反之，取 $a=1,b=-1$，满足 $a^2=b^2$，但 $a^2+b^2 != 2a b$。故为必要不充分条件。],
)
#question(
  "single-choice",
  stem: [设 $a=1.01^0.5$，$b=1.01^0.6$，$c=0.6^0.5$，则 $a,b,c$ 的大小关系为#choice-placeholder()。],
  choices: ([$a<b<c$], [$b<a<c$], [$c<b<a$], [$c<a<b$]),
  answers: ([D],),
  explanation: [因 $1.01>1$，有 $1<1.01^0.5<1.01^0.6$；又 $0<0.6^0.5<1$，故 $c<a<b$。],
)
#question(
  "single-choice",
  stem: [已知函数 $y=f(x)$ 的部分图象如下，则 $f(x)$ 的解析式可能为#choice-placeholder()。
    #figure(function-diagram())
  ],
  choices: (
    [$f(x)=(5e^x-5e^(-x))/(x^2+2)$],
    [$f(x)=(5 sin x)/(x^2+1)$],
    [$f(x)=(5e^x+5e^(-x))/(x^2+2)$],
    [$f(x)=(5 cos x)/(x^2+1)$],
  ),
  answers: ([D],),
  explanation: [图象关于 $y$ 轴对称，且 $f(0)>0$，排除奇函数 A、B。图象有一部分位于 $x$ 轴下方，而 C 中函数恒正，故排除 C。D 符合图象特征。],
)
#question(
  "single-choice",
  stem: [已知数列 ${a_n}$ 的前 $n$ 项和为 $S_n$。若 $a_1=2$，$a_(n+1)=2S_n+2$（$n in NN^*$），则 $a_4=$#choice-placeholder()。],
  choices: ([$16$], [$32$], [$54$], [$162$]),
  answers: ([C],),
  explanation: [$a_2=2 times 2+2=6$，$a_3=2(2+6)+2=18$，$a_4=2(2+6+18)+2=54$。],
)
#question(
  "single-choice",
  stem: [函数 $y=f(x)$ 的图象关于直线 $x=2$ 对称，且 $f(x)$ 的一个周期为 $4$，则 $f(x)$ 的解析式可以是#choice-placeholder()。],
  choices: (
    [$f(x)=sin(pi/2 x)$],
    [$f(x)=cos(pi/2 x)$],
    [$f(x)=sin(pi/4 x)$],
    [$f(x)=cos(pi/4 x)$],
  ),
  answers: ([B],),
  explanation: [A、B 的最小正周期为 $4$，C、D 的最小正周期为 $8$，排除 C、D。对 B，$f(2+t)=f(2-t)=-cos(pi/2 t)$，故图象关于 $x=2$ 对称；A 的图象关于点 $(2,0)$ 中心对称。],
)
#question(
  "single-choice",
  stem: [鸢是鹰科的一种鸟，《诗经·大雅·旱麓》曰“鸢飞戾天，鱼跃于渊”。鸢尾花因花瓣形如鸢尾而得名（图 1），寓意鹏程万里、前途无量。通过随机抽样，收集了若干朵某品种鸢尾花的花萼长度和花瓣长度（单位：$"cm"$），绘制对应散点图（图 2）如下，计算得样本相关系数为 $0.8642$，利用最小二乘法求得相应的经验回归方程为 $hat(y)=0.7501x+0.6105$。根据以上信息，如下判断正确的为#choice-placeholder()。
    #figure(grid(
      columns: (4.2cm, auto),
      column-gutter: 8mm,
      align: center + horizon,
      row-gutter: 3mm,
      iris-diagram(), iris-scatter(),
      [图 1], [图 2],
    ))
  ],
  choices: (
    [花萼长度与花瓣长度不存在相关关系],
    [花萼长度与花瓣长度负相关],
    [花萼长度为 $7"cm"$ 的该品种鸢尾花的花瓣长度的平均值约为 $5.8612"cm"$],
    [若选取其他品种鸢尾花进行抽样，所得花萼长度与花瓣长度的样本相关系数一定为 $0.8642$],
  ),
  answers: ([C],),
  explanation: [样本相关系数 $0.8642>0$，表明花萼长度与花瓣长度正相关，A、B 错误。令 $x=7$，得 $hat(y)=0.7501 times 7+0.6105=5.8612$，C 正确。其他品种的样本相关系数未必相同，D 错误。],
)
#question(
  "single-choice",
  stem: [在三棱锥 $P-A B C$ 中，点 $M,N$ 分别在棱 $P B$ 和 $P C$ 上，且 $P M=1/3 P B$，$P N=2/3 P C$，则三棱锥 $P-A M N$ 和三棱锥 $P-A B C$ 的体积之比为#choice-placeholder()。],
  choices: ([$1/9$], [$2/9$], [$1/3$], [$4/9$]),
  answers: ([B],),
  explanation: [以 $P M N$、$P B C$ 为底面，两三棱锥的高均为 $A$ 到平面 $P B C$ 的距离。因此体积比等于底面积比，即 $(P M dot P N sin angle M P N)/(P B dot P C sin angle B P C)=1/3 times 2/3=2/9$。],
)
#question(
  "single-choice",
  stem: [已知双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的左、右焦点分别为 $F_1$ 和 $F_2$。过 $F_2$ 向一条渐近线作垂线，垂足为 $P$。若 $abs(P F_2)=2$，直线 $P F_1$ 的斜率为 $sqrt(2)/4$，则双曲线的方程为#choice-placeholder()。],
  choices: (
    [$x^2/8-y^2/4=1$],
    [$x^2/4-y^2/8=1$],
    [$x^2/4-y^2/2=1$],
    [$x^2/2-y^2/4=1$],
  ),
  answers: ([D],),
  explanation: [设 $c=sqrt(a^2+b^2)$。焦点 $F_2(c,0)$ 到渐近线的距离为 $(b c)/sqrt(a^2+b^2)=b=2$，排除 B、C。因 $P F_1$ 斜率为正，取渐近线 $y=b/a x$，垂足为 $P(a^2/c,(a b)/c)$，故斜率为 $(a b)/(2a^2+b^2)$。A 中此值为 $sqrt(2)/5$，D 中为 $sqrt(2)/4$，选 D。],
)

#section[填空题：本大题共 6 小题，每小题 5 分，共 30 分。试题中包含两个空的，答对 1 个空的给 3 分，全部答对的给 5 分。]
#question(
  "fill-in",
  stem: [已知 $"i"$ 是虚数单位，化简 $(5+14"i")/(2+3"i")$ 的结果为#fill-placeholder()。],
  answers: ([$4+"i"$],),
  explanation: [$(5+14"i")/(2+3"i")=((5+14"i")(2-3"i"))/(2^2+3^2)=(52+13"i")/13=4+"i"$。],
)
#question(
  "fill-in",
  stem: [在 $(2x^3-1/x)^6$ 的展开式中，$x^2$ 的系数为#fill-placeholder()。],
  answers: ([$60$],),
  explanation: [通项为 $T_(r+1)=binom(6, r)(2x^3)^(6-r)(-1/x)^r=(-1)^r binom(6, r)2^(6-r)x^(18-4r)$。令 $18-4r=2$，得 $r=4$，所求系数为 $binom(6, 4)2^2=60$。],
)
#question(
  "fill-in",
  stem: [已知过原点 $O$ 的直线 $l$ 与圆 $(x+2)^2+y^2=3$ 相切，且 $l$ 与抛物线 $y^2=2p x$（$p>0$）交于 $O,A$ 两点。若 $abs(O A)=8$，则 $p=$#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [直线 $x=0$ 不与圆相切，故设 $l:y=k x$。由圆心到切线的距离，得 $2abs(k)/sqrt(1+k^2)=sqrt(3)$，解得 $k^2=3$。联立抛物线方程得 $x_A=(2p)/3$，故 $abs(O A)=x_A sqrt(1+k^2)=(4p)/3=8$，解得 $p=6$。],
)
#question(
  "fill-in",
  stem: [把若干个黑球和白球（这些球除颜色外没有其他差异）放进三个空箱子中。三个箱子中的球数之比为 $5:4:6$，且其中的黑球比例依次为 $40%$、$25%$、$50%$。若从每个箱子中各随机摸出一球，则三个球都是黑球的概率为#fill-placeholder()；若把所有球放在一起，然后随机摸出一球，则该球是白球的概率为#fill-placeholder()。],
  answers: ([$0.05$], [$3/5$]),
  explanation: [从不同箱子摸球的结果相互独立，三个球都是黑球的概率为 $0.4 times 0.25 times 0.5=0.05$。混合后白球的比例为 $(5 times 0.6+4 times 0.75+6 times 0.5)/(5+4+6)=3/5$。],
)
#question(
  "fill-in",
  stem: [在 $triangle A B C$ 中，$B C=1$，$angle A=60 degree$，$arrow(A D)=1/2 arrow(A B)$，$arrow(C E)=1/2 arrow(C D)$。记 $arrow(A B)=bold(a)$，$arrow(A C)=bold(b)$。用 $bold(a)$ 和 $bold(b)$ 表示 $arrow(A E)=$#fill-placeholder()；若 $arrow(B F)=1/3 arrow(B C)$，则 $arrow(A E) dot arrow(A F)$ 的最大值为#fill-placeholder()。],
  answers: ([$1/4 bold(a)+1/2 bold(b)$], [$13/24$]),
  explanation: [
    #step[表示向量][
      $E$ 是 $C D$ 的中点，故 $arrow(A E)=1/2(arrow(A C)+arrow(A D))=1/4 bold(a)+1/2 bold(b)$。
      又 $arrow(A F)=2/3 bold(a)+1/3 bold(b)$。
    ]
    #step[求数量积的最大值][
      设 $u=abs(bold(a)),v=abs(bold(b))$，则 $bold(a) dot bold(b)=(u v)/2$，且 $u^2+v^2-u v=1$。
      $ arrow(A E) dot arrow(A F)=1/6(u^2+v^2)+5/24 u v=1/6+3/8 u v. $
      由 $u^2+v^2>=2u v$，得 $u v<=1$，所以最大值为 $1/6+3/8=13/24$，当 $u=v=1$ 时取到。
    ]
  ],
)
#question(
  "fill-in",
  stem: [设 $a in RR$，函数 $f(x)=a x^2-2x-abs(x^2-a x+1)$。若 $f(x)$ 恰有两个零点，则 $a$ 的取值范围为#fill-placeholder()。],
  answers: ([$(-infinity,0) union (0,1) union (1,+infinity)$],),
  explanation: [
    #step[将零点方程化为因式方程][
      $f(x)=0$ 等价于 $a x^2-2x>=0$ 且
      $ ((a-1)x-1)(x+1)((a+1)x-1)(x-1)=0. $
      候选根 $x=1$ 有效的条件为 $a>=2$；$x=-1$ 有效的条件为 $a>=-2$。
      当 $a != 1$ 时，$x=1/(a-1)$ 有效当且仅当 $a<=2$；当 $a != -1$ 时，$x=1/(a+1)$ 有效当且仅当 $a<=-2$。
    ]
    #step[分类计数][
      当 $a< -2$ 时，有两个不同零点 $1/(a-1)$、$1/(a+1)$；当 $a=-2$ 时，零点为 $-1$、$-1/3$。
      当 $-2<a<2$ 且 $a != 1$ 时，候选零点为 $-1$、$1/(a-1)$，二者仅在 $a=0$ 时重合。$a=1$ 时只有零点 $-1$。
      当 $a>=2$ 时，零点为 $-1$、$1$。
      故恰有两个零点当且仅当 $a != 0$ 且 $a != 1$。
    ]
  ],
)

#section[解答题：本大题共 5 小题，共 75 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  stem: [在 $triangle A B C$ 中，角 $A,B,C$ 所对的边分别为 $a,b,c$。已知 $a=sqrt(39)$，$b=2$，$A=120 degree$。],
  parts: (
    subquestion(
      stem: [求 $sin B$ 的值；],
      answers: ([$sqrt(13)/13$],),
      explanation: [由正弦定理，$sin B=(b sin A)/a=(2 times sqrt(3)/2)/sqrt(39)=sqrt(13)/13$。],
    ),
    subquestion(
      stem: [求 $c$ 的值；],
      answers: ([$5$],),
      explanation: [由余弦定理，$39=4+c^2-4c cos 120 degree=c^2+2c+4$，即 $(c+7)(c-5)=0$。因 $c>0$，故 $c=5$。],
    ),
    subquestion(
      stem: [求 $sin(B-C)$ 的值。],
      answers: ([$-(7sqrt(3))/26$],),
      explanation: [
        因 $B+C=60 degree$，$B,C$ 均为锐角，故 $cos B=(2sqrt(3))/sqrt(13)$。
        由正弦定理及余弦定理，得 $sin C=5/(2sqrt(13))$，$cos C=(3sqrt(3))/(2sqrt(13))$。
        $
          sin(B-C)=sin B cos C-cos B sin C=(3sqrt(3)-10sqrt(3))/26=-(7sqrt(3))/26.
        $
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在三棱台 $A B C-A_1 B_1 C_1$ 中，$A A_1 perp$ 平面 $A B C$，$A B perp A C$，$A B=A C=A A_1=2$，$A_1 C_1=1$，$M$ 为 $B C$ 的中点，$N$ 为 $A B$ 的中点。
    #figure(frustum-diagram())
  ],
  parts: (
    subquestion(
      stem: [求证：$A_1 N parallel$ 平面 $A M C_1$；],
      answers: ([证明见解析。],),
      explanation: [连接 $M N$。由三角形中位线定理，$M N parallel A C$，$M N=1/2 A C=1$。又 $A_1 C_1 parallel A C$，$A_1 C_1=1$，故四边形 $N M C_1 A_1$ 为平行四边形，$A_1 N parallel M C_1$。因 $M C_1 subset$ 平面 $A M C_1$，且 $A_1 N$ 不在此平面内，故 $A_1 N parallel$ 平面 $A M C_1$。],
    ),
    subquestion(
      stem: [求平面 $A M C_1$ 与平面 $A C C_1 A_1$ 夹角的余弦值；],
      answers: ([$2/3$],),
      explanation: [
        以 $A$ 为原点，$A B,A C,A A_1$ 的方向分别为 $x,y,z$ 轴正方向建立空间直角坐标系。
        则 $A(0,0,0)$，$M(1,1,0)$，$C_1(0,1,2)$，平面 $A M C_1$ 的一个法向量为 $bold(n)=(2,-2,1)$。
        平面 $A C C_1 A_1$ 的一个法向量为 $bold(m)=(1,0,0)$，故所求余弦值为 $abs(bold(n) dot bold(m))/(abs(bold(n)) abs(bold(m)))=2/3$。
      ],
    ),
    subquestion(
      stem: [求点 $C$ 到平面 $A M C_1$ 的距离。],
      answers: ([$4/3$],),
      explanation: [沿用上一问的坐标系，$C(0,2,0)$，$arrow(A C)=(0,2,0)$，法向量 $bold(n)=(2,-2,1)$。故距离为 $abs(arrow(A C) dot bold(n))/abs(bold(n))=4/3$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的左、右顶点分别为 $A_1$ 和 $A_2$，右焦点为 $F$，且 $abs(A_1 F)=3$，$abs(A_2 F)=1$。],
  parts: (
    subquestion(
      stem: [求椭圆的方程和离心率；],
      answers: ([$x^2/4+y^2/3=1$，离心率为 $1/2$。],),
      explanation: [设半焦距为 $c$，则 $a+c=3$，$a-c=1$，解得 $a=2,c=1$。故 $b^2=a^2-c^2=3$，椭圆方程为 $x^2/4+y^2/3=1$，离心率 $e=c/a=1/2$。],
    ),
    subquestion(
      stem: [点 $P$ 在椭圆上（$P$ 异于椭圆的顶点），直线 $A_2 P$ 交 $y$ 轴于点 $Q$。若 $triangle A_1 P Q$ 面积为 $triangle A_2 P F$ 面积的 $2$ 倍，求直线 $A_2 P$ 的方程。],
      answers: ([$y=plus.minus sqrt(6)/2(x-2)$。],),
      explanation: [
        #step[将面积条件转化为坐标关系][
          设 $P(u,v)$，则 $-2<u<2$，$v != 0$。直线 $A_2 P$ 为 $y=v/(u-2)(x-2)$，故 $Q(0,-(2v)/(u-2))$。
          由三角形面积的坐标公式，
          $
            S_(triangle A_1 P Q)=1/2 abs((u+2) dot (-(2v)/(u-2))-2v)=abs((2u v)/(u-2)),
          $
          而 $S_(triangle A_2 P F)=1/2 abs(v)$。
          因而 $abs((2u)/(u-2))=1$，解得 $u=-2$（舍去）或 $u=2/3$。
        ]
        #step[求直线方程][
          将 $u=2/3$ 代入椭圆方程，得 $v=plus.minus (2sqrt(6))/3$，于是 $v/(u-2)=plus.minus sqrt(6)/2$。
          故所求直线方程为 $y=plus.minus sqrt(6)/2(x-2)$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知 ${a_n}$ 是等差数列，$a_2+a_5=16$，$a_5-a_3=4$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式及 $sum_(i=2^(n-1))^(2^n-1) a_i$（$n in NN^*$）；],
      answers: ([$a_n=2n+1$，$sum_(i=2^(n-1))^(2^n-1) a_i=3 dot 4^(n-1)$。],),
      explanation: [设公差为 $d$，由 $2d=4$ 得 $d=2$，又 $2a_1+5d=16$，得 $a_1=3$，故 $a_n=2n+1$。所求和共有 $2^(n-1)$ 项，首项为 $2^n+1$，末项为 $2^(n+1)-1$，故其和为 $((2^n+1)+(2^(n+1)-1))/2 dot 2^(n-1)=3 dot 4^(n-1)$。],
    ),
    subquestion(
      stem: [设 ${b_n}$ 是等比数列，且对任意的 $k in NN^*$，当 $2^(k-1)<=n<=2^k-1$ 时，$b_k<a_n<b_(k+1)$。],
      parts: (
        subquestion(
          stem: [当 $k>=2$ 时，求证：$2^k-1<b_k<2^k+1$；],
          answers: ([证明见解析。],),
          explanation: [在第 $k$ 段中取 $n=2^(k-1)$，得 $b_k<a_(2^(k-1))=2^k+1$。在第 $k-1$ 段中取 $n=2^(k-1)-1$，得 $b_k>a_(2^(k-1)-1)=2^k-1$，合并即得所证不等式。],
        ),
        subquestion(
          stem: [求 ${b_n}$ 的通项公式及前 $n$ 项和。],
          answers: ([$b_n=2^n$，前 $n$ 项和为 $2^(n+1)-2$。],),
          explanation: [
            设公比为 $q$。由上一问，$b_k>2^k-1$（$k>=2$），故 $b_k$ 为正且可以任意大。
            又 $2^(k+1)-1<b_(k+1)<2^(k+1)+1$，结合 $2^k-1<b_k<2^k+1$，得 $abs(b_(k+1)-2b_k)<3$，即 $abs(q-2)b_k<3$。因此只能有 $q=2$。
            代入上一问不等式，得 $abs(b_1-2)2^(k-1)<1$ 对所有 $k>=2$ 成立，故 $b_1=2$。
            所以 $b_n=2^n$，前 $n$ 项和为 $2(2^n-1)=2^(n+1)-2$。此数列满足原题全部条件。
          ],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  stem: [已知函数 $f(x)=(1/x+1/2)ln(x+1)$。],
  parts: (
    subquestion(
      stem: [求曲线 $y=f(x)$ 在 $x=2$ 处的切线斜率；],
      answers: ([$1/3-(ln 3)/4$],),
      explanation: [$f'(x)=(x+2)/(2x(x+1))-(ln(x+1))/x^2$，故切线斜率为 $f'(2)=1/3-(ln 3)/4$。],
    ),
    subquestion(
      stem: [求证：当 $x>0$ 时，$f(x)>1$；],
      answers: ([证明见解析。],),
      explanation: [令 $g(x)=ln(1+x)-(2x)/(x+2)$（$x>=0$），则 $g(0)=0$，$g'(x)=x^2/((x+1)(x+2)^2)>0$（$x>0$）。故 $ln(1+x)>(2x)/(x+2)$，乘以 $(x+2)/(2x)>0$，得 $f(x)>1$。],
    ),
    subquestion(
      stem: [求证：$5/6<ln(n!)-(n+1/2)ln n+n<=1$（$n in NN^*$）。],
      answers: ([证明见解析。],),
      explanation: [
        #step[证明上界][
          记 $h_n=ln(n!)-(n+1/2)ln n+n$，则 $h_1=1$，
          $ h_n-h_(n+1)=(n+1/2)ln(1+1/n)-1=f(1/n)-1>0. $
          所以 $h_n<=h_1=1$。
        ]
        #step[证明下界][
          令 $G(x)=(x(x^2+12x+12))/(6(x+1)(x+2))-ln(1+x)$（$x>=0$）。
          直接求导得 $G'(x)=x^4/(6(x+1)^2(x+2)^2)>0$（$x>0$），又 $G(0)=0$，故 $G(x)>0$。
          将 $ln(1+x)$ 的这个上界代入 $f(x)$，得 $0<f(x)-1<x^2/(12(x+1))$。
          取 $x=1/k$，即得 $0<h_k-h_(k+1)<1/(12k(k+1))$。
          当 $n>=2$ 时，
          $
            1-h_n=sum_(k=1)^(n-1)(h_k-h_(k+1))<1/12 sum_(k=1)^(n-1)(1/k-1/(k+1))=1/12(1-1/n)<1/12.
          $
          因而 $h_n>11/12>5/6$；$n=1$ 时结论也成立。
          综上，$5/6<h_n<=1$。
        ]
      ],
    ),
  ),
)
