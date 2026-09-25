#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校招生全国统一考试",
  name: "全国甲卷（理科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2022/2022全国甲理(云南,广西,贵州,西藏,四川).pdf",
  regions: ("云南", "广西", "贵州", "西藏", "四川"),
)

#let survey-diagram() = {
  set text(size: 8pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.15,
      shared-zero: false,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
      x: (label: (anchor: "west", offset: 0.2)),
    ))
    plot.plot(
      size: (8, 5.2),
      axis-style: "school-book",
      x-min: 0,
      x-max: 11,
      y-min: 55,
      y-max: 104,
      y-break: true,
      x-label: [居民编号],
      y-label: [正确率/%],
      x-ticks: range(1, 11),
      x-tick-step: none,
      y-ticks: range(60, 101, step: 5),
      y-tick-step: none,
      {
        plot.annotate(resize: false, {
          for y in range(60, 101, step: 5) {
            line((0, y), (10, y), stroke: (paint: luma(65%)))
          }
          for (i, y) in (65, 60, 70, 60, 65, 75, 90, 85, 80, 95).enumerate() {
            content((i + 1, y), $ast$)
          }
          for (i, y) in (90, 85, 80, 90, 85, 85, 95, 100, 85, 100).enumerate() {
            circle((i + 1, y), radius: (0.07, 0.48), fill: black, stroke: none)
          }
        })
      },
    )
    content((8.2, 3.8), [$ast$ 讲座前], anchor: "west")
    content((8.2, 3.2), [$bullet$ 讲座后], anchor: "west")
  })
}
#let three-views() = cetz.canvas(length: 4mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (offset, edges) in (
    (
      (0, 6),
      (((1, 1), (5, 1)), ((5, 1), (3, 3)), ((3, 3), (1, 3)), ((1, 3), (1, 1))),
    ),
    (
      (8, 6),
      (((2, 1), (4, 1)), ((4, 1), (4, 3)), ((4, 3), (2, 3)), ((2, 3), (2, 1))),
    ),
    (
      (0, 0),
      (
        ((1, 1), (5, 1)),
        ((5, 1), (5, 3)),
        ((5, 3), (1, 3)),
        ((1, 3), (1, 1)),
        ((3, 1), (3, 3)),
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
        for y in range(4) {
          if not on-edge((x, y + 0.5)) {
            line((x, y), (x, y + 1), stroke: (paint: luma(65%)))
          }
        }
      }
      for y in range(5) {
        for x in range(6) {
          if not on-edge((x + 0.5, y)) {
            line((x, y), (x + 1, y), stroke: (paint: luma(65%)))
          }
        }
      }
      for (a, b) in edges { line(a, b) }
    })
  }
})
#let graph-option(kind) = {
  set text(size: 8pt)
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
      size: (3.3, 3),
      axis-style: "school-book",
      x-min: -2,
      x-max: 2,
      y-min: -2,
      y-max: 2,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      y-ticks: (1,),
      x-ticks: (
        (
          -calc.pi / 2,
          move(dy: if kind == "A" or kind == "D" { -25pt } else {
            0pt
          })[$-pi/2$],
        ),
        (
          calc.pi / 2,
          move(dy: if kind == "C" or kind == "D" { -25pt } else {
            0pt
          })[$pi/2$],
        ),
      ),
      {
        plot.add(
          x => {
            let y = (calc.pow(3, x) - calc.pow(3, -x)) * calc.cos(x * 1rad)
            if kind == "A" { y } else if kind == "B" { calc.abs(y) } else if (
              kind == "C"
            ) { -y } else { -calc.abs(y) }
          },
          domain: (-calc.pi / 2, calc.pi / 2),
          samples: 120,
          style: (stroke: figure-style.thickness),
        )
      },
    )
  })
}
#let arc-diagram() = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let h = calc.sqrt(3)
  line((-1, h), (0, 0), (1, h), (-1, h))
  line(
    ..range(60, 121, step: 2).map(t => (
      2 * calc.cos(t * 1deg),
      2 * calc.sin(t * 1deg),
    )),
  )
  line((0, h), (0, 2))
  for (p, label, anchor) in (
    ((-1, h), $A$, "east"),
    ((1, h), $B$, "west"),
    ((0, h), $C$, "north"),
    ((0, 2), $D$, "south"),
    ((0, 0), $O$, "north"),
  ) { content(p, label, anchor: anchor, padding: 3pt) }
})
#let pyramid-diagram() = cetz.canvas(length: 23mm, {
  import cetz.draw: *
  let h = calc.sqrt(3) / 2
  let a = (0, 0, 0)
  let b = (2, 0, 0)
  let d = (0.5, h, 0)
  let c = (1.5, h, 0)
  let p = (0.5, h, calc.sqrt(3))
  oblique-project((1, 0), (-0.18, 0.42), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, p, b, a)
    line(a, d, c, b, stroke: (dash: figure-style.dash))
    line(p, d, b, stroke: (dash: figure-style.dash))
    line(p, c, stroke: (dash: figure-style.dash))
    for (v, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "south-west"),
      (d, $D$, "south-west"),
      (p, $P$, "south"),
    ) { content(v, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题]
#question(
  "single-choice",
  stem: [若 $z=-1+sqrt(3)"i"$，则 $z/(z overline(z)-1)=$#choice-placeholder()。],
  choices: (
    [$-1+sqrt(3)"i"$],
    [$-1-sqrt(3)"i"$],
    [$-1/3+sqrt(3)/3 "i"$],
    [$-1/3-sqrt(3)/3 "i"$],
  ),
  answers: ([C],),
  explanation: [$z overline(z)=abs(z)^2=4$，故 $z/(z overline(z)-1)=z/3=-1/3+sqrt(3)/3 "i"$。],
)
#question(
  "single-choice",
  stem: [某社区通过公益讲座普及居民的垃圾分类知识。为了解讲座效果，随机抽取 10 位社区居民，让他们在讲座前和讲座后各回答一份垃圾分类知识问卷，答题正确率如下图，则#choice-placeholder()。
    #figure(survey-diagram())],
  choices: (
    [讲座前问卷答题的正确率的中位数小于 70%],
    [讲座后问卷答题的正确率的平均数大于 85%],
    [讲座前问卷答题的正确率的标准差小于讲座后正确率的标准差],
    [讲座后问卷答题的正确率的极差大于讲座前正确率的极差],
  ),
  answers: ([B],),
  explanation: [
    #step[选项 A、B][讲座前的中位数为 $(70%+75%)/2=72.5%$，A 错误；讲座后的平均数为 $(90+85+80+90+85+85+95+100+85+100)%/10=89.5%$，B 正确。]
    #step[选项 C、D][以百分数前的数值计算，讲座前的方差为 $142.25$，讲座后的方差为 $42.25$，故前者的标准差更大，C 错误。讲座前后的极差分别为 $35%$、$20%$，D 错误。]
  ],
)
#question(
  "single-choice",
  stem: [设全集 $U={-2,-1,0,1,2,3}$，集合 $A={-1,2}$，$B={x | x^2-4x+3=0}$，则 $complement_U (A union B)=$#choice-placeholder()。],
  choices: ([${1,3}$], [${0,3}$], [${-2,1}$], [${-2,0}$]),
  answers: ([D],),
  explanation: [$B={1,3}$，故 $A union B={-1,1,2,3}$，其在 $U$ 中的补集为 ${-2,0}$。],
)
#question(
  "single-choice",
  stem: [如图，网格纸上绘制的是一个多面体的三视图，网格小正方形的边长为 $1$，则该多面体的体积为#choice-placeholder()。
    #figure(three-views())],
  choices: ([$8$], [$12$], [$16$], [$20$]),
  answers: ([B],),
  explanation: [该多面体是直四棱柱，底面为上、下底分别为 $2,4$，高为 $2$ 的梯形，棱柱高为 $2$，所以体积为 $(2+4)/2 times 2 times 2=12$。],
)
#question(
  "single-choice",
  stem: [函数 $y=(3^x-3^(-x))cos x$ 在区间 $[-pi/2,pi/2]$ 的图像大致为#choice-placeholder()。],
  choices: (
    [#figure(graph-option("A"))],
    [#figure(graph-option("B"))],
    [#figure(graph-option("C"))],
    [#figure(graph-option("D"))],
  ),
  answers: ([A],),
  explanation: [函数为奇函数，排除 B、D。在 $(0,pi/2)$ 上，$3^x-3^(-x)>0$ 且 $cos x>0$，故函数值为正，排除 C，选 A。],
)
#question(
  "single-choice",
  stem: [当 $x=1$ 时，函数 $f(x)=a ln x+b/x$ 取得最大值 $-2$，则 $f'(2)=$#choice-placeholder()。],
  choices: ([$-1$], [$-1/2$], [$1/2$], [$1$]),
  answers: ([B],),
  explanation: [由 $f(1)=b=-2$，以及 $f'(1)=a-b=0$，得 $a=b=-2$。故 $f'(2)=a/2-b/4=-1/2$。],
)
#question(
  "single-choice",
  stem: [在长方体 $A B C D-A_1 B_1 C_1 D_1$ 中，已知 $B_1 D$ 与平面 $A B C D$ 和平面 $A A_1 B_1 B$ 所成的角均为 $30 degree$，则#choice-placeholder()。],
  choices: (
    [$A B=2A D$],
    [$A B$ 与平面 $A B_1 C_1 D$ 所成的角为 $30 degree$],
    [$A C=C B_1$],
    [$B_1 D$ 与平面 $B B_1 C_1 C$ 所成的角为 $45 degree$],
  ),
  answers: ([D],),
  explanation: [设 $A B=x,A D=y,A A_1=z$，$B_1 D=L=sqrt(x^2+y^2+z^2)$。由两线面角均为 $30 degree$，得 $y/L=z/L=1/2$，所以 $x^2=L^2-y^2-z^2=L^2/2$。
    平面 $B B_1 C_1 C$ 的法向方向平行于 $A B$，故 $B_1 D$ 与该平面所成角的正弦为 $x/L=1/sqrt(2)$，即该角为 $45 degree$，D 正确。],
)
#question(
  "single-choice",
  stem: [沈括的《梦溪笔谈》中收录了计算圆弧长度的“会圆术”。如图，弧 $A B$ 以 $O$ 为圆心，$O A$ 为半径，$C$ 是线段 $A B$ 的中点，$D$ 在弧 $A B$ 上，$C D perp A B$。“会圆术”给出弧长近似值 $s$ 的公式为 $s=A B+(C D)^2/(O A)$。当 $O A=2$，$angle A O B=60 degree$ 时，$s=$#choice-placeholder()。
    #figure(arc-diagram())],
  choices: (
    [$(11-3sqrt(3))/2$],
    [$(11-4sqrt(3))/2$],
    [$(9-3sqrt(3))/2$],
    [$(9-4sqrt(3))/2$],
  ),
  answers: ([B],),
  explanation: [$triangle O A B$ 为等边三角形，故 $A B=2$，$O C=sqrt(3)$，$C D=2-sqrt(3)$。代入得 $s=2+(2-sqrt(3))^2/2=(11-4sqrt(3))/2$。],
)
#question(
  "single-choice",
  stem: [甲、乙两个圆锥的母线长相等，侧面展开图的圆心角之和为 $2pi$，侧面积分别为 $S_"甲",S_"乙"$，体积分别为 $V_"甲",V_"乙"$。若 $S_"甲"/S_"乙"=2$，则 $V_"甲"/V_"乙"=$#choice-placeholder()。],
  choices: ([$sqrt(5)$], [$2sqrt(2)$], [$sqrt(10)$], [$5sqrt(10)/4$]),
  answers: ([C],),
  explanation: [设母线长为 $l$，底面半径分别为 $r_1,r_2$。由侧面积比得 $r_1=2r_2$；由扇形弧长之和为 $2pi l$，得 $r_1+r_2=l$，故 $r_1=2l/3,r_2=l/3$。
    两圆锥的高分别为 $sqrt(5)l/3$、$2sqrt(2)l/3$，因此体积比为 $4 dot sqrt(5)/(2sqrt(2))=sqrt(10)$。],
)
#question(
  "single-choice",
  stem: [椭圆 $C:x^2/a^2+y^2/b^2=1(a>b>0)$ 的左顶点为 $A$，点 $P,Q$ 均在 $C$ 上，且关于 $y$ 轴对称。若直线 $A P,A Q$ 的斜率之积为 $1/4$，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$sqrt(3)/2$], [$sqrt(2)/2$], [$1/2$], [$1/3$]),
  answers: ([A],),
  explanation: [设 $P=(x,y)$，则 $Q=(-x,y)$，$A=(-a,0)$。斜率之积为 $y/(x+a) dot y/(a-x)=y^2/(a^2-x^2)=b^2/a^2=1/4$。
    故离心率 $e=sqrt(1-b^2/a^2)=sqrt(3)/2$。],
)
#question(
  "single-choice",
  stem: [设函数 $f(x)=sin(omega x+pi/3)$ 在区间 $(0,pi)$ 恰有三个极值点、两个零点，则实数 $omega$ 的取值范围是#choice-placeholder()。],
  choices: ([$[5/3,13/6)$], [$[5/3,19/6)$], [$(13/6,8/3]$], [$(13/6,19/6]$]),
  answers: ([C],),
  explanation: [
    #step[排除非正的频率][若 $omega=0$，函数为非零常函数，不满足条件。若 $omega<0$，为了出现三个极值点，相位必须经过 $-pi/2,-3pi/2,-5pi/2$，此时必经过 $0,-pi,-2pi$ 三个零点，也不满足条件。]
    #step[确定正频率的范围][$omega>0$ 时，相位区间为 $(pi/3,omega pi+pi/3)$。恰有三个极值点要求 $5pi/2<omega pi+pi/3<=7pi/2$；恰有两个零点要求 $2pi<omega pi+pi/3<=3pi$。
      取交集，得 $13/6<omega<=8/3$。]
  ],
)
#question(
  "single-choice",
  stem: [已知 $a=31/32$，$b=cos(1/4)$，$c=4sin(1/4)$，则#choice-placeholder()。],
  choices: ([$c>b>a$], [$b>a>c$], [$a>b>c$], [$a>c>b$]),
  answers: ([A],),
  explanation: [利用 $0<x<pi/2$ 时的 $sin x<x<tan x$，得 $c/b=4tan(1/4)>1$，故 $c>b$。
    又 $b=1-2sin^2(1/8)>1-2(1/8)^2=31/32=a$，所以 $c>b>a$。],
)

#section[填空题]
#question(
  "fill-in",
  stem: [设向量 $arrow(a),arrow(b)$ 的夹角的余弦值为 $1/3$，且 $abs(arrow(a))=1,abs(arrow(b))=3$，则 $(2arrow(a)+arrow(b)) dot arrow(b)=$#fill-placeholder()。],
  answers: ([$11$],),
  explanation: [$arrow(a) dot arrow(b)=1 times 3 times 1/3=1$，故所求数量积为 $2 times 1+3^2=11$。],
)
#question(
  "fill-in",
  stem: [若双曲线 $y^2-x^2/m^2=1(m>0)$ 的渐近线与圆 $x^2+y^2-4y+3=0$ 相切，则 $m=$#fill-placeholder()。],
  answers: ([$sqrt(3)/3$],),
  explanation: [圆的方程为 $x^2+(y-2)^2=1$，圆心为 $(0,2)$，半径为 $1$。渐近线为 $x plus.minus m y=0$，由相切得 $(2m)/sqrt(1+m^2)=1$，所以 $3m^2=1$，$m=sqrt(3)/3$。],
)
#question(
  "fill-in",
  stem: [从正方体的 8 个顶点中任选 4 个，则这 4 个点在同一个平面的概率为#fill-placeholder()。],
  answers: ([$6/35$],),
  explanation: [共有 $C_8^4=70$ 种选法。同一平面内的四顶点组成正方体的一个面或一个对角截面，分别有 $6$ 个，共 $12$ 种。因此概率为 $12/70=6/35$。],
)
#question(
  "fill-in",
  stem: [已知 $triangle A B C$ 中，点 $D$ 在边 $B C$ 上，$angle A D B=120 degree$，$A D=2$，$C D=2B D$。当 $(A C)/(A B)$ 取得最小值时，$B D=$#fill-placeholder()。],
  answers: ([$sqrt(3)-1$],),
  explanation: [令 $B D=x>0$，由余弦定理，$A B^2=x^2+2x+4$，$A C^2=4x^2-4x+4$，故
    $ (A C)^2/(A B)^2=4-12/((x+1)+3/(x+1))>=4-2sqrt(3). $
    当且仅当 $x+1=sqrt(3)$ 时取等号，故 $B D=sqrt(3)-1$。],
)

#section[解答题]
#question(
  "solution",
  stem: [记 $S_n$ 为数列 $\{a_n\}$ 的前 $n$ 项和，已知 $(2S_n)/n+n=2a_n+1$。],
  parts: (
    subquestion(
      stem: [证明：$\{a_n\}$ 是等差数列。],
      answers: ([证明见解析。],),
      explanation: [原式化为 $2S_n+n^2=2n a_n+n$。当 $n>=2$ 时，将此式与 $2S_(n-1)+(n-1)^2=2(n-1)a_(n-1)+n-1$ 相减，得
        $ 2a_n+2n-1=2n a_n-2(n-1)a_(n-1)+1. $
        故 $2(n-1)(a_n-a_(n-1))=2(n-1)$，所以 $a_n-a_(n-1)=1$。因此 $\{a_n\}$ 为公差是 $1$ 的等差数列。],
    ),
    subquestion(
      stem: [若 $a_4,a_7,a_9$ 成等比数列，求 $S_n$ 的最小值。],
      answers: ([$-78$],),
      explanation: [由第（1）问，$(a_1+6)^2=(a_1+3)(a_1+8)$，解得 $a_1=-12$，从而 $a_n=n-13$。
        前 $12$ 项为负，第 $13$ 项为 $0$，此后各项为正，故 $n=12$ 或 $13$ 时前 $n$ 项和最小，最小值为 $S_12=12(-12-1)/2=-78$。],
    ),
  ),
)
#question(
  "solution",
  stem: [在四棱锥 $P-A B C D$ 中，$P D perp$ 底面 $A B C D$，$C D parallel A B$，$A D=D C=C B=1$，$A B=2$，$D P=sqrt(3)$。
    #figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [证明：$B D perp P A$。],
      answers: ([证明见解析。],),
      explanation: [底面为等腰梯形。作 $D E perp A B$ 于 $E$，则 $A E=1/2$，$D E=sqrt(3)/2$，$B E=3/2$，故 $B D=sqrt(3)$。
        于是 $A D^2+B D^2=1+3=A B^2$，所以 $A D perp B D$。又 $P D perp$ 底面，故 $P D perp B D$。
        ∵ $A D$ 与 $P D$ 相交，故 $B D perp$ 平面 $P A D$，从而 $B D perp P A$。],
    ),
    subquestion(
      stem: [求 $P D$ 与平面 $P A B$ 所成的角的正弦值。],
      answers: ([$sqrt(5)/5$],),
      explanation: [以 $D$ 为原点，$D A,D B,D P$ 的方向分别为三条坐标轴的正方向，得 $A=(1,0,0)$，$B=(0,sqrt(3),0)$，$P=(0,0,sqrt(3))$。
        平面 $P A B$ 的一个法向量为 $arrow(n)=(sqrt(3),1,1)$，$arrow(D P)=(0,0,sqrt(3))$。故所求角 $theta$ 满足
        $
          sin theta=abs(arrow(n) dot arrow(D P))/(abs(arrow(n)) abs(arrow(D P)))=sqrt(3)/(sqrt(5)sqrt(3))=sqrt(5)/5.
        $],
    ),
  ),
)
#question(
  "solution",
  stem: [甲、乙两个学校进行体育比赛，比赛共设三个项目，每个项目胜方得 10 分，负方得 0 分，没有平局。三个项目结束后，总得分高的学校获得冠军。已知甲学校在三个项目中获胜的概率分别为 $0.5,0.4,0.8$，各项目的比赛结果相互独立。],
  parts: (
    subquestion(
      stem: [求甲学校获得冠军的概率。],
      answers: ([$0.6$],),
      explanation: [甲学校至少赢两项即获冠军。恰赢两项的概率为 $0.5 times 0.4 times 0.2+0.5 times 0.6 times 0.8+0.5 times 0.4 times 0.8=0.44$；三项全赢的概率为 $0.5 times 0.4 times 0.8=0.16$，故获冠军的概率为 $0.44+0.16=0.6$。],
    ),
    subquestion(
      stem: [用 $X$ 表示乙学校的总得分，求 $X$ 的分布列与期望。],
      answers: ([分布列见解析，$E(X)=13$。],),
      explanation: [乙在各项目获胜的概率分别为 $0.5,0.6,0.2$。由独立性，$P(X=30)=0.5 times 0.6 times 0.2=0.06$，$P(X=0)=0.16$。
        由第（1）问，$P(X=10)=0.44$，所以 $P(X=20)=1-0.16-0.44-0.06=0.34$。分布列为
        #table(
          columns: 5,
          align: center,
          [$X$], [$0$], [$10$], [$20$], [$30$],
          [$P$], [$0.16$], [$0.44$], [$0.34$], [$0.06$],
        )
        $ E(X)=0 times 0.16+10 times 0.44+20 times 0.34+30 times 0.06=13. $],
    ),
  ),
)
#question(
  "solution",
  stem: [设抛物线 $C:y^2=2p x(p>0)$ 的焦点为 $F$，点 $D(p,0)$，过 $F$ 的直线交 $C$ 于 $M,N$ 两点。当直线 $M D$ 垂直于 $x$ 轴时，$abs(M F)=3$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程。],
      answers: ([$y^2=4x$],),
      explanation: [此时 $M$ 的横坐标为 $p$。由抛物线的定义，$abs(M F)=p+p/2=3$，得 $p=2$，故 $C$ 的方程为 $y^2=4x$。],
    ),
    subquestion(
      stem: [设直线 $M D,N D$ 与 $C$ 的另一个交点分别为 $A,B$，记直线 $M N,A B$ 的倾斜角分别为 $alpha,beta$。当 $alpha-beta$ 取得最大值时，求直线 $A B$ 的方程。],
      answers: ([$x-sqrt(2)y-4=0$],),
      explanation: [
        #step[用参数表示焦点弦及其对应弦][抛物线上的点可写为 $(t^2,2t)$。参数为 $u,v$ 的两个不同点的弦方程为 $x=(u+v)y/2-u v$。
          ∵ $M N$ 过 $F(1,0)$，两参数之积为 $-1$。因此可设 $M=(t^2,2t)$，$N=(1/t^2,-2/t)$，其中 $t!=0$。
          同理，过 $D(2,0)$ 的弦两参数之积为 $-2$，故 $A,B$ 的参数分别为 $-2/t,2t$。
          令 $k=(t-1/t)/2$，则 $M N:x=k y+1$，$A B:x=2k y+4$。]
        #step[比较倾角并求最大值][当 $k=0$ 时，$alpha=beta=pi/2$；当 $k<0$ 时，两角均为钝角，且 $tan alpha=1/k<1/(2k)=tan beta$，故 $alpha<beta$。
          当 $k>0$ 时，$0<beta<alpha<pi/2$，于是
          $
            tan(alpha-beta)=(1/k-1/(2k))/(1+1/(2k^2))=k/(2k^2+1)=1/(2k+1/k)<=1/(2sqrt(2)).
          $
          当且仅当 $k=1/sqrt(2)$ 时等号成立。此时 $alpha-beta$ 最大，所求直线为 $x=sqrt(2)y+4$，即 $x-sqrt(2)y-4=0$。]
      ],
    ),
  ),
)
#question("solution", stem: [已知函数 $f(x)=e^x/x-ln x+x-a$。], parts: (
  subquestion(
    stem: [若 $f(x)>=0$，求实数 $a$ 的取值范围。],
    answers: ([$(-infinity,e+1]$],),
    explanation: [定义域为 $(0,+infinity)$。令 $u=x-ln x$，由 $u'=1-1/x$ 可知 $u>=1$，等号在 $x=1$ 时成立。
      又 $f(x)=e^u+u-a$，而 $e^u+u$ 严格递增，故 $f(x)$ 的最小值为 $e+1-a$。
      因此 $f(x)>=0$ 对所有 $x>0$ 成立当且仅当 $a<=e+1$。],
  ),
  subquestion(
    stem: [证明：若 $f(x)$ 有两个零点 $x_1,x_2$，则 $x_1 x_2<1$。],
    answers: ([证明见解析。],),
    explanation: [
      #step[利用复合函数的单调性消去指数项][不妨设 $x_1<x_2$。由 $e^u+u$ 严格递增，以及 $f(x_1)=f(x_2)=0$，得 $x_1-ln x_1=x_2-ln x_2$。
        令 $k=x_2/x_1>1$，则 $(k-1)x_1=ln k$，所以
        $ x_1 x_2=(k ln^2 k)/(k-1)^2. $]
      #step[证明所需的对数不等式][设 $H(k)=sqrt(k)-1/sqrt(k)-ln k$，则 $H(1)=0$，且
        $ H'(k)=((sqrt(k)-1)^2)/(2k sqrt(k))>0 quad (k>1). $
        因此 $0<ln k<(k-1)/sqrt(k)$，代入上式即得 $x_1 x_2<1$。]
    ],
  ),
))
#section[选考题：请从第 22、23 题中任选一题作答。]
#question(
  "solution",
  stem: [在直角坐标系 $x O y$ 中，曲线 $C_1$ 的参数方程为 $cases(x=(2+t)/6, y=sqrt(t))$（$t$ 为参数），曲线 $C_2$ 的参数方程为 $cases(x=-(2+s)/6, y=-sqrt(s))$（$s$ 为参数）。],
  parts: (
    subquestion(
      stem: [写出 $C_1$ 的普通方程。],
      answers: ([$y^2=6x-2(y>=0)$],),
      explanation: [由 $y=sqrt(t)$，得 $t=y^2$ 且 $y>=0$。代入 $6x=2+t$，得到 $y^2=6x-2$，其中 $y>=0$。],
    ),
    subquestion(
      stem: [以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系。曲线 $C_3$ 的极坐标方程为 $2cos theta-sin theta=0$，求 $C_3$ 与 $C_1$ 交点的直角坐标，及 $C_3$ 与 $C_2$ 交点的直角坐标。],
      answers: (
        [$C_3$ 与 $C_1$ 交于 $(1/2,1),(1,2)$；$C_3$ 与 $C_2$ 交于 $(-1/2,-1),(-1,-2)$。],
      ),
      explanation: [$C_3$ 的直角坐标方程为 $y=2x$；$C_2$ 的普通方程为 $y^2=-6x-2(y<=0)$。
        将 $y=2x$ 代入 $C_1$ 的方程，得 $4x^2-6x+2=0$，所以交点为 $(1/2,1)$、$(1,2)$，均满足 $y>=0$。
        同理，与 $C_2$ 联立得 $4x^2+6x+2=0$，交点为 $(-1/2,-1)$、$(-1,-2)$，均满足 $y<=0$。],
    ),
  ),
)
#question(
  "solution",
  stem: [已知 $a,b,c$ 均为正数，且 $a^2+b^2+4c^2=3$，证明：],
  parts: (
    subquestion(
      stem: [$a+b+2c<=3$。],
      answers: ([证明见解析。],),
      explanation: [由柯西不等式，$(a+b+2c)^2<=(1^2+1^2+1^2)(a^2+b^2+(2c)^2)=9$。
        ∵ $a+b+2c>0$，故 $a+b+2c<=3$。等号当且仅当 $a=b=2c=1$ 时成立。],
    ),
    subquestion(
      stem: [若 $b=2c$，则 $1/a+1/c>=3$。],
      answers: ([证明见解析。],),
      explanation: [由第（1）问，$a+4c<=3$。再由柯西不等式，$1/a+1/c=1^2/a+2^2/(4c)>=(1+2)^2/(a+4c)>=3$。当 $a=b=1,c=1/2$ 时取等号。],
    ),
  ),
)
