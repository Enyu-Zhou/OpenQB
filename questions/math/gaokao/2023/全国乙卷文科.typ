#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2023,
  type: "普通高等学校招生全国统一考试",
  name: "全国乙卷（文科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2023/2023全国乙文(河南,江西,陕西,甘肃,青海,内蒙古,宁夏,新疆).pdf",
  regions: ("河南", "江西", "陕西", "甘肃", "青海", "内蒙古", "宁夏", "新疆"),
)

#let three-views() = cetz.canvas(length: 5mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (offset, edges) in (
    (
      (0, 6),
      (
        ((2, 1), (4, 1)),
        ((4, 1), (4, 4)),
        ((4, 4), (2, 4)),
        ((2, 4), (2, 1)),
        ((2, 3), (4, 3)),
      ),
    ),
    (
      (7, 6),
      (
        ((2, 1), (4, 1)),
        ((4, 1), (4, 3)),
        ((4, 3), (3, 3)),
        ((3, 3), (3, 4)),
        ((3, 4), (2, 4)),
        ((2, 4), (2, 1)),
      ),
    ),
    (
      (0, 0),
      (
        ((2, 2), (4, 2)),
        ((4, 2), (4, 4)),
        ((4, 4), (2, 4)),
        ((2, 4), (2, 2)),
        ((2, 3), (4, 3)),
      ),
    ),
  ) {
    scope({
      translate(offset)
      let on-edge(p) = edges.any(e => {
        let (a, b) = e
        (
          (
            p.at(0) == a.at(0)
              and a.at(0) == b.at(0)
              and calc.min(a.at(1), b.at(1)) <= p.at(1)
              and p.at(1) <= calc.max(a.at(1), b.at(1))
          )
            or (
              p.at(1) == a.at(1)
                and a.at(1) == b.at(1)
                and calc.min(a.at(0), b.at(0)) <= p.at(0)
                and p.at(0) <= calc.max(a.at(0), b.at(0))
            )
        )
      })
      for x in range(7) {
        for y in range(5) {
          if not on-edge((x, y + 0.5)) {
            line((x, y), (x, y + 1), stroke: (dash: figure-style.dash))
          }
        }
      }
      for y in range(6) {
        for x in range(6) {
          if not on-edge((x + 0.5, y)) {
            line((x, y), (x + 1, y), stroke: (dash: figure-style.dash))
          }
        }
      }
      for (a, b) in edges { line(a, b) }
    })
  }
})

#let pyramid-diagram() = cetz.canvas(length: 23mm, {
  import cetz.draw: *
  let r = calc.sqrt(2)
  let b = (0, 0, 0)
  let c = (2 * r, 0, 0)
  let a = (0, 2, 0)
  let p = (r, -1, calc.sqrt(3))
  let d = (r / 2, -0.5, calc.sqrt(3) / 2)
  let e = (r / 2, 0.5, calc.sqrt(3) / 2)
  let o = (r, 0, 0)
  let f = (r, 1, 0)
  oblique-project((1, 0), (0.45, -0.4), (0.25, 0.7), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(b, p, c, a, b)
    line(p, a, d)
    line(b, c, stroke: (dash: figure-style.dash))
    line(b, f, e, stroke: (dash: figure-style.dash))
    line(p, o, f, stroke: (dash: figure-style.dash))
    line(d, o, a, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (p, $P$, "south"),
      (a, $A$, "north"),
      (b, $B$, "east"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (e, $E$, "south-west"),
      (o, $O$, "south-west"),
      (f, $F$, "north-west"),
    ) { content(point, label, anchor: anchor, padding: 0.08) }
  })
})

#let feasible-region() = cetz.canvas(length: 10mm, {
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
    size: (6, 6),
    axis-style: "school-book",
    x-min: -2.7,
    x-max: 2.9,
    y-min: -0.6,
    y-max: 9,
    x-tick-step: none,
    y-tick-step: none,
    x-label: $x$,
    y-label: $y$,
    {
      plot.annotate(
        {
          line((-2, 8), (0, 2), (2, 4), close: true, fill: luma(90%))
          content((-2, 8), [$(-2,8)$], anchor: "south-east", padding: 0.1)
          content((0, 2), [$(0,2)$], anchor: "north-west", padding: 0.1)
          content((2, 4), [$(2,4)$], anchor: "south-west", padding: 0.1)
        },
        resize: false,
      )
    },
  )
})

#section[选择题。本大题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [$|2+i^2+2i^3|=$#choice-placeholder()。],
  choices: ([$1$], [$2$], [$sqrt(5)$], [$5$]),
  answers: ([C],),
  explanation: [$2+i^2+2i^3=1-2i$，故其模为 $sqrt(1^2+(-2)^2)=sqrt(5)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设全集 $U={0,1,2,4,6,8}$，集合 $M={0,4,6}$，$N={0,1,6}$，则 $M union complement_U N=$#choice-placeholder()。],
  choices: ([${0,2,4,6,8}$], [${0,1,4,6,8}$], [${1,2,4,6,8}$], [$U$]),
  answers: ([A],),
  explanation: [$complement_U N={2,4,8}$，故 $M union complement_U N={0,2,4,6,8}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，网格纸上绘制的是一个零件的三视图，网格小正方形的边长为 1，则该零件的表面积为#choice-placeholder()。
    #figure(three-views())
  ],
  choices: ([24], [26], [28], [30]),
  answers: ([D],),
  explanation: [该零件可看作底面为侧视图中“L”形、棱长为 2 的直棱柱。“L”形面积为 $2 times 3-1 times 1=5$，周长为 $2+2+1+1+1+3=10$，故表面积为 $2 times 5+10 times 2=30$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [记 $triangle A B C$ 的内角 $A$、$B$、$C$ 的对边分别为 $a$、$b$、$c$，若 $a cos B-b cos A=c$，且 $C=pi/5$，则 $B=$#choice-placeholder()。],
  choices: ([$pi/10$], [$pi/5$], [$(3pi)/10$], [$(2pi)/5$]),
  answers: ([C],),
  explanation: [由正弦定理，将条件化为 $sin A cos B-sin B cos A=sin C=sin(A+B)$。展开右端得 $2sin B cos A=0$。因 $sin B>0$，故 $A=pi/2$，从而 $B=pi-pi/2-pi/5=(3pi)/10$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $f(x)=(x e^x)/(e^(a x)-1)$ 是偶函数，则 $a=$#choice-placeholder()。],
  choices: ([$-2$], [$-1$], [$1$], [$2$]),
  answers: ([D],),
  explanation: [$a=0$ 时分母恒为 0，不能定义题设函数，故 $a!=0$。当 $x!=0$ 时，$f(-x)=(x e^((a-1)x))/(e^(a x)-1)$。由 $f(-x)=f(x)$ 得 $e^((a-1)x)=e^x$，故 $a=2$；此时定义域关于原点对称，且满足偶函数条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知正方形 $A B C D$ 的边长为 2，$E$ 为 $A B$ 的中点，则 $arrow(E C) dot arrow(E D)=$#choice-placeholder()。],
  choices: ([$sqrt(5)$], [$3$], [$2sqrt(5)$], [$5$]),
  answers: ([B],),
  explanation: [取 $A=(0,0)$，$B=(2,0)$，$C=(2,2)$，$D=(0,2)$，则 $E=(1,0)$，$arrow(E C)=(1,2)$，$arrow(E D)=(-1,2)$，故数量积为 $-1+4=3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $O$ 为平面直角坐标系的坐标原点，在区域 ${ (x,y) | 1<=x^2+y^2<=4 }$ 内随机取一点，记该点为 $A$，则直线 $O A$ 的倾斜角不大于 $pi/4$ 的概率为#choice-placeholder()。],
  choices: ([$1/8$], [$1/6$], [$1/4$], [$1/2$]),
  answers: ([C],),
  explanation: [满足条件的点分布在第一、第三象限的两个环形扇区内，每个扇区的圆心角均为 $pi/4$。由面积之比，所求概率为 $(2 times pi/4)/(2pi)=1/4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若函数 $f(x)=x^3+a x+2$ 存在 3 个零点，则 $a$ 的取值范围是#choice-placeholder()。],
  choices: ([$(-infinity,-2)$], [$(-infinity,-3)$], [$(-4,-1)$], [$(-3,0)$]),
  answers: ([B],),
  explanation: [
    当 $a>=0$ 时，函数严格递增，只有一个零点。
    当 $a<0$ 时，令 $t=sqrt(-a/3)>0$，则 $f'(x)=3(x^2-t^2)$，函数在 $(-infinity,-t)$、$(t,+infinity)$ 递增，在 $(-t,t)$ 递减。极大值为 $f(-t)=2+2t^3>0$，极小值为 $f(t)=2-2t^3$。
    结合函数在左右无穷处的趋向，恰有 3 个零点当且仅当 $f(t)<0$，即 $t>1$，亦即 $a< -3$。
  ],
)
#question(
  "single-choice",
  score: 5,
  stem: [某学校举办作文比赛，共设 6 个主题，每位参赛同学从中随机抽取一个主题准备作文。则甲、乙两位参赛同学抽到不同主题的概率为#choice-placeholder()。],
  choices: ([$5/6$], [$2/3$], [$1/2$], [$1/3$]),
  answers: ([A],),
  explanation: [固定甲抽到的主题，乙的 6 种等可能结果中有 5 种与甲不同，故所求概率为 $5/6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=sin(omega x+phi)$ 在区间 $(pi/6,(2pi)/3)$ 单调递增，直线 $x=pi/6$ 和 $x=(2pi)/3$ 为函数 $y=f(x)$ 的图象的两条对称轴，则 $f(-(5pi)/12)=$#choice-placeholder()。],
  choices: ([$-sqrt(3)/2$], [$-1/2$], [$1/2$], [$sqrt(3)/2$]),
  answers: ([D],),
  explanation: [区间两端必为相邻的极小值点、极大值点，故半个周期为 $(2pi)/3-pi/6=pi/2$。函数可写为 $f(x)=-cos(2(x-pi/6))$，于是 $f(-(5pi)/12)=-cos(-(7pi)/6)=sqrt(3)/2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $x$、$y$ 满足 $x^2+y^2-4x-2y-4=0$，则 $x-y$ 的最大值是#choice-placeholder()。],
  choices: ([$1+(3sqrt(2))/2$], [$4$], [$1+3sqrt(2)$], [$7$]),
  answers: ([C],),
  explanation: [将方程化为 $(x-2)^2+(y-1)^2=9$，可设 $x=2+3cos theta$，$y=1+3sin theta$。则 $x-y=1+3sqrt(2)cos(theta+pi/4)<=1+3sqrt(2)$，取 $theta=-pi/4$ 时等号成立。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $A$、$B$ 为双曲线 $x^2-y^2/9=1$ 上两点，下列四个点中，可以为线段 $A B$ 中点的是#choice-placeholder()。],
  choices: ([$(1,1)$], [$(-1,2)$], [$(1,3)$], [$(-1,-4)$]),
  answers: ([D],),
  explanation: [
    设中点 $M=(u,v)$，端点为 $(u+h,v+k)$、$(u-h,v-k)$。将两点代入双曲线方程，相减、相加得
    $ u h-v k/9=0, quad u^2-v^2/9+h^2-k^2/9=1. $
    四个选项均有 $u!=0$，故可令 $(h,k)=t(v,9u)$，其中 $t!=0$。记 $q=u^2-v^2/9$，则上式化为 $q(1-9t^2)=1$。因此须有 $q!=0$ 且 $t^2=(q-1)/(9q)>0$；反之，满足这两个条件时可由上述表达式构造两个不同端点。
    四个选项的 $q$ 依次为 $8/9$、$5/9$、0、$-7/9$，仅最后一个满足条件。
  ],
)

#section[填空题。本大题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知点 $A(1,sqrt(5))$ 在抛物线 $C:y^2=2p x$ 上，则 $A$ 到 $C$ 的准线的距离为#fill-placeholder()。],
  answers: ([$9/4$],),
  explanation: [代入点 $A$ 得 $p=5/2$，准线为 $x=-p/2=-5/4$。故所求距离为 $1+5/4=9/4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $theta in (0,pi/2)$，$tan theta=1/2$，则 $sin theta-cos theta=$#fill-placeholder()。],
  answers: ([$-sqrt(5)/5$],),
  explanation: [因 $theta$ 为锐角，$sin theta>0$，$cos theta>0$。由 $cos theta=2sin theta$ 及 $sin^2 theta+cos^2 theta=1$，得 $sin theta=1/sqrt(5)$，$cos theta=2/sqrt(5)$，故所求值为 $-sqrt(5)/5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $x$、$y$ 满足约束条件 $cases(x-3y<=-1, x+2y<=9, 3x+y>=7)$，则 $z=2x-y$ 的最大值为#fill-placeholder()。],
  answers: ([$8$],),
  explanation: [将前两个不等式相加，得 $z=2x-y<=8$。当 $(x,y)=(5,2)$ 时满足全部约束，且 $z=8$，故最大值为 8。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知点 $S$、$A$、$B$、$C$ 均在半径为 2 的球面上，$triangle A B C$ 是边长为 3 的等边三角形，$S A perp$ 平面 $A B C$，则 $S A=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [设球心为 $O$，其在平面 $A B C$ 上的投影为 $H$，则 $H$ 为等边三角形的外心，$H A=3/sqrt(3)=sqrt(3)$。于是 $O H=sqrt(2^2-H A^2)=1$。又 $O$ 在弦 $S A$ 的垂直平分面上，而 $S A$ 垂直于底面，故 $O$ 到底面的距离为 $(S A)/2$，从而 $S A=2$。],
)

#section[解答题。共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17—21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [
    某厂为比较甲、乙两种工艺对橡胶产品伸缩率的处理效应，进行 10 次配对试验，每次配对试验选用材质相同的两个橡胶产品，随机地选其中一个用甲工艺处理，另一个用乙工艺处理，测量处理后的橡胶产品的伸缩率。甲、乙两种工艺处理后的橡胶产品的伸缩率分别记为 $x_i$、$y_i$（$i=1,2,dots.c,10$）。试验结果如下：
    #table(
      columns: 11,
      align: center + horizon,
      inset: 4pt,
      [试验序号 $i$], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
      [伸缩率 $x_i$],
      [545],
      [533],
      [551],
      [522],
      [575],
      [544],
      [541],
      [568],
      [596],
      [548],

      [伸缩率 $y_i$],
      [536],
      [527],
      [543],
      [530],
      [560],
      [533],
      [522],
      [550],
      [576],
      [536],
    )
    记 $z_i=x_i-y_i$（$i=1,2,dots.c,10$），记 $z_1,z_2,dots.c,z_10$ 的样本平均数为 $overline(z)$，样本方差为 $s^2$。
  ],
  parts: (
    subquestion(
      stem: [求 $overline(z)$、$s^2$；],
      answers: ([$overline(z)=11$，$s^2=61$],),
      explanation: [十个差值依次为 9、6、8、$-8$、15、11、19、18、20、12，故
        $
          overline(z)=110/10=11, quad s^2=1/10 sum_(i=1)^10 (z_i-11)^2=610/10=61.
        $
      ],
    ),
    subquestion(
      stem: [判断甲工艺处理后的橡胶产品的伸缩率较乙工艺处理后的橡胶产品的伸缩率是否有显著提高（如果 $overline(z)>=2sqrt(s^2/10)$，则认为甲工艺处理后的橡胶产品的伸缩率较乙工艺处理后的橡胶产品的伸缩率有显著提高，否则不认为有显著提高）。],
      answers: ([有显著提高。],),
      explanation: [因 $11^2=121>4 times 61/10=24.4$，故 $overline(z)=11>2sqrt(61/10)$。按题设判据，认为甲工艺处理后的伸缩率较乙工艺有显著提高。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [记 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和。已知 $a_2=11$，$S_10=40$。],
  parts: (
    subquestion(
      stem: [求 ${a_n}$ 的通项公式；],
      answers: ([$a_n=15-2n$],),
      explanation: [设公差为 $d$，由 $a_1+d=11$、$10a_1+45d=40$，解得 $a_1=13$，$d=-2$。故 $a_n=13-2(n-1)=15-2n$。],
    ),
    subquestion(
      stem: [求数列 ${|a_n|}$ 的前 $n$ 项和 $T_n$。],
      answers: ([$T_n=cases(14n-n^2 & quad 1<=n<=7, n^2-14n+98 & quad n>=8)$],),
      explanation: [
        原数列的前 $n$ 项和为 $S_n=n(13+15-2n)/2=14n-n^2$。当 $1<=n<=7$ 时，前 $n$ 项均为正，故 $T_n=S_n=14n-n^2$；当 $n>=8$ 时，从第 8 项起各项均为负，故
        $ T_n=S_7-(S_n-S_7)=2S_7-S_n=n^2-14n+98. $
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在三棱锥 $P-A B C$ 中，$A B perp B C$，$A B=2$，$B C=2sqrt(2)$，$P B=P C=sqrt(6)$，$B P$、$A P$、$B C$ 的中点分别为 $D$、$E$、$O$，点 $F$ 在 $A C$ 上，$B F perp A O$。
    #figure(pyramid-diagram())
  ],
  parts: (
    subquestion(
      stem: [证明：$E F parallel$ 平面 $A D O$；],
      answers: ([证明见解析。],),
      explanation: [
        设 $arrow(A F)=t arrow(A C)$，则 $arrow(B F)=(1-t)arrow(B A)+t arrow(B C)$，$arrow(A O)=-arrow(B A)+1/2 arrow(B C)$。
        因 $A B perp B C$，由 $B F perp A O$ 得 $-4(1-t)+4t=0$，故 $t=1/2$，即 $F$ 为 $A C$ 中点。
        由三角形中位线，$E F parallel P C$，$D O parallel P C$，故 $E F parallel D O$。平面 $A D O$ 与平面 $A B C$ 交于 $A O$，而 $F in.not A O$，故 $F$ 不在平面 $A D O$ 内。于是 $E F parallel$ 平面 $A D O$。
      ],
    ),
    subquestion(
      stem: [若 $angle P O F=120 degree$，求三棱锥 $P-A B C$ 的体积。],
      answers: ([$(2sqrt(6))/3$],),
      explanation: [
        由 $P B=P C$ 及 $O$ 为 $B C$ 中点，得 $P O perp B C$，$P O=sqrt(P B^2-B O^2)=2$。由第（1）问，$F$ 为 $A C$ 中点，所以 $O F parallel B A$，从而 $O F perp B C$。故 $B C perp$ 平面 $P O F$。
        在平面 $P O F$ 内，过 $P$ 作 $P H perp O F$，垂足 $H$ 在射线 $O F$ 的反向延长线上。则 $P H perp B C$，又 $B C$ 与直线 $O F$ 相交，故 $P H perp$ 平面 $A B C$。因 $angle P O H=60 degree$，棱锥高为 $P H=P O sin 60 degree=sqrt(3)$。
        底面积为 $1/2 A B dot B C=2sqrt(2)$，故体积 $V=1/3 times 2sqrt(2) times sqrt(3)=(2sqrt(6))/3$。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=(1/x+a)ln(1+x)$。],
  parts: (
    subquestion(
      stem: [当 $a=-1$ 时，求曲线 $y=f(x)$ 在点 $(1,f(1))$ 处的切线方程；],
      answers: ([$y=-(ln 2)(x-1)$],),
      explanation: [此时 $f(1)=0$，且 $f'(x)=-ln(1+x)/x^2+(1/x-1)/(1+x)$，故 $f'(1)=-ln 2$，切线方程为 $y=-(ln 2)(x-1)$。],
    ),
    subquestion(
      stem: [若 $f(x)$ 在 $(0,+infinity)$ 单调递增，求 $a$ 的取值范围。],
      answers: ([$[1/2,+infinity)$],),
      explanation: [
        #step[化为辅助函数的符号问题][
          对 $x>0$，有 $f'(x)=h(x)/(x^2(1+x))$，其中 $h(x)=a x^2+x-(1+x)ln(1+x)$。补充定义 $h(0)=0$，则 $h'(x)=2a x-ln(1+x)$，$h'(0)=0$，$h''(x)=2a-1/(1+x)$。
        ]
        #step[证明充分性与必要性][
          当 $a>=1/2$ 时，对任意 $x>0$ 均有 $h''(x)>0$，从而 $h'(x)>h'(0)=0$，$h(x)>h(0)=0$，故 $f'(x)>0$，满足题意。
          当 $a<1/2$ 时，$h''(0)=2a-1<0$，由连续性，$h''$ 在 0 右侧某小区间内为负，进而该区间内 $h'<0$、$h<0$、$f'<0$，不合题意。
          因此 $a$ 的取值范围为 $[1/2,+infinity)$。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知椭圆 $C:y^2/a^2+x^2/b^2=1$（$a>b>0$）的离心率为 $sqrt(5)/3$，点 $A(-2,0)$ 在 $C$ 上。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程；],
      answers: ([$x^2/4+y^2/9=1$],),
      explanation: [由 $A(-2,0)$ 在椭圆上，得 $b=2$。又 $1-b^2/a^2=5/9$，故 $a^2=9$，椭圆方程为 $x^2/4+y^2/9=1$。],
    ),
    subquestion(
      stem: [过点 $(-2,3)$ 的直线交 $C$ 于 $P$、$Q$ 两点，直线 $A P$、$A Q$ 与 $y$ 轴的交点分别为 $M$、$N$，证明：线段 $M N$ 的中点为定点。],
      answers: ([定点为 $(0,3)$，证明见解析。],),
      explanation: [
        #step[用过端点的直线斜率表示交点][
          直线 $P Q$ 不可能为 $x=-2$，否则不能与椭圆有两个不同交点，故可设其方程为 $y=k(x+2)+3$，且 $P,Q!=A$。
          设 $A P$、$A Q$ 的斜率分别为 $u$、$v$。将 $y=u(x+2)$ 代入椭圆，除去交点 $A$，得
          $ x_P+2=36/(9+4u^2), quad y_P=(36u)/(9+4u^2). $
        ]
        #step[由两斜率之和确定中点][
          将 $P$ 代入直线 $P Q$，得 $k=u-3/(x_P+2)=u-(9+4u^2)/12$，即 $4u^2-12u+9+12k=0$。同理 $v$ 也满足此方程。因 $P,Q$ 不同，$u!=v$，由韦达定理得 $u+v=3$。
          又 $M=(0,2u)$，$N=(0,2v)$，故其中点恒为 $(0,u+v)=(0,3)$。
        ]
      ],
    ),
  ),
)

请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。

    在直角坐标系 $x O y$ 中，以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，曲线 $C_1$ 的极坐标方程为 $rho=2sin theta$（$pi/4<=theta<=pi/2$）。曲线 $C_2:cases(x=2cos alpha, y=2sin alpha)$（$alpha$ 为参数，$pi/2<alpha<pi$）。
  ],
  parts: (
    subquestion(
      stem: [写出 $C_1$ 的直角坐标方程；],
      answers: ([$x^2+(y-1)^2=1$，$0<=x<=1$，$1<=y<=2$],),
      explanation: [由 $rho^2=2rho sin theta$ 得 $x^2+y^2=2y$。又 $x=sin 2theta$，$y=1-cos 2theta$，且 $2theta in [pi/2,pi]$，故 $C_1$ 为圆 $x^2+(y-1)^2=1$ 上满足 $0<=x<=1$、$1<=y<=2$ 的圆弧。],
    ),
    subquestion(
      stem: [若直线 $y=x+m$ 既与 $C_1$ 没有公共点，也与 $C_2$ 没有公共点，求 $m$ 的取值范围。],
      answers: ([$(-infinity,0) union (2sqrt(2),+infinity)$],),
      explanation: [
        在 $C_1$ 上，$x in [0,1]$，$y=1+sqrt(1-x^2)$，故 $y-x$ 连续递减，值域为 $[0,2]$。
        在 $C_2$ 上，$y-x=2(sin alpha-cos alpha)=2sqrt(2)sin(alpha-pi/4)$，而 $alpha-pi/4 in (pi/4,(3pi)/4)$，故值域为 $(2,2sqrt(2)]$。
        因此两条曲线上 $y-x$ 的全部取值组成 $[0,2sqrt(2)]$。直线与两曲线均无公共点，当且仅当 $m in (-infinity,0) union (2sqrt(2),+infinity)$。
      ],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。

    已知 $f(x)=2|x|+|x-2|$。
  ],
  parts: (
    subquestion(
      stem: [求不等式 $f(x)<=6-x$ 的解集；],
      answers: ([$[-2,2]$],),
      explanation: [
        $ f(x)=cases(2-3x & quad x<0, x+2 & quad 0<=x<=2, 3x-2 & quad x>2). $
        当 $x<0$ 时，不等式化为 $2-3x<=6-x$，得 $-2<=x<0$；当 $0<=x<=2$ 时，化为 $x+2<=6-x$，该段全部满足；当 $x>2$ 时，化为 $3x-2<=6-x$，无解。故解集为 $[-2,2]$。
      ],
    ),
    subquestion(
      stem: [在直角坐标系 $x O y$ 中，求不等式组 $cases(f(x)<=y, x+y-6<=0)$ 所确定的平面区域的面积。],
      answers: ([$8$],),
      explanation: [
        所求区域为顶点 $(-2,8)$、$(0,2)$、$(2,4)$ 围成的三角形。直线 $y=6-x$ 与 $y$ 轴交于 $(0,6)$，用该点和 $(0,2)$ 的连线将区域分成两个三角形，公共底边长为 4，两高均为 2，故总面积为 $1/2 times 4 times (2+2)=8$。
        #figure(feasible-region())
      ],
    ),
  ),
)
