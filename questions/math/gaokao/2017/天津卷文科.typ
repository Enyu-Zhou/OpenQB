#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017天津文.pdf",
  regions: ("天津",),
)
#let loop-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((-0.6, 0.3), (0.6, -0.3), radius: 0.15)
    content((0, 0), [开始])
    line((-0.85, -1), (1, -1), (0.85, -1.7), (-1, -1.7), close: true)
    content((0, -1.35), [输入 $N$])
    line((0, -2.4), (2.6, -3.1), (0, -3.8), (-2.6, -3.1), close: true)
    content((0, -3.1), [$N$ 能被 $3$ 整除？])
    rect((-0.85, -4.5), (0.85, -5.6))
    content((0, -5.05), $N=N/3$)
    rect((2.5, -4.7), (4.7, -5.4))
    content((3.6, -5.05), $N=N-1$)
    line((0, -6.4), (1.5, -7), (0, -7.6), (-1.5, -7), close: true)
    content((0, -7), $N<=3$)
    line((-0.85, -8.4), (1, -8.4), (0.85, -9.1), (-1, -9.1), close: true)
    content((0, -8.75), [输出 $N$])
    rect((-0.6, -9.8), (0.6, -10.4), radius: 0.15)
    content((0, -10.1), [结束])
    for (a, b) in (
      ((0, -0.3), (0, -1)),
      ((0, -1.7), (0, -2.4)),
      ((0, -3.8), (0, -4.5)),
      ((0, -5.6), (0, -6.4)),
      ((0, -7.6), (0, -8.4)),
      ((0, -9.1), (0, -9.8)),
    ) { line(a, b, mark: (end: ">")) }
    line((2.6, -3.1), (3.6, -3.1), (3.6, -4.7), mark: (end: ">"))
    line((3.6, -5.4), (3.6, -6), (0, -6), mark: (end: ">"))
    line((-1.5, -7), (-3, -7), (-3, -2.05), (0, -2.05), mark: (end: ">"))
    for (p, label) in (
      ((0.3, -4.05), [是]),
      ((0.3, -7.9), [是]),
      ((2.8, -2.9), [否]),
      ((-1.9, -6.8), [否]),
    ) { content(p, label) }
  })
}
#let feasible-region() = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: $O$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
    ))
    plot.plot(
      size: (7, 7),
      axis-style: "school-book",
      x-min: 0,
      x-max: 10,
      y-min: 0,
      y-max: 11,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (4, 6),
      y-ticks: (2, 3, 6, 10),
      {
        plot.annotate(resize: false, {
          line(
            (0, 6),
            (4, 2),
            (6, 3),
            (0, 10),
            close: true,
            fill: luma(92%),
            stroke: none,
          )
          line((0, 6), (6, 0))
          line((0, 10), (60 / 7, 0))
          line((0, 0), (9, 4.5))
          for x in range(7) {
            for y in range(11) {
              if x + y >= 6 and 7 * x + 6 * y <= 60 and x <= 2 * y {
                circle((x, y), radius: 0.055, fill: black, stroke: none)
              }
            }
          }
          content((6.8, 2.6), $M(6,3)$, anchor: "west", padding: 0pt)
        })
      },
    )
  })
}
#let pyramid(auxiliary: false) = cetz.canvas(length: 22mm, {
  import cetz.draw: *
  let d = (0, 0, 0)
  let a = (1, 0, 0)
  let c = (0, 4, 0)
  let b = (3, 4, 0)
  let p = (0, 1, calc.sqrt(3))
  oblique-project((1, -0.12), (0.12, 0.3), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, d, a, b, p)
    line(p, a)
    for (u, v) in ((p, c), (c, d), (c, b)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    for (pt, label, anchor) in (
      (d, $D$, "north-east"),
      (a, $A$, "north"),
      (b, $B$, "west"),
      (c, $C$, "south-west"),
      (p, $P$, "south"),
    ) { content(pt, label, anchor: anchor, padding: 3pt) }
    if auxiliary {
      let f = (2, 4, 0)
      line(d, f, stroke: (dash: figure-style.dash))
      line(p, f, stroke: (dash: figure-style.dash))
      content(f, $F$, anchor: "south", padding: 3pt)
    }
  })
})

#section[选择题：共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={1,2,6}$，$B={2,4}$，$C={1,2,3,4}$，则 $(A union B) inter C=$#choice-placeholder()。],
  choices: ([${2}$], [${1,2,4}$], [${1,2,4,6}$], [${1,2,3,4,6}$]),
  answers: ([B],),
  explanation: [$A union B={1,2,4,6}$，与 $C$ 取交集得到 ${1,2,4}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $x in RR$，则“$2-x>=0$”是“$abs(x-1)<=1$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([B],),
  explanation: [前者等价于 $x<=2$，后者等价于 $0<=x<=2$。后者能推出前者，前者不能推出后者（如 $x=-1$），故为必要而不充分条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [有 $5$ 支彩笔（除颜色外无差别），颜色分别为红、黄、蓝、绿、紫。从这 $5$ 支彩笔中任取 $2$ 支不同颜色的彩笔，则取出的 $2$ 支彩笔中含有红色彩笔的概率为#choice-placeholder()。],
  choices: ([$4/5$], [$3/5$], [$2/5$], [$1/5$]),
  answers: ([C],),
  explanation: [共有 $C_5^2=10$ 种等可能取法，含红色彩笔的有 $4$ 种，故概率为 $4/10=2/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [阅读程序框图，运行相应的程序，若输入 $N$ 的值为 $19$，则输出 $N$ 的值为#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$0$], [$1$], [$2$], [$3$]),
  answers: ([C],),
  explanation: [$N$ 依次变化为 $19 arrow 18 arrow 6 arrow 2$，此时满足 $N<=3$，故输出 $2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的右焦点为 $F$，点 $A$ 在双曲线的渐近线上，$triangle O A F$ 是边长为 $2$ 的等边三角形（$O$ 为原点），则双曲线方程为#choice-placeholder()。],
  choices: (
    [$x^2/4-y^2/12=1$],
    [$x^2/12-y^2/4=1$],
    [$x^2/3-y^2=1$],
    [$x^2-y^2/3=1$],
  ),
  answers: ([D],),
  explanation: [由 $O F=c=2$，等边三角形顶点 $A=(1,plus.minus sqrt(3))$，得渐近线斜率的绝对值 $b/a=sqrt(3)$。结合 $a^2+b^2=c^2=4$，得 $a^2=1,b^2=3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知奇函数 $f(x)$ 在 $RR$ 上是增函数。若 $a=-f(log_2 1/5)$，$b=f(log_2 4.1)$，$c=f(2^0.8)$，则 $a,b,c$ 的大小关系为#choice-placeholder()。],
  choices: ([$a<b<c$], [$b<a<c$], [$c<b<a$], [$c<a<b$]),
  answers: ([C],),
  explanation: [由奇性，$a=f(log_2 5)$。又 $2^0.8<2<log_2 4.1<log_2 5$，结合严格递增性得 $c<b<a$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=2sin(omega x+phi)$，$x in RR$，其中 $omega>0$，$abs(phi)<pi$。若 $f((5pi)/8)=2$，$f((11pi)/8)=0$，且 $f(x)$ 的最小正周期大于 $2pi$，则#choice-placeholder()。],
  choices: (
    [$omega=2/3,phi=pi/12$],
    [$omega=2/3,phi=-(11pi)/12$],
    [$omega=1/3,phi=-(11pi)/24$],
    [$omega=1/3,phi=(7pi)/24$],
  ),
  answers: ([A],),
  explanation: [周期条件给出 $0<omega<1$。自最大值点 $x=(5pi)/8$ 向右到零点 $(11pi)/8$，相位增加 $(3pi)/4 omega in (0,(3pi)/4)$，只能等于 $pi/2$，故 $omega=2/3$。再由 $(5pi)/12+phi=pi/2+2k pi$，结合 $abs(phi)<pi$ 得 $phi=pi/12$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=cases(abs(x)+2 quad &x<1, x+2/x quad &x>=1)$。设 $a in RR$，若关于 $x$ 的不等式 $f(x)>=abs(x/2+a)$ 在 $RR$ 上恒成立，则 $a$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$[-2,2]$],
    [$[-2sqrt(3),2]$],
    [$[-2,2sqrt(3)]$],
    [$[-2sqrt(3),2sqrt(3)]$],
  ),
  answers: ([A],),
  explanation: [#step[必要性][令 $x=0$，得到 $2>=abs(a)$，即 $a in [-2,2]$。]
    #step[充分性][若 $abs(a)<=2$，由三角不等式 $abs(x/2+a)<=abs(x)/2+2$。当 $x<1$ 时，$f(x)=abs(x)+2>=abs(x)/2+2$；当 $x>=1$ 时，$x/2+2/x>=2$，故 $f(x)=x/2+(x/2+2/x)>=x/2+2$。因此该范围内的 $a$ 均满足恒成立要求。]],
)
#section[填空题：共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知 $a in RR$，$i$ 为虚数单位，若 $(a-i)/(2+i)$ 为实数，则 $a$ 的值为#fill-placeholder()。],
  answers: ([$-2$],),
  explanation: [$(a-i)/(2+i)=((a-i)(2-i))/5=(2a-1)/5-(a+2)/5 i$，虚部为零要求 $a=-2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $a in RR$，设函数 $f(x)=a x-ln x$ 的图象在点 $(1,f(1))$ 处的切线为 $l$，则 $l$ 在 $y$ 轴上的截距为#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [$f(1)=a$，$f'(1)=a-1$，切线方程为 $y-a=(a-1)(x-1)$，即 $y=(a-1)x+1$，故截距为 $1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知一个正方体的所有顶点在一个球面上，若这个正方体的表面积为 $18$，则这个球的体积为#fill-placeholder()。],
  answers: ([$(9pi)/2$],),
  explanation: [设正方体棱长为 $s$，则 $6s^2=18$，$s=sqrt(3)$。外接球直径等于体对角线 $sqrt(3)s=3$，半径为 $3/2$，故体积 $V=4/3 pi(3/2)^3=(9pi)/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设抛物线 $y^2=4x$ 的焦点为 $F$，准线为 $l$。已知点 $C$ 在 $l$ 上，以 $C$ 为圆心的圆与 $y$ 轴的正半轴相切于点 $A$。若 $angle F A C=120 degree$，则圆的方程为#fill-placeholder()。],
  answers: ([$(x+1)^2+(y-sqrt(3))^2=1$],),
  explanation: [焦点 $F=(1,0)$，准线 $x=-1$。设 $C=(-1,t)$，则切点 $A=(0,t)$，其中 $t>0$，圆半径为 $1$。由 $arrow(A F)=(1,-t)$、$arrow(A C)=(-1,0)$，得 $cos angle F A C=-1/sqrt(1+t^2)=-1/2$，故 $t=sqrt(3)$，得到所求圆方程。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $a,b in RR$，$a b>0$，则 $(a^4+4b^4+1)/(a b)$ 的最小值为#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [由 $a^4+4b^4>=4a^2 b^2$，得
    $ (a^4+4b^4+1)/(a b)>=4a b+1/(a b)>=4. $
    两步等号要求 $a^2=2b^2$ 且 $a b=1/2$，如取 $a=2^(-1/4),b=2^(-3/4)$ 即可同时满足，所以最小值为 $4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $triangle A B C$ 中，$angle A=60 degree$，$A B=3$，$A C=2$。若 $arrow(B D)=2arrow(D C)$，$arrow(A E)=lambda arrow(A C)-arrow(A B)$（$lambda in RR$），且 $arrow(A D) dot arrow(A E)=-4$，则 $lambda$ 的值为#fill-placeholder()。],
  answers: ([$3/11$],),
  explanation: [由分点关系，$arrow(A D)=1/3 arrow(A B)+2/3 arrow(A C)$，且 $arrow(A B) dot arrow(A C)=3 times 2 times cos 60 degree=3$。因此
    $ arrow(A D) dot arrow(A E)=lambda+8/3 lambda-3-2=(11lambda)/3-5=-4, $
    解得 $lambda=3/11$。],
)
#section[解答题：共 6 小题，共 80 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [在 $triangle A B C$ 中，内角 $A,B,C$ 所对的边分别为 $a,b,c$。已知 $a sin A=4b sin B$，$a c=sqrt(5)(a^2-b^2-c^2)$。],
  parts: (
    subquestion(
      stem: [求 $cos A$ 的值。],
      answers: ([$-sqrt(5)/5$],),
      explanation: [由正弦定理及 $a sin A=4b sin B$ 得 $a^2=4b^2$，即 $a=2b$。由余弦定理，
        $ cos A=(b^2+c^2-a^2)/(2b c)=(-a c/sqrt(5))/(a c)=-sqrt(5)/5. $],
    ),
    subquestion(
      stem: [求 $sin(2B-A)$ 的值。],
      answers: ([$-(2sqrt(5))/5$],),
      explanation: [由第（1）问得 $sin A=(2sqrt(5))/5$，且 $A$ 为钝角，故 $B$ 为锐角。由 $sin A=2sin B$，得 $sin B=sqrt(5)/5$、$cos B=(2sqrt(5))/5$，所以 $sin 2B=4/5$、$cos 2B=3/5$。因此
        $
          sin(2B-A)=sin 2B cos A-cos 2B sin A=4/5 times (-sqrt(5)/5)-3/5 times (2sqrt(5))/5=-(2sqrt(5))/5.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [电视台播放甲、乙两套连续剧，每次播放连续剧时，需要播放广告。已知每次播放甲、乙两套连续剧时，连续剧播放时长、广告播放时长、收视人次如下表所示：
    #table(
      columns: 4,
      align: center,
      [], [连续剧播放时长（分钟）], [广告播放时长（分钟）], [收视人次（万）],
      [甲], [$70$], [$5$], [$60$],
      [乙], [$60$], [$5$], [$25$],
    )
    已知电视台每周安排的甲、乙连续剧的总播放时间不多于 $600$ 分钟，广告的总播放时间不少于 $30$ 分钟，且甲连续剧播放的次数不多于乙连续剧播放次数的 $2$ 倍。分别用 $x,y$ 表示每周计划播出的甲、乙两套连续剧的次数。],
  parts: (
    subquestion(
      stem: [用 $x,y$ 列出满足题目条件的数学关系式，并画出相应的平面区域。],
      answers: ([约束及图形见解析。],),
      explanation: [条件为
        $ cases(7x+6y<=60, x+y>=6, x<=2y, x>=0, y>=0),quad x,y in ZZ. $
        前三个不等式分别来自连续剧时长、广告时长和播放次数比例。对应连续可行域是顶点 $(0,6)$、$(4,2)$、$(6,3)$、$(0,10)$ 围成的四边形（含边界），实际允许的方案为其中的整点。
        #figure(feasible-region())],
    ),
    subquestion(
      stem: [问电视台每周播出甲、乙两套连续剧各多少次，才能使总收视人次最多？],
      answers: ([甲 $6$ 次、乙 $3$ 次，最多 $435$ 万人次。],),
      explanation: [设总收视人次为 $z$ 万，则
        $ z=60x+25y=29/4 (7x+6y)+37/4 (x-2y)<=29/4 times 60=435. $
        取 $(x,y)=(6,3)$ 时满足所有约束，且两项约束同时取等号。因此甲播出 $6$ 次、乙播出 $3$ 次时总收视人次最多。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [如图，在四棱锥 $P-A B C D$ 中，$A D perp$ 平面 $P D C$，$A D parallel B C$，$P D perp P B$，$A D=1$，$B C=3$，$C D=4$，$P D=2$。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [求异面直线 $A P$ 与 $B C$ 所成角的余弦值。],
      answers: ([$sqrt(5)/5$],),
      explanation: [由 $A D parallel B C$，所求角等于直线 $A P$ 与 $A D$ 所成角。又 $A D perp P D$，所以 $A P=sqrt(A D^2+P D^2)=sqrt(5)$，余弦值为 $A D/A P=sqrt(5)/5$。],
    ),
    subquestion(
      stem: [求证：$P D perp$ 平面 $P B C$。],
      answers: ([证明见解析。],),
      explanation: [由 $A D perp$ 平面 $P D C$ 得 $P D perp A D$，再由 $A D parallel B C$ 得 $P D perp B C$。结合已知 $P D perp P B$、$B C inter P B={B}$，可得 $P D perp$ 平面 $P B C$。],
    ),
    subquestion(
      stem: [求直线 $A B$ 与平面 $P B C$ 所成角的正弦值。],
      answers: ([$sqrt(5)/5$],),
      explanation: [过 $D$ 作 $D F parallel A B$，交 $B C$ 于 $F$，连接 $P F$。由平行四边形 $A B F D$，$B F=A D=1$，故 $C F=B C-B F=2$。又 $D C perp B C$，所以 $D F=sqrt(D C^2+C F^2)=2sqrt(5)$。
        由第（2）问，$P F$ 是 $D F$ 在平面 $P B C$ 上的射影，故所求正弦为 $P D/D F=2/(2sqrt(5))=sqrt(5)/5$。
        #figure(pyramid(auxiliary: true))],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [已知 ${a_n}$ 为等差数列，前 $n$ 项和为 $S_n$（$n in NN^*$），${b_n}$ 是首项为 $2$ 的等比数列，且公比大于 $0$，$b_2+b_3=12$，$b_3=a_4-2a_1$，$S_11=11b_4$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 和 ${b_n}$ 的通项公式。],
      answers: ([$a_n=3n-2$，$b_n=2^n$。],),
      explanation: [设公差为 $d$、公比为 $q>0$。由 $2q+2q^2=12$ 得 $(q-2)(q+3)=0$，所以 $q=2$，$b_n=2^n$。再由 $b_3=a_4-2a_1$、$S_11=11b_4$ 得
        $ cases(3d-a_1=8, a_1+5d=16). $
        解得 $d=3,a_1=1$，所以 $a_n=3n-2$。],
    ),
    subquestion(
      stem: [求数列 ${a_(2n)b_n}$ 的前 $n$ 项和（$n in NN^*$）。],
      answers: ([$(3n-4)2^(n+2)+16$],),
      explanation: [设所求和为 $T_n=sum_(k=1)^n (6k-2)2^k$。错位相减得
        $ 2T_n-T_n=(6n-2)2^(n+1)-8-6sum_(k=2)^n 2^k $
        $ =(6n-2)2^(n+1)-8-6(2^(n+1)-4)=(3n-4)2^(n+2)+16. $
        当 $n=1$ 时中间的和为空和，上式仍成立。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设 $a,b in RR$，$abs(a)<=1$。已知函数 $f(x)=x^3-6x^2-3a(a-4)x+b$，$g(x)=e^x f(x)$。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的单调区间。],
      answers: (
        [单调递增区间为 $(-infinity,a)$、$(4-a,+infinity)$，单调递减区间为 $(a,4-a)$。],
      ),
      explanation: [$f'(x)=3(x-a)(x-(4-a))$。由 $-1<=a<=1$ 得 $a<4-a$，所以导数在两根外为正、两根之间为负，得到所述单调区间。],
    ),
    subquestion(
      stem: [已知函数 $y=g(x)$ 和 $y=e^x$ 的图象在公共点 $(x_0,y_0)$ 处有相同的切线。],
      parts: (
        subquestion(
          stem: [求证：$f(x)$ 在 $x=x_0$ 处的导数等于 $0$。],
          answers: ([证明见解析。],),
          explanation: [由公共点条件 $e^(x_0) f(x_0)=e^(x_0)$，得 $f(x_0)=1$。又 $g'(x)=e^x (f(x)+f'(x))$，切线斜率相同给出 $f(x_0)+f'(x_0)=1$，故 $f'(x_0)=0$。],
        ),
        subquestion(
          stem: [若关于 $x$ 的不等式 $g(x)<=e^x$ 在区间 $[x_0-1,x_0+1]$ 上恒成立，求 $b$ 的取值范围。],
          answers: ([$[-7,1]$],),
          explanation: [由于 $e^x>0$，原不等式等价于 $f(x)<=1=f(x_0)$。故 $x_0$ 为极大值点，由第（1）问只能有 $x_0=a$。由 $f(a)=1$ 得 $b=2a^3-6a^2+1$。
            反之，任取 $a in [-1,1]$ 并令 $b=2a^3-6a^2+1$，都有 $f(a)=1$、$f'(a)=0$，且 $a+1<4-a$。由单调性，$f(x)<=f(a)=1$ 在 $[a-1,a+1]$ 上成立，故这些参数全部可取。
            令 $h(a)=2a^3-6a^2+1$，则 $h'(a)=6a(a-2)$，在 $[-1,0]$ 上递增、$[0,1]$ 上递减。由 $h(-1)=-7$、$h(0)=1$、$h(1)=-3$，以及连续性，得 $b in [-7,1]$。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的左焦点为 $F(-c,0)$，右顶点为 $A$，点 $E$ 的坐标为 $(0,c)$，$triangle E F A$ 的面积为 $b^2/2$。],
  parts: (
    subquestion(
      stem: [求椭圆的离心率。],
      answers: ([$1/2$],),
      explanation: [由面积条件 $(a+c)c=b^2=a^2-c^2$，得 $(a-2c)(a+c)=0$。因 $a+c>0$，所以 $a=2c$，离心率为 $c/a=1/2$。],
    ),
    subquestion(
      stem: [设点 $Q$ 在线段 $A E$ 上，$abs(F Q)=3/2 c$，延长线段 $F Q$ 与椭圆交于点 $P$，点 $M,N$ 在 $x$ 轴上，$P M parallel Q N$，且直线 $P M$ 与直线 $Q N$ 间的距离为 $c$，四边形 $P Q N M$ 的面积为 $3c$。],
      parts: (
        subquestion(
          stem: [求直线 $F P$ 的斜率。],
          answers: ([$3/4$],),
          explanation: [由 $a=2c$，线段 $A E$ 所在直线为 $x+2y=2c$。设 $Q=(2c-2t,t)$，其中 $0<=t<=c$。由 $abs(F Q)=3c/2$，得
            $ (3c-2t)^2+t^2=9c^2/4, $
            解得 $t=3c/2$ 或 $t=9c/10$。前者不在线段范围内，故 $Q=(c/5,9c/10)$，直线 $F P$ 的斜率为 $(9c/10)/(c/5+c)=3/4$。],
        ),
        subquestion(
          stem: [求椭圆的方程。],
          answers: ([$x^2/16+y^2/12=1$],),
          explanation: [由 $a=2c$、$b^2=3c^2$，椭圆为 $x^2/(4c^2)+y^2/(3c^2)=1$。与直线 $y=3/4(x+c)$ 联立，得 $7x^2+6c x-13c^2=0$，解得 $x=c$ 或 $x=-13c/7$。在射线 $F Q$ 上的交点为 $P=(c,3c/2)$，所以 $F P=5c/2$，$P Q=F P-F Q=c$。
            两平行线间的距离恰等于连接两线上点 $P,Q$ 的线段长，故 $P Q perp P M$，也有 $P Q perp Q N$。于是两平行线斜率为 $-4/3$，与 $x$ 轴交点分别为 $M=(17c/8,0)$、$N=(7c/8,0)$。从而 $P M=15c/8$、$Q N=9c/8$。梯形 $P Q N M$ 的面积为
            $ 1/2 (15c/8+9c/8)c=3c^2/2=3c. $
            由 $c>0$ 得 $c=2$，因此 $a^2=16,b^2=12$，得到所求椭圆。],
        ),
      ),
    ),
  ),
)
