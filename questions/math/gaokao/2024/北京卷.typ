#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2024,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2024/2024北京.pdf",
  regions: ("北京",),
)

#let square-pyramid() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (4, 0, 0)
  let c = (4, 4, 0)
  let d = (0, 4, 0)
  let p = (2, 3, calc.sqrt(3))
  oblique-project((-0.45, -0.35), (1, 0), (0, 1.1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, d, p, a)
    line(b, p, c)
    line(a, d, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (p, $P$, "south"),
    ) { content(point, label, anchor: anchor, padding: 0.13) }
  })
})
#let trapezoid-pyramid(auxiliary: false) = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (0, 1, 0)
  let c = (1, 1, 0)
  let d = (3, 0, 0)
  let e = (1, 0, 0)
  let p = (1, 0, 2)
  let f = (1, 0, 1)
  let n = (2, 0, 1)
  oblique-project((1, 0), (-0.55, -0.45), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(b, c, d, p, b)
    line(p, c)
    line(p, a, b, stroke: (dash: figure-style.dash))
    line(a, d, stroke: (dash: figure-style.dash))
    line(p, e, stroke: (dash: figure-style.dash))
    line(b, f, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(f, n, stroke: (dash: figure-style.dash))
      line(n, c)
      content(n, $N$, anchor: "south-west", padding: 0.1)
    }
    for (point, label, anchor) in (
      (a, $A$, "north"),
      (b, $B$, "east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (e, $E$, "north-west"),
      (p, $P$, "south"),
      (f, $F$, "south-west"),
    ) { content(point, label, anchor: anchor, padding: 0.12) }
  })
})

#section[选择题：本题共 10 小题，每小题 4 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [已知集合 $M={x | -3<x<1}$，$N={x | -1<=x<4}$，则 $M union N=$#choice-placeholder()。],
  choices: (
    [${x | -1<=x<1}$],
    [${x | x> -3}$],
    [${x | -3<x<4}$],
    [${x | x<4}$],
  ),
  answers: ([C],),
  explanation: [两个区间相交，合并得 $M union N=(-3,4)$。],
)
#question(
  "single-choice",
  stem: [若复数 $z$ 满足 $z/"i"=-1-"i"$，则 $z=$#choice-placeholder()。],
  choices: ([$-1-"i"$], [$-1+"i"$], [$1-"i"$], [$1+"i"$]),
  answers: ([C],),
  explanation: [$z=(-1-"i")"i"=1-"i"$。],
)
#question(
  "single-choice",
  stem: [圆 $x^2+y^2-2x+6y=0$ 的圆心到直线 $x-y+2=0$ 的距离为#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$2$], [$3$], [$3sqrt(2)$]),
  answers: ([D],),
  explanation: [圆的方程为 $(x-1)^2+(y+3)^2=10$，圆心为 $(1,-3)$。
    所求距离为 $abs(1-(-3)+2)/sqrt(1^2+(-1)^2)=3sqrt(2)$。],
)
#question(
  "single-choice",
  stem: [在 $(x-sqrt(x))^4$ 的展开式中，$x^3$ 的系数为#choice-placeholder()。],
  choices: ([$6$], [$-6$], [$12$], [$-12$]),
  answers: ([A],),
  explanation: [通项为 $T_(r+1)=(-1)^r binom(4, r)x^(4-r/2)$。
    由 $4-r/2=3$ 得 $r=2$，故所求系数为 $binom(4, 2)=6$。],
)
#question(
  "single-choice",
  stem: [设 $arrow(a)$，$arrow(b)$ 是向量，则“$(arrow(a)+arrow(b)) dot (arrow(a)-arrow(b))=0$”是“$arrow(a)=-arrow(b)$ 或 $arrow(a)=arrow(b)$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([B],),
  explanation: [前一条件等价于 $abs(arrow(a))=abs(arrow(b))$，由后一条件必能推出。
    但取 $arrow(a)=(1,0)$，$arrow(b)=(0,1)$，前一条件成立而后一条件不成立。
    故为必要不充分条件。],
)
#question(
  "single-choice",
  stem: [设函数 $f(x)=sin omega x$（$omega>0$）。已知 $f(x_1)=-1$，$f(x_2)=1$，且 $abs(x_1-x_2)$ 的最小值为 $pi/2$，则 $omega=$#choice-placeholder()。],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([B],),
  explanation: [相邻最大值点与最小值点的距离为半个周期，即 $pi/omega=pi/2$，故 $omega=2$。],
)
#question(
  "single-choice",
  stem: [生物丰富度指数 $d=(S-1)/(ln N)$ 是河流水质的一个评价指标，其中 $S$，$N$ 分别表示河流中的生物种类数与生物个体总数。生物丰富度指数 $d$ 越大，水质越好。如果某河流治理前后的生物种类数 $S$ 没有变化，生物个体总数由 $N_1$ 变为 $N_2$，生物丰富度指数由 $2.1$ 提高到 $3.15$，则#choice-placeholder()。],
  choices: ([$3N_2=2N_1$], [$2N_2=3N_1$], [$N_2^2=N_1^3$], [$N_2^3=N_1^2$]),
  answers: ([D],),
  explanation: [由 $2.1ln N_1=S-1=3.15ln N_2$，得 $2ln N_1=3ln N_2$，即 $N_1^2=N_2^3$。],
)
#question(
  "single-choice",
  stem: [如图，在四棱锥 $P-A B C D$ 中，底面 $A B C D$ 是边长为 $4$ 的正方形，$P A=P B=4$，$P C=P D=2sqrt(2)$。该棱锥的高为#choice-placeholder()。
    #figure(square-pyramid())],
  choices: ([$1$], [$2$], [$sqrt(2)$], [$sqrt(3)$]),
  answers: ([D],),
  explanation: [以 $A$ 为原点，$A B$，$A D$ 所在直线为 $x$，$y$ 轴，底面的垂线为 $z$ 轴，设 $P=(u,v,h)$。
    ∵ $P A=P B$，∴ $u=2$。
    又 $P A^2-P D^2=8v-16=8$，∴ $v=3$。
    由 $P A^2=2^2+3^2+h^2=16$，得棱锥的高 $abs(h)=sqrt(3)$。],
)
#question(
  "single-choice",
  stem: [已知 $(x_1,y_1)$，$(x_2,y_2)$ 是函数 $y=2^x$ 的图象上两个不同的点，则#choice-placeholder()。],
  choices: (
    [$log_2 (y_1+y_2)/2 < (x_1+x_2)/2$],
    [$log_2 (y_1+y_2)/2 > (x_1+x_2)/2$],
    [$log_2 (y_1+y_2)/2 < x_1+x_2$],
    [$log_2 (y_1+y_2)/2 > x_1+x_2$],
  ),
  answers: ([B],),
  explanation: [∵ 两点不同，∴ $y_1!=y_2$，且 $y_1,y_2>0$。
    由基本不等式，$(y_1+y_2)/2>sqrt(y_1 y_2)=2^((x_1+x_2)/2)$。
    两边取以 $2$ 为底的对数即得结论。],
)
#question(
  "single-choice",
  stem: [已知 $M={(x,y) | y=x+t(x^2-x),1<=x<=2,0<=t<=1}$ 是平面直角坐标系中的点集。设 $d$ 是 $M$ 中两点间的距离的最大值，$S$ 是 $M$ 表示的图形的面积，则#choice-placeholder()。],
  choices: (
    [$d=3$，$S<1$],
    [$d=3$，$S>1$],
    [$d=sqrt(10)$，$S<1$],
    [$d=sqrt(10)$，$S>1$],
  ),
  answers: ([C],),
  explanation: [由 $1<=x<=2$，得 $x<=y<=x^2$。
    任意两点的横坐标差不超过 $1$，纵坐标差不超过 $3$，故距离不超过 $sqrt(10)$；点 $(1,1)$ 与 $(2,4)$ 使等号成立。
    区域位于直线 $y=x$、$x=2$ 和弦 $y=3x-2$ 围成的三角形内。该三角形面积为 $1/2 times 2 times 1=1$，且在 $1<x<2$ 时 $x^2<3x-2$，故 $S<1$。],
)

#section[填空题：本题共 5 小题，每小题 5 分，共 25 分。]
#question(
  "fill-in",
  stem: [抛物线 $y^2=16x$ 的焦点坐标为#fill-placeholder()。],
  answers: ([$(4,0)$],),
  explanation: [由 $2p=16$ 得 $p=8$，故焦点为 $(p/2,0)=(4,0)$。],
)
#question(
  "fill-in",
  stem: [在平面直角坐标系 $x O y$ 中，角 $alpha$ 与角 $beta$ 均以 $O x$ 为始边，它们的终边关于原点对称。若 $alpha in [pi/6,pi/3]$，则 $cos beta$ 的最大值为#fill-placeholder()。],
  answers: ([$-1/2$],),
  explanation: [$beta=alpha+(2k+1)pi$（$k in ZZ$），故 $cos beta=-cos alpha$。
    当 $alpha=pi/3$ 时取得最大值 $-1/2$。],
)
#question(
  "fill-in",
  stem: [若直线 $y=k(x-3)$ 与双曲线 $x^2/4-y^2=1$ 只有一个公共点，则 $k$ 的一个取值为#fill-placeholder()。],
  answers: ([$1/2$（或 $-1/2$）],),
  explanation: [消去 $y$ 得 $(1-4k^2)x^2+24k^2 x-36k^2-4=0$。
    当 $k=plus.minus 1/2$ 时，方程化为 $6x-13=0$，只有一个解。
    当 $k!=plus.minus 1/2$ 时，判别式 $Delta=80k^2+16>0$，有两个公共点。
    故填 $1/2$ 或 $-1/2$ 均可。],
)
#question(
  "fill-in",
  stem: [汉代刘歆设计的“铜嘉量”是龠、合、升、斗、斛五量合一的标准量器，其中升量器、斗量器、斛量器的形状均可视为圆柱。若升、斗、斛量器的容积成公比为 $10$ 的等比数列，底面直径依次为 $65$ mm、$325$ mm、$325$ mm，且斛量器的高为 $230$ mm，则斗量器的高为#fill-placeholder() mm，升量器的高为#fill-placeholder() mm。（不计量器的厚度）],
  answers: ([$23$], [$57.5$]),
  explanation: [斗与斛的底面积相同，容积比为 $1:10$，故斗高为 $230/10=23$ mm。
    升与斗的底面积比为 $(65/325)^2=1/25$，容积比为 $1:10$，故升高为 $23 times 25/10=57.5$ mm。],
)
#question(
  "fill-in",
  stem: [设 ${a_n}$ 与 ${b_n}$ 是两个不同的无穷数列，且都不是常数列。记集合 $M={k | a_k=b_k,k in NN^*}$，给出下列四个结论：

    ① 若 ${a_n}$ 与 ${b_n}$ 均为等差数列，则 $M$ 中最多有 $1$ 个元素；

    ② 若 ${a_n}$ 与 ${b_n}$ 均为等比数列，则 $M$ 中最多有 $2$ 个元素；

    ③ 若 ${a_n}$ 为等差数列，${b_n}$ 为等比数列，则 $M$ 中最多有 $3$ 个元素；

    ④ 若 ${a_n}$ 为递增数列，${b_n}$ 为递减数列，则 $M$ 中最多有 $1$ 个元素。

    其中正确结论的序号是#fill-placeholder()。],
  answers: ([①③④],),
  explanation: [
    #step[结论①][两个不同的等差数列对应两条不同的直线，交点至多一个，正确。]
    #step[结论②][取 $a_n=2^n$，$b_n=(-2)^n$，所有正偶数都属于 $M$，错误。]
    #step[结论③][设 $a_n=u n+v$（$u!=0$），$b_n=c q^n$（$c q!=0$，$q!=1$）。
      若 $q>0$，指数函数 $c q^x$ 的二阶导数恒正或恒负，与直线至多有两个交点。
      若 $q=-1$，$b_n$ 只有两个取值，递增或递减的 $a_n$ 至多分别取到它们一次。
      若 $q<0$ 且 $q!=-1$，奇、偶数项分别落在 $y=-c abs(q)^x$ 和 $y=c abs(q)^x$ 上。这两条曲线一增一减，且各自的二阶导数不变号。其中一条与直线 $y=u x+v$ 单调方向相反，至多相交一次；另一条至多相交两次。因此总共至多三个交点，正确。]
    #step[结论④][$a_n-b_n$ 严格递增，至多有一项等于零，正确。]
  ],
)

#section[解答题：本题共 6 小题，共 85 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  stem: [在 $triangle A B C$ 中，内角 $A$，$B$，$C$ 的对边分别为 $a$，$b$，$c$，$angle A$ 为钝角，$a=7$，$sin 2B=sqrt(3)/7 b cos B$。],
  parts: (
    subquestion(
      stem: [求 $angle A$；],
      answers: ([$(2pi)/3$。],),
      explanation: [∵ $A$ 为钝角，∴ $B$ 为锐角，$cos B>0$。
        由 $2sin B cos B=sqrt(3)/7 b cos B$，得 $sin B/b=sqrt(3)/14$。
        由正弦定理，$sin A=7 times sqrt(3)/14=sqrt(3)/2$。
        ∴ $A=(2pi)/3$。],
    ),
    subquestion(
      stem: [再从条件①、条件②、条件③这三个条件中选择一个作为已知，使得 $triangle A B C$ 存在，求 $triangle A B C$ 的面积。

        条件①：$b=7$；条件②：$cos B=13/14$；条件③：$c sin A=(5sqrt(3))/2$。

        注：如果选择的条件不符合要求，第（2）问得 $0$ 分；如果选择多个符合要求的条件分别解答，按第一个解答计分。],
      answers: ([选择②或③，面积为 $(15sqrt(3))/4$。],),
      explanation: [选择条件②。
        ∵ $sin B=sqrt(1-(13/14)^2)=(3sqrt(3))/14$，∴ $b=3$。
        由余弦定理，$49=9+c^2-6c cos ((2pi)/3)=9+c^2+3c$。
        ∵ $c>0$，∴ $c=5$。
        所以 $S_(triangle A B C)=1/2 b c sin A=(15sqrt(3))/4$。
        条件①会使 $A=B$，与 $A$ 为钝角矛盾；条件③可先求出 $c=5$，再由余弦定理求得 $b=3$，结果相同。],
    ),
  ),
)
#question(
  "solution",
  stem: [如图，在四棱锥 $P-A B C D$ 中，$B C parallel A D$，$A B=B C=1$，$A D=3$。点 $E$ 在 $A D$ 上，且 $P E perp A D$，$P E=D E=2$。
    #figure(trapezoid-pyramid())],
  parts: (
    subquestion(
      stem: [若 $F$ 为线段 $P E$ 的中点，求证：$B F parallel$ 平面 $P C D$；],
      answers: ([证明见解析。],),
      explanation: [取 $P D$ 的中点 $N$，连接 $F N$，$C N$。
        #figure(trapezoid-pyramid(auxiliary: true))
        ∵ $F N$ 为 $triangle P E D$ 的中位线，∴ $F N parallel E D$，$F N=1/2 E D=1$。
        又 $B C parallel E D$，$B C=1$，故四边形 $B C N F$ 为平行四边形，$B F parallel C N$。
        ∵ $C N subset$ 平面 $P C D$，$B F cancel(subset)$ 平面 $P C D$，∴ $B F parallel$ 平面 $P C D$。],
    ),
    subquestion(
      stem: [若 $A B perp$ 平面 $P A D$，求平面 $P A B$ 与平面 $P C D$ 夹角的余弦值。],
      answers: ([$sqrt(30)/30$。],),
      explanation: [以 $A$ 为原点，$A D$，$A B$ 的方向分别为 $x$，$y$ 轴正方向，$E P$ 的方向为 $z$ 轴正方向，建立空间直角坐标系。
        则 $A=(0,0,0)$，$B=(0,1,0)$，$C=(1,1,0)$，$D=(3,0,0)$，$P=(1,0,2)$。
        平面 $P A B$ 的一个法向量为 $arrow(m)=(2,0,-1)$；平面 $P C D$ 的一个法向量为 $arrow(n)=(1,2,1)$。
        故两平面夹角 $theta$ 满足
        $
          cos theta=abs(arrow(m) dot arrow(n))/(abs(arrow(m)) abs(arrow(n)))=1/sqrt(30)=sqrt(30)/30.
        $],
    ),
  ),
)
#question(
  "solution",
  stem: [某保险公司为了解该公司某种保险产品的索赔情况，从合同保险期限届满的保单中随机抽取 $1000$ 份，记录并整理这些保单的索赔情况，获得数据如下表：
    #table(
      columns: 6,
      align: center,
      [索赔次数], [$0$], [$1$], [$2$], [$3$], [$4$],
      [保单份数], [$800$], [$100$], [$60$], [$30$], [$10$],
    )
    假设：一份保单的保费为 $0.4$ 万元；前三次索赔时，保险公司每次赔偿 $0.8$ 万元；第四次索赔时，保险公司赔偿 $0.6$ 万元。

    假设不同保单的索赔次数相互独立。用频率估计概率。],
  parts: (
    subquestion(
      stem: [估计一份保单索赔次数不少于 $2$ 的概率；],
      answers: ([$0.1$。],),
      explanation: [所求概率的估计值为 $(60+30+10)/1000=0.1$。],
    ),
    subquestion(
      stem: [一份保单的毛利润定义为这份保单的保费与赔偿总金额之差。],
      parts: (
        subquestion(
          stem: [记 $X$ 为一份保单的毛利润，估计 $X$ 的数学期望 $E X$；],
          answers: ([$0.122$ 万元。],),
          explanation: [$X$ 的分布列估计如下（单位：万元）：
            #table(
              columns: 6,
              align: center,
              [$X$], [$0.4$], [$-0.4$], [$-1.2$], [$-2$], [$-2.6$],
              [$P$], [$0.8$], [$0.1$], [$0.06$], [$0.03$], [$0.01$],
            )
            $
              E X=0.4 times 0.8-0.4 times 0.1-1.2 times 0.06-2 times 0.03-2.6 times 0.01=0.122.
            $],
        ),
        subquestion(
          stem: [如果无索赔的保单的保费减少 $4%$，有索赔的保单的保费增加 $20%$，试比较这种情况下一份保单毛利润的数学期望估计值与（i）中 $E X$ 估计值的大小。（结论不要求证明）],
          answers: ([调整后的数学期望估计值更大。],),
          explanation: [赔偿金额不变，平均保费的变化量为
            $ -0.4 times 4% times 0.8+0.4 times 20% times 0.2=0.0032>0. $
            因此毛利润的数学期望估计值增加到 $0.1252$ 万元。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  stem: [已知椭圆 $E:x^2/a^2+y^2/b^2=1$（$a>b>0$），以椭圆 $E$ 的焦点和短轴端点为顶点的四边形是边长为 $2$ 的正方形。过点 $(0,t)$（$t>sqrt(2)$）且斜率存在的直线与椭圆 $E$ 交于不同的两点 $A$，$B$，过点 $A$ 和 $C(0,1)$ 的直线 $A C$ 与椭圆 $E$ 的另一个交点为 $D$。],
  parts: (
    subquestion(
      stem: [求椭圆 $E$ 的方程及离心率；],
      answers: ([$x^2/4+y^2/2=1$，$e=sqrt(2)/2$。],),
      explanation: [设半焦距为 $c$。由正方形的两条对角线长均为 $2sqrt(2)$，得 $b=c=sqrt(2)$。
        ∴ $a^2=b^2+c^2=4$，椭圆方程为 $x^2/4+y^2/2=1$，离心率为 $e=c/a=sqrt(2)/2$。],
    ),
    subquestion(
      stem: [若直线 $B D$ 的斜率为 $0$，求 $t$ 的值。],
      answers: ([$t=2$。],),
      explanation: [
        #step[利用水平弦的对称性][设 $A=(x_1,y_1)$，$B=(x_2,y_2)$，直线 $A B$ 为 $y=k x+t$。
          ∵ $t>sqrt(2)$ 且直线与椭圆相交，∴ $k!=0$。
          由 $B D$ 水平，得 $D=(-x_2,y_2)$。点 $A$，$C$，$D$ 共线，故
          $ x_1(y_2-1)+x_2(y_1-1)=0. $
          代入 $y_i=k x_i+t$，得 $2k x_1 x_2+(t-1)(x_1+x_2)=0$。]
        #step[代入韦达定理][联立直线与椭圆，得
          $ (1+2k^2)x^2+4k t x+2t^2-4=0, $
          $ x_1+x_2=-(4k t)/(1+2k^2), quad x_1 x_2=(2t^2-4)/(1+2k^2). $
          ∴ $(4k(t-2))/(1+2k^2)=0$。由 $k!=0$，得 $t=2$。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [设函数 $f(x)=x+k ln(1+x)$（$k!=0$），直线 $l$ 是曲线 $y=f(x)$ 在点 $(t,f(t))$（$t>0$）处的切线。],
  parts: (
    subquestion(
      stem: [当 $k=-1$ 时，求 $f(x)$ 的单调区间；],
      answers: ([单调递减区间为 $(-1,0)$，单调递增区间为 $(0,+infinity)$。],),
      explanation: [定义域为 $(-1,+infinity)$。当 $k=-1$ 时，$f'(x)=x/(1+x)$。
        当 $-1<x<0$ 时 $f'(x)<0$；当 $x>0$ 时 $f'(x)>0$，故得所述单调区间。],
    ),
    subquestion(
      stem: [求证：$l$ 不经过点 $(0,0)$；],
      answers: ([证明见解析。],),
      explanation: [切线 $l$ 的纵截距为
        $ f(t)-t f'(t)=k(ln(1+t)-t/(1+t)). $
        令 $h(t)=ln(1+t)-t/(1+t)$，则 $h(0)=0$，且 $h'(t)=t/(1+t)^2>0$（$t>0$）。
        ∴ $h(t)>0$。又 $k!=0$，故切线的纵截距非零，即 $l$ 不经过原点。],
    ),
    subquestion(
      stem: [当 $k=1$ 时，设点 $A(t,f(t))$（$t>0$），$C(0,f(t))$，$O(0,0)$，$B$ 为 $l$ 与 $y$ 轴的交点，$S_(triangle A C O)$ 与 $S_(triangle A B O)$ 分别表示 $triangle A C O$ 与 $triangle A B O$ 的面积。是否存在点 $A$ 使得 $2S_(triangle A C O)=15S_(triangle A B O)$ 成立？若存在，这样的点 $A$ 有几个？

        （参考数据：$1.09<ln 3<1.10$，$1.60<ln 5<1.61$，$1.94<ln 7<1.95$。）],
      answers: ([存在，共 $2$ 个。],),
      explanation: [
        #step[转化为零点问题][由（2）知 $B=(0,h(t))$，且 $h(t)>0$。
          两三角形以 $y$ 轴上的线段为底，具有相同的高 $t$，故面积条件等价于 $2f(t)=15h(t)$，即
          $ g(t)=13ln(1+t)-2t-(15t)/(1+t)=0, quad t>0. $]
        #step[确定零点个数][
          $ g'(t)=(-(2t-1)(t-4))/(1+t)^2. $
          ∴ $g$ 在 $(0,1/2)$ 上递减，在 $(1/2,4)$ 上递增，在 $(4,+infinity)$ 上递减。
          又 $g(0)=0$，故 $g(1/2)<0$；由参考数据，
          $ g(4)=13ln 5-20>0.8>0, $
          $ g(24)=26ln 5-48-72/5<26 times 1.61-48-72/5<0. $
          由连续性与单调性，$(1/2,4)$ 和 $(4,24)$ 内各有一个零点，其他正数区间没有零点。
          故满足条件的点 $A$ 恰有 $2$ 个。]
      ],
    ),
  ),
)
#question(
  "solution",
  stem: [已知集合 $M={(i,j,k,w) | i in {1,2},j in {3,4},k in {5,6},w in {7,8},"且" i+j+k+w "为偶数"}$。给定数列 $A:a_1,a_2,dots.c,a_8$ 和序列 $Omega:T_1,T_2,dots.c,T_s$，其中 $T_t=(i_t,j_t,k_t,w_t) in M$（$t=1,2,dots.c,s$），对数列 $A$ 进行如下变换：

    将 $A$ 的第 $i_1,j_1,k_1,w_1$ 项均加 $1$，其余项不变，得到的数列记作 $T_1(A)$；将 $T_1(A)$ 的第 $i_2,j_2,k_2,w_2$ 项均加 $1$，其余项不变，得到的数列记作 $T_2 T_1(A)$；……；以此类推，得到数列 $T_s dots.c T_2 T_1(A)$，简记为 $Omega(A)$。],
  parts: (
    subquestion(
      stem: [给定数列 $A:1,3,2,4,6,3,1,9$ 和序列 $Omega:(1,3,5,7),(2,4,6,8),(1,3,5,7)$，写出 $Omega(A)$；],
      answers: ([$3,4,4,5,8,4,3,10$。],),
      explanation: [奇数位置的项均增加 $2$，偶数位置的项均增加 $1$，故得到 $3,4,4,5,8,4,3,10$。],
    ),
    subquestion(
      stem: [是否存在序列 $Omega$，使得 $Omega(A)$ 为 $a_1+2,a_2+6,a_3+4,a_4+2,a_5+8,a_6+2,a_7+4,a_8+4$？若存在，写出一个 $Omega$；若不存在，说明理由；],
      answers: ([不存在。],),
      explanation: [每次变换使第 $1,2$ 项之和、第 $3,4$ 项之和、第 $5,6$ 项之和、第 $7,8$ 项之和各增加 $1$。
        题设目标中这四个和的增量分别为 $8,6,10,8$，不相等，因此不存在这样的序列。],
    ),
    subquestion(
      stem: [若数列 $A$ 的各项均为正整数，且 $a_1+a_3+a_5+a_7$ 为偶数，求证：“存在序列 $Omega$，使得 $Omega(A)$ 的各项都相等”的充要条件为“$a_1+a_2=a_3+a_4=a_5+a_6=a_7+a_8$”。],
      answers: ([证明见解析。],),
      explanation: [
        #step[必要性][每次变换使四对相邻项之和各增加 $1$，所以这些和的两两差值始终不变。若最终各项相等，则最初四对相邻项之和必相等。]
        #step[把充分性化为消去四个差][设四对相邻项之和均为 $s$，记
          $ d_j=a_(2j-1)-a_(2j)=2a_(2j-1)-s, quad j=1,2,3,4. $
          每次变换在每一对中选一个位置：选奇数位置使相应的 $d_j$ 增加 $1$，选偶数位置使其减少 $1$。
          所选下标之和为偶数，等价于选中偶数个奇数位置。
          四对相邻项之和始终相等，因此只需使四个差都变为 $0$。]
        #step[构造有限次合法变换][以下四元组的加法和数乘均按对应位置计算。记
          $ v_1=(1,1,1,1), quad v_2=(1,1,-1,-1), $
          $ v_3=(1,-1,1,-1), quad v_4=(1,-1,-1,1). $
          它们以及各自的相反数都有偶数个 $+1$，均对应一次合法变换对四个差的增量。
          令
          $ u_1=(d_1+d_2+d_3+d_4)/4, quad u_2=(d_1+d_2-d_3-d_4)/4, $
          $ u_3=(d_1-d_2+d_3-d_4)/4, quad u_4=(d_1-d_2-d_3+d_4)/4. $
          由 $a_1+a_3+a_5+a_7$ 为偶数，$u_1=(a_1+a_3+a_5+a_7)/2-s$ 为整数；同理 $u_2,u_3,u_4$ 也为整数。
          直接计算可得
          $ (d_1,d_2,d_3,d_4)=u_1 v_1+u_2 v_2+u_3 v_3+u_4 v_4. $
          对每个 $j$，若 $u_j>0$，执行 $u_j$ 次增量为 $-v_j$ 的变换；若 $u_j<0$，执行 $-u_j$ 次增量为 $v_j$ 的变换；若 $u_j=0$ 则不操作。
          这些变换把四个差全部消为 $0$，于是八项全部相等。若原数列已经各项相等，可依次执行 $(1,3,5,7)$ 和 $(2,4,6,8)$，仍保持各项相等。
          所有操作只增加原数列的项，且次数有限，充分性得证。]
      ],
    ),
  ),
)
