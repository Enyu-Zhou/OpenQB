#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019天津文.pdf",
  regions: ("天津",),
)

#let flowchart() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.65, 8.3), (0.65, 8.9), radius: 0.18)
  content((0, 8.6), [开始])
  rect((-1.2, 7.2), (1.2, 7.8))
  content((0, 7.5), [$i=1,S=0$])
  line((0, 6.7), (1.65, 6.2), (0, 5.7), (-1.65, 6.2), close: true)
  content((0, 6.2), [$i$ 为偶数？])
  rect((-0.75, 4.4), (0.75, 5.1))
  content((0, 4.75), [$j=i/2$])
  rect((-1.3, 3.3), (1.3, 3.9))
  content((0, 3.6), [$S=S+i dot 2^j$])
  rect((1.8, 4.45), (4.2, 5.05))
  content((3, 4.75), [$S=S+i$])
  rect((-1, 2.2), (1, 2.8))
  content((0, 2.5), [$i=i+1$])
  line((0, 1.7), (1.15, 1.25), (0, 0.8), (-1.15, 1.25), close: true)
  content((0, 1.25), [$i>=4?$])
  line((-0.9, -0.3), (0.7, -0.3), (0.9, 0.3), (-0.7, 0.3), close: true)
  content((0, 0), [输出 $S$])
  rect((-0.65, -1.4), (0.65, -0.8), radius: 0.18)
  content((0, -1.1), [结束])
  for (a, b) in (
    (8.3, 7.8),
    (7.2, 6.7),
    (5.7, 5.1),
    (4.4, 3.9),
    (3.3, 2.8),
    (2.2, 1.7),
    (0.8, 0.3),
    (-0.3, -0.8),
  ) { line((0, a), (0, b), mark: (end: ">")) }
  line((1.65, 6.2), (3, 6.2), (3, 5.05), mark: (end: ">"))
  line((3, 4.45), (3, 3.05), (0.2, 3.05), mark: (end: ">"))
  line((0.2, 3.05), (0, 3.05))
  line((-1.15, 1.25), (-2.1, 1.25), (-2.1, 6.95), (-0.2, 6.95), mark: (
    end: ">",
  ))
  line((-0.2, 6.95), (0, 6.95))
  content((0.2, 5.45), [是], anchor: "west")
  content((2, 6.3), [否], anchor: "south")
  content((-1.55, 1.4), [否], anchor: "south")
  content((0.2, 0.55), [是], anchor: "west")
})

#let pyramid-diagram(auxiliary: false) = cetz.canvas(length: 19mm, {
  import cetz.draw: *
  let p = (0, 0, 0)
  let c = (2, 0, 0)
  let d = (1, calc.sqrt(3), 0)
  let a = (0, 0, calc.sqrt(5))
  let b = (1, -calc.sqrt(3), calc.sqrt(5))
  let g = (0.5, -calc.sqrt(3) / 2, calc.sqrt(5) / 2)
  let h = (1, 0, calc.sqrt(5) / 2)
  let n = (1, 0, 0)
  oblique-project((-0.4, -1), (0.866, -0.462), (0.045, -0.38), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, b, c, d, p, c)
    line(p, a, b, stroke: (dash: figure-style.dash))
    line(a, d, stroke: (dash: figure-style.dash))
    line(a, c, stroke: (dash: figure-style.dash))
    line(g, h)
    if auxiliary {
      line(d, n)
      line(a, n, stroke: (dash: figure-style.dash))
      line(b, d, stroke: (dash: figure-style.dash))
      content((1.15, 0, 0), $N$, anchor: "west", padding: 2pt)
    }
    for (point, label, anchor) in (
      (p, $P$, "south"),
      (a, $A$, "south-west"),
      (b, $B$, "east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (g, $G$, "south-east"),
      (h, $H$, "north-west"),
    ) { content(point, label, anchor: anchor, padding: 3pt) }
  })
})
#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={-1,1,2,3,5}$，$B={2,3,4}$，$C={x in RR | 1<=x<3}$，则 $(A inter C) union B=$#choice-placeholder()。],
  choices: ([${2}$], [${2,3}$], [${-1,2,3}$], [${1,2,3,4}$]),
  answers: ([D],),
  explanation: [$A inter C={1,2}$，故 $(A inter C) union B={1,2,3,4}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设变量 $x,y$ 满足约束条件 $cases(x+y-2<=0, x-y+2>=0, x>=-1, y>=-1)$，则目标函数 $z=-4x+y$ 的最大值为#choice-placeholder()。],
  choices: ([$2$], [$3$], [$5$], [$6$]),
  answers: ([C],),
  explanation: [由 $y<=x+2$、$x>=-1$，得 $z=-4x+y<=-3x+2<=5$。当 $(x,y)=(-1,1)$ 时满足所有约束，且 $z=5$，故最大值为 $5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $x in RR$，则“$0<x<5$”是“$|x-1|<1$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充要条件],
    [既不充分也不必要条件],
  ),
  answers: ([B],),
  explanation: [两条件分别等价于 $0<x<5$、$0<x<2$。后者能推出前者，而前者不能推出后者，如 $x=3$。故为必要而不充分条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [阅读如图的程序框图，运行相应的程序，输出 $S$ 的值为#choice-placeholder()。
    #figure(flowchart())],
  choices: ([$5$], [$8$], [$24$], [$29$]),
  answers: ([B],),
  explanation: [初始 $i=1,S=0$。当 $i=1$ 时执行 $S=S+i$，得 $S=1$；当 $i=2$ 时，$j=1$，得 $S=1+2 times 2=5$；当 $i=3$ 时，得 $S=5+3=8$。随后 $i=4$，满足退出条件，输出 $8$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知 $a=log_2 7$，$b=log_3 8$，$c=0.3^(0.2)$，则 $a,b,c$ 的大小关系为#choice-placeholder()。],
  choices: ([$c<b<a$], [$a<b<c$], [$b<c<a$], [$c<a<b$]),
  answers: ([A],),
  explanation: [$0<c<1$，$1<b=log_3 8<log_3 9=2$，$a=log_2 7>log_2 4=2$，故 $c<b<a$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知抛物线 $y^2=4x$ 的焦点为 $F$，准线为 $l$。若 $l$ 与双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的两条渐近线分别交于点 $A$ 和点 $B$，且 $|A B|=4|O F|$（$O$ 为原点），则双曲线的离心率为#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$sqrt(3)$], [$2$], [$sqrt(5)$]),
  answers: ([D],),
  explanation: [$F=(1,0)$，$l:x=-1$。渐近线 $y=plus.minus b/a x$ 与 $l$ 的两交点纵坐标为 $plus.minus b/a$，故 $|A B|=2b/a=4$，得 $b=2a$。
    离心率 $e=sqrt(a^2+b^2)/a=sqrt(5)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=A sin(omega x+phi)$（$A>0,omega>0,|phi|<pi$）是奇函数，且 $f(x)$ 的最小正周期为 $pi$，将 $y=f(x)$ 的图象上所有点的横坐标伸长到原来的 $2$ 倍（纵坐标不变），所得图象对应的函数为 $g(x)$。若 $g(pi/4)=sqrt(2)$，则 $f((3pi)/8)=$#choice-placeholder()。],
  choices: ([$-2$], [$-sqrt(2)$], [$sqrt(2)$], [$2$]),
  answers: ([C],),
  explanation: [∵ $f(0)=0$ 且 $|phi|<pi$，∴ $phi=0$。于是 $g(x)=A sin((omega x)/2)$，由 $f(x)$ 的最小正周期为 $pi$ 得 $omega=2$。由 $A sin(pi/4)=sqrt(2)$ 得 $A=2$，故 $f((3pi)/8)=2sin((3pi)/4)=sqrt(2)$。],
)

#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=cases(2sqrt(x) & quad 0<=x<=1, 1/x & quad x>1)$。若关于 $x$ 的方程 $f(x)=-1/4 x+a$（$a in RR$）恰有两个互异的实数解，则 $a$ 的取值范围为#choice-placeholder()。],
  choices: (
    [$[5/4,9/4]$],
    [$(5/4,9/4]$],
    [$(5/4,9/4] union {1}$],
    [$[5/4,9/4] union {1}$],
  ),
  answers: ([D],),
  explanation: [令 $h(x)=f(x)+x/4$，原方程等价于 $h(x)=a$。
    #step[分别统计两段的根数][在 $[0,1]$ 上，$h(x)=2sqrt(x)+x/4$ 严格递增，值域为 $[0,9/4]$，故当且仅当 $a in [0,9/4]$ 时有一个根。
      在 $(1,+infinity)$ 上，$h(x)=1/x+x/4$，导数为 $1/4-1/x^2$，故在 $(1,2)$ 上递减，在 $(2,+infinity)$ 上递增。最小值为 $h(2)=1$，且当 $x$ 从右趋于 $1$ 时 $h(x)$ 趋于 $5/4$，此端点不取。]
    #step[合并计数][当 $a<1$ 时，后一段无根；$a=1$ 时有一个根；$1<a<5/4$ 时有两个根；$a>=5/4$ 时有一个根。
      结合前一段，恰有两个互异实根的参数范围为 $[5/4,9/4] union {1}$。]],
)
#section[填空题：本题共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [$i$ 是虚数单位，则 $|(5-i)/(1+i)|$ 的值为#fill-placeholder()。],
  answers: ([$sqrt(13)$],),
  explanation: [$|(5-i)/(1+i)|=frac(|5-i|, |1+i|)=sqrt(26)/sqrt(2)=sqrt(13)$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设 $x in RR$，使不等式 $3x^2+x-2<0$ 成立的 $x$ 的取值范围为#fill-placeholder()。],
  answers: ([$(-1,2/3)$],),
  explanation: [原不等式等价于 $(x+1)(3x-2)<0$，解得 $-1<x<2/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [曲线 $y=cos x-x/2$ 在点 $(0,1)$ 处的切线方程为#fill-placeholder()。],
  answers: ([$x+2y-2=0$],),
  explanation: [$y'=-sin x-1/2$，在 $x=0$ 处的导数为 $-1/2$。切线方程为 $y-1=-x/2$，即 $x+2y-2=0$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知四棱锥的底面是边长为 $sqrt(2)$ 的正方形，侧棱长均为 $sqrt(5)$。若圆柱的一个底面的圆周经过四棱锥四条侧棱的中点，另一个底面的圆心为四棱锥底面的中心，则该圆柱的体积为#fill-placeholder()。],
  answers: ([$pi/4$],),
  explanation: [四棱锥顶点在底面上的射影为正方形中心。底面外接圆半径为 $1$，故四棱锥的高为 $sqrt(5-1)=2$。
    过四条侧棱中点的截面与底面相似，相似比为 $1/2$。故圆柱底面半径为 $1/2$、高为 $1$，体积为 $pi times (1/2)^2 times 1=pi/4$。],
)

#question(
  "fill-in",
  score: 5,
  stem: [设 $x>0,y>0,x+2y=4$，则 $((x+1)(2y+1))/(x y)$ 的最小值为#fill-placeholder()。],
  answers: ([$9/2$],),
  explanation: [由 $x+2y=4>=2sqrt(2x y)$ 得 $x y<=2$。原式 $=(2x y+5)/(x y)=2+5/(x y)>=9/2$，当 $x=2,y=1$ 时等号成立，故最小值为 $9/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在四边形 $A B C D$ 中，$A D parallel B C$，$A B=2sqrt(3)$，$A D=5$，$angle A=30 degree$，点 $E$ 在线段 $C B$ 的延长线上，且 $A E=B E$，则 $arrow(B D) dot arrow(A E)=$#fill-placeholder()。],
  answers: ([$-1$],),
  explanation: [取 $A=(0,0)$、$D=(5,0)$，不妨设 $B=(3,sqrt(3))$。∵ $E$ 在 $C B$ 的延长线上，设 $B E=t>0$，则 $E=(3-t,sqrt(3))$。
    由 $A E=B E$ 得 $(3-t)^2+3=t^2$，解得 $t=2$，故 $E=(1,sqrt(3))$。
    于是 $arrow(B D)=(2,-sqrt(3))$，$arrow(A E)=(1,sqrt(3))$，数量积为 $2-3=-1$。],
)

#section[解答题：本题共 6 小题，共 80 分。解答应写出文字说明、演算步骤或证明过程。]
#question(
  "solution",
  score: 13,
  stem: [2019 年，我国施行个人所得税专项附加扣除办法，涉及子女教育、继续教育、大病医疗、住房贷款利息或者住房租金、赡养老人等六项专项附加扣除。某单位老、中、青员工分别有 $72,108,120$ 人，现采用分层抽样的方法，从该单位上述员工中抽取 $25$ 人调查专项附加扣除的享受情况。],
  parts: (
    subquestion(
      stem: [应从老、中、青员工中分别抽取多少人？],
      answers: ([分别抽取 6 人、9 人、10 人。],),
      explanation: [员工总数为 $72+108+120=300$，抽样比例为 $25/300=1/12$。故老、中、青员工分别抽取 $72/12=6$ 人、$108/12=9$ 人、$120/12=10$ 人。],
    ),
    subquestion(
      stem: [抽取的 25 人中，享受至少两项专项附加扣除的员工有 6 人，分别记为 $A,B,C,D,E,F$。享受情况如下表，其中“○”表示享受，“×”表示不享受。现从这 6 人中随机抽取 2 人接受采访。
        #table(
          columns: 7,
          align: center,
          [项目／员工], [$A$], [$B$], [$C$], [$D$], [$E$], [$F$],
          [子女教育], [○], [○], [×], [○], [×], [○],
          [继续教育], [×], [×], [○], [×], [○], [○],
          [大病医疗], [×], [×], [×], [○], [×], [×],
          [住房贷款利息], [○], [○], [×], [×], [○], [○],
          [住房租金], [×], [×], [○], [×], [×], [×],
          [赡养老人], [○], [○], [×], [×], [×], [○],
        )],
      parts: (
        subquestion(
          stem: [试用所给字母列举出所有可能的抽取结果。],
          answers: ([共 15 种，列举见解析。],),
          explanation: [所有可能的抽取结果为
            $
              {A,B},{A,C},{A,D},{A,E},{A,F}, \
              {B,C},{B,D},{B,E},{B,F}, \
              {C,D},{C,E},{C,F},{D,E},{D,F},{E,F},
            $
            共 $15$ 种。],
        ),
        subquestion(
          stem: [设 $M$ 为事件“抽取的 2 人享受的专项附加扣除至少有一项相同”，求事件 $M$ 发生的概率。],
          answers: ([$11/15$],),
          explanation: [各抽取结果等可能。两人没有任何一项共同享受的结果为 ${A,C},{B,C},{C,D},{D,E}$，共 $4$ 种，故 $P(M)=1-4/15=11/15$。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [在 $triangle A B C$ 中，内角 $A,B,C$ 所对的边分别为 $a,b,c$。已知 $b+c=2a$，$3c sin B=4a sin C$。],
  parts: (
    subquestion(
      stem: [求 $cos B$ 的值。],
      answers: ([$-1/4$],),
      explanation: [由正弦定理，$c sin B=b sin C$，故 $3b=4a$。结合 $b+c=2a$，得 $b=4/3 a,c=2/3 a$。
        由余弦定理，$cos B=(a^2+c^2-b^2)/(2a c)=-1/4$。],
    ),
    subquestion(
      stem: [求 $sin(2B+pi/6)$ 的值。],
      answers: ([$-(3sqrt(5)+7)/16$],),
      explanation: [∵ $B in (0,pi)$，∴ $sin B=sqrt(15)/4$，从而 $sin 2B=-sqrt(15)/8$，$cos 2B=-7/8$。
        故 $sin(2B+pi/6)=sin 2B cos(pi/6)+cos 2B sin(pi/6)=-(3sqrt(5)+7)/16$。],
    ),
  ),
)

#question(
  "solution",
  score: 13,
  stem: [如图，在四棱锥 $P-A B C D$ 中，底面 $A B C D$ 为平行四边形，$triangle P C D$ 为等边三角形，平面 $P A C perp$ 平面 $P C D$，$P A perp C D$，$C D=2$，$A D=3$。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [设 $G,H$ 分别为 $P B,A C$ 的中点，求证：$G H parallel$ 平面 $P A D$。],
      answers: ([证明见解析。],),
      explanation: [连接 $B D$。平行四边形的对角线互相平分，故 $H$ 也是 $B D$ 的中点。于是 $G H$ 是 $triangle B P D$ 的中位线，$G H parallel P D$。又 $P D subset$ 平面 $P A D$，$G H$ 不在平面 $P A D$ 内，故 $G H parallel$ 平面 $P A D$。],
    ),
    subquestion(
      stem: [求证：$P A perp$ 平面 $P C D$。],
      answers: ([证明见解析。],),
      explanation: [取 $P C$ 中点 $N$，连接 $D N$。由等边三角形性质得 $D N perp P C$。∵ 平面 $P A C perp$ 平面 $P C D$，交线为 $P C$，∴ $D N perp$ 平面 $P A C$，从而 $D N perp P A$。
        又 $P A perp C D$，$D N inter C D=D$，故 $P A perp$ 平面 $P C D$。],
    ),
    subquestion(
      stem: [求直线 $A D$ 与平面 $P A C$ 所成角的正弦值。],
      answers: ([$sqrt(3)/3$],),
      explanation: [连接 $A N$。由第（2）问中的 $D N perp$ 平面 $P A C$，可知 $D$ 在此平面上的射影为 $N$，故 $angle D A N$ 为所求线面角。
        等边三角形 $P C D$ 的边长为 $2$，故 $D N=sqrt(3)$。在直角三角形 $A N D$ 中，$sin angle D A N=(D N)/(A D)=sqrt(3)/3$。
        #figure(pyramid-diagram(auxiliary: true))],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设 ${a_n}$ 是等差数列，${b_n}$ 是等比数列，公比大于 $0$。已知 $a_1=b_1=3$，$b_2=a_3$，$b_3=4a_2+3$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 和 ${b_n}$ 的通项公式。],
      answers: ([$a_n=3n$，$b_n=3^n$（$n in NN^*$）。],),
      explanation: [设公差为 $d$，公比为 $q>0$。由题意得 $3q=3+2d$、$3q^2=15+4d$。消去 $d$，得 $q^2-2q-3=0$。∵ $q>0$，∴ $q=3,d=3$，故 $a_n=3n,b_n=3^n$。],
    ),
    subquestion(
      stem: [设数列 ${c_n}$ 满足 $c_n=cases(1 & quad n "为奇数", b_(n/2) & quad n "为偶数")$，求 $a_1 c_1+a_2 c_2+...+a_(2n)c_(2n)$（$n in NN^*$）。],
      answers: ([$((2n-1)3^(n+2)+6n^2+9)/2$。],),
      explanation: [#step[按奇偶下标分组][所求和为
          $
            sum_(k=1)^n (a_(2k-1)+a_(2k)b_k)=sum_(k=1)^n (6k-3)+6sum_(k=1)^n k dot 3^k=3n^2+6T_n,
          $
          其中 $T_n=sum_(k=1)^n k dot 3^k$。]
        #step[错位相减][由 $3T_n-T_n=n dot 3^(n+1)-(3+3^2+...+3^n)$，得
          $ 2T_n=n dot 3^(n+1)-3(3^n-1)/2=((2n-1)3^(n+1)+3)/2. $
          故原式为 $3n^2+6T_n=((2n-1)3^(n+2)+6n^2+9)/2$。]],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的左焦点为 $F$，左顶点为 $A$，上顶点为 $B$。已知 $sqrt(3)|O A|=2|O B|$（$O$ 为原点）。],
  parts: (
    subquestion(
      stem: [求椭圆的离心率。],
      answers: ([$1/2$],),
      explanation: [由 $sqrt(3)a=2b$ 得 $b^2=3/4 a^2$，故 $c^2=a^2-b^2=a^2/4$，离心率为 $e=c/a=1/2$。],
    ),
    subquestion(
      stem: [设经过点 $F$ 且斜率为 $3/4$ 的直线 $l$ 与椭圆在 $x$ 轴上方的交点为 $P$，圆 $C$ 同时与 $x$ 轴和直线 $l$ 相切，圆心 $C$ 在直线 $x=4$ 上，且 $O C parallel A P$，求椭圆的方程。],
      answers: ([$x^2/16+y^2/12=1$],),
      explanation: [#step[用半焦距表示交点][由第（1）问，$a=2c,b=sqrt(3)c$，椭圆为 $x^2/(4c^2)+y^2/(3c^2)=1$，直线 $l$ 为 $y=3/4(x+c)$。
          联立得 $7x^2+6c x-13c^2=0$，解得 $x=c$ 或 $x=-(13c)/7$，对应纵坐标分别为 $(3c)/2$、$-(9c)/14$。∵ $P$ 在 $x$ 轴上方，∴ $P=(c,(3c)/2)$。]
        #step[由相切条件确定大小][∵ $A=(-2c,0)$，∴ $A P$ 的斜率为 $((3c)/2)/(3c)=1/2$。设圆心 $C=(4,t)$，由 $O C parallel A P$ 得 $t=2$。
          圆与 $x$ 轴相切，半径为 $2$；又直线 $l$ 为 $3x-4y+3c=0$，故
          $ frac(|12-8+3c|, 5)=2. $
          ∵ $c>0$，∴ $4+3c=10$，得 $c=2$。所以椭圆方程为 $x^2/16+y^2/12=1$。]],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设函数 $f(x)=ln x-a(x-1)e^x$，其中 $a in RR$。],
  parts: (
    subquestion(
      stem: [若 $a<=0$，讨论 $f(x)$ 的单调性。],
      answers: ([$f(x)$ 在 $(0,+infinity)$ 上单调递增。],),
      explanation: [定义域为 $(0,+infinity)$，$f'(x)=1/x-a x e^x$。当 $a<=0$ 时，对任意 $x>0$ 均有 $f'(x)>0$，故 $f(x)$ 在 $(0,+infinity)$ 上单调递增。],
    ),
    subquestion(stem: [若 $0<a<1/e$，], parts: (
      subquestion(
        stem: [证明 $f(x)$ 恰有两个零点。],
        answers: ([证明见解析。],),
        explanation: [#step[确定单调性][令 $L=ln(1/a)>1$，$g(x)=1-a x^2 e^x$，则 $f'(x)=g(x)/x$，$g'(x)=-a e^x x(x+2)<0$。
            又 $g(1)=1-a e>0$，$g(L)=1-L^2<0$，故 $g$ 恰有一个零点 $x_0 in (1,L)$。从而 $f$ 在 $(0,x_0)$ 上递增，在 $(x_0,+infinity)$ 上递减。]
          #step[分别确定两侧零点][∵ $f(1)=0$，∴ 递增区间内恰有一个零点 $1$，且 $f(x_0)>0$。
            由 $ln t<t-1$（$t>1$），得 $f(L)=ln L-L+1<0$，故递减区间内也恰有一个零点。因此 $f$ 恰有两个零点。]],
      ),
      subquestion(
        stem: [设 $x_0$ 为 $f(x)$ 的极值点，$x_1$ 为 $f(x)$ 的零点，且 $x_1>x_0$，证明 $3x_0-x_1>2$。],
        answers: ([证明见解析。],),
        explanation: [由上一问，$x_1>x_0>1$。由 $f'(x_0)=0$、$f(x_1)=0$，得 $a x_0^2 e^(x_0)=1$、$ln x_1=a(x_1-1)e^(x_1)$。消去 $a$，得
          $ e^(x_1-x_0)=(x_0^2 ln x_1)/(x_1-1)<x_0^2, $
          其中使用了 $ln x_1<x_1-1$。两边取对数得
          $ x_1-x_0<2ln x_0<2(x_0-1), $
          故 $3x_0-x_1>2$。
          所用不等式可由 $h(t)=t-1-ln t$、$h'(t)=1-1/t>0$（$t>1$）及 $h(1)=0$ 得到。],
      ),
    )),
  ),
)
