#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2024,
  type: "普通高等学校春季招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2024/2024春季上海.pdf",
  regions: ("上海",),
)

#let lawn() = cetz.canvas(length: 30mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((0, 0), (1.2, 0), (1.2, 1.2), (0, 1.2), close: true)
  for (p, t, a) in (
    ((0, 0), $A$, "north-east"),
    ((1.2, 0), $B$, "north-west"),
    ((1.2, 1.2), $C$, "south-west"),
    ((0, 1.2), $D$, "south-east"),
    ((0.2, 0.2), $E$, "south-west"),
    ((0.8, 0.8), $F$, "south-west"),
  ) { content(p, t, anchor: a, padding: 0.07) }
  for p in ((0.2, 0.2), (0.8, 0.8)) {
    circle(p, radius: 0.018, fill: black, stroke: none)
  }
})
#let cone() = cetz.canvas(length: 22mm, {
  import cetz.draw: *
  let height = calc.sqrt(2)
  let first = calc.atan(0.2) + calc.asin(0.28 / (height * calc.sqrt(1.04)))
  let last = (
    calc.atan(0.2) + 180deg - calc.asin(0.28 / (height * calc.sqrt(1.04)))
  )
  let point(t) = (calc.cos(t), calc.sin(t), 0)
  let p = (0, 0, height)
  let a = (1, 0, 0)
  let b = (0, -1, 0)
  let c = (0, 1, 0)
  oblique-project((1, 0), (0.2, 0.28), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(..range(101).map(i => point(last + (first + 360deg - last) * i / 100)))
    line(
      ..range(101).map(i => point(first + (last - first) * i / 100)),
      stroke: (
        dash: figure-style.dash,
      ),
    )
    line(point(first), p, point(last))
    line(a, p, b)
    line(p, c, stroke: (dash: figure-style.dash))
    line(a, b, c, a, stroke: (dash: figure-style.dash))
    for (q, t, anchor) in (
      (a, $A$, "west"),
      (b, $B$, "north"),
      (c, $C$, "south-west"),
      (p, $P$, "south"),
    ) { content(q, t, anchor: anchor, padding: 0.1) }
  })
})

#section[填空题。]
#question(
  "fill-in",
  stem: [函数 $y=log_2 x$ 的定义域为#fill-placeholder()。],
  answers: ([$(0,+infinity)$],),
  explanation: [对数的真数须为正数，故 $x>0$。],
)
#question(
  "fill-in",
  stem: [直线 $x-y+1=0$ 的倾斜角为#fill-placeholder()。],
  answers: ([$pi/4$],),
  explanation: [直线斜率为 $1$。倾斜角 $theta in [0,pi)$ 且 $tan theta=1$，故 $theta=pi/4$。],
)
#question(
  "fill-in",
  stem: [已知 $z/(1+"i")="i"$，则 $overline(z)=$#fill-placeholder()。],
  answers: ([$-1-"i"$],),
  explanation: [$z="i"(1+"i")=-1+"i"$，故其共轭复数为 $-1-"i"$。],
)
#question(
  "fill-in",
  stem: [$(x-1)^6$ 展开式中 $x^4$ 的系数为#fill-placeholder()。],
  answers: ([$15$],),
  explanation: [$x^4$ 项为 $binom(6, 2)x^4(-1)^2=15x^4$。],
)
#question(
  "fill-in",
  stem: [在 $triangle A B C$ 中，$B C=2$，$A=pi/3$，$B=pi/4$，则 $A B=$#fill-placeholder()。],
  answers: ([$(3sqrt(2)+sqrt(6))/3$],),
  explanation: [由 $C=pi-A-B=(5pi)/12$ 及正弦定理，
    $
      A B=(B C sin C)/(sin A)=(2sin((5pi)/12))/(sin(pi/3))=(3sqrt(2)+sqrt(6))/3.
    $],
)
#question(
  "fill-in",
  stem: [已知 $a b=1$，$4a^2+9b^2$ 的最小值为#fill-placeholder()。],
  answers: ([$12$],),
  explanation: [$4a^2+9b^2>=2sqrt(36a^2 b^2)=12$，当 $a=sqrt(6)/2$，$b=sqrt(6)/3$ 时等号成立。],
)
#question(
  "fill-in",
  stem: [数列 ${a_n}$ 的通项为 $a_n=n+c$，前 $n$ 项和为 $S_n$。若 $S_7<0$，则 $c$ 的取值范围为#fill-placeholder()。],
  answers: ([$(-infinity,-4)$],),
  explanation: [$S_7=(1+7) times 7/2+7c=28+7c<0$，故 $c< -4$。],
)
#question(
  "fill-in",
  stem: [三角形三边长为 $5,6,7$，则以边长为 $6$ 的边的两个顶点为焦点、过另外一个顶点的双曲线的离心率为#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [由双曲线定义，$2c=6$，$2a=7-5=2$，故 $e=c/a=3$。],
)
#question(
  "fill-in",
  stem: [已知 $f(x)=x^2$，$g(x)=cases(f(x)&quad x>=0, -f(-x)&quad x<0)$，则 $g(x)<=2-x$ 的解集为#fill-placeholder()。],
  answers: ([$(-infinity,1]$],),
  explanation: [当 $x>=0$ 时，$x^2+x-2<=0$，得 $0<=x<=1$。
    当 $x<0$ 时，$g(x)=-x^2<0<2-x$，恒成立。合并得 $(-infinity,1]$。],
)
#question(
  "fill-in",
  stem: [在棱柱 $A B C D-A_1 B_1 C_1 D_1$ 中，底面 $A B C D$ 为平行四边形，$A A_1=3$，$B D=4$，$arrow(A B_1) dot arrow(B C)-arrow(A D_1) dot arrow(D C)=5$。设异面直线 $A A_1$ 与 $B D$ 的夹角为 $theta$，则 $cos theta=$#fill-placeholder()。],
  answers: ([$5/12$],),
  explanation: [令 $arrow(u)=arrow(A B)$，$arrow(v)=arrow(A D)$，$arrow(w)=arrow(A A_1)$，则
    $
      (arrow(u)+arrow(w)) dot arrow(v)-(arrow(v)+arrow(w)) dot arrow(u)=arrow(w) dot (arrow(v)-arrow(u))=5.
    $
    又 $arrow(v)-arrow(u)=arrow(B D)$，故 $cos theta=5/(3 times 4)=5/12$。],
)
#question(
  "fill-in",
  stem: [如图，正方形草地 $A B C D$ 边长为 $1.2$，点 $E$ 到 $A B$、$A D$ 的距离均为 $0.2$，点 $F$ 到 $B C$、$C D$ 的距离均为 $0.4$。草地内有一个圆形通道经过 $E,F$，且与 $A D$ 只有一个交点，则圆形通道的周长为#fill-placeholder()。（精确到 $0.01$）
    #figure(lawn())],
  answers: ([$2.73$],),
  explanation: [以 $A$ 为原点，$A B,A D$ 为坐标轴正方向，则 $E=(0.2,0.2)$，$F=(0.8,0.8)$。
    圆心在 $E F$ 的垂直平分线 $x+y=1$ 上。圆在草地内且与 $A D$ 只有一个交点，故相切。
    设半径为 $r$，圆心为 $(r,1-r)$，由圆经过 $E$，得
    $ (r-0.2)^2+(0.8-r)^2=r^2, quad r^2-2r+0.68=0. $
    ∵ 圆在草地内，∴ $r=1-(2sqrt(2))/5$，周长为 $2pi r approx 2.73$。],
)
#question(
  "fill-in",
  stem: [已知 $a_1=2,a_2=4,a_3=8,a_4=16$。实数 $b_1,b_2,b_3,b_4$ 满足 ${a_i+a_j | 1<=i<j<=4}={b_i+b_j | 1<=i<j<=4}$，则有序数列 $(b_1,b_2,b_3,b_4)$ 共有#fill-placeholder() 个。],
  answers: ([$48$],),
  explanation: [六个两两和为 $6,10,12,18,20,24$，互不相同，因此四个 $b_i$ 也互不相同。
    先将它们从小到大记为 $u_1<u_2<u_3<u_4$，则
    $ u_1+u_2=6, quad u_1+u_3=10, quad u_2+u_4=20, quad u_3+u_4=24. $
    余下两个和 $u_1+u_4,u_2+u_3$ 为 $12,18$，分别解得 $(2,4,8,16)$ 或 $(-1,7,11,13)$。
    两种情形均符合条件，每种有 $4!$ 种排列，故共 $2 times 4!=48$ 个。],
)

#section[选择题。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [已知 $a,b,c in RR$，$b>c$，下列不等式恒成立的是#choice-placeholder()。],
  choices: ([$a+b^2>a+c^2$], [$a^2-c>a^2-b$], [$a b^2>a c^2$], [$a^2 b>a^2 c$]),
  answers: ([B],),
  explanation: [由 $b>c$ 得 $-c> -b$，两边加 $a^2$ 即得 B。
    取 $b=-1,c=-2$ 可否定 A；取 $a=0$ 可否定 C、D。],
)
#question(
  "single-choice",
  stem: [空间中有两个不同的平面 $alpha,beta$ 和两条不同的直线 $m,n$，则下列说法中正确的是#choice-placeholder()。],
  choices: (
    [若 $alpha perp beta$，$m perp alpha$，$m perp n$，则 $n perp beta$],
    [若 $alpha perp beta$，$m perp alpha$，$n perp beta$，则 $m perp n$],
    [若 $alpha parallel beta$，$m parallel alpha$，$n parallel beta$，则 $m parallel n$],
    [若 $alpha parallel beta$，$m parallel alpha$，$m parallel n$，则 $n parallel beta$],
  ),
  answers: ([B],),
  explanation: [B 中 $m,n$ 的方向分别为两平面的法向量方向，两平面垂直，故 $m perp n$。
    A 中可取 $n$ 平行于两平面的交线；C 中 $m,n$ 的方向可以不同；D 中 $n$ 可能在平面 $beta$ 内。],
)
#question(
  "single-choice",
  stem: [有四种礼盒，前三种里面分别仅装有中国结、记事本、笔袋，第四个礼盒里面三种礼品都有。现从中任选一个盒子，设事件 $A$：所选盒中有中国结，事件 $B$：所选盒中有记事本，事件 $C$：所选盒中有笔袋，则#choice-placeholder()。],
  choices: (
    [事件 $A$ 与事件 $B$ 互斥],
    [事件 $A$ 与事件 $B$ 相互独立],
    [事件 $A$ 与事件 $B union C$ 互斥],
    [事件 $A$ 与事件 $B inter C$ 相互独立],
  ),
  answers: ([B],),
  explanation: [$P(A)=P(B)=1/2$，$P(A inter B)=1/4=P(A)P(B)$，故 B 正确。
    第四个礼盒使 A、C 两选项中的事件均可同时发生，故不互斥。
    而 $P(B inter C)=1/4$，$P(A inter B inter C)=1/4!=1/2 times 1/4$，故 D 错误。],
)
#question(
  "single-choice",
  stem: [现定义如下：当 $x in (n,n+1)$（$n in NN$）时，若 $f(x+1)=f'(x)$，则称 $f(x)$ 为延展函数。已知当 $x in (0,1)$ 时，$g(x)=e^x$，$h(x)=x^10$，且 $g,h$ 均为延展函数，考虑它们在这些开区间上的图象。以下结论中#choice-placeholder()。

    ① 存在 $y=k x+b$（$k,b in RR$，$k,b!=0$）与 $y=g(x)$ 有无穷个交点；

    ② 存在 $y=k x+b$（$k,b in RR$，$k,b!=0$）与 $y=h(x)$ 有无穷个交点。],
  choices: ([①②都成立], [①②都不成立], [①成立，②不成立], [①不成立，②成立]),
  answers: ([D],),
  explanation: [在 $(n,n+1)$ 上，$g(x)=e^(x-n)$，故 $1<g(x)<e$。因 $k!=0$，$1<k x+b<e$ 只允许 $x$ 在一个有界区间内，涉及有限个单位区间。每个区间上指数函数严格凸，与直线至多有两个交点，故①不成立。
    连续使用延展关系，得 $h(x)=10!(x-9)$（$9<x<10$）。因此直线 $y=10!x-9 times 10!$ 与该段图象重合，②成立。],
)

#section[解答题。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  stem: [已知 $f(x)=sin(omega x+pi/3)$，$omega>0$。],
  parts: (
    subquestion(
      stem: [设 $omega=1$，求 $y=f(x)$ 在 $x in [0,pi]$ 上的值域；],
      answers: ([$[-sqrt(3)/2,1]$。],),
      explanation: [此时 $x+pi/3 in [pi/3,(4pi)/3]$。正弦在该区间的最大值为 $1$，最小值为 $-sqrt(3)/2$，故值域为 $[-sqrt(3)/2,1]$。],
    ),
    subquestion(
      stem: [设 $a>pi$，$f(x)$ 的最小正周期为 $pi$，若在 $x in [pi,a]$ 上恰有 $3$ 个零点，求 $a$ 的取值范围。],
      answers: ([$[(7pi)/3,(17pi)/6)$。],),
      explanation: [由 $(2pi)/omega=pi$ 得 $omega=2$。零点满足 $2x+pi/3=k pi$，即 $x=(k pi)/2-pi/6$。
        大于 $pi$ 的前四个零点依次为 $(4pi)/3,(11pi)/6,(7pi)/3,(17pi)/6$。故 $(7pi)/3<=a<(17pi)/6$。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，$P A,P B,P C$ 为圆锥的三条母线，$A B=A C$。
    #figure(cone())],
  parts: (
    subquestion(
      stem: [证明：$P A perp B C$；],
      answers: ([证明见解析。],),
      explanation: [取 $B C$ 的中点 $N$。由 $A B=A C$，得 $A N perp B C$；圆锥母线等长，$P B=P C$，故 $P N perp B C$。
        又 $A N$ 与 $P N$ 相交于 $N$，故 $B C perp$ 平面 $P A N$，从而 $P A perp B C$。],
    ),
    subquestion(
      stem: [若圆锥侧面积为 $sqrt(3)pi$，$B C$ 为底面直径，$B C=2$，求二面角 $B-P A-C$ 的大小。],
      answers: ([$arccos(-1/5)$。],),
      explanation: [底面半径为 $1$，由侧面积公式得母线长为 $sqrt(3)$，圆锥高为 $sqrt(2)$。
        以底面圆心为原点，可设 $P=(0,0,sqrt(2))$，$A=(1,0,0)$，$B=(0,-1,0)$，$C=(0,1,0)$。
        令 $arrow(v)=arrow(A P)=(-1,0,sqrt(2))$。将 $arrow(A B),arrow(A C)$ 沿棱 $A P$ 的分量去掉，得分别指向两半平面内部的向量
        $
          arrow(u)=arrow(A B)-(arrow(A B) dot arrow(v))/(arrow(v) dot arrow(v)) arrow(v)=(-2/3,-1,-sqrt(2)/3),
        $
        $
          arrow(w)=arrow(A C)-(arrow(A C) dot arrow(v))/(arrow(v) dot arrow(v)) arrow(v)=(-2/3,1,-sqrt(2)/3).
        $
        它们的夹角即所求二面角 $theta$，故 $cos theta=(-1/3)/(5/3)=-1/5$，即 $theta=arccos(-1/5)$。],
    ),
  ),
)
#question(
  "solution",
  stem: [水果分为一级果和二级果，共 $136$ 箱，其中一级果 $102$ 箱，二级果 $34$ 箱。],
  parts: (
    subquestion(
      stem: [随机挑选两箱水果，求恰好一级果和二级果各一箱的概率；],
      answers: ([$17/45$。],),
      explanation: [所求概率为 $(102 times 34)/binom(136, 2)=17/45$。],
    ),
    subquestion(
      stem: [进行分层抽样，共抽 $8$ 箱水果，求一级果和二级果各抽几箱；],
      answers: ([一级果 $6$ 箱，二级果 $2$ 箱。],),
      explanation: [按箱数比例分配，一级果抽取 $8 times 102/136=6$ 箱，二级果抽取 $8 times 34/136=2$ 箱。],
    ),
    subquestion(
      stem: [抽取若干箱水果，其中一级果共 $120$ 个，单果质量平均数为 $303.45$ 克，方差为 $603.46$；二级果 $48$ 个，单果质量平均数为 $240.41$ 克，方差为 $648.21$。求 $168$ 个水果的方差和平均数，并预估果园中单果的质量。],
      answers: (
        [方差约为 $1427.27$ 克平方，平均数约为 $285.44$ 克；按箱数比例预估总体平均质量为 $287.69$ 克。],
      ),
      explanation: [记两组均值为 $overline(x)_1,overline(x)_2$，方差为 $s_1^2,s_2^2$。合并样本的均值为
        $ overline(x)=(120 times 303.45+48 times 240.41)/168 approx 285.44. $
        合并样本的方差为
        $
          s^2=120/168(s_1^2+(overline(x)_1-overline(x))^2)+48/168(s_2^2+(overline(x)_2-overline(x))^2) approx 1427.27.
        $
        按一级果与二级果的箱数比例 $3:1$ 预估总体平均单果质量，得 $3/4 times 303.45+1/4 times 240.41=287.69$（克）。],
    ),
  ),
)
#question(
  "solution",
  stem: [在平面直角坐标系 $x O y$ 中，已知点 $A$ 为椭圆 $Gamma:x^2/6+y^2/2=1$ 上一点，$F_1,F_2$ 分别为椭圆的左、右焦点。],
  parts: (
    subquestion(
      stem: [若点 $A$ 的横坐标为 $2$，求 $abs(A F_1)$ 的长；],
      answers: ([$(5sqrt(6))/3$。],),
      explanation: [半焦距 $c=sqrt(6-2)=2$，故 $F_1=(-2,0)$。设 $A=(2,y)$，代入椭圆得 $y^2=2/3$。
        故 $abs(A F_1)=sqrt(4^2+2/3)=(5sqrt(6))/3$。],
    ),
    subquestion(
      stem: [设 $Gamma$ 的上、下顶点分别为 $M_1,M_2$，记 $triangle A F_1 F_2$ 的面积为 $S_1$，$triangle A M_1 M_2$ 的面积为 $S_2$。若 $S_1>=S_2$，求 $abs(O A)$ 的取值范围；],
      answers: ([$(sqrt(2),(3sqrt(10))/5]$。],),
      explanation: [设 $A=(x,y)$。两三角形均非退化，故 $x y!=0$。
        由 $S_1=2abs(y)$，$S_2=sqrt(2)abs(x)$，得 $2y^2>=x^2$。
        结合 $x^2+3y^2=6$，得 $6/5<=y^2<2$。
        于是 $abs(O A)^2=x^2+y^2=6-2y^2 in (2,18/5]$，故所求范围为 $(sqrt(2),(3sqrt(10))/5]$。],
    ),
    subquestion(
      stem: [若点 $A$ 在 $x$ 轴上方，设直线 $A F_2$ 与 $Gamma$ 交于另一点 $B$，与 $y$ 轴交于点 $K$，$K F_1$ 的延长线与 $Gamma$ 交于点 $C$。是否存在 $x$ 轴上方的点 $C$，使得 $arrow(F_1 A)+arrow(F_1 B)+arrow(F_1 C)=lambda(arrow(F_2 A)+arrow(F_2 B)+arrow(F_2 C))$（$lambda in RR$）成立？若存在，求出点 $C$ 的坐标；若不存在，说明理由。],
      answers: ([存在，$C=(-9/4,sqrt(5)/4)$。],),
      explanation: [
        #step[利用对称性化简向量关系][设 $A=(x_1,y_1)$，$B=(x_2,y_2)$，其中 $y_1>0$。直线 $A F_2$ 与 $K F_1$ 关于 $y$ 轴对称，且每条直线与椭圆的上半部分均只有一个交点，故 $C=(-x_1,y_1)$。
          向量等式两边分别为 $(x_2+6,2y_1+y_2)$ 和 $lambda(x_2-6, 2y_1+y_2)$。若 $2y_1+y_2!=0$，则 $lambda=1$，导致 $6=-6$，矛盾。因此 $y_2=-2y_1$。]
        #step[联立直线与椭圆][设 $A F_2:x=m y+2$，代入椭圆得 $(m^2+3)y^2+4m y-2=0$。
          由韦达定理及 $y_2=-2y_1$，得
          $ y_1=4m/(m^2+3), quad y_1^2=1/(m^2+3). $
          ∴ $16m^2=m^2+3$。由 $y_1>0$，得 $m=sqrt(5)/5$，$y_1=sqrt(5)/4$，$x_1=9/4$。
          此时 $K=(0,-2sqrt(5))$，$C=(-9/4,sqrt(5)/4)$ 确在 $K F_1$ 的延长线上。又 $x_2=3/2$，取 $lambda=-5/3$ 即满足向量等式，故该点存在。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [记 $M(a)={t | t=f(x)-f(a),x>=a}$，$L(a)={t | t=f(x)-f(a),x<=a}$。],
  parts: (
    subquestion(
      stem: [若 $f(x)=x^2+1$，求 $M(1)$ 和 $L(1)$；],
      answers: ([$M(1)=[0,+infinity)$，$L(1)=[-1,+infinity)$。],),
      explanation: [此时 $f(x)-f(1)=x^2-1$。
        在 $x>=1$ 上，其值域为 $[0,+infinity)$；在 $x<=1$ 上，其值域为 $[-1,+infinity)$。],
    ),
    subquestion(
      stem: [若 $f(x)=x^3-3x^2$，求证：对于任意 $a in RR$，都有 $M(a) subset.eq [-4,+infinity)$，且存在 $a$，使得 $-4 in M(a)$；],
      answers: ([证明见解析，可取 $a=0$。],),
      explanation: [由 $f'(x)=3x(x-2)$，知 $f$ 在 $(-infinity,0)$、$(2,+infinity)$ 上递增，在 $(0,2)$ 上递减，且 $f(0)=0$，$f(2)=-4$。
        若 $a>=2$，则对 $x>=a$ 有 $f(x)-f(a)>=0$。
        若 $a<=0$，则 $f(a)<=0$，$f$ 在 $[a,+infinity)$ 上的最小值为 $min(f(a), -4)$，故 $f(x)-f(a)>=min(0, -4-f(a))>=-4$。
        若 $0<a<2$，则 $f(a)<=0$，且 $f(x)>=-4$，同样有 $f(x)-f(a)>=-4$。
        综上得包含关系。取 $a=0,x=2$，有 $f(2)-f(0)=-4$，即 $-4 in M(0)$。],
    ),
    subquestion(
      stem: [已知定义在 $RR$ 上的 $f(x)$ 有最小值，求证：“$f(x)$ 是偶函数”的充要条件是“对于任意正实数 $c$，均有 $M(-c)=L(c)$”。],
      answers: ([证明见解析。],),
      explanation: [
        #step[必要性][若 $f$ 为偶函数，则 $f(-c)=f(c)$。在 $M(-c)$ 的定义中用 $-x$ 替换 $x$，有 $x>=-c$ 等价于 $-x<=c$，且 $f(x)=f(-x)$，故 $M(-c)=L(c)$。]
        #step[充分性][设全局最小值为 $m=f(a)$，令 $r=abs(a)$。
          若 $r=0$，对任意 $c>0$，两半轴 $[-c,+infinity)$、$(-infinity,c]$ 都含 $0$，故两集合的最小元素分别为 $m-f(-c)$、$m-f(c)$。由集合相等，得 $f(-c)=f(c)$。
          若 $r>0$，先取 $c=r$，两半轴都含 $a$，比较最小元素得 $f(-r)=f(r)$，所以 $f(-r)=f(r)=m$。
          此后对任意 $c>0$，$[-c,+infinity)$ 含 $r$，$(-infinity,c]$ 含 $-r$，再次比较两集合的最小元素，得 $f(-c)=f(c)$。
          因此对所有 $c>0$ 均有 $f(-c)=f(c)$，$f$ 是偶函数。]
      ],
    ),
  ),
)
