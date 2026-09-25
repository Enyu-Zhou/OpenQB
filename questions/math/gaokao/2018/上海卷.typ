#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "上海卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018上海.pdf",
  regions: ("上海",),
)

#let hexagonal-prism() = cetz.canvas(length: 22mm, {
  import cetz.draw: *
  let h = calc.sqrt(3) / 2
  let bottom = (
    (0.5, -h, 0),
    (1, 0, 0),
    (0.5, h, 0),
    (-0.5, h, 0),
    (-1, 0, 0),
    (-0.5, -h, 0),
  )
  let top = bottom.map(p => (p.at(0), p.at(1), 1.7))
  oblique-project((1, 0), (0.4, 0.4), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(..top, close: true)
    line(bottom.at(4), bottom.at(5), bottom.at(0), bottom.at(1))
    line(bottom.at(1), bottom.at(2), bottom.at(3), bottom.at(4), stroke: (
      dash: figure-style.dash,
    ))
    for i in range(6) {
      line(bottom.at(i), top.at(i), stroke: (
        dash: if i in (2, 3) { figure-style.dash } else { "solid" },
      ))
    }
    content(bottom.at(0), $A$, anchor: "north", padding: 3pt)
    content(top.at(0), $A_1$, anchor: "south", padding: 3pt)
  })
})
#let cone() = cetz.canvas(length: 14mm, {
  import cetz.draw: *
  let point(t) = (2 * calc.cos(t), 2 * calc.sin(t), 0)
  let phase = calc.atan(2 / 0.6)
  let delta = calc.asin(0.3 / calc.sqrt(4.36))
  let first = 180deg + delta - phase
  let last = 360deg - delta - phase
  let arc-points(start, end) = range(101).map(i => point(
    start + (end - start) * i / 100,
  ))
  let p = (0, 0, 4)
  let o = (0, 0, 0)
  let a = (2, 0, 0)
  let b = (0, 2, 0)
  let m = (1, 1, 0)
  oblique-project((-0.3, -0.3), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(point(first), p, point(last))
    line(..arc-points(last, first + 360deg))
    line(..arc-points(first, last), stroke: (dash: figure-style.dash))
    line(p, o, a, b, o, stroke: (dash: figure-style.dash))
    line(p, m, stroke: (dash: figure-style.dash))
    for (q, label, anchor) in (
      (p, $P$, "south"),
      (o, $O$, "east"),
      (a, $A$, "north"),
      (b, $B$, "west"),
      (m, $M$, "south-west"),
    ) {
      content(q, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let parabola-rectangle() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.12,
    shared-zero: $O$,
  ))
  plot.plot(
    size: (9.5, 9),
    axis-style: "school-book",
    x-min: -0.5,
    x-max: 9,
    y-min: -0.5,
    y-max: 8.5,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.add(
        domain: (0, 8),
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
        x => calc.sqrt(8 * x),
      )
      plot.annotate(resize: false, {
        let f = (2, 0)
        let p = (0.4, 4 / calc.sqrt(5))
        let e = (6.4, 16 / calc.sqrt(5))
        let q = (8, 12 / calc.sqrt(5))
        line((8, 0), (8, 8))
        line(f, p, e, q, close: true)
        for (v, label, anchor) in (
          (f, $F$, "north"),
          (p, $P$, "east"),
          (e, $E$, "south"),
          (q, $Q$, "west"),
          ((8, 0), $A$, "north"),
          ((8, 8), $B$, "south-west"),
        ) {
          content(v, label, anchor: anchor, padding: if v == p { 12pt } else {
            3pt
          })
        }
      })
    },
  )
})

#section[填空题：本题共 12 小题，共 54 分。第 1—6 题每小题 4 分，第 7—12 题每小题 5 分。]
#question(
  "fill-in",
  score: 4,
  stem: [行列式 $mat(delim: "|", 4, 1; 2, 5)$ 的值为#fill-placeholder()。],
  answers: ([$18$],),
  explanation: [$mat(delim: "|", 4, 1; 2, 5)=4 times 5-1 times 2=18$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [双曲线 $x^2/4-y^2=1$ 的渐近线方程为#fill-placeholder()。],
  answers: ([$y=plus.minus x/2$],),
  explanation: [由 $a=2,b=1$，得渐近线方程为 $y=plus.minus b/a x=plus.minus x/2$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [在 $(1+x)^7$ 的二项展开式中，$x^2$ 项的系数为#fill-placeholder()。（结果用数值表示）],
  answers: ([$21$],),
  explanation: [$x^2$ 项为 $C_7^2 x^2=21x^2$，故其系数为 $21$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设常数 $a in RR$，函数 $f(x)=log_2 (x+a)$。若 $f(x)$ 的反函数的图象经过点 $(3,1)$，则 $a=$#fill-placeholder()。],
  answers: ([$7$],),
  explanation: [由反函数的性质，$f(1)=3$，故 $log_2 (1+a)=3$，解得 $a=7$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知复数 $z$ 满足 $(1+"i")z=1-7"i"$（$"i"$ 是虚数单位），则 $|z|=$#fill-placeholder()。],
  answers: ([$5$],),
  explanation: [$z=((1-7"i")(1-"i"))/2=-3-4"i"$，故 $|z|=sqrt(9+16)=5$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [记等差数列 ${a_n}$ 的前 $n$ 项和为 $S_n$。若 $a_3=0$，$a_6+a_7=14$，则 $S_7=$#fill-placeholder()。],
  answers: ([$14$],),
  explanation: [设公差为 $d$，则 $a_6+a_7=2a_3+7d=14$，得 $d=2$。故 $a_1=-4$，$S_7=7a_1+21d=14$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $alpha in {-2,-1,-1/2,1/2,1,2,3}$，若幂函数 $f(x)=x^alpha$ 为奇函数，且在 $(0,+infinity)$ 上递减，则 $alpha=$#fill-placeholder()。],
  answers: ([$-1$],),
  explanation: [在所给指数中，奇函数对应 $alpha=-1,1,3$；其中只有 $x^(-1)$ 在 $(0,+infinity)$ 上递减，故 $alpha=-1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系中，已知点 $A(-1,0)$，$B(2,0)$，$E,F$ 是 $y$ 轴上的两个动点，且 $|arrow(E F)|=2$，则 $arrow(A E) dot arrow(B F)$ 的最小值为#fill-placeholder()。],
  answers: ([$-3$],),
  explanation: [设 $E(0,u),F(0,v)$，则 $(u-v)^2=4$。故
    $ arrow(A E) dot arrow(B F)=-2+u v=-2+((u+v)^2-4)/4>=-3. $
    当 $u=1,v=-1$ 时等号成立，故最小值为 $-3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [有编号互不相同的五个砝码，其中 5 克、3 克、1 克砝码各一个，2 克砝码两个。从中随机选取三个，则这三个砝码的总质量为 9 克的概率是#fill-placeholder()。（结果用最简分数表示）],
  answers: ([$1/5$],),
  explanation: [共有 $C_5^3=10$ 种等可能的选法。总质量为 $9$ 克的组合只有 $5+3+1$ 和 $5+2+2$，各有一种选法，故概率为 $2/10=1/5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设等比数列 ${a_n}$ 的通项公式为 $a_n=q^(n-1)$（$n in NN^*$），前 $n$ 项和为 $S_n$，若 $lim_(n -> infinity) S_n/a_(n+1)=1/2$，则 $q=$#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [令 $r_n=S_n/a_(n+1)$，由 $S_(n+1)=S_n+a_(n+1)$，得 $r_(n+1)=(r_n+1)/q$。两边取极限，得 $1/2=(1/2+1)/q$，故 $q=3$。此时 $r_n=(1-3^(-n))/2 -> 1/2$，满足条件。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知常数 $a>0$，函数 $f(x)=2^x/(2^x+a x)$ 的图象经过点 $P(p,6/5)$，$Q(q,-1/5)$。若 $2^(p+q)=36p q$，则 $a=$#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [将两点代入，得 $2^p=-6a p$，$6 times 2^q=-a q$。相乘得 $2^(p+q)=a^2 p q$。由 $2^(p+q)>0$，知 $p q!=0$，故 $a^2=36$。又 $a>0$，所以 $a=6$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知实数 $x_1,x_2,y_1,y_2$ 满足：$x_1^2+y_1^2=1$，$x_2^2+y_2^2=1$，$x_1 x_2+y_1 y_2=1/2$，则 $frac(|x_1+y_1-1|, sqrt(2))+frac(|x_2+y_2-1|, sqrt(2))$ 的最大值为#fill-placeholder()。],
  answers: ([$sqrt(2)+sqrt(3)$],),
  explanation: [令 $u=(x_1,y_1),v=(x_2,y_2),w=(1,1)$，则 $|u+v|=sqrt(3)$，$|u-v|=1$。记 $s=u dot w-1$，$t=v dot w-1$。由 $|s|+|t|=max(|s+t|, |s-t|)$，得
    $ |s+t|=|(u+v) dot w-2|<=sqrt(6)+2, quad |s-t|=|(u-v) dot w|<=sqrt(2). $
    故所求式不超过 $sqrt(3)+sqrt(2)$。取两个夹角为 $60degree$ 的单位向量 $u,v$，使它们的和与 $w$ 反向，即可取等，故最大值为 $sqrt(3)+sqrt(2)$。],
)

#section[选择题：本题共 4 小题，每小题 5 分，共 20 分。每小题只有一项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [设 $P$ 是椭圆 $x^2/5+y^2/3=1$ 上的动点，则 $P$ 到该椭圆的两个焦点的距离之和为#choice-placeholder()。],
  choices: ([$2sqrt(2)$], [$2sqrt(3)$], [$2sqrt(5)$], [$4sqrt(2)$]),
  answers: ([C],),
  explanation: [椭圆的半长轴长为 $a=sqrt(5)$。由椭圆定义，两焦距之和为 $2a=2sqrt(5)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a in RR$，则“$a>1$”是“$1/a<1$”的#choice-placeholder()。],
  choices: (
    [充分非必要条件],
    [必要非充分条件],
    [充要条件],
    [既非充分又非必要条件],
  ),
  answers: ([A],),
  explanation: [由 $a>1$ 可得 $0<1/a<1$，故充分；但 $a=-1$ 时，$1/a<1$ 成立而 $a>1$ 不成立，故不必要。],
)
#question(
  "single-choice",
  score: 5,
  stem: [《九章算术》中，称底面为矩形而有一侧棱垂直于底面的四棱锥为阳马。设 $A A_1$ 是正六棱柱的一条侧棱，如图。若阳马以该正六棱柱的顶点为顶点、以 $A A_1$ 为底面矩形的一边，则这样的阳马的个数是#choice-placeholder()。
    #figure(hexagonal-prism())],
  choices: ([$4$], [$8$], [$12$], [$16$]),
  answers: ([D],),
  explanation: [依次将下底面顶点记作 $A,B,C,D,E,F$，上底面相应顶点加下标 $1$。底面矩形必为 $A A_1 X_1 X$，其中 $X in {B,C,D,E,F}$。
    若 $X=B,C,E,F$，在下底面各有两个顶点到直线 $A X$ 的垂足是 $A$ 或 $X$：分别是 ${D,E}$、${D,F}$、${D,B}$、${D,C}$。它们及其对应的上底面顶点都可作阳马顶点，所以每种底面对应 $4$ 个阳马。
    若 $X=D$，其余顶点到直线 $A D$ 的垂足均不在 $A,D$，不能形成阳马。
    故共有 $4 times 4=16$ 个。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $D$ 是含数 $1$ 的有限实数集，$f(x)$ 是定义在 $D$ 上的函数。若 $f(x)$ 的图象绕原点逆时针旋转 $pi/6$ 后与原图象重合，则在以下各项中，$f(1)$ 的可能取值只能是#choice-placeholder()。],
  choices: ([$sqrt(3)$], [$sqrt(3)/2$], [$sqrt(3)/3$], [$0$]),
  answers: ([B],),
  explanation: [图象必须包含 $(1,f(1))$ 连续旋转 $30degree$ 得到的全部 $12$ 个点，且这些点的横坐标不能重复。
    若 $f(1)=sqrt(3)$ 或 $sqrt(3)/3$，起始点的辐角分别为 $60degree$ 或 $30degree$，旋转后会同时出现 $(1,f(1))$ 和 $(1,-f(1))$，不符合函数定义。若 $f(1)=0$，旋转后会出现横坐标均为 $0$、纵坐标分别为 $1,-1$ 的两点，也不符合。
    若 $f(1)=sqrt(3)/2$，设起始辐角为 $theta$，则 $30degree<theta<45degree$。若两个旋转点横坐标相同，由余弦相等可得 $2theta$ 为 $30degree$ 的整数倍，即 $theta$ 为 $15degree$ 的整数倍，矛盾。因此这 $12$ 个点横坐标互异，可构成满足题意的函数图象。],
)

#section[解答题：本题共 5 小题，共 76 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [已知圆锥的顶点为 $P$，底面圆心为 $O$，半径为 $2$。],
  parts: (
    subquestion(
      score: 6,
      stem: [设圆锥的母线长为 $4$，求圆锥的体积。],
      answers: ([$(8sqrt(3)pi)/3$],),
      explanation: [圆锥的高为 $h=sqrt(4^2-2^2)=2sqrt(3)$，故体积为 $V=1/3 pi times 2^2 times 2sqrt(3)=(8sqrt(3)pi)/3$。],
    ),
    subquestion(
      score: 8,
      stem: [设 $P O=4$，$O A,O B$ 是底面半径，且 $angle A O B=90degree$，$M$ 为线段 $A B$ 的中点，如图，求异面直线 $P M$ 与 $O B$ 所成的角的大小。#figure(cone())],
      answers: ([$arccos(sqrt(2)/6)$],),
      explanation: [以 $O$ 为原点，$O A,O B,O P$ 的方向为三个坐标轴的正方向建系。则 $P(0,0,4),A(2,0,0),B(0,2,0),M(1,1,0)$。因此 $arrow(P M)=(1,1,-4)$，$arrow(O B)=(0,2,0)$。设所求角为 $theta$，则 $cos theta=2/(sqrt(18) times 2)=sqrt(2)/6$，故 $theta=arccos(sqrt(2)/6)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设常数 $a in RR$，函数 $f(x)=a sin 2x+2cos^2 x$。],
  parts: (
    subquestion(
      score: 6,
      stem: [若 $f(x)$ 为偶函数，求 $a$ 的值。],
      answers: ([$0$],),
      explanation: [由 $f(-x)=f(x)$，得 $2a sin 2x=0$ 对任意 $x in RR$ 成立，故 $a=0$；此时 $f(x)=2cos^2 x$ 确为偶函数。],
    ),
    subquestion(
      score: 8,
      stem: [若 $f(pi/4)=sqrt(3)+1$，求方程 $f(x)=1-sqrt(2)$ 在区间 $[-pi,pi]$ 上的解。],
      answers: ([$x in {-11pi/24,-5pi/24,13pi/24,19pi/24}$],),
      explanation: [由 $a+1=sqrt(3)+1$，得 $a=sqrt(3)$。故 $f(x)=2sin(2x+pi/6)+1$，原方程化为 $sin(2x+pi/6)=-sqrt(2)/2$。
        因此 $2x+pi/6=-pi/4+2k pi$ 或 $2x+pi/6=5pi/4+2k pi$（$k in ZZ$），即 $x=-5pi/24+k pi$ 或 $x=13pi/24+k pi$。结合 $x in [-pi,pi]$，得 $x=-11pi/24,-5pi/24,13pi/24,19pi/24$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [某群体的人均通勤时间，是指单日内该群体中成员从居住地到工作地的平均用时。某地上班族 $S$ 中的成员仅以自驾或公交方式通勤。分析显示：当 $S$ 中 $x%$（$0<x<100$）的成员自驾时，自驾群体的人均通勤时间为
    $ f(x)=cases(30 & quad 0<x<=30, 2x+1800/x-90 & quad 30<x<100) $
    （单位：分钟），而公交群体的人均通勤时间不受 $x$ 影响，恒为 40 分钟。试根据上述分析结果回答下列问题：],
  parts: (
    subquestion(
      score: 6,
      stem: [当 $x$ 在什么范围内时，公交群体的人均通勤时间少于自驾群体的人均通勤时间？],
      answers: ([$x in (45,100)$],),
      explanation: [要求 $f(x)>40$。当 $0<x<=30$ 时不成立；当 $30<x<100$ 时，不等式等价于 $x^2-65x+900=(x-20)(x-45)>0$，解得 $45<x<100$。],
    ),
    subquestion(
      score: 8,
      stem: [求该地上班族 $S$ 的人均通勤时间 $g(x)$ 的表达式；讨论 $g(x)$ 的单调性，并说明其实际意义。],
      answers: (
        [$g(x)=cases(40-x/10 & quad 0<x<=30, x^2/50-13x/10+58 & quad 30<x<100)$；在 $(0,32.5]$ 上递减，在 $[32.5,100)$ 上递增，自驾比例为 $32.5%$ 时整体人均通勤时间最少。],
      ),
      explanation: [按人数比例加权，得 $g(x)=x/100 f(x)+(1-x/100) times 40$，即
        $
          g(x)=cases(40-x/10 & quad 0<x<=30, x^2/50-13x/10+58 & quad 30<x<100).
        $
        第一段递减，第二段二次函数的对称轴为 $x=32.5$，两段在 $x=30$ 处衔接。因此 $g$ 在 $(0,32.5]$ 上递减，在 $[32.5,100)$ 上递增。
        这表明自驾比例低于 $32.5%$ 时，增加自驾比例能降低整体人均通勤时间；超过 $32.5%$ 后，继续增加自驾比例会使整体人均通勤时间增加。自驾比例为 $32.5%$ 时，人均通勤时间最少，为 $36.875$ 分钟。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [设常数 $t>2$。在平面直角坐标系 $x O y$ 中，已知点 $F(2,0)$，直线 $l:x=t$，曲线 $Gamma:y^2=8x$（$0<=x<=t,y>=0$）。$l$ 与 $x$ 轴交于点 $A$、与 $Gamma$ 交于点 $B$。$P,Q$ 分别是曲线 $Gamma$ 与线段 $A B$ 上的动点。],
  parts: (
    subquestion(
      stem: [用 $t$ 表示点 $B$ 到点 $F$ 的距离。],
      answers: ([$t+2$],),
      explanation: [由 $B(t,sqrt(8t))$，得 $|B F|=sqrt((t-2)^2+8t)=t+2$。],
    ),
    subquestion(
      stem: [设 $t=3$，$|F Q|=2$，线段 $O Q$ 的中点在直线 $F P$ 上，求 $triangle A Q P$ 的面积。],
      answers: ([$(7sqrt(3))/6$],),
      explanation: [由 $A(3,0),F(2,0),|F Q|=2$，得 $Q(3,sqrt(3))$。$O Q$ 的中点为 $(3/2,sqrt(3)/2)$，所以直线 $F P$ 的方程为 $y=-sqrt(3)(x-2)$。
        联立 $y^2=8x$，得 $3x^2-20x+12=0$，解得 $x=2/3$ 或 $x=6$。由 $0<=x<=3$，得 $P(2/3,(4sqrt(3))/3)$。故 $S_(triangle A Q P)=1/2 times sqrt(3) times (3-2/3)=(7sqrt(3))/6$。],
    ),
    subquestion(
      stem: [设 $t=8$，是否存在以 $F P,F Q$ 为邻边的矩形 $F P E Q$，使得点 $E$ 在 $Gamma$ 上？若存在，求点 $P$ 的坐标；若不存在，说明理由。],
      answers: ([存在，$P(2/5,(4sqrt(5))/5)$。],),
      explanation: [设 $P(s,y)$，$Q(8,q)$。若矩形存在，则 $E(s+6,y+q)$，且
        $ y^2=8s, quad (y+q)^2=8(s+6), quad 6(s-2)+y q=0. $
        后两式结合第一式，得 $q^2=24+12s$，$y q=12-6s$，从而
        $ 8s(24+12s)=(12-6s)^2, quad 5s^2+28s-12=0. $
        解得 $s=2/5$ 或 $s=-6$，后者舍去。所以 $y=(4sqrt(5))/5$，$q=(12sqrt(5))/5$。
        此时 $P(2/5,(4sqrt(5))/5)$、$E(32/5,(16sqrt(5))/5)$ 均在 $Gamma$ 上，$Q(8,(12sqrt(5))/5)$ 在线段 $A B$ 上，且 $arrow(F P) dot arrow(F Q)=0$，两条邻边均非零。因此所求矩形存在。
        #figure(parabola-rectangle())],
    ),
  ),
)
#question(
  "solution",
  score: 18,
  stem: [给定无穷数列 ${a_n}$，若无穷数列 ${b_n}$ 满足：对任意 $n in NN^*$，都有 $|b_n-a_n|<=1$，则称 ${b_n}$ 与 ${a_n}$“接近”。],
  parts: (
    subquestion(
      stem: [设 ${a_n}$ 是首项为 $1$，公比为 $1/2$ 的等比数列，$b_n=a_(n+1)+1$，$n in NN^*$，判断数列 ${b_n}$ 是否与 ${a_n}$ 接近，并说明理由。],
      answers: ([接近。],),
      explanation: [由 $a_n=2^(1-n)$，得 $b_n=2^(-n)+1$，故 $|b_n-a_n|=1-2^(-n)<1$ 对任意正整数 $n$ 成立。因此两数列接近。],
    ),
    subquestion(
      stem: [设数列 ${a_n}$ 的前四项为：$a_1=1,a_2=2,a_3=4,a_4=8$，${b_n}$ 是一个与 ${a_n}$ 接近的数列，记集合 $M={x | x=b_i,i=1,2,3,4}$，求 $M$ 中元素的个数 $m$。],
      answers: ([$m=3$ 或 $4$。],),
      explanation: [由定义，$b_1 in [0,2],b_2 in [1,3],b_3 in [3,5],b_4 in [7,9]$。其中 $b_1,b_3,b_4$ 两两不同，故 $3<=m<=4$。
        取前四项为 $1,1,4,8$，可得 $m=3$；取 $1,2,4,8$，可得 $m=4$，其余项均令 $b_n=a_n$ 即可。故 $m=3$ 或 $4$。],
    ),
    subquestion(
      stem: [已知 ${a_n}$ 是公差为 $d$ 的等差数列。若存在数列 ${b_n}$ 满足：${b_n}$ 与 ${a_n}$ 接近，且在 $b_2-b_1,b_3-b_2,dots,b_201-b_200$ 中至少有 $100$ 个为正数，求 $d$ 的取值范围。],
      answers: ([$(-2,+infinity)$],),
      explanation: [#step[必要性][由 $a_n-1<=b_n<=a_n+1$，得 $b_(n+1)-b_n<=a_(n+1)+1-(a_n-1)=d+2$。若 $d<=-2$，所有相邻项之差均不大于 $0$，不符合题意，故 $d>-2$。]
        #step[充分性][当 $d>-2$ 时，令 $b_(2k-1)=a_(2k-1)-1$，$b_(2k)=a_(2k)+1$（$k in NN^*$）。则 $|b_n-a_n|=1$，且对 $k=1,2,dots,100$，均有 $b_(2k)-b_(2k-1)=d+2>0$。因此所给的 $200$ 个差中至少有 $100$ 个正数。故 $d in (-2,+infinity)$。]],
    ),
  ),
)
