#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2022,
  type: "普通高等学校招生全国统一考试",
  name: "全国甲卷（文科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2022/2022全国甲文(云南,广西,贵州,西藏,四川).pdf",
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
#let box-diagram(auxiliary: false) = cetz.canvas(length: 5mm, {
  import cetz.draw: *
  let h = 4 * calc.sqrt(3)
  let a = (0, 0, 0)
  let b = (8, 0, 0)
  let c = (8, 8, 0)
  let d = (0, 8, 0)
  let e = (4, 0, h)
  let f = (8, 4, h)
  let g = (4, 8, h)
  let hh = (0, 4, h)
  oblique-project((1, 0), (0.35, 0.35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, f, g, hh, a)
    line(a, e, b, f, e, hh)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(hh, d, g, c, stroke: (dash: figure-style.dash))
    if auxiliary {
      let m = (4, 0, 0)
      let n = (8, 4, 0)
      let l = (4, 8, 0)
      let k = (0, 4, 0)
      line(m, n, l, k, m, stroke: (dash: figure-style.dash))
      for (p, v, label, anchor) in (
        (e, m, $M$, "north"),
        (f, n, $N$, "west"),
        (g, l, $L$, "south-west"),
        (hh, k, $K$, "east"),
      ) {
        line(p, v, stroke: (dash: figure-style.dash))
        content(v, label, anchor: anchor, padding: 3pt)
      }
    }
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north-west"),
      (c, $C$, "west"),
      (d, $D$, "north-west"),
      (e, $E$, "south"),
      (f, $F$, "south-west"),
      (g, $G$, "south"),
      (hh, $H$, "south-east"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#section[选择题]
#question(
  "single-choice",
  stem: [设集合 $A={-2,-1,0,1,2}$，$B={x | 0<=x<5/2}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${0,1,2}$], [${-2,-1,0}$], [${0,1}$], [${1,2}$]),
  answers: ([A],),
  explanation: [集合 $A$ 中满足 $0<=x<5/2$ 的元素为 $0,1,2$，故 $A inter B={0,1,2}$。],
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
  stem: [若 $z=1+"i"$，则 $abs("i" z+3overline(z))=$#choice-placeholder()。],
  choices: ([$4sqrt(5)$], [$4sqrt(2)$], [$2sqrt(5)$], [$2sqrt(2)$]),
  answers: ([D],),
  explanation: [$"i" z+3overline(z)="i"(1+"i")+3(1-"i")=2-2"i"$，故其模为 $sqrt(2^2+(-2)^2)=2sqrt(2)$。],
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
  stem: [将函数 $f(x)=sin(omega x+pi/3)(omega>0)$ 的图像向左平移 $pi/2$ 个单位长度后得到曲线 $C$。若 $C$ 关于 $y$ 轴对称，则 $omega$ 的最小值为#choice-placeholder()。],
  choices: ([$1/6$], [$1/4$], [$1/3$], [$1/2$]),
  answers: ([C],),
  explanation: [平移后函数为 $y=sin(omega x+omega pi/2+pi/3)$。关于 $y$ 轴对称，故 $omega pi/2+pi/3=pi/2+k pi(k in ZZ)$，即 $omega=1/3+2k$。由 $omega>0$，得最小值为 $1/3$。],
)

#question(
  "single-choice",
  stem: [从分别写有 $1,2,3,4,5,6$ 的 6 张卡片中无放回随机抽取 2 张，则抽到的 2 张卡片上的数字之积是 $4$ 的倍数的概率为#choice-placeholder()。],
  choices: ([$1/5$], [$1/3$], [$2/5$], [$2/3$]),
  answers: ([C],),
  explanation: [共有 $binom(6, 2)=15$ 种等可能的取法。符合条件的取法包括含有数字 $4$ 的 5 种，以及取到 $2,6$ 的 1 种，故概率为 $6/15=2/5$。],
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
  stem: [甲、乙两个圆锥的母线长相等，侧面展开图的圆心角之和为 $2pi$，侧面积分别为 $S_"甲",S_"乙"$，体积分别为 $V_"甲",V_"乙"$。若 $S_"甲"/S_"乙"=2$，则 $V_"甲"/V_"乙"=$#choice-placeholder()。],
  choices: ([$sqrt(5)$], [$2sqrt(2)$], [$sqrt(10)$], [$5sqrt(10)/4$]),
  answers: ([C],),
  explanation: [设母线长为 $l$，底面半径分别为 $r_1,r_2$。由侧面积比得 $r_1=2r_2$；由扇形弧长之和为 $2pi l$，得 $r_1+r_2=l$，故 $r_1=2l/3,r_2=l/3$。
    两圆锥的高分别为 $sqrt(5)l/3$、$2sqrt(2)l/3$，因此体积比为 $4 dot sqrt(5)/(2sqrt(2))=sqrt(10)$。],
)

#question(
  "single-choice",
  stem: [已知椭圆 $C:x^2/a^2+y^2/b^2=1(a>b>0)$ 的离心率为 $1/3$，$A_1,A_2$ 分别为 $C$ 的左、右顶点，$B$ 为 $C$ 的上顶点。若 $arrow(B A_1) dot arrow(B A_2)=-1$，则 $C$ 的方程为#choice-placeholder()。],
  choices: (
    [$x^2/18+y^2/16=1$],
    [$x^2/9+y^2/8=1$],
    [$x^2/3+y^2/2=1$],
    [$x^2/2+y^2=1$],
  ),
  answers: ([B],),
  explanation: [$arrow(B A_1)=(-a,-b)$，$arrow(B A_2)=(a,-b)$，所以 $-a^2+b^2=-1$，即 $c^2=a^2-b^2=1$。由 $c/a=1/3$，得 $a^2=9,b^2=8$。],
)

#question(
  "single-choice",
  stem: [已知 $9^m=10$，$a=10^m-11$，$b=8^m-9$，则#choice-placeholder()。],
  choices: ([$a>0>b$], [$a>b>0$], [$b>a>0$], [$b>0>a$]),
  answers: ([A],),
  explanation: [由 $9^m=10>9$，得 $m>1$。令 $h(x)=x^m-x-1$，当 $x>1$ 时，$h'(x)=m x^(m-1)-1>0$，故 $h$ 严格递增。又 $h(9)=0$，所以 $a=h(10)>0>h(8)=b$。],
)

#section[填空题]
#question(
  "fill-in",
  stem: [已知向量 $bold(a)=(m,3)$，$bold(b)=(1,m+1)$。若 $bold(a) perp bold(b)$，则 $m=$#fill-placeholder()。],
  answers: ([$-3/4$],),
  explanation: [由 $bold(a) dot bold(b)=m+3(m+1)=0$，解得 $m=-3/4$。],
)

#question(
  "fill-in",
  stem: [设点 $M$ 在直线 $2x+y-1=0$ 上，点 $(3,0)$ 和 $(0,1)$ 均在 $circle M$ 上，则 $circle M$ 的方程为#fill-placeholder()。],
  answers: ([$(x-1)^2+(y+1)^2=5$],),
  explanation: [设圆心 $M=(u,v)$。由两点到圆心等距，得 $(u-3)^2+v^2=u^2+(v-1)^2$，即 $3u-v=4$。结合 $2u+v=1$，得 $u=1,v=-1$，半径平方为 $(1-3)^2+(-1)^2=5$，故所求方程为 $(x-1)^2+(y+1)^2=5$。],
)

#question(
  "fill-in",
  stem: [记双曲线 $C:x^2/a^2-y^2/b^2=1(a>0,b>0)$ 的离心率为 $e$，写出满足条件“直线 $y=2x$ 与 $C$ 无公共点”的 $e$ 的一个值#fill-placeholder()。],
  answers: ([$2$（答案不唯一，$1<e<=sqrt(5)$ 均可）],),
  explanation: [将 $y=2x$ 代入双曲线方程，得 $(1/a^2-4/b^2)x^2=1$。无实数解的充要条件为 $1/a^2-4/b^2<=0$，即 $b^2/a^2<=4$。因此 $1<e=sqrt(1+b^2/a^2)<=sqrt(5)$，例如取 $e=2$。],
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
  stem: [甲、乙两城之间的长途客车均由 $A$ 和 $B$ 两家公司运营。为了解这两家公司长途客车的运行情况，随机调查了甲、乙两城之间的 500 个班次，得到下面列联表：
    #table(
      columns: 3,
      align: center,
      [], [准点班次数], [未准点班次数],
      [$A$], [$240$], [$20$],
      [$B$], [$210$], [$30$],
    )
    附：$K^2=(n(a d-b c)^2)/((a+b)(c+d)(a+c)(b+d))$。
    #table(
      columns: 4,
      align: center,
      [$P(K^2>=k)$], [$0.100$], [$0.050$], [$0.010$],
      [$k$], [$2.706$], [$3.841$], [$6.635$],
    )
  ],
  parts: (
    subquestion(
      stem: [根据上表，分别估计这两家公司甲、乙两城之间的长途客车准点的概率；],
      answers: ([$A$ 公司为 $12/13$，$B$ 公司为 $7/8$。],),
      explanation: [用频率估计概率，$A$ 公司为 $240/(240+20)=12/13$，$B$ 公司为 $210/(210+30)=7/8$。],
    ),
    subquestion(
      stem: [能否有 90% 的把握认为甲、乙两城之间的长途客车是否准点与客车所属公司有关？],
      answers: ([能。],),
      explanation: [由列联表计算得
        $
          K^2=(500 times (240 times 30-20 times 210)^2)/(260 times 240 times 450 times 50) approx 3.205>2.706.
        $
        因此有 90% 的把握认为是否准点与客车所属公司有关。],
    ),
  ),
)

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
  stem: [小明同学参加综合实践活动，设计了一个封闭的包装盒。包装盒如图所示：底面 $A B C D$ 是边长为 $8$（单位：$"cm"$）的正方形，$triangle E A B$、$triangle F B C$、$triangle G C D$、$triangle H D A$ 均为正三角形，且它们所在的平面都与平面 $A B C D$ 垂直。
    #figure(box-diagram())],
  parts: (
    subquestion(
      stem: [证明：$E F parallel$ 平面 $A B C D$；],
      answers: ([证明见解析。],),
      explanation: [分别取 $A B,B C$ 的中点 $M,N$，则 $E M perp A B$，$F N perp B C$，且 $E M=F N=4sqrt(3)$。
        由平面 $E A B$、$F B C$ 均垂直于底面，得 $E M,F N$ 均垂直于底面，所以 $E M parallel F N$。故四边形 $E M N F$ 为平行四边形，$E F parallel M N$。又 $M N subset$ 平面 $A B C D$，$E F$ 不在该平面内，故 $E F parallel$ 平面 $A B C D$。
        #figure(box-diagram(auxiliary: true))],
    ),
    subquestion(
      stem: [求该包装盒的容积（不计包装盒材料的厚度）。],
      answers: ([$640sqrt(3)/3 "cm"^3$],),
      explanation: [再取 $C D,D A$ 的中点 $L,K$。底面中点四边形 $M N L K$ 是边长为 $4sqrt(2)$ 的正方形，包装盒可分为中间的直四棱柱 $M N L K-E F G H$ 和周围四个全等的四棱锥。
        直四棱柱的高为 $4sqrt(3)$，体积为 $(4sqrt(2))^2 times 4sqrt(3)=128sqrt(3)$。以 $B-M N F E$ 为例，其底面 $M N F E$ 的面积为 $4sqrt(2) times 4sqrt(3)=16sqrt(6)$，高为点 $B$ 到 $M N$ 的距离 $2sqrt(2)$。
        因此容积为 $128sqrt(3)+4 times 1/3 times 16sqrt(6) times 2sqrt(2)=640sqrt(3)/3 ("cm"^3)$。],
    ),
  ),
)

#question(
  "solution",
  stem: [已知函数 $f(x)=x^3-x$，$g(x)=x^2+a$，曲线 $y=f(x)$ 在点 $(x_1,f(x_1))$ 处的切线也是曲线 $y=g(x)$ 的切线。],
  parts: (
    subquestion(
      stem: [若 $x_1=-1$，求 $a$；],
      answers: ([$3$],),
      explanation: [$f(-1)=0$，$f'(-1)=2$，故切线为 $y=2x+2$。设其与 $y=g(x)$ 相切于横坐标 $u$ 处，由 $g'(u)=2u=2$，得 $u=1$。将切点代入切线，得 $1+a=4$，所以 $a=3$。],
    ),
    subquestion(
      stem: [求 $a$ 的取值范围。],
      answers: ([$[-1,+infinity)$],),
      explanation: [
        #step[用切点参数表示 $a$][设 $t=x_1$，另一个切点的横坐标为 $u$。两条切线分别为 $y=(3t^2-1)x-2t^3$、$y=2u x+a-u^2$。
          两直线重合，故 $2u=3t^2-1$，$a-u^2=-2t^3$，得到
          $ a=((3t^2-1)/2)^2-2t^3=9/4 t^4-2t^3-3/2 t^2+1/4. $]
        #step[确定值域][记右侧为 $H(t)$，则
          $ H(t)+1=(t-1)^2(9t^2+10t+5)/4>=0, $
          其中 $9t^2+10t+5=9(t+5/9)^2+20/9>0$，故 $H(t)>=-1$，且 $H(1)=-1$。又 $H$ 在 $[1,+infinity)$ 上连续且趋于正无穷，所以取得 $[-1,+infinity)$ 中的每个值，所求范围为 $[-1,+infinity)$。]
      ],
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

#section[选考题（从下面两题中任选一题作答）]
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

