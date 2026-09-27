#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "全国二卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017全国2文(甘肃,青海,内蒙古,黑龙江,吉林,辽宁,海南,宁夏,新疆,陕西,重庆).pdf",
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
  oblique-project((-0.5, -0.35), (1, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(p, b, c, d, p)
    line(p, c)
    for (u, v) in ((a, b), (a, d), (a, p)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    if auxiliary {
      let h = (0, 1, 0)
      let n = (0.5, 1.5, 0)
      line(p, h, c, stroke: (dash: figure-style.dash))
      line(p, n)
      content(h, $H$, anchor: "north", padding: 3pt)
      content(n, $N$, anchor: "north-west", padding: 3pt)
    }
    for (v, label, anchor) in (
      (a, $A$, "north-west"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (p, $P$, "south"),
    ) {
      content(v, label, anchor: anchor, padding: 3pt)
    }
  })
})
#section[选择题：共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设集合 $A={1,2,3}$，$B={2,3,4}$，则 $A union B=$#choice-placeholder()。],
  choices: ([${1,2,3,4}$], [${1,2,3}$], [${2,3,4}$], [${1,3,4}$]),
  answers: ([A],),
  explanation: [并集由属于 $A$ 或属于 $B$ 的所有元素组成，故 $A union B={1,2,3,4}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$(1+i)(2+i)=$#choice-placeholder()。],
  choices: ([$1-i$], [$1+3i$], [$3+i$], [$3+3i$]),
  answers: ([B],),
  explanation: [$(1+i)(2+i)=2+3i+i^2=1+3i$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $f(x)=sin(2x+pi/3)$ 的最小正周期为#choice-placeholder()。],
  choices: ([$4pi$], [$2pi$], [$pi$], [$pi/2$]),
  answers: ([C],),
  explanation: [最小正周期为 $T=(2pi)/abs(2)=pi$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设非零向量 $bold(a),bold(b)$ 满足 $abs(bold(a)+bold(b))=abs(bold(a)-bold(b))$，则#choice-placeholder()。],
  choices: (
    [$bold(a) perp bold(b)$],
    [$abs(bold(a))=abs(bold(b))$],
    [$bold(a) parallel bold(b)$],
    [$abs(bold(a))>abs(bold(b))$],
  ),
  answers: ([A],),
  explanation: [将等式两边平方并展开，得 $abs(bold(a))^2+2bold(a) dot bold(b)+abs(bold(b))^2=abs(bold(a))^2-2bold(a) dot bold(b)+abs(bold(b))^2$，所以 $bold(a) dot bold(b)=0$。两向量非零，故 $bold(a) perp bold(b)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $a>1$，则双曲线 $x^2/a^2-y^2=1$ 的离心率的取值范围是#choice-placeholder()。],
  choices: (
    [$(sqrt(2),+infinity)$],
    [$(sqrt(2),2)$],
    [$(1,sqrt(2))$],
    [$(1,2)$],
  ),
  answers: ([C],),
  explanation: [$e=sqrt(a^2+1)/a=sqrt(1+1/a^2)$。由 $a>1$ 得 $0<1/a^2<1$，故 $1<e<sqrt(2)$，且该区间内每个值均能取得。],
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
  stem: [函数 $f(x)=ln(x^2-2x-8)$ 的单调递增区间为#choice-placeholder()。],
  choices: (
    [$(-infinity,-2)$],
    [$(-infinity,1)$],
    [$(1,+infinity)$],
    [$(4,+infinity)$],
  ),
  answers: ([D],),
  explanation: [定义域由 $(x-4)(x+2)>0$ 得 $(-infinity,-2) union (4,+infinity)$。在定义域内，$f'(x)=(2x-2)/(x^2-2x-8)$，其符号与 $x-1$ 相同，故单调递增区间为 $(4,+infinity)$。],
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
  stem: [从分别写有 $1,2,3,4,5$ 的 $5$ 张卡片中随机抽取 $1$ 张，放回后再随机抽取 $1$ 张，则抽得的第一张卡片上的数大于第二张卡片上的数的概率为#choice-placeholder()。],
  choices: ([$1/10$], [$1/5$], [$3/10$], [$2/5$]),
  answers: ([D],),
  explanation: [两次抽取共有 $5 times 5=25$ 个等可能的有序结果。第一张的数大于第二张的结果有 $1+2+3+4=10$ 个，故所求概率为 $10/25=2/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [过抛物线 $C:y^2=4x$ 的焦点 $F$，且斜率为 $sqrt(3)$ 的直线交 $C$ 于点 $M$（$M$ 在 $x$ 轴上方），$l$ 为 $C$ 的准线，点 $N$ 在 $l$ 上，且 $M N perp l$，则 $M$ 到直线 $N F$ 的距离为#choice-placeholder()。],
  choices: ([$sqrt(5)$], [$2sqrt(2)$], [$2sqrt(3)$], [$3sqrt(3)$]),
  answers: ([C],),
  explanation: [焦点 $F=(1,0)$，直线 $F M$ 为 $y=sqrt(3)(x-1)$。联立抛物线方程得 $3x^2-10x+3=0$。由 $M$ 在 $x$ 轴上方得 $M=(3,2sqrt(3))$。准线为 $x=-1$，故 $N=(-1,2sqrt(3))$，直线 $N F$ 的方程为 $sqrt(3)x+y-sqrt(3)=0$。所求距离为
    $ d=frac(abs(3sqrt(3)+2sqrt(3)-sqrt(3)), sqrt(3+1))=2sqrt(3). $],
)
#section[填空题：共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [函数 $f(x)=2cos x+sin x$ 的最大值为#fill-placeholder()。],
  answers: ([$sqrt(5)$],),
  explanation: [由柯西不等式得 $(2cos x+sin x)^2<=(2^2+1^2)(cos^2 x+sin^2 x)=5$，所以 $f(x)<=sqrt(5)$。当 $cos x=2/sqrt(5)$、$sin x=1/sqrt(5)$ 时取等号。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)$ 是定义在 $RR$ 上的奇函数，当 $x in (-infinity,0)$ 时，$f(x)=2x^3+x^2$，则 $f(2)=$#fill-placeholder()。],
  answers: ([$12$],),
  explanation: [由奇函数性质，$f(2)=-f(-2)=-[2(-2)^3+(-2)^2]=12$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [长方体的长、宽、高分别为 $3,2,1$，其顶点都在球 $O$ 的球面上，则球 $O$ 的表面积为#fill-placeholder()。],
  answers: ([$14pi$],),
  explanation: [球心为长方体的中心，直径等于体对角线长，故 $(2R)^2=3^2+2^2+1^2=14$。球的表面积为 $4pi R^2=14pi$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，若 $2b cos B=a cos C+c cos A$，则 $B=$#fill-placeholder()。],
  answers: ([$pi/3$],),
  explanation: [由正弦定理得 $2sin B cos B=sin A cos C+sin C cos A=sin(A+C)=sin B$。又 $sin B>0$，故 $cos B=1/2$。由 $B in (0,pi)$ 得 $B=pi/3$。],
)
#section[解答题：共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17～21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [已知等差数列 ${a_n}$ 的前 $n$ 项和为 $S_n$，等比数列 ${b_n}$ 的前 $n$ 项和为 $T_n$，$a_1=-1$，$b_1=1$，$a_2+b_2=2$。],
  parts: (
    subquestion(
      stem: [若 $a_3+b_3=5$，求 ${b_n}$ 的通项公式。],
      answers: ([$b_n=2^(n-1)$],),
      explanation: [设等差数列的公差为 $d$，等比数列的公比为 $q$（$q!=0$）。由 $a_2+b_2=2$ 得 $d+q=3$，由 $a_3+b_3=5$ 得 $2d+q^2=6$。消去 $d$ 得 $q^2-2q=0$，舍去 $q=0$，得 $q=2$，故 $b_n=2^(n-1)$。],
    ),
    subquestion(
      stem: [若 $T_3=21$，求 $S_3$。],
      answers: ([$-6$ 或 $21$],),
      explanation: [由 $T_3=1+q+q^2=21$ 得 $(q-4)(q+5)=0$，故 $q=4$ 或 $q=-5$。又 $d=3-q$，$S_3=3a_1+3d=-3+3d$。当 $q=4$ 时，$d=-1$，$S_3=-6$；当 $q=-5$ 时，$d=8$，$S_3=21$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，四棱锥 $P-A B C D$ 中，侧面 $P A D$ 为等边三角形且垂直于底面 $A B C D$，$A B=B C=1/2 A D$，$angle B A D=angle A B C=90 degree$。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [证明：直线 $B C parallel$ 平面 $P A D$。],
      answers: ([证明见解析。],),
      explanation: [在底面内，$B C perp A B$，$A D perp A B$，故 $B C parallel A D$。又 $A D subset$ 平面 $P A D$，$B C subset.not$ 平面 $P A D$，因此 $B C parallel$ 平面 $P A D$。],
    ),
    subquestion(
      stem: [若 $triangle P C D$ 面积为 $2sqrt(7)$，求四棱锥 $P-A B C D$ 的体积。],
      answers: ([$4sqrt(3)$],),
      explanation: [
        #step[确定高与边长][取 $A D$ 的中点 $H$，连接 $P H$、$C H$。∵ $triangle P A D$ 为等边三角形，∴ $P H perp A D$。又侧面 $P A D$ 垂直于底面，故 $P H perp$ 底面 $A B C D$。设 $A B=B C=t>0$，则 $A D=2t$，四边形 $A B C H$ 为正方形，从而 $C H=t$，$C D=sqrt(2)t$，$P H=sqrt(3)t$，$P C=P D=2t$。
          取 $C D$ 的中点 $N$，则 $P N perp C D$，且 $P N=sqrt((2t)^2-(sqrt(2)t/2)^2)=sqrt(14)t/2$。所以
          $
            S_(triangle P C D)=1/2 dot sqrt(2)t dot (sqrt(14)t)/2=sqrt(7)t^2/2=2sqrt(7),
          $
          解得 $t=2$。
          #figure(pyramid(auxiliary: true))]
        #step[计算体积][底面为直角梯形，面积 $S_(A B C D)=1/2(A D+B C)A B=3t^2/2=6$，高 $P H=2sqrt(3)$，故 $V=1/3 times 6 times 2sqrt(3)=4sqrt(3)$。]
      ],
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
      stem: [记 $A$ 表示事件“旧养殖法的箱产量低于 $50$ kg”，估计 $A$ 的概率。],
      answers: ([$0.62$],),
      explanation: [旧养殖法箱产量低于 $50$ kg 的频率为 $(0.012+0.014+0.024+0.034+0.040)times 5=0.62$。以频率估计概率，$A$ 的概率估计值为 $0.62$。],
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
      stem: [根据箱产量的频率分布直方图，对两种养殖方法的优劣进行比较。

        附：
        #table(
          columns: 4,
          align: center,
          [$P(K^2>=k)$], [$0.050$], [$0.010$], [$0.001$],
          [$k$], [$3.841$], [$6.635$], [$10.828$],
        )
        $ K^2=frac(n(a d-b c)^2, (a+b)(c+d)(a+c)(b+d)). $
      ],
      answers: ([新养殖法的箱产量较高且较稳定，优于旧养殖法。],),
      explanation: [从直方图看，新养殖法的箱产量主要集中在 $45$～$60$ kg，旧养殖法主要集中在 $35$～$55$ kg；新养殖法的箱产量整体较高，且分布更集中。因此，从产量水平和稳定性看，新养殖法优于旧养殖法。],
    ),
  ),
  explanation: [],
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
#question("solution", score: 12, stem: [设函数 $f(x)=(1-x^2)e^x$。], parts: (
  subquestion(
    stem: [讨论 $f(x)$ 的单调性。],
    answers: (
      [在 $(-infinity,-1-sqrt(2))$ 和 $(-1+sqrt(2),+infinity)$ 上单调递减，在 $(-1-sqrt(2),-1+sqrt(2))$ 上单调递增。],
    ),
    explanation: [由 $f'(x)=(1-2x-x^2)e^x=[2-(x+1)^2]e^x$，得导数的零点为 $-1 plus.minus sqrt(2)$。当 $x< -1-sqrt(2)$ 或 $x>-1+sqrt(2)$ 时，$f'(x)<0$；当 $-1-sqrt(2)<x< -1+sqrt(2)$ 时，$f'(x)>0$。因此得到相应的单调区间。],
  ),
  subquestion(
    stem: [当 $x>=0$ 时，$f(x)<=a x+1$，求 $a$ 的取值范围。],
    answers: ([$[1,+infinity)$],),
    explanation: [
      #step[必要性][∵ $f(0)=1$，对任意 $x>0$ 有 $(f(x)-f(0))/x<=a$，令 $x arrow 0^+$，得 $f'(0)=1<=a$。]
      #step[充分性][当 $a>=1$ 时，令 $h(x)=(1-x)e^x$。对 $x>=0$，$h'(x)=-x e^x<=0$，故 $h(x)<=h(0)=1$。于是
        $ f(x)=(1+x)h(x)<=1+x<=1+a x. $
        故 $a$ 的取值范围为 $[1,+infinity)$。]
    ],
  ),
))
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
