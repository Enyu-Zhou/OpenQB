#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "浙江卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017浙江.pdf",
  regions: ("浙江",),
)

#let three-views() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (dx, label) in ((0, [正视图]), (3.3, [侧视图])) {
    scope({
      translate((dx, 0))
      line((-1, 0), (0, 3), (1, 0), close: true)
      line((0, 0), (0, 3))
      for x in (-1, 0, 1) { line((x, -0.08), (x, -0.35)) }
      for x in (-1, 0) {
        line((x, -0.25), (x + 1, -0.25), mark: (start: ">", end: ">"))
        content((x + 0.5, -0.25), box(fill: white, inset: 1pt)[$1$])
      }
      content((0, -0.65), label)
    })
  }
  line((1.5, 0), (1.5, 3), mark: (start: ">", end: ">"))
  content((1.5, 1.5), box(fill: white, inset: 1pt)[$3$])
  scope({
    translate((0, -2))
    arc((1, 0), start: 0deg, stop: 180deg, radius: 1)
    line((-1, 0), (0, -1), (1, 0), close: true)
    line((0, 0), (0, -1))
    content((0, -1.35), [俯视图])
  })
})
#let function-graph(kind) = {
  set text(size: 9pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: if kind == 1 or kind == 3 { move(dy: -12pt)[$O$] } else {
        $O$
      },
    ))
    let integral(x) = x * x * x * x / 4 - 0.72 * x * x
    let f = if kind == 0 {
      x => 0.8 * (x + 1) * (x - 0.2) * (x - 1.4)
    } else if kind == 1 {
      x => -0.8 * integral(x + 0.25) + 0.1 * x - 0.1
    } else if kind == 2 {
      x => 0.8 * integral(x + 0.3) - 0.16 * x + 0.1
    } else if kind == 3 { x => -0.9 * integral(x - 0.2) - 0.28 } else {
      x => 0.8 * integral(x - 0.2) + 0.25
    }
    plot.plot(
      size: (3.6, 2.4),
      axis-style: "school-book",
      x-min: -1.9,
      x-max: 1.9,
      y-min: if kind >= 3 { -0.5 } else { -0.9 },
      y-max: if kind >= 3 { 0.5 } else { 0.9 },
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      {
        plot.add(
          f,
          domain: if kind == 0 { (-1.28, 1.65) } else if kind >= 3 {
            (-1.3, 1.7)
          } else if kind == 2 { (-1.7, 1.55) } else { (-1.55, 1.7) },
          samples: 150,
          style: (stroke: (paint: black, thickness: figure-style.thickness)),
        )
      },
    )
  })
}
#let tetrahedron() = cetz.canvas(length: 18mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (-1, 0, 0)
  let B = (1, 0, 0)
  let C = (0, calc.sqrt(3), 0)
  let D = (0, calc.sqrt(3) / 3, calc.sqrt(8 / 3))
  let P = (0, 0, 0)
  let Q = (1 / 3, 2 * calc.sqrt(3) / 3, 0)
  let R = (-2 / 3, calc.sqrt(3) / 3, 0)
  oblique-project((0.9, -0.35), (0.9, 0.35 / calc.sqrt(3)), (0, 1), {
    line(A, B, C, D, A)
    line(D, B)
    line(D, P)
    line(D, Q)
    line(A, C, stroke: (dash: figure-style.dash))
    line(D, R, stroke: (dash: figure-style.dash))
    line(P, Q, R, close: true, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (A, $A$, "east"),
      (B, $B$, "north"),
      (C, $C$, "west"),
      (D, $D$, "south"),
      (P, $P$, "north-east"),
      (Q, $Q$, "north-west"),
      (R, $R$, "south-east"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let quadrilateral() = cetz.canvas(length: 12mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (0, 2)
  let B = (0, 0)
  let C = (2, 0)
  let u = (3 + calc.sqrt(119)) / 8
  let v = u + 1.25
  let D = (u, v)
  let O = (2 * u / (u + v), 2 * v / (u + v))
  line(A, B, C, D, close: true)
  line(A, C)
  line(B, D)
  for (p, label, anchor) in (
    (A, $A$, "south-east"),
    (B, $B$, "north-east"),
    (C, $C$, "north-west"),
    (D, $D$, "south"),
    (O, $O$, "west"),
  ) {
    content(p, label, anchor: anchor, padding: 3pt)
  }
})
#let pyramid(auxiliary: false) = cetz.canvas(length: 20mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let A = (0, 0, 0)
  let B = (1, 1, 0)
  let C = (2, 1, 0)
  let D = (2, 0, 0)
  let P = (1, -0.5, calc.sqrt(3) / 2)
  let E = (1.5, -0.25, calc.sqrt(3) / 4)
  let F = (0.5, -0.25, calc.sqrt(3) / 4)
  oblique-project((1, 0), (-0.45, -0.4), (0, 1.5), {
    line(A, B, C, D, P, A)
    line(P, B)
    line(P, C)
    line(C, E)
    line(A, D, stroke: (dash: figure-style.dash))
    if auxiliary {
      line(E, F, B, stroke: (dash: figure-style.dash))
      content(F, $F$, anchor: "east", padding: 3pt)
    }
    for (p, label, anchor) in (
      (A, $A$, "east"),
      (B, $B$, "north"),
      (C, $C$, "north"),
      (D, $D$, "west"),
      (P, $P$, "south"),
      (E, $E$, "west"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let parabola() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    shared-zero: $O$,
  ))
  plot.plot(
    size: (3.6, 3.6),
    axis-style: "school-book",
    x-min: -1.2,
    x-max: 2.4,
    y-min: -0.3,
    y-max: 3.3,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.add(
        x => x * x,
        domain: (-1.05, 1.75),
        samples: 120,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.annotate(resize: false, {
        let A = (-0.5, 0.25)
        let B = (1.5, 2.25)
        let P = (0.7, 0.49)
        let Q = (47 / 26, 37 / 52)
        line((-0.9, 0.17), (2.1, 0.77))
        line(A, B, Q)
        for (p, label, anchor) in (
          (A, $A$, "south"),
          (B, $B$, "west"),
          (P, $P$, "north-west"),
          (Q, $Q$, "north"),
        ) {
          content(p, label, anchor: anchor, padding: 5pt)
        }
      })
    },
  )
})

#section[选择题：共 10 小题，每小题 4 分，共 40 分。每小题给出的四个选项中，只有一项符合题目要求。]
#question(
  "single-choice",
  score: 4,
  stem: [已知集合 $P={x|-1<x<1}$，$Q={x|0<x<2}$，那么 $P union Q=$#choice-placeholder()。],
  choices: ([$(-1,2)$], [$(0,1)$], [$(-1,0)$], [$(1,2)$]),
  answers: ([A],),
  explanation: [两区间有交集，合并后为 $P union Q={x|-1<x<2}=(-1,2)$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [椭圆 $x^2/9+y^2/4=1$ 的离心率是#choice-placeholder()。],
  choices: ([$sqrt(13)/3$], [$sqrt(5)/3$], [$2/3$], [$5/9$]),
  answers: ([B],),
  explanation: [$a=3,b=2$，故 $c=sqrt(a^2-b^2)=sqrt(5)$，离心率为 $e=c/a=sqrt(5)/3$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [某几何体的三视图如图所示（单位：cm），则该几何体的体积（单位：$"cm"^3$）是#choice-placeholder()。
    #figure(three-views())],
  choices: ([$pi/2+1$], [$pi/2+3$], [$3pi/2+1$], [$3pi/2+3$]),
  answers: ([A],),
  explanation: [该几何体由半个圆锥和一个三棱锥组成，共同的高为 $3$。半圆锥底面半径为 $1$，三棱锥底面是底边长为 $2$、高为 $1$ 的三角形。因此
    $ V=1/3 (1/2 pi times 1^2+1/2 times 2 times 1)times 3=pi/2+1. $],
)
#question(
  "single-choice",
  score: 4,
  stem: [若 $x,y$ 满足约束条件 $cases(x>=0, x+y-3>=0, x-2y<=0)$，则 $z=x+2y$ 的取值范围是#choice-placeholder()。],
  choices: ([$[0,6]$], [$[0,4]$], [$[6,+infinity)$], [$[4,+infinity)$]),
  answers: ([D],),
  explanation: [由约束条件，$z=4/3 (x+y)+1/3 (2y-x)>=4$。取 $x=2t,y=t$（$t>=1$），均满足约束，且 $z=4t$ 可取遍 $[4,+infinity)$，故所求范围为 $[4,+infinity)$。],
)
#question(
  "single-choice",
  score: 4,
  stem: [若函数 $f(x)=x^2+a x+b$ 在区间 $[0,1]$ 上的最大值是 $M$，最小值是 $m$，则 $M-m$#choice-placeholder()。],
  choices: (
    [与 $a$ 有关，且与 $b$ 有关],
    [与 $a$ 有关，但与 $b$ 无关],
    [与 $a$ 无关，且与 $b$ 无关],
    [与 $a$ 无关，但与 $b$ 有关],
  ),
  answers: ([B],),
  explanation: [加上常数 $b$ 会使最大值和最小值同时增加 $b$，因此它们的差与 $b$ 无关。
    当 $a=0$ 时，$M-m=1$；当 $a=-1$ 时，$M-m=1/4$，故这个差与 $a$ 有关。],
)
#question(
  "single-choice",
  score: 4,
  stem: [已知等差数列 ${a_n}$ 的公差为 $d$，前 $n$ 项和为 $S_n$，则“$d>0$”是“$S_4+S_6>2S_5$”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([C],),
  explanation: [$S_4+S_6-2S_5=(S_6-S_5)-(S_5-S_4)=a_6-a_5=d$，所以两个条件等价。],
)
#question(
  "single-choice",
  score: 4,
  stem: [函数 $y=f(x)$ 的导函数 $y=f'(x)$ 的图象如图所示，则函数 $y=f(x)$ 的图象可能是#choice-placeholder()。
    #figure(function-graph(0))],
  choices: (
    [#figure(function-graph(1))],
    [#figure(function-graph(2))],
    [#figure(function-graph(3))],
    [#figure(function-graph(4))],
  ),
  answers: ([D],),
  explanation: [从左向右，导函数的符号依次为负、正、负、正，因此 $f$ 依次递减、递增、递减、递增，排除 A、C。
    又由图可知 $f'(0)>0$，所以 $f$ 在原点附近递增，排除 B，选 D。],
)
#question(
  "single-choice",
  score: 4,
  stem: [已知随机变量 $xi_i$ 满足 $P(xi_i=1)=p_i$，$P(xi_i=0)=1-p_i$，$i=1,2$。若 $0<p_1<p_2<1/2$，则#choice-placeholder()。],
  choices: (
    [$E(xi_1)<E(xi_2),D(xi_1)<D(xi_2)$],
    [$E(xi_1)<E(xi_2),D(xi_1)>D(xi_2)$],
    [$E(xi_1)>E(xi_2),D(xi_1)<D(xi_2)$],
    [$E(xi_1)>E(xi_2),D(xi_1)>D(xi_2)$],
  ),
  answers: ([A],),
  explanation: [$E(xi_i)=p_i$，$D(xi_i)=p_i(1-p_i)$。函数 $p(1-p)$ 在 $(0,1/2)$ 上严格递增，因此期望和方差均满足题中 A 项的不等式。],
)
#question(
  "single-choice",
  score: 4,
  stem: [如图，已知正四面体 $D-A B C$（所有棱长均相等的三棱锥），$P,Q,R$ 分别为 $A B,B C,C A$ 上的点，$A P=P B$，$(B Q)/(Q C)=(C R)/(R A)=2$，分别记二面角 $D-P R-Q$、$D-P Q-R$、$D-Q R-P$ 的平面角为 $alpha,beta,gamma$，则#choice-placeholder()。
    #figure(tetrahedron())],
  choices: (
    [$gamma<alpha<beta$],
    [$alpha<gamma<beta$],
    [$alpha<beta<gamma$],
    [$beta<gamma<alpha$],
  ),
  answers: ([B],),
  explanation: [
    #step[计算底面内的距离][不妨设正四面体棱长为 $2$，$D$ 在底面上的射影为底面中心 $O$，高为 $h$。
      在底面建立坐标系，取 $A=(-1,0)$、$B=(1,0)$、$C=(0,sqrt(3))$，则
      $
        P=(0,0),quad Q=(1/3,2sqrt(3)/3),quad R=(-2/3,sqrt(3)/3),quad O=(0,sqrt(3)/3).
      $
      三条直线的方程分别为
      $
        P R:sqrt(3)x+2y=0,quad P Q:2sqrt(3)x-y=0,quad Q R:sqrt(3)x-3y+5sqrt(3)/3=0.
      $
      因此 $O$ 到它们的距离依次为 $d_1=2sqrt(21)/21$、$d_2=sqrt(39)/39$、$d_3=1/3$，满足 $d_1>d_3>d_2$。
    ]
    #step[比较二面角][因 $arrow(P O)=2/5 arrow(P Q)+1/5 arrow(P R)$，$O$ 在三角形 $P Q R$ 内。以经过 $D O$ 且垂直于各底边的平面作截面，可得三个二面角均为锐角，且
      $ tan alpha=h/d_1,quad tan beta=h/d_2,quad tan gamma=h/d_3. $
      由正切函数在 $(0,pi/2)$ 上递增，得 $alpha<gamma<beta$。
    ]
  ],
)
#question(
  "single-choice",
  score: 4,
  stem: [如图，已知平面四边形 $A B C D$，$A B perp B C$，$A B=B C=A D=2$，$C D=3$，$A C$ 与 $B D$ 交于点 $O$，记 $I_1=arrow(O A)dot arrow(O B)$，$I_2=arrow(O B)dot arrow(O C)$，$I_3=arrow(O C)dot arrow(O D)$，则#choice-placeholder()。
    #figure(quadrilateral())],
  choices: ([$I_1<I_2<I_3$], [$I_1<I_3<I_2$], [$I_3<I_1<I_2$], [$I_2<I_1<I_3$]),
  answers: ([C],),
  explanation: [设 $O A=a$、$O B=b$、$O C=c$、$O D=d$，$theta=angle A O B$，其中 $a,b,c,d>0$。
    由 $A B^2=B C^2$，用余弦定理整理得 $a-c=2b cos theta$。再利用 $C D^2-A D^2=5$，得
    $ 5=(c^2+d^2-2c d cos theta)-(a^2+d^2+2a d cos theta)=(a+c)(c-a)(1+d/b). $
    因此 $c>a$、$cos theta<0$。同理由 $A B^2=A D^2$ 得 $b-d=2a cos theta<0$，故 $d>b$。
    于是 $c d>a b$，所以
    $ I_3=c d cos theta<a b cos theta=I_1<0<I_2=-b c cos theta. $],
)

#section[填空题：共 7 小题，多空题每题 6 分，单空题每题 4 分，共 36 分。]
#question(
  "fill-in",
  score: 4,
  stem: [我国古代数学家刘徽创立的“割圆术”可以估算圆周率 $pi$，理论上能把 $pi$ 的值计算到任意精度。祖冲之继承并发展了“割圆术”，将 $pi$ 的值精确到小数点后七位，其结果领先世界一千多年。“割圆术”的第一步是计算单位圆内接正六边形的面积 $S_6$，$S_6=$#fill-placeholder()。],
  answers: ([$3sqrt(3)/2$],),
  explanation: [连接圆心与六个顶点，把正六边形分成六个边长为 $1$ 的等边三角形，故 $S_6=6 times sqrt(3)/4=3sqrt(3)/2$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知 $a,b in RR$，$(a+b i)^2=3+4i$（$i$ 是虚数单位），则 $a^2+b^2=$#fill-placeholder()，$a b=$#fill-placeholder()。],
  answers: ([$5$], [$2$]),
  explanation: [取模得 $a^2+b^2=abs(a+b i)^2=abs(3+4i)=5$。比较虚部，$2a b=4$，故 $a b=2$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知多项式 $(x+1)^3(x+2)^2=x^5+a_1 x^4+a_2 x^3+a_3 x^2+a_4 x+a_5$，则 $a_4=$#fill-placeholder()，$a_5=$#fill-placeholder()。],
  answers: ([$16$], [$4$]),
  explanation: [$(x+1)^3=1+3x+3x^2+x^3$，$(x+2)^2=4+4x+x^2$，所以一次项系数为 $a_4=3 times 4+1 times 4=16$，常数项为 $a_5=1 times 4=4$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知 $triangle A B C$，$A B=A C=4$，$B C=2$。点 $D$ 为 $A B$ 延长线上一点，$B D=2$，连接 $C D$，则 $triangle B D C$ 的面积是#fill-placeholder()，$cos angle B D C=$#fill-placeholder()。],
  answers: ([$sqrt(15)/2$], [$sqrt(10)/4$]),
  explanation: [由余弦定理，$cos angle A B C=(4^2+2^2-4^2)/(2 times 4 times 2)=1/4$，所以 $sin angle D B C=sqrt(15)/4$，$cos angle D B C=-1/4$。
    因此 $S_(triangle B D C)=1/2 times 2 times 2 times sqrt(15)/4=sqrt(15)/2$。又 $C D^2=2^2+2^2-2 times 2 times 2 times (-1/4)=10$，故 $cos angle B D C=(2^2+10-2^2)/(2 times 2 times sqrt(10))=sqrt(10)/4$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知向量 $bold(a),bold(b)$ 满足 $abs(bold(a))=1$，$abs(bold(b))=2$，则 $abs(bold(a)+bold(b))+abs(bold(a)-bold(b))$ 的最小值是#fill-placeholder()，最大值是#fill-placeholder()。],
  answers: ([$4$], [$2sqrt(5)$]),
  explanation: [设两向量夹角为 $theta$，所求和为 $T>0$，则
    $
      T^2=(sqrt(5+4cos theta)+sqrt(5-4cos theta))^2=10+2sqrt(25-16cos^2 theta).
    $
    由 $0<=cos^2 theta<=1$，得 $16<=T^2<=20$，故最小值为 $4$，在两向量共线时取得；最大值为 $2sqrt(5)$，在两向量垂直时取得。],
)
#question(
  "fill-in",
  score: 4,
  stem: [从 6 男 2 女共 8 名学生中选出队长 1 人、副队长 1 人、普通队员 2 人组成 4 人服务队，要求服务队中至少有 1 名女生，共有#fill-placeholder()种不同的选法。（用数字作答）],
  answers: ([$660$],),
  explanation: [先选出至少包含一名女生的四人组，共有 $C_8^4-C_6^4=55$ 种。再从四人中依次选出队长、副队长，有 $A_4^2=12$ 种，所以总数为 $55 times 12=660$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知 $a in RR$，函数 $f(x)=abs(x+4/x-a)+a$ 在区间 $[1,4]$ 上的最大值是 $5$，则 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$(-infinity,9/2]$],),
  explanation: [令 $t=x+4/x$，当 $x in [1,4]$ 时，$t$ 的取值范围为 $[4,5]$。由于 $abs(t-a)+a=max(t, 2a-t)$，其最大值为 $max(5, 2a-4)$。因此所求条件等价于 $2a-4<=5$，即 $a<=9/2$。],
)

#section[解答题：共 5 小题，共 74 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [已知函数 $f(x)=sin^2 x-cos^2 x-2sqrt(3)sin x cos x$（$x in RR$）。],
  parts: (
    subquestion(
      stem: [求 $f(2pi/3)$ 的值。],
      answers: ([$2$],),
      explanation: [代入 $sin(2pi/3)=sqrt(3)/2$、$cos(2pi/3)=-1/2$，得 $f(2pi/3)=3/4-1/4+3/2=2$。],
    ),
    subquestion(
      stem: [求 $f(x)$ 的最小正周期及单调递增区间。],
      answers: (
        [最小正周期为 $pi$；单调递增区间为 $[pi/6+k pi,2pi/3+k pi]$（$k in ZZ$）。],
      ),
      explanation: [由二倍角公式，$f(x)=-cos 2x-sqrt(3)sin 2x=2sin(2x-5pi/6)$，所以最小正周期为 $pi$。
        令 $-pi/2+2k pi<=2x-5pi/6<=pi/2+2k pi$，解得 $pi/6+k pi<=x<=2pi/3+k pi$（$k in ZZ$），即得所求单调递增区间。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，已知四棱锥 $P-A B C D$ 中，$triangle P A D$ 是以 $A D$ 为斜边的等腰直角三角形，$B C parallel A D$，$C D perp A D$，$P C=A D=2D C=2C B$，$E$ 为 $P D$ 的中点。
    #figure(pyramid())],
  parts: (
    subquestion(
      stem: [证明：$C E parallel$ 平面 $P A B$。],
      answers: ([证明见解析。],),
      explanation: [取 $P A$ 的中点 $F$，连接 $E F,B F$。由中位线定理，$E F parallel A D$ 且 $E F=A D/2$，结合题设得 $E F parallel B C$、$E F=B C$，所以四边形 $B C E F$ 为平行四边形，故 $C E parallel B F$。
        又 $B F subset$ 平面 $P A B$，$C E subset.not$ 平面 $P A B$，所以 $C E parallel$ 平面 $P A B$。
        #figure(pyramid(auxiliary: true))],
    ),
    subquestion(
      stem: [求直线 $C E$ 与平面 $P B C$ 所成角的正弦值。],
      answers: ([$sqrt(2)/8$],),
      explanation: [
        #step[确定空间坐标][不妨设 $D C=1$，以 $A$ 为原点、$A D$ 方向为 $x$ 轴正方向，底面内平行于 $D C$ 的方向为 $y$ 轴正方向，指向 $P$ 所在一侧的底面法线方向为 $z$ 轴正方向。则
          $ A=(0,0,0),quad D=(2,0,0),quad C=(2,1,0),quad B=(1,1,0). $
          设 $P=(u,v,w)$，由 $P A=P D=sqrt(2)$，得 $u=1$、$v^2+w^2=1$。再由 $P C=2$，得 $1+(v-1)^2+w^2=4$，故 $v=-1/2$。因 $w>0$，所以
          $ P=(1,-1/2,sqrt(3)/2),quad E=(3/2,-1/4,sqrt(3)/4). $
        ]
        #step[利用法向量计算][平面 $P B C$ 的一个法向量为 $bold(n)=(0,sqrt(3),3)$，它与 $arrow(C B)=(-1,0,0)$、$arrow(C P)=(-1,-3/2,sqrt(3)/2)$ 都垂直。
          又 $arrow(C E)=(-1/2,-5/4,sqrt(3)/4)$，其模为 $sqrt(2)$。设所求角为 $theta$，则
          $
            sin theta=abs(arrow(C E)dot bold(n))/(abs(arrow(C E))abs(bold(n)))=(sqrt(3)/2)/(sqrt(2) times 2sqrt(3))=sqrt(2)/8.
          $
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知函数 $f(x)=(x-sqrt(2x-1))e^(-x)$（$x>=1/2$）。],
  parts: (
    subquestion(
      stem: [求 $f(x)$ 的导函数。],
      answers: ([$f'(x)=((1-x)(sqrt(2x-1)-2))/sqrt(2x-1)e^(-x)$（$x>1/2$）。],),
      explanation: [对 $x>1/2$，由乘积求导法则，
        $
          f'(x)=(1-1/sqrt(2x-1))e^(-x)-(x-sqrt(2x-1))e^(-x)=((1-x)(sqrt(2x-1)-2))/sqrt(2x-1)e^(-x).
        $],
    ),
    subquestion(
      stem: [求 $f(x)$ 在区间 $[1/2,+infinity)$ 上的取值范围。],
      answers: ([$[0,1/(2sqrt(e))]$],),
      explanation: [由导函数的符号，$f$ 在 $(1/2,1)$ 上递减，在 $(1,5/2)$ 上递增，在 $(5/2,+infinity)$ 上递减。
        对 $x>=1/2$，$x-sqrt(2x-1)=1/2 (sqrt(2x-1)-1)^2>=0$，故 $f(x)>=0$，且 $f(1)=0$。
        比较 $f(1/2)=1/2 e^(-1/2)$ 与 $f(5/2)=1/2 e^(-5/2)$，得最大值为 $f(1/2)=1/(2sqrt(e))$。
        $f$ 在 $[1/2,1]$ 上连续，能够取到上述最小值与最大值之间的所有值，故值域为 $[0,1/(2sqrt(e))]$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，已知抛物线 $x^2=y$，点 $A(-1/2,1/4)$、$B(3/2,9/4)$，抛物线上的点 $P(x,y)$（$-1/2<x<3/2$），过点 $B$ 作直线 $A P$ 的垂线，垂足为 $Q$。
    #figure(parabola())],
  parts: (
    subquestion(
      stem: [求直线 $A P$ 斜率的取值范围。],
      answers: ([$(-1,1)$],),
      explanation: [$k=(x^2-1/4)/(x+1/2)=x-1/2$。由 $-1/2<x<3/2$，得 $-1<k<1$。],
    ),
    subquestion(
      stem: [求 $abs(P A) dot abs(P Q)$ 的最大值。],
      answers: ([$27/16$],),
      explanation: [沿用第（1）问的斜率 $k$，则 $x=k+1/2$，因此
        $ arrow(A P)=(k+1)(1,k),quad arrow(P B)=(1-k)(1,k+2). $
        两者的数量积为 $(1-k)(1+k)^3>0$。因 $B Q perp A P$，$arrow(P Q)$ 是 $arrow(P B)$ 在直线 $A P$ 上的投影，且与 $arrow(A P)$ 同向，所以
        $ abs(P A)dot abs(P Q)=arrow(A P)dot arrow(P B)=(1-k)(1+k)^3. $
        令 $g(k)=(1-k)(1+k)^3$（$-1<k<1$），则 $g'(k)=2(1+k)^2(1-2k)$。故 $g$ 在 $(-1,1/2)$ 上递增，在 $(1/2,1)$ 上递减，最大值为 $g(1/2)=27/16$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [已知数列 ${x_n}$ 满足：$x_1=1$，$x_n=x_(n+1)+ln(1+x_(n+1))$（$n in NN^*$）。证明：当 $n in NN^*$ 时，],
  parts: (
    subquestion(
      stem: [$0<x_(n+1)<x_n$。],
      answers: ([证明见解析。],),
      explanation: [先用数学归纳法证明各项均为正。$x_1=1>0$；若 $x_n>0$，而 $x_(n+1)<=0$，由对数有意义知 $-1<x_(n+1)<=0$，从而 $x_n=x_(n+1)+ln(1+x_(n+1))<=0$，矛盾。因此 $x_(n+1)>0$，归纳可得各项均为正。
        于是 $ln(1+x_(n+1))>0$，故 $x_n>x_(n+1)>0$。],
    ),
    subquestion(
      stem: [$2x_(n+1)-x_n<=(x_n x_(n+1))/2$。],
      answers: ([证明见解析。],),
      explanation: [令 $t=x_(n+1)>0$，利用递推关系，有
        $ x_n x_(n+1)-4x_(n+1)+2x_n=t^2-2t+(t+2)ln(1+t). $
        设 $H(t)=t^2-2t+(t+2)ln(1+t)$（$t>=0$），则 $H(0)=0$，且
        $ H'(t)=2t-2+ln(1+t)+(t+2)/(t+1)=(2t^2+t)/(t+1)+ln(1+t)>=0. $
        所以 $H(t)>=0$，整理即得所证不等式。],
    ),
    subquestion(
      stem: [$1/2^(n-1)<=x_n<=1/2^(n-2)$。],
      answers: ([证明见解析。],),
      explanation: [
        #step[证明下界][对 $t>=0$，$t-ln(1+t)$ 的导数为 $t/(1+t)>=0$，且在 $t=0$ 时取值为 $0$，故 $ln(1+t)<=t$。
          因此 $x_n<=2x_(n+1)$，递推得 $x_n>=x_1/2^(n-1)=1/2^(n-1)$。
        ]
        #step[证明上界][将第（2）问的不等式除以正数 $x_n x_(n+1)$，整理得
          $ 1/x_(n+1)-1/2>=2(1/x_n-1/2). $
          从 $1/x_1-1/2=1/2$ 出发，递推得到 $1/x_n-1/2>=2^(n-2)$，所以
          $ x_n<=1/(1/2+2^(n-2))<=1/2^(n-2). $
          合并上下界即得结论。
        ]
      ],
    ),
  ),
)
