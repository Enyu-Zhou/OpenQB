#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2021,
  type: "普通高等学校春季招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2021/2021春季上海.pdf",
  regions: ("上海",),
)

#let pyramid-diagram() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  let a = (-2, 0, 0)
  let b = (2, 0, 0)
  let c = (2, 4, 0)
  let d = (-2, 4, 0)
  let e = (0, 0, 0)
  let f = (0, 4, 0)
  let p = (0, 0, 4)
  oblique-project((-0.4, -0.4), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, b, c, d, p)
    line(p, c)
    line(p, f)
    line(b, a, d, stroke: (dash: figure-style.dash))
    line(p, a, c, stroke: (dash: figure-style.dash))
    line(p, e, f, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (p, $P$, "south-east"),
      (a, $A$, "south-west"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (e, $E$, "north-west"),
      (f, $F$, "north-west"),
    ) {
      content(point, label, anchor: anchor, padding: 3pt)
    }
  })
})

#section[填空题：本题共 12 小题，第 1～6 题每小题 4 分，第 7～12 题每小题 5 分，共 54 分。]
#question(
  "fill-in",
  score: 4,
  stem: [等差数列 ${a_n}$ 中，$a_1=3$，$d=2$，则 $a_10=$#fill-placeholder()。],
  answers: ([$21$],),
  explanation: [$a_10=a_1+9d=3+9 times 2=21$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知复数 $z$ 满足 $z=1-3"i"$（$"i"$ 是虚数单位），则 $|overline(z)-"i"|=$#fill-placeholder()。],
  answers: ([$sqrt(5)$],),
  explanation: [$overline(z)-"i"=1+3"i"-"i"=1+2"i"$，∴ $|overline(z)-"i"|=sqrt(1^2+2^2)=sqrt(5)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [不等式 $(2x+5)/(x-2)<1$ 的解集为#fill-placeholder()。],
  answers: ([$(-7,2)$],),
  explanation: [移项通分得 $(x+7)/(x-2)<0$，等价于 $(x+7)(x-2)<0$，∴ $-7<x<2$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知圆柱的底面半径为 $1$，母线长为 $2$，则其侧面积为#fill-placeholder()。],
  answers: ([$4pi$],),
  explanation: [$S=2pi r l=2pi times 1 times 2=4pi$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [直线 $x=-2$ 与直线 $sqrt(3)x-y+1=0$ 的夹角为#fill-placeholder()。],
  answers: ([$pi/6$],),
  explanation: [两直线的倾斜角分别为 $pi/2$、$pi/3$，∴ 夹角为 $pi/2-pi/3=pi/6$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [方程组 $cases(a_1 x+b_1 y=c_1, a_2 x+b_2 y=c_2,)$ 无解，则 $mat(delim: "|", a_1, b_1; a_2, b_2)=$#fill-placeholder()。],
  answers: ([$0$],),
  explanation: [若系数行列式不为 $0$，则该二元一次方程组有唯一解，与无解矛盾。
    ∴ 系数行列式为 $0$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [$(x+1)^n$ 的二项展开式中有且仅有 $x^3$ 的系数为最大值，则 $x^3$ 的系数为#fill-placeholder()。],
  answers: ([$20$],),
  explanation: [由二项式系数的对称性和增减性，唯一最大项在 $n$ 为偶数时出现于中间项。
    ∴ $n/2=3$，$n=6$，所求系数为 $binom(6, 3)=20$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=3^x+a/(3^x+1)$（$a>0$）的最小值为 $5$，则 $a=$#fill-placeholder()。],
  answers: ([$9$],),
  explanation: [令 $t=3^x+1>1$，则 $f(x)=t+a/t-1$。
    若 $0<a<=1$，则 $t+a/t-1$ 在 $t>1$ 上严格递增，不能取得最小值。
    若 $a>1$，由基本不等式，$f(x)>=2sqrt(a)-1$，且在 $t=sqrt(a)>1$ 时取等。
    ∴ $2sqrt(a)-1=5$，解得 $a=9$，此时 $x=log_3 2$ 可取到最小值。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在无穷等比数列 ${a_n}$ 中，$lim_(n arrow infinity)(a_1-a_n)=4$，则 $a_2$ 的取值范围是#fill-placeholder()。],
  answers: ([$(-4,0) union (0,4)$],),
  explanation: [设公比为 $q != 0$。若 $q=1$，则 $a_1-a_n=0$，不符合题意。
    设 $lim_(n arrow infinity)a_n=L$，由 $a_(n+1)=q a_n$ 得 $L=q L$，∴ $L=0$，从而 $a_1=4$。
    ∴ $0<|q|<1$，$a_2=4q in (-4,0) union (0,4)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某人某天需要运动总时长大于等于 $60$ 分钟，现有五项运动可以选择，如下表所示，则共有#fill-placeholder()种运动方式组合。
    #table(
      columns: 5,
      align: center,
      [$A$ 运动], [$B$ 运动], [$C$ 运动], [$D$ 运动], [$E$ 运动],
      [7 点—8 点], [8 点—9 点], [9 点—10 点], [10 点—11 点], [11 点—12 点],
      [30 分钟], [20 分钟], [40 分钟], [30 分钟], [30 分钟],
    )],
  answers: ([$23$],),
  explanation: [只选一项时均不够 $60$ 分钟，选三项及以上时均满足要求。
    选两项共有 $binom(5, 2)=10$ 种，其中 $A B$、$B D$、$B E$ 不满足要求。
    ∴ 共有 $binom(5, 2)-3+binom(5, 3)+binom(5, 4)+binom(5, 5)=23$ 种。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知椭圆 $x^2+y^2/b^2=1$（$0<b<1$）的左、右焦点为 $F_1$、$F_2$，以 $O$ 为顶点、$F_2$ 为焦点作抛物线交椭圆于 $P$，且 $angle P F_1 F_2=45 degree$，则抛物线的准线方程是#fill-placeholder()。],
  answers: ([$x=1-sqrt(2)$],),
  explanation: [设 $F_1=(-c,0)$，$F_2=(c,0)$，则抛物线方程为 $y^2=4c x$。
    由对称性可设 $P$ 在 $x$ 轴上方，此时 $F_1 P:y=x+c$。
    联立得 $(x-c)^2=0$，∴ $P=(c,2c)$，$|P F_1|=2sqrt(2)c$，$|P F_2|=2c$。
    由椭圆定义，$2sqrt(2)c+2c=2$，∴ $c=sqrt(2)-1$，准线为 $x=-c=1-sqrt(2)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $theta>0$，存在实数 $phi$，使得对任意 $n in NN^*$，$cos(n theta+phi)<sqrt(3)/2$，则 $theta$ 的最小值是#fill-placeholder()。],
  answers: ([$2pi/5$],),
  explanation: [#step[排除更小的正数][在单位圆上，禁止落入的闭弧为 $[-pi/6,pi/6]$，弧的角度为 $pi/3$。
      沿固定方向每次转过 $d$，若 $0<d<=pi/3$，连续转动时不可能跨过这段闭弧而始终不落入其中：考察第一次越过其起点的那一步即可。
      当 $0<theta<=pi/3$ 时，直接取 $d=theta$，可知不符合条件。
      当 $pi/3<theta<2pi/5$ 时，令 $d=2pi-5theta$，则 $0<d<pi/3$。
      只考察 $n=5k$ 的各项，$5k theta+phi$ 与 $phi-k d$ 同终边，即每次反向转过 $d$，仍必有一项落入禁止闭弧。]
    #step[验证可以取到][取 $theta=2pi/5$，$phi=pi/5$。所有终边只有五种，其角度为
      $ pi/5,quad 3pi/5,quad pi,quad 7pi/5,quad 9pi/5. $
      对应的余弦均不超过 $cos(pi/5)<cos(pi/6)=sqrt(3)/2$。
      ∴ 最小值为 $2pi/5$。]],
)

#section[选择题：本题共 4 小题，每小题 5 分，共 20 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [下列函数中，在定义域内存在反函数的是#choice-placeholder()。],
  choices: ([$y=x^2$], [$y=sin x$], [$y=2^x$], [$y=1$]),
  answers: ([C],),
  explanation: [$y=2^x$ 在 $RR$ 上严格递增，存在反函数 $y=log_2 x$。其余函数均不能使不同自变量对应不同函数值。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x | x^2-x-2>=0}$，$B={x | x>-1}$，则#choice-placeholder()。],
  choices: (
    [$A subset.eq B$],
    [$complement_RR A subset.eq complement_RR B$],
    [$A inter B=nothing$],
    [$A union B=RR$],
  ),
  answers: ([D],),
  explanation: [$A=(-infinity,-1] union [2,+infinity)$，$B=(-1,+infinity)$。
    ∴ $A union B=RR$，选 D。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $y=f(x)$ 的定义域为 $RR$，下列是 $f(x)$ 无最大值的充分条件的是#choice-placeholder()。],
  choices: (
    [ $f(x)$ 为偶函数且图象关于直线 $x=1$ 对称 ],
    [ $f(x)$ 为偶函数且图象关于点 $(1,1)$ 对称 ],
    [ $f(x)$ 为奇函数且图象关于直线 $x=1$ 对称 ],
    [ $f(x)$ 为奇函数且图象关于点 $(1,1)$ 对称 ],
  ),
  answers: ([D],),
  explanation: [D 中由奇函数及中心对称性得 $f(2-x)+f(x)=2$，$f(-x)=-f(x)$，故 $f(x+2)=f(x)+2$。
    又 $f(0)=0$，∴ $f(2n)=2n$ 无上界，函数无最大值。
    A、C 均可取反例 $f(x)=0$，B 可取反例 $f(x)=1$，∴ 其余条件均不充分。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在 $triangle A B C$ 中，$D$ 为 $B C$ 中点，$E$ 为 $A D$ 中点。对于以下结论：
    ① 存在 $triangle A B C$，使得 $arrow(A B) dot arrow(C E)=0$；
    ② 存在 $triangle A B C$，使得 $arrow(C E) parallel (arrow(C B)+arrow(C A))$。
    下列判断正确的是#choice-placeholder()。],
  choices: (
    [①成立，②成立],
    [①成立，②不成立],
    [①不成立，②成立],
    [①不成立，②不成立],
  ),
  answers: ([B],),
  explanation: [#step[结论①][取 $A=(0,sqrt(2))$，$B=(-1,0)$，$C=(1,0)$，则 $D=(0,0)$，$E=(0,sqrt(2)/2)$。
      $arrow(A B)=(-1,-sqrt(2))$，$arrow(C E)=(-1,sqrt(2)/2)$，两向量数量积为 $0$，∴ ①成立。]
    #step[结论②][取 $C$ 为起点，以 $arrow(C A)=bold(u)$、$arrow(C B)=bold(v)$ 为基底，则
      $ arrow(C E)=1/2 bold(u)+1/4 bold(v). $
      若它与 $bold(u)+bold(v)$ 平行，则两系数须相等，与 $1/2 != 1/4$ 矛盾，∴ ②不成立。]],
)

#section[解答题：本题共 5 小题，共 76 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [四棱锥 $P-A B C D$ 的底面为正方形 $A B C D$，边长为 $4$，$E$ 为 $A B$ 中点，$P E perp$ 平面 $A B C D$。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [若 $triangle P A B$ 为等边三角形，求四棱锥 $P-A B C D$ 的体积。],
      answers: ([$32sqrt(3)/3$],),
      explanation: [$P E=sqrt(4^2-2^2)=2sqrt(3)$，∴ $V_(P-A B C D)=1/3 times 4^2 times 2sqrt(3)=32sqrt(3)/3$。],
    ),
    subquestion(
      stem: [若 $C D$ 的中点为 $F$，$P F$ 与平面 $A B C D$ 所成角为 $45 degree$，求 $P D$ 与 $A C$ 所成角的大小。],
      answers: ([$arccos(sqrt(2)/6)$],),
      explanation: [∵ $P E perp$ 平面 $A B C D$，∴ $angle P F E=45 degree$，从而 $P E=E F=4$。
        以 $E$ 为原点，分别沿 $E B$、$E F$、$E P$ 建立空间直角坐标系，则
        $ A=(-2,0,0),quad C=(2,4,0),quad D=(-2,4,0),quad P=(0,0,4). $
        于是 $arrow(P D)=(-2,4,-4)$，$arrow(A C)=(4,4,0)$。
        设两直线所成角为 $alpha$，则
        $
          cos alpha=(|arrow(P D) dot arrow(A C)|)/(|arrow(P D)| |arrow(A C)|)=8/(6 times 4sqrt(2))=sqrt(2)/6.
        $
        ∴ $alpha=arccos(sqrt(2)/6)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知 $A$、$B$、$C$ 为 $triangle A B C$ 的三个内角，$a$、$b$、$c$ 是其对应边长，$a=2$，$cos C=-1/4$。],
  parts: (
    subquestion(
      stem: [若 $sin A=2sin B$，求 $b$、$c$。],
      answers: ([$b=1$，$c=sqrt(6)$。],),
      explanation: [由正弦定理得 $a=2b$，∴ $b=1$。
        由余弦定理得 $c^2=a^2+b^2-2a b cos C=4+1+1=6$，∴ $c=sqrt(6)$。],
    ),
    subquestion(
      stem: [若 $cos(A-pi/4)=4/5$，求 $c$。],
      answers: ([$5sqrt(30)/2$],),
      explanation: [∵ $cos C=-1/4$，∴ $C>pi/2$，$sin C=sqrt(15)/4$，且 $0<A<pi-C<pi/2$。
        由 $cos(A-pi/4)=4/5$ 得 $sin A+cos A=4sqrt(2)/5$。
        结合 $sin^2 A+cos^2 A=1$，得 $sin A=sqrt(2)/10$ 或 $7sqrt(2)/10$。
        ∵ $sin A<sin(pi-C)=sqrt(15)/4<7sqrt(2)/10$，∴ $sin A=sqrt(2)/10$。
        由正弦定理，$c=frac(a sin C, sin A)=5sqrt(30)/2$。],
    ),
  ),
)
#question("solution", score: 14, parts: (
  subquestion(
    stem: [团队在 $O$ 点西侧、东侧 $20$ 千米处设有 $A$、$B$ 两站点，测量距离发现一点 $P$ 满足 $|P A|-|P B|=20$ 千米，可知 $P$ 在以 $A$、$B$ 为焦点的双曲线上。以 $O$ 点为原点，东侧为 $x$ 轴正半轴，北侧为 $y$ 轴正半轴，建立平面直角坐标系。$P$ 在北偏东 $60 degree$ 处，求双曲线标准方程和 $P$ 点坐标。],
    answers: (
      [$x^2/100-y^2/300=1$，$P=(15sqrt(2)/2,5sqrt(6)/2)$（单位：千米）。],
    ),
    explanation: [由题意，$c=20$，$2a=20$，∴ $a=10$，$b^2=c^2-a^2=300$。
      双曲线标准方程为 $x^2/100-y^2/300=1$，且 $P$ 在右支。
      由北偏东 $60 degree$ 知 $P$ 满足 $y=x/sqrt(3)$，$x>0$。联立得
      $ P=(15sqrt(2)/2,5sqrt(6)/2). $],
  ),
  subquestion(
    stem: [团队又在 $O$ 点南侧、北侧 $15$ 千米处设有 $C$、$D$ 两站点，测量距离发现 $|Q A|-|Q B|=30$ 千米，$|Q C|-|Q D|=10$ 千米。求 $|O Q|$（精确到 $1$ 米）和 $Q$ 点位置（精确到 $1$ 米、$1 degree$）。],
    answers: (
      [$|O Q| approx 19.227$ 千米；$Q$ 位于 $O$ 点北偏东约 $66 degree$、距离约 $19227$ 米处，坐标约为 $(17.504,7.956)$（单位：千米）。],
    ),
    explanation: [由两个距离差，$Q(x,y)$ 满足
      $ cases(x^2/225-y^2/175=1 & quad x>0, y^2/25-x^2/200=1 & quad y>0,). $
      解得 $x^2=14400/47$，$y^2=2975/47$。
      ∴ $Q=(sqrt(14400/47),sqrt(2975/47)) approx (17.504,7.956)$，
      $|O Q|=sqrt(17375/47) approx 19.227$（千米）。
      设北偏东的角度为 $alpha$，则 $tan alpha=x/y=sqrt(14400/2975)$，∴ $alpha approx 66 degree$。],
  ),
))
#question(
  "solution",
  score: 16,
  stem: [已知函数 $f(x)=sqrt(|x+a|-a)-x$。],
  parts: (
    subquestion(
      stem: [若 $a=1$，求函数的定义域。],
      answers: ([$(-infinity,-2] union [0,+infinity)$],),
      explanation: [根式有意义等价于 $|x+1|-1>=0$，解得 $x<=-2$ 或 $x>=0$。],
    ),
    subquestion(
      stem: [若 $a != 0$，且 $f(a x)=a$ 有 $2$ 个不同实数根，求 $a$ 的取值范围。],
      answers: ([$(0,1/4)$],),
      explanation: [原方程等价于 $sqrt(|a x+a|-a)=a x+a$。令 $t=a x+a$，因 $a != 0$，$x$ 与 $t$ 一一对应。
        于是 $t>=0$，平方得 $t-a=t^2$，即 $a=t-t^2$。
        $t-t^2$ 在 $[0,1/2]$ 上递增，在 $[1/2,+infinity)$ 上递减，最大值为 $1/4$。
        与水平线 $y=a$ 有两个非负交点当且仅当 $0<=a<1/4$。又 $a != 0$，∴ $0<a<1/4$。],
    ),
    subquestion(
      stem: [是否存在实数 $a$，使得函数 $f(x)$ 在定义域内具有单调性？若存在，求出 $a$ 的取值范围。],
      answers: ([存在，$a in (-infinity,-1/4]$。],),
      explanation: [#step[必要性][在 $x>=max(0, -a)$ 上，$f(x)=sqrt(x)-x$。该函数在充分大的 $x$ 处严格递减，故 $f$ 不可能在整个定义域上递增。
          若 $a>-1/4$，则 $max(0, -a)<1/4$，而 $sqrt(x)-x$ 在 $(max(0, -a),1/4)$ 上严格递增，故也不可能全域递减。
          ∴ 必须 $a<=-1/4$。]
        #step[充分性][若 $a<=-1/4$，则定义域为 $RR$，且
          $ f(x)=cases(sqrt(-x-2a)-x & quad x< -a, sqrt(x)-x & quad x>=-a,). $
          左段中根式与 $-x$ 均随 $x$ 增大而严格减小；右段因 $x>=-a>=1/4$，也严格递减。
          两段在 $x=-a$ 处连续衔接，∴ $f$ 在 $RR$ 上严格递减。]
        综上，所求范围为 $(-infinity,-1/4]$。],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知数列 ${a_n}$ 满足 $a_n>=0$，对任意 $n>=2$，$a_n$ 和 $a_(n+1)$ 中存在一项，使其为另一项与 $a_(n-1)$ 的等差中项。],
  parts: (
    subquestion(
      stem: [已知 $a_1=5$，$a_2=3$，$a_4=2$，求 $a_3$ 的所有可能取值。],
      answers: ([$a_3=1$],),
      explanation: [条件等价于 $2a_n=a_(n-1)+a_(n+1)$ 或 $2a_(n+1)=a_(n-1)+a_n$。
        令 $n=2$，得 $a_3=1$ 或 $4$。
        当 $a_3=1$ 时，$2a_4=a_2+a_3$ 成立；当 $a_3=4$ 时，$2a_3 != a_2+a_4$ 且 $2a_4 != a_2+a_3$，不成立。
        ∴ $a_3=1$，此时令后续各项保持公差 $1$ 即可延续为符合条件的非负数列。],
    ),
    subquestion(
      stem: [已知 $a_1=a_4=a_7=0$，$a_2$、$a_5$、$a_8$ 为正数，求证：$a_2$、$a_5$、$a_8$ 成等比数列，并求出公比 $q$。],
      answers: ([证明见解析，$q=1/4$。],),
      explanation: [由 $a_1=0$ 得 $a_3=2a_2$ 或 $a_2/2$。再结合 $a_4=0$，条件只能是 $2a_3=a_2$，∴ $a_3=a_2/2$。
        在 $n=4$ 时，由非负性和 $a_3>0$，只能有 $2a_5=a_3$，∴ $a_5=a_2/4$。
        同理，由 $a_4=a_7=0$ 得 $a_6=a_5/2$、$a_8=a_5/4$。
        ∴ $a_5/a_2=a_8/a_5=1/4$，三数成等比数列，公比为 $1/4$。],
    ),
    subquestion(
      stem: [已知数列中恰有 $3$ 项为 $0$，即 $a_r=a_s=a_t=0$，$2<r<s<t$，且 $a_1=1$，$a_2=2$，求 $a_(r+1)+a_(s+1)+a_(t+1)$ 的最大值。],
      answers: ([$21/64$],),
      explanation: [#step[用相邻差控制零项后的大小][令 $d_n=a_(n+1)-a_n$，由条件得
          $ d_n=d_(n-1) quad "或" quad d_n=-1/2 d_(n-1) quad (n>=2). $
          ∵ $d_1=1$，∴ 所有 $d_n$ 均非零，其绝对值只会不变或减半。
          若 $a_j=0$，由非负性及相邻差非零，$a_(j-1)>0$，$a_(j+1)>0$，故 $d_(j-1)<0<d_j$。
          必有 $d_j=-d_(j-1)/2$，且 $a_(j+1)=d_j$。
          从 $d_1>0$ 到 $d_(r-1)<0$ 至少发生一次变号，绝对值至少减半；再到 $d_r$ 又减半，故 $a_(r+1)=d_r<=1/4$。
          从 $d_r>0$ 到 $d_(s-1)<0$ 再到 $d_s>0$，至少又变号两次，∴ $a_(s+1)=d_s<=d_r/4<=1/16$。
          同理 $a_(t+1)<=1/64$，于是总和不超过 $1/4+1/16+1/64=21/64$。]
        #step[构造取到上界的数列][取前 $12$ 项为
          $ 1,2,3/2,1,1/2,0,1/4,1/8,0,1/16,1/32,0, $
          并令 $a_n=(n-12)/64$（$n>=12$）。相邻差的每一步均为保持不变或乘以 $-1/2$，故满足题设。
          数列恰在 $r=6$、$s=9$、$t=12$ 处为 $0$，且 $a_7+a_10+a_13=1/4+1/16+1/64=21/64$。
          ∴ 最大值为 $21/64$。]],
    ),
  ),
)
