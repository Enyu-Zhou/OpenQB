#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校春季招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2016/2016春季上海.pdf",
  regions: ("上海",),
)

#let power-graph(kind) = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    shared-zero: $O$,
  ))
  plot.plot(
    size: (3, 2.7),
    axis-style: "school-book",
    x-min: -2.2,
    x-max: 2.2,
    y-min: -2,
    y-max: 2,
    x-tick-step: none,
    y-tick-step: none,
    x-label: $x$,
    y-label: $y$,
    {
      plot.annotate(resize: false, {
        if kind == "B" {
          for sign in (-1, 1) {
            line(
              ..range(81).map(i => (sign * 2 * i / 80, calc.sqrt(2 * i / 80))),
            )
          }
        } else {
          for sign in if kind == "A" { (1,) } else { (-1, 1) } {
            let start = if kind == "D" { 0.55 } else { 0.75 }
            line(
              ..range(81).map(i => {
                let x = sign * (start + (2 - start) * i / 80)
                (x, if kind == "D" { 1 / x } else { 1 / (x * x) })
              }),
            )
          }
        }
      })
    },
  )
})
#let prism(auxiliary: false) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (0, 0, 0)
  let B = (3, 0, 0)
  let C = (1.5, 1.5 * calc.sqrt(3), 0)
  let A1 = (0, 0, 4)
  let B1 = (3, 0, 4)
  let C1 = (1.5, 1.5 * calc.sqrt(3), 4)
  oblique-project((1, 0), (0.38, 0.36), (0, 1), {
    line(A, B, B1, C1, A1, A)
    line(A1, B1)
    line(A, C, B, stroke: (dash: figure-style.dash))
    line(C, C1, B, stroke: (dash: figure-style.dash))
    if auxiliary { line(A1, B) }
    for (p, label, anchor) in (
      (A, $A$, "north-east"),
      (B, $B$, "north-west"),
      (C, $C$, "south-east"),
      (A1, $A_1$, "east"),
      (B1, $B_1$, "west"),
      (C1, $C_1$, "south"),
    ) {
      if auxiliary and p == C {
        content((1.7, 1.5 * calc.sqrt(3) - 1.2, 0), label)
      } else { content(p, label, anchor: anchor, padding: 4pt) }
    }
  })
})
#let reflector() = cetz.canvas(length: 2.2mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((1, 0), (0, 1), (0.16, 0), {
    line(
      ..range(161).map(i => {
        let y = -12 + 24 * i / 160
        (y * y / 14.4, y, 0)
      }),
    )
    line(
      ..range(181).map(i => (
        10,
        12 * calc.cos(i * 2deg),
        12 * calc.sin(i * 2deg),
      )),
    )
    circle((3.6, 0, 0), radius: 0.12, fill: black, stroke: none)
    content((0, 0, 0), $O$, anchor: "east", padding: 3pt)
    content((3.6, 0, 0), $F$, anchor: "north", padding: 3pt)
  })
  line((0, 0), (0, -15.8))
  line((10, -12), (10, -15.8))
  line((0, -14.8), (10, -14.8), mark: (start: ">", end: ">"))
  content((5, -16.7), [10 cm])
  line((10, 12), (15.5, 12))
  line((10, -12), (15.5, -12))
  line((14.6, -12), (14.6, 12), mark: (start: ">", end: ">"))
  content((15.6, 0), [24 cm], anchor: "west")
})
#let zigzag() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    shared-zero: $O$,
  ))
  plot.plot(
    size: (6.1, 3.5),
    axis-style: "school-book",
    x-min: -0.6,
    x-max: 5.5,
    y-min: -0.6,
    y-max: 2.9,
    x-tick-step: none,
    y-tick-step: none,
    x-label: $x$,
    y-label: $y$,
    {
      plot.annotate(resize: false, {
        line((1, 2), (2, 1), (3, 2), (4, 1), (5, 2))
        for (p, label) in (
          ((0.85, 2.3), $A$),
          ((2, 0.65), $B$),
          ((3, 2.3), $C$),
          ((4, 0.65), $D$),
          ((5.15, 2.3), $E$),
        ) { content(p, label) }
      })
    },
  )
})

#align(center)[第Ⅰ卷]
#section[填空题：本大题共 12 题，每题 3 分，共 36 分。]
#question(
  "fill-in",
  score: 3,
  stem: [复数 $3+4i$（$i$ 为虚数单位）的实部是#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [复数 $a+b i$ 的实部为 $a$，故实部为 $3$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [若 $log_2 (x+1)=3$，则 $x=$#fill-placeholder()。],
  answers: ([$7$],),
  explanation: [由 $x+1=2^3=8$，得 $x=7$，满足 $x+1>0$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [直线 $y=x-1$ 与直线 $y=2$ 的夹角为#fill-placeholder()。],
  answers: ([$pi/4$],),
  explanation: [直线 $y=x-1$ 的倾斜角为 $pi/4$，而 $y=2$ 平行于 $x$ 轴，故夹角为 $pi/4$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [函数 $f(x)=sqrt(x-2)$ 的定义域为#fill-placeholder()。],
  answers: ([$[2,+infinity)$],),
  explanation: [由被开方数 $x-2>=0$ 得 $x>=2$，故定义域为 $[2,+infinity)$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [三阶行列式 $mat(delim: "|", 1, -3, 5; 4, 0, 0; -1, 2, 1)$ 中，元素 $5$ 的代数余子式的值为#fill-placeholder()。],
  answers: ([$8$],),
  explanation: [元素 $5$ 位于第 $1$ 行、第 $3$ 列，其代数余子式为 $(-1)^(1+3) mat(delim: "|", 4, 0; -1, 2)=4 times 2-0 times (-1)=8$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [函数 $f(x)=1/x+a$ 的反函数的图像经过点 $(2,1)$，则实数 $a=$#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [反函数图像经过 $(2,1)$，等价于原函数图像经过 $(1,2)$，所以 $1+a=2$，得 $a=1$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [在 $triangle A B C$ 中，若 $A=30 degree$，$B=45 degree$，$B C=sqrt(6)$，则 $A C=$#fill-placeholder()。],
  answers: ([$2 sqrt(3)$],),
  explanation: [由正弦定理，$(A C)/(sin B)=(B C)/(sin A)$，故 $A C=(sqrt(6) sin 45 degree)/(sin 30 degree)=2 sqrt(3)$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [$4$ 个人排成一排照相，不同排列方式的种数为#fill-placeholder()（结果用数值表示）。],
  answers: ([$24$],),
  explanation: [将 $4$ 个不同的人全排列，共有 $4!=4 times 3 times 2 times 1=24$ 种方式。],
)
#question(
  "fill-in",
  score: 3,
  stem: [无穷等比数列 $\{a_n\}$ 的首项为 $2$，公比为 $1/3$，则 $\{a_n\}$ 的各项的和为#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [∵ 公比的绝对值小于 $1$，∴ 各项的和为 $2/(1-1/3)=3$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [若 $2+i$（$i$ 为虚数单位）是关于 $x$ 的实系数一元二次方程 $x^2+a x+5=0$ 的一个虚根，则 $a=$#fill-placeholder()。],
  answers: ([$-4$],),
  explanation: [实系数方程的非实根成共轭对，故另一根为 $2-i$。由韦达定理，$-a=(2+i)+(2-i)=4$，得 $a=-4$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [函数 $y=x^2-2x+1$ 在区间 $[0,m]$ 上的最小值为 $0$，最大值为 $1$，则实数 $m$ 的取值范围是#fill-placeholder()。],
  answers: ([$[1,2]$],),
  explanation: [由 $y=(x-1)^2$ 的最小值为 $0$，知 $m>=1$。

    又 $f(0)=1$，最大值不超过 $1$ 要求 $(m-1)^2<=1$。结合 $m>=1$，得 $1<=m<=2$；此时两个最值均能取到。],
)
#question(
  "fill-in",
  score: 3,
  stem: [在平面直角坐标系 $x O y$ 中，点 $A,B$ 是圆 $x^2+y^2-6x+5=0$ 上的两个动点，且满足 $abs(A B)=2 sqrt(3)$，则 $abs(arrow(O A)+arrow(O B))$ 的最小值为#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [圆心为 $C(3,0)$，半径为 $2$。设弦 $A B$ 的中点为 $M$，则 $C M=sqrt(2^2-(sqrt(3))^2)=1$。

    ∵ $arrow(O A)+arrow(O B)=2 arrow(O M)$，∴ 所求量为 $2 O M$。

    由 $O M>=O C-C M=2$，得下界为 $4$。取 $M(2,0)$，对应弦端点 $(2,plus.minus sqrt(3))$ 均在圆上，故最小值确为 $4$。],
)
#section[选择题：本大题共 12 题，每题 3 分，共 36 分。每题只有一个正确选项。]
#question(
  "single-choice",
  score: 3,
  stem: [满足 $sin alpha>0$ 且 $tan alpha<0$ 的角 $alpha$ 属于#choice-placeholder()。],
  choices: ([第一象限], [第二象限], [第三象限], [第四象限]),
  answers: ([B],),
  explanation: [正弦为正时，角在第一或第二象限；正切为负时，角在第二或第四象限，故应在第二象限。],
)
#question(
  "single-choice",
  score: 3,
  stem: [半径为 $1$ 的球的表面积为#choice-placeholder()。],
  choices: ([$pi$], [$(4pi)/3$], [$2pi$], [$4pi$]),
  answers: ([D],),
  explanation: [由球的表面积公式 $S=4pi r^2$，得 $S=4pi$。],
)
#question(
  "single-choice",
  score: 3,
  stem: [在 $(1+x)^6$ 的二项展开式中，$x^2$ 项的系数为#choice-placeholder()。],
  choices: ([$2$], [$6$], [$15$], [$20$]),
  answers: ([C],),
  explanation: [$x^2$ 项为 $C_6^2 x^2$，其系数为 $C_6^2=(6 times 5)/2=15$。],
)
#question(
  "single-choice",
  score: 3,
  stem: [幂函数 $y=x^(-2)$ 的大致图像是#choice-placeholder()。],
  choices: (
    [#figure(power-graph("A"))],
    [#figure(power-graph("B"))],
    [#figure(power-graph("C"))],
    [#figure(power-graph("D"))],
  ),
  answers: ([C],),
  explanation: [$y=1/x^2$ 的定义域为 $RR without \{0\}$，且 $y>0$，图像关于 $y$ 轴对称。

    当 $x>0$ 时函数递减，$x$ 趋近于 $0$ 时函数值趋于正无穷，故选 C。],
)
#question(
  "single-choice",
  score: 3,
  stem: [已知向量 $arrow(a)=(1,0),arrow(b)=(1,2)$，则向量 $arrow(b)$ 在向量 $arrow(a)$ 方向上的投影为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$(1,0)$], [$(0,2)$]),
  answers: ([A],),
  explanation: [所求投影为数量 $abs(arrow(b)) cos angle(arrow(a), arrow(b))=(arrow(a) dot arrow(b))/abs(arrow(a))=1$。],
)
#question(
  "single-choice",
  score: 3,
  stem: [设直线 $l$ 与平面 $alpha$ 平行，直线 $m$ 在平面 $alpha$ 上，那么#choice-placeholder()。],
  choices: (
    [直线 $l$ 平行于直线 $m$],
    [直线 $l$ 与直线 $m$ 异面],
    [直线 $l$ 与直线 $m$ 没有公共点],
    [直线 $l$ 与直线 $m$ 不垂直],
  ),
  answers: ([C],),
  explanation: [∵ $l parallel alpha$，∴ $l$ 与 $alpha$ 无公共点。又 $m subset alpha$，∴ $l$ 与 $m$ 无公共点。它们既可能平行，也可能异面，异面时还可能垂直。],
)
#question(
  "single-choice",
  score: 3,
  stem: [在用数学归纳法证明等式 $1+2+3+dots+2n=2n^2+n quad (n in NN^*)$ 的第 (ii) 步中，假设 $n=k$ 时原等式成立。那么在 $n=k+1$ 时，需要证明的等式为#choice-placeholder()。],
  choices: (
    [$1+2+3+dots+2k+2(k+1)=2k^2+k+2(k+1)^2+(k+1)$],
    [$1+2+3+dots+2k+2(k+1)=2(k+1)^2+(k+1)$],
    [$1+2+3+dots+2k+(2k+1)+2(k+1)=2k^2+k+2(k+1)^2+(k+1)$],
    [$1+2+3+dots+2k+(2k+1)+2(k+1)=2(k+1)^2+(k+1)$],
  ),
  answers: ([D],),
  explanation: [将命题中的 $n$ 换为 $k+1$，左边应从 $1$ 加到 $2k+2$，比 $n=k$ 时多出 $2k+1$ 和 $2k+2$ 两项；右边为 $2(k+1)^2+(k+1)$，故选 D。],
)
#question(
  "single-choice",
  score: 3,
  stem: [关于双曲线 $x^2/16-y^2/4=1$ 与 $y^2/16-x^2/4=1$ 的焦距和渐近线，下列说法正确的是#choice-placeholder()。],
  choices: (
    [焦距相等，渐近线相同],
    [焦距相等，渐近线不相同],
    [焦距不相等，渐近线相同],
    [焦距不相等，渐近线不相同],
  ),
  answers: ([B],),
  explanation: [两者均有 $c^2=16+4=20$，所以焦距均为 $2c=4 sqrt(5)$。

    第一条双曲线的渐近线为 $y=plus.minus x/2$，第二条为 $y=plus.minus 2x$，故渐近线不相同。],
)
#question(
  "single-choice",
  score: 3,
  stem: [设函数 $y=f(x)$ 的定义域为 $RR$，则“$f(0)=0$”是“$y=f(x)$ 为奇函数”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([B],),
  explanation: [若 $f$ 为奇函数，则 $f(0)=-f(0)$，必有 $f(0)=0$。

    反之，$f(x)=x^2$ 满足 $f(0)=0$，却不是奇函数，故为必要不充分条件。],
)
#question(
  "single-choice",
  score: 3,
  stem: [下列关于实数 $a,b$ 的不等式中，不恒成立的是#choice-placeholder()。],
  choices: (
    [$a^2+b^2>=2a b$],
    [$a^2+b^2>=-2a b$],
    [$((a+b)/2)^2>=a b$],
    [$((a+b)/2)^2>=-a b$],
  ),
  answers: ([D],),
  explanation: [选项 A、B 分别等价于 $(a-b)^2>=0$、$(a+b)^2>=0$；选项 C 等价于 $(a-b)^2/4>=0$，均恒成立。

    对选项 D，取 $a=1,b=-1$，则左边为 $0$，右边为 $1$，不等式不成立。],
)
#question(
  "single-choice",
  score: 3,
  stem: [设单位向量 $arrow(e)_1$ 与 $arrow(e)_2$ 既不平行也不垂直，对非零向量 $arrow(a)=x_1 arrow(e)_1+y_1 arrow(e)_2$、$arrow(b)=x_2 arrow(e)_1+y_2 arrow(e)_2$，有结论：

    ① 若 $x_1 y_2-x_2 y_1=0$，则 $arrow(a) parallel arrow(b)$；② 若 $x_1 x_2+y_1 y_2=0$，则 $arrow(a) perp arrow(b)$。

    关于以上两个结论，正确的判断是#choice-placeholder()。],
  choices: (
    [①成立，②不成立],
    [①不成立，②成立],
    [①成立，②成立],
    [①不成立，②不成立],
  ),
  answers: ([A],),
  explanation: [∵ $arrow(e)_1,arrow(e)_2$ 不平行，∴ 它们构成一组基底。条件 $x_1 y_2-x_2 y_1=0$ 表示两组系数成比例，故非零向量 $arrow(a),arrow(b)$ 平行，①成立。

    取 $arrow(a)=arrow(e)_1$，$arrow(b)=arrow(e)_2$，则 $x_1 x_2+y_1 y_2=1 times 0+0 times 1=0$，但两向量不垂直，故②不成立。],
)
#question(
  "single-choice",
  score: 3,
  stem: [对于椭圆 $C_(a,b):x^2/a^2+y^2/b^2=1 quad (a,b>0,a!=b)$，若点 $(x_0,y_0)$ 满足 $x_0^2/a^2+y_0^2/b^2<1$，则称该点在椭圆 $C_(a,b)$ 内。在平面直角坐标系中，若点 $A$ 在过点 $(2,1)$ 的任意椭圆 $C_(a,b)$ 内或椭圆 $C_(a,b)$ 上，则满足条件的点 $A$ 构成的图形为#choice-placeholder()。],
  choices: ([三角形及其内部], [矩形及其内部], [圆及其内部], [椭圆及其内部]),
  answers: ([B],),
  explanation: [由椭圆经过 $(2,1)$，得 $4/a^2+1/b^2=1$。令 $lambda=4/a^2$，则 $0<lambda<1$，且 $a!=b$ 对应 $lambda!=4/5$。

    设 $A(x,y)$，题意等价于对所有上述 $lambda$，均有 $lambda x^2/4+(1-lambda)y^2<=1$。

    分别令 $lambda$ 趋近于 $1$ 和 $0$，得到 $x^2/4<=1$、$y^2<=1$，即 $abs(x)<=2$、$abs(y)<=1$。

    反之，满足这两个条件时，上述加权和一定不超过 $1$。故所求图形为矩形 $[-2,2] times [-1,1]$ 及其内部。],
)
#section[解答题：本大题共 5 题，共 48 分。解答应写出必要的步骤。]
#question(
  "solution",
  score: 8,
  stem: [如图，已知正三棱柱 $A B C-A_1 B_1 C_1$ 的体积为 $9 sqrt(3)$，底面边长为 $3$，求异面直线 $B C_1$ 与 $A C$ 所成的角的大小。
    #figure(prism())],
  answers: ([$arccos(3/10)$],),
  explanation: [底面面积为 $(sqrt(3))/4 times 3^2=(9 sqrt(3))/4$，所以棱柱的高为 $h=(9 sqrt(3))/((9 sqrt(3))/4)=4$。

    连接 $A_1 B$。
    #figure(prism(auxiliary: true))
    ∵ $A_1 C_1 parallel A C$，∴ 可用 $angle B C_1 A_1$ 或其补角表示所求直线的夹角。

    由侧棱垂直于底面，得 $B C_1=B A_1=sqrt(3^2+4^2)=5$，且 $A_1 C_1=3$。

    在 $triangle B C_1 A_1$ 中，$cos angle B C_1 A_1=(5^2+3^2-5^2)/(2 times 5 times 3)=3/10$。

    该角为锐角，故所求角为 $arccos(3/10)$。],
)
#question(
  "solution",
  score: 8,
  stem: [已知函数 $f(x)=sin x+sqrt(3) cos x$，求 $f(x)$ 的最小正周期及最大值，并指出 $f(x)$ 取得最大值时 $x$ 的值。],
  answers: (
    [最小正周期为 $2pi$，最大值为 $2$；当 $x=pi/6+2k pi quad (k in ZZ)$ 时取得最大值。],
  ),
  explanation: [由辅助角公式，$f(x)=2 sin(x+pi/3)$，故最小正周期为 $2pi$，最大值为 $2$。

    当且仅当 $x+pi/3=pi/2+2k pi$ 时取最大值，即 $x=pi/6+2k pi quad (k in ZZ)$。],
)
#question(
  "solution",
  score: 8,
  stem: [如图，汽车前灯反射镜与轴截面的交线是抛物线的一部分，灯口所在的圆面与反射镜的轴垂直，灯泡位于抛物线的焦点 $F$ 处，已知灯口直径是 $24$ cm，灯深 $10$ cm，求灯泡与反射镜的顶点 $O$ 的距离。
    #figure(reflector())],
  answers: ([$3.6$ cm],),
  explanation: [以 $O$ 为原点、反射镜的轴为 $x$ 轴建立平面直角坐标系，长度单位为 cm。设抛物线方程为 $y^2=2p x quad (p>0)$。

    灯口直径为 $24$，灯深为 $10$，故点 $(10,12)$ 在抛物线上，得 $12^2=2p times 10$，即 $p=7.2$。

    因此 $O F=p/2=3.6$ cm。],
)
#question(
  "solution",
  score: 12,
  stem: [已知数列 $\{a_n\}$ 是公差为 $2$ 的等差数列。],
  parts: (
    subquestion(
      score: 4,
      stem: [若 $a_1,a_3,a_4$ 成等比数列，求 $a_1$ 的值。],
      answers: ([$-8$],),
      explanation: [由 $a_3=a_1+4$，$a_4=a_1+6$，得 $(a_1+4)^2=a_1(a_1+6)$，化简得 $2a_1+16=0$，所以 $a_1=-8$。

        此时三项为 $-8,-4,-2$，确实构成公比为 $1/2$ 的等比数列。],
    ),
    subquestion(
      score: 8,
      stem: [设 $a_1=-19$，数列 $\{a_n\}$ 的前 $n$ 项和为 $S_n$。数列 $\{b_n\}$ 满足 $b_1=1$，$b_(n+1)-b_n=(1/2)^n$。记 $c_n=S_n+2^(n-1) dot b_n quad (n in NN^*)$，求数列 $\{c_n\}$ 的最小项 $c_(n_0)$（即 $c_(n_0)<=c_n$ 对任意 $n in NN^*$ 成立）。],
      answers: ([$c_4=-49$],),
      explanation: [
        #step[求通项][
          由等差数列求和公式，$S_n=-19n+n(n-1)=n^2-20n$。

          当 $n>=2$ 时，$b_n=1+sum_(k=1)^(n-1) (1/2)^k=2-2^(1-n)$；该式对 $n=1$ 也成立。

          因此 $c_n=n^2-20n+2^n-1$。
        ]
        #step[比较相邻项][
          $c_(n+1)-c_n=2n-19+2^n$，记此差为 $d_n$，则 $d_(n+1)-d_n=2+2^n>0$。

          又 $d_3=-5<0$，$d_4=5>0$，故 $c_1>c_2>c_3>c_4<c_5<c_6<dots$。

          所以最小项为 $c_4=16-80+16-1=-49$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [对于函数 $f(x)$ 与 $g(x)$，记集合 $D_(f>g)={x | f(x)>g(x)}$。],
  parts: (
    subquestion(
      score: 5,
      stem: [设 $f(x)=2 abs(x),g(x)=x+3$，求 $D_(f>g)$。],
      answers: ([$(-infinity,-1) union (3,+infinity)$],),
      explanation: [当 $x>=0$ 时，$2 abs(x)>x+3$ 等价于 $x>3$。

        当 $x<0$ 时，等价于 $-2x>x+3$，即 $x< -1$。

        因此 $D_(f>g)=(-infinity,-1) union (3,+infinity)$。],
    ),
    subquestion(
      score: 7,
      stem: [设 $f_1(x)=x-1$，$f_2(x)=(1/3)^x+a dot 3^x+1$，$h(x)=0$。如果 $D_(f_1>h) union D_(f_2>h)=RR$，求实数 $a$ 的取值范围。],
      answers: ([$(-4/9,+infinity)$],),
      explanation: [∵ $D_(f_1>h)=(1,+infinity)$，∴ 所给并集为 $RR$ 等价于 $f_2(x)>0$ 对一切 $x<=1$ 成立。

        令 $t=3^(-x)$，则 $t in [1/3,+infinity)$，条件变为 $t+a/t+1>0$，即 $a>-(t^2+t)$ 恒成立。

        ∵ $t^2+t$ 在 $[1/3,+infinity)$ 上递增，最小值为 $4/9$，∴ $a>-4/9$。

        等号时 $x=1$ 不属于两个集合中的任意一个，必须排除，故所求范围为 $(-4/9,+infinity)$。],
    ),
  ),
)

#pagebreak()
#align(center)[第Ⅱ卷（附加题）]
#counter("section").update(0)
#counter("question").update(0)
#section[选择题：本大题共 3 题，每题 3 分，共 9 分。每题只有一个正确选项。]
#question(
  "single-choice",
  score: 3,
  stem: [若函数 $f(x)=sin(x+phi)$ 是偶函数，则 $phi$ 的一个值是#choice-placeholder()。],
  choices: ([$0$], [$pi/2$], [$pi$], [$2pi$]),
  answers: ([B],),
  explanation: [当 $phi=pi/2$ 时，$f(x)=cos x$ 是偶函数；其他三个选项分别得到 $sin x$ 或 $-sin x$，均不是偶函数。],
)
#question(
  "single-choice",
  score: 3,
  stem: [在复平面上，满足 $abs(z-1)=4$ 的复数 $z$ 所对应的点的轨迹是#choice-placeholder()。],
  choices: ([两个点], [一条线段], [两条直线], [一个圆]),
  answers: ([D],),
  explanation: [设 $z=x+y i$，则 $abs(z-1)=4$ 等价于 $(x-1)^2+y^2=16$，表示以 $(1,0)$ 为圆心、$4$ 为半径的圆。],
)
#question(
  "single-choice",
  score: 3,
  stem: [已知函数 $f(x)$ 的图像是折线段 $A B C D E$，如图，其中 $A(1,2),B(2,1),C(3,2),D(4,1),E(5,2)$，设 $k,b in RR$，若直线 $y=k x+b$ 与 $f(x)$ 的图像恰有 $4$ 个不同的公共点，则 $k$ 的取值范围是#choice-placeholder()。
    #figure(zigzag())],
  choices: ([$(-1,0) union (0,1)$], [$(-1/3,1/3)$], [$(0,1]$], [$[0,1/3]$]),
  answers: ([B],),
  explanation: [#step[分析非负斜率][
      若 $k>=1$，函数 $f(x)-k x$ 在全区间上不增，水平线与其只可能有一个交点或一段公共线段，不能恰有四个不同交点。

      当 $0<=k<1$ 时，每段折线上至多有一个交点。要得到四个不同交点，折线的两个低点 $B,D$ 必须严格位于直线下方，中间高点 $C$ 必须严格位于直线上方；端点 $A,E$ 可以在线上。

      因此 $b>max(1-2k, 1-4k)=1-2k$，且 $b<=min(2-k, 2-5k)=2-5k$，并要求 $b<2-3k$。

      这样的 $b$ 存在当且仅当 $1-2k<2-5k$，即 $0<=k<1/3$。例如在两个界限间严格取值，即满足全部条件。
    ]
    #step[利用对称性][
      折线关于 $x=3$ 对称，将直线关于该轴反射会把斜率 $k$ 变为 $-k$，交点个数不变。

      故全部斜率范围为 $(-1/3,1/3)$。
    ]],
)
#section[填空题：本大题共 3 题，每题 3 分，共 9 分。]
#question(
  "fill-in",
  score: 3,
  stem: [椭圆 $x^2/25+y^2/9=1$ 的长半轴的长为#fill-placeholder()。],
  answers: ([$5$],),
  explanation: [∵ $25>9$，∴ 长半轴长为 $sqrt(25)=5$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [已知圆锥的母线长为 $10$，母线与轴的夹角为 $30 degree$，则该圆锥的侧面积为#fill-placeholder()。],
  answers: ([$50pi$],),
  explanation: [底面半径为 $r=10 sin 30 degree=5$，故侧面积为 $pi r l=pi times 5 times 10=50pi$。],
)
#question(
  "fill-in",
  score: 3,
  stem: [小明用数列 $\{a_n\}$ 记录某地区 $2015$ 年 $12$ 月份 $31$ 天中每天是否下过雨，方法为：当第 $k$ 天下过雨时，记 $a_k=1$；当第 $k$ 天没下过雨时，记 $a_k=-1 quad (1<=k<=31)$。他用数列 $\{b_n\}$ 记录该地区该月每天气象台预报是否有雨，方法为：当预报第 $k$ 天有雨时，记 $b_k=1$；当预报第 $k$ 天没有雨时，记 $b_k=-1 quad (1<=k<=31)$。记录完毕后，小明计算出 $a_1 b_1+a_2 b_2+a_3 b_3+dots+a_31 b_31=25$，那么该月气象台预报准确的总天数为#fill-placeholder()。],
  answers: ([$28$],),
  explanation: [预报准确时 $a_k b_k=1$，预报不准确时 $a_k b_k=-1$。设准确的天数为 $m$，则 $m-(31-m)=25$，解得 $m=28$。],
)
#section[解答题：本大题共 1 题，共 12 分。解答应写出必要的步骤。]
#question(
  "solution",
  score: 12,
  stem: [对于数列 $\{a_n\}$ 与 $\{b_n\}$，若对数列 $\{c_n\}$ 的每一项 $c_k$，均有 $c_k=a_k$ 或 $c_k=b_k$，则称数列 $\{c_n\}$ 是 $\{a_n\}$ 与 $\{b_n\}$ 的一个“并数列”。],
  parts: (
    subquestion(
      score: 4,
      stem: [设数列 $\{a_n\}$ 与 $\{b_n\}$ 的前三项分别为 $a_1=1,a_2=3,a_3=5,b_1=1,b_2=2,b_3=3$，若 $\{c_n\}$ 是 $\{a_n\}$ 与 $\{b_n\}$ 的一个“并数列”，求所有可能的有序数组 $(c_1,c_2,c_3)$。],
      answers: ([$(1,3,5),(1,3,3),(1,2,5),(1,2,3)$],),
      explanation: [由定义，$c_1=1$，$c_2 in \{3,2\}$，$c_3 in \{5,3\}$，后两项可独立选取。

        故共有 $4$ 个有序数组：$(1,3,5),(1,3,3),(1,2,5),(1,2,3)$。],
    ),
    subquestion(
      score: 8,
      stem: [已知数列 $\{a_n\},\{c_n\}$ 均为等差数列，$\{a_n\}$ 的公差为 $1$，首项为正整数 $t$；$\{c_n\}$ 的前 $10$ 项和为 $-30$，前 $20$ 项和为 $-260$。若存在唯一的数列 $\{b_n\}$，使得 $\{c_n\}$ 是 $\{a_n\}$ 与 $\{b_n\}$ 的一个“并数列”，求 $t$ 的值所构成的集合。],
      answers: ([$NN^* without \{3,6\}$],),
      explanation: [设 $\{c_n\}$ 的公差为 $d$，则 $10c_1+45d=-30$，$20c_1+190d=-260$，解得 $d=-2,c_1=6$。

        因此 $c_n=8-2n$，而 $a_n=t+n-1$。
        #step[刻画唯一性][
          若某项 $a_n=c_n$，则这一项 $b_n$ 可以任意选取，其他项取 $b_k=c_k$ 即可得到多个符合定义的数列，唯一性不成立。

          若对每个 $n$ 都有 $a_n!=c_n$，则定义强制 $b_n=c_n$，于是符合条件的数列恰有一个。
        ]
        #step[求参数集合][
          故要求 $t+n-1!=8-2n$ 对所有 $n in NN^*$ 成立，即 $t!=9-3n$。

          在 $n in NN^*$ 时，$9-3n$ 中的正整数只有 $6,3$，所以所求集合为 $NN^* without \{3,6\}$。
        ]
      ],
    ),
  ),
)
