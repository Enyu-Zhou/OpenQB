#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2018,
  type: "普通高等学校招生全国统一考试",
  name: "全国一卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2018/2018全国1文(河南,河北,山西,江西,湖北,湖南,广东,安徽,福建,山东).pdf",
  regions: (
    "河南",
    "河北",
    "山西",
    "江西",
    "湖北",
    "湖南",
    "广东",
    "安徽",
    "福建",
    "山东",
  ),
)

#let income-pies() = cetz.canvas(length: 11mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (offset, values, title) in (
    (0, (4, 6, 60, 30), [建设前经济收入构成比例]),
    (5.4, (5, 28, 37, 30), [建设后经济收入构成比例]),
  ) {
    scope({
      translate((offset, 0))
      circle((0, 0), radius: 1.4)
      let angle = 0deg
      for (i, value) in values.enumerate() {
        line((0, 0), (1.4 * calc.cos(angle), 1.4 * calc.sin(angle)))
        let middle = angle + value * 1.8deg
        let radius = if i < 2 { 1.75 } else { 0.8 }
        let label = ([其他收入], [第三产业收入], [种植收入], [养殖收入]).at(i)
        content(
          (
            radius * calc.cos(middle),
            radius * calc.sin(middle)
              + if i == 1 and offset == 0 { 0.25 } else { 0 },
          ),
          text(size: 8pt)[#label\ #value%],
          anchor: if i < 2 { "west" } else { "center" },
        )
        angle += value * 3.6deg
      }
      content((0, -1.9), text(size: 9pt, title), anchor: "north")
    })
  }
})
#let cylinder-views() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let w = 16 / calc.pi
  line((0, 0), (w, 0), (w, 2), (0, 2), close: true)
  line(
    (w + 1.6, 0),
    (2 * w + 1.6, 0),
    (2 * w + 1.6, 2),
    (w + 1.6, 2),
    close: true,
  )
  circle((w / 2, -w / 2 - 1), radius: w / 2)
  content((0, 2), $A$, anchor: "south-east", padding: 3pt)
  content((2 * w + 1.6, 0), $B$, anchor: "north-west", padding: 3pt)
})

#let folded-parallelogram() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (3, 0, 0)
  let c = (0, 3, 0)
  let m = (-3, 3, 0)
  let d = (0, 3, 3)
  let q = (0, 1, 1)
  let p = (1, 2, 0)
  oblique-project((1, 0), (-0.28, 0.32), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, q, d, c, a)
    line(q, a)
    line(c, m, a, stroke: (dash: figure-style.dash))
    line(c, b, stroke: (dash: figure-style.dash))
    line(a, p, q, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (a, $A$, "north"),
      (b, $B$, "west"),
      (c, $C$, "south-east"),
      (m, $M$, "east"),
      (d, $D$, "south"),
      (q, $Q$, "east"),
      (p, $P$, "north-west"),
    ) {
      content(point, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let water-histogram(answer: false) = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: 0.15,
    shared-zero: [$0$],
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
    grid: (stroke: (paint: luma(65%), thickness: figure-style.thickness)),
    x: (label: (anchor: "west", offset: 0.2)),
    y: (label: (anchor: "south", offset: 0.2)),
  ))
  plot.plot(
    size: (6, 5.5),
    axis-style: "school-book",
    x-min: 0,
    x-max: 0.6,
    y-min: 0,
    y-max: 3.4,
    x-label: [日用水量/$"m"^3$],
    y-label: [频率/组距],
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: range(1, 7).map(i => i / 10),
    y-ticks: range(1, 18).map(i => i / 5),
    x-grid: not answer,
    y-grid: not answer,
    {
      plot.annotate(resize: false, {
        if answer {
          let heights = (0.2, 1, 2.6, 2, 3.2, 1)
          for (i, h) in heights.enumerate() {
            line((i / 10, h), ((i + 1) / 10, h))
            let next = heights.at(i + 1, default: 0)
            line(((i + 1) / 10, 0), ((i + 1) / 10, calc.max(h, next)))
          }
        }
      })
    },
  )
})

#section[选择题：共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={0,2}$，$B={-2,-1,0,1,2}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${0,2}$], [${1,2}$], [${0}$], [${-2,-1,0,1,2}$]),
  answers: ([A],),
  explanation: [∵ $A subset B$，∴ $A inter B=A={0,2}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $z=(1-i)/(1+i)+2i$，则 $|z|=$#choice-placeholder()。],
  choices: ([$0$], [$1/2$], [$1$], [$sqrt(2)$]),
  answers: ([C],),
  explanation: [$z=(1-i)^2/2+2i=i$，∴ $|z|=1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某地区经过一年的新农村建设，农村的经济收入增加了一倍，实现翻番。为更好地了解该地区农村的经济收入变化情况，统计了该地区新农村建设前后农村的经济收入构成比例，得到如下饼图：
    #figure(income-pies())
    则下面结论中不正确的是#choice-placeholder()。],
  choices: (
    [新农村建设后，种植收入减少],
    [新农村建设后，其他收入增加了一倍以上],
    [新农村建设后，养殖收入增加了一倍],
    [新农村建设后，养殖收入与第三产业收入的总和超过了经济收入的一半],
  ),
  answers: ([A],),
  explanation: [设建设前总收入为 $T$，则建设后为 $2T$。种植收入由 $0.60T$ 增至 $0.74T$，A 错误；其他收入由 $0.04T$ 增至 $0.10T$，养殖收入由 $0.30T$ 增至 $0.60T$，建设后养殖与第三产业收入合占 $58%$，B、C、D 均正确。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知椭圆 $C:x^2/a^2+y^2/4=1$ 的一个焦点为 $(2,0)$，则 $C$ 的离心率为#choice-placeholder()。],
  choices: ([$1/3$], [$1/2$], [$sqrt(2)/2$], [$(2sqrt(2))/3$]),
  answers: ([C],),
  explanation: [焦点在 $x$ 轴上，半焦距为 2，短半轴长为 2，故长半轴长为 $sqrt(2^2+2^2)=2sqrt(2)$，离心率为 $2/(2sqrt(2))=sqrt(2)/2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知圆柱的上、下底面的中心分别为 $O_1,O_2$，过直线 $O_1 O_2$ 的平面截该圆柱所得的截面是面积为 8 的正方形，则该圆柱的表面积为#choice-placeholder()。],
  choices: ([$12sqrt(2)pi$], [$12pi$], [$8sqrt(2)pi$], [$10pi$]),
  answers: ([B],),
  explanation: [正方形边长为 $2sqrt(2)$，故圆柱高为 $2sqrt(2)$，底面半径为 $sqrt(2)$。表面积为 $2pi(sqrt(2))^2+2pi times sqrt(2) times 2sqrt(2)=12pi$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=x^3+(a-1)x^2+a x$。若 $f(x)$ 为奇函数，则曲线 $y=f(x)$ 在点 $(0,0)$ 处的切线方程为#choice-placeholder()。],
  choices: ([$y=-2x$], [$y=-x$], [$y=2x$], [$y=x$]),
  answers: ([D],),
  explanation: [奇函数的偶次项系数为 0，故 $a=1$。此时 $f'(0)=1$，切线方程为 $y=x$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在 $triangle A B C$ 中，$A D$ 为 $B C$ 边上的中线，$E$ 为 $A D$ 的中点，则 $arrow(E B)=$#choice-placeholder()。],
  choices: (
    [$3/4 arrow(A B)-1/4 arrow(A C)$],
    [$1/4 arrow(A B)-3/4 arrow(A C)$],
    [$3/4 arrow(A B)+1/4 arrow(A C)$],
    [$1/4 arrow(A B)+3/4 arrow(A C)$],
  ),
  answers: ([A],),
  explanation: [$arrow(A E)=1/2 arrow(A D)=1/4(arrow(A B)+arrow(A C))$，∴ $arrow(E B)=arrow(A B)-arrow(A E)=3/4 arrow(A B)-1/4 arrow(A C)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=2cos^2 x-sin^2 x+2$，则#choice-placeholder()。],
  choices: (
    [$f(x)$ 的最小正周期为 $pi$，最大值为 3],
    [$f(x)$ 的最小正周期为 $pi$，最大值为 4],
    [$f(x)$ 的最小正周期为 $2pi$，最大值为 3],
    [$f(x)$ 的最小正周期为 $2pi$，最大值为 4],
  ),
  answers: ([B],),
  explanation: [$f(x)=3/2 cos 2x+5/2$，故最小正周期为 $pi$，最大值为 4。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某圆柱的高为 2，底面周长为 16，其三视图如图。圆柱表面上的点 $M$ 在正视图上的对应点为 $A$，圆柱表面上的点 $N$ 在左视图上的对应点为 $B$，则在此圆柱侧面上，从 $M$ 到 $N$ 的路径中，最短路径的长度为#choice-placeholder()。
    #figure(cylinder-views())],
  choices: ([$2sqrt(17)$], [$2sqrt(5)$], [$3$], [$2$]),
  answers: ([B],),
  explanation: [由三视图可知，$M$、$N$ 分别位于上、下底面圆周，两点所在母线沿底面圆周的较短弧长为 $16/4=4$。展开侧面，最短路径是水平距离为 4、竖直距离为 2 的线段，长为 $sqrt(4^2+2^2)=2sqrt(5)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在长方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$A B=B C=2$，$A C_1$ 与平面 $B B_1 C_1 C$ 所成的角为 $30 degree$，则该长方体的体积为#choice-placeholder()。],
  choices: ([$8$], [$6sqrt(2)$], [$8sqrt(2)$], [$8sqrt(3)$]),
  answers: ([C],),
  explanation: [∵ $A B perp$ 平面 $B B_1 C_1 C$，∴ $angle A C_1 B=30 degree$，$B C_1=frac(A B, tan 30 degree)=2sqrt(3)$。故高 $C C_1=sqrt(B C_1^2-B C^2)=2sqrt(2)$，体积为 $2 times 2 times 2sqrt(2)=8sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知角 $alpha$ 的顶点为坐标原点，始边与 $x$ 轴的非负半轴重合，终边上有两点 $A(1,a)$、$B(2,b)$，且 $cos 2alpha=2/3$，则 $|a-b|=$#choice-placeholder()。],
  choices: ([$1/5$], [$sqrt(5)/5$], [$(2sqrt(5))/5$], [$1$]),
  answers: ([B],),
  explanation: [两点位于同一射线上，故 $b=2a$。又 $cos 2alpha=2cos^2 alpha-1=2/(1+a^2)-1=2/3$，得 $a^2=1/5$，∴ $|a-b|=|a|=sqrt(5)/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=cases(2^(-x) & quad x<=0, 1 & quad x>0)$，则满足 $f(x+1)<f(2x)$ 的 $x$ 的取值范围是#choice-placeholder()。],
  choices: (
    [$(-infinity,-1]$],
    [$(0,+infinity)$],
    [$(-1,0)$],
    [$(-infinity,0)$],
  ),
  answers: ([D],),
  explanation: [若 $x>=0$，则两边均为 1，不成立。若 $x<0$，则 $f(2x)>1$，且 $x+1>2x$：当 $x+1<=0$ 时，由负半轴上的严格递减性可知成立；当 $x+1>0$ 时，左边为 1，仍成立。故解集为 $(-infinity,0)$。],
)
#section[填空题：共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=log_2 (x^2+a)$，若 $f(3)=1$，则 $a=$#fill-placeholder()。],
  answers: ([$-7$],),
  explanation: [$log_2 (9+a)=1$，∴ $9+a=2$，$a=-7$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(x-2y-2<=0, x-y+1>=0, y<=0)$，则 $z=3x+2y$ 的最大值为#fill-placeholder()。],
  answers: ([$6$],),
  explanation: [由 $x<=2y+2$、$y<=0$，得 $z<=3(2y+2)+2y=8y+6<=6$。点 $(2,0)$ 满足全部约束，故最大值为 6。],
)
#question(
  "fill-in",
  score: 5,
  stem: [直线 $y=x+1$ 与圆 $x^2+y^2+2y-3=0$ 交于 $A,B$ 两点，则 $|A B|=$#fill-placeholder()。],
  answers: ([$2sqrt(2)$],),
  explanation: [圆心为 $(0,-1)$，半径为 2，圆心到直线 $x-y+1=0$ 的距离为 $sqrt(2)$，故弦长为 $2sqrt(4-2)=2sqrt(2)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $b sin C+c sin B=4a sin B sin C$，$b^2+c^2-a^2=8$，则 $triangle A B C$ 的面积为#fill-placeholder()。],
  answers: ([$(2sqrt(3))/3$],),
  explanation: [由正弦定理消去边长，再约去非零的 $sin B sin C$，得 $sin A=1/2$。又 $2b c cos A=b^2+c^2-a^2=8>0$，故 $A=pi/6$。面积为 $1/2 b c sin A=2tan A=(2sqrt(3))/3$。],
)
#section[解答题：共 70 分。第 17～21 题为必考题，每题 12 分。]
#question(
  "solution",
  score: 12,
  stem: [已知数列 ${a_n}$ 满足 $a_1=1$，$n a_(n+1)=2(n+1)a_n$，设 $b_n=a_n/n$。],
  parts: (
    subquestion(
      stem: [求 $b_1,b_2,b_3$。],
      answers: ([$b_1=1$，$b_2=2$，$b_3=4$。],),
      explanation: [由递推式得 $a_2=4$、$a_3=12$，除以相应项数即得。],
    ),
    subquestion(
      stem: [判断数列 ${b_n}$ 是否为等比数列，并说明理由。],
      answers: ([是首项为 1、公比为 2 的等比数列。],),
      explanation: [两边同除以 $n(n+1)$，得 $a_(n+1)/(n+1)=2a_n/n$，即 $b_(n+1)=2b_n$。结合 $b_1=1$，结论成立。],
    ),
    subquestion(
      stem: [求 ${a_n}$ 的通项公式。],
      answers: ([$a_n=n dot 2^(n-1)$],),
      explanation: [由（2）得 $b_n=2^(n-1)$，故 $a_n=n b_n=n dot 2^(n-1)$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在平行四边形 $A B C M$ 中，$A B=A C=3$，$angle A C M=90 degree$，以 $A C$ 为折痕将 $triangle A C M$ 折起，使点 $M$ 到达点 $D$ 的位置，且 $A B perp D A$。
    #figure(folded-parallelogram())],
  parts: (
    subquestion(
      stem: [证明：平面 $A C D perp$ 平面 $A B C$。],
      answers: ([证明见解析。],),
      explanation: [∵ $A B parallel C M$、$A C perp C M$，∴ $A B perp A C$。又 $A B perp A D$，$A C inter A D={A}$，故 $A B perp$ 平面 $A C D$，从而平面 $A C D perp$ 平面 $A B C$。],
    ),
    subquestion(
      stem: [$Q$ 为线段 $A D$ 上一点，$P$ 为线段 $B C$ 上一点，且 $B P=D Q=2/3 D A$，求三棱锥 $Q-A B P$ 的体积。],
      answers: ([$1$],),
      explanation: [折叠保持长度与夹角，故 $D C=3$、$D C perp A C$、$D A=3sqrt(2)=B C$。由（1）知 $D C perp A B$，故 $D C perp$ 平面 $A B C$，从而
        $ V_(D-A B C)=1/3 times (1/2 times 3 times 3) times 3=9/2. $
        又 $A Q=1/3 A D$、$B P=2/3 B C$，故 $V_(Q-A B P)=2/3 V_(Q-A B C)=2/3 times 1/3 V_(D-A B C)=1$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某家庭记录了未使用节水龙头 50 天的日用水量数据（单位：$"m"^3$）和使用了节水龙头 50 天的日用水量数据，得到频数分布表如下：
    #block[未使用节水龙头 50 天的日用水量频数分布表]
    #table(
      columns: 5,
      align: center,
      [日用水量], [$[0,0.1)$], [$[0.1,0.2)$], [$[0.2,0.3)$], [$[0.3,0.4)$],
      [频数], [1], [3], [2], [4],
      [日用水量], [$[0.4,0.5)$], [$[0.5,0.6)$], [$[0.6,0.7)$], [],
      [频数], [9], [26], [5], [],
    )
    #block[使用了节水龙头 50 天的日用水量频数分布表]
    #table(
      columns: 4,
      align: center,
      [日用水量], [$[0,0.1)$], [$[0.1,0.2)$], [$[0.2,0.3)$],
      [频数], [1], [5], [13],
      [日用水量], [$[0.3,0.4)$], [$[0.4,0.5)$], [$[0.5,0.6)$],
      [频数], [10], [16], [5],
    )],
  parts: (
    subquestion(
      stem: [在答题卡上作出使用了节水龙头 50 天的日用水量数据的频率分布直方图：
        #figure(water-histogram())],
      answers: ([图见解析。],),
      explanation: [各组频率分别为 $0.02,0.10,0.26,0.20,0.32,0.10$，除以组距 $0.1$，得各矩形的高为 $0.2,1,2.6,2,3.2,1$。
        #figure(water-histogram(answer: true))],
    ),
    subquestion(
      stem: [估计该家庭使用节水龙头后，日用水量小于 $0.35"m"^3$ 的概率。],
      answers: ([$0.48$],),
      explanation: [按组内均匀分布估计，所求概率为 $(1+5+13)/50+1/2 times 10/50=0.48$。],
    ),
    subquestion(
      stem: [估计该家庭使用节水龙头后，一年能节省多少水？（一年按 365 天计算，同一组中的数据以这组数据所在区间中点的值作代表。）],
      answers: ([$47.45"m"^3$],),
      explanation: [未使用节水龙头时，日用水量的估计均值为
        $
          overline(x)_1=(0.05 times 1+0.15 times 3+0.25 times 2+0.35 times 4+0.45 times 9+0.55 times 26+0.65 times 5)/50=0.48.
        $
        使用后，估计均值为
        $
          overline(x)_2=(0.05 times 1+0.15 times 5+0.25 times 13+0.35 times 10+0.45 times 16+0.55 times 5)/50=0.35.
        $
        故一年可节省 $(0.48-0.35) times 365=47.45$（$"m"^3$）。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [设抛物线 $C:y^2=2x$，点 $A(2,0)$、$B(-2,0)$，过点 $A$ 的直线 $l$ 与 $C$ 交于 $M,N$ 两点。],
  parts: (
    subquestion(
      stem: [当 $l$ 与 $x$ 轴垂直时，求直线 $B M$ 的方程。],
      answers: ([$y=plus.minus 1/2(x+2)$],),
      explanation: [此时 $l:x=2$，故 $M(2,plus.minus 2)$，直线 $B M$ 为 $y=plus.minus 1/2(x+2)$。],
    ),
    subquestion(
      stem: [证明：$angle A B M=angle A B N$。],
      answers: ([证明见解析。],),
      explanation: [$l$ 不可能为 $x$ 轴，否则只有一个交点。故可设 $l:x=t y+2$，$M(x_1,y_1)$、$N(x_2,y_2)$。联立抛物线方程得 $y^2-2t y-4=0$，从而 $y_1+y_2=2t$、$y_1 y_2=-4$。因此
        $
          k_(B M)+k_(B N)=y_1/(x_1+2)+y_2/(x_2+2)=frac(2t y_1 y_2+4(y_1+y_2), (x_1+2)(x_2+2))=0.
        $
        又 $x_1,x_2>=0$、$y_1 y_2<0$，两射线均指向 $B$ 的右侧并分居 $x$ 轴两侧，故关于 $B A$ 对称，即 $angle A B M=angle A B N$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=a e^x-ln x-1$。],
  parts: (
    subquestion(
      stem: [设 $x=2$ 是 $f(x)$ 的极值点。求 $a$，并求 $f(x)$ 的单调区间。],
      answers: (
        [$a=1/(2e^2)$；在 $(0,2)$ 上单调递减，在 $(2,+infinity)$ 上单调递增。],
      ),
      explanation: [定义域为 $(0,+infinity)$，$f'(x)=a e^x-1/x$。由 $f'(2)=0$ 得 $a=1/(2e^2)$。此时 $f'(x)=e^(x-2)/2-1/x$ 严格递增，且 $f'(2)=0$，故在 $(0,2)$ 上导数为负，在 $(2,+infinity)$ 上为正，单调区间如上。],
    ),
    subquestion(
      stem: [证明：当 $a>=1/e$ 时，$f(x)>=0$。],
      answers: ([证明见解析。],),
      explanation: [∵ $a>=1/e$，∴ $f(x)>=e^(x-1)-ln x-1$。令 $g(x)=e^(x-1)-ln x-1$，则 $g'(x)=e^(x-1)-1/x$。当 $0<x<1$ 时，$e^(x-1)<1<1/x$，导数为负；当 $x>1$ 时，导数为正。因此 $g(x)>=g(1)=0$，从而 $f(x)>=0$。],
    ),
  ),
)
#section[选考题：共 10 分。请考生在第 22、23 题中任选一题作答，如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。
    在直角坐标系 $x O y$ 中，曲线 $C_1$ 的方程为 $y=k|x|+2$。以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，曲线 $C_2$ 的极坐标方程为 $rho^2+2rho cos theta-3=0$。],
  parts: (
    subquestion(
      stem: [求 $C_2$ 的直角坐标方程。],
      answers: ([$(x+1)^2+y^2=4$],),
      explanation: [代入 $rho^2=x^2+y^2$、$rho cos theta=x$，得 $x^2+y^2+2x-3=0$，即 $(x+1)^2+y^2=4$。],
    ),
    subquestion(
      stem: [若 $C_1$ 与 $C_2$ 有且仅有三个公共点，求 $C_1$ 的方程。],
      answers: ([$y=-4/3|x|+2$],),
      explanation: [当 $k>=0$ 时，$C_1$ 上 $y>=2$，圆上满足此条件的点只有 $(-1,2)$，不可能有三个公共点，故 $k<0$。
        在 $x<0$ 时，联立得 $(1+k^2)x^2+(2-4k)x+1=0$，判别式 $4k(3k-4)>0$，两根之和为负、积为正，故左支恒有两个交点。
        在 $x>=0$ 时，联立得 $(1+k^2)x^2+(2+4k)x+1=0$。须恰有一个非负根，而两根之积为正，且 $x=0$ 不是根，所以该方程须有正的二重根。由 $4k(3k+4)=0$、$k<0$ 得 $k=-4/3$，此时二重根为 $3/5>0$，符合要求。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。
    已知 $f(x)=|x+1|-|a x-1|$。],
  parts: (
    subquestion(
      stem: [当 $a=1$ 时，求不等式 $f(x)>1$ 的解集。],
      answers: ([$(1/2,+infinity)$],),
      explanation: [此时 $f(x)=cases(-2 & quad x<=-1, 2x & quad -1<x<1, 2 & quad x>=1)$，逐段解得 $x>1/2$。],
    ),
    subquestion(
      stem: [若 $x in (0,1)$ 时不等式 $f(x)>x$ 成立，求 $a$ 的取值范围。],
      answers: ([$(0,2]$],),
      explanation: [在 $(0,1)$ 上，原不等式等价于 $|a x-1|<1$，即 $0<a x<2$。对一切 $x in (0,1)$ 成立当且仅当 $0<a<=2$。],
    ),
  ),
)
