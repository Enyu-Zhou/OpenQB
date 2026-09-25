#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018全国1理(河南,河北,山西,江西,湖北,湖南,广东,安徽,福建,山东).pdf",
  regions: (
    "河南",
    "河北",
    "山西",
    "江西",
    "湖北",
    "湖南",
    "广东",
    "安徽",
    "福建",
    "山东",
  ),
)

#let income-pies() = cetz.canvas(length: 11mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (offset, values, title) in (
    (0, (4, 6, 60, 30), [建设前经济收入构成比例]),
    (5.4, (5, 28, 37, 30), [建设后经济收入构成比例]),
  ) {
    scope({
      translate((offset, 0))
      circle((0, 0), radius: 1.4)
      let angle = 0deg
      for (i, value) in values.enumerate() {
        line((0, 0), (1.4 * calc.cos(angle), 1.4 * calc.sin(angle)))
        let middle = angle + value * 1.8deg
        let radius = if i < 2 { 1.75 } else { 0.8 }
        let label = ([其他收入], [第三产业收入], [种植收入], [养殖收入]).at(i)
        content(
          (
            radius * calc.cos(middle),
            radius * calc.sin(middle)
              + if i == 1 and offset == 0 { 0.25 } else { 0 },
          ),
          text(size: 8pt)[#label\ #value%],
          anchor: if i < 2 { "west" } else { "center" },
        )
        angle += value * 3.6deg
      }
      content((0, -1.9), text(size: 9pt, title), anchor: "north")
    })
  }
})
#let cylinder-views() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let w = 16 / calc.pi
  line((0, 0), (w, 0), (w, 2), (0, 2), close: true)
  line(
    (w + 1.6, 0),
    (2 * w + 1.6, 0),
    (2 * w + 1.6, 2),
    (w + 1.6, 2),
    close: true,
  )
  circle((w / 2, -w / 2 - 1), radius: w / 2)
  content((0, 2), $A$, anchor: "south-east", padding: 3pt)
  content((2 * w + 1.6, 0), $B$, anchor: "north-west", padding: 3pt)
})
#let lunes() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  let a = (0.6, calc.sqrt(3.64))
  let b = (-2, 0)
  let c = (2, 0)
  let semi(p, q) = {
    let center = ((p.at(0) + q.at(0)) / 2, (p.at(1) + q.at(1)) / 2)
    let dx = (p.at(0) - q.at(0)) / 2
    let dy = (p.at(1) - q.at(1)) / 2
    range(101).map(i => {
      let t = i * 1.8deg
      (
        center.at(0) + dx * calc.cos(t) - dy * calc.sin(t),
        center.at(1) + dx * calc.sin(t) + dy * calc.cos(t),
      )
    })
  }
  let left = semi(a, b)
  let right = semi(c, a)
  let big = semi(c, b)
  line(..left, close: true, fill: black, stroke: none)
  line(..right, close: true, fill: black, stroke: none)
  line(..big, close: true, fill: white, stroke: none)
  line(a, b, c, close: true, fill: luma(93%), stroke: none)
  line(..left)
  line(..right)
  line(..big)
  line(a, b, c, close: true)
  content(a, $A$, anchor: "south", padding: 9pt)
  content(b, $B$, anchor: "north-east", padding: 3pt)
  content(c, $C$, anchor: "north-west", padding: 3pt)
})
#let folded-square(auxiliary: false) = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (2, 2, 0)
  let d = (0, 2, 0)
  let e = (0, 1, 0)
  let f = (2, 1, 0)
  let p = (1.5, 1, calc.sqrt(3) / 2)
  let h = (1.5, 1, 0)
  oblique-project((1, 0), (0.4, 0.4), (0, 1.15), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, f, p, d, a)
    line(e, f)
    line(e, p)
    line(d, f, c, d, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(p, h, d, stroke: (dash: figure-style.dash))
      content(h, $H$, anchor: "north", padding: 3pt)
    }
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (e, $E$, "east"),
      (f, $F$, "west"),
      (p, $P$, "south"),
    ) {
      content(point, label, anchor: anchor, padding: 3pt)
    }
  })
})

#section[选择题：共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设 $z=(1-i)/(1+i)+2i$，则 $|z|=$#choice-placeholder()。],
  choices: ([$0$], [$1/2$], [$1$], [$sqrt(2)$]),
  answers: ([C],),
  explanation: [$z=(1-i)^2/2+2i=i$，∴ $|z|=1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x | x^2-x-2>0}$，则 $complement_RR A=$#choice-placeholder()。],
  choices: (
    [${x|-1<x<2}$],
    [${x|-1<=x<=2}$],
    [${x|x< -1} union {x|x>2}$],
    [${x|x<=-1} union {x|x>=2}$],
  ),
  answers: ([B],),
  explanation: [$A=(-infinity,-1) union (2,+infinity)$，∴ $complement_RR A=[-1,2]$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某地区经过一年的新农村建设，农村的经济收入增加了一倍，实现翻番。为更好地了解该地区农村的经济收入变化情况，统计了该地区新农村建设前后农村的经济收入构成比例，得到如下饼图：
    #figure(income-pies())
    则下面结论中不正确的是#choice-placeholder()。],
  choices: (
    [新农村建设后，种植收入减少],
    [新农村建设后，其他收入增加了一倍以上],
    [新农村建设后，养殖收入增加了一倍],
    [新农村建设后，养殖收入与第三产业收入的总和超过了经济收入的一半],
  ),
  answers: ([A],),
  explanation: [设建设前总收入为 $T$，则建设后为 $2T$。种植收入由 $0.60T$ 增至 $0.74T$，A 错误；其他收入由 $0.04T$ 增至 $0.10T$，养殖收入由 $0.30T$ 增至 $0.60T$，建设后养殖与第三产业收入合占 $58%$，B、C、D 均正确。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和，若 $3S_3=S_2+S_4$，$a_1=2$，则 $a_5=$#choice-placeholder()。],
  choices: ([$-12$], [$-10$], [$10$], [$12$]),
  answers: ([B],),
  explanation: [设公差为 $d$，则 $3(6+3d)=(4+d)+(8+6d)$，∴ $d=-3$，$a_5=2+4d=-10$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=x^3+(a-1)x^2+a x$。若 $f(x)$ 为奇函数，则曲线 $y=f(x)$ 在点 $(0,0)$ 处的切线方程为#choice-placeholder()。],
  choices: ([$y=-2x$], [$y=-x$], [$y=2x$], [$y=x$]),
  answers: ([D],),
  explanation: [奇函数的偶次项系数为 0，故 $a=1$。此时 $f'(0)=1$，切线方程为 $y=x$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在 $triangle A B C$ 中，$A D$ 为 $B C$ 边上的中线，$E$ 为 $A D$ 的中点，则 $arrow(E B)=$#choice-placeholder()。],
  choices: (
    [$3/4 arrow(A B)-1/4 arrow(A C)$],
    [$1/4 arrow(A B)-3/4 arrow(A C)$],
    [$3/4 arrow(A B)+1/4 arrow(A C)$],
    [$1/4 arrow(A B)+3/4 arrow(A C)$],
  ),
  answers: ([A],),
  explanation: [$arrow(A E)=1/2 arrow(A D)=1/4(arrow(A B)+arrow(A C))$，∴ $arrow(E B)=arrow(A B)-arrow(A E)=3/4 arrow(A B)-1/4 arrow(A C)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某圆柱的高为 2，底面周长为 16，其三视图如图。圆柱表面上的点 $M$ 在正视图上的对应点为 $A$，圆柱表面上的点 $N$ 在左视图上的对应点为 $B$，则在此圆柱侧面上，从 $M$ 到 $N$ 的路径中，最短路径的长度为#choice-placeholder()。
    #figure(cylinder-views())],
  choices: ([$2sqrt(17)$], [$2sqrt(5)$], [$3$], [$2$]),
  answers: ([B],),
  explanation: [由三视图可知，$M$、$N$ 分别位于上、下底面圆周，两点所在母线沿底面圆周的较短弧长为 $16/4=4$。展开侧面，最短路径是水平距离为 4、竖直距离为 2 的线段，长为 $sqrt(4^2+2^2)=2sqrt(5)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设抛物线 $C:y^2=4x$ 的焦点为 $F$，过点 $(-2,0)$ 且斜率为 $2/3$ 的直线与 $C$ 交于 $M$、$N$ 两点，则 $arrow(F M) dot arrow(F N)=$#choice-placeholder()。],
  choices: ([$5$], [$6$], [$7$], [$8$]),
  answers: ([D],),
  explanation: [直线为 $y=2/3(x+2)$，联立得 $(x+2)^2=9x$，故两交点为 $(1,2)$、$(4,4)$。又 $F(1,0)$，∴ $arrow(F M) dot arrow(F N)=(0,2) dot (3,4)=8$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=cases(e^x & quad x<=0, ln x & quad x>0)$，$g(x)=f(x)+x+a$。若 $g(x)$ 存在 2 个零点，则 $a$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$[-1,0)$],
    [$[0,+infinity)$],
    [$[-1,+infinity)$],
    [$[1,+infinity)$],
  ),
  answers: ([C],),
  explanation: [在 $(0,+infinity)$ 上，$ln x+x+a$ 严格递增，值域为 $RR$，恒有一个零点。在 $(-infinity,0]$ 上，$e^x+x+a$ 严格递增，值域为 $(-infinity,1+a]$，有零点当且仅当 $a>=-1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图来自古希腊数学家希波克拉底所研究的几何图形。此图由三个半圆构成，三个半圆的直径分别为直角三角形 $A B C$ 的斜边 $B C$、直角边 $A B$、$A C$。$triangle A B C$ 的三边所围成的区域记为 I，黑色部分记为 II，其余部分记为 III。在整个图形中随机取一点，此点取自 I、II、III 的概率分别记为 $p_1$、$p_2$、$p_3$，则#choice-placeholder()。
    #figure(lunes())],
  choices: ([$p_1=p_2$], [$p_1=p_3$], [$p_2=p_3$], [$p_1=p_2+p_3$]),
  answers: ([A],),
  explanation: [∵ $A B^2+A C^2=B C^2$，∴ 以两直角边为直径的半圆面积之和，等于以斜边为直径的半圆面积。前者为 II 与 III 的面积和，后者为 I 与 III 的面积和，故 I、II 面积相等，$p_1=p_2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $C:x^2/3-y^2=1$，$O$ 为坐标原点，$F$ 为 $C$ 的右焦点，过 $F$ 的直线与 $C$ 的两条渐近线的交点分别为 $M$、$N$。若 $triangle O M N$ 为直角三角形，则 $|M N|=$#choice-placeholder()。],
  choices: ([$3/2$], [$3$], [$2sqrt(3)$], [$4$]),
  answers: ([B],),
  explanation: [$F(2,0)$，渐近线为 $y=plus.minus x/sqrt(3)$，两渐近线不垂直，故直角只能位于 $M$ 或 $N$，直线 $M N$ 的斜率为 $plus.minus sqrt(3)$。由对称性，取 $y=sqrt(3)(x-2)$，与渐近线交于 $(3,sqrt(3))$、$(3/2,-sqrt(3)/2)$，距离为 3。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知正方体的棱长为 1，每条棱所在直线与平面 $alpha$ 所成的角相等，则 $alpha$ 截此正方体所得截面面积的最大值为#choice-placeholder()。],
  choices: (
    [$(3sqrt(3))/4$],
    [$(2sqrt(3))/3$],
    [$(3sqrt(2))/4$],
    [$sqrt(3)/2$],
  ),
  answers: ([A],),
  explanation: [以一个顶点为原点、三条棱为坐标轴，正方体为 $[0,1]^3$。等角条件说明平面法向量的三个分量绝对值相等，经坐标方向对称变换，可设截平面为 $x+y+z=t$。再由中心对称，只需考虑 $0<=t<=3/2$。
    当 $0<=t<=1$ 时，截面为边长 $sqrt(2)t$ 的等边三角形，面积为 $sqrt(3)t^2/2<=sqrt(3)/2$。
    当 $1<=t<=3/2$ 时，从上述等边三角形中截去三个边长为 $sqrt(2)(t-1)$ 的小等边三角形，得
    $ S=sqrt(3)/2(t^2-3(t-1)^2)=sqrt(3)/2(3/2-2(t-3/2)^2)<=(3sqrt(3))/4. $
    在 $t=3/2$ 时取等号，此时截面为正六边形。],
)
#section[填空题：共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(x-2y-2<=0, x-y+1>=0, y<=0)$，则 $z=3x+2y$ 的最大值为#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [由 $x<=2y+2$、$y<=0$，得 $z<=3(2y+2)+2y=8y+6<=6$。点 $(2,0)$ 满足全部约束，故最大值为 6。],
)
#question(
  "fill-in",
  score: 5,
  stem: [记 $S_n$ 为数列 ${a_n}$ 的前 $n$ 项和，若 $S_n=2a_n+1$，则 $S_6=$#fill-placeholder()。],
  answers: ([$-63$],),
  explanation: [取 $n=1$ 得 $a_1=-1$；当 $n>=2$ 时，相邻两式相减得 $a_n=2a_n-2a_(n-1)$，故 $a_n=2a_(n-1)$。∴ $S_6=-(2^6-1)=-63$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [从 2 位女生、4 位男生中选 3 人参加科技比赛，且至少有 1 位女生入选，则不同的选法共有#fill-placeholder()种。（用数字填写答案）],
  answers: ([$16$],),
  explanation: [从全部选法中减去只选男生的选法，得 $C_6^3-C_4^3=20-4=16$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=2sin x+sin 2x$，则 $f(x)$ 的最小值是#fill-placeholder()。],
  answers: ([$-(3sqrt(3))/2$],),
  explanation: [函数以 $2pi$ 为周期，只需考察 $[0,2pi]$。由 $f'(x)=2cos x+2cos 2x=2(cos x+1)(2cos x-1)$，得驻点 $pi/3,pi,5pi/3$。比较这些点及端点的函数值，最小值为 $f(5pi/3)=-(3sqrt(3))/2$。],
)
#section[解答题：共 70 分。第 17～21 题为必考题，每题 12 分。]
#question(
  "solution",
  score: 12,
  stem: [在平面四边形 $A B C D$ 中，$angle A D C=90 degree$，$angle A=45 degree$，$A B=2$，$B D=5$。],
  parts: (
    subquestion(
      stem: [求 $cos angle A D B$。],
      answers: ([$sqrt(23)/5$],),
      explanation: [在 $triangle A B D$ 中，由正弦定理，$sin angle A D B=(A B sin A)/(B D)=sqrt(2)/5$。又 $B D>A B$，故 $angle A D B<45 degree$，从而 $cos angle A D B=sqrt(23)/5$。],
    ),
    subquestion(
      stem: [若 $D C=2sqrt(2)$，求 $B C$。],
      answers: ([$5$],),
      explanation: [∵ $angle B D C=90 degree-angle A D B$，∴ $cos angle B D C=sqrt(2)/5$。由余弦定理，$B C^2=25+8-2 times 5 times 2sqrt(2) times sqrt(2)/5=25$，故 $B C=5$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，四边形 $A B C D$ 为正方形，$E,F$ 分别为 $A D,B C$ 的中点，以 $D F$ 为折痕，把 $triangle D F C$ 折起，使点 $C$ 到达点 $P$ 的位置，且 $P F perp B F$。
    #figure(folded-square())],
  parts: (
    subquestion(
      stem: [证明：平面 $P E F perp$ 平面 $A B F D$。],
      answers: ([证明见解析。],),
      explanation: [∵ $B F perp E F$、$B F perp P F$，且 $E F inter P F={F}$，∴ $B F perp$ 平面 $P E F$。又 $B F subset$ 平面 $A B F D$，∴ 平面 $P E F perp$ 平面 $A B F D$。],
    ),
    subquestion(
      stem: [求 $D P$ 与平面 $A B F D$ 所成角的正弦值。],
      answers: ([$sqrt(3)/4$],),
      explanation: [设正方形边长为 2，则 $D P=2$、$P F=1$、$E F=2$、$D E=1$。由（1）及 $D E parallel B F$，得 $D E perp$ 平面 $P E F$，故 $P E=sqrt(D P^2-D E^2)=sqrt(3)$。由 $P E^2+P F^2=E F^2$，得 $P E perp P F$。
        在平面 $P E F$ 内作 $P H perp E F$，垂足为 $H$。由两平面垂直，得 $P H perp$ 平面 $A B F D$，且 $P H=(P E dot P F)/(E F)=sqrt(3)/2$。所求正弦值为 $(P H)/(D P)=sqrt(3)/4$。
        #figure(folded-square(auxiliary: true))],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设椭圆 $C:x^2/2+y^2=1$ 的右焦点为 $F$，过 $F$ 的直线 $l$ 与 $C$ 交于 $A,B$ 两点，点 $M$ 的坐标为 $(2,0)$。],
  parts: (
    subquestion(
      stem: [当 $l$ 与 $x$ 轴垂直时，求直线 $A M$ 的方程。],
      answers: ([$y=plus.minus sqrt(2)/2(x-2)$],),
      explanation: [$F(1,0)$，故 $l:x=1$，代入椭圆方程得 $A(1,plus.minus sqrt(2)/2)$，从而直线 $A M$ 的方程为 $y=plus.minus sqrt(2)/2(x-2)$。],
    ),
    subquestion(
      stem: [设 $O$ 为坐标原点，证明：$angle O M A=angle O M B$。],
      answers: ([证明见解析。],),
      explanation: [若 $l$ 为 $x$ 轴，则两角均为 0，结论成立。否则可设 $l:x=m y+1$，$A(x_1,y_1)$、$B(x_2,y_2)$。联立椭圆方程得
        $
          (m^2+2)y^2+2m y-1=0, quad y_1+y_2=-(2m)/(m^2+2), quad y_1 y_2=-1/(m^2+2).
        $
        ∵ 椭圆上各点均满足 $x<=sqrt(2)<2$，∴ $M A,M B$ 的斜率存在，且
        $
          k_(M A)+k_(M B)=y_1/(m y_1-1)+y_2/(m y_2-1)=frac(2m y_1 y_2-(y_1+y_2), (m y_1-1)(m y_2-1))=0.
        $
        又 $y_1 y_2<0$，两条射线均指向 $M$ 的左侧且分居 $x$ 轴两侧，故关于 $M O$ 对称，$angle O M A=angle O M B$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某工厂的某种产品成箱包装，每箱 200 件，每一箱产品在交付用户之前要对产品作检验，如检验出不合格品，则更换为合格品。检验时，先从这箱产品中任取 20 件作检验，再根据检验结果决定是否对余下的所有产品作检验。设每件产品为不合格品的概率都为 $p$（$0<p<1$），且各件产品是否为不合格品相互独立。],
  parts: (
    subquestion(
      stem: [记 20 件产品中恰有 2 件不合格品的概率为 $f(p)$，求 $f(p)$ 的最大值点 $p_0$。],
      answers: ([$p_0=0.1$],),
      explanation: [$f(p)=C_20^2 p^2(1-p)^18$，故 $f'(p)=2C_20^2 p(1-p)^17(1-10p)$。在 $(0,0.1)$ 上导数为正，在 $(0.1,1)$ 上导数为负，故最大值点为 $p_0=0.1$。],
    ),
    subquestion(
      stem: [现对一箱产品检验了 20 件，结果恰有 2 件不合格品，以（1）中确定的 $p_0$ 作为 $p$ 的值。已知每件产品的检验费用为 2 元，若有不合格品进入用户手中，则工厂要对每件不合格品支付 25 元的赔偿费用。],
      parts: (
        subquestion(
          stem: [若不对该箱余下的产品作检验，这一箱产品的检验费用与赔偿费用的和记为 $X$，求 $E X$。],
          answers: ([490 元。],),
          explanation: [设余下 180 件产品中的不合格品数为 $Y$，则 $Y~B(180,0.1)$，$E Y=18$。∵ $X=40+25Y$，∴ $E X=40+25 times 18=490$（元）。],
        ),
        subquestion(
          stem: [以检验费用与赔偿费用和的期望值为决策依据，是否该对这箱余下的所有产品作检验？],
          answers: ([应该检验。],),
          explanation: [若全部检验，则费用为 $200 times 2=400$（元），且没有赔偿费用。∵ $400<490$，∴ 应对余下的所有产品作检验。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=1/x-x+a ln x$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性。],
      answers: (
        [当 $a<=2$ 时，在 $(0,+infinity)$ 上单调递减；当 $a>2$ 时，令 $r=(a-sqrt(a^2-4))/2$、$s=(a+sqrt(a^2-4))/2$，则在 $(0,r)$、$(s,+infinity)$ 上单调递减，在 $(r,s)$ 上单调递增。],
      ),
      explanation: [定义域为 $(0,+infinity)$，$f'(x)=(-x^2+a x-1)/x^2$。
        当 $a<=2$ 时，$x^2-a x+1=(x-1)^2+(2-a)x>=0$，导数仅可能在 $a=2,x=1$ 时为 0，故 $f$ 在整个定义域上单调递减。
        当 $a>2$ 时，$x^2-a x+1=0$ 有两正根 $r=(a-sqrt(a^2-4))/2$、$s=(a+sqrt(a^2-4))/2$。由导数符号可得相应单调区间。],
    ),
    subquestion(
      stem: [若 $f(x)$ 存在两个极值点 $x_1,x_2$，证明：$(f(x_1)-f(x_2))/(x_1-x_2)<a-2$。],
      answers: ([证明见解析。],),
      explanation: [由（1）知 $a>2$，且 $x_1 x_2=1$。不妨设 $x_2=t>1$、$x_1=1/t$，则
        $ (f(x_1)-f(x_2))/(x_1-x_2)=-2+a frac(2ln t, t-1/t). $
        令 $h(t)=t-1/t-2ln t$，则 $h(1)=0$，且 $t>1$ 时 $h'(t)=(t-1)^2/t^2>0$，∴ $2ln t<t-1/t$。结合 $a>0$，即得所证不等式。],
    ),
  ),
)
#section[选考题：共 10 分。请考生在第 22、23 题中任选一题作答，如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。
    在直角坐标系 $x O y$ 中，曲线 $C_1$ 的方程为 $y=k|x|+2$。以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，曲线 $C_2$ 的极坐标方程为 $rho^2+2rho cos theta-3=0$。],
  parts: (
    subquestion(
      stem: [求 $C_2$ 的直角坐标方程。],
      answers: ([$(x+1)^2+y^2=4$],),
      explanation: [代入 $rho^2=x^2+y^2$、$rho cos theta=x$，得 $x^2+y^2+2x-3=0$，即 $(x+1)^2+y^2=4$。],
    ),
    subquestion(
      stem: [若 $C_1$ 与 $C_2$ 有且仅有三个公共点，求 $C_1$ 的方程。],
      answers: ([$y=-4/3|x|+2$],),
      explanation: [当 $k>=0$ 时，$C_1$ 上 $y>=2$，圆上满足此条件的点只有 $(-1,2)$，不可能有三个公共点，故 $k<0$。
        在 $x<0$ 时，联立得 $(1+k^2)x^2+(2-4k)x+1=0$，判别式 $4k(3k-4)>0$，两根之和为负、积为正，故左支恒有两个交点。
        在 $x>=0$ 时，联立得 $(1+k^2)x^2+(2+4k)x+1=0$。须恰有一个非负根，而两根之积为正，且 $x=0$ 不是根，所以该方程须有正的二重根。由 $4k(3k+4)=0$、$k<0$ 得 $k=-4/3$，此时二重根为 $3/5>0$，符合要求。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。
    已知 $f(x)=|x+1|-|a x-1|$。],
  parts: (
    subquestion(
      stem: [当 $a=1$ 时，求不等式 $f(x)>1$ 的解集。],
      answers: ([$(1/2,+infinity)$],),
      explanation: [此时 $f(x)=cases(-2 & quad x<=-1, 2x & quad -1<x<1, 2 & quad x>=1)$，逐段解得 $x>1/2$。],
    ),
    subquestion(
      stem: [若 $x in (0,1)$ 时不等式 $f(x)>x$ 成立，求 $a$ 的取值范围。],
      answers: ([$(0,2]$],),
      explanation: [在 $(0,1)$ 上，原不等式等价于 $|a x-1|<1$，即 $0<a x<2$。对一切 $x in (0,1)$ 成立当且仅当 $0<a<=2$。],
    ),
  ),
)
