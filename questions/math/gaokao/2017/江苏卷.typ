#import "/src/lib.typ": (
  cetz, exam, figure-style, fill-placeholder, oblique-project, plot, question,
  section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2017,
  type: "普通高等学校招生全国统一考试",
  name: "江苏卷",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2017/2017江苏.pdf",
  regions: ("江苏",),
)
#let branch-chart() = {
  set text(size: 9pt)
  cetz.canvas(length: 8mm, {
    import cetz.draw: *
    set-style(stroke: figure-style.thickness)
    rect((-0.6, 0.3), (0.6, -0.3), radius: 0.15)
    content((0, 0), [开始])
    line((-0.8, -1), (1, -1), (0.8, -1.7), (-1, -1.7), close: true)
    content((0, -1.35), [输入 $x$])
    line((0, -2.4), (1.3, -2.9), (0, -3.4), (-1.3, -2.9), close: true)
    content((0, -2.9), $x>=1?$)
    rect((-3.1, -4.1), (-1.3, -4.8))
    content((-2.2, -4.45), $y arrow.l 2^x$)
    rect((0.6, -4.1), (3.8, -4.8))
    content((2.2, -4.45), $y arrow.l 2+log_2 x$)
    line((-0.8, -5.9), (1, -5.9), (0.8, -6.6), (-1, -6.6), close: true)
    content((0, -6.25), [输出 $y$])
    rect((-0.6, -7.3), (0.6, -7.9), radius: 0.15)
    content((0, -7.6), [结束])
    line((0, -0.3), (0, -1), mark: (end: ">"))
    line((0, -1.7), (0, -2.4), mark: (end: ">"))
    line((-1.3, -2.9), (-2.2, -2.9), (-2.2, -4.1), mark: (end: ">"))
    line((1.3, -2.9), (2.2, -2.9), (2.2, -4.1), mark: (end: ">"))
    line((-2.2, -4.8), (-2.2, -5.3), (2.2, -5.3), (2.2, -4.8))
    line((0, -5.3), (0, -5.9), mark: (end: ">"))
    line((0, -6.6), (0, -7.3), mark: (end: ">"))
    content((-1.7, -2.65), [Y])
    content((1.7, -2.65), [N])
  })
}
#let sphere-cylinder() = cetz.canvas(length: 19mm, {
  import cetz.draw: *
  oblique-project((1, 0), (0, 0.3), (0, 1), {
    set-style(stroke: figure-style.thickness)
    line((-1, 0, -1), (-1, 0, 1))
    line((1, 0, -1), (1, 0, 1))
    scope({
      translate((0, 0, 1))
      circle((0, 0), radius: 1)
    })
    for z in (-1, 0) {
      scope({
        translate((0, 0, z))
        arc((1, 0), start: 0deg, stop: 180deg, radius: 1, stroke: (
          dash: figure-style.dash,
        ))
        arc((-1, 0), start: 180deg, stop: 360deg, radius: 1)
      })
    }
    scope({
      rotate(x: 90deg)
      circle((0, 0), radius: 1, stroke: (dash: figure-style.dash))
    })
    line((0, 0, -1), (0, 0, 1), stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      ((0, 0, 1), $O_2$, "south"),
      ((0, 0, 0), $O$, "west"),
      ((0, 0, -1), $O_1$, "north"),
    ) {
      circle(p, radius: 0.025, fill: black, stroke: none)
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let vector-diagram() = cetz.canvas(length: 27mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for (p, label, anchor) in (
    ((1, 0), $A$, "west"),
    ((-0.6, 0.8), $B$, "south-east"),
    ((0.2, 1.4), $C$, "south"),
  ) {
    line((0, 0), p, mark: (end: ">"))
    content(p, label, anchor: anchor, padding: 3pt)
  }
  arc((0.25, 0), start: 0deg, stop: calc.atan(7), radius: 0.25)
  content((0.34, 0.2), $alpha$)
  content((0, 0), $O$, anchor: "north-east", padding: 3pt)
})
#let tetrahedron() = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  let a = (1, 0, calc.sqrt(3))
  let b = (0, 0, 0)
  let c = (0, 2, 0)
  let d = (4, 0, 0)
  let e = (2.35, 0, 0.55 * calc.sqrt(3))
  let f = (1.8, 0, 0)
  oblique-project((1, 0), (0.6, -0.5), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, c, d, a, c)
    line(b, d, stroke: (dash: figure-style.dash))
    line(e, f, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "south"),
      (b, $B$, "east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (e, $E$, "south-west"),
      (f, $F$, "north-west"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})
#let ellipse-diagram(auxiliary: false) = cetz.canvas(length: 15mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness, axes: (
    stroke: figure-style.thickness,
  ))
  plot.plot(
    size: (5, 4.5),
    axis-style: "school-book",
    x-min: -2.5,
    x-max: 2.5,
    y-min: -2.2,
    y-max: 2.3,
    x-label: $x$,
    y-label: $y$,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.annotate(resize: false, {
        circle((0, 0), radius: (2, calc.sqrt(3)))
        for (p, label) in (((-1, 0), $F_1$), ((1, 0), $F_2$)) {
          circle(p, radius: 0.03, fill: black, stroke: none)
          content(p, label, anchor: "north", padding: 3pt)
        }
        if auxiliary {
          let x = 4 / calc.sqrt(7)
          let y = 3 / calc.sqrt(7)
          line((-1, 0), (x, y), (1, 0), stroke: (dash: figure-style.dash))
          line((-1, 0), (-x, y), (1, 0))
          content((x, y), $P$, anchor: "south-west", padding: 3pt)
          content((-x, y), $Q$, anchor: "south-east", padding: 3pt)
        }
      })
    },
  )
})
#let containers() = cetz.canvas(length: 13mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  for kind in (0, 1) {
    scope({
      translate((kind * 5.8, 0))
      let h0 = if kind == 0 { calc.sqrt(3.5) / 2 } else { 0.7 / calc.sqrt(2) }
      let h1 = if kind == 0 { h0 } else { 3.1 / calc.sqrt(2) }
      let hw = h0 + (h1 - h0) * 12 / 32
      let pt(h, z) = ((-h, -h, z), (h, -h, z), (h, h, z), (-h, h, z))
      let bottom = pt(h0, 0)
      let top = pt(h1, 3.2)
      let water = pt(hw, 1.2)
      oblique-project((0.8, 0), (0.4, 0.28), (0, 1), {
        line(..water, close: true, fill: luma(90%), stroke: none)
        line(
          bottom.at(0),
          bottom.at(1),
          water.at(1),
          water.at(0),
          close: true,
          fill: luma(94%),
          stroke: none,
        )
        line(
          bottom.at(1),
          bottom.at(2),
          water.at(2),
          water.at(1),
          close: true,
          fill: luma(94%),
          stroke: none,
        )
        line(..top, close: true)
        line(bottom.at(0), bottom.at(1), bottom.at(2))
        line(bottom.at(2), bottom.at(3), bottom.at(0), stroke: (
          dash: figure-style.dash,
        ))
        for i in range(4) {
          line(bottom.at(i), top.at(i), stroke: if i == 3 {
            (dash: figure-style.dash)
          } else { (:) })
        }
        line(water.at(0), water.at(1), water.at(2))
        line(water.at(2), water.at(3), water.at(0), stroke: (
          dash: figure-style.dash,
        ))
        let endpoint = if kind == 0 { (h0, h0, 3) } else {
          (h0 + (h1 - h0) * 0.75, h0 + (h1 - h0) * 0.75, 2.4)
        }
        line(bottom.at(0), endpoint, stroke: (dash: figure-style.dash))
        let labels = if kind == 0 { ($A$, $B$, $C$, $D$) } else {
          ($E$, $F$, $G$, $H$)
        }
        let upper = if kind == 0 { ($A_1$, $B_1$, $C_1$, $D_1$) } else {
          ($E_1$, $F_1$, $G_1$, $H_1$)
        }
        for i in range(4) {
          content(
            bottom.at(i),
            labels.at(i),
            anchor: (
              if kind == 0 {
                ("north", "north", "west", "south-west")
              } else {
                ("north-east", "north-west", "west", "south-east")
              }
            ).at(i),
            padding: 3pt,
          )
          content(top.at(i), upper.at(i), anchor: "south", padding: 3pt)
        }
        if kind == 1 {
          line((0, 0, 0), (0, 0, 3.2), stroke: (dash: figure-style.dash))
          content((0, 0, 0), $O$, anchor: "north", padding: 9pt)
          content((0, 0, 3.2), $O_1$, anchor: "south", padding: 3pt)
        }
      })
      content((0, -1), if kind == 0 { [容器Ⅰ] } else { [容器Ⅱ] })
    })
  }
})
#let semicircle-tangent() = cetz.canvas(length: 25mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  let a = (-1, 0)
  let b = (1, 0)
  let c = (-0.5, calc.sqrt(3) / 2)
  let p = (-1.25, calc.sqrt(3) / 4)
  arc(a, start: 180deg, stop: 0deg, radius: 1)
  line(a, b, c, a, p, c)
  circle((0, 0), radius: 0.025, fill: black, stroke: none)
  for (pt, label, anchor) in (
    (a, $A$, "north"),
    (b, $B$, "north"),
    (c, $C$, "south-east"),
    (p, $P$, "east"),
    ((0, 0), $O$, "north"),
  ) {
    content(pt, label, anchor: anchor, padding: 3pt)
  }
})
#let parallelepiped() = cetz.canvas(length: 22mm, {
  import cetz.draw: *
  let r = calc.sqrt(3)
  let a = (0, 0, 0)
  let b = (r, -1, 0)
  let c = (r, 1, 0)
  let d = (0, 2, 0)
  let a1 = (0, 0, r)
  let b1 = (r, -1, r)
  let c1 = (r, 1, r)
  let d1 = (0, 2, r)
  oblique-project((-0.3, -0.25), (0.8, 0), (0, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(b, c, d, d1, c1, b1, b)
    line(b1, a1, d1)
    line(c, c1)
    for (u, v) in ((a, b), (a, d), (a, a1), (a1, b), (a, c1), (a1, d), (b, d)) {
      line(u, v, stroke: (dash: figure-style.dash))
    }
    for (p, label, anchor) in (
      (a, $A$, "east"),
      (b, $B$, "north-east"),
      (c, $C$, "north"),
      (d, $D$, "west"),
      (a1, $A_1$, "south"),
      (b1, $B_1$, "east"),
      (c1, $C_1$, "north-east"),
      (d1, $D_1$, "south-west"),
    ) {
      content(p, label, anchor: anchor, padding: 3pt)
    }
  })
})

#section[填空题：共 14 小题，每小题 5 分，共 70 分。]
#question(
  "fill-in",
  score: 5,
  stem: [已知集合 $A={1,2}$，$B={a,a^2+3}$。若 $A inter B={1}$，则实数 $a$ 的值为#fill-placeholder()。],
  answers: ([$1$],),
  explanation: [因 $a^2+3>=3$ 不可能等于 $1$ 或 $2$，而 $1 in B$，故 $a=1$。此时 $B={1,4}$，满足条件。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知复数 $z=(1+i)(1+2i)$，其中 $i$ 是虚数单位，则 $z$ 的模是#fill-placeholder()。],
  answers: ([$sqrt(10)$],),
  explanation: [$z=-1+3i$，故 $abs(z)=sqrt((-1)^2+3^2)=sqrt(10)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某工厂生产甲、乙、丙、丁四种不同型号的产品，产量分别为 $200,400,300,100$ 件。为检验产品的质量，现用分层抽样的方法从以上所有的产品中抽取 $60$ 件进行检验，则应从丙种型号的产品中抽取#fill-placeholder()件。],
  answers: ([$18$],),
  explanation: [总体数量为 $200+400+300+100=1000$，按比例从丙种型号中抽取 $60 times 300/1000=18$ 件。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图是一个算法流程图，若输入 $x$ 的值为 $1/16$，则输出 $y$ 的值是#fill-placeholder()。
    #figure(branch-chart())],
  answers: ([$-2$],),
  explanation: [因 $1/16<1$，执行右侧分支，输出 $y=2+log_2(1/16)=2-4=-2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $tan(alpha-pi/4)=1/6$，则 $tan alpha=$#fill-placeholder()。],
  answers: ([$7/5$],),
  explanation: [由正切和角公式，$tan alpha=(tan(alpha-pi/4)+1)/(1-tan(alpha-pi/4))=(1/6+1)/(1-1/6)=7/5$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，在圆柱 $O_1 O_2$ 内有一个球 $O$，该球与圆柱的上、下底面及母线均相切。记圆柱 $O_1 O_2$ 的体积为 $V_1$，球 $O$ 的体积为 $V_2$，则 $V_1/V_2$ 的值是#fill-placeholder()。
    #figure(sphere-cylinder())],
  answers: ([$3/2$],),
  explanation: [设球的半径为 $r$，则圆柱底面半径为 $r$、高为 $2r$。因此 $V_1/V_2=(pi r^2 times 2r)/(4/3 pi r^3)=3/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [记函数 $f(x)=sqrt(6+x-x^2)$ 的定义域为 $D$。在区间 $[-4,5]$ 上随机取一个数 $x$，则 $x in D$ 的概率是#fill-placeholder()。],
  answers: ([$5/9$],),
  explanation: [由 $6+x-x^2>=0$ 得 $D=[-2,3]$。故所求概率为 $(3-(-2))/(5-(-4))=5/9$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，双曲线 $x^2/3-y^2=1$ 的右准线与它的两条渐近线分别交于点 $P,Q$，其焦点是 $F_1,F_2$，则四边形 $F_1 P F_2 Q$ 的面积是#fill-placeholder()。],
  answers: ([$2sqrt(3)$],),
  explanation: [双曲线中 $a^2=3,b^2=1,c=2$，故右准线为 $x=a^2/c=3/2$，渐近线为 $y=plus.minus x/sqrt(3)$。因此 $P,Q$ 的纵坐标分别为 $sqrt(3)/2,-sqrt(3)/2$，$P Q=sqrt(3)$。两条对角线 $F_1 F_2$ 与 $P Q$ 垂直，且 $F_1 F_2=4$，所求面积为 $1/2 times 4 times sqrt(3)=2sqrt(3)$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [等比数列 ${a_n}$ 的各项均为实数，其前 $n$ 项和为 $S_n$。已知 $S_3=7/4$，$S_6=63/4$，则 $a_8=$#fill-placeholder()。],
  answers: ([$32$],),
  explanation: [设公比为 $q$，则 $S_6-S_3=q^3 S_3$，故 $q^3=8$。因各项为实数，$q=2$，再由 $a_1(1+2+4)=7/4$ 得 $a_1=1/4$，所以 $a_8=1/4 times 2^7=32$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [某公司一年购买某种货物 $600$ 吨，每次购买 $x$ 吨，运费为 $6$ 万元/次，一年的总存储费用为 $4x$ 万元。要使一年的总运费与总存储费用之和最小，则 $x$ 的值是#fill-placeholder()。],
  answers: ([$30$],),
  explanation: [总费用为 $6 times 600/x+4x=3600/x+4x>=2sqrt(3600/x times 4x)=240$（万元）。等号当且仅当 $3600/x=4x$，即 $x=30$ 时成立，此时每年购买 $20$ 次，可行。],
)
#question(
  "fill-in",
  score: 5,
  stem: [已知函数 $f(x)=x^3-2x+e^x-1/e^x$，其中 $e$ 是自然对数的底数。若 $f(a-1)+f(2a^2)<=0$，则实数 $a$ 的取值范围是#fill-placeholder()。],
  answers: ([$[-1,1/2]$],),
  explanation: [$f$ 为奇函数，且 $f'(x)=3x^2-2+e^x+e^(-x)>=3x^2>=0$，仅在 $x=0$ 时等于零，所以 $f$ 在 $RR$ 上严格递增。
    因此原不等式等价于 $f(2a^2)<=-f(a-1)=f(1-a)$，即 $2a^2<=1-a$。解 $(2a-1)(a+1)<=0$，得 $a in [-1,1/2]$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [如图，在同一个平面内，向量 $arrow(O A),arrow(O B),arrow(O C)$ 的模分别为 $1,1,sqrt(2)$，$arrow(O A)$ 与 $arrow(O C)$ 的夹角为 $alpha$，且 $tan alpha=7$，$arrow(O B)$ 与 $arrow(O C)$ 的夹角为 $45 degree$。若 $arrow(O C)=m arrow(O A)+n arrow(O B)$（$m,n in RR$），则 $m+n=$#fill-placeholder()。
    #figure(vector-diagram())],
  answers: ([$3$],),
  explanation: [以 $O$ 为原点、$O A$ 所在直线为 $x$ 轴建立直角坐标系。由图可知 $alpha$ 为锐角，故 $cos alpha=sqrt(2)/10$、$sin alpha=7sqrt(2)/10$。
    因此 $A=(1,0)$，$C=(1/5,7/5)$，$B=(cos(alpha+pi/4),sin(alpha+pi/4))=(-3/5,4/5)$。
    由向量等式得 $m-3/5 n=1/5$、$4/5 n=7/5$，解得 $m=5/4,n=7/4$，所以 $m+n=3$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在平面直角坐标系 $x O y$ 中，$A(-12,0),B(0,6)$，点 $P$ 在圆 $O:x^2+y^2=50$ 上。若 $arrow(P A) dot arrow(P B)<=20$，则点 $P$ 的横坐标的取值范围是#fill-placeholder()。],
  answers: ([$[-5sqrt(2),1]$],),
  explanation: [设 $P(x,y)$，则 $arrow(P A) dot arrow(P B)=x^2+y^2+12x-6y=50+12x-6y$。因此条件等价于 $y>=2x+5$。
    对固定的横坐标 $x$，圆上存在满足条件的点，当且仅当 $sqrt(50-x^2)>=2x+5$，且 $abs(x)<=5sqrt(2)$。
    当 $x<=-5/2$ 时该不等式自动成立；当 $x>-5/2$ 时，两边平方得 $(x+5)(x-1)<=0$，即 $x<=1$。合并得 $x in [-5sqrt(2),1]$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [设 $f(x)$ 是定义在 $RR$ 上且周期为 $1$ 的函数，在区间 $[0,1)$ 上，$f(x)=cases(x^2 quad &x in D, x quad &x in.not D)$，其中集合 $D={x|x=(n-1)/n,n in NN^*}$，则方程 $f(x)-lg x=0$ 的解的个数是#fill-placeholder()。],
  answers: ([$8$],),
  explanation: [
    #step[限定范围并排除异常点][因 $0<=f(x)<1$，任何解均满足 $1<=x<10$。
      先说明：若 $1<x<10$ 是有理数，则 $lg x$ 不可能是有理数。否则，写成 $x=u/v$、$lg x=p/q$，其中两组分数均为最简正分数，且 $0<p<q$。由 $u^q=10^p v^q$ 及 $u,v$ 互质，得 $v=1$。再比较素因子 $2$ 的指数，得 $q$ 整除 $p$，矛盾。
      对于小数部分属于 $D$ 的点，$x$ 和 $f(x)$ 都是有理数，因此除 $x=1$ 外均不可能满足方程。$x=1$ 时 $f(1)=f(0)=0=lg 1$，确为一解。
    ]
    #step[逐个周期计数][在 $[k,k+1)$ 上，未修改的函数为 $x-k$。令 $h_k(x)=x-k-lg x$，则对 $x>=1$，$h_k'(x)=1-1/(x ln 10)>0$。
      $k=1$ 时，$h_1(1)=0$，区间内仅有解 $x=1$。
      $k=2,3,dots,8$ 时，$h_k(k)=-lg k<0$，$h_k(k+1)=1-lg(k+1)>0$，故每个区间内各有一个零点。这些零点均为无理数，否则 $lg x=x-k$ 也为有理数，与前述结论矛盾，因此它们不属于被修改的点。
      $k=9$ 时，$h_9(10)=0$，但 $10$ 不在区间内，故 $[9,10)$ 内没有解。
      综上，共有 $1+7=8$ 个解。
    ]
  ],
)

#section[解答题：共 6 小题，共 90 分。解答应写出文字说明、证明过程或演算步骤。]
#question(
  "solution",
  score: 14,
  stem: [如图，在三棱锥 $A-B C D$ 中，$A B perp A D$，$B C perp B D$，平面 $A B D perp$ 平面 $B C D$，点 $E,F$（$E$ 与 $A,D$ 不重合）分别在棱 $A D,B D$ 上，且 $E F perp A D$。求证：
    #figure(tetrahedron())],
  parts: (
    subquestion(
      stem: [$E F parallel$ 平面 $A B C$。],
      answers: ([证明见解析。],),
      explanation: [在平面 $A B D$ 内，$A B perp A D$、$E F perp A D$，故 $E F parallel A B$。又 $A B subset$ 平面 $A B C$，$E F subset.not$ 平面 $A B C$，所以 $E F parallel$ 平面 $A B C$。],
    ),
    subquestion(
      stem: [$A D perp A C$。],
      answers: ([证明见解析。],),
      explanation: [因平面 $A B D perp$ 平面 $B C D$，交线为 $B D$，而 $B C$ 在平面 $B C D$ 内且 $B C perp B D$，故 $B C perp$ 平面 $A B D$，于是 $B C perp A D$。
        再结合 $A B perp A D$，且 $A B inter B C={B}$，得 $A D perp$ 平面 $A B C$。因 $A C subset$ 平面 $A B C$，故 $A D perp A C$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [已知向量 $bold(a)=(cos x,sin x)$，$bold(b)=(3,-sqrt(3))$，$x in [0,pi]$。],
  parts: (
    subquestion(
      stem: [若 $bold(a) parallel bold(b)$，求 $x$ 的值。],
      answers: ([$x=5pi/6$],),
      explanation: [由共线条件，$-sqrt(3)cos x-3sin x=0$，即 $2sin(x+pi/6)=0$。结合 $x in [0,pi]$，得 $x=5pi/6$。],
    ),
    subquestion(
      stem: [记 $f(x)=bold(a) dot bold(b)$，求 $f(x)$ 的最大值和最小值以及对应的 $x$ 的值。],
      answers: (
        [最大值为 $3$，对应 $x=0$；最小值为 $-2sqrt(3)$，对应 $x=5pi/6$。],
      ),
      explanation: [$f(x)=3cos x-sqrt(3)sin x=2sqrt(3)cos(x+pi/6)$。当 $x in [0,pi]$ 时，$x+pi/6 in [pi/6,7pi/6]$。余弦最大值为 $sqrt(3)/2$，在 $x=0$ 处取得；最小值为 $-1$，在 $x=5pi/6$ 处取得。因此得到所求最值及对应的 $x$。],
    ),
  ),
)
#question(
  "solution",
  score: 14,
  stem: [如图，在平面直角坐标系 $x O y$ 中，椭圆 $E:x^2/a^2+y^2/b^2=1$（$a>b>0$）的左、右焦点分别为 $F_1,F_2$，离心率为 $1/2$，两准线之间的距离为 $8$。点 $P$ 在椭圆 $E$ 上，且位于第一象限，过点 $F_1$ 作直线 $P F_1$ 的垂线 $l_1$，过点 $F_2$ 作直线 $P F_2$ 的垂线 $l_2$。
    #figure(ellipse-diagram())],
  parts: (
    subquestion(
      stem: [求椭圆 $E$ 的标准方程。],
      answers: ([$x^2/4+y^2/3=1$],),
      explanation: [设半焦距为 $c$，由 $c/a=1/2$、$2a^2/c=8$ 得 $a=2,c=1$。于是 $b^2=a^2-c^2=3$，椭圆为 $x^2/4+y^2/3=1$。],
    ),
    subquestion(
      stem: [若直线 $l_1,l_2$ 的交点 $Q$ 在椭圆 $E$ 上，求点 $P$ 的坐标。],
      answers: ([$(4sqrt(7)/7,3sqrt(7)/7)$],),
      explanation: [设 $P(x_0,y_0)$，其中 $x_0,y_0>0$。由 $F_1=(-1,0),F_2=(1,0)$ 及垂直条件，得
        $ l_1:(x_0+1)(x+1)+y_0 y=0, quad l_2:(x_0-1)(x-1)+y_0 y=0. $
        联立解得 $Q=(-x_0,(x_0^2-1)/y_0)$。由于 $P,Q$ 均在椭圆上，且横坐标互为相反数，它们的纵坐标平方相等，故
        $ (x_0^2-1)/y_0=plus.minus y_0. $
        若取负号，则 $x_0^2+y_0^2=1$，与 $x_0^2/4+y_0^2/3=1$ 矛盾。故 $x_0^2-y_0^2=1$，联立椭圆方程得 $x_0^2=16/7,y_0^2=9/7$。
        结合第一象限条件，$P=(4sqrt(7)/7,3sqrt(7)/7)$。
        #figure(ellipse-diagram(auxiliary: true))
      ],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [如图，水平放置的正四棱柱形玻璃容器Ⅰ和正四棱台形玻璃容器Ⅱ的高均为 $32$ cm，容器Ⅰ的底面对角线 $A C$ 的长为 $10sqrt(7)$ cm，容器Ⅱ的两底面对角线 $E G,E_1 G_1$ 的长分别为 $14$ cm 和 $62$ cm。分别在容器Ⅰ和容器Ⅱ中注入水，水深均为 $12$ cm。现有一根玻璃棒 $l$，其长度为 $40$ cm。（容器厚度、玻璃棒粗细均忽略不计。）
    #figure(containers())],
  parts: (
    subquestion(
      stem: [将 $l$ 放在容器Ⅰ中，$l$ 的一端置于点 $A$ 处，另一端置于侧棱 $C C_1$ 上，求 $l$ 没入水中部分的长度。],
      answers: ([$16$ cm],),
      explanation: [设另一端为 $M$。在直角三角形 $A C M$ 中，$C M=sqrt(40^2-(10sqrt(7))^2)=30$（cm），小于容器高度 $32$ cm，放置可行。水面平行于底面，由相似关系，浸水长度与全棒长度之比为 $12/30$，故浸水长度为 $40 times 12/30=16$（cm）。],
    ),
    subquestion(
      stem: [将 $l$ 放在容器Ⅱ中，$l$ 的一端置于点 $E$ 处，另一端置于侧棱 $G G_1$ 上，求 $l$ 没入水中部分的长度。],
      answers: ([$20$ cm],),
      explanation: [在竖直截面 $E E_1 G_1 G$ 内，以 $E$ 为原点、$E G$ 方向为横轴、竖直向上为纵轴建立直角坐标系。由两底面的中心对齐，得 $G=(14,0)$，$G_1=(38,32)$。
        设玻璃棒另一端为 $N=(14+24t,32t)$，其中 $0<=t<=1$。由 $E N=40$，有
        $ (14+24t)^2+(32t)^2=1600, $
        整理得 $400t^2+168t-351=0$，即 $(4t-3)(100t+117)=0$。因此 $t=3/4$，$N$ 的高度为 $24$ cm，满足在侧棱上的要求。
        水深为 $12$ cm，故浸水长度为 $40 times 12/24=20$（cm）。],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [对于给定的正整数 $k$，若数列 ${a_n}$ 满足 $a_(n-k)+a_(n-k+1)+dots+a_(n-1)+a_(n+1)+dots+a_(n+k-1)+a_(n+k)=2k a_n$ 对任意正整数 $n$（$n>k$）总成立，则称数列 ${a_n}$ 是“$P(k)$ 数列”。],
  parts: (
    subquestion(
      stem: [证明：等差数列 ${a_n}$ 是“$P(3)$ 数列”。],
      answers: ([证明见解析。],),
      explanation: [设等差数列的公差为 $d$。对 $n>3$ 及 $j=1,2,3$，均有 $a_(n-j)+a_(n+j)=(a_n-j d)+(a_n+j d)=2a_n$。把三个等式相加，得到定义中 $k=3$ 的等式，因此 ${a_n}$ 是“$P(3)$ 数列”。],
    ),
    subquestion(
      stem: [若数列 ${a_n}$ 既是“$P(2)$ 数列”，又是“$P(3)$ 数列”，证明：${a_n}$ 是等差数列。],
      answers: ([证明见解析。],),
      explanation: [
        #step[证明从第三项起为等差数列][由“$P(2)$ 数列”的定义，对 $n>=3$，
          $ a_(n-2)+a_(n-1)+a_(n+1)+a_(n+2)=4a_n. $
          对 $n>=4$，分别在上式中以 $n-1$、$n+1$ 替换 $n$，得
          $ a_(n-3)+a_(n-2)=4a_(n-1)-a_n-a_(n+1), $
          $ a_(n+2)+a_(n+3)=4a_(n+1)-a_(n-1)-a_n. $
          将这两式代入“$P(3)$ 数列”的定义式，得
          $ 4a_(n-1)+4a_(n+1)-2a_n=6a_n, $
          即 $a_(n-1)+a_(n+1)=2a_n$（$n>=4$）。因此 $a_3,a_4,a_5,dots$ 成等差数列，设其公差为 $d$。
        ]
        #step[补齐前两项][由“$P(2)$ 数列”的定义，取 $n=4$，有 $a_2+a_3+a_5+a_6=4a_4$，代入后得 $a_2=a_3-d$。
          再取 $n=3$，有 $a_1+a_2+a_4+a_5=4a_3$，从而 $a_1=a_3-2d=a_2-d$。
          所以整个数列 ${a_n}$ 均为公差 $d$ 的等差数列。
        ]
      ],
    ),
  ),
)
#question(
  "solution",
  score: 16,
  stem: [已知函数 $f(x)=x^3+a x^2+b x+1$（$a>0,b in RR$）有极值，且导函数 $f'(x)$ 的极值点是 $f(x)$ 的零点。（极值点是指函数取极值时对应的自变量的值。）],
  parts: (
    subquestion(
      stem: [求 $b$ 关于 $a$ 的函数关系式，并写出定义域。],
      answers: ([$b=2a^2/9+3/a$，定义域为 $(3,+infinity)$。],),
      explanation: [$f'(x)=3(x+a/3)^2+b-a^2/3$ 的极值点为 $x=-a/3$。由 $f(-a/3)=0$ 得 $2a^3/27-a b/3+1=0$，故 $b=2a^2/9+3/a$。
        三次函数 $f$ 有极值，当且仅当 $f'$ 有两个不同实根，即 $b-a^2/3<0$。代入后为 $(27-a^3)/(9a)<0$，结合 $a>0$ 得 $a>3$。],
    ),
    subquestion(
      stem: [证明：$b^2>3a$。],
      answers: ([证明见解析。],),
      explanation: [由第（1）问，直接因式分解得
        $ b^2-3a=(2a^2/9+3/a)^2-3a=((a^3-27)(4a^3-27))/(81a^2). $
        因 $a>3$，右侧各因子均为正，故 $b^2>3a$。],
    ),
    subquestion(
      stem: [若 $f(x),f'(x)$ 这两个函数的所有极值之和不小于 $-7/2$，求 $a$ 的取值范围。],
      answers: ([$(3,6]$],),
      explanation: [令 $t=x+a/3$，并利用 $f(-a/3)=0$，可将原函数写成
        $ f(t-a/3)=t^3+(b-a^2/3)t. $
        这是关于 $t$ 的奇函数。它的两个极值点互为相反数，所以两个极值之和为 $0$。
        $f'$ 只有一个极小值 $b-a^2/3$。于是所有极值之和为
        $ H(a)=b-a^2/3=-a^2/9+3/a, quad a>3. $
        因 $H'(a)=-2a/9-3/a^2<0$，$H$ 在 $(3,+infinity)$ 上严格递减，且 $H(6)=-7/2$。所以 $H(a)>=-7/2$ 等价于 $a<=6$，结合定义域得 $a in (3,6]$。],
    ),
  ),
)

#section[数学Ⅱ（附加题）：共 40 分。第 21 题选做，第 22、23 题必做。]
#question(
  "solution",
  score: 20,
  stem: [本题包括 A、B、C、D 四小题，请选定其中两小题作答，每小题 10 分。若多做，则按作答的前两小题评分。],
  parts: (
    subquestion(
      score: 10,
      stem: [【A】选修 4-1：几何证明选讲。如图，$A B$ 为半圆 $O$ 的直径，直线 $P C$ 切半圆 $O$ 于点 $C$，$A P perp P C$，$P$ 为垂足。求证：
        #figure(semicircle-tangent())],
      parts: (
        subquestion(
          stem: [$angle P A C=angle C A B$。],
          answers: ([证明见解析。],),
          explanation: [由弦切角定理，$angle P C A=angle C B A$。又因 $A B$ 为直径，$angle A C B=90 degree$，而 $angle A P C=90 degree$，所以 $angle P A C=90 degree-angle P C A=90 degree-angle C B A=angle C A B$。],
        ),
        subquestion(
          stem: [$A C^2=A P dot A B$。],
          answers: ([证明见解析。],),
          explanation: [由第（i）问及两直角相等，得 $triangle A P C ∽ triangle A C B$。于是 $(A P)/(A C)=(A C)/(A B)$，故 $A C^2=A P dot A B$。],
        ),
      ),
    ),
    subquestion(
      score: 10,
      stem: [【B】选修 4-2：矩阵与变换。已知矩阵 $A=mat(0, 1; 1, 0)$，$B=mat(1, 0; 0, 2)$。],
      parts: (
        subquestion(
          stem: [求 $A B$。],
          answers: ([$mat(0, 2; 1, 0)$],),
          explanation: [按矩阵乘法计算，$A B=mat(0, 1; 1, 0)mat(1, 0; 0, 2)=mat(0, 2; 1, 0)$。],
        ),
        subquestion(
          stem: [若曲线 $C_1:x^2/8+y^2/2=1$ 在矩阵 $A B$ 对应的变换作用下得到另一曲线 $C_2$，求 $C_2$ 的方程。],
          answers: ([$x^2+y^2=8$],),
          explanation: [设原曲线上点为 $(x_0,y_0)$，变换后为 $(x,y)$，则 $x=2y_0,y=x_0$，即 $x_0=y,y_0=x/2$。代入 $x_0^2/8+y_0^2/2=1$，得 $y^2/8+x^2/8=1$。变换矩阵可逆，故所得曲线恰为圆 $x^2+y^2=8$。],
        ),
      ),
    ),
    subquestion(
      score: 10,
      stem: [【C】选修 4-4：坐标系与参数方程。在平面直角坐标系 $x O y$ 中，已知直线 $l$ 的参数方程为 $cases(x=-8+t, y=t/2)$（$t$ 为参数），曲线 $C$ 的参数方程为 $cases(x=2s^2, y=2sqrt(2)s)$（$s$ 为参数）。设 $P$ 为曲线 $C$ 上的动点，求点 $P$ 到直线 $l$ 的距离的最小值。],
      answers: ([$4sqrt(5)/5$],),
      explanation: [消去 $t$，得直线 $l:x-2y+8=0$。设 $P=(2s^2,2sqrt(2)s)$，由点到直线距离公式，
        $
          d=abs(2s^2-4sqrt(2)s+8)/sqrt(5)=(2(s-sqrt(2))^2+4)/sqrt(5)>=4sqrt(5)/5.
        $
        当 $s=sqrt(2)$，即 $P=(4,4)$ 时取等号，故最小值为 $4sqrt(5)/5$。],
    ),
    subquestion(
      score: 10,
      stem: [【D】选修 4-5：不等式选讲。已知 $a,b,c,d$ 为实数，且 $a^2+b^2=4$，$c^2+d^2=16$，证明 $a c+b d<=8$。],
      answers: ([证明见解析。],),
      explanation: [由柯西不等式，$(a c+b d)^2<=(a^2+b^2)(c^2+d^2)=64$，所以 $a c+b d<=abs(a c+b d)<=8$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [如图，在平行六面体 $A B C D-A_1 B_1 C_1 D_1$ 中，$A A_1 perp$ 平面 $A B C D$，且 $A B=A D=2$，$A A_1=sqrt(3)$，$angle B A D=120 degree$。
    #figure(parallelepiped())],
  parts: (
    subquestion(
      stem: [求异面直线 $A_1 B$ 与 $A C_1$ 所成角的余弦值。],
      answers: ([$1/7$],),
      explanation: [以 $A$ 为原点，$A D$ 方向为 $y$ 轴正方向，$A A_1$ 方向为 $z$ 轴正方向，底面内垂直于 $A D$ 且指向 $B$ 所在一侧的方向为 $x$ 轴正方向，建立空间直角坐标系。
        由条件可得 $A=(0,0,0)$、$B=(sqrt(3),-1,0)$、$D=(0,2,0)$、$A_1=(0,0,sqrt(3))$、$C_1=(sqrt(3),1,sqrt(3))$。
        所以 $arrow(A_1 B)=(sqrt(3),-1,-sqrt(3))$、$arrow(A C_1)=(sqrt(3),1,sqrt(3))$，二者的数量积为 $-1$，模均为 $sqrt(7)$。故所求余弦值为 $abs(-1)/(sqrt(7)sqrt(7))=1/7$。],
    ),
    subquestion(
      stem: [求二面角 $B-A_1 D-A$ 的正弦值。],
      answers: ([$sqrt(7)/4$],),
      explanation: [沿用上述坐标系，平面 $A_1 D A$ 的一个法向量为 $bold(n)=(1,0,0)$。
        设平面 $B A_1 D$ 的法向量为 $bold(m)=(u,v,w)$。由 $bold(m) dot arrow(A_1 B)=0$、$bold(m) dot arrow(B D)=0$，得
        $ sqrt(3)u-v-sqrt(3)w=0, quad -sqrt(3)u+3v=0. $
        可取 $bold(m)=(3,sqrt(3),2)$，其模为 $4$。法向量夹角的余弦绝对值为 $3/4$，所以所求二面角的正弦值为 $sqrt(1-(3/4)^2)=sqrt(7)/4$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [已知一个口袋有 $m$ 个白球，$n$ 个黑球（$m,n in NN^*,n>=2$），这些球除颜色外全部相同。现将口袋中的球随机地逐个取出，并放入如图所示的编号为 $1,2,3,dots,m+n$ 的抽屉内，其中第 $k$ 次取出的球放入编号为 $k$ 的抽屉（$k=1,2,3,dots,m+n$）。
    #table(
      columns: 5,
      align: center,
      [$1$], [$2$], [$3$], [$dots$], [$m+n$],
    )],
  parts: (
    subquestion(
      stem: [试求编号为 $2$ 的抽屉内放的是黑球的概率 $p$。],
      answers: ([$n/(m+n)$],),
      explanation: [黑球所在的 $n$ 个抽屉组成的集合共有 $C_(m+n)^n$ 种等可能的选择。其中包含编号 $2$ 的有 $C_(m+n-1)^(n-1)$ 种，因此 $p=C_(m+n-1)^(n-1)/C_(m+n)^n=n/(m+n)$。],
    ),
    subquestion(
      stem: [随机变量 $X$ 表示最后一个取出的黑球所在抽屉编号的倒数，$E(X)$ 是 $X$ 的数学期望。证明：$E(X)<n/((m+n)(n-1))$。],
      answers: ([证明见解析。],),
      explanation: [若最后一个黑球位于第 $k$ 个抽屉，则其余 $n-1$ 个黑球位于前 $k-1$ 个抽屉中。因此
        $ P(X=1/k)=C_(k-1)^(n-1)/C_(m+n)^n, quad k=n,n+1,dots,m+n. $
        因 $k>=n>=2$，有 $1/k<1/(k-1)$，且以上各概率均为正。于是
        $
          E(X)=1/C_(m+n)^n sum_(k=n)^(m+n) C_(k-1)^(n-1)/k
          <1/C_(m+n)^n sum_(k=n)^(m+n) C_(k-1)^(n-1)/(k-1)
          =1/((n-1)C_(m+n)^n) sum_(k=n)^(m+n) C_(k-2)^(n-2).
        $
        利用组合数恒等式 $sum_(k=n)^(m+n) C_(k-2)^(n-2)=C_(m+n-1)^(n-1)$（可按最大元素分类计数），得到
        $ E(X)<C_(m+n-1)^(n-1)/((n-1)C_(m+n)^n)=n/((m+n)(n-1)). $
      ],
    ),
  ),
)
