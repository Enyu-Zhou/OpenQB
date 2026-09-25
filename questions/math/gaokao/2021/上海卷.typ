#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2021/2021上海.pdf",
  regions: ("上海",),
)

#let square-diagram() = cetz.canvas(length: 20mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((0, 0), (1, 0), (1, 1), (0, 1), close: true)
  line((0, 0), (1, 1))
  for (p, label, anchor) in (
    ((0, 0), $A$, "north-east"),
    ((1, 0), $B$, "north-west"),
    ((1, 1), $C$, "south-west"),
    ((0, 1), $D$, "south-east"),
  ) {
    content(p, label, anchor: anchor, padding: 2pt)
  }
})

#let cylinder-diagram() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  let a = (-1, 0, 2)
  let b = (1, 0, 2)
  let c = (-0.5, -calc.sqrt(3) / 2, 0)
  let arc-points(start, end, z) = range(81).map(i => {
    let t = (start + (end - start) * i / 80) * 1deg
    (calc.cos(t), calc.sin(t), z)
  })
  oblique-project((1, 0), (0, 0.3), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(..arc-points(0, 360, 2))
    line(..arc-points(180, 360, 0))
    line(..arc-points(0, 180, 0), stroke: (dash: figure-style.dash))
    line(a, (-1, 0, 0))
    line(b, (1, 0, 0))
    line(a, b)
    line(a, c, b, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "west"),
      (c, $C$, "north"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})

#let curve-choice(kind) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.08,
    shared-zero: if kind == "B" { move(dx: 20pt)[$O$] } else { $O$ },
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (3.1, 3.1),
    axis-style: "school-book",
    x-min: -1.4,
    x-max: 1.4,
    y-min: -1.4,
    y-max: 1.4,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (
      (-1, move(dx: -10pt, dy: -21pt)[$-1$]),
      (1, move(dx: 8pt, dy: -21pt)[$1$]),
    ),
    y-ticks: (
      (-1, move(dx: 22pt, dy: 8pt)[$-1$]),
      (1, move(dx: 22pt, dy: -8pt)[$1$]),
    ),
    {
      plot.annotate(resize: false, {
        if kind == "A" {
          rect((-1, -1), (1, 1), radius: 0.12)
        } else if kind == "B" {
          line(
            ..range(301).map(i => {
              let t = -90deg + i * 180deg / 300
              (calc.sin(3 * t), calc.sin(2 * t))
            }),
          )
        } else if kind == "C" {
          for sign in (-1, 1) {
            line(
              ..range(161).map(i => {
                let t = -1 + 2 * i / 160
                (sign * t * t, t)
              }),
            )
          }
        } else {
          for (cx, rx, ry) in ((-0.5, 0.5, 1), (0.5, 0.5, 0.7)) {
            line(
              ..range(161).map(i => {
                let t = i * 360deg / 160
                (cx + rx * calc.cos(t), ry * calc.sin(t))
              }),
            )
          }
        }
      })
    },
  )
})

#let cuboid-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (2, 2, 0)
  let d = (0, 2, 0)
  let a1 = (0, 0, 3)
  let b1 = (2, 0, 3)
  let c1 = (2, 2, 3)
  let d1 = (0, 2, 3)
  oblique-project((1, 0), (0.35, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "west"),
      (d, $D$, "south-west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "north-west"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})

#section[填空题：本题共 12 小题，第 1～6 题每小题 4 分，第 7～12 题每小题 5 分，共 54 分。]
#question(
  "fill-in",
  score: 4,
  stem: [若复数 $z_1=1+"i"$，$z_2=2+3"i"$（$"i"$ 为虚数单位），则 $z_1+z_2=$#fill-placeholder()。],
  answers: ([$3+4"i"$],),
  explanation: [$z_1+z_2=(1+2)+(1+3)"i"=3+4"i"$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [若集合 $A={x | 2x<=1}$，$B={-1,0,1}$，则 $A inter B=$#fill-placeholder()。],
  answers: ([$ {-1,0} $],),
  explanation: [$A={x | x<=1/2}$，∴ $A inter B={-1,0}$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [若圆的方程为 $x^2+y^2-2x-4y=0$，则圆心坐标为#fill-placeholder()。],
  answers: ([$ (1,2) $],),
  explanation: [配方得 $(x-1)^2+(y-2)^2=5$，∴ 圆心为 $(1,2)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [如图所示，若正方形 $A B C D$ 的边长为 $3$，则 $arrow(A B) dot arrow(A C)=$#fill-placeholder()。
    #figure(square-diagram())],
  answers: ([$9$],),
  explanation: [$arrow(A C)=arrow(A B)+arrow(B C)$，且 $arrow(A B) dot arrow(B C)=0$。
    ∴ $arrow(A B) dot arrow(A C)=|arrow(A B)|^2=9$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设 $f^(-1)(x)$ 为函数 $f(x)=3/x+2$ 的反函数，则 $f^(-1)(1)=$#fill-placeholder()。],
  answers: ([$-3$],),
  explanation: [令 $f(x)=1$，则 $3/x+2=1$，解得 $x=-3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [在 $(x+a)^5$ 的二项展开式中，若 $x^2$ 的系数为 $80$，则实数 $a=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [$x^2$ 的系数为 $binom(5, 2)a^3=10a^3=80$，∴ $a=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若实数 $x,y$ 满足 $cases(x<=3, 2x-y-2>=0, 3x+y-8>=0,)$，则 $z=x-y$ 的最大值为#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [由约束条件，$z=4x-(3x+y)<=4 times 3-8=4$。
    当 $(x,y)=(3,-1)$ 时满足全部约束且 $z=4$，∴ 最大值为 $4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知无穷等比数列 ${a_n}$ 和 ${b_n}$，满足 $a_1=3$，$b_n=a_(2n)$，且 $a_n$ 的各项和为 $9$，则数列 ${b_n}$ 的各项和为#fill-placeholder()。],
  answers: ([$18/5$],),
  explanation: [设 ${a_n}$ 的公比为 $q$，由 $3/(1-q)=9$ 得 $q=2/3$。
    ${b_n}$ 的首项为 $a_2=2$，公比为 $q^2=4/9$，∴ 各项和为 $2/(1-4/9)=18/5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图所示，已知圆柱的底面半径为 $1$，高为 $2$，$A B$ 为上底面圆的一条直径，若 $C$ 为下底面圆周上的一个动点，则 $triangle A B C$ 的面积的取值范围为#fill-placeholder()。
    #figure(cylinder-diagram())],
  answers: ([$[2,sqrt(5)]$],),
  explanation: [将直线 $A B$ 竖直平移至下底面，所得直线记为 $l$。设 $C$ 到 $l$ 的距离为 $d$，则 $0<=d<=1$。
    $C$ 到 $A B$ 的距离为 $sqrt(2^2+d^2)$。
    ∴ $S_(triangle A B C)=1/2 times 2 times sqrt(4+d^2) in [2,sqrt(5)]$，且区间内各值均可取得。],
)
#question(
  "fill-in",
  score: 5,
  stem: [上海的花博会有 $A$、$B$、$C$、$D$ 四个不同的场馆。若甲、乙每人选 $2$ 个场馆去参观，则两人的选择中恰有一个场馆相同的概率为#fill-placeholder()。],
  answers: ([$2/3$],),
  explanation: [固定甲所选的两个场馆，乙共有 $binom(4, 2)=6$ 种等可能的选择。
    恰有一个场馆相同时，乙需在甲所选和未选的两个场馆中各选一个，有 $2 times 2=4$ 种选择。
    ∴ 所求概率为 $4/6=2/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知抛物线 $C:y^2=2p x$（$p>0$）的焦点为 $F$，$A$、$B$ 两点位于第一象限且在 $C$ 上，若 $|A F|=2$，$|B F|=4$，$|A B|=3$，则直线 $A B$ 的斜率为#fill-placeholder()。],
  answers: ([$sqrt(5)/2$],),
  explanation: [设 $A(x_1,y_1)$，$B(x_2,y_2)$。由抛物线定义，$x_1+p/2=2$，$x_2+p/2=4$，∴ $x_2-x_1=2$。
    ∵ 两点在第一象限，∴ $y_2>y_1$。
    由 $|A B|^2=(x_2-x_1)^2+(y_2-y_1)^2=9$ 得 $y_2-y_1=sqrt(5)$。
    ∴ $k_(A B)=sqrt(5)/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $a_i in NN^*$（$i=1,2,dots,9$），若对任意的 $k in NN^*$（$2<=k<=8$），$a_k=a_(k-1)+1$ 或 $a_k=a_(k+1)-1$ 中有且仅有一个成立，且 $a_1=6$，$a_9=9$，则 $a_1+dots+a_9$ 的最小值为#fill-placeholder()。],
  answers: ([$31$],),
  explanation: [令 $d_i=a_(i+1)-a_i$（$1<=i<=8$）。条件等价于任意相邻的 $d_i$ 中恰有一个等于 $1$，∴ 等于 $1$ 的位置只能全部为奇数或全部为偶数。
    #step[奇数位置等于 1][此时 $a_2=7$，$(a_3,a_4)$、$(a_5,a_6)$、$(a_7,a_8)$ 都是一对相邻正整数，每对之和至少为 $3$。
      ∴ 总和至少为 $6+7+3 times 3+9=31$。
      数列 $6,7,1,2,1,2,1,2,9$ 满足全部条件且和为 $31$。]
    #step[偶数位置等于 1][此时 $a_8=8$，$(a_2,a_3)$、$(a_4,a_5)$、$(a_6,a_7)$ 每对之和至少为 $3$。
      ∴ 总和至少为 $6+3 times 3+8+9=32$。]
    综上，最小值为 $31$。],
)

#section[选择题：本题共 4 小题，每小题 5 分，共 20 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [下列函数中，既是奇函数又是减函数的是#choice-placeholder()。],
  choices: ([$y=-3x$], [$y=x^3$], [$y=log_3 x$], [$y=3^x$]),
  answers: ([A],),
  explanation: [$y=-3x$ 的定义域为 $RR$，满足 $f(-x)=-f(x)$，且随 $x$ 增大而减小。
    其余三个函数均为增函数，∴ 选 A。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若参数方程 $cases(x=3t-4t^3, y=2t sqrt(1-t^2),)$，$t in [-1,1]$，则该方程的曲线是#choice-placeholder()。],
  choices: (
    [#figure(curve-choice("A"))],
    [#figure(curve-choice("B"))],
    [#figure(curve-choice("C"))],
    [#figure(curve-choice("D"))],
  ),
  answers: ([B],),
  explanation: [令 $y=0$，得 $t=-1,0,1$，对应 $x=1,0,-1$。
    ∴ 曲线与 $x$ 轴的交点恰为 $(-1,0)$、$(0,0)$、$(1,0)$，只有 B 符合。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=3sin x+2$，若对任意的 $x_1 in [0,pi/2]$，都存在 $x_2 in [0,pi/2]$，使得 $f(x_1)+2f(x_2+theta)=3$ 成立，则 $theta$ 的值可以是#choice-placeholder()。],
  choices: ([$3pi/5$], [$4pi/5$], [$6pi/5$], [$7pi/5$]),
  answers: ([D],),
  explanation: [原等式等价于 $sin(x_2+theta)=-(1+sin x_1)/2$。
    当 $x_1 in [0,pi/2]$ 时，右端取遍 $[-1,-1/2]$，∴ $sin u$ 在 $[theta,theta+pi/2]$ 上的值域必须包含该区间。
    A、B 对应的区间均不含使 $sin u=-1$ 的点，不能成立。
    C 对应区间 $[6pi/5,17pi/10]$ 上，$sin u$ 的最大值为 $-sin(pi/5)< -1/2$，不能成立。
    D 对应区间 $[7pi/5,19pi/10]$ 包含 $3pi/2$ 和 $11pi/6$，正弦函数在这两点间取遍 $[-1,-1/2]$，∴ 选 D。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若两两不相等的实数 $x_1,y_1,x_2,y_2,x_3,y_3$ 满足：
    ① $x_1<y_1$，$x_2<y_2$，$x_3<y_3$；
    ② $x_1+y_1=x_2+y_2=x_3+y_3$；
    ③ $x_1y_1+x_3y_3=2x_2y_2$。
    则以下选项中恒成立的是#choice-placeholder()。],
  choices: (
    [$2x_2<x_1+x_3$],
    [$2x_2>x_1+x_3$],
    [$x_2^2<x_1x_3$],
    [$x_2^2>x_1x_3$],
  ),
  answers: ([A],),
  explanation: [设各对实数的中点均为 $s$，令 $x_i=s-d_i$，$y_i=s+d_i$，则 $d_i>0$ 且两两不同。
    由条件③得 $d_1^2+d_3^2=2d_2^2$，从而
    $ (2d_2)^2-(d_1+d_3)^2=(d_1-d_3)^2>0. $
    ∴ $2d_2>d_1+d_3$，即 $2x_2<x_1+x_3$。],
)

#section[解答题：本题共 5 小题，共 76 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [如图所示，在长方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$A B=B C=2$，$A A_1=3$。
    #figure(cuboid-diagram())],
  parts: (
    subquestion(
      stem: [若点 $P$ 是棱 $A_1 D_1$ 上的动点，求三棱锥 $C-P A D$ 的体积。],
      answers: ([$2$],),
      explanation: [$triangle P A D$ 的底 $A D=2$，对应高恒为 $3$，∴ 面积为 $3$。
        $C$ 到平面 $P A D$ 的距离为 $C D=2$，∴ $V_(C-P A D)=1/3 times 3 times 2=2$。],
    ),
    subquestion(
      stem: [求直线 $A B_1$ 与平面 $A C C_1 A_1$ 所成角的大小。（结果用反三角函数值表示）],
      answers: ([$arcsin(sqrt(26)/13)$],),
      explanation: [以 $A$ 为原点，以 $A B$、$A D$、$A A_1$ 所在直线为坐标轴建立空间直角坐标系。
        $arrow(A B_1)=(2,0,3)$，平面 $A C C_1 A_1$ 的法向量可取 $bold(n)=(1,-1,0)$。
        设所求角为 $theta$，则
        $
          sin theta=(|arrow(A B_1) dot bold(n)|)/(|arrow(A B_1)| |bold(n)|)=2/sqrt(26)=sqrt(26)/13.
        $
        ∴ $theta=arcsin(sqrt(26)/13)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知在 $triangle A B C$ 中，角 $A$、$B$、$C$ 所对的边长分别为 $a$、$b$、$c$，且 $a=3$，$b=2c$。],
  parts: (
    subquestion(
      stem: [若 $A=2pi/3$，求 $triangle A B C$ 的面积。],
      answers: ([$9sqrt(3)/14$],),
      explanation: [由余弦定理，$9=(2c)^2+c^2-2 times 2c^2 cos(2pi/3)=7c^2$。
        ∴ $c^2=9/7$，$S_(triangle A B C)=1/2 b c sin A=9sqrt(3)/14$。],
    ),
    subquestion(
      stem: [若 $2sin B-sin C=1$，求 $triangle A B C$ 的周长。],
      answers: ([$3+4sqrt(2)+sqrt(5)$ 或 $3+4sqrt(2)-sqrt(5)$],),
      explanation: [由正弦定理，$sin B=2sin C$，∴ $sin C=1/3$。
        ∵ $c<b$，∴ $C<B$，故 $C$ 为锐角，$cos C=2sqrt(2)/3$。
        由余弦定理，$c^2=9+4c^2-8sqrt(2)c$，即 $3c^2-8sqrt(2)c+9=0$。
        解得 $c=(4sqrt(2) plus.minus sqrt(5))/3$，两值均满足三角形三边关系。
        ∴ 周长 $a+b+c=3+3c=3+4sqrt(2) plus.minus sqrt(5)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知某企业今年（2021 年）第一个季度的营业额为 $1.1$ 亿元，以后每个季度的营业额比上个季度增加 $0.05$ 亿元，该企业第一季度的利润为 $0.16$ 亿元，以后每季度比前一季度增长 $4%$。],
  parts: (
    subquestion(
      stem: [求 2021 年起前 $20$ 季度营业额的总和。],
      answers: ([$31.5$ 亿元],),
      explanation: [从 2021 年第一季度起，第 $n$ 个季度营业额为 $a_n=1.1+0.05(n-1)$ 亿元。
        ∴ $sum_(n=1)^20 a_n=20 times 1.1+(20 times 19)/2 times 0.05=31.5$（亿元）。],
    ),
    subquestion(
      stem: [请问哪一年的第几个季度的利润首次超过该季度营业额的 $18%$？],
      answers: ([2027 年第二季度],),
      explanation: [第 $n$ 个季度利润为 $b_n=0.16 times 1.04^(n-1)$ 亿元。
        令 $d_m=0.16 times 1.04^m-0.18(1.1+0.05m)$（$m=n-1>=0$），则所求条件为 $d_m>0$。
        $d_(m+1)-d_m=0.0064 times 1.04^m-0.009$，它随 $m$ 增大而增大，在 $m<=8$ 时为负，在 $m>=9$ 时为正。
        ∴ ${d_m}$ 先减后增。又 $d_0=-0.038<0$，计算得 $d_24 approx -0.00387<0$，$d_25 approx 0.00353>0$。
        ∴ 首次满足条件的是 $m=25$，即第 $26$ 个季度，也就是 2027 年第二季度。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知椭圆 $Gamma:x^2/2+y^2=1$，$F_1$、$F_2$ 为 $Gamma$ 的左、右焦点，直线 $l$ 过点 $P(m,0)$（$m< -sqrt(2)$）交 $Gamma$ 于 $A$、$B$ 两点，且 $A$、$B$ 在 $x$ 轴上方，点 $A$ 在线段 $B P$ 上。],
  parts: (
    subquestion(
      stem: [若 $B$ 是 $Gamma$ 的上顶点，且 $|arrow(B F_1)|=|arrow(P F_1)|$，求 $m$ 的值。],
      answers: ([$-1-sqrt(2)$],),
      explanation: [$F_1=(-1,0)$，$B=(0,1)$，∴ $|B F_1|=sqrt(2)$，$|P F_1|=-1-m$。
        ∴ $m=-1-sqrt(2)$。],
    ),
    subquestion(
      stem: [若 $arrow(F_1 A) dot arrow(F_2 A)=1/3$，且原点 $O$ 到直线 $l$ 的距离为 $4sqrt(15)/15$，求直线 $l$ 的方程。],
      answers: ([$3x-9y+4sqrt(6)=0$],),
      explanation: [设 $A(x_1,y_1)$，$B(x_2,y_2)$，直线 $l:y=k(x-m)$，则 $k>0$，$x_1<x_2$。
        联立椭圆方程得 $(1+2k^2)x^2-4k^2m x+2k^2m^2-2=0$。
        ∵ $x_1+x_2=4k^2m/(1+2k^2)<0$，∴ $x_1<0$。
        又 $arrow(F_1 A) dot arrow(F_2 A)=x_1^2+y_1^2-1=x_1^2/2=1/3$，∴ $A=(-sqrt(6)/3,sqrt(6)/3)$。
        ∴ $l:y=k x+(k+1)sqrt(6)/3$。
        由点到直线的距离公式，$2(k+1)^2/(3(k^2+1))=16/15$，即 $3k^2-10k+3=0$。
        当 $k=3$ 时，$m=-4sqrt(6)/9>-sqrt(2)$，舍去；当 $k=1/3$ 时，$m=-4sqrt(6)/3< -sqrt(2)$。
        ∴ $l:3x-9y+4sqrt(6)=0$。],
    ),
    subquestion(
      stem: [对于任意点 $P$，是否存在唯一的直线 $l$，使得 $arrow(F_1 A) parallel arrow(F_2 B)$ 成立？若存在，求出直线 $l$ 的方程；若不存在，请说明理由。],
      answers: ([存在唯一的直线 $l:y=(x-m)/sqrt(2m^2-4)$。],),
      explanation: [#step[求出必要条件][沿用上问记号，令 $S=x_1+x_2$，$D=x_2-x_1>0$。由根与系数关系得
          $ S=(4k^2m)/(1+2k^2), quad D=(2sqrt(2+4k^2-2k^2m^2))/(1+2k^2). $
          两向量平行等价于 $(x_1+1)y_2-y_1(x_2-1)=0$。
          代入 $y_i=k(x_i-m)$，化简得 $S+m D-2m=0$。
          ∵ $m != 0$，∴ $D=2/(1+2k^2)$，从而 $2+4k^2-2k^2m^2=1$。
          ∴ $k=1/sqrt(2m^2-4)$。]
        #step[验证存在性与唯一性][∵ $m< -sqrt(2)$，∴ 上述 $k$ 为唯一正数。
          此时根式中的量为 $1>0$，直线与椭圆有两个不同交点。两交点的横坐标均大于 $m$，∴ 纵坐标均为正。
          按横坐标从小到大命名为 $A$、$B$，则 $A$ 在线段 $P B$ 上，且代回可得 $S+m D-2m=0$，满足平行条件。
          ∴ 存在唯一的直线 $l:y=(x-m)/sqrt(2m^2-4)$。]],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知 $f(x)$ 是定义在 $RR$ 上的函数，若对任意的 $x_1$、$x_2$，$x_1-x_2 in S$，均有 $f(x_1)-f(x_2) in S$，则称 $f(x)$ 是 $S$ 关联。],
  parts: (
    subquestion(
      stem: [判断函数 $f(x)=2x+1$ 是否是 $[0,+infinity)$ 关联？是否是 $[0,1]$ 关联？并说明理由。],
      answers: ([是 $[0,+infinity)$ 关联，不是 $[0,1]$ 关联。],),
      explanation: [若 $x_1-x_2>=0$，则 $f(x_1)-f(x_2)=2(x_1-x_2)>=0$，∴ 是 $[0,+infinity)$ 关联。
        取 $x_1=1$、$x_2=0$，则 $x_1-x_2=1 in [0,1]$，但 $f(x_1)-f(x_2)=2 in.not [0,1]$，∴ 不是 $[0,1]$ 关联。],
    ),
    subquestion(
      stem: [若 $f(x)$ 是 ${3}$ 关联，当 $x in [0,3)$ 时，$f(x)=x^2-2x$，解不等式 $2<=f(x)<=3$。],
      answers: ([$[1+sqrt(3),5]$],),
      explanation: [由 ${3}$ 关联知 $f(x+3)=f(x)+3$。
        任意实数可唯一写成 $x=3n+t$，其中 $n in ZZ$、$0<=t<3$，于是 $f(x)=3n+t^2-2t$。
        ∵ $t^2-2t in [-1,3)$，∴ $2<=f(x)<=3$ 仅可能在 $n=0$ 或 $n=1$ 时成立。
        当 $n=0$ 时，$2<=t^2-2t<=3$，结合 $0<=t<3$，得 $1+sqrt(3)<=x<3$。
        当 $n=1$ 时，$-1<=t^2-2t<=0$，得 $0<=t<=2$，即 $3<=x<=5$。
        ∴ 解集为 $[1+sqrt(3),5]$。],
    ),
    subquestion(
      stem: [证明：“$f(x)$ 是 ${1}$ 关联，且是 $[0,+infinity)$ 关联”当且仅当“$f(x)$ 是 $[1,2]$ 关联”。],
      answers: ([证明见解析。],),
      explanation: [#step[充分性][由 ${1}$ 关联得 $f(t+1)=f(t)+1$，由 $[0,+infinity)$ 关联得 $f$ 为不减函数。
          若 $x_1-x_2 in [1,2]$，则 $x_2+1<=x_1<=x_2+2$。
          ∴ $f(x_2)+1<=f(x_1)<=f(x_2)+2$，即 $f(x_1)-f(x_2) in [1,2]$。]
        #step[必要性][设 $f$ 是 $[1,2]$ 关联。任意 $t in RR$ 都满足
          $ f(t+1)-f(t)>=1, quad f(t+2)-f(t+1)>=1, quad f(t+2)-f(t)<=2. $
          前两式相加并与第三式比较，得 $f(t+1)-f(t)=1$，∴ $f$ 是 ${1}$ 关联。
          对任意 $h in [0,1]$，由 $1+h in [1,2]$ 得 $f(t+h+1)-f(t)>=1$。
          利用单位平移关系，得 $f(t+h)>=f(t)$。
          对任意 $x_1>=x_2$，将 $x_1-x_2$ 写成 $n+h$，其中 $n$ 为非负整数、$0<=h<1$，则
          $ f(x_1)-f(x_2)=n+f(x_2+h)-f(x_2)>=0. $
          ∴ $f$ 是 $[0,+infinity)$ 关联。]
        综上，两条件等价。],
    ),
  ),
)
