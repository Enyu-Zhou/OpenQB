#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2019,
  type: "普通高等学校招生全国统一考试",
  name: "全国三卷理科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2019/2019全国3理(云南,广西,贵州,西藏,四川).pdf",
  regions: ("云南", "广西", "贵州", "西藏", "四川"),
)

#let graph-choice(kind) = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: 0.12,
      shared-zero: $O$,
      x: (label: (anchor: "west", offset: 0.18)),
      y: (label: (anchor: "south", offset: 0.18)),
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
    ))
    plot.plot(
      size: (4.5, 3.4),
      axis-style: "school-book",
      x-min: -6.5,
      x-max: 6.5,
      y-min: -9,
      y-max: 9,
      x-label: $x$,
      y-label: $y$,
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: (4,),
      y-ticks: (8,),
      {
        plot.add(
          x => {
            let t = if kind == "A" { 2 * x } else { x }
            let f = 2 * t * t * t / (calc.pow(2, t) + calc.pow(2, -t))
            if kind == "C" { calc.abs(f) } else if kind == "D" { -f } else { f }
          },
          domain: (-6, 6),
          samples: 150,
          style: (stroke: (paint: black, thickness: figure-style.thickness)),
        )
      },
    )
  })
}

#let square-diagram() = cetz.canvas(length: 22mm, {
  import cetz.draw: *
  let d = (0, 0, 0)
  let a = (2, 0, 0)
  let c = (0, 2, 0)
  let b = (2, 2, 0)
  let e = (0, 1, calc.sqrt(3))
  let m = (0, 0.5, calc.sqrt(3) / 2)
  let n = (1, 1, 0)
  oblique-project((1, 0), (0.35, 0.3), (-0.08, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, d, a)
    line(d, e, c)
    line(b, m)
    line(e, n)
    for (p, label, anchor) in (
      (a, $A$, "north"),
      (b, $B$, "south-west"),
      (c, $C$, "south-west"),
      (d, $D$, "north-east"),
      (e, $E$, "south"),
      (m, $M$, "east"),
      (n, $N$, "north-west"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#let flowchart() = cetz.canvas(length: 8mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.6, 8.4), (0.6, 9.1), radius: 0.16)
  content((0, 8.75), [开始])
  for (y, label) in ((7.15, [输入 $epsilon$]), (0.3, [输出 $s$])) {
    line((-0.95, y), (.7, y), (0.95, y + .75), (-.7, y + .75), close: true)
    content((0, y + .375), label)
  }
  for (y, label) in ((5.85, [$x=1,s=0$]), (4.6, [$s=s+x$]), (3.15, [$x=x/2$])) {
    rect((-1.2, y), (1.2, y + .8))
    content((0, y + .4), label)
  }
  line((0, 2.55), (1.2, 2.05), (0, 1.55), (-1.2, 2.05), close: true)
  content((0, 2.05), [$x<epsilon$])
  rect((-.6, -.95), (.6, -.25), radius: .16)
  content((0, -.6), [结束])
  for (y1, y2) in (
    (8.4, 7.9),
    (7.15, 6.65),
    (5.85, 5.4),
    (4.6, 3.95),
    (3.15, 2.55),
    (1.55, 1.05),
    (.3, -.25),
  ) {
    line((0, y1), (0, y2), mark: (end: ">"))
  }
  line((1.2, 2.05), (1.8, 2.05), (1.8, 5.65), (0, 5.65), mark: (end: ">"))
  content((1.4, 2.13), [否], anchor: "south")
  content((.12, 1.3), [是], anchor: "west")
})

#let cutout-diagram() = cetz.canvas(length: 9mm, {
  import cetz.draw: *
  let a = (0, 0, 0)
  let b = (6, 0, 0)
  let c = (6, 6, 0)
  let d = (0, 6, 0)
  let a1 = (0, 0, 4)
  let b1 = (6, 0, 4)
  let c1 = (6, 6, 4)
  let d1 = (0, 6, 4)
  let o = (3, 3, 2)
  let e = (6, 3, 0)
  let f = (6, 6, 2)
  let g = (6, 3, 4)
  let h = (6, 0, 2)
  oblique-project((1, 0), (.35, .35), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, c1, d1, a1, a)
    line(a1, b1, c1)
    line(b, b1)
    line(a, d, c, stroke: (dash: figure-style.dash))
    line(d, d1, stroke: (dash: figure-style.dash))
    line(e, f, g, h, e)
    for p in (e, f, g, h) { line(o, p, stroke: (dash: figure-style.dash)) }
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "north"),
      (c, $C$, "west"),
      (d, $D$, "south-east"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "south-east"),
      (c1, $C_1$, "south-west"),
      (d1, $D_1$, "south"),
      (o, $O$, "east"),
      (e, $E$, "north-west"),
      (f, $F$, "west"),
      (g, $G$, "south-east"),
      (h, $H$, "north-east"),
    ) { content(p, label, anchor: anchor, padding: 3pt) }
  })
})

#let histogram(second: false) = {
  set text(size: 8pt)
  cetz.canvas(length: 10mm, {
    import cetz.draw: *
    let heights = if second { (.05, .10, .15, .35, .20, .15) } else {
      (.15, .20, .30, .20, .10, .05)
    }
    let start = if second { 2.5 } else { 1.5 }
    let levels = if second { (.05, .10, .15, .20, .35) } else {
      (.05, .10, .15, .20, .30)
    }
    let labels = if second { ([0.05], $b$, [0.15], [0.20], $a$) } else {
      ([0.05], [0.10], [0.15], [0.20], [0.30])
    }
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      padding: 0,
      overshoot: .12,
      shared-zero: $0$,
      x: (label: (anchor: "west", offset: .15)),
      y: (label: (anchor: "south", offset: .15)),
      tick: (
        stroke: figure-style.thickness,
        minor-stroke: figure-style.thickness,
      ),
    ))
    plot.plot(
      size: (5.3, 3.8),
      axis-style: "school-book",
      x-min: start - .8,
      x-max: start + 6.25,
      x-break: true,
      y-min: 0,
      y-max: .38,
      x-label: [百分比],
      y-label: [$"频率"/"组距"$],
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: range(7).map(i => start + i),
      y-ticks: levels.zip(labels),
      {
        plot.annotate(resize: false, {
          for (i, h) in heights.enumerate() {
            line((start + i, h), (start + i + 1, h))
            line(
              (start + i, 0),
              (
                start + i,
                calc.max(h, if i == 0 { 0 } else { heights.at(i - 1) }),
              ),
            )
          }
          line((start + 6, 0), (start + 6, heights.last()))
          for level in levels {
            let i = heights.position(h => h >= level)
            line((start - .8, level), (start + i, level), stroke: (
              dash: figure-style.dash,
            ))
          }
        })
      },
    )
    content((2.65, -.8), if second { [乙离子残留百分比直方图] } else {
      [甲离子残留百分比直方图]
    })
  })
}

#let folding-diagram(folded: false) = cetz.canvas(length: 17mm, {
  import cetz.draw: *
  set-style(stroke: (thickness: figure-style.thickness, join: "round"))
  if not folded {
    let a = (0, 1)
    let b = (0, 0)
    let c = (2, 0)
    let d = (-2, 1)
    let e = (-2, 0)
    let f = (1, -calc.sqrt(3))
    let g = (3, -calc.sqrt(3))
    line(d, a, c, g, f, b, e, d)
    line(a, b, c)
    for (p, label, anchor) in (
      (a, $A$, "south"),
      (b, $B$, "north-east"),
      (c, $C$, "south-west"),
      (d, $D$, "south"),
      (e, $E$, "east"),
      (f, $F$, "north"),
      (g, $G$, "north-west"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
    content((.5, -2.25), [图 1])
  } else {
    let b = (0, 0, 0)
    let c = (2, 0, 0)
    let e = (1, 0, calc.sqrt(3))
    let a = (0, 1, 0)
    let d = (1, 1, calc.sqrt(3))
    let g = (3, 0, calc.sqrt(3))
    oblique-project((1, 0), (-.35, .3), (0, 1), {
      line(a, b, c, g, d, a)
      line(b, e, g)
      line(e, d)
      line(a, c, stroke: (dash: figure-style.dash))
      for (p, label, anchor) in (
        (a, $A$, "east"),
        (b, $B$, "north"),
        (c, $C$, "north-west"),
        (d, $D$, "south-east"),
        (e, $E(F)$, "north-west"),
        (g, $G$, "west"),
      ) {
        content(p, label, anchor: anchor, padding: 3pt)
      }
    })
    content((1.3, -.55), [图 2])
  }
})

#let polar-diagram() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
    padding: 0,
    overshoot: .12,
    shared-zero: $O$,
    x: (label: (anchor: "west", offset: .18)),
    y: (stroke: none, mark: (start: none, end: none)),
    tick: (
      stroke: figure-style.thickness,
      minor-stroke: figure-style.thickness,
    ),
  ))
  plot.plot(
    size: (5, 2.5),
    axis-style: "school-book",
    x-min: -2.3,
    x-max: 2.7,
    y-min: 0,
    y-max: 2.5,
    x-label: $x$,
    y-label: none,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.annotate(resize: false, {
        arc((2, 0), start: 0deg, stop: 90deg, radius: 1)
        arc((1, 1), start: 0deg, stop: 180deg, radius: 1)
        arc((-1, 1), start: 90deg, stop: 180deg, radius: 1)
        for (p, label, anchor) in (
          ((2, 0), $A$, "north"),
          ((1, 1), $B$, "south-west"),
          ((-1, 1), $C$, "south-east"),
          ((-2, 0), $D$, "north"),
        ) {
          content(p, label, anchor: anchor, padding: 3pt)
        }
      })
    },
  )
})

#section[选择题：本题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [已知集合 $A={-1,0,1,2}$，$B={x|x^2<=1}$，则 $A inter B=$#choice-placeholder()。],
  choices: ([${-1,0,1}$], [${0,1}$], [${-1,1}$], [${0,1,2}$]),
  answers: ([A],),
  explanation: [$B=[-1,1]$，取 $A$ 中属于此区间的元素，得 $A inter B={-1,0,1}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若 $z(1+"i")=2"i"$，则 $z=$#choice-placeholder()。],
  choices: ([$-1-"i"$], [$-1+"i"$], [$1-"i"$], [$1+"i"$]),
  answers: ([D],),
  explanation: [$z=(2"i")/(1+"i")=(2"i"(1-"i"))/2=1+"i"$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [《西游记》《三国演义》《水浒传》和《红楼梦》是中国古典文学瑰宝，并称为中国古典小说四大名著。某中学为了解本校学生阅读四大名著的情况，随机调查了 100 位学生，其中阅读过《西游记》或《红楼梦》的学生共有 90 位，阅读过《红楼梦》的学生共有 80 位，阅读过《西游记》且阅读过《红楼梦》的学生共有 60 位，则该校阅读过《西游记》的学生人数与该校学生总数比值的估计值为#choice-placeholder()。],
  choices: ([$0.5$], [$0.6$], [$0.7$], [$0.8$]),
  answers: ([C],),
  explanation: [由容斥原理，样本中阅读过《西游记》的学生有 $90-80+60=70$ 位，所求比值的估计值为 $70/100=0.7$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$(1+2x^2)(1+x)^4$ 的展开式中 $x^3$ 的系数为#choice-placeholder()。],
  choices: ([$12$], [$16$], [$20$], [$24$]),
  answers: ([A],),
  explanation: [所求系数为 $C_4^3+2C_4^1=4+8=12$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知各项均为正数的等比数列 ${a_n}$ 的前 4 项和为 15，且 $a_5=3a_3+4a_1$，则 $a_3=$#choice-placeholder()。],
  choices: ([$16$], [$8$], [$4$], [$2$]),
  answers: ([C],),
  explanation: [设公比为 $q>0$，则 $q^4=3q^2+4$，即 $(q^2-4)(q^2+1)=0$，得 $q=2$。由 $a_1(1+2+4+8)=15$ 得 $a_1=1$，故 $a_3=4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知曲线 $y=a e^x+x ln x$ 在点 $(1,a e)$ 处的切线方程为 $y=2x+b$，则#choice-placeholder()。],
  choices: ([$a=e,b=-1$], [$a=e,b=1$], [$a=e^(-1),b=1$], [$a=e^(-1),b=-1$]),
  answers: ([D],),
  explanation: [由 $y'=a e^x+ln x+1$，得 $a e+1=2$，故 $a=e^(-1)$。切点为 $(1,1)$，代入切线方程得 $b=-1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $y=(2x^3)/(2^x+2^(-x))$ 在 $[-6,6]$ 的图象大致为#choice-placeholder()。],
  choices: (
    [#figure(graph-choice("A"))],
    [#figure(graph-choice("B"))],
    [#figure(graph-choice("C"))],
    [#figure(graph-choice("D"))],
  ),
  answers: ([B],),
  explanation: [分子为奇函数，分母为正的偶函数，所以函数为奇函数，排除 C。当 $x>0$ 时 $y>0$，排除 D。又 $f(4)=2048/257 approx 8$，排除 A，故选 B。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，点 $N$ 为正方形 $A B C D$ 的中心，$triangle E C D$ 为正三角形，平面 $E C D perp$ 平面 $A B C D$，$M$ 是线段 $E D$ 的中点，则#choice-placeholder()。
    #figure(square-diagram())],
  choices: (
    [$B M=E N$，且直线 $B M,E N$ 是相交直线],
    [$B M!=E N$，且直线 $B M,E N$ 是相交直线],
    [$B M=E N$，且直线 $B M,E N$ 是异面直线],
    [$B M!=E N$，且直线 $B M,E N$ 是异面直线],
  ),
  answers: ([B],),
  explanation: [在 $triangle E B D$ 中，$M,N$ 分别为 $E D,B D$ 的中点，因此 $B M,E N$ 是两条中线，必相交。
    设正方形边长为 2，以 $D$ 为原点、$D A,D C$ 及垂直于底面的方向为坐标轴正方向，可取 $B(2,2,0)$、$E(0,1,sqrt(3))$、$M(0,1/2,sqrt(3)/2)$、$N(1,1,0)$。于是 $B M=sqrt(4+9/4+3/4)=sqrt(7)$，$E N=sqrt(1+3)=2$，两线段不等长。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图的程序框图，如果输入的 $epsilon$ 为 0.01，则输出 $s$ 的值等于#choice-placeholder()。
    #figure(flowchart())],
  choices: ([$2-1/2^4$], [$2-1/2^5$], [$2-1/2^6$], [$2-1/2^7$]),
  answers: ([C],),
  explanation: [第 $n$ 次循环后 $x=2^(-n)$，首次满足 $x<0.01$ 时 $n=7$。此时已累加 $1,1/2,dots,1/2^6$，故 $s=(1-2^(-7))/(1-1/2)=2-1/2^6$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [双曲线 $C:x^2/4-y^2/2=1$ 的右焦点为 $F$，点 $P$ 在 $C$ 的一条渐近线上，$O$ 为坐标原点。若 $|P O|=|P F|$，则 $triangle P F O$ 的面积为#choice-placeholder()。],
  choices: ([$(3sqrt(2))/4$], [$(3sqrt(2))/2$], [$2sqrt(2)$], [$3sqrt(2)$]),
  answers: ([A],),
  explanation: [$F(sqrt(6),0)$，由 $|P O|=|P F|$ 得 $x_P=sqrt(6)/2$。渐近线为 $y=plus.minus x/sqrt(2)$，故 $|y_P|=sqrt(3)/2$。因此 $S=1/2 times sqrt(6) times sqrt(3)/2=(3sqrt(2))/4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $f(x)$ 是定义域为 $RR$ 的偶函数，且在 $(0,+infinity)$ 单调递减，则#choice-placeholder()。],
  choices: (
    [$f(log_3 (1/4))>f(2^(-3/2))>f(2^(-2/3))$],
    [$f(log_3 (1/4))>f(2^(-2/3))>f(2^(-3/2))$],
    [$f(2^(-3/2))>f(2^(-2/3))>f(log_3 (1/4))$],
    [$f(2^(-2/3))>f(2^(-3/2))>f(log_3 (1/4))$],
  ),
  answers: ([C],),
  explanation: [由偶性，$f(log_3 (1/4))=f(log_3 4)$。∵ $0<2^(-3/2)<2^(-2/3)<1<log_3 4$，结合正半轴上的单调递减性即得 C。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设函数 $f(x)=sin(omega x+pi/5)$（$omega>0$），已知 $f(x)$ 在 $[0,2pi]$ 有且仅有 5 个零点。下述四个结论：
    #linebreak()① $f(x)$ 在 $(0,2pi)$ 有且仅有 3 个极大值点；
    #linebreak()② $f(x)$ 在 $(0,2pi)$ 有且仅有 2 个极小值点；
    #linebreak()③ $f(x)$ 在 $(0,pi/10)$ 单调递增；
    #linebreak()④ $omega$ 的取值范围是 $[12/5,29/10)$。
    #linebreak()其中所有正确结论的编号是#choice-placeholder()。],
  choices: ([①④], [②③], [①②③], [①③④]),
  answers: ([D],),
  explanation: [#step[确定频率范围][五个零点对应相位 $pi,2pi,dots,5pi$，因此 $5pi<=2pi omega+pi/5<6pi$，得 $12/5<=omega<29/10$，④正确。]
    #step[逐项判断][极大值对应相位 $pi/2,5pi/2,9pi/2$，均在开区间内，①正确。极小值相位 $3pi/2,7pi/2$ 必出现，但当 $omega>53/20$ 时还出现 $11pi/2$，②不一定成立。
      当 $0<x<pi/10$ 时，$pi/5<omega x+pi/5<49pi/100<pi/2$，故函数单调递增，③正确。]],
)

#section[填空题：本题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知 $bold(a),bold(b)$ 为单位向量，且 $bold(a) dot bold(b)=0$。若 $bold(c)=2bold(a)-sqrt(5)bold(b)$，则 $cos chevron.l bold(a),bold(c) chevron.r=$#fill-placeholder()。],
  answers: ([$2/3$],),
  explanation: [$bold(a) dot bold(c)=2$，$|bold(c)|=sqrt(4+5)=3$，故所求余弦为 $2/(1 times 3)=2/3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [记 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和，若 $a_1!=0$，$a_2=3a_1$，则 $S_10/S_5=$#fill-placeholder()。],
  answers: ([$4$],),
  explanation: [公差 $d=a_2-a_1=2a_1$，故 $S_n=n a_1+n(n-1)/2 times 2a_1=n^2 a_1$。因此 $S_10/S_5=100/25=4$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $F_1,F_2$ 为椭圆 $C:x^2/36+y^2/20=1$ 的两个焦点，$M$ 为 $C$ 上一点且在第一象限。若 $triangle M F_1 F_2$ 为等腰三角形，则 $M$ 的坐标为#fill-placeholder()。],
  answers: ([$(3,sqrt(15))$],),
  explanation: [设左、右焦点分别为 $F_1(-4,0)$、$F_2(4,0)$。由 $M$ 在第一象限，$M F_1>M F_2$，且 $M F_1+M F_2=12$，故等腰条件只能为 $M F_1=F_1 F_2=8$，$M F_2=4$。
    设 $M(x,y)$，两距离平方相减得 $16x=64-16=48$，故 $x=3$；代入椭圆并取 $y>0$，得 $y=sqrt(15)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [学生到工厂劳动实践，利用 3D 打印技术制作模型。如图，该模型为长方体 $A B C D-A_1 B_1 C_1 D_1$ 挖去四棱锥 $O-E F G H$ 后所得的几何体，其中 $O$ 为长方体的中心，$E,F,G,H$ 分别为所在棱的中点，$A B=B C=6"cm"$，$A A_1=4"cm"$。3D 打印所用原料密度为 $0.9"g"/"cm"^3$，不考虑打印损耗，制作该模型所需原料的质量为#fill-placeholder()g。
    #figure(cutout-diagram())],
  answers: ([$118.8$],),
  explanation: [四边形 $E F G H$ 的面积为所在矩形面积的一半，即 $S=1/2 times 6 times 4=12$。$O$ 到该面的距离为 $6/2=3$，故挖去部分的体积为 $1/3 times 12 times 3=12$。
    模型的体积为 $6 times 6 times 4-12=132$，所需原料质量为 $132 times 0.9=118.8"g"$。],
)

#section[解答题：共 70 分。第 17～21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [为了解甲、乙两种离子在小鼠体内的残留程度，进行如下试验：将 200 只小鼠随机分成 $A,B$ 两组，每组 100 只，其中 $A$ 组小鼠给服甲离子溶液，$B$ 组小鼠给服乙离子溶液。每只小鼠给服的溶液体积相同、摩尔浓度相同。经过一段时间后用某种科学方法测算出残留在小鼠体内离子的百分比。根据试验数据分别得到如下直方图：
    #figure(grid(
      columns: 2,
      gutter: 8mm,
      histogram(), histogram(second: true),
    ))
    记 $C$ 为事件：“乙离子残留在体内的百分比不低于 5.5”，根据直方图得到 $P(C)$ 的估计值为 0.70。],
  parts: (
    subquestion(
      stem: [求乙离子残留百分比直方图中 $a,b$ 的值。],
      answers: ([$a=0.35$，$b=0.10$。],),
      explanation: [各组组距均为 1，故 $a+0.20+0.15=0.70$，得 $a=0.35$。由其余三组的频率和为 $0.30$，得 $0.05+b+0.15=0.30$，所以 $b=0.10$。],
    ),
    subquestion(
      stem: [分别估计甲、乙离子残留百分比的平均值（同一组中的数据用该组区间的中点值为代表）。],
      answers: ([$4.05$，$6$。],),
      explanation: [以各组中点为代表值，按频率加权，甲离子残留百分比的平均值估计为
        $
          2 times 0.15+3 times 0.20+4 times 0.30+5 times 0.20+6 times 0.10+7 times 0.05=4.05.
        $
        乙离子残留百分比的平均值估计为
        $
          3 times 0.05+4 times 0.10+5 times 0.15+6 times 0.35+7 times 0.20+8 times 0.15=6.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [$triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$。已知 $a sin((A+C)/2)=b sin A$。],
  parts: (
    subquestion(
      stem: [求 $B$。],
      answers: ([$pi/3$。],),
      explanation: [由正弦定理及 $sin A>0$，得 $sin((A+C)/2)=sin B$，即 $cos(B/2)=2sin(B/2)cos(B/2)$。∵ $cos(B/2)>0$，∴ $sin(B/2)=1/2$，故 $B=pi/3$。],
    ),
    subquestion(
      stem: [若 $triangle A B C$ 为锐角三角形，且 $c=1$，求 $triangle A B C$ 面积的取值范围。],
      answers: ([$(sqrt(3)/8,sqrt(3)/2)$。],),
      explanation: [由余弦定理得 $b^2=a^2+1-a$。锐角条件 $cos A>0$、$cos C>0$ 分别等价于 $b^2+1-a^2=2-a>0$、$a^2+b^2-1=2a^2-a>0$，故 $1/2<a<2$。
        反之，每个这样的 $a$ 与 $c=1$、夹角 $B=pi/3$ 确定的三角形均为锐角三角形。因此 $S=1/2 a c sin B=sqrt(3)/4 a$ 的取值范围为 $(sqrt(3)/8,sqrt(3)/2)$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [图 1 是由矩形 $A D E B$、$"Rt" triangle A B C$ 和菱形 $B F G C$ 组成的一个平面图形，其中 $A B=1$，$B E=B F=2$，$angle F B C=60 degree$。将其沿 $A B,B C$ 折起使得 $B E$ 与 $B F$ 重合，连接 $D G$，如图 2。
    #figure(grid(
      columns: 2,
      gutter: 12mm,
      folding-diagram(), folding-diagram(folded: true),
    ))],
  parts: (
    subquestion(
      stem: [证明：图 2 中的 $A,C,G,D$ 四点共面，且平面 $A B C perp$ 平面 $B C G E$。],
      answers: ([证明见解析。],),
      explanation: [折叠后仍有 $A D parallel B E$、$B F parallel C G$。因 $B E$ 与 $B F$ 重合，故 $A D parallel C G$，两条平行直线确定一个平面，所以 $A,C,G,D$ 共面。
        又 $A B perp B E$、$A B perp B C$，且 $B E inter B C=B$，故 $A B perp$ 平面 $B C G E$。由 $A B subset$ 平面 $A B C$，得两平面垂直。],
    ),
    subquestion(
      stem: [求图 2 中的二面角 $B-C G-A$ 的大小。],
      answers: ([$30 degree$。],),
      explanation: [过 $B$ 作 $B H perp C G$，垂足 $H$ 在 $G C$ 的延长线上。由 $A B perp$ 平面 $B C G E$，知 $A B perp C G$，结合 $B H perp C G$ 得 $C G perp$ 平面 $A B H$，从而 $A H perp C G$。
        因此 $angle B H A$ 为所求二面角的平面角。菱形中 $B C=2$，且 $angle B C H=60 degree$，故 $B H=B C sin 60 degree=sqrt(3)$。
        在直角三角形 $A B H$ 中，$tan angle B H A=(A B)/(B H)=1/sqrt(3)$，所以二面角大小为 $30 degree$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=2x^3-a x^2+b$。],
  parts: (
    subquestion(
      stem: [讨论 $f(x)$ 的单调性。],
      answers: ([分类结果见解析。],),
      explanation: [由 $f'(x)=2x(3x-a)$，得：
        #step[$a<0$][在 $(-infinity,a/3)$、$(0,+infinity)$ 上单调递增，在 $(a/3,0)$ 上单调递减。]
        #step[$a=0$][此时 $f(x)=2x^3+b$，在 $RR$ 上单调递增。]
        #step[$a>0$][在 $(-infinity,0)$、$(a/3,+infinity)$ 上单调递增，在 $(0,a/3)$ 上单调递减。]],
    ),
    subquestion(
      stem: [是否存在 $a,b$，使得 $f(x)$ 在区间 $[0,1]$ 的最小值为 $-1$ 且最大值为 1？若存在，求出 $a,b$ 的所有值；若不存在，说明理由。],
      answers: ([存在，$(a,b)=(0,-1)$ 或 $(4,1)$。],),
      explanation: [#step[极值点不在区间内部的情况][
          当 $a<=0$ 时，$f$ 在 $[0,1]$ 上递增，故 $f(0)=b=-1$、$f(1)=2-a+b=1$，得 $(a,b)=(0,-1)$。
          当 $a>=3$ 时，$f$ 在 $[0,1]$ 上递减，故 $f(0)=b=1$、$f(1)=2-a+b=-1$，得 $(a,b)=(4,1)$。]
        #step[排除 $0<a<3$][
          此时最小值为 $f(a/3)=b-a^3/27$，最大值为两个端点值中较大者。所需的“最大值减最小值”必须为 2。
          若 $0<a<=2$，这一差值为 $2-a+a^3/27=2-a(1-a^2/27)<2$；若 $2<a<3$，差值为 $a^3/27<1$。均不满足要求。
          因此只有上述两组参数，代入可知均符合要求。]],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知曲线 $C:y=x^2/2$，$D$ 为直线 $y=-1/2$ 上的动点，过 $D$ 作 $C$ 的两条切线，切点分别为 $A,B$。],
  parts: (
    subquestion(
      stem: [证明：直线 $A B$ 过定点。],
      answers: ([过定点 $(0,1/2)$。],),
      explanation: [设 $D(t,-1/2)$，切点的横坐标为 $u$。由导数知切线为 $y=u x-u^2/2$，代入 $D$ 得 $u^2-2t u-1=0$。
        所以两个切点都满足 $y=u^2/2=t u+1/2$，从而直线 $A B$ 的方程为 $y=t x+1/2$，恒过定点 $(0,1/2)$。],
    ),
    subquestion(
      stem: [若以 $E(0,5/2)$ 为圆心的圆与直线 $A B$ 相切，且切点为线段 $A B$ 的中点，求四边形 $A D B E$ 的面积。],
      answers: ([$3$ 或 $4sqrt(2)$。],),
      explanation: [#step[利用中点处相切确定 $D$][
          设 $A,B$ 的横坐标为 $u,v$，由第（1）问知 $u+v=2t$、$u v=-1$，故中点为 $M(t,t^2+1/2)$。
          直线 $A B$ 的方向向量为 $(1,t)$。由 $E M perp A B$，得 $(t,t^2-2) dot (1,t)=t(t^2-1)=0$，所以 $t=0$ 或 $t=plus.minus 1$。]
        #step[计算两三角形面积之和][
          弦长 $|A B|=sqrt(1+t^2)|u-v|=2(1+t^2)$。$D,E$ 位于直线 $A B$ 两侧，到该直线的距离分别为 $sqrt(1+t^2)$、$2/sqrt(1+t^2)$。
          故四边形面积为
          $
            S=1/2 times 2(1+t^2)(sqrt(1+t^2)+2/sqrt(1+t^2))=(t^2+3)sqrt(1+t^2).
          $
          当 $t=0$ 时 $S=3$；当 $t=plus.minus 1$ 时 $S=4sqrt(2)$。]],
    ),
  ),
)

请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。如图，在极坐标系 $O x$ 中，$A(2,0)$，$B(sqrt(2),pi/4)$，$C(sqrt(2),3pi/4)$，$D(2,pi)$，弧 $A B,B C,C D$ 所在圆的圆心分别是 $(1,0)$，$(1,pi/2)$，$(1,pi)$。曲线 $M_1$ 是弧 $A B$，曲线 $M_2$ 是弧 $B C$，曲线 $M_3$ 是弧 $C D$。
    #figure(polar-diagram())],
  parts: (
    subquestion(
      stem: [分别写出 $M_1,M_2,M_3$ 的极坐标方程。],
      answers: (
        [$M_1:rho=2cos theta$，$0<=theta<=pi/4$；$M_2:rho=2sin theta$，$pi/4<=theta<=3pi/4$；$M_3:rho=-2cos theta$，$3pi/4<=theta<=pi$。],
      ),
      explanation: [三个圆的直角坐标圆心依次为 $(1,0),(0,1),(-1,0)$，半径均为 1，方程分别为 $x^2+y^2=2x$、$x^2+y^2=2y$、$x^2+y^2=-2x$。
        代入 $x=rho cos theta$、$y=rho sin theta$，结合图中三段弧的角度范围，即得
        $ M_1:rho=2cos theta quad (0<=theta<=pi/4), $
        $ M_2:rho=2sin theta quad (pi/4<=theta<=3pi/4), $
        $ M_3:rho=-2cos theta quad (3pi/4<=theta<=pi). $],
    ),
    subquestion(
      stem: [曲线 $M$ 由 $M_1,M_2,M_3$ 构成，若点 $P$ 在 $M$ 上，且 $|O P|=sqrt(3)$，求 $P$ 的极坐标。],
      answers: (
        [$(sqrt(3),pi/6)$，$(sqrt(3),pi/3)$，$(sqrt(3),2pi/3)$，$(sqrt(3),5pi/6)$。],
      ),
      explanation: [将 $rho=sqrt(3)$ 依次代入三段弧的方程，在各自角度范围内，得到 $theta=pi/6$；$theta=pi/3,2pi/3$；$theta=5pi/6$。故共有上述四个点。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。设 $x,y,z in RR$，且 $x+y+z=1$。],
  parts: (
    subquestion(
      stem: [求 $(x-1)^2+(y+1)^2+(z+1)^2$ 的最小值。],
      answers: ([$4/3$。],),
      explanation: [由柯西不等式，
        $ (x-1)^2+(y+1)^2+(z+1)^2>=((x-1+y+1+z+1)^2)/3=4/3. $
        当 $x-1=y+1=z+1=2/3$，即 $(x,y,z)=(5/3,-1/3,-1/3)$ 时等号成立，故最小值为 $4/3$。],
    ),
    subquestion(
      stem: [若 $(x-2)^2+(y-1)^2+(z-a)^2>=1/3$ 恒成立，证明：$a<=-3$ 或 $a>=-1$。],
      answers: ([证明见解析。],),
      explanation: [取 $x=2-(a+2)/3$、$y=1-(a+2)/3$、$z=a-(a+2)/3$，满足 $x+y+z=1$。将其代入已知不等式，得
        $ 3((a+2)/3)^2>=1/3, quad (a+2)^2>=1. $
        故 $a+2<=-1$ 或 $a+2>=1$，即 $a<=-3$ 或 $a>=-1$。],
    ),
  ),
)
