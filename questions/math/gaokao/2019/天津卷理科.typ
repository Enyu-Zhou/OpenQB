#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, space-axes, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "天津卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019天津理.pdf",
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
#let solid-diagram(axes: false) = cetz.canvas(length: 19mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (1, 0, 0)
  let c = (1, 2, 0)
  let d = (0, 1, 0)
  let e = (0, 0, 2)
  let f = (1, 2, 8 / 7)
  oblique-project((0.5, -0.25), (1, 0.18), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(e, a, b, c, f, e)
    line(e, b, f)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(e, d, b, stroke: (dash: figure-style.dash))
    line(e, c, stroke: (dash: figure-style.dash))
    if axes {
      space-axes(
        (1, 1, 2),
        (1.5, 1.7, 2.4),
        label-anchors: ("north-west", "south", "south"),
      )
    }
    for (point, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      ((0, 0.8, 0.15), $D$, "south-east"),
      (e, $E$, "south-east"),
      (f, $F$, "south-west"),
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
  stem: [设 $x in RR$，则“$x^2-5x<0$”是“$|x-1|<1$”的#choice-placeholder()。],
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
  stem: [已知抛物线 $y^2=4x$ 的焦点为 $F$，准线为 $l$。若 $l$ 与双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的两条渐近线分别交于点 $A$ 和点 $B$，且 $|A B|=4|O F|$（$O$ 为原点），则双曲线的离心率为#choice-placeholder()。],
  choices: ([$sqrt(2)$], [$sqrt(3)$], [$2$], [$sqrt(5)$]),
  answers: ([D],),
  explanation: [$F=(1,0)$，$l:x=-1$。渐近线 $y=plus.minus b/a x$ 与 $l$ 的两交点纵坐标为 $plus.minus b/a$，故 $|A B|=2b/a=4$，得 $b=2a$。
    离心率 $e=sqrt(a^2+b^2)/a=sqrt(5)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a=log_5 2$，$b=log_(0.5) 0.2$，$c=0.5^(0.2)$，则 $a,b,c$ 的大小关系为#choice-placeholder()。],
  choices: ([$a<c<b$], [$a<b<c$], [$b<c<a$], [$c<a<b$]),
  answers: ([A],),
  explanation: [$0<a=log_5 2<log_5 sqrt(5)=1/2$，$1/2<c=0.5^(0.2)<1$，$b=log_(0.5) 0.2>log_(0.5) 0.5=1$，故 $a<c<b$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=A sin(omega x+phi)$（$A>0,omega>0,|phi|<pi$）是奇函数，将 $y=f(x)$ 的图象上所有点的横坐标伸长到原来的 $2$ 倍（纵坐标不变），所得图象对应的函数为 $g(x)$。若 $g(x)$ 的最小正周期为 $2pi$，且 $g(pi/4)=sqrt(2)$，则 $f((3pi)/8)=$#choice-placeholder()。],
  choices: ([$-2$], [$-sqrt(2)$], [$sqrt(2)$], [$2$]),
  answers: ([C],),
  explanation: [∵ $f(0)=0$ 且 $|phi|<pi$，∴ $phi=0$。于是 $g(x)=A sin((omega x)/2)$，由周期为 $2pi$ 得 $omega=2$。由 $A sin(pi/4)=sqrt(2)$ 得 $A=2$，故 $f((3pi)/8)=2sin((3pi)/4)=sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a in RR$，设函数 $f(x)=cases(x^2-2a x+2a & quad x<=1, x-a ln x & quad x>1)$。若关于 $x$ 的不等式 $f(x)>=0$ 在 $RR$ 上恒成立，则 $a$ 的取值范围为#choice-placeholder()。],
  choices: ([$[0,1]$], [$[0,2]$], [$[0,e]$], [$[1,e]$]),
  answers: ([C],),
  explanation: [#step[考察前一段][由 $f(0)=2a>=0$ 得 $a>=0$。反之，当 $a>=0$、$x<=1$ 时，$x^2-2a x+2a=x^2+2a(1-x)>=0$，故这一段恒非负等价于 $a>=0$。]
    #step[考察后一段][当 $x>1$ 时，$x-a ln x>=0$ 等价于 $a<=x/(ln x)$。
      令 $h(x)=x/(ln x)$，则 $h'(x)=(ln x-1)/(ln x)^2$，故 $h$ 在 $(1,e)$ 上递减，在 $(e,+infinity)$ 上递增，最小值为 $h(e)=e$。
      因此 $a<=e$，合并得 $a in [0,e]$。]],
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
  stem: [$(2x-1/(8x^3))^8$ 的展开式中的常数项为#fill-placeholder()。],
  answers: ([$28$],),
  explanation: [通项为 $T_(r+1)=C_8^r (2x)^(8-r)(-1/(8x^3))^r=(-1)^r C_8^r 2^(8-4r)x^(8-4r)$。令 $8-4r=0$ 得 $r=2$，故常数项为 $C_8^2=28$。],
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
  stem: [设 $a in RR$，直线 $a x-y+2=0$ 和圆 $cases(x=2+2cos theta, y=1+2sin theta)$（$theta$ 为参数）相切，则 $a$ 的值为#fill-placeholder()。],
  answers: ([$3/4$],),
  explanation: [圆心为 $(2,1)$，半径为 $2$。相切条件为 $frac(|2a+1|, sqrt(a^2+1))=2$，平方化简得 $4a=3$，故 $a=3/4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $x>0,y>0,x+2y=5$，则 $((x+1)(2y+1))/sqrt(x y)$ 的最小值为#fill-placeholder()。],
  answers: ([$4sqrt(3)$],),
  explanation: [原式 $=(2x y+6)/sqrt(x y)=2sqrt(x y)+6/sqrt(x y)>=2sqrt(12)=4sqrt(3)$。
    等号成立当且仅当 $x y=3$，结合 $x+2y=5$ 得 $(x,y)=(3,1)$ 或 $(2,3/2)$，均符合条件，故最小值为 $4sqrt(3)$。],
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
  stem: [设甲、乙两位同学上学期间，每天 7:30 之前到校的概率均为 $2/3$。假定甲、乙两位同学到校情况互不影响，且任一同学每天到校情况相互独立。],
  parts: (
    subquestion(
      stem: [用 $X$ 表示甲同学上学期间的三天中 7:30 之前到校的天数，求随机变量 $X$ 的分布列和数学期望。],
      answers: ([分布列见解析，$E(X)=2$。],),
      explanation: [由题意，$X tilde B(3,2/3)$，故 $P(X=k)=C_3^k (2/3)^k (1/3)^(3-k)$（$k=0,1,2,3$）。分布列为
        #table(
          columns: 5,
          align: center,
          [$X$], [$0$], [$1$], [$2$], [$3$],
          [$P$], [$1/27$], [$2/9$], [$4/9$], [$8/27$],
        )
        数学期望 $E(X)=3 times 2/3=2$。],
    ),
    subquestion(
      stem: [设 $M$ 为事件“上学期间的三天中，甲同学在 7:30 之前到校的天数比乙同学在 7:30 之前到校的天数恰好多 2”，求事件 $M$ 发生的概率。],
      answers: ([$20/243$],),
      explanation: [设乙同学三天中 7:30 之前到校的天数为 $Y$，则 $Y$ 与 $X$ 独立且同分布。
        事件 $M$ 分为互斥的两种情况：$(X,Y)=(2,0)$ 或 $(3,1)$。故
        $
          P(M)=P(X=2)P(Y=0)+P(X=3)P(Y=1)=4/9 times 1/27+8/27 times 2/9=20/243.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [如图，$A E perp$ 平面 $A B C D$，$C F parallel A E$，$A D parallel B C$，$A D perp A B$，$A B=A D=1$，$A E=B C=2$。
    #figure(solid-diagram())],
  parts: (
    subquestion(
      stem: [求证：$B F parallel$ 平面 $A D E$。],
      answers: ([证明见解析。],),
      explanation: [以 $A$ 为原点，$A B,A D,A E$ 的方向分别为 $x,y,z$ 轴正方向建立空间直角坐标系。设 $C F=h>0$，则
        $ A=(0,0,0),quad B=(1,0,0),quad C=(1,2,0), $ $
          D=(0,1,0),quad E=(0,0,2),quad F=(1,2,h).
        $
        平面 $A D E$ 的方程为 $x=0$，而直线 $B F$ 上的点均满足 $x=1$，故 $B F parallel$ 平面 $A D E$。
        #figure(solid-diagram(axes: true))],
    ),
    subquestion(
      stem: [求直线 $C E$ 与平面 $B D E$ 所成角的正弦值。],
      answers: ([$4/9$],),
      explanation: [$arrow(B D)=(-1,1,0)$，$arrow(B E)=(-1,0,2)$，取平面 $B D E$ 的法向量 $bold(n)=(2,2,1)$。又 $arrow(C E)=(-1,-2,2)$，故所求正弦值为
        $
          frac(|arrow(C E) dot bold(n)|, |arrow(C E)| |bold(n)|)=frac(|-2-4+2|, 3 times 3)=4/9.
        $],
    ),
    subquestion(
      stem: [若二面角 $E-B D-F$ 的余弦值为 $1/3$，求线段 $C F$ 的长。],
      answers: ([$8/7$],),
      explanation: [#step[确定二面角的方向][将 $arrow(B E)$、$arrow(B F)$ 分别向 $B D$ 的垂面投影，所得向量为 $bold(u)=(-1/2,-1/2,2)$、$bold(v)=(1,1,h)$。它们分别指向含 $E,F$ 的半平面，故其夹角就是题给二面角。]
        #step[解出高度][由
          $
            (bold(u) dot bold(v))/(|bold(u)| |bold(v)|)=(4h-2)/(3sqrt(2h^2+4))=1/3,
          $
          得 $4h-2=sqrt(2h^2+4)$，因此 $h>1/2$。平方化简得 $14h^2-16h=0$，故 $h=8/7$，代回满足原式。
          因此 $C F=8/7$。]],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设椭圆 $x^2/a^2+y^2/b^2=1$（$a>b>0$）的左焦点为 $F$，上顶点为 $B$。已知椭圆的短轴长为 $4$，离心率为 $sqrt(5)/5$。],
  parts: (
    subquestion(
      stem: [求椭圆的方程。],
      answers: ([$x^2/5+y^2/4=1$],),
      explanation: [设半焦距为 $c$，由 $2b=4$、$c/a=sqrt(5)/5$、$a^2=b^2+c^2$ 得 $b=2,a=sqrt(5),c=1$，故椭圆方程为 $x^2/5+y^2/4=1$。],
    ),
    subquestion(
      stem: [设点 $P$ 在椭圆上，且异于椭圆的上、下顶点，点 $M$ 为直线 $P B$ 与 $x$ 轴的交点，点 $N$ 在 $y$ 轴的负半轴上。若 $|O N|=|O F|$（$O$ 为原点），且 $O P perp M N$，求直线 $P B$ 的斜率。],
      answers: ([$plus.minus (2sqrt(30))/5$],),
      explanation: [#step[表示点的坐标][由第（1）问知 $B=(0,2),N=(0,-1)$。∵ $P$ 异于上、下顶点，∴ 直线 $P B$ 的斜率存在且不为 $0$，设其方程为 $y=k x+2$。
          联立椭圆方程得 $(4+5k^2)x^2+20k x=0$，除去点 $B$，得
          $ P=(-20k/(4+5k^2),(8-10k^2)/(4+5k^2)),quad M=(-2/k,0). $]
        #step[利用垂直条件][由 $arrow(O P) dot arrow(M N)=0$，得
          $ (-20k)/(4+5k^2) dot 2/k-(8-10k^2)/(4+5k^2)=0. $
          化简得 $10k^2-48=0$，故 $k=plus.minus (2sqrt(30))/5$。两值均给出异于上、下顶点的 $P$，且满足垂直条件。]],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设 ${a_n}$ 是等差数列，${b_n}$ 是等比数列。已知 $a_1=4$，$b_1=6$，$b_2=2a_2-2$，$b_3=2a_3+4$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 和 ${b_n}$ 的通项公式。],
      answers: ([$a_n=3n+1$，$b_n=3 times 2^n$（$n in NN^*$）。],),
      explanation: [设公差、公比分别为 $d,q$，由题意得 $6q=6+2d$、$6q^2=12+4d$。消去 $d$，得 $q^2=2q$。∵ 等比数列各项不为 $0$，∴ $q=2$，进而 $d=3$。
        故 $a_n=4+3(n-1)=3n+1$，$b_n=6 times 2^(n-1)=3 times 2^n$。],
    ),
    subquestion(
      stem: [设数列 ${c_n}$ 满足 $c_1=1$，$c_n=cases(1 & quad 2^k<n<2^(k+1), b_k & quad n=2^k)$，其中 $k in NN^*$。],
      parts: (
        subquestion(
          stem: [求数列 ${a_(2^n)(c_(2^n)-1)}$ 的通项公式。],
          answers: ([$a_(2^n)(c_(2^n)-1)=9 times 4^n-1$（$n in NN^*$）。],),
          explanation: [∵ $c_(2^n)=b_n=3 times 2^n$，∴ $a_(2^n)(c_(2^n)-1)=(3 times 2^n+1)(3 times 2^n-1)=9 times 4^n-1$。],
        ),
        subquestion(
          stem: [求 $sum_(i=1)^(2^n) a_i c_i$（$n in NN^*$）。],
          answers: ([$27 times 2^(2n-1)+5 times 2^(n-1)-n-12$。],),
          explanation: [在 $1<=i<=2^n$ 中，只有 $i=2,2^2,...,2^n$ 时 $c_i!=1$。因此
            $
              sum_(i=1)^(2^n) a_i c_i & =sum_(i=1)^(2^n) a_i+sum_(j=1)^n a_(2^j)(c_(2^j)-1) \
                                      & =(2^n (3 times 2^n+5))/2+sum_(j=1)^n (9 times 4^j-1) \
                                      & =3 times 2^(2n-1)+5 times 2^(n-1)+12(4^n-1)-n \
                                      & =27 times 2^(2n-1)+5 times 2^(n-1)-n-12.
            $],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设函数 $f(x)=e^x cos x$，$g(x)$ 为 $f(x)$ 的导函数。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的单调区间。],
      answers: (
        [单调递增区间为 $(2k pi-(3pi)/4,2k pi+pi/4)$，单调递减区间为 $(2k pi+pi/4,2k pi+(5pi)/4)$，$k in ZZ$。],
      ),
      explanation: [$f'(x)=e^x (cos x-sin x)=sqrt(2)e^x cos(x+pi/4)$。据余弦函数的符号，$f'(x)>0$ 的区间为 $(2k pi-(3pi)/4,2k pi+pi/4)$，$f'(x)<0$ 的区间为 $(2k pi+pi/4,2k pi+(5pi)/4)$（$k in ZZ$），分别为所求递增、递减区间。],
    ),
    subquestion(
      stem: [当 $x in [pi/4,pi/2]$ 时，证明 $f(x)+g(x)(pi/2-x)>=0$。],
      answers: ([证明见解析。],),
      explanation: [令 $H(x)=f(x)+g(x)(pi/2-x)$。由 $g(x)=e^x (cos x-sin x)$ 得 $g'(x)=-2e^x sin x$，故
        $ H'(x)=g'(x)(pi/2-x)=-2e^x sin x (pi/2-x)<=0. $
        因此 $H$ 在 $[pi/4,pi/2]$ 上递减，$H(x)>=H(pi/2)=0$，结论成立。],
    ),
    subquestion(
      stem: [设 $x_n$ 为函数 $u(x)=f(x)-1$ 在区间 $(2n pi+pi/4,2n pi+pi/2)$ 内的零点，其中 $n in NN$。证明 $2n pi+pi/2-x_n<e^(-2n pi)/(sin x_0-cos x_0)$。],
      answers: ([证明见解析。],),
      explanation: [#step[将各零点移到同一区间][记 $y_n=x_n-2n pi$，则 $y_n in (pi/4,pi/2)$，且 $f(y_n)=e^(-2n pi)<=1=f(x_0)$。
          由第（1）问知 $f$ 在此区间上严格递减，故 $y_n>=x_0$。又 $g'(x)<0$，故 $g(y_n)<=g(x_0)<0$。]
        #step[使用第（2）问的不等式][由 $f(y_n)+g(y_n)(pi/2-y_n)>=0$，得
          $
            pi/2-y_n & <=frac(f(y_n), -g(y_n))<=frac(e^(-2n pi), -g(x_0)) \
                     & =e^(-2n pi)/(e^(x_0)(sin x_0-cos x_0))<e^(-2n pi)/(sin x_0-cos x_0).
          $
          最后一步使用 $x_0>pi/4>0$ 及 $sin x_0-cos x_0>0$。代回 $y_n=x_n-2n pi$ 即得结论。]],
    ),
  ),
)
