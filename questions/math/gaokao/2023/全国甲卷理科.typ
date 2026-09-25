#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2023,
  type: "普通高等学校招生全国统一考试",
  name: "全国甲卷（理科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2023/2023全国甲理(广西,贵州,西藏,四川).pdf",
  regions: ("广西", "贵州", "西藏", "四川"),
)

#let flowchart() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.6, 6.85), (0.6, 7.35), radius: 0.25)
  content((0, 7.1), [开始])
  line((-2.95, 6.1), (2.75, 6.1), (2.95, 6.6), (-2.75, 6.6), close: true)
  content((0, 6.35), [输入 $n=3,A=1,B=2,k=1$])
  line((0, 5.7), (1.1, 5.2), (0, 4.7), (-1.1, 5.2), close: true)
  content((0, 5.2), [$k<=n$])
  for (y, label) in ((4.05, $A=A+B$), (3.05, $B=A+B$), (2.05, $k=k+1$)) {
    rect((-1.1, y - 0.25), (1.1, y + 0.25))
    content((0, y), label)
  }
  line((-0.95, 0.75), (0.75, 0.75), (0.95, 1.25), (-0.75, 1.25), close: true)
  content((0, 1), [输出 $B$])
  rect((-0.6, -0.25), (0.6, 0.25), radius: 0.25)
  content((0, 0), [结束])
  for (y1, y2) in (
    (6.85, 6.6),
    (6.1, 5.7),
    (4.7, 4.3),
    (3.8, 3.3),
    (2.8, 2.3),
    (0.75, 0.25),
  ) {
    line((0, y1), (0, y2), mark: (end: ">"))
  }
  line((-1.1, 2.05), (-1.55, 2.05), (-1.55, 5.9), (-0.5, 5.9), mark: (end: ">"))
  line((-0.5, 5.9), (0, 5.9))
  line((1.1, 5.2), (1.75, 5.2), (1.75, 1.5), (0, 1.5), (0, 1.25), mark: (
    end: ">",
  ))
  content((0.15, 4.55), [是], anchor: "west")
  content((1.4, 5.3), [否], anchor: "south")
})

#let intersections() = cetz.canvas(length: 10mm, {
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
    size: (7, 4),
    axis-style: "school-book",
    x-min: -1.2,
    x-max: 3.2,
    y-min: -1.2,
    y-max: 1.2,
    x-tick-step: 1,
    y-tick-step: 1,
    x-label: move(dx: 6pt)[$x$],
    y-label: $y$,
    {
      plot.add(
        x => -calc.sin(2 * x * 1rad),
        domain: (-1.2, 3.2),
        samples: 180,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.add(
        x => x / 2 - 0.5,
        domain: (-1.2, 3.2),
        style: (
          stroke: (
            paint: black,
            thickness: figure-style.thickness,
            dash: figure-style.dash,
          ),
        ),
      )
    },
  )
})

#let prism-diagram() = cetz.canvas(length: 20mm, {
  import cetz.draw: *
  let r = calc.sqrt(2)
  let c = (0, 0, 0)
  let a = (r, 0, 0)
  let b = (0, calc.sqrt(3), 0)
  let a1 = (0, 0, r)
  let b1 = (-r, calc.sqrt(3), r)
  let c1 = (-r, 0, r)
  oblique-project((-0.6, -0.45), (1, 0), (-0.2, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, b1, c1, a1, a)
    line(a1, b1)
    line(a, c, b, stroke: (dash: figure-style.dash))
    line(c1, c, a1, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "west"),
      (c, $C$, "south-west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south"),
    ) { content(p, label, anchor: anchor, padding: 0.08) }
  })
})

#section[选择题。本大题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设全集 $U=ZZ$，集合 $M={x | x=3k+1,k in ZZ}$，$N={x | x=3k+2,k in ZZ}$，则 $complement_U (M union N)=$#choice-placeholder()。],
  choices: (
    [${x | x=3k,k in ZZ}$],
    [${x | x=3k-1,k in ZZ}$],
    [${x | x=3k-2,k in ZZ}$],
    [$emptyset$],
  ),
  answers: ([A],),
  explanation: [整数除以 $3$ 的余数为 $0,1,2$。去掉余数为 $1,2$ 的整数，剩下的恰为 $3$ 的整数倍。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $a in RR$，$(a+"i")(1-a"i")=2$，则 $a=$#choice-placeholder()。],
  choices: ([$-2$], [$-1$], [$1$], [$2$]),
  answers: ([C],),
  explanation: [展开得 $2a+(1-a^2)"i"=2$。比较实部、虚部，得 $2a=2$ 且 $1-a^2=0$，所以 $a=1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图的程序框图，则输出的 $B=$#choice-placeholder()。
    #figure(flowchart())],
  choices: ([$21$], [$34$], [$55$], [$89$]),
  answers: ([B],),
  explanation: [每次先更新 $A$，再用更新后的 $A$ 计算 $B$。三次循环后的 $(A,B,k)$ 依次为 $(3,5,2)$、$(8,13,3)$、$(21,34,4)$。此时 $k>3$，退出循环，输出 $B=34$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知向量 $arrow(a),arrow(b),arrow(c)$ 满足 $abs(arrow(a))=abs(arrow(b))=1$，$abs(arrow(c))=sqrt(2)$，且 $arrow(a)+arrow(b)+arrow(c)=arrow(0)$，则 $cos lr(⟨arrow(a)-arrow(c),arrow(b)-arrow(c)⟩)=$#choice-placeholder()。],
  choices: ([$-4/5$], [$-2/5$], [$2/5$], [$4/5$]),
  answers: ([D],),
  explanation: [由 $abs(arrow(a)+arrow(b))^2=2$，得 $arrow(a) dot arrow(b)=0$。
    又 $arrow(a)-arrow(c)=2arrow(a)+arrow(b)$，$arrow(b)-arrow(c)=arrow(a)+2arrow(b)$，故两向量的模均为 $sqrt(5)$，数量积为 $4$。
    所求余弦值为 $4/(sqrt(5)sqrt(5))=4/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设等比数列 ${a_n}$ 的各项均为正数，前 $n$ 项和为 $S_n$。若 $a_1=1$，$S_5=5S_3-4$，则 $S_4=$#choice-placeholder()。],
  choices: ([$15/8$], [$65/8$], [$15$], [$40$]),
  answers: ([C],),
  explanation: [设公比 $q>0$，由题意得 $q^3+q^4=4q+4q^2$，即 $q(q+1)(q^2-4)=0$，故 $q=2$。
    因此 $S_4=1+2+4+8=15$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某地的中学生中有 $60%$ 的同学爱好滑冰，$50%$ 的同学爱好滑雪，$70%$ 的同学爱好滑冰或爱好滑雪。在该地的中学生中随机调查一位同学，若该同学爱好滑雪，则该同学也爱好滑冰的概率为#choice-placeholder()。],
  choices: ([$0.8$], [$0.6$], [$0.5$], [$0.4$]),
  answers: ([A],),
  explanation: [设爱好滑冰、滑雪分别为事件 $A,B$，则 $P(A B)=P(A)+P(B)-P(A union B)=0.4$。
    所求概率为 $P(A | B)=P(A B)/P(B)=0.4/0.5=0.8$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设甲：$sin^2 alpha+sin^2 beta=1$，乙：$sin alpha+cos beta=0$，则#choice-placeholder()。],
  choices: (
    [甲是乙的充分条件但不是必要条件],
    [甲是乙的必要条件但不是充分条件],
    [甲是乙的充要条件],
    [甲既不是乙的充分条件也不是乙的必要条件],
  ),
  answers: ([B],),
  explanation: [由乙得 $sin alpha=-cos beta$，平方后得到甲，故甲是乙的必要条件。
    取 $alpha=pi/2,beta=0$，甲成立而乙不成立，故甲不是乙的充分条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的离心率为 $sqrt(5)$，$C$ 的一条渐近线与圆 $(x-2)^2+(y-3)^2=1$ 交于 $A,B$ 两点，则 $abs(A B)=$#choice-placeholder()。],
  choices: (
    [$sqrt(5)/5$],
    [$(2sqrt(5))/5$],
    [$(3sqrt(5))/5$],
    [$(4sqrt(5))/5$],
  ),
  answers: ([D],),
  explanation: [由 $1+b^2/a^2=5$，得渐近线为 $y=plus.minus 2x$。
    圆心 $(2,3)$ 到 $y=-2x$ 的距离为 $7/sqrt(5)>1$，故相交的渐近线为 $y=2x$，圆心到它的距离为 $1/sqrt(5)$。
    因此 $abs(A B)=2sqrt(1-1/5)=(4sqrt(5))/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [现有 5 名志愿者报名参加公益活动，在某一星期的星期六、星期日两天，每天从这 5 人中安排 2 人参加公益活动，则恰有 1 人在这两天都参加的不同安排方式共有#choice-placeholder()。],
  choices: ([120 种], [60 种], [30 种], [20 种]),
  answers: ([B],),
  explanation: [先选出连续参加两天的志愿者，有 $5$ 种方法；再依次选出仅参加星期六、仅参加星期日的两人，有 $4 times 3$ 种方法。共 $5 times 4 times 3=60$ 种。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $y=f(x)$ 的图象由函数 $y=cos(2x+pi/6)$ 的图象向左平移 $pi/6$ 个单位长度得到，则 $y=f(x)$ 的图象与直线 $y=x/2-1/2$ 的交点个数为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([C],),
  explanation: [平移后 $f(x)=cos(2(x+pi/6)+pi/6)=-sin 2x$。
    由 $-1<=f(x)<=1$，交点横坐标只能在 $[-1,3]$ 内。在 $[-1,0]$ 上 $f(x)>=0>x/2-1/2$，没有交点。
    令 $h(x)=-sin 2x-x/2+1/2$，则 $h'(x)=-2cos 2x-1/2$。
    记 $t=1/2 arccos(-1/4)$，则 $pi/4<t<pi/2$。$h$ 在 $[0,t]$ 上递减，在 $[t,pi-t]$ 上递增，在 $[pi-t,3]$ 上递减。
    又 $h(0)>0$，$h(t)<=h(pi/4)<0$，$h(pi-t)>=h((3pi)/4)>0$，$h(3)=-sin 6-1<0$，故三个单调区间内各有且仅有一个零点，共 $3$ 个交点。
    #figure(intersections())],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知四棱锥 $P-A B C D$ 的底面是边长为 $4$ 的正方形，$P C=P D=3$，$angle P C A=45 degree$，则 $triangle P B C$ 的面积为#choice-placeholder()。],
  choices: ([$2sqrt(2)$], [$3sqrt(2)$], [$4sqrt(2)$], [$6sqrt(2)$]),
  answers: ([C],),
  explanation: [取 $C=(0,0,0)$，$D=(4,0,0)$，$B=(0,4,0)$，$A=(4,4,0)$，设 $P=(u,v,w)$。
    由 $P C=P D$ 得 $u=2$。由
    $ cos angle P C A=(4u+4v)/(3 times 4sqrt(2))=sqrt(2)/2 $
    得 $u+v=3$，故 $v=1$。于是 $u^2+w^2=P C^2-v^2=8$，$P$ 到直线 $B C$ 的距离为 $2sqrt(2)$。
    所求面积为 $1/2 times 4 times 2sqrt(2)=4sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $O$ 为坐标原点，$F_1,F_2$ 为椭圆 $C:x^2/9+y^2/6=1$ 的两个焦点，点 $P$ 在 $C$ 上，$cos angle F_1 P F_2=3/5$，则 $abs(O P)=$#choice-placeholder()。],
  choices: ([$13/5$], [$sqrt(30)/2$], [$14/5$], [$sqrt(35)/2$]),
  answers: ([B],),
  explanation: [设 $r_1=abs(P F_1),r_2=abs(P F_2)$，则 $r_1+r_2=6$，$abs(F_1 F_2)=2sqrt(3)$。
    由余弦定理，$r_1^2+r_2^2-6/5 r_1 r_2=12$，联立得 $r_1 r_2=15/2$，$r_1^2+r_2^2=21$。
    因 $O$ 为 $F_1 F_2$ 的中点，中线定理给出 $abs(O P)^2=(r_1^2+r_2^2)/2-abs(F_1 F_2)^2/4=15/2$，故 $abs(O P)=sqrt(30)/2$。],
)

#section[填空题。本大题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [若 $f(x)=(x-1)^2+a x+sin(x+pi/2)$ 为偶函数，则 $a=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [$f(x)=x^2+1+cos x+(a-2)x$。前三项为偶函数，故须且只须 $a-2=0$，即 $a=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(3x-2y<=3, -2x+3y<=3, x+y>=1)$，则 $z=3x+2y$ 的最大值为#fill-placeholder()。],
  answers: ([$15$],),
  explanation: [将前两个不等式分别乘 $13/5$、$12/5$ 后相加，得
    $ 3x+2y=13/5(3x-2y)+12/5(-2x+3y)<=15. $
    当 $x=y=3$ 时满足全部约束，且取等号，故最大值为 $15$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$E,F$ 分别为 $A B,C_1 D_1$ 的中点。以 $E F$ 为直径的球的球面与该正方体的棱共有#fill-placeholder() 个公共点。],
  answers: ([$12$],),
  explanation: [设正方体棱长为 $2$。$E F$ 的中点为正方体中心，$E F=2sqrt(2)$，故球半径为 $sqrt(2)$。
    正方体中心到每条棱的距离都为 $sqrt(2)$，垂足为该棱中点，故球面与每条棱恰有一个公共点。十二条棱的中点互不相同，所以共有 $12$ 个。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $triangle A B C$ 中，$angle B A C=60 degree$，$A B=2$，$B C=sqrt(6)$，$angle B A C$ 的角平分线交 $B C$ 于 $D$，则 $A D=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [设 $A C=b>0$，由余弦定理，$6=4+b^2-2b$，得 $b=1+sqrt(3)$。
    由 $S_(triangle A B C)=S_(triangle A B D)+S_(triangle A C D)$，得
    $ 1/2 times 2b sin 60 degree=1/2(2+b)A D sin 30 degree. $
    故 $A D=(2sqrt(3)b)/(b+2)=2$。],
)

#section[解答题。本大题共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17—21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [记 $S_n$ 为数列 ${a_n}$ 的前 $n$ 项和，已知 $a_2=1$，$2S_n=n a_n$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=n-1$（$n in NN^+$）。],),
      explanation: [令 $n=1$，得 $2a_1=a_1$，故 $a_1=0$。
        当 $n>=3$ 时，相邻两式相减得 $2a_n=n a_n-(n-1)a_(n-1)$，从而
        $ a_n/(n-1)=a_(n-1)/(n-2)=dots.c=a_2=1. $
        所以 $a_n=n-1$，且 $n=1,2$ 时也成立。],
    ),
    subquestion(
      stem: [求数列 ${a_(n+1)/2^n}$ 的前 $n$ 项和 $T_n$。],
      answers: ([$T_n=2-(n+2)/2^n$。],),
      explanation: [由第（1）问，$T_n=sum_(k=1)^n k/2^k$。错位相减，得
        $ T_n-1/2 T_n=sum_(k=1)^n 1/2^k-n/2^(n+1)=1-1/2^n-n/2^(n+1). $
        故 $T_n=2-(n+2)/2^n$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在三棱柱 $A B C-A_1 B_1 C_1$ 中，$A_1 C perp$ 平面 $A B C$，$angle A C B=90 degree$，$A A_1=2$，$A_1$ 到平面 $B C C_1 B_1$ 的距离为 $1$。
    #figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [证明：$A_1 C=A C$。],
      answers: ([证明见解析。],),
      explanation: [$B C perp A C$，$B C perp A_1 C$，故 $B C perp$ 平面 $A C C_1 A_1$。
        在平面 $A C C_1 A_1$ 内，作 $A_1 H perp C C_1$，则 $A_1 H perp B C$，从而 $A_1 H perp$ 平面 $B C C_1 B_1$，故 $A_1 H=1$。
        设 $A_1 C=u$，$A C=A_1 C_1=v$。在直角三角形 $A_1 C C_1$ 中，$C C_1=2$，所以
        $ u^2+v^2=4, quad 1/2 u v=1/2 times 2 times 1. $
        因而 $u v=2$，$(u-v)^2=4-4=0$，即 $A_1 C=A C=sqrt(2)$。],
    ),
    subquestion(
      stem: [已知 $A A_1$ 与 $B B_1$ 的距离为 $2$，求 $A B_1$ 与平面 $B C C_1 B_1$ 所成角的正弦值。],
      answers: ([$sqrt(13)/13$],),
      explanation: [取 $C$ 为原点，分别以 $C A,C B,C A_1$ 为坐标轴正方向，设 $B C=b>0$。则
        $
          A=(sqrt(2),0,0), quad A_1=(0,0,sqrt(2)), quad B=(0,b,0), quad B_1=(-sqrt(2),b,sqrt(2)).
        $
        两条平行直线 $A A_1,B B_1$ 的距离等于 $B$ 到 $A A_1$ 的距离。$B$ 到 $A A_1$ 的垂足是其中点，故 $b^2+1=4$，得 $b=sqrt(3)$。
        平面 $B C C_1 B_1$ 的法向量可取 $arrow(n)=(1,0,1)$，$arrow(A B_1)=(-2sqrt(2),sqrt(3),sqrt(2))$。
        所求角 $theta$ 的正弦值为
        $
          sin theta=abs(arrow(A B_1) dot arrow(n))/(abs(arrow(A B_1))abs(arrow(n)))=sqrt(2)/(sqrt(13)sqrt(2))=sqrt(13)/13.
        $
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [一项试验旨在研究臭氧效应，试验方案如下：选 40 只小白鼠，随机地将其中 20 只分配到试验组，另外 20 只分配到对照组。试验组的小白鼠饲养在高浓度臭氧环境，对照组的小白鼠饲养在正常环境，一段时间后统计每只小白鼠体重的增加量（单位：$"g"$）。],
  parts: (
    subquestion(
      stem: [设 $X$ 表示指定的两只小白鼠中分配到对照组的只数，求 $X$ 的分布列和数学期望。],
      answers: (
        [
          #table(
            columns: 4,
            align: center + horizon,
            [$X$], [$0$], [$1$], [$2$],
            [$P$], [$19/78$], [$20/39$], [$19/78$],
          )
          $E(X)=1$。
        ],
      ),
      explanation: [$X$ 的可能取值为 $0,1,2$，且
        $ P(X=k)=(binom(20, k)binom(20, 2-k))/binom(40, 2) quad (k=0,1,2). $
        分别得 $19/78,20/39,19/78$。故 $E(X)=0 times 19/78+20/39+2 times 19/78=1$。],
    ),
    subquestion(
      stem: [试验结果如下。
        对照组的小白鼠体重的增加量从小到大排序为
        #table(
          columns: 10,
          stroke: none,
          inset: 3pt,
          align: center,
          [15.2],
          [18.8],
          [20.2],
          [21.3],
          [22.5],
          [23.2],
          [25.8],
          [26.5],
          [27.5],
          [30.1],

          [32.6],
          [34.3],
          [34.8],
          [35.6],
          [35.6],
          [35.8],
          [36.2],
          [37.3],
          [40.5],
          [43.2],
        )
        试验组的小白鼠体重的增加量从小到大排序为
        #table(
          columns: 10,
          stroke: none,
          inset: 3pt,
          align: center,
          [7.8],
          [9.2],
          [11.4],
          [12.4],
          [13.2],
          [15.5],
          [16.5],
          [18.0],
          [18.8],
          [19.2],

          [19.8],
          [20.2],
          [21.6],
          [22.8],
          [23.6],
          [23.9],
          [25.1],
          [28.2],
          [32.3],
          [36.5],
        )
      ],
      parts: (
        subquestion(
          stem: [求 40 只小白鼠体重的增加量的中位数 $m$，再分别统计两样本中小于 $m$ 与不小于 $m$ 的数据的个数，完成如下列联表。
            #table(
              columns: (auto, 45pt, 45pt),
              align: center + horizon,
              [], [$<m$], [$>=m$],
              [对照组], [], [],
              [试验组], [], [],
            )
          ],
          answers: (
            [$m=23.4$；
              #table(
                columns: 3,
                align: center + horizon,
                [], [$<m$], [$>=m$],
                [对照组], [$6$], [$14$],
                [试验组], [$14$], [$6$],
              )
            ],
          ),
          explanation: [将两组数据合并排序，第 $20$、$21$ 个数分别为 $23.2,23.6$，故 $m=(23.2+23.6)/2=23.4$。
            对照组小于 $m$ 的有 $6$ 个，不小于 $m$ 的有 $14$ 个；试验组相应为 $14$ 个、$6$ 个。],
        ),
        subquestion(
          stem: [根据上一问中的列联表，能否有 $95%$ 的把握认为小白鼠在高浓度臭氧环境中与在正常环境中体重的增加量有差异？
            附：$K^2=(n(a d-b c)^2)/((a+b)(c+d)(a+c)(b+d))$。
            #table(
              columns: 4,
              align: center + horizon,
              [$P(K^2>=k)$], [$0.100$], [$0.050$], [$0.010$],
              [$k$], [$2.706$], [$3.841$], [$6.635$],
            )
          ],
          answers: ([能。],),
          explanation: [由列联表得
            $
              K^2=(40(6 times 6-14 times 14)^2)/(20 times 20 times 20 times 20)=6.4>3.841.
            $
            因此能有 $95%$ 的把握认为两种环境中小白鼠体重的增加量有差异。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知直线 $x-2y+1=0$ 与抛物线 $C:y^2=2p x$（$p>0$）交于 $A,B$ 两点，$abs(A B)=4sqrt(15)$。],
  parts: (
    subquestion(
      stem: [求 $p$。],
      answers: ([$2$],),
      explanation: [联立得 $y^2-4p y+2p=0$。设交点纵坐标为 $y_1,y_2$，则
        $ (y_1-y_2)^2=16p^2-8p, quad abs(A B)^2=5(y_1-y_2)^2=240. $
        故 $2p^2-p-6=0$，由 $p>0$ 得 $p=2$。],
    ),
    subquestion(
      stem: [设 $F$ 为 $C$ 的焦点，$M,N$ 为 $C$ 上两点，且 $arrow(F M) dot arrow(F N)=0$，求 $triangle M F N$ 面积的最小值。],
      answers: ([$12-8sqrt(2)$],),
      explanation: [#step[用弦的参数表示面积][
          此时 $C:y^2=4x$，$F=(1,0)$。水平直线与抛物线只有一个交点，故可设 $M N:x=u y+v$。
          设两交点纵坐标为 $y_1,y_2$，则 $y_1+y_2=4u$，$y_1 y_2=-4v$。
          由 $arrow(F M) dot arrow(F N)=0$，得
          $ (u y_1+v-1)(u y_2+v-1)+y_1 y_2=0, quad 4u^2=v^2-6v+1. $
          因此 $v<=3-2sqrt(2)$ 或 $v>=3+2sqrt(2)$，且 $4(u^2+v)=(v-1)^2>0$。
          $F$ 到直线的距离为 $abs(v-1)/sqrt(1+u^2)$，弦长为
          $ abs(M N)=sqrt(1+u^2)sqrt(16u^2+16v)=2sqrt(1+u^2)abs(v-1). $
          故三角形面积为 $S=(v-1)^2$。
        ]
        #step[求最小值并检验等号][
          在上述取值范围内，$v=3-2sqrt(2)$ 时 $(v-1)^2$ 最小，等于 $12-8sqrt(2)$。
          此时 $u=0$，直线 $x=3-2sqrt(2)>0$ 与抛物线有两个交点，且满足数量积条件，故最小值能够取得。
        ]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=a x-(sin x)/(cos^3 x)$，$x in (0,pi/2)$。],
  parts: (
    subquestion(
      stem: [当 $a=8$ 时，讨论 $f(x)$ 的单调性。],
      answers: ([在 $(0,pi/4)$ 上单调递增，在 $(pi/4,pi/2)$ 上单调递减。],),
      explanation: [求导得 $f'(x)=a-(3-2cos^2 x)/(cos^4 x)$。
        当 $a=8$ 时，令 $t=cos^2 x in (0,1)$，则
        $ f'(x)=((2t-1)(4t+3))/t^2. $
        所以 $0<x<pi/4$ 时 $f'(x)>0$，$pi/4<x<pi/2$ 时 $f'(x)<0$，故单调性如答案所述。],
    ),
    subquestion(
      stem: [若 $f(x)<sin 2x$ 恒成立，求 $a$ 的取值范围。],
      answers: ([$(-infinity,3]$],),
      explanation: [#step[求导并判断符号][
          令 $g(x)=a x-(sin x)/(cos^3 x)-sin 2x$，并补充定义 $g(0)=0$。
          设 $t=cos^2 x in (0,1)$，则
          $ g'(x)=a+2-4t+2/t-3/t^2=a-3-((1-t)^2(4t+3))/t^2<a-3. $
        ]
        #step[充分性与必要性][
          若 $a<=3$，则 $g'(x)<0$，从而 $g(x)<g(0)=0$，满足题意。
          若 $a>3$，则 $g'(0)=a-3>0$，由连续性，$g$ 在 $0$ 右侧某个小区间内递增，故该区间内 $g(x)>0$，不符合题意。
          综上，$a in (-infinity,3]$。
        ]],
    ),
  ),
)
#block(
  sticky: true,
)[请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。#linebreak()
    已知点 $P(2,1)$，直线 $l:cases(x=2+t cos alpha, y=1+t sin alpha)$（$t$ 为参数），$alpha$ 为 $l$ 的倾斜角。$l$ 与 $x$ 轴正半轴、$y$ 轴正半轴分别交于点 $A,B$，且 $abs(P A) dot abs(P B)=4$。],
  parts: (
    subquestion(
      stem: [求 $alpha$。],
      answers: ([$(3pi)/4$],),
      explanation: [由两截距均为正数，得 $pi/2<alpha<pi$。$A,B$ 对应的参数分别为 $-1/(sin alpha)$、$-2/(cos alpha)$。
        因参数方向向量为单位向量，故
        $ abs(P A)abs(P B)=abs(2/(sin alpha cos alpha))=4/abs(sin 2alpha)=4. $
        于是 $sin 2alpha=-1$，结合倾斜角范围得 $alpha=(3pi)/4$。],
    ),
    subquestion(
      stem: [以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，求 $l$ 的极坐标方程。],
      answers: ([$rho cos theta+rho sin theta=3$],),
      explanation: [由第（1）问，直线斜率为 $-1$，且过点 $(2,1)$，故直角坐标方程为 $x+y=3$。
        代入 $x=rho cos theta,y=rho sin theta$，得 $rho cos theta+rho sin theta=3$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。#linebreak()设 $a>0$，函数 $f(x)=2abs(x-a)-a$。],
  parts: (
    subquestion(
      stem: [求不等式 $f(x)<x$ 的解集。],
      answers: ([$(a/3,3a)$],),
      explanation: [当 $x<=a$ 时，不等式化为 $a-2x<x$，得 $a/3<x<=a$。
        当 $x>a$ 时，不等式化为 $2x-3a<x$，得 $a<x<3a$。
        合并得解集为 $(a/3,3a)$。],
    ),
    subquestion(
      stem: [若曲线 $y=f(x)$ 与 $x$ 轴所围成的图形的面积为 $2$，求 $a$。],
      answers: ([$2$],),
      explanation: [图象的顶点为 $(a,-a)$，与 $x$ 轴的两个交点为 $(a/2,0)$、$((3a)/2,0)$。
        所围三角形的底为 $a$，高为 $a$，故 $a^2/2=2$。结合 $a>0$ 得 $a=2$。],
    ),
  ),
)
