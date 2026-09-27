#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017全国2理(甘肃,青海,内蒙古,黑龙江,吉林,辽宁,海南,宁夏,新疆,陕西,重庆).pdf",
  regions: (
    "甘肃",
    "青海",
    "内蒙古",
    "黑龙江",
    "吉林",
    "辽宁",
    "海南",
    "宁夏",
    "新疆",
    "陕西",
    "重庆",
  ),
)

#let solid-views() = cetz.canvas(length: 3.5mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (dx, dy, width, height) in ((-1, -1, 16, 12), (-1, -9, 8, 8)) {
    for i in range(width + 1) {
      let x = dx + i
      if dy == -1 and x in (0, 6, 8, 14) {
        let top = if x == 0 or x == 6 { 7 } else if x == 8 { 10 } else { 4 }
        line((x, -1), (x, 0), stroke: gray)
        line((x, top), (x, 11), stroke: gray)
      } else {
        line((x, dy), (x, dy + height), stroke: gray)
      }
    }
    for j in range(height + 1) {
      let y = dy + j
      if y == 0 {
        for (l, r) in ((-1, 0), (6, 8), (14, 15)) {
          line((l, y), (r, y), stroke: gray)
        }
      } else if not (dy == -9 and y == -1) {
        line((dx, y), (dx + width, y), stroke: gray)
      }
    }
  }
  line((0, 7), (0, 0), (6, 0), (6, 7))
  circle((3, 7), radius: 3)
  line((8, 0), (8, 10), (14, 4), (14, 0), close: true)
  circle((3, -5), radius: 3)
})
#let loop-chart() = cetz.canvas(length: 7mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (y, label) in ((0, [开始]), (-12, [结束])) {
    rect((-0.7, y - 0.35), (0.7, y + 0.35), radius: 0.18)
    content((0, y), text(size: 9pt, label))
  }
  for (y, label) in ((-1.5, [输入 $a$]), (-10.5, [输出 $S$])) {
    line(
      (-1, y - 0.4),
      (0.8, y - 0.4),
      (1, y + 0.4),
      (-0.8, y + 0.4),
      close: true,
    )
    content((0, y), text(size: 9pt, label))
  }
  for (y, label) in (
    (-3, [$S=0,K=1$]),
    (-6, [$S=S+a dot K$]),
    (-7.5, [$a=-a$]),
    (-9, [$K=K+1$]),
  ) {
    rect((-1.45, y - 0.4), (1.45, y + 0.4))
    content((0, y), text(size: 9pt, label))
  }
  line((0, -4), (1.7, -4.7), (0, -5.4), (-1.7, -4.7), close: true)
  content((0, -4.7), text(size: 9pt)[$K<=6$])
  for (a, b) in (
    ((0, -0.35), (0, -1.1)),
    ((0, -1.9), (0, -2.6)),
    ((0, -3.4), (0, -4)),
    ((0, -5.4), (0, -5.6)),
    ((0, -6.4), (0, -7.1)),
    ((0, -7.9), (0, -8.6)),
    ((0, -10.9), (0, -11.65)),
  ) {
    line(a, b, mark: (end: ">"))
  }
  line((-1.45, -9), (-2.2, -9), (-2.2, -3.7), (0, -3.7), mark: (end: ">"))
  line((1.7, -4.7), (2.4, -4.7), (2.4, -9.8), (0, -9.8), (0, -10.1), mark: (
    end: ">",
  ))
  content((0.15, -5.5), text(size: 9pt)[是], anchor: "west")
  content((1.9, -4.65), text(size: 9pt)[否], anchor: "south")
})
#let yield-histogram(new: false) = {
  set text(size: 7pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.15,
      shared-zero: $0$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
        length: 0,
        label: (offset: 0.12),
      ),
      x: (label: (anchor: "north-east", offset: 0.45)),
      y: (label: (anchor: "south", offset: 0.2)),
    ))
    let start = if new { 35 } else { 25 }
    let heights = if new {
      (0.004, 0.020, 0.044, 0.068, 0.046, 0.010, 0.008)
    } else { (0.012, 0.014, 0.024, 0.034, 0.040, 0.032, 0.020, 0.012, 0.012) }
    plot.plot(
      size: (6.4, 10),
      axis-style: "school-book",
      x-min: start - 5,
      x-max: 72,
      x-break: true,
      x-tick-step: none,
      x-ticks: range(start, 71, step: 5),
      x-label: [箱产量/kg],
      y-min: 0,
      y-max: if new { 0.080 } else { 0.050 },
      y-tick-step: none,
      y-ticks: heights.dedup().sorted().map(h => (h, str(h))),
      y-label: [频率/组距],
      {
        for level in heights.dedup().sorted() {
          let index = heights.position(h => h >= level)
          plot.add-hline(level, min: start - 5, max: start + 5 * index, style: (
            stroke: (
              paint: black,
              thickness: figure-style.thickness,
              dash: figure-style.dash,
            ),
          ))
        }
        plot.annotate(resize: false, {
          for (i, h) in heights.enumerate() {
            let x = start + 5 * i
            line((x, h), (x + 5, h))
          }
          for i in range(heights.len() + 1) {
            let l = if i == 0 { 0 } else { heights.at(i - 1) }
            let r = if i == heights.len() { 0 } else { heights.at(i) }
            line((start + 5 * i, 0), (start + 5 * i, calc.max(l, r)))
          }
        })
      },
    )
  })
}
#let pyramid(auxiliary: false) = cetz.canvas(length: 27mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (1, 0, 0)
  let c = (1, 1, 0)
  let d = (0, 2, 0)
  let p = (0, 1, calc.sqrt(3))
  let e = (0, 1.5, calc.sqrt(3) / 2)
  let m = (1 - calc.sqrt(2) / 2, 1, calc.sqrt(6) / 2)
  oblique-project((-0.5, -0.35), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, b, c, d, p)
    line(p, c)
    line(c, e)
    line(b, m)
    for (u, v) in ((a, b), (a, d), (a, p)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    if auxiliary {
      let f = (0, 0.5, calc.sqrt(3) / 2)
      line(f, e, stroke: (dash: figure-style.dash))
      line(b, f, stroke: (dash: figure-style.dash))
      content(f, $F$, anchor: "south-east", padding: 3pt)
    }
    for (v, label, anchor) in (
      (a, $A$, "north-west"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (p, $P$, "south"),
      (e, $E$, "west"),
      (m, $M$, "west"),
    ) {
      content(v, label, anchor: anchor, padding: 3pt)
    }
  })
})

#section[选择题：共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [$(3+i)/(1+i)=$#choice-placeholder()。],
  choices: ([$1+2i$], [$1-2i$], [$2+i$], [$2-i$]),
  answers: ([D],),
  explanation: [$(3+i)/(1+i)=((3+i)(1-i))/2=(4-2i)/2=2-i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={1,2,4}$，$B={x|x^2-4x+m=0}$。若 $A inter B={1}$，则 $B=$#choice-placeholder()。],
  choices: ([${1,-3}$], [${1,0}$], [${1,3}$], [${1,5}$]),
  answers: ([C],),
  explanation: [∵ $1 in B$，∴ $1-4+m=0$，即 $m=3$。由 $(x-1)(x-3)=0$ 得 $B={1,3}$，且满足 $A inter B={1}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [我国古代数学名著《算法统宗》中有如下问题：“远望巍巍塔七层，红光点点倍加增，共灯三百八十一，请问尖头几盏灯？”意思是：一座 $7$ 层塔共挂了 $381$ 盏灯，且相邻两层中的下一层灯数是上一层灯数的 $2$ 倍，则塔的顶层共有灯#choice-placeholder()。],
  choices: ([$1$ 盏], [$3$ 盏], [$5$ 盏], [$9$ 盏]),
  answers: ([B],),
  explanation: [设顶层有 $a$ 盏灯，则 $a(1+2+dots+2^6)=127a=381$，解得 $a=3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，网格纸上小正方形的边长为 $1$，粗实线画出的是某几何体的三视图，该几何体由一平面将一圆柱截去一部分后所得，则该几何体的体积为#choice-placeholder()。
    #figure(solid-views())],
  choices: ([$90pi$], [$63pi$], [$42pi$], [$36pi$]),
  answers: ([B],),
  explanation: [圆柱底面半径为 $3$，截面在相对两侧的高度分别为 $4$ 和 $10$。将两个相同的几何体倒置拼接，可得底面半径为 $3$、高为 $14$ 的圆柱，故所求体积为 $V=1/2 dot pi dot 3^2 dot 14=63pi$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $x,y$ 满足约束条件 $cases(2x+3y-3<=0, 2x-3y+3>=0, y+3>=0)$，则 $z=2x+y$ 的最小值是#choice-placeholder()。],
  choices: ([$-15$], [$-9$], [$1$], [$9$]),
  answers: ([A],),
  explanation: [由 $2x>=3y-3$ 及 $y>=-3$ 得 $z=2x+y>=4y-3>=-15$。当 $(x,y)=(-6,-3)$ 时满足全部约束条件，且 $z=-15$，故最小值为 $-15$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [安排 $3$ 名志愿者完成 $4$ 项工作，每人至少完成 $1$ 项，每项工作由 $1$ 人完成，则不同的安排方式共有#choice-placeholder()。],
  choices: ([$12$ 种], [$18$ 种], [$24$ 种], [$36$ 种]),
  answers: ([D],),
  explanation: [必有一人完成两项工作，其余两人各完成一项。先选出合并的两项，再将三组工作分配给三人，共有 $C_4^2 A_3^3=6 times 6=36$ 种安排。],
)
#question(
  "single-choice",
  score: 5,
  stem: [甲、乙、丙、丁四位同学一起去向老师询问成语竞赛的成绩。老师说：你们四人中有 $2$ 位优秀，$2$ 位良好，我现在给甲看乙、丙的成绩，给乙看丙的成绩，给丁看甲的成绩。看后甲对大家说：我还是不知道我的成绩。根据以上信息，则#choice-placeholder()。],
  choices: (
    [乙可以知道四人的成绩],
    [丁可以知道四人的成绩],
    [乙、丁可以知道对方的成绩],
    [乙、丁可以知道自己的成绩],
  ),
  answers: ([D],),
  explanation: [如果乙、丙成绩相同，甲就能确定自己的成绩，故乙、丙必为一优一良，甲、丁也为一优一良。乙已看到丙的成绩，能确定自己的成绩；丁已看到甲的成绩，也能确定自己的成绩。但乙无法区分甲、丁的成绩，丁无法区分乙、丙的成绩。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图的程序框图，如果输入的 $a=-1$，则输出的 $S=$#choice-placeholder()。
    #figure(loop-chart())],
  choices: ([$2$], [$3$], [$4$], [$5$]),
  answers: ([B],),
  explanation: [循环中 $K$ 依次取 $1,2,dots,6$，$a$ 交替取 $-1,1$。故输出 $S=-1+2-3+4-5+6=3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的一条渐近线被圆 $(x-2)^2+y^2=4$ 所截得的弦长为 $2$，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$2$], [$sqrt(3)$], [$sqrt(2)$], [$(2sqrt(3))/3$]),
  answers: ([A],),
  explanation: [设 $c=sqrt(a^2+b^2)$。圆心 $(2,0)$ 到渐近线 $b x plus.minus a y=0$ 的距离为 $d=2b/c$。由半径、半弦长和弦心距构成的直角三角形得 $d=sqrt(2^2-1^2)=sqrt(3)$，故 $4b^2=3c^2$。代入 $b^2=c^2-a^2$ 得 $c^2=4a^2$，所以离心率 $e=c/a=2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知直三棱柱 $A B C-A_1 B_1 C_1$ 中，$angle A B C=120 degree$，$A B=2$，$B C=C C_1=1$，则异面直线 $A B_1$ 与 $B C_1$ 所成角的余弦值为#choice-placeholder()。],
  choices: ([$sqrt(3)/2$], [$sqrt(15)/5$], [$sqrt(10)/5$], [$sqrt(3)/3$]),
  answers: ([C],),
  explanation: [取 $B=(0,0,0)$，$C=(1,0,0)$，$A=(-1,sqrt(3),0)$，$B_1=(0,0,1)$，$C_1=(1,0,1)$。则 $arrow(A B_1)=(1,-sqrt(3),1)$，$arrow(B C_1)=(1,0,1)$，所成角的余弦值为
    $
      abs(arrow(A B_1) dot arrow(B C_1))/(abs(arrow(A B_1)) abs(arrow(B C_1)))=2/(sqrt(5)sqrt(2))=sqrt(10)/5.
    $],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $x=-2$ 是函数 $f(x)=(x^2+a x-1)e^(x-1)$ 的极值点，则 $f(x)$ 的极小值为#choice-placeholder()。],
  choices: ([$-1$], [$-2e^(-3)$], [$5e^(-3)$], [$1$]),
  answers: ([A],),
  explanation: [由 $f'(x)=[x^2+(a+2)x+a-1]e^(x-1)$ 及 $f'(-2)=0$ 得 $a=-1$。此时 $f'(x)=(x+2)(x-1)e^(x-1)$，在 $(-infinity,-2)$、$(1,+infinity)$ 上为正，在 $(-2,1)$ 上为负，故极小值为 $f(1)=-1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $triangle A B C$ 是边长为 $2$ 的等边三角形，$P$ 为平面 $A B C$ 内一点，则 $arrow(P A) dot (arrow(P B)+arrow(P C))$ 的最小值是#choice-placeholder()。],
  choices: ([$-2$], [$-3/2$], [$-4/3$], [$-1$]),
  answers: ([B],),
  explanation: [取 $B=(-1,0)$，$C=(1,0)$，$A=(0,sqrt(3))$，设 $P=(x,y)$。则
    $
      arrow(P A) dot (arrow(P B)+arrow(P C))=2x^2+2y^2-2sqrt(3)y=2x^2+2(y-sqrt(3)/2)^2-3/2>=-3/2.
    $
    当 $P=(0,sqrt(3)/2)$ 时取等号。],
)
#section[填空题：共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [一批产品的二等品率为 $0.02$，从这批产品中每次随机取一件，有放回地抽取 $100$ 次，$X$ 表示抽到的二等品件数，则 $D X=$#fill-placeholder()。],
  answers: ([$1.96$],),
  explanation: [$X tilde B(100,0.02)$，故 $D X=100 times 0.02 times 0.98=1.96$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [函数 $f(x)=sin^2 x+sqrt(3)cos x-3/4$（$x in [0,pi/2]$）的最大值是#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [$f(x)=1-(cos x-sqrt(3)/2)^2<=1$，当 $x=pi/6$ 时取等号。],
)
#question(
  "fill-in",
  score: 5,
  stem: [等差数列 ${a_n}$ 的前 $n$ 项和为 $S_n$，$a_3=3$，$S_4=10$，则 $sum_(k=1)^n 1/S_k=$#fill-placeholder()。],
  answers: ([$(2n)/(n+1)$],),
  explanation: [设首项为 $a_1$，公差为 $d$。由 $a_1+2d=3$、$4a_1+6d=10$ 得 $a_1=d=1$，故 $S_k=k(k+1)/2$。因此
    $ sum_(k=1)^n 1/S_k=2sum_(k=1)^n (1/k-1/(k+1))=2(1-1/(n+1))=(2n)/(n+1). $],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知 $F$ 是抛物线 $C:y^2=8x$ 的焦点，$M$ 是 $C$ 上一点，$F M$ 的延长线交 $y$ 轴于点 $N$。若 $M$ 为 $F N$ 的中点，则 $abs(F N)=$#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [焦点 $F=(2,0)$，∵ $M$ 是 $F N$ 的中点，且 $N$ 在 $y$ 轴上，∴ $M$ 的横坐标为 $1$。抛物线准线为 $x=-2$，由定义得 $abs(F M)=1+2=3$，故 $abs(F N)=2abs(F M)=6$。],
)
#section[解答题：共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17～21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $sin(A+C)=8sin^2 frac(B, 2)$。],
  parts: (
    subquestion(
      stem: [求 $cos B$。],
      answers: ([$15/17$],),
      explanation: [∵ $A+C=pi-B$，∴ $sin B=8sin^2 frac(B, 2)$。又 $0<B/2<pi/2$，约去 $2sin frac(B, 2)$ 得 $cos frac(B, 2)=4sin frac(B, 2)$，即 $tan frac(B, 2)=1/4$。所以 $cos B=(1-tan^2 frac(B, 2))/(1+tan^2 frac(B, 2))=15/17$。],
    ),
    subquestion(
      stem: [若 $a+c=6$，$triangle A B C$ 面积为 $2$，求 $b$。],
      answers: ([$2$],),
      explanation: [由第（1）问得 $sin B=8/17$，由 $1/2 a c sin B=2$ 得 $a c=17/2$。根据余弦定理，
        $ b^2=(a+c)^2-2a c(1+cos B)=36-17 times 32/17=4, $
        故 $b=2$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [海水养殖场进行某水产品的新、旧网箱养殖方法的产量对比，收获时各随机抽取了 $100$ 个网箱，测量各箱水产品的产量（单位：kg），其频率分布直方图如下：
    #figure(grid(
      columns: (1fr, 1fr),
      gutter: 6mm,
      align(center)[#yield-histogram()\ 旧养殖法],
      align(center)[#yield-histogram(new: true)\ 新养殖法],
    ))
  ],
  parts: (
    subquestion(
      stem: [设两种养殖方法的箱产量相互独立，记 $A$ 表示事件“旧养殖法的箱产量低于 $50$ kg，新养殖法的箱产量不低于 $50$ kg”，估计 $A$ 的概率。],
      answers: ([$0.4092$],),
      explanation: [旧养殖法箱产量低于 $50$ kg 的频率为 $(0.012+0.014+0.024+0.034+0.040)times 5=0.62$。新养殖法箱产量不低于 $50$ kg 的频率为 $(0.068+0.046+0.010+0.008)times 5=0.66$。由独立性，$A$ 的概率估计值为 $0.62 times 0.66=0.4092$。],
    ),
    subquestion(
      stem: [填写下面列联表，并根据列联表判断是否有 $99%$ 的把握认为箱产量与养殖方法有关。
        #table(
          columns: 3,
          align: center,
          [], [箱产量 $<50$ kg], [箱产量 $>=50$ kg],
          [旧养殖法], [], [],
          [新养殖法], [], [],
        )
      ],
      answers: ([列联表见解析；有 $99%$ 的把握认为箱产量与养殖方法有关。],),
      explanation: [由频率乘以样本量得到：
        #table(
          columns: 3,
          align: center,
          [], [箱产量 $<50$ kg], [箱产量 $>=50$ kg],
          [旧养殖法], [$62$], [$38$],
          [新养殖法], [$34$], [$66$],
        )
        检验统计量的观测值为
        $
          k=frac(200(62 times 66-38 times 34)^2, 100 times 100 times 96 times 104) approx 15.705>6.635.
        $
        故有 $99%$ 的把握认为箱产量与养殖方法有关。],
    ),
    subquestion(
      stem: [根据箱产量的频率分布直方图，求新养殖法箱产量的中位数的估计值（精确到 $0.01$）。

        附：
        #table(
          columns: 4,
          align: center,
          [$P(K^2>=k)$], [$0.050$], [$0.010$], [$0.001$],
          [$k$], [$3.841$], [$6.635$], [$10.828$],
        )
        $ K^2=frac(n(a d-b c)^2, (a+b)(c+d)(a+c)(b+d)). $
      ],
      answers: ([$52.35$ kg],),
      explanation: [新养殖法箱产量低于 $50$ kg 的频率为 $0.34$，低于 $55$ kg 的频率为 $0.68$，故中位数落在 $[50,55)$ 内。设估计值为 $m$，则 $0.34+0.068(m-50)=0.5$，解得 $m=50+(0.5-0.34)/0.068 approx 52.35$（kg）。],
    ),
  ),
  explanation: [],
)
#question(
  "solution",
  score: 12,
  stem: [如图，四棱锥 $P-A B C D$ 中，侧面 $P A D$ 为等边三角形且垂直于底面 $A B C D$，$A B=B C=1/2 A D$，$angle B A D=angle A B C=90 degree$，$E$ 是 $P D$ 的中点。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [证明：直线 $C E parallel$ 平面 $P A B$。],
      answers: ([证明见解析。],),
      explanation: [取 $P A$ 的中点 $F$，连接 $E F$、$B F$。由三角形中位线定理得 $E F parallel A D$，$E F=1/2 A D$。又 $B C parallel A D$，$B C=1/2 A D$，故四边形 $B C E F$ 为平行四边形，从而 $C E parallel B F$。∵ $B F subset$ 平面 $P A B$，$C E subset.not$ 平面 $P A B$，∴ $C E parallel$ 平面 $P A B$。
        #figure(pyramid(auxiliary: true))],
    ),
    subquestion(
      stem: [点 $M$ 在棱 $P C$ 上，且直线 $B M$ 与底面 $A B C D$ 所成角为 $45 degree$，求二面角 $M-A B-D$ 的余弦值。],
      answers: ([$sqrt(10)/5$],),
      explanation: [
        #step[建立坐标系][以 $A B$ 为单位长度，以 $A$ 为原点，$A B$、$A D$ 的方向分别为 $x$、$y$ 轴正方向，垂直于底面向上为 $z$ 轴正方向。则
          $
            A=(0,0,0),quad B=(1,0,0),quad C=(1,1,0),quad D=(0,2,0),quad P=(0,1,sqrt(3)).
          $
          设 $M=(t,1,sqrt(3)(1-t))$，其中 $0<=t<=1$。由线面角为 $45 degree$，竖直分量的平方等于水平投影长度的平方，故
          $ 3(1-t)^2=(t-1)^2+1. $
          解得 $t=1-sqrt(2)/2$，于是 $M=(1-sqrt(2)/2,1,sqrt(6)/2)$。]
        #step[计算二面角][在平面 $M A B$ 内取垂直于 $A B$ 且指向 $M$ 所在半平面的向量 $bold(u)=(0,1,sqrt(6)/2)$，在底面内取垂直于 $A B$ 且指向 $D$ 所在半平面的向量 $bold(v)=(0,1,0)$。二者夹角即所求二面角，故
          $ cos angle(bold(u), bold(v))=frac(1, sqrt(1+6/4))=sqrt(10)/5. $]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设 $O$ 为坐标原点，动点 $M$ 在椭圆 $C:x^2/2+y^2=1$ 上，过 $M$ 作 $x$ 轴的垂线，垂足为 $N$，点 $P$ 满足 $arrow(N P)=sqrt(2)arrow(N M)$。],
  parts: (
    subquestion(
      stem: [求点 $P$ 的轨迹方程。],
      answers: ([$x^2+y^2=2$],),
      explanation: [设 $P=(x,y)$，则由向量关系得 $M=(x,y/sqrt(2))$，代入椭圆方程得 $x^2/2+y^2/2=1$。反之，圆上每一点均能按此对应关系得到椭圆上的点，故轨迹方程为 $x^2+y^2=2$。],
    ),
    subquestion(
      stem: [设点 $Q$ 在直线 $x=-3$ 上，且 $arrow(O P) dot arrow(P Q)=1$。证明：过点 $P$ 且垂直于 $O Q$ 的直线 $l$ 过 $C$ 的左焦点 $F$。],
      answers: ([证明见解析。],),
      explanation: [椭圆的左焦点为 $F=(-1,0)$。设 $P=(m,n)$，$Q=(-3,t)$，则 $m^2+n^2=2$。由 $arrow(O P) dot arrow(P Q)=1$ 得
        $ m(-3-m)+n(t-n)=1,quad -3m+n t=3. $
        故 $arrow(O Q) dot arrow(P F)=(-3,t) dot (-1-m,-n)=3+3m-n t=0$。又 $F$ 不在圆 $x^2+y^2=2$ 上，故 $P != F$，于是 $P F perp O Q$。因此过 $P$ 且垂直于 $O Q$ 的直线 $l$ 就是 $P F$，必过 $F$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=a x^2-a x-x ln x$，且 $f(x)>=0$。],
  parts: (
    subquestion(
      stem: [求 $a$。],
      answers: ([$a=1$],),
      explanation: [函数定义域为 $(0,+infinity)$，且 $f(1)=0$，由 $f(x)>=0$ 知 $x=1$ 为极小值点。因此 $f'(1)=a-1=0$，即 $a=1$。反之，当 $a=1$ 时，由 $ln x<=x-1$ 得 $f(x)=x(x-1-ln x)>=0$，符合题意。],
    ),
    subquestion(
      stem: [证明：$f(x)$ 存在唯一的极大值点 $x_0$，且 $e^(-2)<f(x_0)<2^(-2)$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[证明极大值点唯一][由第（1）问，$f'(x)=2x-2-ln x$。记 $g(x)=f'(x)$，则 $g'(x)=2-1/x$。故 $g$ 在 $(0,1/2)$ 上严格递减，在 $(1/2,+infinity)$ 上严格递增。又
          $ lim_(x arrow 0^+)g(x)=+infinity,quad g(1/2)=ln 2-1<0,quad g(1)=0. $
          所以 $g$ 恰有两个零点：$x_0 in (0,1/2)$ 和 $1$。$f'$ 在 $(0,x_0)$、$(1,+infinity)$ 上为正，在 $(x_0,1)$ 上为负，故 $x_0$ 是唯一的极大值点。]
        #step[估计极大值][由 $g(x_0)=0$ 得 $ln x_0=2x_0-2$，从而
          $ f(x_0)=x_0-x_0^2=1/4-(x_0-1/2)^2<1/4. $
          又 $g(1/e)=2/e-1<0$，且 $1/e<1/2$，由 $g$ 的单调性得 $x_0<1/e<1$。∵ $f$ 在 $(x_0,1)$ 上严格递减，∴ $f(x_0)>f(1/e)=e^(-2)$。综上，$e^(-2)<f(x_0)<2^(-2)$。]
      ],
    ),
  ),
)
选考题：请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。
#question(
  "solution",
  score: 10,
  stem: [在直角坐标系 $x O y$ 中，以坐标原点为极点，$x$ 轴的正半轴为极轴建立极坐标系，曲线 $C_1$ 的极坐标方程为 $rho cos theta=4$。],
  parts: (
    subquestion(
      stem: [$M$ 为曲线 $C_1$ 上的动点，点 $P$ 在线段 $O M$ 上，且满足 $abs(O M) dot abs(O P)=16$，求点 $P$ 的轨迹 $C_2$ 的直角坐标方程。],
      answers: ([$(x-2)^2+y^2=4$（$x!=0$）],),
      explanation: [设 $P$ 的极坐标为 $(rho,theta)$，$M$ 的极径为 $rho_1$，其中 $rho,rho_1>0$，$rho_1 cos theta=4$。由 $rho rho_1=16$ 得 $rho=4cos theta$，即 $rho^2=4rho cos theta$，化为直角坐标方程为 $(x-2)^2+y^2=4$，且原点不在轨迹上。反之，圆上除原点外的点满足 $0<rho=4cos theta<=4/(cos theta)=rho_1$，故均在线段 $O M$ 上并满足条件。],
    ),
    subquestion(
      stem: [设点 $A$ 的极坐标为 $(2,pi/3)$，点 $B$ 在曲线 $C_2$ 上，求 $triangle O A B$ 面积的最大值。],
      answers: ([$2+sqrt(3)$],),
      explanation: [$O A=2$，直线 $O A$ 的方程为 $sqrt(3)x-y=0$。圆 $C_2$ 的圆心 $(2,0)$ 到该直线的距离为 $sqrt(3)$，半径为 $2$，故圆上点到直线的最大距离为 $2+sqrt(3)$，取得最大值的点不是原点。因此三角形面积的最大值为 $1/2 times 2 times (2+sqrt(3))=2+sqrt(3)$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [已知 $a>0,b>0$，$a^3+b^3=2$，证明：],
  parts: (
    subquestion(
      stem: [$(a+b)(a^5+b^5)>=4$。],
      answers: ([证明见解析。],),
      explanation: [由柯西不等式，$(a+b)(a^5+b^5)>=(sqrt(a)sqrt(a^5)+sqrt(b)sqrt(b^5))^2=(a^3+b^3)^2=4$。当且仅当 $a=b=1$ 时取等号。],
    ),
    subquestion(
      stem: [$a+b<=2$。],
      answers: ([证明见解析。],),
      explanation: [由恒等式
        $ 4(a^3+b^3)-(a+b)^3=3(a+b)(a-b)^2>=0 $
        得 $(a+b)^3<=4(a^3+b^3)=8$，故 $a+b<=2$。当且仅当 $a=b=1$ 时取等号。],
    ),
  ),
)
