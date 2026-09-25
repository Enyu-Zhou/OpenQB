#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2023,
  type: "普通高等学校招生全国统一考试",
  name: "新课标二卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2023/2023新高考2(辽宁,重庆,海南,安徽,吉林,黑龙江,山西,云南).pdf",
  regions: ("辽宁", "重庆", "海南", "安徽", "吉林", "黑龙江", "山西", "云南"),
)

#let sine-diagram() = cetz.canvas(length: 10mm, {
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
    size: (6.4, 3.8),
    axis-style: "school-book",
    x-min: -0.65,
    x-max: 2.55,
    y-min: -1.2,
    y-max: 1.35,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    x-ticks: ((2 * calc.pi / 3, move(dx: 8pt, dy: 7pt)[$(2pi)/3$]),),
    y-ticks: ((0.5, move(dy: -12pt)[$1/2$]),),
    {
      plot.add(
        x => calc.sin((4 * x - 2 * calc.pi / 3) * 1rad),
        domain: (-0.65, 2.55),
        samples: 180,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.annotate(resize: false, {
        line((-0.65, 0.5), (2.55, 0.5))
        content(
          (5 * calc.pi / 24, 0.5),
          $A$,
          anchor: "south-east",
          padding: 0.12,
        )
        content(
          (3 * calc.pi / 8, 0.5),
          $B$,
          anchor: "south-west",
          padding: 0.12,
        )
      })
    },
  )
})

#let indicator-chart(ill) = {
  set text(size: 8pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let first = if ill { 95 } else { 70 }
    let heights = if ill {
      (0.002, 0.012, 0.034, 0.036, 0.040, 0.040, 0.036)
    } else { (0.038, 0.040, 0.040, 0.036, 0.034, 0.010, 0.002) }
    let levels = if ill { (0.002, 0.012, 0.034, 0.036, 0.040) } else {
      (0.002, 0.010, 0.034, 0.036, 0.038, 0.040)
    }
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.15,
      shared-zero: $O$,
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
        length: 0,
        label: (offset: 0.08),
      ),
      y: (label: (anchor: "south-west", offset: 0.1)),
    ))
    plot.plot(
      size: (5.8, 6.2),
      axis-style: "school-book",
      x-min: first - 5,
      x-max: first + 37,
      x-break: true,
      x-tick-step: none,
      x-ticks: range(first, first + 36, step: 5),
      x-label: move(dy: -10pt)[指标],
      y-min: 0,
      y-max: 0.043,
      y-tick-step: none,
      y-ticks: levels.map(v => (
        v,
        (if v < 0.01 { "0.00" } else { "0.0" })
          + str(int(calc.round(v * 1000))),
      )),
      y-label: [频率/组距],
      {
        plot.annotate(resize: false, {
          for (i, height) in heights.enumerate() {
            let left = first + 5 * i
            line((left, height), (left + 5, height))
            line(
              (left, 0),
              (
                left,
                calc.max(height, if i == 0 { 0 } else { heights.at(i - 1) }),
              ),
            )
          }
          line((first + 35, 0), (first + 35, heights.last()))
          for level in levels {
            let i = heights.position(h => h >= level)
            line((first - 5, level), (first + 5 * i, level), stroke: (
              dash: figure-style.dash,
            ))
          }
        })
      },
    )
  })
}
#let pyramid-diagram() = cetz.canvas(length: 19mm, {
  import cetz.draw: *
  let d = (0, 0, 0)
  let b = (2, 0, 0)
  let c = (0, 2, 0)
  let a = (1, 1, calc.sqrt(2))
  let e = (1, 1, 0)
  let f = (2, 2, calc.sqrt(2))
  oblique-project((1, 0), (0.45, 0.4), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(d, b, a, d)
    line(a, f, b)
    line(d, c, b, stroke: (dash: figure-style.dash))
    line(a, c, stroke: (dash: figure-style.dash))
    line(e, f, stroke: (dash: figure-style.dash))
    for (point, label, anchor) in (
      (d, $D$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (a, $A$, "south-east"),
      (e, $E$, "north-east"),
      (f, $F$, "south-west"),
    ) { content(point, label, anchor: anchor, padding: 0.12) }
  })
})

#section[选择题：本题共 8 小题，每小题 5 分，共 40 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  stem: [在复平面内，$(1+3"i")(3-"i")$ 对应的点位于#choice-placeholder()。],
  choices: ([第一象限], [第二象限], [第三象限], [第四象限]),
  answers: ([A],),
  explanation: [$(1+3"i")(3-"i")=6+8"i"$，对应点为 $(6,8)$，在第一象限。],
)
#question(
  "single-choice",
  stem: [设集合 $A={0,-a}$，$B={1,a-2,2a-2}$，若 $A subset.eq B$，则 $a=$#choice-placeholder()。],
  choices: ([$2$], [$1$], [$2/3$], [$-1$]),
  answers: ([B],),
  explanation: [因 $0 in B$，所以 $a=2$ 或 $a=1$。若 $a=2$，则 $-a=-2 in.not B={1,0,2}$，不合题意；若 $a=1$，则 $A={0,-1} subset.eq B={1,-1,0}$，符合题意。],
)
#question(
  "single-choice",
  stem: [某学校为了解学生参加体育运动的情况，用比例分配的分层随机抽样法作抽样调查，拟从初中部和高中部两层共抽取 $60$ 名学生，已知该校初中部和高中部分别有 $400$ 名和 $200$ 名学生，则不同的抽样结果共有#choice-placeholder()。],
  choices: (
    [$binom(400, 45)binom(200, 15)$ 种],
    [$binom(400, 20)binom(200, 40)$ 种],
    [$binom(400, 30)binom(200, 30)$ 种],
    [$binom(400, 40)binom(200, 20)$ 种],
  ),
  answers: ([D],),
  explanation: [两层抽取人数之比为 $400:200=2:1$，所以分别抽取 $40$ 人、$20$ 人。由分步乘法计数原理，共有 $binom(400, 40)binom(200, 20)$ 种。],
)
#question(
  "single-choice",
  stem: [若 $f(x)=(x+a)ln((2x-1)/(2x+1))$ 为偶函数，则 $a=$#choice-placeholder()。],
  choices: ([$-1$], [$0$], [$1/2$], [$1$]),
  answers: ([B],),
  explanation: [定义域为 $(-infinity,-1/2) union (1/2,+infinity)$，关于原点对称。令 $g(x)=ln((2x-1)/(2x+1))$，则 $g(-x)=-g(x)$，且 $g(x)!=0$。
    由 $f(-x)=f(x)$，得 $(x-a)g(x)=(x+a)g(x)$，故 $a=0$。此时 $f$ 确为偶函数。],
)
#question(
  "single-choice",
  stem: [已知椭圆 $C:x^2/3+y^2=1$ 的左、右焦点分别为 $F_1,F_2$，直线 $y=x+m$ 与 $C$ 交于 $A,B$ 两点，若 $triangle F_1 A B$ 的面积是 $triangle F_2 A B$ 面积的两倍，则 $m=$#choice-placeholder()。],
  choices: ([$2/3$], [$sqrt(2)/3$], [$-sqrt(2)/3$], [$-2/3$]),
  answers: ([C],),
  explanation: [两焦点为 $(-sqrt(2),0),(sqrt(2),0)$，两三角形共底 $A B$，故面积之比等于焦点到直线的距离之比。因此
    $ abs(m-sqrt(2))=2abs(m+sqrt(2)), $
    解得 $m=-sqrt(2)/3$ 或 $m=-3sqrt(2)$。
    将直线代入椭圆，得 $4x^2+6m x+3m^2-3=0$，有两个不同交点要求 $48-12m^2>0$，即 $abs(m)<2$。故取 $m=-sqrt(2)/3$。],
)
#question(
  "single-choice",
  stem: [已知函数 $f(x)=a "e"^x-ln x$ 在区间 $(1,2)$ 上单调递增，则 $a$ 的最小值为#choice-placeholder()。],
  choices: ([$"e"^2$], [$"e"$], [$"e"^(-1)$], [$"e"^(-2)$]),
  answers: ([C],),
  explanation: [单调递增要求 $f'(x)=a "e"^x-1/x>=0$，即 $a>=1/(x "e"^x)$ 对 $1<x<2$ 恒成立。
    $x "e"^x$ 在该区间递增，故右端上确界为 $"e"^(-1)$，从而 $a>="e"^(-1)$。取等号时区间内 $f'(x)>0$，所以最小值为 $"e"^(-1)$。],
)
#question(
  "single-choice",
  stem: [已知 $alpha$ 为锐角，$cos alpha=(1+sqrt(5))/4$，则 $sin(alpha/2)=$#choice-placeholder()。],
  choices: (
    [$(3-sqrt(5))/8$],
    [$(sqrt(5)-1)/8$],
    [$(3-sqrt(5))/4$],
    [$(sqrt(5)-1)/4$],
  ),
  answers: ([D],),
  explanation: [由半角公式与 $0<alpha/2<pi/4$，得 $sin(alpha/2)=sqrt((1-cos alpha)/2)=sqrt((3-sqrt(5))/8)=(sqrt(5)-1)/4$。],
)
#question(
  "single-choice",
  stem: [记 $S_n$ 为等比数列 $a_n$ 的前 $n$ 项和，若 $S_4=-5$，$S_6=21S_2$，则 $S_8=$#choice-placeholder()。],
  choices: ([$120$], [$85$], [$-85$], [$-120$]),
  answers: ([C],),
  explanation: [设公比为 $q$，则 $S_4=(1+q^2)S_2=-5$，所以 $S_2!=0$。
    由 $S_6=(1+q^2+q^4)S_2=21S_2$，得 $(q^2-4)(q^2+5)=0$，故 $q^2=4$。
    因此 $S_8=(1+q^4)S_4=17 times (-5)=-85$。],
)

#section[选择题：本题共 4 小题，每小题 5 分，共 20 分。在每小题给出的选项中，有多项符合题目要求。全部选对的得 5 分，部分选对的得 2 分，有选错的得 0 分。]
#question(
  "multiple-choice",
  stem: [已知圆锥的顶点为 $P$，底面圆心为 $O$，$A B$ 为底面直径，$angle A P B=120 degree$，$P A=2$，点 $C$ 在底面圆周上，且二面角 $P-A C-O$ 为 $45 degree$，则#choice-placeholder()。],
  choices: (
    [该圆锥的体积为 $pi$],
    [该圆锥的侧面积为 $4sqrt(3)pi$],
    [$A C=2sqrt(2)$],
    [$triangle P A C$ 的面积为 $sqrt(3)$],
  ),
  answers: ([AC],),
  explanation: [
    #step[求圆锥的高和半径][轴截面 $triangle P A B$ 中，$P O=2cos 60 degree=1$，$O A=2sin 60 degree=sqrt(3)$。
      因此体积为 $1/3 pi (sqrt(3))^2 times 1=pi$，侧面积为 $pi times sqrt(3) times 2=2sqrt(3)pi$。]
    #step[求弦长和三角形面积][取 $A C$ 中点 $H$，则 $O H perp A C$，由等腰三角形 $P A C$ 得 $P H perp A C$，故 $angle P H O=45 degree$。
      又 $P O perp O H$，所以 $O H=P O=1$，$P H=sqrt(2)$。
      于是 $A C=2sqrt(O A^2-O H^2)=2sqrt(2)$，$S_(triangle P A C)=1/2 times 2sqrt(2) times sqrt(2)=2$。故选 A、C。]
  ],
)
#question(
  "multiple-choice",
  stem: [设 $O$ 为坐标原点，直线 $y=-sqrt(3)(x-1)$ 过抛物线 $C:y^2=2p x$（$p>0$）的焦点，且与 $C$ 交于 $M,N$ 两点，$l$ 为 $C$ 的准线，则#choice-placeholder()。],
  choices: (
    [$p=2$],
    [$abs(M N)=8/3$],
    [以 $M N$ 为直径的圆与 $l$ 相切],
    [$triangle O M N$ 为等腰三角形],
  ),
  answers: ([AC],),
  explanation: [直线与 $x$ 轴交于焦点 $(1,0)$，故 $p=2$，准线为 $x=-1$。
    联立 $3(x-1)^2=4x$，得 $x=3$ 或 $x=1/3$，可取 $M=(3,-2sqrt(3))$，$N=(1/3,2sqrt(3)/3)$。
    所以 $abs(M N)=16/3$，中点为 $(5/3,-2sqrt(3)/3)$。以 $M N$ 为直径的圆半径为 $8/3$，圆心到准线的距离也为 $8/3$，故相切。
    又 $abs(O M)=sqrt(21)$，$abs(O N)=sqrt(13)/3$，三边两两不等。故选 A、C。],
)
#question(
  "multiple-choice",
  stem: [若函数 $f(x)=a ln x+b/x+c/x^2$（$a!=0$）既有极大值也有极小值，则#choice-placeholder()。],
  choices: ([$b c>0$], [$a b>0$], [$b^2+8a c>0$], [$a c<0$]),
  answers: ([BCD],),
  explanation: [定义域为 $(0,+infinity)$，$f'(x)=(a x^2-b x-2c)/x^3$。有两个极值要求二次式有两个不同的正根，故
    $ b^2+8a c>0, quad b/a>0, quad -2c/a>0. $
    所以 $a b>0$，$a c<0$，进而 $b c<0$。故选 B、C、D。],
)
#question(
  "multiple-choice",
  stem: [在信道内传输 $0,1$ 信号，信号的传输相互独立。发送 $0$ 时，收到 $1$ 的概率为 $alpha$（$0<alpha<1$），收到 $0$ 的概率为 $1-alpha$；发送 $1$ 时，收到 $0$ 的概率为 $beta$（$0<beta<1$），收到 $1$ 的概率为 $1-beta$。考虑两种传输方案：单次传输和三次传输。单次传输是指每个信号只发送 $1$ 次，三次传输是指每个信号重复发送 $3$ 次。收到的信号需要译码，译码规则如下：单次传输时，收到的信号即为译码；三次传输时，收到的信号中出现次数多的即为译码（例如，若依次收到 $1,0,1$，则译码为 $1$）。下列说法正确的是#choice-placeholder()。],
  choices: (
    [采用单次传输方案，若依次发送 $1,0,1$，则依次收到 $1,0,1$ 的概率为 $(1-alpha)(1-beta)^2$],
    [采用三次传输方案，若发送 $1$，则依次收到 $1,0,1$ 的概率为 $beta(1-beta)^2$],
    [采用三次传输方案，若发送 $1$，则译码为 $1$ 的概率为 $beta(1-beta)^2+(1-beta)^3$],
    [当 $0<alpha<0.5$ 时，若发送 $0$，则采用三次传输方案译码为 $0$ 的概率大于采用单次传输方案译码为 $0$ 的概率],
  ),
  answers: ([ABD],),
  explanation: [
    #step[选项 A、B][由各次传输独立，两种情形的概率分别为 $(1-beta)(1-alpha)(1-beta)$、$(1-beta)beta(1-beta)$，故 A、B 正确。]
    #step[选项 C][译码为 $1$ 要求至少两次收到 $1$，其概率为 $3beta(1-beta)^2+(1-beta)^3$，故 C 错误。]
    #step[选项 D][两种方案译码为 $0$ 的概率之差为
      $ 3alpha(1-alpha)^2+(1-alpha)^3-(1-alpha)=alpha(1-alpha)(1-2alpha)>0, $
      故 D 正确。]
  ],
)

#section[填空题：本题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  stem: [已知向量 $bold(a),bold(b)$ 满足 $abs(bold(a)-bold(b))=sqrt(3)$，$abs(bold(a)+bold(b))=abs(2bold(a)-bold(b))$，则 $abs(bold(b))=$#fill-placeholder()。],
  answers: ([$sqrt(3)$],),
  explanation: [将第二个等式两边平方并整理，得 $abs(bold(a))^2=2bold(a) dot bold(b)$。因此
    $
      3=abs(bold(a)-bold(b))^2=abs(bold(a))^2-2bold(a) dot bold(b)+abs(bold(b))^2=abs(bold(b))^2,
    $
    所以 $abs(bold(b))=sqrt(3)$。],
)
#question(
  "fill-in",
  stem: [底面边长为 $4$ 的正四棱锥被平行于其底面的平面所截，截去一个底面边长为 $2$、高为 $3$ 的正四棱锥，所得棱台的体积为#fill-placeholder()。],
  answers: ([$28$],),
  explanation: [截去的小棱锥与原棱锥相似，相似比为 $1:2$，所以原棱锥高为 $6$。棱台体积为 $1/3 times 4^2 times 6-1/3 times 2^2 times 3=28$。],
)
#question(
  "fill-in",
  stem: [已知直线 $x-m y+1=0$ 与 $circle C:(x-1)^2+y^2=4$ 交于 $A,B$ 两点，写出满足“$triangle A B C$ 面积为 $8/5$”的 $m$ 的一个值#fill-placeholder()。],
  answers: ([$2$（$2,-2,1/2,-1/2$ 中任意一个均可）],),
  explanation: [圆心为 $(1,0)$，半径为 $2$，圆心到直线的距离为 $d=2/sqrt(1+m^2)$。于是
    $ S_(triangle A B C)=d sqrt(4-d^2)=(4abs(m))/(1+m^2)=8/5. $
    解得 $abs(m)=2$ 或 $abs(m)=1/2$，四个值均使直线与圆交于两点，任选其一即可。],
)
#question(
  "fill-in",
  stem: [已知函数 $f(x)=sin(omega x+phi)$，如图，$A,B$ 是直线 $y=1/2$ 与曲线 $y=f(x)$ 的两个交点，若 $abs(A B)=pi/6$，则 $f(pi)=$#fill-placeholder()。#figure(sine-diagram())],
  answers: ([$-sqrt(3)/2$],),
  explanation: [由图，$A,B$ 是同一波峰两侧与 $y=1/2$ 的交点，对应相位差为 $5pi/6-pi/6=2pi/3$，占一个周期的 $1/3$。
    所以周期 $T=3abs(A B)=pi/2$。又图中 $x=2pi/3$ 处为向上穿过 $x$ 轴的零点，故
    $ f(x)=sin(4(x-2pi/3)), quad f(pi)=sin(4pi/3)=-sqrt(3)/2. $],
)

#section[解答题：本题共 6 小题，共 70 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 10,
  stem: [记 $triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $triangle A B C$ 面积为 $sqrt(3)$，$D$ 为 $B C$ 的中点，且 $A D=1$。],
  parts: (
    subquestion(
      stem: [若 $angle A D C=pi/3$，求 $tan B$。],
      answers: ([$sqrt(3)/5$],),
      explanation: [过 $A$ 作 $A H perp B C$，垂足为 $H$。由 $A D=1$，$angle A D C=pi/3$，得 $A H=sqrt(3)/2$，$D H=1/2$，且 $H$ 在射线 $D C$ 上。
        由 $1/2 B C dot A H=sqrt(3)$，得 $B C=4$，故 $B H=B D+D H=5/2$，因此 $tan B=(A H)/(B H)=sqrt(3)/5$。],
    ),
    subquestion(
      stem: [若 $b^2+c^2=8$，求 $b,c$。],
      answers: ([$b=c=2$],),
      explanation: [由中线长公式，$b^2+c^2=2A D^2+1/2 a^2$，所以 $a^2=12$，$a=2sqrt(3)$。
        三角形在 $B C$ 边上的高为 $(2sqrt(3))/a=1=A D$，故 $A D perp B C$。因此 $b=c=sqrt(1+(a/2)^2)=2$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知 $a_n$ 为等差数列，$b_n=cases(a_n-6&quad n "为奇数", 2a_n&quad n "为偶数")$。记 $S_n,T_n$ 分别为数列 $a_n,b_n$ 的前 $n$ 项和，$S_4=32$，$T_3=16$。],
  parts: (
    subquestion(
      stem: [求 $a_n$ 的通项公式。],
      answers: ([$a_n=2n+3$],),
      explanation: [设公差为 $d$。由题意，
        $ 4a_1+6d=32, quad (a_1-6)+2(a_1+d)+(a_1+2d-6)=16. $
        解得 $a_1=5$，$d=2$，故 $a_n=2n+3$。],
    ),
    subquestion(
      stem: [证明：当 $n>5$ 时，$T_n>S_n$。],
      answers: ([证明见解析。],),
      explanation: [由上一问，$b_n-a_n=cases(-6&quad n "为奇数", 2n+3&quad n "为偶数")$。
        若 $n=2k>5$，则 $k>=3$，将相邻奇偶项配对得
        $ T_(2k)-S_(2k)=sum_(j=1)^k (-6+4j+3)=k(2k-1)>0. $
        若 $n=2k+1>5$，则 $k>=3$，从而
        $ T_(2k+1)-S_(2k+1)=k(2k-1)-6=(2k+3)(k-2)>0. $
        两种情形均有 $T_n>S_n$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [某研究小组经过研究发现某种疾病的患病者与未患病者的某项医学指标有明显差异，经过大量调查，得到如下的患病者和未患病者该指标的频率分布直方图：
    #figure(grid(
      columns: (1fr, 1fr),
      gutter: 12pt,
      align(center)[#indicator-chart(true) 患病者],
      align(center)[#indicator-chart(false) 未患病者],
    ))
    利用该指标制定一个检测标准，需要确定临界值 $c$，将该指标大于 $c$ 的人判定为阳性，小于或等于 $c$ 的人判定为阴性。此检测标准的漏诊率是将患病者判定为阴性的概率，记为 $p(c)$；误诊率是将未患病者判定为阳性的概率，记为 $q(c)$。假设数据在组内均匀分布，以事件发生的频率作为相应事件发生的概率。],
  parts: (
    subquestion(
      stem: [当漏诊率 $p(c)=0.5%$ 时，求临界值 $c$ 和误诊率 $q(c)$。],
      answers: ([$c=97.5$，$q(c)=3.5%$],),
      explanation: [患病者指标在 $[95,100)$ 内的频率为 $5 times 0.002=0.01$，所以 $c in [95,100)$，且 $0.002(c-95)=0.005$，得 $c=97.5$。
        此时 $q(c)=0.010(100-97.5)+0.002 times 5=0.035=3.5%$。],
    ),
    subquestion(
      stem: [设函数 $f(c)=p(c)+q(c)$。当 $c in [95,105]$ 时，求 $f(c)$ 的解析式，并求 $f(c)$ 在区间 $[95,105]$ 的最小值。],
      answers: (
        [$f(c)=cases(-0.008c+0.82&quad 95<=c<=100, 0.010c-0.98&quad 100<c<=105)$，最小值为 $0.02$。],
      ),
      explanation: [当 $95<=c<=100$ 时，
        $ p(c)=0.002(c-95), quad q(c)=0.010(100-c)+0.002 times 5, $
        故 $f(c)=-0.008c+0.82$。
        当 $100<c<=105$ 时，
        $ p(c)=0.002 times 5+0.012(c-100), quad q(c)=0.002(105-c), $
        故 $f(c)=0.010c-0.98$。
        因此 $f$ 在 $[95,100]$ 上递减，在 $[100,105]$ 上递增，最小值为 $f(100)=0.02$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，三棱锥 $A-B C D$ 中，$D A=D B=D C$，$B D perp C D$，$angle A D B=angle A D C=60 degree$，$E$ 为 $B C$ 的中点。#figure(pyramid-diagram())],
  parts: (
    subquestion(
      stem: [证明：$B C perp D A$。],
      answers: ([证明见解析。],),
      explanation: [由条件知 $triangle A D B$、$triangle A D C$ 均为等边三角形，故 $A B=A C$。因 $E$ 为 $B C$ 中点，得 $A E perp B C$。
        又 $D B=D C$，故 $D E perp B C$。因 $A E inter D E={E}$，所以 $B C perp "平面" A D E$，从而 $B C perp D A$。],
    ),
    subquestion(
      stem: [点 $F$ 满足 $arrow(E F)=arrow(D A)$，求二面角 $D-A B-F$ 的正弦值。],
      answers: ([$sqrt(3)/3$],),
      explanation: [
        #step[建立坐标系][相似缩放不改变二面角，可令 $D B=2$。以 $D$ 为原点，$D B,D C$ 方向为 $x,y$ 轴正方向，取垂直底面指向 $A$ 的方向为 $z$ 轴正方向。
          由 $D A=D B=D C=2$ 和两个 $60 degree$ 角，得
          $ D=(0,0,0), quad B=(2,0,0), quad C=(0,2,0), quad A=(1,1,sqrt(2)). $
          因而 $E=(1,1,0)$，$F=E+arrow(D A)=(2,2,sqrt(2))$。]
        #step[用法向量求正弦][平面 $D A B$ 的一个法向量为 $bold(n)_1=(0,sqrt(2),-1)$，平面 $F A B$ 的一个法向量为 $bold(n)_2=(1,-1,sqrt(2))$。
          设二面角为 $theta$，则
          $
            abs(cos theta)=abs(bold(n)_1 dot bold(n)_2)/(abs(bold(n)_1)abs(bold(n)_2))=(2sqrt(2))/(2sqrt(3))=sqrt(6)/3.
          $
          所以 $sin theta=sqrt(1-2/3)=sqrt(3)/3$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知双曲线 $C$ 的中心为坐标原点，左焦点为 $(-2sqrt(5),0)$，离心率为 $sqrt(5)$。],
  parts: (
    subquestion(
      stem: [求 $C$ 的方程。],
      answers: ([$x^2/4-y^2/16=1$],),
      explanation: [设 $C:x^2/a^2-y^2/b^2=1$。由 $c=2sqrt(5)$、$c/a=sqrt(5)$，得 $a=2$，$b^2=c^2-a^2=16$，故方程为 $x^2/4-y^2/16=1$。],
    ),
    subquestion(
      stem: [记 $C$ 的左、右顶点分别为 $A_1,A_2$，过点 $(-4,0)$ 的直线与 $C$ 的左支交于 $M,N$ 两点，$M$ 在第二象限，直线 $M A_1$ 与直线 $N A_2$ 交于 $P$，证明：点 $P$ 在定直线上。],
      answers: ([点 $P$ 在定直线 $x=-1$ 上。],),
      explanation: [
        #step[利用交点关系][由上一问，$A_1=(-2,0)$，$A_2=(2,0)$。直线 $M N$ 不可能是 $x$ 轴，可设为 $x=m y-4$。
          设 $M=(x_1,y_1)$，$N=(x_2,y_2)$，代入双曲线得
          $ (4m^2-1)y^2-32m y+48=0. $
          因有两个不同交点，$4m^2-1!=0$，故
          $ y_1+y_2=(32m)/(4m^2-1), quad y_1 y_2=48/(4m^2-1). $]
        #step[求交点的横坐标][两交点均不是顶点，否则直线 $M N$ 为 $x$ 轴，与条件矛盾。因此可设直线 $M A_1,N A_2$ 的斜率分别为
          $ u=y_1/(m y_1-2), quad v=y_2/(m y_2-6). $
          由上式，
          $ u+3v=(4m y_1 y_2-6(y_1+y_2))/((m y_1-2)(m y_2-6))=0. $
          又 $y_1>0$，故 $u!=0$，从而 $v!=0$。两直线方程为 $y=u(x+2)$、$y=v(x-2)$，联立并代入 $u=-3v$，得 $-3(x+2)=x-2$，所以 $x=-1$。]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  parts: (
    subquestion(
      stem: [证明：当 $0<x<1$ 时，$x-x^2<sin x<x$。],
      answers: ([证明见解析。],),
      explanation: [令 $g(x)=x-sin x$，则 $g'(x)=1-cos x>0$（$0<x<1$），故 $g(x)>g(0)=0$，即 $sin x<x$。
        再令 $h(x)=sin x-x+x^2$，则 $h'(x)=cos x-1+2x$，$h''(x)=2-sin x>0$。所以 $h'(x)>h'(0)=0$，进而 $h(x)>h(0)=0$，即 $sin x>x-x^2$。],
    ),
    subquestion(
      stem: [已知函数 $f(x)=cos a x-ln(1-x^2)$，若 $x=0$ 是 $f(x)$ 的极大值点，求 $a$ 的取值范围。],
      answers: ([$(-infinity,-sqrt(2)) union (sqrt(2),+infinity)$],),
      explanation: [
        #step[化为正半轴附近的单调性][函数定义域为 $(-1,1)$，且为偶函数。记 $b=abs(a)$，则
          $ f'(x)=-b sin b x+(2x)/(1-x^2). $
          当 $b=0$ 时，$f'(x)>0$（$0<x<1$），$0$ 不是极大值点。下面设 $b>0$，只需考察充分小的正数 $x$，使 $0<b x<1$。]
        #step[讨论参数范围][若 $b^2<=2$，由第一问的 $sin b x<b x$，得
          $ f'(x)>-b^2 x+(2x)/(1-x^2)>=-2x+(2x)/(1-x^2)>0. $
          故 $0$ 不是极大值点。
          若 $b^2>2$，由 $sin b x>b x-b^2 x^2$，得
          $ f'(x)<x(2/(1-x^2)-b^2+b^3 x). $
          括号内的式子在 $x=0$ 时为 $2-b^2<0$，且在 $0$ 附近连续，所以充分小的正数 $x$ 使 $f'(x)<0$。结合偶性，$f$ 在 $0$ 左侧附近递增、右侧附近递减，故 $0$ 为极大值点。
          因此 $abs(a)>sqrt(2)$，即所求范围。]
      ],
    ),
  ),
)
