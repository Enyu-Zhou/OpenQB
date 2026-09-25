#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校春季招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2019/2019春季上海.pdf",
  regions: ("上海",),
)

#let square-diagram() = cetz.canvas(length: 19mm, {
  import cetz.draw: *
  let a = 1.8
  set-style(axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.1,
    shared-zero: move(dx: -5pt)[$O$],
    tick: (stroke: figure-style.thickness),
  ))
  plot.plot(
    size: (2.9, 2.9),
    axis-style: "school-book",
    x-min: -0.4,
    x-max: 2.5,
    y-min: -0.4,
    y-max: 2.5,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.add(
        domain: (-0.4, calc.sqrt(2.5 / 3)),
        x => 3 * x * x,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.add(
        domain: (0.16, 2.5),
        x => 1 / calc.sqrt(x),
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.annotate({
        set-style(stroke: figure-style.thickness)
        line((0, a), (a, a), (a, 0))
        for (p, label, anchor) in (
          ((a, 0), $A$, "north"),
          ((a, a), $B$, "south-west"),
          ((0, a), $C$, "east"),
          ((calc.sqrt(a / 3), a), $P$, "south-west"),
          ((a, 1 / calc.sqrt(a)), $Q$, "south-west"),
        ) { content(p, label, anchor: anchor, padding: 3pt) }
      })
    },
  )
})
#let pyramid-diagram(aux: false) = cetz.canvas(length: 27mm, {
  import cetz.draw: *
  let a = (-calc.sqrt(3) / 2, 0, 0)
  let c = (calc.sqrt(3) / 2, 0, 0)
  let b = (0, 1.5, 0)
  let p = (0, 0.5, calc.sqrt(3))
  let m = (0, 1, calc.sqrt(3) / 2)
  let n = (calc.sqrt(3) / 4, 0.75, 0)
  let o = (0, 0.5, 0)
  oblique-project((1, 0), (-0.08, -0.3), (0, 0.92), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, a, b, c, p)
    line(p, b)
    line(a, c, stroke: (dash: figure-style.dash))
    line(m, n)
    if aux {
      line(p, o, stroke: (dash: figure-style.dash))
      line(a, n, stroke: (dash: figure-style.dash))
      content(o, $O$, anchor: "north-west", padding: 3pt)
    }
    for (point, label, anchor) in (
      (p, $P$, "south"),
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (m, $M$, "east"),
      (n, $N$, "north-west"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})

#section[填空题：本题共 12 小题，第 1～6 题每小题 4 分，第 7～12 题每小题 5 分，共 54 分。]
#question(
  "fill-in",
  score: 4,
  stem: [已知集合 $A={1,2,3,4,5}$，$B={3,5,6}$，则 $A inter B=$#fill-placeholder()。],
  answers: ([${3,5}$],),
  explanation: [两集合的公共元素为 $3$、$5$，故 $A inter B={3,5}$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [计算 $lim_(n -> infinity) (2n^2-3n+1)/(n^2-4n+1)=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [分子、分母同除以 $n^2$，原式为 $lim_(n -> infinity) (2-3/n+1/n^2)/(1-4/n+1/n^2)=2$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [不等式 $|x+1|<5$ 的解集为#fill-placeholder()。],
  answers: ([$(-6,4)$],),
  explanation: [$|x+1|<5 equiv -5<x+1<5 equiv -6<x<4$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [函数 $f(x)=x^2$（$x>0$）的反函数为#fill-placeholder()。],
  answers: ([$f^(-1)(x)=sqrt(x)$（$x>0$）],),
  explanation: [由 $y=x^2$、$x>0$ 得 $x=sqrt(y)$。交换 $x,y$，得反函数 $f^(-1)(x)=sqrt(x)$，定义域为 $(0,+infinity)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设 $"i"$ 为虚数单位，$3overline(z)-"i"=6+5"i"$，则 $|z|=$#fill-placeholder()。],
  answers: ([$2sqrt(2)$],),
  explanation: [由题意得 $overline(z)=2+2"i"$，故 $z=2-2"i"$，$|z|=sqrt(2^2+(-2)^2)=2sqrt(2)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知二元线性方程组 $cases(2x+2y=-1, 4x+a^2 y=a)$ 有无穷多解，则实数 $a=$#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [将第一式乘以 $2$，得 $4x+4y=-2$。两式须表示同一直线，故 $a^2=4$ 且 $a=-2$，解得 $a=-2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $(x+1/sqrt(x))^6$ 的二项展开式中，常数项为#fill-placeholder()。],
  answers: ([$15$],),
  explanation: [通项 $T_(r+1)=binom(6, r)x^(6-r) (x^(-1/2))^r=binom(6, r)x^(6-3r/2)$。令 $6-3r/2=0$，得 $r=4$，常数项为 $binom(6, 4)=15$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $triangle A B C$ 中，$A C=3$，$3sin A=2sin B$，且 $cos C=1/4$，则 $A B=$#fill-placeholder()。],
  answers: ([$sqrt(10)$],),
  explanation: [由正弦定理得 $B C=(A C sin A)/(sin B)=2$。由余弦定理，$(A B)^2=3^2+2^2-2 times 3 times 2 times 1/4=10$，故 $A B=sqrt(10)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [首届中国国际进口博览会在上海举行，某高校拟派 4 人参加连续 5 天的志愿者活动，其中甲连续参加 2 天，其余每人各参加 1 天，则不同的安排方法有#fill-placeholder()种。（结果用数值表示）],
  answers: ([$24$],),
  explanation: [将甲连续参加的两天看作一个整体，与其余三人参加的各一天一起排列，共有 $4! =24$ 种安排。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，正方形 $O A B C$ 的边长为 $a$（$a>1$），函数 $y=3x^2$ 的图象交 $B C$ 于点 $P$，函数 $y=x^(-1/2)$ 的图象交 $A B$ 于点 $Q$。当 $A Q+C P$ 最小时，$a=$#fill-placeholder()。
    #figure(square-diagram())],
  answers: ([$sqrt(3)$],),
  explanation: [由题意，$P(sqrt(a/3),a)$，$Q(a,1/sqrt(a))$，故
    $ A Q+C P=1/sqrt(a)+sqrt(a/3)>=2 root(4, 1/3). $
    当且仅当 $1/sqrt(a)=sqrt(a/3)$，即 $a=sqrt(3)>1$ 时等号成立。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $P$ 为椭圆 $x^2/4+y^2/2=1$ 上一点，$Q$ 与 $P$ 关于 $x$ 轴对称，$F_1,F_2$ 为椭圆的左、右焦点。若 $arrow(F_1 P) dot arrow(F_2 P)<=1$，则 $arrow(F_1 P)$ 与 $arrow(F_2 Q)$ 的夹角范围为#fill-placeholder()。],
  answers: ([$[pi-arccos(1/3),pi]$],),
  explanation: [设 $P(x,y)$，则 $Q(x,-y)$，$F_1(-sqrt(2),0)$，$F_2(sqrt(2),0)$。
    由椭圆方程得 $x^2=4-2y^2$，故 $arrow(F_1 P) dot arrow(F_2 P)=2-y^2<=1$，于是 $1<=y^2<=2$。
    设所求夹角为 $theta$，则
    $
      cos theta=(x^2-2-y^2)/sqrt((x^2+y^2+2)^2-8x^2)=(2-3y^2)/(y^2+2)=-3+8/(y^2+2) in [-1,-1/3].
    $
    故 $theta in [pi-arccos(1/3),pi]$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知集合 $A=[t,t+1] union [t+4,t+9]$，$0 in.not A$。若存在正数 $lambda$，使得对任意 $a in A$ 都有 $lambda/a in A$，则 $t=$#fill-placeholder()。],
  answers: ([$-3$ 或 $1$],),
  explanation: [#step[利用变换的对称性][令 $h(a)=lambda/a$，则 $h(h(a))=a$。由 $h(A) subset.eq A$ 得 $A=h(h(A)) subset.eq h(A)$，故 $h(A)=A$。此变换在正、负半轴上均递减，且保持数的符号。]
    #step[分类确定端点对应关系][
      ∵ $0 in.not A$，∴ $t>0$、$t< -9$ 或 $-4<t< -1$。
      当 $t>0$ 或 $t< -9$ 时，两区间同号，变换将两区间交换，故 $lambda=t(t+9)=(t+1)(t+4)$，得 $t=1$，仅符合第一种情况。
      当 $-4<t< -1$ 时，两区间异号，各自映到自身，故 $lambda=t(t+1)=(t+4)(t+9)$，得 $t=-3$。
      分别取 $lambda=10$、$lambda=6$，可验证两种情况均满足条件。]],
)

#section[选择题：本题共 4 小题，每小题 5 分，共 20 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [下列函数中，值域为 $[0,+infinity)$ 的是#choice-placeholder()。],
  choices: ([$y=2^x$], [$y=x^(1/2)$], [$y=tan x$], [$y=cos x$]),
  answers: ([B],),
  explanation: [四个函数的值域依次为 $(0,+infinity)$、$[0,+infinity)$、$RR$、$[-1,1]$，故选 B。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a,b in RR$，则“$a^2>b^2$”是“$|a|>|b|$”的#choice-placeholder()。],
  choices: (
    [充分非必要条件],
    [必要非充分条件],
    [充要条件],
    [既非充分又非必要条件],
  ),
  answers: ([C],),
  explanation: [∵ $|a|,|b|>=0$，且平方函数在 $[0,+infinity)$ 上严格递增，∴ $a^2>b^2 equiv |a|>|b|$，是充要条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知平面 $alpha,beta,gamma$ 两两垂直，直线 $a,b,c$ 满足 $a subset alpha$，$b subset beta$，$c subset gamma$，则直线 $a,b,c$ 不可能满足的关系是#choice-placeholder()。],
  choices: ([两两垂直], [两两异面], [两两相交], [两两平行]),
  answers: ([D],),
  explanation: [#step[排除两两平行][
      以三个平面的交线为坐标轴，使三个平面分别为 $x O y$、$y O z$、$z O x$ 平面。
      若三直线平行，其公共方向向量须同时平行于三个坐标平面，三个分量均为 $0$，不可能。]
    #step[验证其余关系均可实现][
      取三条坐标轴，三直线两两垂直且两两相交。
      分别取 $a:{(t,1,0)|t in RR}$、$b:{(0,t,1)|t in RR}$、$c:{(1,0,t)|t in RR}$，则三直线两两异面。]],
)
#question(
  "single-choice",
  score: 5,
  stem: [两圆的圆心分别为 $(a_1,0)$、$(a_2,0)$，均经过点 $(1,0)$，与 $y$ 轴正半轴分别交于 $(0,y_1)$、$(0,y_2)$。若 $ln y_1+ln y_2=0$，则点 $(1/a_1,1/a_2)$ 的轨迹所在的曲线是#choice-placeholder()。],
  choices: ([直线], [圆], [椭圆], [双曲线]),
  answers: ([A],),
  explanation: [由圆的方程，$a_i^2+y_i^2=(1-a_i)^2$，即 $y_i^2=1-2a_i$（$i=1,2$）。
    ∵ $y_1,y_2>0$ 且 $ln(y_1 y_2)=0$，∴ $y_1 y_2=1$，故 $(1-2a_1)(1-2a_2)=1$。
    整理得 $2a_1 a_2=a_1+a_2$，从而 $1/a_1+1/a_2=2$，轨迹在直线 $x+y=2$ 上。
    其中 $a_i<1/2$ 且 $a_i!=0$，故轨迹实际对应这条直线上 $x<0$ 或 $x>2$ 的部分。],
)

#section[解答题：本题共 5 小题，共 76 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [如图，在正三棱锥 $P-A B C$ 中，$P A=P B=P C=2$，$A B=B C=A C=sqrt(3)$，$M,N$ 分别为 $P B,B C$ 的中点。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [求异面直线 $M N$ 与 $A C$ 所成角的大小。],
      answers: ([$arccos(sqrt(3)/4)$],),
      explanation: [∵ $M N parallel P C$，∴所求角等于直线 $P C$ 与 $A C$ 所成的角。
        由余弦定理，$cos angle P C A=((P C)^2+(A C)^2-(P A)^2)/(2P C dot A C)=sqrt(3)/4>0$，故所求角为 $arccos(sqrt(3)/4)$。],
    ),
    subquestion(
      stem: [求三棱锥 $P-A B C$ 的体积。],
      answers: ([$3/4$],),
      explanation: [设 $O$ 为等边三角形 $A B C$ 的中心，则 $P O perp "平面" A B C$。
        $A O=2/3 A N=1$，$P O=sqrt((P A)^2-(A O)^2)=sqrt(3)$，故
        $
          V=1/3 S_(triangle A B C) dot P O=1/3 times (sqrt(3)/4 times 3) times sqrt(3)=3/4.
        $
        #figure(pyramid-diagram(aux: true))],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知数列 ${a_n}$，$a_1=3$，前 $n$ 项和为 $S_n$。],
  parts: (
    subquestion(
      stem: [若 ${a_n}$ 为等差数列，且 $a_4=15$，求 $S_n$。],
      answers: ([$S_n=2n^2+n$],),
      explanation: [设公差为 $d$，则 $3+3d=15$，得 $d=4$。故 $S_n=3n+(n(n-1))/2 times 4=2n^2+n$。],
    ),
    subquestion(
      stem: [若 ${a_n}$ 为等比数列，且 $lim_(n -> infinity) S_n<12$，求公比 $q$ 的取值范围。],
      answers: ([$(-1,0) union (0,3/4)$],),
      explanation: [等比数列各项不为 $0$，故 $q!=0$。因 $S_n$ 有有限极限，故 $a_n=S_n-S_(n-1)->0$，而 $a_n=3q^(n-1)$，于是 $|q|<1$。
        此时 $lim_(n -> infinity) S_n=3/(1-q)<12$，得 $q<3/4$。
        综上，$q in (-1,0) union (0,3/4)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [改革开放 40 年，我国卫生事业取得巨大成就，卫生总费用增长了数十倍。卫生总费用包括个人现金支出、社会支出和政府支出。下表为 2012～2015 年我国卫生费用中各项支出的费用及其占比。
    #block[
      #set text(size: 9pt)
      #table(
        columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        inset: 4pt,
        table.cell(rowspan: 2)[年份],
        table.cell(rowspan: 2)[卫生总费用\ （亿元）],
        table.cell(colspan: 2)[个人现金卫生支出],
        table.cell(colspan: 2)[社会卫生支出],
        table.cell(colspan: 2)[政府卫生支出],
        [绝对数\ （亿元）],
        [占比\ （%）],
        [绝对数\ （亿元）],
        [占比\ （%）],
        [绝对数\ （亿元）],
        [占比\ （%）],
        [2012],
        [28119.00],
        [9656.32],
        [$A$],
        [10030.70],
        [35.67],
        [8431.98],
        [29.99],
        [2013],
        [31668.95],
        [10729.34],
        [33.88],
        [11393.79],
        [35.98],
        [9545.81],
        [30.14],
        [2014],
        [35312.40],
        [$B$],
        [31.99],
        [13437.75],
        [38.05],
        [10579.23],
        [29.96],
        [2015],
        [40974.64],
        [11992.65],
        [29.27],
        [16506.71],
        [40.29],
        [12475.28],
        [30.45],
      )
    ]
    （数据来源于国家统计年鉴）],
  parts: (
    subquestion(
      stem: [计算 $A,B$ 的数据，并指出 2012 年到 2015 年之间我国卫生总费用中个人现金支出占比和社会支出占比的变化趋势。],
      answers: (
        [$A approx 34.34$，按表中金额计算 $B=11295.42$；个人现金支出占比逐年减少，社会支出占比逐年增加。],
      ),
      explanation: [$A=9656.32/28119.00 times 100 approx 34.34$。
        按表中金额相减，$B=35312.40-13437.75-10579.23=11295.42$（亿元）。
        个人现金支出占比依次为 $34.34%$、$33.88%$、$31.99%$、$29.27%$，逐年减少；社会支出占比依次为 $35.67%$、$35.98%$、$38.05%$、$40.29%$，逐年增加。],
    ),
    subquestion(
      stem: [设 $t=1$ 表示 1978 年，第 $t$ 年卫生总费用与 $t$ 之间的拟合函数为
        $ f(t)=357876.6053/(1+e^(6.4420-0.1136t)). $
        研究函数 $f(t)$ 的单调性，并预测我国卫生总费用首次超过 12 万亿元的年份。],
      answers: ([单调递增；2028 年。],),
      explanation: [∵ $e^(6.4420-0.1136t)$ 随 $t$ 增大而减小，分母始终为正，∴ $f(t)$ 单调递增。
        12 万亿元为 $120000$ 亿元，由 $f(t)>120000$ 得
        $ t>(6.4420-ln(357876.6053/120000-1))/0.1136 approx 50.6843. $
        故最小整数 $t=51$，对应年份为 $1978+51-1=2028$。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知抛物线 $y^2=4x$，$F$ 为焦点，$P$ 为准线 $l$ 上一动点，线段 $P F$ 与抛物线交于点 $Q$，定义 $d(P)=(P F)/(F Q)$。],
  parts: (
    subquestion(
      stem: [若点 $P$ 的坐标为 $(-1,-8/3)$，求 $d(P)$。],
      answers: ([$8/3$],),
      explanation: [焦点 $F(1,0)$，直线 $P F$ 为 $y=4/3(x-1)$。与 $y^2=4x$ 联立，得 $x=1/4$ 或 $x=4$。
        ∵ $Q$ 在线段 $P F$ 上，∴ $Q(1/4,-1)$，$F Q=5/4$，而 $P F=10/3$。故 $d(P)=frac(10/3, 5/4)=8/3$。],
    ),
    subquestion(
      stem: [证明：存在常数 $a$，使得 $2d(P)=P F+a$ 恒成立。],
      answers: ([$a=2$],),
      explanation: [设 $P(-1,t)$，$r=(F Q)/(F P)$。因 $Q$ 在线段 $F P$ 上，故 $Q$ 的横坐标为 $1-2r$。
        由抛物线定义，$F Q$ 等于 $Q$ 到准线 $x=-1$ 的距离，即 $F Q=2-2r$。
        又 $F Q=r F P$，故 $r(F P+2)=2$，于是 $2d(P)=2/r=F P+2$。故常数 $a=2$。],
    ),
    subquestion(
      stem: [设 $P_1,P_2,P_3$ 为准线 $l$ 上的三点，且 $P_1 P_2=P_2 P_3$，比较 $d(P_1)+d(P_3)$ 与 $2d(P_2)$ 的大小。],
      answers: ([$d(P_1)+d(P_3)>2d(P_2)$],),
      explanation: [∵三点共线且互不相同，∴ $P_2$ 为 $P_1 P_3$ 的中点。作 $F$ 关于 $P_2$ 的对称点 $F'$，则 $P_1 F'=P_3 F$，$F F'=2P_2 F$。
        $F,P_2,F'$ 所在直线与准线相交于 $P_2$，不经过 $P_1$，故由三角形两边之和大于第三边，
        $ P_1 F+P_3 F=P_1 F+P_1 F'>F F'=2P_2 F. $
        由第（2）问得
        $ d(P_1)+d(P_3)-2d(P_2)=(P_1 F+P_3 F-2P_2 F)/2>0. $],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [若 ${a_n}$ 是等差数列，公差 $d in (0,pi]$，数列 ${b_n}$ 满足 $b_n=sin a_n$（$n in NN^*$），记 $S={x|x=b_n,n in NN^*}$。],
  parts: (
    subquestion(
      stem: [设 $a_1=0$，$d=2pi/3$，求集合 $S$。],
      answers: ([${-sqrt(3)/2,0,sqrt(3)/2}$],),
      explanation: [$a_n=2(n-1)pi/3$，故 $b_1=0$、$b_2=sqrt(3)/2$、$b_3=-sqrt(3)/2$，且 $b_(n+3)=b_n$。因此 $S={-sqrt(3)/2,0,sqrt(3)/2}$。],
    ),
    subquestion(
      stem: [设 $a_1=pi/2$，求 $d$ 的值，使集合 $S$ 恰有两个元素。],
      answers: ([$d=2pi/3$ 或 $d=pi$],),
      explanation: [$b_n=cos((n-1)d)$，且 $b_1=1$、$b_2=cos d<1$。
        若 $S$ 恰有两个元素，则 $cos 2d=1$ 或 $cos 2d=cos d$。
        前者在 $d in (0,pi]$ 内给出 $d=pi$；后者令 $u=cos d$，得 $2u^2-u-1=0$，排除 $u=1$，得 $u=-1/2$，即 $d=2pi/3$。
        当 $d=pi$ 时，$S={-1,1}$；当 $d=2pi/3$ 时，$S={-1/2,1}$，均符合条件。],
    ),
    subquestion(
      stem: [若集合 $S$ 恰有三个元素，且 $b_(n+T)=b_n$，其中 $T$ 为不超过 7 的正整数，求 $T$ 所有可能的值。],
      answers: ([$3,4,5,6$],),
      explanation: [#step[确定周期必须满足的条件][
          由周期性，$S$ 至多有 $T$ 个元素，故 $T>=3$。
          又对任意 $n$，
          $ 0=sin(a_n+T d)-sin a_n=2sin(T d/2)cos(a_n+T d/2). $
          若 $sin(T d/2)!=0$，则所有 $cos(a_n+T d/2)=0$，相邻两个角之差 $d$ 为 $pi$ 的整数倍，故 $d=pi$。此时 $S$ 至多有两个元素，矛盾。
          故 $T d=2k pi$，其中 $k$ 为正整数。]
        #step[排除 $T=7$][
          此时 $d=2k pi/7$，由 $0<d<=pi$ 得 $k=1,2,3$。
          因 $k$ 与 $7$ 互质，前七个角 $a_1,d+a_1,dot.c,a_1+6d$ 对应单位圆上七个不同的点。
          单位圆上同一正弦值至多对应两个点，七点至少给出四个正弦值，与 $S$ 恰有三个元素矛盾。]
        #step[构造其余各值][
          $T=3$：取 $a_1=0$、$d=2pi/3$，由第（1）问知符合条件。
          $T=4$：取 $a_1=0$、$d=pi/2$，有 $S={-1,0,1}$。
          $T=5$：取 $a_1=pi/10$、$d=2pi/5$，有 $S={sin(pi/10),1,-sin(3pi/10)}$。
          $T=6$：取 $a_1=0$、$d=pi/3$，有 $S={-sqrt(3)/2,0,sqrt(3)/2}$。
          以上均满足 $b_(n+T)=b_n$，故 $T$ 的所有可能值为 $3,4,5,6$。]],
    ),
  ),
)
