#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019全国2理(甘肃,青海,内蒙古,黑龙江,吉林,辽宁,海南.宁夏,新疆,陕西,重庆).pdf",
  regions: (
    "甘肃",
    "青海",
    "内蒙古",
    "黑龙江",
    "吉林",
    "辽宁",
    "海南",
    "宁夏",
    "新疆",
    "陕西",
    "重庆",
  ),
)

#let polyhedron-diagram() = cetz.canvas(length: 37mm, {
  import cetz.draw: *
  let t = (calc.sqrt(2) - 1) / 2
  let dot(a, b) = a.at(0) * b.at(0) + a.at(1) * b.at(1) + a.at(2) * b.at(2)
  let points = ()
  for axis in range(3) {
    for sx in (-1, 1) {
      for sy in (-1, 1) {
        for sz in (-1, 1) {
          points.push((
            sx * (if axis == 0 { 0.5 } else { t }),
            sy * (if axis == 1 { 0.5 } else { t }),
            sz * (if axis == 2 { 0.5 } else { t }),
          ))
        }
      }
    }
  }
  let faces = ()
  for x in (-1, 0, 1) {
    for y in (-1, 0, 1) {
      for z in (-1, 0, 1) {
        let count = calc.abs(x) + calc.abs(y) + calc.abs(z)
        if count > 0 { faces.push(((x, y, z), 0.5 + (count - 1) * t)) }
      }
    }
  }
  oblique-project((1, 0), (0.45, 0.4), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    for i in range(points.len()) {
      for j in range(i + 1, points.len()) {
        let p = points.at(i)
        let q = points.at(j)
        let distance-squared = range(3)
          .map(k => calc.pow(p.at(k) - q.at(k), 2))
          .sum()
        if calc.abs(distance-squared - 4 * t * t) < 1e-8 {
          let visible = faces.any(face => {
            let (normal, bound) = face
            (
              calc.abs(dot(normal, p) - bound) < 1e-8
                and calc.abs(dot(normal, q) - bound) < 1e-8
                and dot(normal, (0.45, -1, 0.4)) > 0
            )
          })
          if visible { line(p, q) } else {
            line(p, q, stroke: (dash: figure-style.dash))
          }
        }
      }
    }
  })
})

#let cuboid-diagram() = cetz.canvas(length: 25mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (1, 0, 0)
  let c = (1, 1, 0)
  let d = (0, 1, 0)
  let a1 = (0, 0, 2)
  let b1 = (1, 0, 2)
  let c1 = (1, 1, 2)
  let d1 = (0, 1, 2)
  let e = (0, 0, 1)
  oblique-project((0.95, 0.22), (-0.45, 0.25), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, b1, c1, d1, d, a, a1, b1)
    line(a1, d1)
    line(b, c, d, stroke: (dash: figure-style.dash))
    line(c, c1, stroke: (dash: figure-style.dash))
    line(b, e, b1)
    line(c, e, c1, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north"),
      (b, $B$, "west"),
      (c, $C$, "north-east"),
      (d, $D$, "east"),
      (a1, $A_1$, "north-east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south"),
      (d1, $D_1$, "east"),
      (e, $E$, "east"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#let ellipse-diagram() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: $O$,
    x: (label: (anchor: "west", offset: 0.2)),
    y: (label: (anchor: "south", offset: 0.2)),
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  let k = 1.2
  let p = 2 / calc.sqrt(1 + 2 * k * k)
  let g = (p * (3 * k * k + 2) / (k * k + 2), p * k * k * k / (k * k + 2))
  plot.plot(
    size: (5.2, 3.8),
    axis-style: "school-book",
    x-min: -2.6,
    x-max: 2.6,
    y-min: -1.8,
    y-max: 2,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.annotate(resize: false, {
        circle((0, 0), radius: (2, calc.sqrt(2)))
        line((p, k * p), (-p, -k * p), g, close: true)
        line((p, k * p), (p, 0), stroke: (dash: figure-style.dash))
        for (point, label, anchor) in (
          ((p, k * p), $P$, "south-west"),
          ((-p, -k * p), $Q$, "north-east"),
          (g, $G$, "west"),
          ((p, 0), $E$, "north-west"),
          ((-2, 0), $A$, "south-east"),
          ((2, 0), $B$, "south-west"),
        ) { content(point, label, anchor: anchor, padding: 3pt) }
        circle((-2, 0), radius: 0.04, fill: white)
        circle((2, 0), radius: 0.04, fill: white)
      })
    },
  )
})

#section[选择题：本题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={x|x^2-5x+6>0}$，$B={x|x-1<0}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([$(-infinity,1)$], [$(-2,1)$], [$(-3,-1)$], [$(3,+infinity)$]),
  answers: ([A],),
  explanation: [$A=(-infinity,2) union (3,+infinity)$，$B=(-infinity,1) subset A$，故 $A inter B=B$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $z=-3+2"i"$，则在复平面内 $overline(z)$ 对应的点位于#choice-placeholder()。],
  choices: ([第一象限], [第二象限], [第三象限], [第四象限]),
  answers: ([C],),
  explanation: [$overline(z)=-3-2"i"$ 对应点 $(-3,-2)$，位于第三象限。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $arrow(A B)=(2,3)$，$arrow(A C)=(3,t)$，$|arrow(B C)|=1$，则 $arrow(A B) dot arrow(B C)=$#choice-placeholder()。],
  choices: ([$-3$], [$-2$], [$2$], [$3$]),
  answers: ([C],),
  explanation: [$arrow(B C)=arrow(A C)-arrow(A B)=(1,t-3)$。由 $1+(t-3)^2=1$ 得 $t=3$，故 $arrow(A B) dot arrow(B C)=(2,3) dot (1,0)=2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [2019 年 1 月 3 日嫦娥四号探测器成功实现人类历史上首次月球背面软着陆，我国航天事业取得又一重大成就。实现月球背面软着陆需要解决的一个关键技术问题是地面与探测器的通讯联系。为解决这个问题，发射了嫦娥四号中继星“鹊桥”，鹊桥沿着围绕地月拉格朗日 $L_2$ 点的轨道运行。$L_2$ 点是平衡点，位于地月连线的延长线上。设地球质量为 $M_1$，月球质量为 $M_2$，地月距离为 $R$，$L_2$ 点到月球的距离为 $r$。根据牛顿运动定律和万有引力定律，$r$ 满足方程：
    $ M_1/(R+r)^2+M_2/r^2=(R+r)M_1/R^3. $
    设 $alpha=r/R$，由于 $alpha$ 的值很小，因此在近似计算中 $(3alpha^3+3alpha^4+alpha^5)/(1+alpha)^2 approx 3alpha^3$，则 $r$ 的近似值为#choice-placeholder()。],
  choices: (
    [$sqrt(M_2/M_1)R$],
    [$sqrt(M_2/(2M_1))R$],
    [$root(3, (3M_2)/M_1)R$],
    [$root(3, M_2/(3M_1))R$],
  ),
  answers: ([D],),
  explanation: [代入 $r=alpha R$ 并整理，得
    $
      M_2/M_1=alpha^2 ((1+alpha)-1/(1+alpha)^2)=(3alpha^3+3alpha^4+alpha^5)/(1+alpha)^2 approx 3alpha^3.
    $
    因此 $alpha approx root(3, M_2/(3M_1))$，故 $r approx root(3, M_2/(3M_1))R$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [演讲比赛共有 9 位评委分别给出某选手的原始评分，评定该选手的成绩时，从 9 个原始评分中去掉 1 个最高分、1 个最低分，得到 7 个有效评分。7 个有效评分与 9 个原始评分相比，不变的数字特征是#choice-placeholder()。],
  choices: ([中位数], [平均数], [方差], [极差]),
  answers: ([A],),
  explanation: [将原始评分从小到大排列为 $x_1<=dots<=x_9$，中位数为 $x_5$。删去 $x_1,x_9$ 后，剩下七个数的中位数仍为 $x_5$；其余三个特征均可能改变。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $a>b$，则#choice-placeholder()。],
  choices: ([$ln(a-b)>0$], [$3^a<3^b$], [$a^3-b^3>0$], [$|a|>|b|$]),
  answers: ([C],),
  explanation: [$y=x^3$ 在 $RR$ 上严格递增，因此 $a>b$ 必有 $a^3>b^3$。A 在 $a-b=1$ 时不成立；B 与指数函数的递增性相反；D 在 $a=1,b=-2$ 时不成立。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $alpha,beta$ 为两个平面，则 $alpha parallel beta$ 的充要条件是#choice-placeholder()。],
  choices: (
    [$alpha$ 内有无数条直线与 $beta$ 平行],
    [$alpha$ 内有两条相交直线与 $beta$ 平行],
    [$alpha,beta$ 平行于同一条直线],
    [$alpha,beta$ 垂直于同一平面],
  ),
  answers: ([B],),
  explanation: [由面面平行判定定理，B 是充分条件；若 $alpha parallel beta$，则 $alpha$ 内的任意直线均与 $beta$ 平行，所以 B 也是必要条件。
    两个相交平面也可满足 A、C、D 中的条件，它们均不充分。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若抛物线 $y^2=2p x$（$p>0$）的焦点是椭圆 $x^2/(3p)+y^2/p=1$ 的一个焦点，则 $p=$#choice-placeholder()。],
  choices: ([$2$], [$3$], [$4$], [$8$]),
  answers: ([D],),
  explanation: [抛物线焦点为 $(p/2,0)$，椭圆半焦距为 $sqrt(3p-p)=sqrt(2p)$，故 $p^2/4=2p$。结合 $p>0$，得 $p=8$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [下列函数中，以 $pi/2$ 为周期且在区间 $(pi/4,pi/2)$ 单调递增的是#choice-placeholder()。],
  choices: (
    [$f(x)=|cos 2x|$],
    [$f(x)=|sin 2x|$],
    [$f(x)=cos |x|$],
    [$f(x)=sin |x|$],
  ),
  answers: ([A],),
  explanation: [对于 A，$|cos(2x+pi)|=|cos 2x|$，且在给定区间内 $f(x)=-cos 2x$，严格递增。B 在该区间递减；C、D 均有 $f(0)!=f(pi/2)$，所以 $pi/2$ 不是它们的周期。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $alpha in (0,pi/2)$，$2sin 2alpha=cos 2alpha+1$，则 $sin alpha=$#choice-placeholder()。],
  choices: ([$1/5$], [$sqrt(5)/5$], [$sqrt(3)/3$], [$2sqrt(5)/5$]),
  answers: ([B],),
  explanation: [化简得 $4sin alpha cos alpha=2cos^2 alpha$。∵ $cos alpha>0$，∴ $2sin alpha=cos alpha$。由平方和关系得 $5sin^2 alpha=1$，故 $sin alpha=sqrt(5)/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $F$ 为双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的右焦点，$O$ 为坐标原点，以 $O F$ 为直径的圆与圆 $x^2+y^2=a^2$ 交于 $P,Q$ 两点。若 $|P Q|=|O F|$，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$sqrt(3)$], [$2$], [$sqrt(5)$]),
  answers: ([A],),
  explanation: [设 $|O F|=c$。$P Q$ 是以 $O F$ 为直径的圆的弦，弦长等于直径，故 $P Q$ 也是直径。
    两圆的公共弦垂直于连心线 $O F$，故 $P,Q$ 的坐标为 $(c/2,plus.minus c/2)$。代入另一圆得 $a^2=c^2/2$，所以 $e=c/a=sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)$ 的定义域为 $RR$，满足 $f(x+1)=2f(x)$，且当 $x in (0,1]$ 时，$f(x)=x(x-1)$。若对任意 $x in (-infinity,m]$，都有 $f(x)>=-8/9$，则 $m$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$(-infinity,9/4]$],
    [$(-infinity,7/3]$],
    [$(-infinity,5/2]$],
    [$(-infinity,8/3]$],
  ),
  answers: ([B],),
  explanation: [将 $x$ 唯一写成 $x=k+t$，其中 $k in ZZ$、$t in (0,1]$，则 $f(x)=2^k t(t-1)$。当 $x<=2$ 时，$k<=1$，故 $f(x)>=-2^k/4>=-1/2>-8/9$。
    当 $2<x<=3$ 时，$f(x)=4(x-2)(x-3)$。方程 $f(x)=-8/9$ 的根为 $7/3,8/3$，且 $f(x)< -8/9$ 恰在 $(7/3,8/3)$ 内成立。
    因此 $m<=7/3$ 时要求成立；若 $m>7/3$，区间内必包含上述不等式失效的点，故所求范围为 $(-infinity,7/3]$。],
)

#section[填空题：本题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [我国高铁发展迅速，技术先进。经统计，在经停某站的高铁列车中，有 10 个车次的正点率为 0.97，有 20 个车次的正点率为 0.98，有 10 个车次的正点率为 0.99，则经停该站高铁列车所有车次的平均正点率的估计值为#fill-placeholder()。],
  answers: ([$0.98$],),
  explanation: [按车次数量加权，平均正点率的估计值为 $(10 times 0.97+20 times 0.98+10 times 0.99)/40=0.98$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $f(x)$ 是奇函数，且当 $x<0$ 时，$f(x)=-e^(a x)$。若 $f(ln 2)=8$，则 $a=$#fill-placeholder()。],
  answers: ([$-3$],),
  explanation: [由奇性，$8=f(ln 2)=-f(-ln 2)=e^(-a ln 2)=2^(-a)$，所以 $a=-3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$。若 $b=6$，$a=2c$，$B=pi/3$，则 $triangle A B C$ 的面积为#fill-placeholder()。],
  answers: ([$6sqrt(3)$],),
  explanation: [由余弦定理，$36=a^2+c^2-2a c cos B=3c^2$，故 $c^2=12$。于是 $S=1/2 a c sin B=c^2 sqrt(3)/2=6sqrt(3)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [中国有悠久的金石文化，印信是金石文化的代表之一。印信的形状多为长方体、正方体或圆柱体，但南北朝时期的官员独孤信的印信形状是“半正多面体”。半正多面体是由两种或两种以上的正多边形围成的多面体，体现了数学的对称美。图中是一个棱数为 48 的半正多面体，它的所有顶点都在同一个正方体的表面上，且此正方体的棱长为 1。则该半正多面体共有#fill-placeholder()个面，其棱长为#fill-placeholder()。
    #figure(polyhedron-diagram())],
  answers: ([$26$], [$sqrt(2)-1$]),
  explanation: [#step[数面][
      对应正方体的 6 个面有 6 个正方形，对应 12 条棱有 12 个正方形，对应 8 个顶点有 8 个正三角形，共 $6+12+8=26$ 个面。检验棱数为 $(18 times 4+8 times 3)/2=48$。]
    #step[求棱长][
      设半正多面体的棱长为 $s$，正方体各面中央的正方形距该面的边界为 $u$。由相邻面之间连接棱的等腰直角三角形，$s=sqrt(2)u$；而正方体棱长为 $s+2u=1$。
      所以 $(1+sqrt(2))s=1$，得 $s=sqrt(2)-1$。]],
)

#section[解答题：共 70 分。第 17～21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [如图，长方体 $A B C D-A_1 B_1 C_1 D_1$ 的底面 $A B C D$ 是正方形，点 $E$ 在棱 $A A_1$ 上，$B E perp E C_1$。
    #figure(cuboid-diagram())],
  parts: (
    subquestion(
      stem: [证明：$B E perp$ 平面 $E B_1 C_1$。],
      answers: ([证明见解析。],),
      explanation: [由长方体性质，$B_1 C_1 perp$ 平面 $A B B_1 A_1$，而 $B E$ 在此平面内，所以 $B E perp B_1 C_1$。
        又 $B E perp E C_1$，$B_1 C_1 inter E C_1=C_1$，故 $B E perp$ 平面 $E B_1 C_1$。],
    ),
    subquestion(
      stem: [若 $A E=A_1 E$，求二面角 $B-E C-C_1$ 的正弦值。],
      answers: ([$sqrt(3)/2$],),
      explanation: [#step[由垂直关系确定长宽高之比][
          不妨设 $A B=1$、$A A_1=2h$。以 $A$ 为原点，$A B,A D,A A_1$ 的方向为坐标轴正方向，则 $B(1,0,0)$、$C(1,1,0)$、$C_1(1,1,2h)$、$E(0,0,h)$。
          由 $arrow(B E) dot arrow(E C_1)=(-1,0,h) dot (1,1,h)=-1+h^2=0$，得 $h=1$。]
        #step[计算两个平面法向量的夹角][
          此时平面 $B E C$ 的法向量可取 $bold(u)=(1,0,1)$，平面 $E C C_1$ 的法向量可取 $bold(v)=(1,-1,0)$。
          设所求二面角为 $theta$，则 $|cos theta|=frac(|bold(u) dot bold(v)|, |bold(u)| |bold(v)|)=1/2$，所以 $sin theta=sqrt(3)/2$。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [11 分制乒乓球比赛，每赢一球得 1 分，当某局打成 $10:10$ 平后，每球交换发球权，先多得 2 分的一方获胜，该局比赛结束。甲、乙两位同学进行单打比赛，假设甲发球时甲得分的概率为 0.5，乙发球时甲得分的概率为 0.4，各球的结果相互独立。在某局双方 $10:10$ 平后，甲先发球，两人又打了 $X$ 个球该局比赛结束。],
  parts: (
    subquestion(
      stem: [求 $P(X=2)$。],
      answers: ([$0.5$],),
      explanation: [$X=2$ 表示甲连得两分或乙连得两分，故 $P(X=2)=0.5 times 0.4+0.5 times 0.6=0.5$。],
    ),
    subquestion(
      stem: [求事件“$X=4$ 且甲获胜”的概率。],
      answers: ([$0.1$],),
      explanation: [该事件等价于前两球各得一分、后两球甲连得两分。每两球均为甲先发、乙后发，故所求概率为
        $ (0.5 times 0.6+0.5 times 0.4) times (0.5 times 0.4)=0.1. $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知数列 ${a_n}$ 和 ${b_n}$ 满足 $a_1=1$，$b_1=0$，$4a_(n+1)=3a_n-b_n+4$，$4b_(n+1)=3b_n-a_n-4$。],
  parts: (
    subquestion(
      stem: [证明：${a_n+b_n}$ 是等比数列，${a_n-b_n}$ 是等差数列。],
      answers: ([证明见解析。],),
      explanation: [两递推式相加，得 $a_(n+1)+b_(n+1)=(a_n+b_n)/2$。由 $a_1+b_1=1$，得 ${a_n+b_n}$ 是首项为 1、公比为 $1/2$ 的等比数列。
        两式相减，得 $a_(n+1)-b_(n+1)=a_n-b_n+2$，而 $a_1-b_1=1$，故 ${a_n-b_n}$ 是首项为 1、公差为 2 的等差数列。],
    ),
    subquestion(
      stem: [求 ${a_n}$ 和 ${b_n}$ 的通项公式。],
      answers: ([$a_n=2^(-n)+n-1/2$，$b_n=2^(-n)-n+1/2$。],),
      explanation: [由第（1）问得 $a_n+b_n=2^(1-n)$、$a_n-b_n=2n-1$，两式相加、相减后分别除以 2，得到
        $ a_n=2^(-n)+n-1/2, quad b_n=2^(-n)-n+1/2. $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=ln x-(x+1)/(x-1)$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性，并证明 $f(x)$ 有且仅有两个零点。],
      answers: (
        [在 $(0,1)$ 和 $(1,+infinity)$ 上分别严格递增，各有一个零点。],
      ),
      explanation: [定义域为 $(0,1) union (1,+infinity)$，且
        $ f'(x)=1/x+2/(x-1)^2=(x^2+1)/(x(x-1)^2)>0, $
        所以 $f$ 在两个区间内分别严格递增。又
        $ lim_(x -> 0^+)f(x)=-infinity, quad lim_(x -> 1^-)f(x)=+infinity, $
        $
          lim_(x -> 1^+)f(x)=-infinity, quad lim_(x -> +infinity)f(x)=+infinity.
        $
        由连续性和严格单调性，两个区间各有且只有一个零点，故总共有两个零点。],
    ),
    subquestion(
      stem: [设 $x_0$ 是 $f(x)$ 的一个零点，证明曲线 $y=ln x$ 在点 $A(x_0,ln x_0)$ 处的切线也是曲线 $y=e^x$ 的切线。],
      answers: ([证明见解析。],),
      explanation: [曲线 $y=ln x$ 在 $A$ 处的切线为 $l_1:y=x/x_0+ln x_0-1$。
        在 $y=e^x$ 上取点 $B(-ln x_0,1/x_0)$，该处的切线斜率为 $e^(-ln x_0)=1/x_0$，切线为 $l_2:y=x/x_0+(1+ln x_0)/x_0$。
        因 $f(x_0)=0$，有 $(x_0-1)ln x_0=x_0+1$，即 $ln x_0-1=(1+ln x_0)/x_0$。故 $l_1,l_2$ 重合，结论成立。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知点 $A(-2,0)$、$B(2,0)$，动点 $M(x,y)$ 满足直线 $A M$ 与 $B M$ 的斜率之积为 $-1/2$。记 $M$ 的轨迹为曲线 $C$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程，并说明 $C$ 是什么曲线。],
      answers: (
        [$x^2/4+y^2/2=1$（$x!=plus.minus 2$），为去掉左右顶点的椭圆。],
      ),
      explanation: [由斜率存在且乘积为 $-1/2$，得 $y/(x+2) times y/(x-2)=-1/2$（$x!=plus.minus 2$），化为 $x^2/4+y^2/2=1$。
        因此 $C$ 为中心在原点、焦点在 $x$ 轴上的椭圆去掉左右顶点 $A,B$。],
    ),
    subquestion(
      stem: [过坐标原点的直线交 $C$ 于 $P,Q$ 两点，点 $P$ 在第一象限，$P E perp x$ 轴，垂足为 $E$，连接 $Q E$ 并延长交 $C$ 于点 $G$。],
      parts: (
        subquestion(
          stem: [证明：$triangle P Q G$ 是直角三角形。],
          answers: ([证明见解析。],),
          explanation: [设 $P(p,k p)$，其中 $k>0$、$p=2/sqrt(1+2k^2)$，则 $Q(-p,-k p)$、$E(p,0)$。直线 $Q E$ 为 $y=k/2(x-p)$，代入椭圆得
            $ (k^2+2)x^2-2k^2 p x+k^2 p^2-8=0. $
            一根为 $-p$，故另一交点为 $G((p(3k^2+2))/(k^2+2),(p k^3)/(k^2+2))$。从而
            $ arrow(P G)=(2k p)/(k^2+2)(k,-1), quad arrow(Q P)=2p(1,k). $
            两向量数量积为 0，故 $P G perp P Q$，三角形在 $P$ 处为直角。
            #figure(ellipse-diagram())],
        ),
        subquestion(
          stem: [求 $triangle P Q G$ 面积的最大值。],
          answers: ([$16/9$],),
          explanation: [由（i）得 $|P Q|=2p sqrt(1+k^2)$、$|P G|=(2k p sqrt(1+k^2))/(k^2+2)$，故
            $ S=(2k p^2(1+k^2))/(k^2+2)=(8k(1+k^2))/((1+2k^2)(k^2+2)). $
            令 $t=k+1/k>=2$，则 $S=(8t)/(2t^2+1)$，其对 $t$ 的导数为 $(8(1-2t^2))/(2t^2+1)^2<0$。
            因此在 $t=2$，即 $k=1$ 时取最大值 $S_max=16/9$，此时对应的各点均满足题意。],
        ),
      ),
    ),
  ),
)
#section[选考题：共 10 分。请考生在第 22、23 题中任选一题作答，如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。
    在极坐标系中，$O$ 为极点，点 $M(rho_0,theta_0)$（$rho_0>0$）在曲线 $C:rho=4sin theta$ 上，直线 $l$ 过点 $A(4,0)$ 且与 $O M$ 垂直，垂足为 $P$。],
  parts: (
    subquestion(
      stem: [当 $theta_0=pi/3$ 时，求 $rho_0$ 及 $l$ 的极坐标方程。],
      answers: ([$rho_0=2sqrt(3)$，$l:rho sin(theta+pi/6)=2$。],),
      explanation: [$rho_0=4sin(pi/3)=2sqrt(3)$。$O M$ 与极轴成 $pi/3$ 角，故 $l$ 的直角坐标方程为 $x+sqrt(3)y=4$。代入 $x=rho cos theta$、$y=rho sin theta$，得 $rho sin(theta+pi/6)=2$。],
    ),
    subquestion(
      stem: [当 $M$ 在 $C$ 上运动且 $P$ 在线段 $O M$ 上时，求 $P$ 点轨迹的极坐标方程。],
      answers: ([$rho=4cos theta$，$pi/4<=theta<=pi/2$。],),
      explanation: [取 $theta_0 in (0,pi)$。$A$ 在 $O M$ 方向的投影长度为 $4cos theta_0$。因 $P$ 在线段 $O M$ 上，必须且只需
        $ 0<=4cos theta_0<=rho_0=4sin theta_0, $
        即 $pi/4<=theta_0<=pi/2$。因此轨迹为 $rho=4cos theta$（$pi/4<=theta<=pi/2$）。$theta=pi/4$ 时 $P=M$，$theta=pi/2$ 时 $P=O$，两端点均包含。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。
    已知 $f(x)=|x-a|x+|x-2|(x-a)$。],
  parts: (
    subquestion(
      stem: [当 $a=1$ 时，求不等式 $f(x)<0$ 的解集。],
      answers: ([$(-infinity,1)$],),
      explanation: [当 $a=1$ 时，
        $
          f(x)=cases(-2(x-1)^2 & quad x<1, 2(x-1) & quad 1<=x<2, 2(x-1)^2 & quad x>=2).
        $
        故 $f(x)<0$ 当且仅当 $x<1$，解集为 $(-infinity,1)$。],
    ),
    subquestion(
      stem: [若 $x in (-infinity,1)$ 时，$f(x)<0$，求 $a$ 的取值范围。],
      answers: ([$[1,+infinity)$],),
      explanation: [若 $a<1$，取 $x=a in (-infinity,1)$，则 $f(a)=0$，不符合要求。
        若 $a>=1$，对任意 $x<1$，有 $x<a$ 且 $x<2$，于是 $f(x)=(a-x)x+(2-x)(x-a)=2(a-x)(x-1)<0$。
        因此 $a in [1,+infinity)$。],
    ),
  ),
)
