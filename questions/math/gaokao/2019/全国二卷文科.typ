#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019全国2文(甘肃,青海,内蒙古,黑龙江,吉林,辽宁,海南.宁夏,新疆,陕西,重庆).pdf",
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


#section[选择题：本题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x|x>-1}$，$B={x|x<2}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([$(-1,+infinity)$], [$(-infinity,2)$], [$(-1,2)$], [$nothing$]),
  answers: ([C],),
  explanation: [同时满足 $x>-1$ 和 $x<2$，得 $A inter B=(-1,2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $z="i"(2+"i")$，则 $overline(z)=$#choice-placeholder()。],
  choices: ([$1+2"i"$], [$-1+2"i"$], [$1-2"i"$], [$-1-2"i"$]),
  answers: ([D],),
  explanation: [$z=2"i"+"i"^2=-1+2"i"$，故共轭复数 $overline(z)=-1-2"i"$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知向量 $bold(a)=(2,3)$，$bold(b)=(3,2)$，则 $|bold(a)-bold(b)|=$#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$2$], [$5sqrt(2)$], [$50$]),
  answers: ([A],),
  explanation: [$bold(a)-bold(b)=(-1,1)$，故 $|bold(a)-bold(b)|=sqrt((-1)^2+1^2)=sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [生物实验室有 5 只兔子，其中只有 3 只测量过某项指标。若从这 5 只兔子中随机取出 3 只，则恰有 2 只测量过该指标的概率为#choice-placeholder()。],
  choices: ([$2/3$], [$3/5$], [$2/5$], [$1/5$]),
  answers: ([B],),
  explanation: [取出 3 只等价于留下 2 只，共有 $5 times 4/2=10$ 种等可能的留法。恰有 2 只测量过，等价于留下的两只一只测量过、一只未测量过，有 $3 times 2=6$ 种，故概率为 $6/10=3/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在“一带一路”知识测验后，甲、乙、丙三人对成绩进行预测。
    #linebreak()甲：我的成绩比乙高。
    #linebreak()乙：丙的成绩比我和甲的都高。
    #linebreak()丙：我的成绩比乙高。
    #linebreak()成绩公布后，三人成绩互不相同且只有一个人预测正确，那么三人按成绩由高到低的次序为#choice-placeholder()。],
  choices: ([甲、乙、丙], [乙、甲、丙], [丙、乙、甲], [甲、丙、乙]),
  answers: ([A],),
  explanation: [若乙正确，则丙也正确，矛盾；故乙错误。若丙正确，则甲错误，成绩满足丙高于乙、乙高于甲，从而乙也正确，仍矛盾。因此只有甲正确，丙低于乙，次序为甲、乙、丙。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $f(x)$ 为奇函数，且当 $x>=0$ 时，$f(x)=e^x-1$，则当 $x<0$ 时，$f(x)=$#choice-placeholder()。],
  choices: ([$e^(-x)-1$], [$e^(-x)+1$], [$-e^(-x)-1$], [$-e^(-x)+1$]),
  answers: ([D],),
  explanation: [当 $x<0$ 时，$-x>0$，由奇性得 $f(x)=-f(-x)=-(e^(-x)-1)=-e^(-x)+1$。],
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
  stem: [若 $x_1=pi/4$，$x_2=3pi/4$ 是函数 $f(x)=sin omega x$（$omega>0$）两个相邻的极值点，则 $omega=$#choice-placeholder()。],
  choices: ([$2$], [$3/2$], [$1$], [$1/2$]),
  answers: ([A],),
  explanation: [相邻极值点相距半个周期，故 $pi/omega=x_2-x_1=pi/2$，得 $omega=2$。],
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
  stem: [曲线 $y=2sin x+cos x$ 在点 $(pi,-1)$ 处的切线方程为#choice-placeholder()。],
  choices: ([$x-y-pi-1=0$], [$2x-y-2pi-1=0$], [$2x+y-2pi+1=0$], [$x+y-pi+1=0$]),
  answers: ([C],),
  explanation: [由 $y'=2cos x-sin x$，得切线斜率为 $-2$。故切线方程为 $y+1=-2(x-pi)$，即 $2x+y-2pi+1=0$。],
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

#section[填空题：本题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [若变量 $x,y$ 满足约束条件 $cases(2x+3y-6>=0, x+y-3<=0, y-2<=0)$，则 $z=3x-y$ 的最大值是#fill-placeholder()。],
  answers: ([$9$],),
  explanation: [前两个约束给出 $3-3y/2<=x<=3-y$，从而 $y>=0$。因此 $z=3x-y<=3(3-y)-y=9-4y<=9$。点 $(3,0)$ 满足全部约束，并使 $z=9$，故最大值为 9。],
)
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
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$。已知 $b sin A+a cos B=0$，则 $B=$#fill-placeholder()。],
  answers: ([$3pi/4$],),
  explanation: [由正弦定理 $b sin A=a sin B$，得 $sin B+cos B=0$。∵ $0<B<pi$，∴ $B=3pi/4$。],
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
      stem: [若 $A E=A_1 E$，$A B=3$，求四棱锥 $E-B B_1 C_1 C$ 的体积。],
      answers: ([$18$],),
      explanation: [由第（1）问知 $B E perp E B_1$。∵ $A E=A_1 E$，∴ $E B=E B_1$，即 $triangle B E B_1$ 为等腰直角三角形。
        设 $A E=h$，则 $B B_1=2h$、$E B^2=h^2+9$。由勾股定理，$2(h^2+9)=4h^2$，得 $h=3$，故 $B B_1=6$。
        取 $B B_1$ 中点 $F$，则 $E F parallel A B$，$E F=3$。由 $A B perp$ 平面 $B B_1 C_1 C$，得四棱锥的高为 3，底面积为 $3 times 6=18$。
        故 $V=1/3 times 18 times 3=18$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知 ${a_n}$ 是各项均为正数的等比数列，$a_1=2$，$a_3=2a_2+16$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=2^(2n-1)$。],),
      explanation: [设公比为 $q>0$，由题意得 $2q^2=4q+16$，即 $(q-4)(q+2)=0$。舍去负根，得 $q=4$，因此 $a_n=2 times 4^(n-1)=2^(2n-1)$。],
    ),
    subquestion(
      stem: [设 $b_n=log_2 a_n$，求数列 ${b_n}$ 的前 $n$ 项和。],
      answers: ([$n^2$。],),
      explanation: [$b_n=2n-1$，是首项为 1、公差为 2 的等差数列。故前 $n$ 项和为 $S_n=n(1+2n-1)/2=n^2$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某行业主管部门为了解本行业中小企业的生产情况，随机调查了 100 个企业，得到这些企业第一季度相对于前一年第一季度产值增长率 $y$ 的频数分布表。
    #table(
      columns: 6,
      align: center,
      [$y$ 的分组],
      [$[-0.20,0)$],
      [$[0,0.20)$],
      [$[0.20,0.40)$],
      [$[0.40,0.60)$],
      [$[0.60,0.80)$],

      [企业数], [2], [24], [53], [14], [7],
    )
    附：$sqrt(74) approx 8.602$。],
  parts: (
    subquestion(
      stem: [分别估计这类企业中产值增长率不低于 40% 的企业比例、产值负增长的企业比例。],
      answers: ([$0.21$，$0.02$。],),
      explanation: [产值增长率不低于 40% 的企业有 $14+7=21$ 个，比例估计为 $21/100=0.21$；产值负增长的企业有 2 个，比例估计为 $2/100=0.02$。],
    ),
    subquestion(
      stem: [求这类企业产值增长率的平均数与标准差的估计值（同一组中的数据用该组区间的中点值为代表）。（精确到 0.01）],
      answers: ([平均数为 $0.30$，标准差为 $0.17$。],),
      explanation: [各组中点为 $-0.1,0.1,0.3,0.5,0.7$，故平均数的估计值为
        $
          overline(y)=(2 times (-0.1)+24 times 0.1+53 times 0.3+14 times 0.5+7 times 0.7)/100=0.30.
        $
        方差的估计值为
        $
          s^2=(2 times 0.4^2+24 times 0.2^2+53 times 0^2+14 times 0.2^2+7 times 0.4^2)/100=0.0296.
        $
        因此标准差的估计值为 $s=0.02sqrt(74) approx 0.17$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知 $F_1,F_2$ 是椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的两个焦点，$P$ 为 $C$ 上一点，$O$ 为坐标原点。],
  parts: (
    subquestion(
      stem: [若 $triangle P O F_2$ 为等边三角形，求 $C$ 的离心率。],
      answers: ([$sqrt(3)-1$。],),
      explanation: [设半焦距为 $c$。由等边三角形知 $O P=P F_2=c$，$angle P O F_1=120 degree$。由余弦定理得 $P F_1=sqrt(3)c$。
        由椭圆定义，$2a=P F_1+P F_2=(sqrt(3)+1)c$，故 $e=c/a=2/(sqrt(3)+1)=sqrt(3)-1$。],
    ),
    subquestion(
      stem: [如果存在点 $P$，使得 $P F_1 perp P F_2$，且 $triangle F_1 P F_2$ 的面积等于 16，求 $b$ 的值和 $a$ 的取值范围。],
      answers: ([$b=4$，$a in [4sqrt(2),+infinity)$。],),
      explanation: [#step[由面积确定短半轴][
          记 $P F_1=u$、$P F_2=v$，则 $u+v=2a$、$u^2+v^2=4c^2$，所以 $2u v=4(a^2-c^2)=4b^2$。
          因而 $S=1/2 u v=b^2=16$，得 $b=4$。]
        #step[确定直角顶点存在的条件][
          $P F_1 perp P F_2$ 等价于 $P$ 在以 $F_1 F_2$ 为直径的圆上，即 $O P=c$。椭圆上点到原点的距离连续地取遍 $[b,a]$，且 $c<a$，故存在这样的 $P$ 当且仅当 $c>=b$。
          代入 $b=4$、$c^2=a^2-16$，得 $a>=4sqrt(2)$。反之，这一范围保证圆与椭圆相交，交点所成直角三角形的面积为 $b^2=16$，故所求范围为 $[4sqrt(2),+infinity)$。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=(x-1)ln x-x-1$。证明：],
  parts: (
    subquestion(
      stem: [$f(x)$ 存在唯一的极值点。],
      answers: ([证明见解析。],),
      explanation: [定义域为 $(0,+infinity)$。求导得 $f'(x)=ln x-1/x$，且 $f''(x)=1/x+1/x^2>0$，所以 $f'$ 严格递增。
        又 $f'(1)=-1<0$、$f'(e)=1-1/e>0$，故存在唯一 $x_0 in (1,e)$ 使 $f'(x_0)=0$。
        因此 $f$ 在 $(0,x_0)$ 上严格递减，在 $(x_0,+infinity)$ 上严格递增，$x_0$ 是唯一的极值点。],
    ),
    subquestion(
      stem: [$f(x)=0$ 有且仅有两个实根，且两个实根互为倒数。],
      answers: ([证明见解析。],),
      explanation: [#step[证明恰有两个根][
          由第（1）问的单调性，每个单调区间至多有一个零点。又 $f(1)=-2<0$，$f(e^(-2))=1-3e^(-2)>0$，$f(e^2)=e^2-3>0$，故分别在 $(e^(-2),1)$、$(x_0,e^2)$ 内各有一个零点，总共恰有两个。]
        #step[证明互为倒数][
          对任意 $x>0$，有 $f(1/x)=((x-1)ln x-x-1)/x=f(x)/x$。故若 $x_1$ 为一根，则 $1/x_1$ 也为根。
          ∵ $f(1)!=0$，∴ 两根不相同，必互为倒数。]],
    ),
  ),
)

请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。

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
