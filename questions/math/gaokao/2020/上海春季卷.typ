#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2020,
  type: "普通高等学校春季招生统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/春季高考/2020/2020春季上海.pdf",
  regions: ("上海",),
)

#let pyramid-diagram() = cetz.canvas(length: 11mm, {
  import cetz.draw: *
  let d = (0, 0, 0)
  let a = (0, 3, 0)
  let b = (3, 3, 0)
  let c = (3, 0, 0)
  let p = (0, 0, 3)
  oblique-project((1, 0), (-0.35, -0.32), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, a, b, c, p)
    line(p, b)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(p, d, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (p, $P$, "south"),
      (a, $A$, "east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
    ) {
      content(point, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let distance-diagram() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: move(dx: -5pt)[$O$],
    tick: (stroke: figure-style.thickness),
  ))
  plot.plot(
    size: (8, 4),
    axis-style: "school-book",
    x-min: 0,
    x-max: 132,
    y-min: 0,
    y-max: 70,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: (60, 90, 120),
    y-ticks: (60,),
    {
      plot.add(((0, 60), (60, 0), (90, 30), (120, 0)), style: (
        stroke: (paint: black, thickness: figure-style.thickness),
      ))
      plot.annotate({
        line((90, 0), (90, 30), stroke: (
          thickness: figure-style.thickness,
          dash: figure-style.dash,
        ))
        content((38, 48), $y=f_60(x)$, anchor: "south-west", padding: 2pt)
      })
    },
  )
})

#section[填空题：本题共 12 小题，第 1～6 题每小题 4 分，第 7～12 题每小题 5 分，共 54 分。]
#question(
  "fill-in",
  score: 4,
  stem: [集合 $A={1,3}$，$B={1,2,a}$，若 $A subset.eq B$，则 $a=$#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [∵ $3 in A$，$A subset.eq B$，∴ $3 in B$，故 $a=3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [不等式 $1/x>3$ 的解集为#fill-placeholder()。],
  answers: ([$(0,1/3)$],),
  explanation: [∵ $1/x>3>0$，∴ $x>0$。两边乘以 $x$，得 $1>3x$，故 $0<x<1/3$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [函数 $y=tan 2x$ 的最小正周期为#fill-placeholder()。],
  answers: ([$pi/2$],),
  explanation: [正切函数的最小正周期为 $pi$，故 $T=pi/2$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知复数 $z$ 满足 $z+2overline(z)=6+"i"$，则 $z$ 的实部为#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [设 $z=u+v"i"$（$u,v in RR$），则 $3u-v"i"=6+"i"$，故 $u=2$，$v=-1$，实部为 $2$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知 $3sin 2x=2sin x$，$x in (0,pi)$，则 $x=$#fill-placeholder()。],
  answers: ([$arccos(1/3)$],),
  explanation: [由二倍角公式得 $6sin x cos x=2sin x$。∵ $sin x>0$，∴ $cos x=1/3$，故 $x=arccos(1/3)$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [若函数 $y=a dot 3^x+1/3^x$ 为偶函数，则 $a=$#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [由 $f(x)=f(-x)$ 得 $(a-1)(3^x-3^(-x))=0$ 对任意实数 $x$ 成立，故 $a=1$。此时 $f(x)=3^x+3^(-x)$ 确为偶函数。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知直线 $l_1:x+a y=1$，$l_2:a x+y=1$，若 $l_1 parallel l_2$，则 $l_1$ 与 $l_2$ 的距离为#fill-placeholder()。],
  answers: ([$sqrt(2)$],),
  explanation: [平行要求 $a^2=1$。当 $a=1$ 时两直线重合，故 $a=-1$。
    两直线分别为 $x-y-1=0$、$x-y+1=0$，距离为 $2/sqrt(1^2+(-1)^2)=sqrt(2)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知二项式 $(2x+sqrt(x))^5$，则展开式中 $x^3$ 的系数为#fill-placeholder()。],
  answers: ([$10$],),
  explanation: [通项为 $T_(k+1)=binom(5, k) 2^(5-k) x^(5-k/2)$。令 $5-k/2=3$，得 $k=4$，所求系数为 $binom(5, 4) times 2=10$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [三角形 $A B C$ 中，$D$ 是 $B C$ 中点，$A B=2$，$B C=3$，$A C=4$，则 $arrow(A D) dot arrow(A B)=$#fill-placeholder()。],
  answers: ([$19/4$],),
  explanation: [由余弦定理，$arrow(A B) dot arrow(A C)=((A B)^2+(A C)^2-(B C)^2)/2=11/2$。
    ∵ $arrow(A D)=1/2(arrow(A B)+arrow(A C))$，∴ $arrow(A D) dot arrow(A B)=1/2(4+11/2)=19/4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $A={-3,-2,-1,0,1,2,3}$，$a,b in A$，则 $|a|<|b|$ 的情况有#fill-placeholder()种。],
  answers: ([$18$],),
  explanation: [按 $|b|=1,2,3$ 分类，相应的 $b$ 各有 $2$ 个，而 $a$ 分别有 $1,3,5$ 个。
    ∴ 共有 $2 times (1+3+5)=18$ 种。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $A_1$、$A_2$、$A_3$、$A_4$、$A_5$ 五个点，满足 $arrow(A_n A_(n+1)) dot arrow(A_(n+1) A_(n+2))=0$（$n=1,2,3$），$|arrow(A_n A_(n+1))| dot |arrow(A_(n+1) A_(n+2))|=n+1$（$n=1,2,3$），则 $|arrow(A_1 A_5)|$ 的最小值为#fill-placeholder()。],
  answers: ([$sqrt(6)/3$],),
  explanation: [#step[表示各段长度][设 $|A_1 A_2|=u>0$，则 $|A_2 A_3|=2/u$，$|A_3 A_4|=3u/2$，$|A_4 A_5|=8/(3u)$。
      相邻两段垂直，故沿两条互相垂直的方向，两组线段的合位移长度分别至少为 $u/2$、$2/(3u)$；两组均反向时取等。]
    #step[求最小值][$
        |A_1 A_5|^2 >= u^2/4+4/(9u^2) >= 2sqrt(u^2/4 times 4/(9u^2))=2/3.
      $
      取 $u=2sqrt(3)/3$，并令 $A_1=(0,0)$、$A_2=(u,0)$、$A_3=(u,2/u)$、$A_4=(-u/2,2/u)$、$A_5=(-u/2,-2/(3u))$，即可同时取等。
      ∴ 最小值为 $sqrt(6)/3$。]],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $f(x)=sqrt(x-1)$，其反函数为 $f^(-1)(x)$，若 $f^(-1)(x)-a=f(x+a)$ 有实数根，则 $a$ 的取值范围为#fill-placeholder()。],
  answers: ([$[3/4,+infinity)$],),
  explanation: [∵ $f^(-1)(x)=x^2+1$（$x>=0$），令 $y=sqrt(x+a-1)>=0$，则原方程给出 $y=x^2+1-a$。
    两式消去 $a$，得 $x^2+x=y^2+y$，即 $(x-y)(x+y+1)=0$。∵ $x,y>=0$，∴ $x=y$。
    故原方程有解等价于存在 $x>=0$，使 $a=x^2-x+1=(x-1/2)^2+3/4$。
    ∴ $a in [3/4,+infinity)$，此时取 $x=(1+sqrt(4a-3))/2$ 即可验证。],
)

#section[选择题：本题共 4 小题，每小题 5 分，共 20 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [计算：$lim_(n -> infinity) (3^n+5^n)/(3^(n-1)+5^(n-1))=$#choice-placeholder()。],
  choices: ([$3$], [$5/3$], [$3/5$], [$5$]),
  answers: ([D],),
  explanation: [分子、分母同除以 $5^(n-1)$，得 $lim_(n -> infinity) (3(3/5)^(n-1)+5)/((3/5)^(n-1)+1)=5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [“$alpha=beta$”是“$sin^2 alpha+cos^2 beta=1$”的#choice-placeholder()。],
  choices: (
    [充分非必要条件],
    [必要非充分条件],
    [充要条件],
    [既非充分又非必要条件],
  ),
  answers: ([A],),
  explanation: [若 $alpha=beta$，则由 $sin^2 alpha+cos^2 alpha=1$ 得充分性。
    反之，取 $alpha=0$、$beta=pi$，仍有 $sin^2 alpha+cos^2 beta=1$，但 $alpha != beta$，故不必要。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知椭圆 $x^2/2+y^2=1$，作垂直于 $x$ 轴的垂线交椭圆于 $A$、$B$ 两点，作垂直于 $y$ 轴的垂线交椭圆于 $C$、$D$ 两点，且 $A B=C D$，两垂线相交于点 $P$，则点 $P$ 的轨迹是#choice-placeholder()。],
  choices: ([椭圆], [双曲线], [圆], [抛物线]),
  answers: ([B],),
  explanation: [设 $P=(h,k)$，则 $A B=2sqrt(1-h^2/2)$，$C D=2sqrt(2-2k^2)$。
    由 $A B=C D$ 得 $2k^2-h^2/2=1$，故轨迹位于双曲线上，选 B。
    因两条直线均须交椭圆于两个不同的点，实际轨迹为该双曲线上 $|h|<sqrt(2)$ 的部分。],
)
#question(
  "single-choice",
  score: 5,
  stem: [数列 ${a_n}$ 各项均为实数，对任意 $n in NN^*$ 满足 $a_(n+3)=a_n$，且行列式 $mat(delim: "|", a_n, a_(n+1); a_(n+2), a_(n+3))=c$ 为定值，则下列选项中不可能的是#choice-placeholder()。],
  choices: (
    [$a_1=1$，$c=1$],
    [$a_1=2$，$c=2$],
    [$a_1=-1$，$c=4$],
    [$a_1=2$，$c=0$],
  ),
  answers: ([B],),
  explanation: [设前三项为 $u,v,w$，则 $u^2-v w=v^2-w u=w^2-u v=c$。
    两两作差得 $(u-v)(u+v+w)=(v-w)(u+v+w)=(w-u)(u+v+w)=0$。
    若 $u+v+w != 0$，则 $u=v=w$，$c=0$；否则 $v+w=-u$，故
    $ c=u^2-v w >= u^2-(v+w)^2/4=3u^2/4. $
    B 中 $u=2$、$c=2$，既不满足 $c=0$，也不满足 $c>=3$，故不可能。
    A、C、D 分别可取周期块 $(1,0,-1)$、$(-1,(1+sqrt(13))/2,(1-sqrt(13))/2)$、$(2,2,2)$。],
)

#section[解答题：本题共 5 小题，共 76 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [已知四棱锥 $P-A B C D$，底面 $A B C D$ 为正方形，边长为 $3$，$P D perp$ 平面 $A B C D$。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [若 $P C=5$，求四棱锥 $P-A B C D$ 的体积。],
      answers: ([$12$],),
      explanation: [∵ $P D perp D C$，∴ $P D=sqrt((P C)^2-(D C)^2)=sqrt(25-9)=4$。
        故 $V_(P-A B C D)=1/3 times 3^2 times 4=12$。],
    ),
    subquestion(
      stem: [若直线 $A D$ 与 $B P$ 的夹角为 $60 degree$，求 $P D$ 的长。],
      answers: ([$3sqrt(2)$],),
      explanation: [∵ $B C perp P D$、$B C perp C D$，∴ $B C perp$ 平面 $P C D$，故 $B C perp P C$。
        又 $A D parallel B C$，且 $angle P B C$ 为锐角，∴ $angle P B C=60 degree$。
        在直角三角形 $P B C$ 中，$P C=B C tan 60 degree=3sqrt(3)$。
        在直角三角形 $P D C$ 中，$P D=sqrt(27-9)=3sqrt(2)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知各项均为正数的数列 ${a_n}$，其前 $n$ 项和为 $S_n$，$a_1=1$。],
  parts: (
    subquestion(
      stem: [若数列 ${a_n}$ 为等差数列，$S_10=70$，求数列 ${a_n}$ 的通项公式。],
      answers: ([$a_n=(4n-1)/3$（$n in NN^*$）。],),
      explanation: [设公差为 $d$，则 $S_10=10a_1+45d=10+45d=70$，得 $d=4/3$。
        故 $a_n=1+(n-1)4/3=(4n-1)/3$。],
    ),
    subquestion(
      stem: [若数列 ${a_n}$ 为等比数列，$a_4=1/8$，求满足 $S_n>100a_n$ 时 $n$ 的最小值。],
      answers: ([$7$],),
      explanation: [设公比为 $q>0$。由 $q^3=1/8$ 得 $q=1/2$，故 $a_n=2^(1-n)$，$S_n=2-2^(1-n)$。
        不等式等价于 $2^n-1>100$，即 $2^n>101$。∵ $2^6=64<101<128=2^7$，∴ $n$ 的最小值为 $7$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [有一条长为 $120$ 米的步行道 $O A$，$A$ 是垃圾投放点 $omega_1$。若以 $O$ 为原点，$O A$ 为 $x$ 轴正半轴建立直角坐标系，设点 $B(x,0)$，现要建设另一座垃圾投放点 $omega_2(t,0)$，函数 $f_t (x)$ 表示与 $B$ 点距离最近的垃圾投放点的距离。],
  parts: (
    subquestion(
      stem: [若 $t=60$，求 $f_60(10)$、$f_60(80)$、$f_60(95)$ 的值，并写出 $f_60(x)$ 的函数解析式。],
      answers: (
        [$f_60(10)=50$，$f_60(80)=20$，$f_60(95)=25$；
          $f_60(x)=cases(60-x & quad 0<=x<=60, x-60 & quad 60<x<=90, 120-x & quad 90<x<=120)$。],
      ),
      explanation: [点 $B$ 位于步行道上，故 $0<=x<=120$。由定义，$f_60(x)=min(|x-60|, 120-x)$。
        以 $60$、$90$ 为分界点去绝对值，便得上述分段函数。代入 $x=10,80,95$ 分别得 $50,20,25$。
        #figure(distance-diagram())],
    ),
    subquestion(
      stem: [若可以通过 $f_t (x)$ 与坐标轴围成的面积来测算扔垃圾的便利程度，面积越小越便利。问：垃圾投放点 $omega_2$ 建在何处才能比建在中点时更加便利？],
      answers: ([建在距 $O$ 点大于 $20$ 米且小于 $60$ 米处，即 $20<t<60$。],),
      explanation: [在 $0<=t<=120$ 时，图象由三条线段连接 $(0,t)$、$(t,0)$、$((120+t)/2,(120-t)/2)$、$(120,0)$。
        面积为两个三角形的面积之和：
        $ S(t)=1/2 t^2+1/2 (120-t)(120-t)/2=3/4 t^2-60t+3600. $
        ∵ $S(60)=2700$，∴ $S(t)<S(60)$ 等价于 $t^2-80t+1200<0$，即 $(t-20)(t-60)<0$。
        故 $20<t<60$。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知抛物线 $y^2=x$ 上的动点 $M(x_0,y_0)$，过 $M$ 分别作两条直线交抛物线于 $P$、$Q$ 两点，交直线 $x=t$ 于 $A$、$B$ 两点。],
  parts: (
    subquestion(
      stem: [若点 $M$ 纵坐标为 $sqrt(2)$，求 $M$ 与焦点的距离。],
      answers: ([$9/4$],),
      explanation: [由 $y_0=sqrt(2)$ 得 $x_0=2$。抛物线的焦点为 $(1/4,0)$，准线为 $x=-1/4$。
        由抛物线定义，$M$ 与焦点的距离等于其到准线的距离，即 $2+1/4=9/4$。],
    ),
    subquestion(
      stem: [若 $t=-1$，$P(1,1)$，$Q(1,-1)$，求证：$y_A dot y_B$ 为常数。],
      answers: ([$y_A y_B=-1$，为常数。],),
      explanation: [设 $M=(u^2,u)$。由两点式，直线 $M P$、$M Q$ 分别为 $x=(u+1)y-u$、$x=(u-1)y+u$。
        令 $x=-1$，得 $y_A=(u-1)/(u+1)$，$y_B=-(u+1)/(u-1)$，故 $y_A y_B=-1$。
        其中 $u != ±1$，否则有一条直线不能按题意与 $x=-1$ 相交。],
    ),
    subquestion(
      stem: [是否存在 $t$，使得 $y_A dot y_B=1$ 且 $y_P dot y_Q$ 为常数？若存在，求出 $t$ 的所有可能值；若不存在，请说明理由。],
      answers: ([存在，且仅有 $t=1$，此时 $y_P y_Q=1$。],),
      explanation: [#step[表示纵坐标乘积][设 $M=(u^2,u)$，$y_A=v$、$y_B=w$，则 $v w=1$。
          直线 $M P$ 的方程为 $x=(u+y_P)y-u y_P$，代入 $A=(t,v)$，得 $y_P=(u v-t)/(u-v)$。
          同理 $y_Q=(u w-t)/(u-w)$，故
          $ y_P y_Q=(u^2-t u(v+w)+t^2)/(u^2-u(v+w)+1). $
          上式适用于各交点按题意存在且互异的非退化情形。]
        #step[求常数条件][若该式恒为常数 $k$，记 $s=v+w$，则
          $ u^2-t u s+t^2=k(u^2-u s+1). $
          对任意固定的非零 $u$，可取多个满足 $v w=1$ 的 $v,w$，使 $s$ 连续变化；排除使交点退化的有限个值不影响比较系数。
          比较 $s$ 的系数，得 $k=t$；于是 $(1-t)u^2+t^2-t=0$，即 $(1-t)(u^2-t)=0$。
          ∵ $M$ 为动点，$u^2$ 不恒等于 $t$，∴ $t=1$。
          反之，取 $t=1$，分子与分母相等，故 $y_P y_Q=1$ 为常数，满足要求。]],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [已知非空集合 $A subset.eq RR$，函数 $y=f(x)$ 的定义域为 $D$。若对任意 $t in A$ 且 $x in D$，不等式 $f(x)<=f(x+t)$ 恒成立，则称函数 $f(x)$ 具有 $A$ 性质。],
  parts: (
    subquestion(
      stem: [当 $A={-1}$ 时，判断 $f(x)=-x$、$g(x)=2x$ 是否具有 $A$ 性质。],
      answers: ([$f(x)=-x$ 具有 $A$ 性质，$g(x)=2x$ 不具有。],),
      explanation: [$f(x-1)=-x+1>f(x)$，故 $f$ 具有 $A$ 性质；$g(x-1)=2x-2<g(x)$，故 $g$ 不具有 $A$ 性质。],
    ),
    subquestion(
      stem: [当 $A=(0,1)$ 时，$f(x)=x+1/x$，$x in [a,+infinity)$。若 $f(x)$ 具有 $A$ 性质，求 $a$ 的取值范围。],
      answers: ([$[1,+infinity)$],),
      explanation: [∵ $0$ 不能属于定义域 $[a,+infinity)$，∴ $a>0$。
        对 $x>=a$、$0<t<1$，有 $f(x+t)-f(x)=t(1-1/(x(x+t)))$。
        若 $a>=1$，则 $x(x+t)>1$，差为正，满足要求。
        若 $0<a<1$，取 $x=a$，再取 $0<t<min(1, 1/a-a)$，则 $a(a+t)<1$，差为负，不满足要求。
        故 $a>=1$。],
    ),
    subquestion(
      stem: [当 $A={-2,m}$，$m in ZZ$ 时，若 $D$ 为整数集且具有 $A$ 性质的函数均为常值函数，求所有符合条件的 $m$ 的值。],
      answers: ([所有正奇数，即 $m=2r+1$，$r=0,1,2,dots$。],),
      explanation: [#step[必要性][若 $m<=0$，则 $f(x)=-x$（$x in ZZ$）满足 $f(x)<=f(x-2)$、$f(x)<=f(x+m)$，但不是常值函数，故必须 $m>0$。
          若 $m$ 为偶数，则 $f(x)=cases(0 & quad x "为偶数", 1 & quad x "为奇数")$ 满足两种平移下函数值不变，却不是常值函数，故 $m$ 还必须为奇数。]
        #step[充分性][设 $m=2r+1$，$r$ 为非负整数。由 $A$ 性质，每次平移 $m$ 或 $-2$，函数值均不减。
          先平移 $m$，再平移 $r$ 次 $-2$，净位移为 $1$，故 $f(x)<=f(x+1)$。
          先平移 $m$，再平移 $r+1$ 次 $-2$，净位移为 $-1$，故 $f(x)<=f(x-1)$。
          将后一不等式中的 $x$ 换成 $x+1$，得 $f(x+1)<=f(x)$，故 $f(x+1)=f(x)$ 对所有整数 $x$ 成立。
          ∴ $f$ 为常值函数，所有正奇数均满足要求。]],
    ),
  ),
)
