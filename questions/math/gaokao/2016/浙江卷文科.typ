#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2016,
  type: "普通高等学校招生全国统一考试",
  name: "浙江卷文科",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2016/2016浙江文.pdf",
  regions: ("浙江",),
)
#let point-sequences() = {
  set text(size: 9pt)
  cetz.canvas(length: 11mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    let xs = (0.8, 1.55, 2.3, 4.2, 4.95)
    let a(x) = (x, 0.45 * x + 0.7)
    let b(x) = (1.15 * x + 0.05, 0)
    for i in (0, 1, 3) {
      line(
        a(xs.at(i)),
        b(xs.at(i)),
        b(xs.at(i + 1)),
        close: true,
        fill: luma(90%),
        stroke: none,
      )
    }
    line((0.1, 0), (6.1, 0))
    line(a(0.1), a(5.6))
    for (i, x) in xs.enumerate() {
      line(a(x), b(x))
      if i in (0, 1, 3) { line(a(x), b(xs.at(i + 1))) }
      let suffix = ([$1$], [$2$], [$3$], [$n$], [$n+1$]).at(i)
      content(a(x), $A_#suffix$, anchor: "south-east", padding: 0.08)
      content(b(x), $B_#suffix$, anchor: "north", padding: 0.08)
    }
    for (x, label) in ((1.26, $S_1$), (2.09, $S_2$), (5.05, $S_n$)) {
      content((x, 0.28), label)
    }
    content((3.2, -0.17), $dots$)
    content(a(3.2), $dots$, anchor: "south", padding: 0.1)
  })
}

#let three-views() = {
  set text(size: 9pt)
  cetz.canvas(length: 7mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    line((0, 0), (4, 0), (4, 4), (2, 4), (2, 2), (0, 2), close: true)
    line((2, 2), (4, 2))
    line((6, 0), (10, 0), (10, 2), (8, 2), (8, 4), (6, 4), close: true)
    line((6, 2), (8, 2))
    line((0, -6), (4, -6), (4, -2), (0, -2), close: true)
    line((2, -2), (2, -4), (4, -4))
    for (x, label) in ((2, [正视图]), (8, [侧视图])) {
      content((x, -0.5), label, anchor: "north")
    }
    content((2, -6.5), [俯视图], anchor: "north")
    for x in (0, 2, 6, 8) {
      line((x, 4.4), (x + 2, 4.4), mark: (start: ">", end: ">"))
      content((x + 1, 4.5), $2$, anchor: "south")
    }
    for x in (0, 2, 4, 6, 8, 10) { line((x, 4.15), (x, 4.65)) }
    for y in (0, 2) {
      line((4.55, y), (4.55, y + 2), mark: (start: ">", end: ">"))
      content((4.75, y + 1), $2$, anchor: "west")
    }
    for y in (0, 2, 4) { line((4.2, y), (4.8, y)) }
  })
}

#let frustum(auxiliary: false) = {
  set text(size: 9pt)
  cetz.canvas(length: 17mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    oblique-project((-1, 0), (-0.45, -0.6), (-0.12, 1.4), {
      let a = (3, 0, 0)
      let b = (0, 2, 0)
      let c = (0, 0, 0)
      let d = (1.5, 0.5, calc.sqrt(3) / 2)
      let e = (0, 1.5, calc.sqrt(3) / 2)
      let f = (0, 0.5, calc.sqrt(3) / 2)
      line(a, b, c, f, d, a)
      line(d, e, f)
      line(b, e)
      line(b, f)
      line(b, d)
      line(a, c, stroke: (dash: figure-style.dash))
      for (pt, label, anchor) in (
        (a, $A$, "east"),
        (b, $B$, "north"),
        (c, $C$, "west"),
        (d, $D$, "south-east"),
        (e, $E$, if auxiliary { "west" } else { "east" }),
        (f, $F$, "west"),
      ) {
        content(pt, label, anchor: anchor, padding: 0.1)
      }
      if auxiliary {
        let k = (0, 1, calc.sqrt(3))
        line(d, k, f)
        line(e, k)
        content(k, $K$, anchor: "south", padding: 0.1)
      }
    })
  })
}


#let graph-option(kind) = {
  set text(size: 8pt)
  cetz.canvas(length: 7mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $O$,
      tick: (stroke: figure-style.thickness, length: 0),
    ))
    plot.plot(
      size: (4.5, 2.8),
      x-min: -2.1,
      x-max: 2.4,
      y-min: -1.2,
      y-max: 1.6,
      axis-style: "school-book",
      x-tick-step: none,
      y-tick-step: none,
      x-ticks: ((-calc.pi / 2, $-pi/2$), (calc.pi / 2, $pi/2$)),
      y-ticks: ((1, $1$),),
      {
        plot.annotate(resize: false, {
          line(
            ..range(161).map(i => {
              let x = -2 + i / 40
              let y = if kind == 0 { calc.sin(x * 1rad) } else if kind == 1 {
                calc.abs(calc.sin(x * 1rad))
              } else if kind == 2 {
                (if x < 0 { -1 } else { 1 }) * calc.sin(x * x * 1rad)
              } else { calc.sin(x * x * 1rad) }
              (x, y)
            }),
          )
        })
      },
    )
  })
}
#let folded-quadrilateral() = {
  set text(size: 9pt)
  cetz.canvas(length: 17mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    oblique-project((1, 0), (0.4, 0.65), (1.1, 0.55), {
      let c = (0, 0, 0)
      let a = (calc.sqrt(6), 0, 0)
      let b = (calc.sqrt(6) / 2, -calc.sqrt(30) / 2, 0)
      let r = calc.sqrt(30) / 6
      let d = (1 / calc.sqrt(6), r, 0)
      let p = (1 / calc.sqrt(6), r * calc.cos(70deg), r * calc.sin(70deg))
      line(c, b, a, c, p, a)
      line(c, d, a, stroke: (dash: figure-style.dash))
      for (pt, label, anchor) in (
        (c, $C$, "east"),
        (a, $A$, "west"),
        (b, $B$, "north"),
        (d, $D$, "south-east"),
        (p, $D'$, "south"),
      ) {
        content(pt, label, anchor: anchor, padding: 0.1)
      }
    })
  })
}
#let parabola-diagram() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness, axes: (
      stroke: figure-style.thickness,
      shared-zero: $O$,
      tick: (stroke: figure-style.thickness, length: 0),
    ))
    plot.plot(
      size: (5.5, 7.2),
      x-min: -0.5,
      x-max: 5,
      y-min: -3.3,
      y-max: 3.9,
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "school-book",
      {
        plot.annotate(resize: false, {
          let t = 1.6
          let a = (t * t, 2 * t)
          let b = (1 / (t * t), -2 / t)
          let n = ((t * t + 3) / (t * t - 1), -2 / t)
          let m = (2 * t * t / (t * t - 1), 0)
          line(
            ..range(139).map(i => {
              let y = -3 + i / 20
              (y * y / 4, y)
            }),
          )
          line(a, b, n, a)
          line((1, 0), n)
          for (pt, label, anchor) in (
            (a, $A$, "south-east"),
            ((b.at(0) + 0.35, b.at(1) - 0.1), $B$, "north-west"),
            (n, $N$, "west"),
            (m, $M$, "south-west"),
            ((1, 0), $F$, "south-east"),
          ) {
            content(pt, label, anchor: anchor, padding: 0.1)
          }
        })
      },
    )
  })
}
#section[选择题：共 8 小题，每小题 5 分，共 40 分。每小题给出的四个选项中，只有一项符合题目要求。]
#question(
  "single-choice",
  score: 5,
  stem: [已知全集 $U={1,2,3,4,5,6}$，集合 $P={1,3,5}$，$Q={1,2,4}$，则 $(complement_U P) union Q=$#choice-placeholder()。],
  choices: ([${1}$], [${3,5}$], [${1,2,4,6}$], [${1,2,3,4,5}$]),
  answers: ([C],),
  explanation: [$complement_U P={2,4,6}$，故 $(complement_U P) union Q={1,2,4,6}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知互相垂直的平面 $alpha,beta$ 交于直线 $l$。若直线 $m,n$ 满足 $m parallel alpha$，$n perp beta$，则#choice-placeholder()。],
  choices: ([$m parallel l$], [$m parallel n$], [$n perp l$], [$m perp n$]),
  answers: ([C],),
  explanation: [因 $l subset beta$，$n perp beta$，故 $n perp l$，选 C。$m parallel alpha$ 不能确定 $m$ 与 $l,n$ 的方向关系，其余结论均不一定成立。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $y=sin x^2$ 的图象是#choice-placeholder()。],
  choices: (
    [#figure(graph-option(0))],
    [#figure(graph-option(1))],
    [#figure(graph-option(2))],
    [#figure(graph-option(3))],
  ),
  answers: ([D],),
  explanation: [函数为偶函数，排除 A、C。又 $f'(x)=2x cos x^2$，故 $f'(0)=0$，图象在原点处光滑；当 $x=sqrt(pi/2)$ 时首次达到最大值 $1$，且 $sqrt(pi/2)<pi/2$，故选 D。],
)
#question(
  "single-choice",
  score: 5,
  stem: [若平面区域 $cases(x+y-3>=0, 2x-y-3<=0, x-2y+3>=0)$ 夹在两条斜率为 $1$ 的平行直线之间，则这两条平行直线间的距离的最小值是#choice-placeholder()。],
  choices: ([$3sqrt(5)/5$], [$sqrt(2)$], [$3sqrt(2)/2$], [$sqrt(5)$]),
  answers: ([B],),
  explanation: [可行域是顶点为 $(1,2),(2,1),(3,3)$ 的三角形。令 $k=y-x$，则 $-1<=k<=1$，故两条边界直线为 $y-x=1$ 与 $y-x=-1$，其距离为 $2/sqrt(2)=sqrt(2)$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知 $a,b>0$，且 $a!=1,b!=1$，若 $log_a b>1$，则#choice-placeholder()。],
  choices: (
    [$(a-1)(b-1)<0$],
    [$(a-1)(a-b)>0$],
    [$(b-1)(b-a)<0$],
    [$(b-1)(b-a)>0$],
  ),
  answers: ([D],),
  explanation: [当 $a>1$ 时，$b>a>1$；当 $0<a<1$ 时，$0<b<a<1$。两种情形均有 $(b-1)(b-a)>0$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=x^2+b x$，则“$b<0$”是“$f(f(x))$ 的最小值与 $f(x)$ 的最小值相等”的#choice-placeholder()。],
  choices: (
    [充分不必要条件],
    [必要不充分条件],
    [充分必要条件],
    [既不充分也不必要条件],
  ),
  answers: ([A],),
  explanation: [$f(x)=(x+b/2)^2-b^2/4$ 的值域为 $[-b^2/4,+infinity)$。复合函数能取到同一最小值，当且仅当 $-b/2>=-b^2/4$，即 $b<=0$ 或 $b>=2$。所以 $b<0$ 是充分不必要条件。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)$ 满足：$f(x)>=abs(x)$ 且 $f(x)>=2^x$，$x in RR$。下列结论正确的是#choice-placeholder()。],
  choices: (
    [若 $f(a)<=abs(b)$，则 $a<=b$],
    [若 $f(a)<=2^b$，则 $a<=b$],
    [若 $f(a)>=abs(b)$，则 $a>=b$],
    [若 $f(a)>=2^b$，则 $a>=b$],
  ),
  answers: ([B],),
  explanation: [若 $f(a)<=2^b$，则 $2^a<=f(a)<=2^b$，由指数函数的严格递增性，得 $a<=b$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [如图，点列 ${A_n}$，${B_n}$ 分别在某锐角的两边上，且 $abs(A_n A_(n+1))=abs(A_(n+1) A_(n+2))$，$A_n!=A_(n+2)$，$n in NN^*$，$abs(B_n B_(n+1))=abs(B_(n+1) B_(n+2))$，$B_n!=B_(n+2)$，$n in NN^*$（$P!=Q$ 表示点 $P$ 与 $Q$ 不重合）。若 $d_n=abs(A_n B_n)$，$S_n$ 为 $triangle A_n B_n B_(n+1)$ 的面积，则#choice-placeholder()。
    #figure(point-sequences())],
  choices: (
    [${S_n}$ 是等差数列],
    [${S_n^2}$ 是等差数列],
    [${d_n}$ 是等差数列],
    [${d_n^2}$ 是等差数列],
  ),
  answers: ([A],),
  explanation: [相邻距离相等且不折返，点列沿各自射线等距递进。设 $abs(A_n A_(n+1))=p>0$，$abs(B_n B_(n+1))=q>0$，两射线夹角为 $theta$。若 $A_n$ 到另一边所在直线的距离为 $h_n$，则
    $ h_(n+1)-h_n=p sin theta, quad S_n=1/2 q h_n. $
    故 $S_(n+1)-S_n=1/2 p q sin theta$ 为常数，${S_n}$ 为等差数列。],
)
#section[填空题：共 7 小题，多空题每题 6 分，单空题每题 4 分，共 36 分。]
#question(
  "fill-in",
  score: 6,
  stem: [某几何体的三视图如图所示（单位：cm），则该几何体的表面积是#fill-placeholder()$"cm"^2$，体积是#fill-placeholder()$"cm"^3$。
    #figure(three-views())],
  answers: ([$80$], [$40$]),
  explanation: [该几何体由底层四个、上层一个棱长为 $2$ cm 的正方体组成，共有五处完整面相接。故
    $ S=(5 times 6-2 times 5)times 2^2=80 ("cm"^2), $
    $ V=5 times 2^3=40 ("cm"^3). $],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知 $a in RR$，方程 $a^2 x^2+(a+2)y^2+4x+8y+5a=0$ 表示圆，则圆心坐标是#fill-placeholder()，半径是#fill-placeholder()。],
  answers: ([$(-2,-4)$], [$5$]),
  explanation: [由 $a^2=a+2>0$，得 $a=-1$ 或 $a=2$。当 $a=2$ 时，配方得 $(x+1/2)^2+(y+1)^2=-5/4$，不表示圆；当 $a=-1$ 时，方程为 $(x+2)^2+(y+4)^2=25$，故圆心为 $(-2,-4)$，半径为 $5$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [已知 $2cos^2 x+sin 2x=A sin(omega x+phi)+b$（$A>0$），则 $A=$#fill-placeholder()，$b=$#fill-placeholder()。],
  answers: ([$sqrt(2)$], [$1$]),
  explanation: [由 $2cos^2 x+sin 2x=1+cos 2x+sin 2x=sqrt(2)sin(2x+pi/4)+1$，得 $A=sqrt(2),b=1$。],
)
#question(
  "fill-in",
  score: 6,
  stem: [设函数 $f(x)=x^3+3x^2+1$，已知 $a!=0$，且 $f(x)-f(a)=(x-b)(x-a)^2$，$x in RR$，则实数 $a=$#fill-placeholder()，$b=$#fill-placeholder()。],
  answers: ([$-2$], [$1$]),
  explanation: [两边对 $x$ 求导，并令 $x=a$，得 $f'(a)=3a(a+2)=0$。由 $a!=0$，得 $a=-2$。此时 $f(x)-f(-2)=x^3+3x^2-4=(x-1)(x+2)^2$，故 $b=1$。],
)
#question(
  "fill-in",
  score: 4,
  stem: [设双曲线 $x^2-y^2/3=1$ 的左、右焦点分别为 $F_1,F_2$，若点 $P$ 在双曲线上，且 $triangle F_1 P F_2$ 为锐角三角形，则 $abs(P F_1)+abs(P F_2)$ 的取值范围是#fill-placeholder()。],
  answers: ([$(2sqrt(7),8)$],),
  explanation: [设两焦半径中较长者为 $u$，较短者为 $v$，其和为 $t$。由双曲线定义，$u-v=2$，且 $F_1 F_2=4$。三角形为锐角三角形当且仅当
    $ u^2<v^2+16, quad 16<u^2+v^2. $
    代入 $u=(t+2)/2,v=(t-2)/2$，得 $2t<16$ 且 $(t^2+4)/2>16$，所以 $2sqrt(7)<t<8$。反之，此范围内的三边 $(t+2)/2,(t-2)/2,4$ 满足三角形不等式与上述锐角条件，可构造双曲线上的点，故整个区间均可取到。],
)
#question(
  "fill-in",
  score: 4,
  stem: [如图，已知平面四边形 $A B C D$，$A B=B C=3$，$C D=1$，$A D=sqrt(5)$，$angle A D C=90 degree$。沿直线 $A C$ 将 $triangle A C D$ 翻折成 $triangle A C D'$，直线 $A C$ 与 $B D'$ 所成角的余弦的最大值是#fill-placeholder()。
    #figure(folded-quadrilateral())],
  answers: ([$sqrt(6)/6$],),
  explanation: [由 $A C=sqrt(6)$ 及余弦定理，得
    $ arrow(C A) dot arrow(C B)=3, quad arrow(C A) dot arrow(C D')=1. $
    因此 $abs(arrow(C A) dot arrow(B D'))=2$。又 $B D'>=B C-C D'=2$，设所成角为 $theta$，则
    $ cos theta=2/(sqrt(6) dot B D')<=1/sqrt(6)=sqrt(6)/6. $
    取线段 $C B$ 上的点 $E$，使 $C E=1$。由 $cos angle A C B=1/sqrt(6)$，得 $A E^2=6+1-2=5$。故 $E$ 与 $D$ 到 $A,C$ 的距离分别相同，绕 $A C$ 翻折可使 $D'$ 落在 $E$，此时 $B D'=2$，等号成立。],
)
#question(
  "fill-in",
  score: 4,
  stem: [已知平面向量 $bold(a),bold(b)$，$abs(bold(a))=1$，$abs(bold(b))=2$，$bold(a) dot bold(b)=1$。若 $bold(e)$ 为平面单位向量，则 $abs(bold(a) dot bold(e))+abs(bold(b) dot bold(e))$ 的最大值是#fill-placeholder()。],
  answers: ([$sqrt(7)$],),
  explanation: [利用实数恒等式 $abs(u)+abs(v)=max{abs(u+v),abs(u-v)}$，得
    $
      abs(bold(a) dot bold(e))+abs(bold(b) dot bold(e))<=max{abs(bold(a)+bold(b)),abs(bold(a)-bold(b))}=sqrt(7).
    $
    当 $bold(e)=(bold(a)+bold(b))/sqrt(7)$ 时，两个数量积均为正，且其和为 $sqrt(7)$，故最大值为 $sqrt(7)$。],
)
#section[解答题：共 5 小题，共 74 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [在 $triangle A B C$ 中，内角 $A,B,C$ 所对的边分别为 $a,b,c$。已知 $b+c=2a cos B$。],
  parts: (
    subquestion(
      stem: [证明：$A=2B$；],
      answers: ([证明见解析。],),
      explanation: [由正弦定理，$sin B+sin C=2sin A cos B$。将 $sin C=sin(A+B)$ 代入并整理，得
        $ sin B=sin A cos B-cos A sin B=sin(A-B). $
        因 $-pi<A-B<pi$ 且 $sin B>0$，所以 $0<A-B<pi$。故 $B=A-B$ 或 $B=pi-(A-B)$。后者给出 $A=pi$，不合题意，故 $A=2B$。],
    ),
    subquestion(
      stem: [若 $cos B=2/3$，求 $cos C$ 的值。],
      answers: ([$22/27$],),
      explanation: [由 $A=2B$，得 $C=pi-3B$，所以
        $ cos C=-cos 3B=3cos B-4cos^3 B=2-32/27=22/27. $],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [设数列 ${a_n}$ 的前 $n$ 项和为 $S_n$。已知 $S_2=4$，$a_(n+1)=2S_n+1$，$n in NN^*$。],
  parts: (
    subquestion(
      stem: [求通项公式 $a_n$；],
      answers: ([$a_n=3^(n-1)$],),
      explanation: [由 $a_2=2a_1+1$ 和 $a_1+a_2=4$，得 $a_1=1,a_2=3$。
        当 $n>=2$ 时，两式 $a_(n+1)=2S_n+1$ 与 $a_n=2S_(n-1)+1$ 相减，得 $a_(n+1)=3a_n$。结合 $a_2=3a_1$，可知数列为首项 $1$、公比 $3$ 的等比数列，故 $a_n=3^(n-1)$。],
    ),
    subquestion(
      stem: [求数列 ${abs(a_n-n-2)}$ 的前 $n$ 项和。],
      answers: ([$cases(2 & quad n=1, (3^n-n^2-5n+11)/2 & quad n>=2)$],),
      explanation: [令 $c_n=3^(n-1)-n-2$，则 $c_1=-2,c_2=-1,c_3=4$。又 $c_(n+1)-c_n=2 dot 3^(n-1)-1>0$，故 $n>=3$ 时 $c_n>0$。
        记所求和为 $T_n$，则 $T_1=2$。当 $n>=2$ 时，只需将前两项的符号反转，故
        $
          T_n=sum_(k=1)^n (3^(k-1)-k-2)+6=(3^n-1)/2-n(n+1)/2-2n+6=(3^n-n^2-5n+11)/2.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，在三棱台 $A B C-D E F$ 中，平面 $B C F E perp$ 平面 $A B C$，$angle A C B=90 degree$，$B E=E F=F C=1$，$B C=2$，$A C=3$。
    #figure(frustum())],
  parts: (
    subquestion(
      stem: [求证：$B F perp$ 平面 $A C F D$；],
      answers: ([证明见解析。],),
      explanation: [延长 $A D,B E,C F$，交于点 $K$。
        #figure(frustum(auxiliary: true))
        因两个平面垂直、交线为 $B C$，且 $A C perp B C$，得 $A C perp$ 平面 $B C F E$，所以 $A C perp B F$。
        由 $E F parallel B C$ 和 $(E F)/(B C)=1/2$，得 $(K E)/(K B)=(K F)/(K C)=1/2$。故 $K B=2B E=2$，$K C=2F C=2$。
        因此 $triangle K B C$ 为等边三角形，$F$ 是 $K C$ 的中点，故 $B F perp K C$。
        $A C,K C$ 是平面 $A C F D$ 内相交于 $C$ 的两条直线，故 $B F perp$ 平面 $A C F D$。],
    ),
    subquestion(
      stem: [求直线 $B D$ 与平面 $A C F D$ 所成角的余弦值。],
      answers: ([$sqrt(21)/7$],),
      explanation: [由第 (1) 问，$B F perp$ 平面 $A C F D$，所以 $F$ 是 $B$ 在该平面上的射影，$angle B D F$ 为所求角。
        棱台上下底相似，$D F=(A C)/2=3/2$；在等边三角形 $K B C$ 中，$B F=sqrt(3)$。因此
        $
          B D=sqrt(B F^2+D F^2)=sqrt(21)/2, quad cos angle B D F=(D F)/(B D)=sqrt(21)/7.
        $],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [如图，设抛物线 $y^2=2p x$（$p>0$）的焦点为 $F$，抛物线上的点 $A$ 到 $y$ 轴的距离等于 $abs(A F)-1$。
    #figure(parabola-diagram())],
  parts: (
    subquestion(
      stem: [求 $p$ 的值；],
      answers: ([$p=2$],),
      explanation: [设 $A(x_0,y_0)$，则 $x_0>=0$。由抛物线定义，$abs(A F)=x_0+p/2$。题设给出 $x_0=x_0+p/2-1$，故 $p=2$。],
    ),
    subquestion(
      stem: [若直线 $A F$ 交抛物线于另一点 $B$，过 $B$ 与 $x$ 轴平行的直线和过 $F$ 与 $A B$ 垂直的直线交于点 $N$，$A N$ 与 $x$ 轴交于点 $M$。求 $M$ 的横坐标的取值范围。],
      answers: ([$(-infinity,0) union (2,+infinity)$],),
      explanation: [此时 $F(1,0)$。设 $A(t^2,2t)$，焦点弦两端点的参数乘积为 $-1$，故 $B(1/t^2,-2/t)$。其中 $t!=0$，否则直线与抛物线没有另一交点；且 $t!=plus.minus 1$，否则 $A B$ 竖直，过 $F$ 的垂线与过 $B$ 的水平线平行，无法得到 $N$。
        由 $k_(A B)=2t/(t^2-1)$，得 $F N$ 的方程
        $ y=-(t^2-1)/(2t)(x-1). $
        代入 $y_N=-2/t$，得 $N((t^2+3)/(t^2-1),-2/t)$。
        因 $A,N$ 的纵坐标异号，线段 $A N$ 与 $x$ 轴的交点满足 $arrow(O M)=(arrow(O A)+t^2 arrow(O N))/(1+t^2)$，因此
        $ x_M=(t^2+t^2 dot (t^2+3)/(t^2-1))/(1+t^2)=2t^2/(t^2-1)=2+2/(t^2-1). $
        这一计算也包含 $t^2=3$ 时 $A N$ 竖直的情形。
        当 $0<t^2<1$ 时，$x_M$ 遍历 $(-infinity,0)$；当 $t^2>1$ 时，$x_M$ 遍历 $(2,+infinity)$。故所求范围为 $(-infinity,0) union (2,+infinity)$。],
    ),
  ),
)
#question(
  "solution",
  score: 15,
  stem: [设函数 $f(x)=x^3+1/(1+x)$，$x in [0,1]$。证明：],
  parts: (
    subquestion(
      stem: [$f(x)>=1-x+x^2$；],
      answers: ([证明见解析。],),
      explanation: [对 $0<=x<=1$，有
        $ f(x)-(1-x+x^2)=x^4/(1+x)>=0. $
        因此 $f(x)>=1-x+x^2$，当且仅当 $x=0$ 时等号成立。],
    ),
    subquestion(
      stem: [$3/4<f(x)<=3/2$。],
      answers: ([证明见解析。],),
      explanation: [由第 (1) 问的恒等式，
        $ f(x)-3/4=(x-1/2)^2+x^4/(1+x)>0, $
        因为两个非负项不可能同时为零，故 $f(x)>3/4$。
        又 $0<=x<=1$ 时 $x^3<=x$，所以
        $ f(x)<=x+1/(1+x)=3/2-((1-x)(2x+1))/(2(1+x))<=3/2, $
        在 $x=1$ 时等号成立。],
    ),
  ),
)
