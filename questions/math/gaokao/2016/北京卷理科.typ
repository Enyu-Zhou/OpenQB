#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, question, section, space-axes, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "北京卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016北京理.pdf",
  regions: ("北京",),
)

#let loop-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    for (y, label) in ((0, [开始]), (-9.2, [结束])) {
      rect((-0.65, y - 0.3), (0.65, y + 0.3), radius: 0.15)
      content((0, y), label)
    }
    for (y, label) in ((-1.2, [输入 $a$]), (-7.9, [输出 $k$])) {
      line(
        (-1, y - 0.35),
        (0.8, y - 0.35),
        (1, y + 0.35),
        (-0.8, y + 0.35),
        close: true,
      )
      content((0, y), label)
    }
    rect((-1.3, -2.8), (1.3, -2.1))
    content((0, -2.45), $k=0,b=a$)
    rect((-1.1, -4.9), (1.1, -3.5))
    content((0, -4.2), $a=-1/(1+a)$)
    line((0, -5.7), (1.45, -6.2), (0, -6.7), (-1.45, -6.2), close: true)
    content((0, -6.2), $a=b$)
    rect((2.2, -4.55), (4.5, -3.85))
    content((3.35, -4.2), $k=k+1$)
    for (a, b) in (
      (-0.3, -0.85),
      (-1.55, -2.1),
      (-2.8, -3.5),
      (-4.9, -5.7),
      (-6.7, -7.55),
      (-8.25, -8.9),
    ) {
      line((0, a), (0, b), mark: (end: ">"))
    }
    line((1.45, -6.2), (3.35, -6.2), (3.35, -4.55), mark: (end: ">"))
    line((3.35, -3.85), (3.35, -3.1), (0, -3.1), mark: (end: ">"))
    content((1.8, -6.08), [否], anchor: "south")
    content((0.2, -7.05), [是], anchor: "west")
  })
}
#let three-views() = {
  set text(size: 9pt)
  cetz.canvas(length: 15mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    line((0, 1), (1, 0), (2, 0), close: true)
    line((3, 1), (3, 0), (4, 0), close: true)
    content((1, -0.65), [正（主）视图])
    content((3.5, -0.65), [侧（左）视图])
    line((0, -1.45), (2, -1.45), (2, -2.45), close: true)
    line((1, -1.45), (2, -2.45), stroke: (dash: figure-style.dash))
    content((1, -2.8), [俯视图])
    for (x1, x2, y) in ((3, 4, -0.22), (0, 1, -1.2), (1, 2, -1.2)) {
      line((x1, y), (x2, y), mark: (start: ">", end: ">"))
      for x in (x1, x2) {
        if not (x1 == 1 and x == 1) { line((x, y - 0.1), (x, y + 0.1)) }
      }
      content(
        ((x1 + x2) / 2, y),
        $1$,
        frame: "rect",
        fill: white,
        stroke: none,
        padding: 1pt,
      )
    }
    line((2.75, 0), (2.75, 1), mark: (start: ">", end: ">"))
    for y in (0, 1) { line((2.65, y), (2.85, y)) }
    content(
      (2.75, 0.5),
      $1$,
      frame: "rect",
      fill: white,
      stroke: none,
      padding: 1pt,
    )
  })
}
#let pyramid(auxiliary: false) = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  oblique-project((-0.6, -0.75), (1.5, 0), (0, 1.5), {
    let O = (0, 0, 0)
    let A = (0, 1, 0)
    let B = (1, 1, 0)
    let C = (2, 0, 0)
    let D = (0, -1, 0)
    let P = (0, 0, 1)
    line(P, D, C, B, A, P)
    line(P, C)
    line(P, B)
    for (a, b) in ((A, D), (A, C)) {
      line(a, b, stroke: (dash: figure-style.dash))
    }
    if auxiliary {
      line(P, O, C, stroke: (dash: figure-style.dash))
      space-axes((2, 1, 1), (2.55, 1.6, 1.55))
      content(O, $O$, anchor: "south-east", padding: 3pt)
    }
    for (p, label, anchor) in (
      (P, $P$, "south-east"),
      (A, $A$, "south-west"),
      (B, $B$, "north-west"),
      (C, $C$, "north-west"),
      (D, $D$, "east"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题：共 8 小题，每小题 5 分，共 40 分。每小题只有一个选项符合题意。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={x|abs(x)<2}$，$B={-1,0,1,2,3}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${0,1}$], [${0,1,2}$], [${-1,0,1}$], [${-1,0,1,2}$]),
  answers: ([C],),
  explanation: [$A=(-2,2)$，故 $B$ 中属于 $A$ 的元素是 $-1,0,1$，即 $A inter B={-1,0,1}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $x,y$ 满足 $cases(2x-y<=0, x+y<=3, x>=0)$，则 $2x+y$ 的最大值为#choice-placeholder()。],
  choices: ([$0$], [$3$], [$4$], [$5$]),
  answers: ([C],),
  explanation: [由 $y>=2x$ 及 $x+y<=3$，得 $x<=1$，所以 $2x+y=x+(x+y)<=1+3=4$。当 $(x,y)=(1,2)$ 时满足全部约束且取等号，故最大值为 $4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图所示的程序框图，若输入的 $a$ 值为 $1$，则输出的 $k$ 值为#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([B],),
  explanation: [初始化 $b=1,k=0$。第一次更新后 $a=-1/2 !=b$，令 $k=1$；第二次更新后 $a=-2 !=b$，令 $k=2$；第三次更新后 $a=1=b$，直接输出 $k=2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $bold(a),bold(b)$ 是向量，则“$abs(bold(a))=abs(bold(b))$”是“$abs(bold(a)+bold(b))=abs(bold(a)-bold(b))$”的#choice-placeholder()。],
  choices: (
    [充分而不必要条件],
    [必要而不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([D],),
  explanation: [平方后比较，后一个条件等价于 $bold(a) dot bold(b)=0$。
    取 $bold(a)=bold(b)=(1,0)$，两向量等长但数量积非零，故不充分；取 $bold(a)=(1,0),bold(b)=(0,2)$，数量积为零但不等长，故不必要。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $x,y in RR$，且 $x>y>0$，则#choice-placeholder()。],
  choices: (
    [$1/x-1/y>0$],
    [$sin x-sin y>0$],
    [$(1/2)^x-(1/2)^y<0$],
    [$ln x+ln y>0$],
  ),
  answers: ([C],),
  explanation: [#step[选项 A][$1/x<1/y$，故该项错误。]
    #step[选项 B][取 $x=pi,y=pi/2$，得 $sin x-sin y=-1<0$，故该项错误。]
    #step[选项 C][函数 $y=(1/2)^x$ 严格递减，故 $(1/2)^x<(1/2)^y$，该项正确。]
    #step[选项 D][取 $x=1,y=1/2$，得 $ln x+ln y=-ln 2<0$，故该项错误。]],
)
#question(
  "single-choice",
  score: 5,
  stem: [某三棱锥的三视图如图所示，则该三棱锥的体积为#choice-placeholder()。
    #figure(three-views())],
  choices: ([$1/6$], [$1/3$], [$1/2$], [$1$]),
  answers: ([A],),
  explanation: [可将底面三个顶点取为 $(1,0,0)$、$(2,0,0)$、$(2,1,0)$，锥顶取为 $(0,0,1)$，其三视图与题图一致。
    底面是两条直角边均为 $1$ 的直角三角形，高为 $1$，所以体积为 $V=1/3 times (1/2 times 1 times 1) times 1=1/6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [将函数 $y=sin(2x-pi/3)$ 图象上的点 $P(pi/4,t)$ 向左平移 $s$（$s>0$）个单位长度得到点 $P'$。若 $P'$ 位于函数 $y=sin 2x$ 的图象上，则#choice-placeholder()。],
  choices: (
    [$t=1/2$，$s$ 的最小值为 $pi/6$],
    [$t=sqrt(3)/2$，$s$ 的最小值为 $pi/6$],
    [$t=1/2$，$s$ 的最小值为 $pi/3$],
    [$t=sqrt(3)/2$，$s$ 的最小值为 $pi/3$],
  ),
  answers: ([A],),
  explanation: [$t=sin(pi/2-pi/3)=1/2$，且 $P'=(pi/4-s,1/2)$，所以 $sin(pi/2-2s)=cos 2s=1/2$。
    因此 $s=k pi plus.minus pi/6$（$k in ZZ$），最小正值为 $pi/6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [袋中装有偶数个球，其中红球、黑球各占一半。甲、乙、丙是三个空盒。每次从袋中任意取出两个球，将其中一个球放入甲盒，如果这个球是红球，就将另一个球放入乙盒，否则就放入丙盒。重复上述过程，直到袋中所有球都被放入盒中，则#choice-placeholder()。],
  choices: (
    [乙盒中黑球不多于丙盒中黑球],
    [乙盒中红球与丙盒中黑球一样多],
    [乙盒中红球不多于丙盒中红球],
    [乙盒中黑球与丙盒中红球一样多],
  ),
  answers: ([B],),
  explanation: [设取出两红、两黑、一红一黑的次数分别为 $r,b,m$。由红球、黑球总数相等，得 $2r+m=2b+m$，故 $r=b$。
    乙盒中的红球恰好来自“两红”，每次贡献一个；丙盒中的黑球恰好来自“两黑”，每次贡献一个。因此两者一样多。],
)
#section[填空题：共 6 小题，每小题 5 分，共 30 分。]
#question(
  "fill-in",
  score: 5,
  stem: [设 $a in RR$，若复数 $(1+i)(a+i)$ 在复平面内对应的点位于实轴上，则 $a=$#fill-placeholder()。],
  answers: ([$-1$],),
  explanation: [$(1+i)(a+i)=(a-1)+(a+1)i$，对应点在实轴上当且仅当 $a+1=0$，故 $a=-1$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在 $(1-2x)^6$ 的展开式中，$x^2$ 的系数为#fill-placeholder()。（用数字作答）],
  answers: ([$60$],),
  explanation: [含 $x^2$ 的项为 $C_6^2 (-2x)^2=60x^2$，故系数为 $60$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在极坐标系中，直线 $rho cos theta-sqrt(3)rho sin theta-1=0$ 与圆 $rho=2cos theta$ 交于 $A,B$ 两点，则 $abs(A B)=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [直线的直角坐标方程为 $x-sqrt(3)y-1=0$，圆的方程为 $(x-1)^2+y^2=1$。直线经过圆心 $(1,0)$，所以 $A B$ 是直径，$abs(A B)=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 ${a_n}$ 为等差数列，$S_n$ 为其前 $n$ 项和。若 $a_1=6$，$a_3+a_5=0$，则 $S_6=$#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [$2a_4=a_3+a_5=0$，故公差 $d=(a_4-a_1)/3=-2$，所以 $S_6=6a_1+15d=36-30=6$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [双曲线 $x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的渐近线为正方形 $O A B C$ 的边 $O A,O C$ 所在的直线，点 $B$ 为该双曲线的焦点。若正方形 $O A B C$ 的边长为 $2$，则 $a=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [两条渐近线互相垂直，其斜率乘积 $-b^2/a^2=-1$，所以 $a=b$。
    正方形的对角线 $O B=2sqrt(2)$，即焦距参数 $c=2sqrt(2)$，从而 $a^2+b^2=c^2=8$，解得 $a=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设函数 $f(x)=cases(x^3-3x & quad x<=a, -2x & quad x>a)$。

    ① 若 $a=0$，则 $f(x)$ 的最大值为#fill-placeholder()；

    ② 若 $f(x)$ 无最大值，则实数 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$2$], [$(-infinity,-1)$]),
  explanation: [令 $g(x)=x^3-3x$，则 $g'(x)=3(x^2-1)$。$g$ 在 $(-infinity,-1)$、$(1,+infinity)$ 上递增，在 $(-1,1)$ 上递减，且 $g(-1)=2$。
    #step[当 $a=0$ 时][左段最大值为 $2$，右段 $-2x<0$，故 $f$ 的最大值为 $2$。]
    #step[判断何时无最大值][若 $a< -1$，左段最大值为 $g(a)$，且 $g(a)-(-2a)=a(a^2-1)<0$。右段的上确界为 $-2a$，但不能取到，故整个函数无最大值。
      若 $a>=-1$，右段满足 $-2x< -2a<=2$；左段包含 $x=-1$，并且在 $(-infinity,a]$ 上能取到最大值 $max(2, g(a))$。因此整个函数有最大值。
      综上，所求范围为 $(-infinity,-1)$。]],
)
#section[解答题：共 6 小题，共 80 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 13,
  stem: [在三角形 $A B C$ 中，$a^2+c^2=b^2+sqrt(2)a c$。],
  parts: (
    subquestion(
      stem: [求 $angle B$ 的大小。],
      answers: ([$pi/4$],),
      explanation: [由余弦定理，$cos B=(a^2+c^2-b^2)/(2a c)=sqrt(2)/2$。因 $0<B<pi$，故 $B=pi/4$。],
    ),
    subquestion(
      stem: [求 $sqrt(2)cos A+cos C$ 的最大值。],
      answers: ([$1$],),
      explanation: [由 $A+C=3pi/4$，得
        $
          sqrt(2)cos A+cos C=sqrt(2)cos A+cos(3pi/4-A)
        $
        $
          =sqrt(2)/2 (cos A+sin A)=cos(A-pi/4).
        $
        因 $0<A<3pi/4$，当 $A=pi/4$、$C=pi/2$ 时取到最大值 $1$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [$A,B,C$ 三个班共有 $100$ 名学生，为调查他们的体育锻炼情况，通过分层抽样获得了部分学生一周的锻炼时间，数据如表（单位：小时）：
    #table(
      columns: 9,
      align: center,
      [$A$ 班], [6], [6.5], [7], [7.5], [8], [], [], [],
      [$B$ 班], [6], [7], [8], [9], [10], [11], [12], [],
      [$C$ 班], [3], [4.5], [6], [7.5], [9], [10.5], [12], [13.5],
    )],
  parts: (
    subquestion(
      stem: [试估计 $C$ 班的学生人数。],
      answers: ([$40$ 人。],),
      explanation: [样本总人数为 $5+7+8=20$，其中 $C$ 班占 $8/20$，故估计 $C$ 班有 $100 times 8/20=40$ 人。],
    ),
    subquestion(
      stem: [从 $A$ 班和 $C$ 班抽出的学生中，各随机选取一个人，$A$ 班选出的人记为甲，$C$ 班选出的人记为乙。假设所有学生的锻炼时间相对独立，求该周甲的锻炼时间比乙的锻炼时间长的概率。],
      answers: ([$3/8$],),
      explanation: [共有 $5 times 8=40$ 种等可能的选取结果。甲的锻炼时间依次为 $6,6.5,7,7.5,8$ 时，乙比甲时间短的选择数依次为 $2,3,3,3,4$。
        因此所求概率为 $(2+3+3+3+4)/40=15/40=3/8$。],
    ),
    subquestion(
      stem: [再从 $A,B,C$ 三班中各随机抽取一名学生，他们该周锻炼时间分别是 $7,9,8.25$（单位：小时）。这 $3$ 个新数据与表格中的数据构成的新样本的平均数记为 $mu_1$，表格中数据的平均数记为 $mu_0$，试判断 $mu_0$ 和 $mu_1$ 的大小。（结论不要求证明）],
      answers: ([$mu_0>mu_1$],),
      explanation: [原样本中三班数据之和分别为 $35,63,66$，故 $mu_0=164/20=8.2$。新增三个数据的平均数为 $(7+9+8.25)/3=97/12<8.2$，因此合并后的平均数降低，即 $mu_1<mu_0$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在四棱锥 $P-A B C D$ 中，平面 $P A D perp$ 平面 $A B C D$，$P A perp P D$，$P A=P D$，$A B perp A D$，$A B=1,A D=2,A C=C D=sqrt(5)$。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [求证：$P D perp$ 平面 $P A B$。],
      answers: ([证明见解析。],),
      explanation: [平面 $P A D$ 与平面 $A B C D$ 垂直，交线为 $A D$；又 $A B$ 在平面 $A B C D$ 内且垂直于 $A D$，故 $A B perp$ 平面 $P A D$，从而 $A B perp P D$。
        再由 $P A perp P D$，且 $P A$ 与 $A B$ 相交于 $A$，得 $P D perp$ 平面 $P A B$。],
    ),
    subquestion(
      stem: [求直线 $P B$ 与平面 $P C D$ 所成角的正弦值。],
      answers: ([$sqrt(3)/3$],),
      explanation: [取 $A D$ 中点 $O$，连接 $P O,C O$。由等腰直角三角形 $P A D$，得 $P O perp A D$、$P O=1$；结合两平面垂直，得 $P O perp$ 平面 $A B C D$。又 $C A=C D$，故 $C O perp A D$，$C O=2$。
        以 $O$ 为原点，$O C,O A,O P$ 方向分别为 $x,y,z$ 轴正向，建立空间直角坐标系。
        #figure(pyramid(auxiliary: true))
        $
          A=(0,1,0),quad B=(1,1,0),quad C=(2,0,0),
        $
        $
          D=(0,-1,0),quad P=(0,0,1).
        $
        平面 $P C D$ 的法向量可取 $bold(n)=(1,-2,2)$，它与 $arrow(P C)=(2,0,-1)$、$arrow(P D)=(0,-1,-1)$ 均垂直。
        又 $arrow(P B)=(1,1,-1)$，设所求角为 $theta$，则
        $
          sin theta=abs(bold(n) dot arrow(P B))/(abs(bold(n))abs(arrow(P B)))=3/(3sqrt(3))=sqrt(3)/3.
        $],
    ),
    subquestion(
      stem: [在棱 $P A$ 上是否存在点 $M$，使得 $B M parallel$ 平面 $P C D$？若存在，求 $(A M)/(A P)$ 的值；若不存在，说明理由。],
      answers: ([存在，$(A M)/(A P)=1/4$。],),
      explanation: [沿用第 (2) 问的坐标，设 $arrow(A M)=lambda arrow(A P)$，其中 $0<=lambda<=1$，则 $M=(0,1-lambda,lambda)$，$arrow(B M)=(-1,-lambda,lambda)$。
        $arrow(B M) dot bold(n)=-1+4lambda=0$ 给出 $lambda=1/4$。平面 $P C D$ 的方程为 $x-2y+2z=2$，而 $B=(1,1,0)$ 不在该平面内，所以此时 $B M$ 与该平面平行。
        因 $1/4 in (0,1)$，所求点存在，且 $(A M)/(A P)=1/4$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设函数 $f(x)=x e^(a-x)+b x$，曲线 $y=f(x)$ 在点 $(2,f(2))$ 处的切线方程为 $y=(e-1)x+4$。],
  parts: (
    subquestion(
      stem: [求 $a,b$ 的值。],
      answers: ([$a=2,b=e$。],),
      explanation: [$f'(x)=(1-x)e^(a-x)+b$。切点在给定直线上，且导数等于切线斜率，故
        $ cases(2e^(a-2)+2b=2e+2, -e^(a-2)+b=e-1). $
        解得 $e^(a-2)=1$、$b=e$，所以 $a=2,b=e$。],
    ),
    subquestion(
      stem: [求 $f(x)$ 的单调区间。],
      answers: ([单调递增区间为 $(-infinity,+infinity)$，无单调递减区间。],),
      explanation: [$f'(x)=e^(2-x) (1-x+e^(x-1))$。令 $g(x)=1-x+e^(x-1)$，则 $g'(x)=e^(x-1)-1$。
        当 $x<1$ 时 $g'(x)<0$，当 $x>1$ 时 $g'(x)>0$，故 $g(x)>=g(1)=1>0$。又 $e^(2-x)>0$，所以对任意实数 $x$ 都有 $f'(x)>0$。
        因此 $f$ 在 $(-infinity,+infinity)$ 上单调递增，无单调递减区间。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1$（$a>b>0$）的离心率为 $sqrt(3)/2$，$A(a,0),B(0,b),O(0,0)$，三角形 $O A B$ 的面积为 $1$。],
  parts: (
    subquestion(
      stem: [求椭圆 $C$ 的方程。],
      answers: ([$x^2/4+y^2=1$],),
      explanation: [由 $c/a=sqrt(3)/2$、$a^2=b^2+c^2$，得 $b=a/2$。又 $1/2 a b=1$，解得 $a=2,b=1$，所以椭圆方程为 $x^2/4+y^2=1$。],
    ),
    subquestion(
      stem: [设 $P$ 是椭圆 $C$ 上一点，直线 $P A$ 与 $y$ 轴交于点 $M$，直线 $P B$ 与 $x$ 轴交于点 $N$，求证：$abs(A N) dot abs(B M)$ 为定值。],
      answers: ([定值为 $4$。],),
      explanation: [设 $P=(u,v)$，则 $u^2+4v^2=4$。题意中两条直线有定义，故 $P !=A,B$，从而 $u<2,v<1$。
        直线方程可统一写为
        $ P A:v(x-2)-(u-2)y=0,quad P B:(v-1)x-u y+u=0. $
        因此 $M=(0,(2v)/(2-u))$，$N=(u/(1-v),0)$，并有
        $ abs(A N) dot abs(B M)=(u+2v-2)^2/((1-v)(2-u)). $
        利用 $u^2+4v^2=4$，得
        $ (u+2v-2)^2=8+4u v-4u-8v=4(1-v)(2-u). $
        所以 $abs(A N) dot abs(B M)=4$，为定值。该推导也适用于 $u=0$ 时的竖直直线 $P B$。],
    ),
  ),
)
#question(
  "solution",
  score: 13,
  stem: [设数列 $A:a_1,a_2,dots,a_N$（$N>=2$）。如果对小于 $n$（$2<=n<=N$）的每个正整数 $k$ 都有 $a_k<a_n$，则称 $n$ 是数列 $A$ 的一个“$G$ 时刻”。记 $G(A)$ 是数列 $A$ 的所有“$G$ 时刻”组成的集合。],
  parts: (
    subquestion(
      stem: [对数列 $A:-2,2,-1,1,3$，写出 $G(A)$ 的所有元素。],
      answers: ([$2,5$。],),
      explanation: [第 $2$ 项 $2$ 超过此前的 $-2$；第 $5$ 项 $3$ 超过前四项。第 $3,4$ 项都小于第 $2$ 项，故 $G(A)={2,5}$。],
    ),
    subquestion(
      stem: [证明：若数列 $A$ 中存在 $a_n$ 使得 $a_n>a_1$，则 $G(A) !=emptyset$。],
      answers: ([证明见解析。],),
      explanation: [取满足 $a_m>a_1$ 的最小下标 $m$，则 $m>=2$。对所有 $k<m$，由 $m$ 的最小性有 $a_k<=a_1<a_m$，所以 $m in G(A)$，从而 $G(A) !=emptyset$。],
    ),
    subquestion(
      stem: [证明：若数列 $A$ 满足 $a_n-a_(n-1)<=1$（$n=2,3,dots,N$），则 $G(A)$ 的元素个数不小于 $a_N-a_1$。],
      answers: ([证明见解析。],),
      explanation: [令 $m_n=max(a_1, a_2, dots, a_n)$，即前 $n$ 项的最大值，并记 $G(A)$ 的元素个数为 $r$。
        若 $n in.not G(A)$，则 $a_n<=m_(n-1)$，所以 $m_n-m_(n-1)=0$。
        若 $n in G(A)$，则 $m_n=a_n$，且 $m_(n-1)>=a_(n-1)$，所以
        $ 0<m_n-m_(n-1)=a_n-m_(n-1)<=a_n-a_(n-1)<=1. $
        因此这些增量中恰有 $r$ 个为正，每个不超过 $1$，从而
        $ a_N-a_1<=m_N-m_1=sum_(n=2)^N (m_n-m_(n-1))<=r. $
        这就证明了所求结论，也涵盖 $G(A)=emptyset$ 的情形。],
    ),
  ),
)
