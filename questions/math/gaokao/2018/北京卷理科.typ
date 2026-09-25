#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018北京理.pdf",
  regions: ("北京",),
)

#let flowchart() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.6, 6.6), (0.6, 7.1), radius: 0.18)
  content((0, 6.85), [开始])
  rect((-1.1, 5.55), (1.1, 6.05))
  content((0, 5.8), [$k=1,s=1$])
  rect((-2.4, 4.1), (2.4, 5.1))
  content((0, 4.6), [$s=s+(-1)^k dot 1/(1+k)$])
  rect((-1.1, 3.1), (1.1, 3.6))
  content((0, 3.35), [$k=k+1$])
  line((0, 2.6), (1.1, 2.15), (0, 1.7), (-1.1, 2.15), close: true)
  content((0, 2.15), [$k>=3?$])
  line((-1.1, 0.7), (0.9, 0.7), (1.1, 1.2), (-0.9, 1.2), close: true)
  content((0, 0.95), [输出 $s$])
  rect((-0.6, -0.3), (0.6, 0.2), radius: 0.18)
  content((0, -0.05), [结束])
  for (a, b) in (
    (6.6, 6.05),
    (5.55, 5.1),
    (4.1, 3.6),
    (3.1, 2.6),
    (1.7, 1.2),
    (0.7, 0.2),
  ) { line((0, a), (0, b), mark: (end: ">")) }
  line((1.1, 2.15), (2.8, 2.15), (2.8, 5.3), (0.2, 5.3), mark: (end: ">"))
  line((0.2, 5.3), (0, 5.3))
  content((1.4, 2.2), [否], anchor: "south")
  content((0.2, 1.45), [是], anchor: "west")
})
#let views() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  line((0, 3.4), (2, 3.4), (0, 5.4), close: true)
  line((0, 5.4), (1, 3.4))
  line((3.5, 3.4), (5.5, 3.4), (3.5, 5.4), close: true)
  line((0, 0), (1, 0), (2, 2), (0, 2), close: true)
  line((0, 2), (1, 0))
  for (pos, label) in (
    ((-0.3, 4.4), [$2$]),
    ((0.5, 3.1), [$1$]),
    ((1.5, 3.1), [$1$]),
    ((4.5, 3.1), [$2$]),
  ) { content(pos, label) }
  for (pos, label) in (
    ((1, 2.6), [正（主）视图]),
    ((4.5, 2.6), [侧（左）视图]),
    ((1, -0.4), [俯视图]),
  ) { content(pos, text(size: 9pt, label)) }
})
#let prism-diagram() = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  let a = (1, 0, 0)
  let b = (0, 2, 0)
  let c = (-1, 0, 0)
  let a1 = (1, 0, 2)
  let b1 = (0, 2, 2)
  let c1 = (-1, 0, 2)
  let d = (1, 0, 1)
  let e = (0, 0, 0)
  let f = (0, 0, 2)
  let g = (0, 2, 1)
  oblique-project((-1, -0.2), (0.6, -0.25), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, a1, c1, b1, b, a)
    line(a1, b1)
    line(b, d)
    for (p, q) in ((a, c), (b, c), (c, c1), (c, d), (b, e), (e, f), (f, g)) {
      line(p, q, stroke: (dash: figure-style.dash))
    }
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south"),
      (d, $D$, "east"),
      (e, $E$, "north"),
      (f, $F$, "south-east"),
      (g, $G$, "west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x | |x|<2}$，$B={-2,0,1,2}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${0,1}$], [${-1,0,1}$], [${-2,0,1,2}$], [${-1,0,1,2}$]),
  answers: ([A],),
  explanation: [$A=(-2,2)$，故 $B$ 中属于 $A$ 的元素为 $0,1$，即 $A inter B={0,1}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在复平面内，复数 $1/(1-"i")$ 的共轭复数对应的点位于#choice-placeholder()。],
  choices: ([第一象限], [第二象限], [第三象限], [第四象限]),
  answers: ([D],),
  explanation: [$1/(1-"i")=(1+"i")/2$，其共轭复数为 $1/2-1/2 "i"$，对应点 $(1/2,-1/2)$ 在第四象限。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图所示的程序框图，输出的 $s$ 值为#choice-placeholder()。
    #figure(flowchart())],
  choices: ([$1/2$], [$5/6$], [$7/6$], [$7/12$]),
  answers: ([B],),
  explanation: [初始 $k=1$、$s=1$。第一次循环后 $s=1-1/2=1/2$、$k=2$，继续循环。
    第二次循环后 $s=1/2+1/3=5/6$、$k=3$，满足退出条件，故输出 $5/6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [“十二平均律”是通用的音律体系，明代朱载堉最早用数学方法计算出半音比例，为这个理论的发展做出了重要贡献。十二平均律将一个纯八度音程分成十二份，依次得到十三个单音，从第二个单音起，每一个单音的频率与它的前一个单音的频率的比都等于 $root(12, 2)$。若第一个单音的频率为 $f$，则第八个单音的频率为#choice-placeholder()。],
  choices: (
    [$root(3, 2)f$],
    [$root(3, 2^2)f$],
    [$root(12, 2^5)f$],
    [$root(12, 2^7)f$],
  ),
  answers: ([D],),
  explanation: [各单音频率构成首项为 $f$、公比为 $root(12, 2)$ 的等比数列，故第八项为 $f(root(12, 2))^7=root(12, 2^7)f$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某四棱锥的三视图如图所示，在此四棱锥的侧面中，直角三角形的个数为#choice-placeholder()。
    #figure(views())],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([C],),
  explanation: [由三视图，可取底面顶点 $A=(0,0,0)$、$B=(1,0,0)$、$C=(2,2,0)$、$D=(0,2,0)$，顶点 $P=(0,2,2)$。
    ∵ $P D$ 垂直底面，∴ 侧面 $P A D$、$P C D$ 为直角三角形。又 $P A perp A B$，故 $P A B$ 也是直角三角形。
    侧面 $P B C$ 的三边平方为 $P B^2=9$、$P C^2=8$、$B C^2=5$，不满足勾股关系。
    故共有 $3$ 个。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $bold(a),bold(b)$ 均为单位向量，则“$|bold(a)-3bold(b)|=|3bold(a)+bold(b)|$”是“$bold(a) perp bold(b)$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([C],),
  explanation: [两边平方，得 $10-6bold(a) dot bold(b)=10+6bold(a) dot bold(b)$，等价于 $bold(a) dot bold(b)=0$，也就等价于 $bold(a) perp bold(b)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在平面直角坐标系中，记 $d$ 为点 $P(cos theta,sin theta)$ 到直线 $x-m y-2=0$ 的距离。当 $theta,m$ 变化时，$d$ 的最大值为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([C],),
  explanation: [直线恒过点 $A=(2,0)$。设原点为 $O$，则 $d<=P A<=P O+O A=3$。
    当 $m=0$、$theta=pi$ 时，直线为 $x=2$、$P=(-1,0)$，此时 $d=3$，故最大值为 $3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={(x,y) | x-y>=1,a x+y>4,x-a y<=2}$，则#choice-placeholder()。],
  choices: (
    [对任意实数 $a$，$(2,1) in A$],
    [对任意实数 $a$，$(2,1) in.not A$],
    [当且仅当 $a<0$ 时，$(2,1) in.not A$],
    [当且仅当 $a<=3/2$ 时，$(2,1) in.not A$],
  ),
  answers: ([D],),
  explanation: [将 $(2,1)$ 代入三个不等式，得 $1>=1$、$2a+1>4$、$2-a<=2$，同时成立的充要条件为 $a>3/2$。
    所以 $(2,1) in.not A$ 的充要条件为 $a<=3/2$。],
)
#section[填空题：本题共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [设 ${a_n}$ 是等差数列，且 $a_1=3$，$a_2+a_5=36$，则 ${a_n}$ 的通项公式为#fill-placeholder()。],
  answers: ([$a_n=6n-3$],),
  explanation: [设公差为 $d$，则 $a_2+a_5=6+5d=36$，得 $d=6$，故 $a_n=3+6(n-1)=6n-3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在极坐标系中，直线 $rho cos theta+rho sin theta=a$（$a>0$）与圆 $rho=2cos theta$ 相切，则 $a=$#fill-placeholder()。],
  answers: ([$1+sqrt(2)$],),
  explanation: [直角坐标方程分别为 $x+y-a=0$、$(x-1)^2+y^2=1$。
    相切要求圆心到直线的距离等于半径，即 $|1-a|/sqrt(2)=1$。由 $a>0$ 得 $a=1+sqrt(2)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设函数 $f(x)=cos(omega x-pi/6)$（$omega>0$）。若 $f(x)<=f(pi/4)$ 对任意的实数 $x$ 都成立，则 $omega$ 的最小值为#fill-placeholder()。],
  answers: ([$2/3$],),
  explanation: [∵ $f$ 的最大值为 $1$，∴ $omega pi/4-pi/6=2k pi$，即 $omega=8k+2/3$（$k in ZZ$）。
    由 $omega>0$，最小值为 $2/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足 $x+1<=y<=2x$，则 $2y-x$ 的最小值是#fill-placeholder()。],
  answers: ([$3$],),
  explanation: [由 $x+1<=2x$ 得 $x>=1$，所以 $2y-x>=2(x+1)-x=x+2>=3$。
    当 $(x,y)=(1,2)$ 时满足条件且取等，故最小值为 $3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [能说明“若 $f(x)>f(0)$ 对任意的 $x in (0,2]$ 都成立，则 $f(x)$ 在 $[0,2]$ 上是增函数”为假命题的一个函数是#fill-placeholder()。],
  answers: ([$f(x)=sin x$（答案不唯一）。],),
  explanation: [取 $f(x)=sin x$，则 $f(0)=0$，且当 $x in (0,2]$ 时，$sin x>0$。
    但 $f$ 在 $[pi/2,2]$ 上递减，故不在整个 $[0,2]$ 上递增。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知椭圆 $M:x^2/a^2+y^2/b^2=1$（$a>b>0$），双曲线 $N:x^2/m^2-y^2/n^2=1$。若双曲线 $N$ 的两条渐近线与椭圆 $M$ 的四个交点及椭圆 $M$ 的两个焦点恰为一个正六边形的顶点，则椭圆 $M$ 的离心率为#fill-placeholder()；双曲线 $N$ 的离心率为#fill-placeholder()。],
  answers: ([$sqrt(3)-1$], [$2$]),
  explanation: [设椭圆焦点为 $(±c,0)$。由对称性，正六边形其余四个顶点为 $(±c/2,±sqrt(3)c/2)$。
    点 $(c/2,sqrt(3)c/2)$ 到两焦点的距离分别为 $c$、$sqrt(3)c$，故 $2a=(1+sqrt(3))c$，椭圆离心率为 $c/a=sqrt(3)-1$。
    双曲线渐近线的斜率为 $±sqrt(3)$，即 $n/m=sqrt(3)$，故其离心率为 $sqrt(m^2+n^2)/m=2$。],
)
#section[解答题：本题共 6 小题，共 80 分。解答应写出文字说明、演算步骤或证明过程。]
#question(
  "solution",
  score: 13,
  stem: [在 $triangle A B C$ 中，$a=7$，$b=8$，$cos B=-1/7$。],
  parts: (
    subquestion(
      stem: [求 $angle A$。],
      answers: ([$pi/3$],),
      explanation: [由余弦定理，$64=49+c^2-2 times 7c times (-1/7)$，故 $c^2+2c-15=0$。由 $c>0$ 得 $c=3$。
        ∴ $cos A=(b^2+c^2-a^2)/(2b c)=(64+9-49)/48=1/2$，故 $A=pi/3$。],
    ),
    subquestion(
      stem: [求 $A C$ 边上的高。],
      answers: ([$3sqrt(3)/2$],),
      explanation: [由第（1）问，$c=3$、$A=pi/3$，故 $A C$ 边上的高为 $c sin A=3sqrt(3)/2$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在三棱柱 $A B C-A_1 B_1 C_1$ 中，$C C_1 perp$ 平面 $A B C$，$D,E,F,G$ 分别为 $A A_1,A C,A_1 C_1,B B_1$ 的中点，$A B=B C=sqrt(5)$，$A C=A A_1=2$。
    #figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [求证：$A C perp$ 平面 $B E F$。],
      answers: ([证明见解析。],),
      explanation: [∵ $A B=B C$，$E$ 为 $A C$ 中点，∴ $A C perp B E$。
        又 $E F parallel C C_1$，$C C_1 perp$ 平面 $A B C$，故 $A C perp E F$。
        ∵ $B E inter E F=E$，∴ $A C perp$ 平面 $B E F$。],
    ),
    subquestion(
      stem: [求二面角 $B-C D-C_1$ 的余弦值。],
      answers: ([$-1/sqrt(21)$],),
      explanation: [#step[建立坐标系][以 $E$ 为原点，以 $E A,E B,E F$ 的方向依次为 $x,y,z$ 轴正方向，则
          $
            A=(1,0,0),quad B=(0,2,0),quad C=(-1,0,0),quad D=(1,0,1),quad C_1=(-1,0,2).
          $
          记棱 $C D$ 的方向向量为 $bold(w)=(2,0,1)$。]
        #step[求二面角的平面角][从 $arrow(C B)$、$arrow(C C_1)$ 中分别减去沿棱 $C D$ 的分量，得到指向二面角两个半平面的垂直向量
          $
            bold(u)=arrow(C B)-(arrow(C B) dot bold(w))/(bold(w) dot bold(w)) bold(w)=(1/5,2,-2/5),
          $
          $
            bold(v)=arrow(C C_1)-(arrow(C C_1) dot bold(w))/(bold(w) dot bold(w)) bold(w)=(-4/5,0,8/5).
          $
          它们的夹角就是所求二面角的平面角，故其余弦为
          $
            (bold(u) dot bold(v))/(|bold(u)| |bold(v)|)=frac(-4/5, sqrt(21/5) times 4/sqrt(5))=-1/sqrt(21).
          $]],
    ),
    subquestion(
      stem: [证明：直线 $F G$ 与平面 $B C D$ 相交。],
      answers: ([证明见解析。],),
      explanation: [沿用第（2）问的坐标系，$F=(0,0,2)$、$G=(0,2,1)$，直线 $F G$ 上的点可表示为 $(0,2t,2-t)$（$t in RR$）。
        由 $B,C,D$ 的坐标可得平面 $B C D$ 的方程为 $2x-y-4z=-2$。
        代入直线参数式，得 $-2t-4(2-t)=-2$，解得唯一的 $t=3$，对应点 $(0,6,-1)$。
        因而直线 $F G$ 与平面 $B C D$ 相交。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [电影公司随机收集了电影的有关数据，经分类整理得到下表：
    #table(
      columns: 7,
      align: center,
      [电影类型], [第一类], [第二类], [第三类], [第四类], [第五类], [第六类],
      [电影部数], [140], [50], [300], [200], [800], [510],
      [好评率], [0.4], [0.2], [0.15], [0.25], [0.2], [0.1],
    )
    好评率是指：一类电影中获得好评的部数与该类电影的部数的比值。假设所有电影是否获得好评相互独立。],
  parts: (
    subquestion(
      stem: [从电影公司收集的电影中随机选取 $1$ 部，求这部电影是获得好评的第四类电影的概率。],
      answers: ([$0.025$],),
      explanation: [总电影部数为 $140+50+300+200+800+510=2000$，其中第四类获得好评的有 $200 times 0.25=50$ 部。
        所求概率为 $50/2000=0.025$。],
    ),
    subquestion(
      stem: [从第四类电影和第五类电影中各随机选取 $1$ 部，估计恰有 $1$ 部获得好评的概率。],
      answers: ([$0.35$],),
      explanation: [两部电影是否获得好评相互独立，故所求概率估计为 $0.25 times (1-0.2)+(1-0.25) times 0.2=0.35$。],
    ),
    subquestion(
      stem: [假设每类电影得到人们喜欢的概率与表格中该类电影的好评率相等。用“$xi_k=1$”表示第 $k$ 类电影得到人们喜欢，“$xi_k=0$”表示第 $k$ 类电影没有得到人们喜欢（$k=1,2,3,4,5,6$）。写出方差 $D xi_1,D xi_2,D xi_3,D xi_4,D xi_5,D xi_6$ 的大小关系。],
      answers: ([$D xi_1>D xi_4>D xi_2=D xi_5>D xi_3>D xi_6$。],),
      explanation: [若好评率为 $p$，则 $xi$ 服从两点分布，方差为 $p(1-p)$。
        表中各 $p$ 均在 $(0,1/2)$ 内，且 $p(1-p)$ 在此区间递增。因此方差与好评率的大小次序相同，即 $D xi_1>D xi_4>D xi_2=D xi_5>D xi_3>D xi_6$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设函数 $f(x)=[a x^2-(4a+1)x+4a+3]e^x$。],
  parts: (
    subquestion(
      stem: [若曲线 $y=f(x)$ 在点 $(1,f(1))$ 处的切线与 $x$ 轴平行，求 $a$。],
      answers: ([$a=1$。],),
      explanation: [求导并因式分解，得 $f'(x)=(a x-1)(x-2)e^x$。
        由 $f'(1)=(1-a)e=0$ 得 $a=1$。],
    ),
    subquestion(
      stem: [若 $f(x)$ 在 $x=2$ 处取得极小值，求 $a$ 的取值范围。],
      answers: ([$(1/2,+infinity)$],),
      explanation: [由 $f'(x)=(a x-1)(x-2)e^x$：
        当 $a>1/2$ 时，在 $2$ 的充分小邻域内 $a x-1>0$，导数在 $2$ 左侧为负、右侧为正，故 $x=2$ 是极小值点。
        当 $a<1/2$ 时，同理导数在 $2$ 左侧为正、右侧为负，$x=2$ 是极大值点。
        当 $a=1/2$ 时，$f'(x)=1/2(x-2)^2 e^x>=0$，函数在 $RR$ 上递增，$x=2$ 不是极值点。
        综上，$a in (1/2,+infinity)$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知抛物线 $C:y^2=2p x$ 经过点 $P(1,2)$。过点 $Q(0,1)$ 的直线 $l$ 与抛物线 $C$ 有两个不同的交点 $A,B$，且直线 $P A$ 交 $y$ 轴于 $M$，直线 $P B$ 交 $y$ 轴于 $N$。],
  parts: (
    subquestion(
      stem: [求直线 $l$ 的斜率的取值范围。],
      answers: ([$(-infinity,-3) union (-3,0) union (0,1)$],),
      explanation: [由 $P(1,2)$ 在抛物线上，得 $p=2$，故 $C:y^2=4x$。
        竖直线 $x=0$ 仅与抛物线交于原点，故 $l$ 的斜率存在，设 $l:y=k x+1$。当 $k=0$ 时也只有一个交点，故 $k != 0$。
        联立得 $k^2 x^2+(2k-4)x+1=0$，有两个不同实根要求 $Delta=16(1-k)>0$，即 $k<1$。
        又 $P A,P B$ 均须与 $y$ 轴相交，故交点不能为 $(1,-2)$，从而 $k != -3$；交点为 $P$ 对应的 $k=1$ 已被排除。
        所以所求范围为 $(-infinity,-3) union (-3,0) union (0,1)$。],
    ),
    subquestion(
      stem: [设 $O$ 为原点，$arrow(Q M)=lambda arrow(Q O)$，$arrow(Q N)=mu arrow(Q O)$，求证：$1/lambda+1/mu$ 为定值。],
      answers: ([$1/lambda+1/mu=2$，证明见解析。],),
      explanation: [#step[表示交点与参数][设 $A=(u^2/4,u)$、$B=(v^2/4,v)$。由 $y=k x+1$ 得 $u,v$ 是 $k y^2-4y+4=0$ 的两根，故 $u+v=u v=4/k$。
          由第（1）问，$u,v$ 均不等于 $±2$。直线 $P A$ 的斜率为 $(u-2)/(u^2/4-1)=4/(u+2)$，故 $M=(0,2u/(u+2))$。
          于是 $lambda=1-2u/(u+2)=(2-u)/(u+2)$，同理 $mu=(2-v)/(v+2)$。]
        #step[消去参数][$
            1/lambda+1/mu=(u+2)/(2-u)+(v+2)/(2-v)
            =(8-2u v)/(4-2(u+v)+u v)=(8-8/k)/(4-4/k)=2.
          $
          因此所求和恒为 $2$。]],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [设 $n$ 为正整数，集合 $A={alpha | alpha=(t_1,t_2,dots,t_n),t_k in {0,1},k=1,2,dots,n}$。
    对于集合 $A$ 中的任意元素 $alpha=(x_1,x_2,dots,x_n)$ 和 $beta=(y_1,y_2,dots,y_n)$，记
    $
      M(alpha,beta)=1/2[(x_1+y_1-|x_1-y_1|)+(x_2+y_2-|x_2-y_2|)+dots+(x_n+y_n-|x_n-y_n|)].
    $],
  parts: (
    subquestion(
      stem: [当 $n=3$ 时，若 $alpha=(1,1,0)$，$beta=(0,1,1)$，求 $M(alpha,alpha)$ 和 $M(alpha,beta)$ 的值。],
      answers: ([$M(alpha,alpha)=2$，$M(alpha,beta)=1$。],),
      explanation: [对 $x,y in {0,1}$，$(x+y-|x-y|)/2$ 仅在 $x=y=1$ 时等于 $1$，其余情形为 $0$。
        所以 $M$ 是两元素在同一位置均为 $1$ 的位置个数，由此得到 $M(alpha,alpha)=2$、$M(alpha,beta)=1$。],
    ),
    subquestion(
      stem: [当 $n=4$ 时，设 $B$ 是 $A$ 的子集，且满足：对于 $B$ 中的任意元素 $alpha,beta$，当 $alpha,beta$ 相同时，$M(alpha,beta)$ 是奇数；当 $alpha,beta$ 不同时，$M(alpha,beta)$ 是偶数。求集合 $B$ 中元素个数的最大值。],
      answers: ([$4$],),
      explanation: [#step[证明上界][由 $M(alpha,alpha)$ 为奇数，$B$ 中每个元素只能含 $1$ 个或 $3$ 个 $1$，这两类各有 $4$ 个。
          若只含其中一类，则元素个数至多为 $4$。
          若两类同时出现，取一个仅在第 $i$ 位为 $1$ 的元素 $alpha$ 和一个含 $3$ 个 $1$ 的元素 $beta$。由 $M(alpha,beta)$ 为偶数，$beta$ 的第 $i$ 位必须为 $0$，其余位均为 $1$。
          此时任何其他仅含一个 $1$ 的元素都与 $beta$ 有且仅有一个公共的 $1$；任何其他含三个 $1$ 的元素都与 $alpha$ 有且仅有一个公共的 $1$，均不合要求。因此混合时最多 $2$ 个。]
        #step[构造取等集合][取 $B={(1,0,0,0),(0,1,0,0),(0,0,1,0),(0,0,0,1)}$，自身的 $M$ 值为 $1$，不同元素间的 $M$ 值为 $0$，满足条件。故最大值为 $4$。]],
    ),
    subquestion(
      stem: [给定不小于 $2$ 的 $n$，设 $B$ 是 $A$ 的子集，且满足：对于 $B$ 中的任意两个不同的元素 $alpha,beta$，$M(alpha,beta)=0$。写出一个集合 $B$，使其元素个数最多，并说明理由。],
      answers: (
        [$B={(0,0,dots,0),e_1,e_2,dots,e_n}$，其中 $e_i$ 仅第 $i$ 位为 $1$、其余位为 $0$；最多 $n+1$ 个元素。],
      ),
      explanation: [条件说明不同元素中值为 $1$ 的位置互不重叠。
        每个非零元素至少占用一个这样的坐标位置，共只有 $n$ 个位置，所以非零元素至多有 $n$ 个，再加零元素，总数至多为 $n+1$。
        取零元素和所有仅有一位为 $1$ 的元素组成 $B$，任意两个不同元素没有公共的 $1$，满足条件，且恰有 $n+1$ 个元素。],
    ),
  ),
)
