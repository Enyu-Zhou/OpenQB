#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "全国三卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017全国3理(云南,广西,贵州,四川,西藏).pdf",
  regions: ("云南", "广西", "贵州", "四川", "西藏"),
)
#let visitors() = {
  set text(size: 8pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: $O$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
        label: (offset: 0.12),
      ),
      grid: (
        stroke: (thickness: figure-style.thickness, dash: figure-style.dash),
      ),
      y: (label: (anchor: "south", offset: 0.2)),
    ))
    let values = (
      26.5,
      27.25,
      27,
      29,
      28.5,
      28.25,
      33,
      35,
      30.5,
      32,
      29,
      28,
      31,
      31.5,
      30.5,
      32,
      32,
      31,
      36,
      37.5,
      33.5,
      35,
      32.5,
      32,
      32.5,
      35,
      36.5,
      36,
      35,
      34,
      39.5,
      42,
      37,
      39,
      35,
      35,
    )
    plot.plot(
      size: (14, 4),
      axis-style: "school-book",
      x-min: 0,
      x-max: 36.5,
      x-tick-step: none,
      x-ticks: range(1, 37).map(i => (
        i,
        text(size: 7pt, str(calc.rem(i - 1, 12) + 1)),
      )),
      y-min: 20,
      y-max: 45,
      y-break: true,
      y-tick-step: none,
      y-ticks: (25, 30, 35, 40, 45),
      y-grid: true,
      y-label: [月接待游客量（万人）],
      {
        plot.annotate(resize: false, {
          let points = values.enumerate().map(((i, y)) => (i + 1, y))
          line(..points)
          for (x, y) in points {
            rect(
              (x - 0.09, y - 0.16),
              (x + 0.09, y + 0.16),
              fill: black,
              stroke: none,
            )
          }
        })
      },
    )
    for (x, label) in ((2.5, [2014 年]), (7.1, [2015 年]), (11.7, [2016 年])) {
      content((x, -0.65), label, padding: 0pt)
    }
  })
}
#let loop-chart() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.7, -0.35), (0.7, 0.35), radius: 0.18)
  content((0, 0), text(size: 9pt)[开始])
  line((-1, -1.9), (0.8, -1.9), (1, -1.1), (-0.8, -1.1), close: true)
  content((0, -1.5), text(size: 9pt)[输入 $N$])
  rect((-2.2, -3.4), (2.2, -2.6))
  content((0, -3), text(size: 9pt)[$t=1,M=100,S=0$])
  line((0, -4), (1.7, -4.7), (0, -5.4), (-1.7, -4.7), close: true)
  content((0, -4.7), text(size: 9pt)[$t<=N$])
  for (y, label) in ((-6.2, [$S=S+M$]), (-8, [$M=-M/10$]), (-9.8, [$t=t+1$])) {
    rect((-1.4, y - 0.5), (1.4, y + 0.5))
    content((0, y), text(size: 9pt, label))
  }
  line((2.7, -6.6), (4.3, -6.6), (4.5, -5.8), (2.9, -5.8), close: true)
  content((3.6, -6.2), text(size: 9pt)[输出 $S$])
  rect((2.9, -8.35), (4.3, -7.65), radius: 0.18)
  content((3.6, -8), text(size: 9pt)[结束])
  for (a, b) in (
    ((0, -0.35), (0, -1.1)),
    ((0, -1.9), (0, -2.6)),
    ((0, -3.4), (0, -4)),
    ((0, -5.4), (0, -5.7)),
    ((0, -6.7), (0, -7.5)),
    ((0, -8.5), (0, -9.3)),
    ((3.6, -6.6), (3.6, -7.65)),
  ) { line(a, b, mark: (end: ">")) }
  line((-1.4, -9.8), (-2.6, -9.8), (-2.6, -3.7), (0, -3.7), mark: (end: ">"))
  line((1.7, -4.7), (3.6, -4.7), (3.6, -5.8), mark: (end: ">"))
  content((0.15, -5.5), text(size: 9pt)[是], anchor: "west")
  content((2.4, -4.6), text(size: 9pt)[否], anchor: "south")
})
#let tetrahedron(auxiliary: false) = cetz.canvas(length: 25mm, {
  import cetz.draw: *
  let a = (-1, 0, 0)
  let b = (0, calc.sqrt(3), 0)
  let c = (1, 0, 0)
  let d = (0, 0, 1)
  let e = (0, calc.sqrt(3) / 2, 0.5)
  oblique-project((0.4, 0.5), (1, 0), (0, 1.8), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, d, b, a)
    line(a, e)
    for (u, v) in ((a, c), (c, b), (c, d), (c, e)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    if auxiliary {
      let o = (0, 0, 0)
      line(d, o, b, stroke: (dash: figure-style.dash))
      content(o, $O$, anchor: "north-west", padding: 4pt)
    }
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "west"),
      (c, $C$, "east"),
      (d, $D$, "south"),
      (e, $E$, "south-west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={(x,y)|x^2+y^2=1}$，$B={(x,y)|y=x}$，则 $A inter B$ 中元素的个数为#choice-placeholder()。],
  choices: ([$3$], [$2$], [$1$], [$0$]),
  answers: ([B],),
  explanation: [联立 $y=x$ 与 $x^2+y^2=1$，得 $x=y=plus.minus sqrt(2)/2$，对应两个不同的有序数对，故交集中有 $2$ 个元素。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设复数 $z$ 满足 $(1+i)z=2i$，则 $abs(z)=$#choice-placeholder()。],
  choices: ([$1/2$], [$sqrt(2)/2$], [$sqrt(2)$], [$2$]),
  answers: ([C],),
  explanation: [$z=(2i)/(1+i)=(2i(1-i))/2=1+i$，故 $abs(z)=sqrt(1^2+1^2)=sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某城市为了解游客人数的变化规律，提高旅游服务质量，收集并整理了 2014 年 1 月至 2016 年 12 月期间月接待游客量（单位：万人）的数据，绘制了下面的折线图。
    #figure(visitors())
    根据该折线图，下列结论错误的是#choice-placeholder()。],
  choices: (
    [月接待游客量逐月增加],
    [年接待游客量逐年增加],
    [各年的月接待游客量高峰期大致在 $7,8$ 月],
    [各年 $1$ 月至 $6$ 月的月接待游客量相对于 $7$ 月至 $12$ 月，波动性更小，变化比较平稳],
  ),
  answers: ([A],),
  explanation: [各年月接待游客量有升有降，例如每年 $8$ 月到 $9$ 月均下降，因此 A 错误。图中各年的总接待量逐年增加，高峰期大致位于 $7,8$ 月，上半年的波动较小，B、C、D 均符合图示。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$(x+y)(2x-y)^5$ 的展开式中的 $x^3 y^3$ 的系数为#choice-placeholder()。],
  choices: ([$-80$], [$-40$], [$40$], [$80$]),
  answers: ([C],),
  explanation: [分别取 $x$ 与 $(2x-y)^5$ 中的 $x^2 y^3$ 项相乘，或取 $y$ 与其中的 $x^3 y^2$ 项相乘，所求系数为 $C_5^3 2^2(-1)^3+C_5^2 2^3(-1)^2=-40+80=40$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的一条渐近线方程为 $y=sqrt(5)/2 x$，且与椭圆 $x^2/12+y^2/3=1$ 有公共焦点，则 $C$ 的方程为#choice-placeholder()。],
  choices: (
    [$x^2/8-y^2/10=1$],
    [$x^2/4-y^2/5=1$],
    [$x^2/5-y^2/4=1$],
    [$x^2/4-y^2/3=1$],
  ),
  answers: ([B],),
  explanation: [椭圆的焦点为 $(plus.minus 3,0)$，故双曲线有 $a^2+b^2=9$。由渐近线得 $b/a=sqrt(5)/2$，即 $b^2=5a^2/4$，解得 $a^2=4,b^2=5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=cos(x+pi/3)$，则下列结论错误的是#choice-placeholder()。],
  choices: (
    [$f(x)$ 的一个周期为 $-2pi$],
    [$y=f(x)$ 的图象关于直线 $x=(8pi)/3$ 对称],
    [$f(x+pi)$ 的一个零点为 $x=pi/6$],
    [$f(x)$ 在 $(pi/2,pi)$ 单调递减],
  ),
  answers: ([D],),
  explanation: [
    #step[选项 A][$f(x-2pi)=f(x)$，故 $-2pi$ 是一个周期。]
    #step[选项 B][∵ $(8pi)/3+pi/3=3pi$，∴ $x=(8pi)/3$ 是图象的一条对称轴。]
    #step[选项 C][$f(pi/6+pi)=cos((3pi)/2)=0$，正确。]
    #step[选项 D][$f$ 在 $(pi/2,(2pi)/3)$ 上递减，在 $((2pi)/3,pi)$ 上递增，故在整个 $(pi/2,pi)$ 上不单调。]
  ],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图的程序框图，为使输出 $S$ 的值小于 $91$，则输入的正整数 $N$ 的最小值为#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$5$], [$4$], [$3$], [$2$]),
  answers: ([D],),
  explanation: [当 $N=1$ 时，循环一次，输出 $S=100$，不满足要求。当 $N=2$ 时，循环两次，输出 $S=100-10=90<91$，故最小值为 $2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知圆柱的高为 $1$，它的两个底面的圆周在直径为 $2$ 的同一个球的球面上，则该圆柱的体积为#choice-placeholder()。],
  choices: ([$pi$], [$(3pi)/4$], [$pi/2$], [$pi/4$]),
  answers: ([B],),
  explanation: [球的半径为 $1$，两个底面到球心的距离均为 $1/2$。设底面半径为 $r$，由勾股定理得 $r^2=1-(1/2)^2=3/4$，故圆柱体积为 $pi r^2 dot 1=(3pi)/4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [等差数列 ${a_n}$ 的首项为 $1$，公差不为 $0$，若 $a_2,a_3,a_6$ 成等比数列，则 ${a_n}$ 前 $6$ 项的和为#choice-placeholder()。],
  choices: ([$-24$], [$-3$], [$3$], [$8$]),
  answers: ([A],),
  explanation: [设公差为 $d!=0$，则 $(1+2d)^2=(1+d)(1+5d)$，整理得 $d(d+2)=0$，故 $d=-2$。于是 $S_6=6+15d=-24$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的左、右顶点分别为 $A_1,A_2$，且以线段 $A_1 A_2$ 为直径的圆与直线 $b x-a y+2a b=0$ 相切，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$sqrt(6)/3$], [$sqrt(3)/3$], [$sqrt(2)/3$], [$1/3$]),
  answers: ([A],),
  explanation: [该圆的圆心为原点，半径为 $a$。由相切得 $(2a b)/sqrt(a^2+b^2)=a$，即 $a^2=3b^2$。因此 $e=sqrt(1-b^2/a^2)=sqrt(2/3)=sqrt(6)/3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=x^2-2x+a(e^(x-1)+e^(-x+1))$ 有唯一零点，则 $a=$#choice-placeholder()。],
  choices: ([$-1/2$], [$1/3$], [$1/2$], [$1$]),
  answers: ([C],),
  explanation: [令 $t=x-1$，则 $f(x)=t^2-1+a(e^t+e^(-t))$，是关于 $t$ 的偶函数。若零点唯一，只能在 $t=0$，从而 $-1+2a=0$，得 $a=1/2$。反之，此时由 $e^t+e^(-t)>=2$ 得 $f(x)>=t^2>=0$，且只有 $t=0$ 时取等号，确有唯一零点。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在矩形 $A B C D$ 中，$A B=1$，$A D=2$，动点 $P$ 在以点 $C$ 为圆心且与 $B D$ 相切的圆上。若 $arrow(A P)=lambda arrow(A B)+mu arrow(A D)$，则 $lambda+mu$ 的最大值为#choice-placeholder()。],
  choices: ([$3$], [$2sqrt(2)$], [$sqrt(5)$], [$2$]),
  answers: ([A],),
  explanation: [取 $A=(0,0),B=(1,0),D=(0,2),C=(1,2)$，则直线 $B D$ 为 $2x+y-2=0$，圆的半径为 $r=2/sqrt(5)$。设 $P=(1+u,2+v)$，则 $u^2+v^2=4/5$，由向量关系知 $lambda+mu=2+u+v/2$。由柯西不等式，$u+v/2<=sqrt(1+1/4)sqrt(u^2+v^2)=1$，且当 $(u,v)=(4/5,2/5)$ 时取等号，故最大值为 $3$。],
)
#section[填空题：共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(x-y>=0, x+y-2<=0, y>=0)$，则 $z=3x-4y$ 的最小值为#fill-placeholder()。],
  answers: ([$-1$],),
  explanation: [由 $x>=y$、$x+y<=2$ 得 $y<=1$，故 $z=3(x-y)-y>=-y>=-1$。当 $x=y=1$ 时满足全部约束且取等号，故最小值为 $-1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设等比数列 ${a_n}$ 满足 $a_1+a_2=-1$，$a_1-a_3=-3$，则 $a_4=$#fill-placeholder()。],
  answers: ([$-8$],),
  explanation: [设公比为 $q$，由 $a_1(1+q)=-1$，$a_1(1-q^2)=-3$，两式相除得 $1-q=3$，故 $q=-2$，$a_1=1$。所以 $a_4=a_1 q^3=-8$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设函数 $f(x)=cases(x+1 quad &x<=0, 2^x quad &x>0)$，则满足 $f(x)+f(x-1/2)>1$ 的 $x$ 的取值范围是#fill-placeholder()。],
  answers: ([$(-1/4,+infinity)$],),
  explanation: [两段函数各自严格递增，且在 $x=0$ 处连续，故 $f$ 在 $RR$ 上严格递增。因此 $g(x)=f(x)+f(x-1/2)$ 也严格递增。又 $g(-1/4)=f(-1/4)+f(-3/4)=3/4+1/4=1$，所以不等式等价于 $x> -1/4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [$a,b$ 为空间中两条互相垂直的直线，等腰直角三角形 $A B C$ 的直角边 $A C$ 所在直线与 $a,b$ 都垂直，斜边 $A B$ 以直线 $A C$ 为旋转轴旋转，有下列结论：

    ① 当直线 $A B$ 与 $a$ 成 $60 degree$ 角时，$A B$ 与 $b$ 成 $30 degree$ 角；

    ② 当直线 $A B$ 与 $a$ 成 $60 degree$ 角时，$A B$ 与 $b$ 成 $60 degree$ 角；

    ③ 直线 $A B$ 与 $a$ 所成角的最小值为 $45 degree$；

    ④ 直线 $A B$ 与 $a$ 所成角的最大值为 $60 degree$。

    其中正确的是#fill-placeholder()。（填写所有正确结论的编号）],
  answers: ([②③],),
  explanation: [取三个坐标轴分别平行于 $a,b,A C$，并以直角边长为单位，则可取 $A=(0,0,1)$，$C=(0,0,0)$，$B=(cos theta,sin theta,0)$。设 $A B$ 与 $a,b$ 所成角分别为 $alpha,beta$，则
    $
      cos alpha=abs(cos theta)/sqrt(2),quad cos beta=abs(sin theta)/sqrt(2),quad cos^2 alpha+cos^2 beta=1/2.
    $
    当 $alpha=60 degree$ 时，$cos^2 beta=1/4$，故 $beta=60 degree$，②正确，①错误。又 $cos alpha in [0,1/sqrt(2)]$，故 $alpha in [45 degree,90 degree]$，③正确，④错误。],
)
#section[解答题：共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17～21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $sin A+sqrt(3)cos A=0$，$a=2sqrt(7)$，$b=2$。],
  parts: (
    subquestion(
      stem: [求 $c$。],
      answers: ([$4$],),
      explanation: [∵ $0<A<pi$，$sin A>0$，∴ $cos A<0$，由 $tan A=-sqrt(3)$ 得 $A=(2pi)/3$。由余弦定理，$28=4+c^2+2c$，即 $(c-4)(c+6)=0$。由 $c>0$ 得 $c=4$。],
    ),
    subquestion(
      stem: [设 $D$ 为 $B C$ 边上一点，且 $A D perp A C$，求 $triangle A B D$ 的面积。],
      answers: ([$sqrt(3)$],),
      explanation: [由余弦定理得 $cos C=(a^2+b^2-c^2)/(2a b)=2/sqrt(7)$。在直角三角形 $A C D$ 中，$C D=frac(A C, cos C)=sqrt(7)=1/2 B C$，故 $D$ 为 $B C$ 中点。因此
        $
          S_(triangle A B D)=1/2 S_(triangle A B C)=1/4 b c sin A=1/4 times 2 times 4 times sqrt(3)/2=sqrt(3).
        $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某超市计划按月订购一种酸奶，每天进货量相同，进货成本每瓶 $4$ 元，售价每瓶 $6$ 元，未售出的酸奶降价处理，以每瓶 $2$ 元的价格当天全部处理完。根据往年销售经验，每天需求量与当天最高气温（单位：℃）有关。如果最高气温不低于 $25$，需求量为 $500$ 瓶；如果最高气温位于区间 $[20,25)$，需求量为 $300$ 瓶；如果最高气温低于 $20$，需求量为 $200$ 瓶。为了确定六月份的订购计划，统计了前三年六月份各天的最高气温数据，得下面的频数分布表：
    #table(
      columns: 7,
      align: center,
      [最高气温],
      [$[10,15)$],
      [$[15,20)$],
      [$[20,25)$],
      [$[25,30)$],
      [$[30,35)$],
      [$[35,40)$],

      [天数], [$2$], [$16$], [$36$], [$25$], [$7$], [$4$],
    )
    以最高气温位于各区间的频率代替最高气温位于该区间的概率。],
  parts: (
    subquestion(
      stem: [求六月份这种酸奶一天的需求量 $X$（单位：瓶）的分布列。],
      answers: ([分布列见解析。],),
      explanation: [样本共 $90$ 天，故 $P(X=200)=(2+16)/90=0.2$，$P(X=300)=36/90=0.4$，$P(X=500)=(25+7+4)/90=0.4$，分布列为：
        #table(
          columns: 4,
          align: center,
          [$X$], [$200$], [$300$], [$500$],
          [$P$], [$0.2$], [$0.4$], [$0.4$],
        )],
    ),
    subquestion(
      stem: [设六月份一天销售这种酸奶的利润为 $Y$（单位：元），当六月份这种酸奶一天的进货量 $n$（单位：瓶）为多少时，$Y$ 的数学期望达到最大值？],
      answers: ([当 $n=300$ 时最大，最大值为 $520$ 元。],),
      explanation: [
        #step[写出利润][当 $X>=n$ 时全部按原价售出，$Y=2n$；当 $X<n$ 时，$Y=6X+2(n-X)-4n=4X-2n$。因此 $Y=4min(X, n)-2n$。]
        #step[分段求期望][结合分布列，得到
          $
            E(Y)=cases(2n quad &0<=n<=200, 160+1.2n quad &200<n<=300, 640-0.4n quad &300<n<=500, 1440-2n quad &n>500).
          $
          它在 $[0,300]$ 上严格递增，在 $[300,+infinity)$ 上严格递减，故每天进货 $300$ 瓶时期望利润最大，最大值为 $160+1.2 times 300=520$ 元。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，四面体 $A B C D$ 中，$triangle A B C$ 是正三角形，$triangle A C D$ 是直角三角形，$angle A B D=angle C B D$，$A B=B D$。
    #figure(tetrahedron())],
  parts: (
    subquestion(
      stem: [证明：平面 $A C D perp$ 平面 $A B C$。],
      answers: ([证明见解析。],),
      explanation: [由 $A B=C B$、$B D$ 公共及 $angle A B D=angle C B D$，得 $triangle A B D equiv triangle C B D$，故 $A D=C D$。∵ $triangle A C D$ 是直角三角形，∴ $angle A D C=90 degree$。取 $A C$ 中点 $O$，则 $D O perp A C$，$D O=A O$；又正三角形 $A B C$ 中 $B O perp A C$。由
        $ B O^2+D O^2=B O^2+A O^2=A B^2=B D^2 $
        得 $D O perp B O$。故 $D O$ 垂直于平面 $A B C$ 内两条相交直线 $A C,B O$，从而 $D O perp$ 平面 $A B C$。又 $D O subset$ 平面 $A C D$，所以两平面垂直。
        #figure(tetrahedron(auxiliary: true))],
    ),
    subquestion(
      stem: [过 $A C$ 的平面交 $B D$ 于点 $E$，若平面 $A E C$ 把四面体 $A B C D$ 分成体积相等的两部分，求二面角 $D-A E-C$ 的余弦值。],
      answers: ([$sqrt(7)/7$],),
      explanation: [
        #step[确定点的位置][两个小四面体以 $A E C$ 为公共底面，高之比等于 $B E:E D$，故等体积条件给出 $B E=E D$。取 $O$ 为原点、$O A$ 为单位长度，令 $A=(-1,0,0)$，$C=(1,0,0)$，$B=(0,sqrt(3),0)$，$D=(0,0,1)$，则 $E=(0,sqrt(3)/2,1/2)$。]
        #step[计算二面角][取棱 $A E$ 的方向向量 $bold(u)=2arrow(A E)=(2,sqrt(3),1)$。将 $arrow(A D)$、$arrow(A C)$ 分别投影到垂直于 $bold(u)$ 的平面，得到指向相应半平面的向量
          $
            bold(v)=arrow(A D)-3/8 bold(u),quad bold(w)=arrow(A C)-1/2 bold(u).
          $
          ∵ $arrow(A D)=(1,0,1)$，$arrow(A C)=(2,0,0)$，∴ $bold(v) dot bold(w)=1/2$，$abs(bold(v))^2=7/8$，$abs(bold(w))^2=2$。二者夹角即所求二面角，故
          $
            cos angle(bold(v), bold(w))=frac(1/2, sqrt(7/8)sqrt(2))=sqrt(7)/7.
          $]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知抛物线 $C:y^2=2x$，过点 $(2,0)$ 的直线 $l$ 交 $C$ 于 $A,B$ 两点，圆 $M$ 是以线段 $A B$ 为直径的圆。],
  parts: (
    subquestion(
      stem: [证明：坐标原点 $O$ 在圆 $M$ 上。],
      answers: ([证明见解析。],),
      explanation: [直线 $l$ 不可能平行于 $x$ 轴，否则仅与抛物线相交于一点，故可设 $l:x=k y+2$。设 $A=(x_1,y_1)$，$B=(x_2,y_2)$，联立得 $y^2-2k y-4=0$，所以 $y_1 y_2=-4$。又 $x_i=y_i^2/2$，故 $x_1 x_2=4$。因此 $arrow(O A) dot arrow(O B)=x_1 x_2+y_1 y_2=0$。由于 $O$ 不在 $l$ 上，$O$ 与 $A,B$ 不重合，故 $angle A O B=90 degree$，即 $O$ 在以 $A B$ 为直径的圆上。],
    ),
    subquestion(
      stem: [设圆 $M$ 过点 $P(4,-2)$，求直线 $l$ 与圆 $M$ 的方程。],
      answers: (
        [$l:x-y-2=0$，圆 $M:(x-3)^2+(y-1)^2=10$；或 $l:2x+y-4=0$，圆 $M:(x-9/4)^2+(y+1/2)^2=85/16$。],
      ),
      explanation: [由第（1）问的韦达关系得 $y_1+y_2=2k$，$x_1+x_2=k(y_1+y_2)+4=2k^2+4$，故圆心为 $M=(k^2+2,k)$。由圆经过原点，半径平方为 $(k^2+2)^2+k^2$。再代入 $P=(4,-2)$，得到
        $ [4-(k^2+2)]^2+(-2-k)^2=(k^2+2)^2+k^2, $
        整理得 $2k^2-k-1=0$，解得 $k=1$ 或 $k=-1/2$。分别代入直线及圆心、半径公式即得两组方程。两种情况下交点方程的判别式 $4k^2+16>0$，均符合条件。],
    ),
  ),
)
#question("solution", score: 12, stem: [已知函数 $f(x)=x-1-a ln x$。], parts: (
  subquestion(
    stem: [若 $f(x)>=0$，求 $a$ 的值。],
    answers: ([$1$],),
    explanation: [定义域为 $(0,+infinity)$，且 $f(1)=0$。由恒非负条件知 $x=1$ 为极小值点，故 $f'(1)=1-a=0$，即 $a=1$。反之，当 $a=1$ 时，$f'(x)=(x-1)/x$，函数在 $(0,1)$ 上递减，在 $(1,+infinity)$ 上递增，最小值为 $f(1)=0$，符合要求。],
  ),
  subquestion(
    stem: [设 $m$ 为整数，且对于任意正整数 $n$，$(1+1/2)(1+1/2^2)dots(1+1/2^n)<m$，求 $m$ 的最小值。],
    answers: ([$3$],),
    explanation: [由第（1）问得 $ln x<x-1$（$x>1$）。令 $P_n=product_(k=1)^n (1+2^(-k))$，则
      $ ln P_n=sum_(k=1)^n ln(1+2^(-k))<sum_(k=1)^n 2^(-k)=1-2^(-n)<1. $
      故 $P_n<e<3$，取 $m=3$ 满足条件。另一方面，$P_3=3/2 times 5/4 times 9/8=135/64>2$，所以任何整数 $m<=2$ 均不满足条件。故最小值为 $3$。],
  ),
))
选考题：请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。
#question(
  "solution",
  score: 10,
  stem: [在直角坐标系 $x O y$ 中，直线 $l_1$ 的参数方程为 $cases(x=2+t, y=k t)$（$t$ 为参数），直线 $l_2$ 的参数方程为 $cases(x=-2+m, y=m/k)$（$m$ 为参数）。设 $l_1$ 与 $l_2$ 的交点为 $P$，当 $k$ 变化时，$P$ 的轨迹为曲线 $C$。],
  parts: (
    subquestion(
      stem: [写出 $C$ 的普通方程。],
      answers: ([$x^2-y^2=4$（$y!=0$）],),
      explanation: [消去参数得 $y=k(x-2)$、$k y=x+2$。其中 $k!=0$，且 $k=plus.minus 1$ 时两直线平行，无交点。将两式相乘，约去非零的 $k$ 得 $y^2=(x-2)(x+2)$。若 $y=0$，两式分别要求 $x=2$ 和 $x=-2$，矛盾，故 $y!=0$。反之，双曲线上任意 $y!=0$ 的点均可取 $k=y/(x-2)$，此时 $k!=0,plus.minus 1$，且满足两条直线方程，所以轨迹为 $x^2-y^2=4$（$y!=0$）。],
    ),
    subquestion(
      stem: [以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，设 $l_3:rho(cos theta+sin theta)-sqrt(2)=0$，$M$ 为 $l_3$ 与 $C$ 的交点，求 $M$ 的极径。],
      answers: ([$sqrt(5)$],),
      explanation: [直线 $l_3$ 的直角坐标方程为 $x+y=sqrt(2)$。与 $(x+y)(x-y)=4$ 联立得 $x-y=2sqrt(2)$，所以 $M=((3sqrt(2))/2,-sqrt(2)/2)$，满足 $y!=0$。其极径为 $rho=sqrt(x^2+y^2)=sqrt(5)$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [已知函数 $f(x)=abs(x+1)-abs(x-2)$。],
  parts: (
    subquestion(
      stem: [求不等式 $f(x)>=1$ 的解集。],
      answers: ([$[1,+infinity)$],),
      explanation: [将函数写为
        $ f(x)=cases(-3 quad &x<=-1, 2x-1 quad &-1<x<2, 3 quad &x>=2). $
        当 $x<=-1$ 时不成立；当 $-1<x<2$ 时要求 $x>=1$；当 $x>=2$ 时恒成立。故解集为 $[1,+infinity)$。],
    ),
    subquestion(
      stem: [若不等式 $f(x)>=x^2-x+m$ 的解集非空，求 $m$ 的取值范围。],
      answers: ([$(-infinity,5/4]$],),
      explanation: [原条件等价于 $m<=max_(x in RR)[f(x)-x^2+x]$。设 $g(x)=f(x)-x^2+x$，则
        $
          g(x)=cases(-x^2+x-3 quad &x<=-1, -x^2+3x-1 quad &-1<x<2, -x^2+x+3 quad &x>=2).
        $
        第一段最大值为 $g(-1)=-5$；第二段在 $x=3/2$ 处取得最大值 $5/4$；第三段最大值为 $g(2)=1$。所以全局最大值为 $5/4$，且能取到，故 $m in (-infinity,5/4]$。],
    ),
  ),
)
