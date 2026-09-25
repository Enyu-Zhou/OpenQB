#import "/src/lib.typ": (
  cetz, choice-placeholder, exam, figure-style, fill-placeholder,
  oblique-project, plot, question, section, step, subquestion,
)
#show: exam.with(
  subject: "数学",
  year: 2023,
  type: "普通高等学校招生全国统一考试",
  name: "全国甲卷（文科）",
  source: "https://github.com/deekur/gaokaomath/blob/main/普通高考/2023/2023全国甲文(广西,贵州,西藏,四川).pdf",
  regions: ("广西", "贵州", "西藏", "四川"),
)

#let flowchart() = cetz.canvas(length: 10mm, {
  import cetz.draw: *
  set-style(stroke: figure-style.thickness)
  rect((-0.6, 6.85), (0.6, 7.35), radius: 0.25)
  content((0, 7.1), [开始])
  line((-2.95, 6.1), (2.75, 6.1), (2.95, 6.6), (-2.75, 6.6), close: true)
  content((0, 6.35), [输入 $n=3,A=1,B=2,k=1$])
  line((0, 5.7), (1.1, 5.2), (0, 4.7), (-1.1, 5.2), close: true)
  content((0, 5.2), [$k<=n$])
  for (y, label) in ((4.05, $A=A+B$), (3.05, $B=A+B$), (2.05, $k=k+1$)) {
    rect((-1.1, y - 0.25), (1.1, y + 0.25))
    content((0, y), label)
  }
  line((-0.95, 0.75), (0.75, 0.75), (0.95, 1.25), (-0.75, 1.25), close: true)
  content((0, 1), [输出 $B$])
  rect((-0.6, -0.25), (0.6, 0.25), radius: 0.25)
  content((0, 0), [结束])
  for (y1, y2) in (
    (6.85, 6.6),
    (6.1, 5.7),
    (4.7, 4.3),
    (3.8, 3.3),
    (2.8, 2.3),
    (0.75, 0.25),
  ) {
    line((0, y1), (0, y2), mark: (end: ">"))
  }
  line((-1.1, 2.05), (-1.55, 2.05), (-1.55, 5.9), (-0.5, 5.9), mark: (end: ">"))
  line((-0.5, 5.9), (0, 5.9))
  line((1.1, 5.2), (1.75, 5.2), (1.75, 1.5), (0, 1.5), (0, 1.25), mark: (
    end: ">",
  ))
  content((0.15, 4.55), [是], anchor: "west")
  content((1.4, 5.3), [否], anchor: "south")
})

#let intersections() = cetz.canvas(length: 10mm, {
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
    size: (7, 4),
    axis-style: "school-book",
    x-min: -1.2,
    x-max: 3.2,
    y-min: -1.2,
    y-max: 1.2,
    x-tick-step: 1,
    y-tick-step: 1,
    x-label: move(dx: 6pt)[$x$],
    y-label: $y$,
    {
      plot.add(
        x => -calc.sin(2 * x * 1rad),
        domain: (-1.2, 3.2),
        samples: 180,
        style: (stroke: (paint: black, thickness: figure-style.thickness)),
      )
      plot.add(
        x => x / 2 - 0.5,
        domain: (-1.2, 3.2),
        style: (
          stroke: (
            paint: black,
            thickness: figure-style.thickness,
            dash: figure-style.dash,
          ),
        ),
      )
    },
  )
})

#let prism-diagram() = cetz.canvas(length: 20mm, {
  import cetz.draw: *
  let r = calc.sqrt(2)
  let c = (0, 0, 0)
  let a = (r, 0, 0)
  let b = (0, calc.sqrt(3), 0)
  let a1 = (0, 0, r)
  let b1 = (-r, calc.sqrt(3), r)
  let c1 = (-r, 0, r)
  oblique-project((-0.6, -0.45), (1, 0), (-0.2, 1), {
    set-style(stroke: (thickness: figure-style.thickness, join: "round"))
    line(a, b, b1, c1, a1, a)
    line(a1, b1)
    line(a1, b)
    line(a, c, b, stroke: (dash: figure-style.dash))
    line(c1, c, a1, stroke: (dash: figure-style.dash))
    for (p, label, anchor) in (
      (a, $A$, "north-east"),
      (b, $B$, "west"),
      (c, $C$, "south-west"),
      (a1, $A_1$, "east"),
      (b1, $B_1$, "west"),
      (c1, $C_1$, "south"),
    ) { content(p, label, anchor: anchor, padding: 0.08) }
  })
})

#section[选择题。本大题共 12 小题，每小题 5 分，共 60 分。在每小题给出的四个选项中，只有一项是符合题目要求的。]
#question(
  "single-choice",
  score: 5,
  stem: [设全集 $U={1,2,3,4,5}$，集合 $M={1,4}$，$N={2,5}$，则 $N union complement_U M=$#choice-placeholder()。],
  choices: ([${2,3,5}$], [${1,3,4}$], [${1,2,4,5}$], [${2,3,4,5}$]),
  answers: ([A],),
  explanation: [$complement_U M={2,3,5}$，又 $N subset complement_U M$，故所求并集为 ${2,3,5}$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [$(5(1+"i"^3))/((2+"i")(2-"i"))=$#choice-placeholder()。],
  choices: ([$-1$], [$1$], [$1-"i"$], [$1+"i"$]),
  answers: ([C],),
  explanation: [$"i"^3=-"i"$，$(2+"i")(2-"i")=5$，故原式为 $1-"i"$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知向量 $arrow(a)=(3,1)$，$arrow(b)=(2,2)$，则 $cos lr(⟨arrow(a)+arrow(b),arrow(a)-arrow(b)⟩)=$#choice-placeholder()。],
  choices: ([$1/17$], [$sqrt(17)/17$], [$sqrt(5)/5$], [$(2sqrt(5))/5$]),
  answers: ([B],),
  explanation: [$arrow(a)+arrow(b)=(5,3)$，$arrow(a)-arrow(b)=(1,-1)$，故所求余弦值为 $(5-3)/(sqrt(34)sqrt(2))=sqrt(17)/17$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [某校文艺部有 4 名学生，其中高一、高二年级各 2 名。从这 4 名学生中随机选 2 名组织校文艺汇演，则这 2 名学生来自不同年级的概率为#choice-placeholder()。],
  choices: ([$1/6$], [$1/3$], [$1/2$], [$2/3$]),
  answers: ([D],),
  explanation: [全部选法有 $binom(4, 2)=6$ 种，来自不同年级的选法有 $2 times 2=4$ 种，故概率为 $4/6=2/3$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [记 $S_n$ 为等差数列 ${a_n}$ 的前 $n$ 项和。若 $a_2+a_6=10$，$a_4 a_8=45$，则 $S_5=$#choice-placeholder()。],
  choices: ([$25$], [$22$], [$20$], [$15$]),
  answers: ([C],),
  explanation: [由 $2a_4=a_2+a_6=10$ 得 $a_4=5$，进而 $a_8=9$，公差 $d=(9-5)/4=1$。故 $a_3=4$，$S_5=5a_3=20$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [执行如图的程序框图，则输出的 $B=$#choice-placeholder()。
    #figure(flowchart())],
  choices: ([$21$], [$34$], [$55$], [$89$]),
  answers: ([B],),
  explanation: [每次先更新 $A$，再用更新后的 $A$ 计算 $B$。三次循环后的 $(A,B,k)$ 依次为 $(3,5,2)$、$(8,13,3)$、$(21,34,4)$。此时 $k>3$，退出循环，输出 $B=34$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [设 $F_1,F_2$ 为椭圆 $C:x^2/5+y^2=1$ 的两个焦点，点 $P$ 在 $C$ 上，若 $arrow(P F_1) dot arrow(P F_2)=0$，则 $abs(P F_1) dot abs(P F_2)=$#choice-placeholder()。],
  choices: ([$1$], [$2$], [$4$], [$5$]),
  answers: ([B],),
  explanation: [记 $r_1=abs(P F_1),r_2=abs(P F_2)$。由椭圆定义，$r_1+r_2=2sqrt(5)$。
    又焦距为 $4$，且两焦半径垂直，故 $r_1^2+r_2^2=16$。
    于是 $2r_1 r_2=(r_1+r_2)^2-(r_1^2+r_2^2)=20-16=4$，所求乘积为 $2$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [曲线 $y=e^x/(x+1)$ 在点 $(1,e/2)$ 处的切线方程为#choice-placeholder()。],
  choices: (
    [$y=e/4 x$],
    [$y=e/2 x$],
    [$y=e/4 x+e/4$],
    [$y=e/2 x+(3e)/4$],
  ),
  answers: ([C],),
  explanation: [求导得 $y'=(x e^x)/(x+1)^2$，故切线斜率为 $e/4$。
    切线方程为 $y-e/2=e/4(x-1)$，即 $y=e/4 x+e/4$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知双曲线 $C:x^2/a^2-y^2/b^2=1$（$a>0,b>0$）的离心率为 $sqrt(5)$，$C$ 的一条渐近线与圆 $(x-2)^2+(y-3)^2=1$ 交于 $A,B$ 两点，则 $abs(A B)=$#choice-placeholder()。],
  choices: (
    [$sqrt(5)/5$],
    [$(2sqrt(5))/5$],
    [$(3sqrt(5))/5$],
    [$(4sqrt(5))/5$],
  ),
  answers: ([D],),
  explanation: [由 $1+b^2/a^2=5$，得渐近线为 $y=plus.minus 2x$。
    圆心 $(2,3)$ 到 $y=-2x$ 的距离为 $7/sqrt(5)>1$，故相交的渐近线为 $y=2x$，圆心到它的距离为 $1/sqrt(5)$。
    因此 $abs(A B)=2sqrt(1-1/5)=(4sqrt(5))/5$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [在三棱锥 $P-A B C$ 中，$triangle A B C$ 是边长为 $2$ 的等边三角形，$P A=P B=2$，$P C=sqrt(6)$，则该棱锥的体积为#choice-placeholder()。],
  choices: ([$1$], [$sqrt(3)$], [$2$], [$3$]),
  answers: ([A],),
  explanation: [取 $A B$ 中点 $M$，则 $P M perp A B$，$C M perp A B$，且 $P M=C M=sqrt(3)$。
    因为 $P C^2=P M^2+C M^2$，故 $P M perp C M$。从而 $P M perp$ 平面 $A B C$，棱锥的高为 $sqrt(3)$。
    底面积为 $sqrt(3)$，故体积为 $1/3 times sqrt(3) times sqrt(3)=1$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [已知函数 $f(x)=e^(-(x-1)^2)$。记 $a=f(sqrt(2)/2)$，$b=f(sqrt(3)/2)$，$c=f(sqrt(6)/2)$，则#choice-placeholder()。],
  choices: ([$b>c>a$], [$b>a>c$], [$c>b>a$], [$c>a>b$]),
  answers: ([A],),
  explanation: [函数值随 $abs(x-1)$ 的增大而减小。由
    $
      (sqrt(6)+sqrt(3))^2=9+6sqrt(2)>16, quad (sqrt(6)+sqrt(2))^2=8+4sqrt(3)<16,
    $
    得 $1-sqrt(3)/2<sqrt(6)/2-1<1-sqrt(2)/2$。
    故三个自变量到 $1$ 的距离从小到大依次对应 $b,c,a$，所以 $b>c>a$。],
)
#question(
  "single-choice",
  score: 5,
  stem: [函数 $y=f(x)$ 的图象由函数 $y=cos(2x+pi/6)$ 的图象向左平移 $pi/6$ 个单位长度得到，则 $y=f(x)$ 的图象与直线 $y=x/2-1/2$ 的交点个数为#choice-placeholder()。],
  choices: ([$1$], [$2$], [$3$], [$4$]),
  answers: ([C],),
  explanation: [平移后 $f(x)=cos(2(x+pi/6)+pi/6)=-sin 2x$。
    由 $-1<=f(x)<=1$，交点横坐标只能在 $[-1,3]$ 内。在 $[-1,0]$ 上 $f(x)>=0>x/2-1/2$，没有交点。
    令 $h(x)=-sin 2x-x/2+1/2$，则 $h'(x)=-2cos 2x-1/2$。
    记 $t=1/2 arccos(-1/4)$，则 $pi/4<t<pi/2$。$h$ 在 $[0,t]$ 上递减，在 $[t,pi-t]$ 上递增，在 $[pi-t,3]$ 上递减。
    又 $h(0)>0$，$h(t)<=h(pi/4)<0$，$h(pi-t)>=h((3pi)/4)>0$，$h(3)=-sin 6-1<0$，故三个单调区间内各有且仅有一个零点，共 $3$ 个交点。
    #figure(intersections())],
)
#section[填空题。本大题共 4 小题，每小题 5 分，共 20 分。]
#question(
  "fill-in",
  score: 5,
  stem: [记 $S_n$ 为等比数列 ${a_n}$ 的前 $n$ 项和。若 $8S_6=7S_3$，则 ${a_n}$ 的公比为#fill-placeholder()。],
  answers: ([$-1/2$],),
  explanation: [设公比为 $q$，则 $S_6=(1+q^3)S_3$。
    因为 $S_3=a_1(1+q+q^2)!=0$，所以 $8(1+q^3)=7$，得 $q^3=-1/8$，故 $q=-1/2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $f(x)=(x-1)^2+a x+sin(x+pi/2)$ 为偶函数，则 $a=$#fill-placeholder()。],
  answers: ([$2$],),
  explanation: [$f(x)=x^2+1+cos x+(a-2)x$。前三项为偶函数，故须且只须 $a-2=0$，即 $a=2$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [若 $x,y$ 满足约束条件 $cases(3x-2y<=3, -2x+3y<=3, x+y>=1)$，则 $z=3x+2y$ 的最大值为#fill-placeholder()。],
  answers: ([$15$],),
  explanation: [将前两个不等式分别乘 $13/5$、$12/5$ 后相加，得
    $ 3x+2y=13/5(3x-2y)+12/5(-2x+3y)<=15. $
    当 $x=y=3$ 时满足全部约束，且取等号，故最大值为 $15$。],
)
#question(
  "fill-in",
  score: 5,
  stem: [在正方体 $A B C D-A_1 B_1 C_1 D_1$ 中，$A B=4$，$O$ 为 $A C_1$ 的中点。若该正方体的棱与球 $O$ 的球面有公共点，则球 $O$ 的半径的取值范围是#fill-placeholder()。],
  answers: ([$[2sqrt(2),2sqrt(3)]$],),
  explanation: [$O$ 为正方体中心。对任意一条棱，$O$ 到棱上点的距离在棱中点处最小，为 $sqrt(2^2+2^2)=2sqrt(2)$；在端点处最大，为 $sqrt(2^2+2^2+2^2)=2sqrt(3)$。
    沿棱移动时距离连续取遍其间各值，故所求范围为 $[2sqrt(2),2sqrt(3)]$。],
)
#section[解答题。本大题共 70 分。解答应写出文字说明、证明过程或演算步骤。第 17—21 题为必考题，每个试题考生都必须作答。第 22、23 题为选考题，考生根据要求作答。]
#question(
  "solution",
  score: 12,
  stem: [记 $triangle A B C$ 的内角 $A,B,C$ 的对边分别为 $a,b,c$，已知 $(b^2+c^2-a^2)/(cos A)=2$。],
  parts: (
    subquestion(
      stem: [求 $b c$。],
      answers: ([$1$],),
      explanation: [由余弦定理，$b^2+c^2-a^2=2b c cos A$。题设分式有意义，故 $cos A!=0$，从而 $2b c=2$，即 $b c=1$。],
    ),
    subquestion(
      stem: [若 $(a cos B-b cos A)/(a cos B+b cos A)-b/c=1$，求 $triangle A B C$ 的面积。],
      answers: ([$sqrt(3)/4$],),
      explanation: [由正弦定理及 $sin C=sin(A+B)$，题设等式化为
        $ (sin(A-B))/(sin(A+B))-(sin B)/(sin(A+B))=1. $
        故 $sin(A-B)-sin(A+B)=sin B$，即 $-2cos A sin B=sin B$。
        因 $sin B>0$，得 $cos A=-1/2$，$sin A=sqrt(3)/2$。
        所以 $S_(triangle A B C)=1/2 b c sin A=sqrt(3)/4$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [如图，在三棱柱 $A B C-A_1 B_1 C_1$ 中，$A_1 C perp$ 平面 $A B C$，$angle A C B=90 degree$。
    #figure(prism-diagram())],
  parts: (
    subquestion(
      stem: [证明：平面 $A C C_1 A_1 perp$ 平面 $B B_1 C_1 C$。],
      answers: ([证明见解析。],),
      explanation: [由 $A_1 C perp$ 平面 $A B C$，得 $A_1 C perp B C$。又 $A C perp B C$，且 $A C,A_1 C$ 是平面 $A C C_1 A_1$ 内两条相交直线，故 $B C perp$ 平面 $A C C_1 A_1$。
        因 $B C subset$ 平面 $B B_1 C_1 C$，故两平面垂直。],
    ),
    subquestion(
      stem: [设 $A B=A_1 B$，$A A_1=2$，求四棱锥 $A_1-B B_1 C_1 C$ 的高。],
      answers: ([$1$],),
      explanation: [在直角三角形 $A B C$ 与 $A_1 B C$ 中，$A B=A_1 B$，$B C$ 为公共边，故 $A C=A_1 C$。
        又 $A C perp A_1 C$，$A A_1=2$，故 $A C=A_1 C=sqrt(2)$。
        在直角三角形 $A_1 C C_1$ 内作 $A_1 H perp C C_1$，由第（1）问的面面垂直关系，得 $A_1 H perp$ 平面 $B B_1 C_1 C$，所以所求高为 $A_1 H$。
        由面积公式及 $A_1 C_1=A C$，得
        $ A_1 H=(A_1 C dot A_1 C_1)/(C C_1)=(sqrt(2)sqrt(2))/2=1. $
      ],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [一项试验旨在研究臭氧效应，试验方案如下：选 40 只小白鼠，随机地将其中 20 只分配到试验组，另外 20 只分配到对照组。试验组的小白鼠饲养在高浓度臭氧环境，对照组的小白鼠饲养在正常环境，一段时间后统计每只小白鼠体重的增加量（单位：$"g"$）。试验结果如下。
    对照组的小白鼠体重的增加量从小到大排序为
    #table(
      columns: 10,
      stroke: none,
      inset: 3pt,
      align: center,
      [15.2],
      [18.8],
      [20.2],
      [21.3],
      [22.5],
      [23.2],
      [25.8],
      [26.5],
      [27.5],
      [30.1],

      [32.6],
      [34.3],
      [34.8],
      [35.6],
      [35.6],
      [35.8],
      [36.2],
      [37.3],
      [40.5],
      [43.2],
    )
    试验组的小白鼠体重的增加量从小到大排序为
    #table(
      columns: 10,
      stroke: none,
      inset: 3pt,
      align: center,
      [7.8],
      [9.2],
      [11.4],
      [12.4],
      [13.2],
      [15.5],
      [16.5],
      [18.0],
      [18.8],
      [19.2],

      [19.8],
      [20.2],
      [21.6],
      [22.8],
      [23.6],
      [23.9],
      [25.1],
      [28.2],
      [32.3],
      [36.5],
    )
  ],
  parts: (
    subquestion(
      stem: [计算试验组的样本平均数。],
      answers: ([$19.8$],),
      explanation: [试验组的 $20$ 个数据之和为 $396.0$，故样本平均数为 $overline(x)=396.0/20=19.8$。],
    ),
    subquestion(
      parts: (
        subquestion(
          stem: [求 40 只小白鼠体重的增加量的中位数 $m$，再分别统计两样本中小于 $m$ 与不小于 $m$ 的数据的个数，完成如下列联表。
            #table(
              columns: (auto, 45pt, 45pt),
              align: center + horizon,
              [], [$<m$], [$>=m$],
              [对照组], [], [],
              [试验组], [], [],
            )
          ],
          answers: (
            [$m=23.4$；
              #table(
                columns: 3,
                align: center + horizon,
                [], [$<m$], [$>=m$],
                [对照组], [$6$], [$14$],
                [试验组], [$14$], [$6$],
              )
            ],
          ),
          explanation: [将两组数据合并排序，第 $20$、$21$ 个数分别为 $23.2,23.6$，故 $m=(23.2+23.6)/2=23.4$。
            对照组小于 $m$ 的有 $6$ 个，不小于 $m$ 的有 $14$ 个；试验组相应为 $14$ 个、$6$ 个。],
        ),
        subquestion(
          stem: [根据上一问中的列联表，能否有 $95%$ 的把握认为小白鼠在高浓度臭氧环境中与在正常环境中体重的增加量有差异？
            附：$K^2=(n(a d-b c)^2)/((a+b)(c+d)(a+c)(b+d))$。
            #table(
              columns: 4,
              align: center + horizon,
              [$P(K^2>=k)$], [$0.100$], [$0.050$], [$0.010$],
              [$k$], [$2.706$], [$3.841$], [$6.635$],
            )
          ],
          answers: ([能。],),
          explanation: [由列联表得
            $
              K^2=(40(6 times 6-14 times 14)^2)/(20 times 20 times 20 times 20)=6.4>3.841.
            $
            因此能有 $95%$ 的把握认为两种环境中小白鼠体重的增加量有差异。],
        ),
      ),
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知函数 $f(x)=a x-(sin x)/(cos^2 x)$，$x in (0,pi/2)$。],
  parts: (
    subquestion(
      stem: [当 $a=1$ 时，讨论 $f(x)$ 的单调性。],
      answers: ([在 $(0,pi/2)$ 上单调递减。],),
      explanation: [当 $a=1$ 时，
        $ f'(x)=1-(1+sin^2 x)/(cos^3 x). $
        由于 $0<cos x<1$，$1+sin^2 x>1$，故 $f'(x)<0$，所以 $f$ 在整个定义域上单调递减。],
    ),
    subquestion(
      stem: [若 $f(x)+sin x<0$ 恒成立，求 $a$ 的取值范围。],
      answers: ([$(-infinity,0]$],),
      explanation: [令 $g(x)=f(x)+sin x=a x-(sin^3 x)/(cos^2 x)$，并补充定义 $g(0)=0$。
        若 $a<=0$，则对任意 $x in (0,pi/2)$，都有 $g(x)<0$，满足题意。
        若 $a>0$，则 $g'(0)=a>0$。由导数连续性，$g$ 在 $0$ 右侧某个小区间内递增，从而该区间内 $g(x)>0$，与题意矛盾。
        故 $a$ 的取值范围为 $(-infinity,0]$。],
    ),
  ),
)
#question(
  "solution",
  score: 12,
  stem: [已知直线 $x-2y+1=0$ 与抛物线 $C:y^2=2p x$（$p>0$）交于 $A,B$ 两点，$abs(A B)=4sqrt(15)$。],
  parts: (
    subquestion(
      stem: [求 $p$。],
      answers: ([$2$],),
      explanation: [联立得 $y^2-4p y+2p=0$。设交点纵坐标为 $y_1,y_2$，则
        $ (y_1-y_2)^2=16p^2-8p, quad abs(A B)^2=5(y_1-y_2)^2=240. $
        故 $2p^2-p-6=0$，由 $p>0$ 得 $p=2$。],
    ),
    subquestion(
      stem: [设 $F$ 为 $C$ 的焦点，$M,N$ 为 $C$ 上两点，且 $arrow(F M) dot arrow(F N)=0$，求 $triangle M F N$ 面积的最小值。],
      answers: ([$12-8sqrt(2)$],),
      explanation: [#step[用弦的参数表示面积][
          此时 $C:y^2=4x$，$F=(1,0)$。水平直线与抛物线只有一个交点，故可设 $M N:x=u y+v$。
          设两交点纵坐标为 $y_1,y_2$，则 $y_1+y_2=4u$，$y_1 y_2=-4v$。
          由 $arrow(F M) dot arrow(F N)=0$，得
          $ (u y_1+v-1)(u y_2+v-1)+y_1 y_2=0, quad 4u^2=v^2-6v+1. $
          因此 $v<=3-2sqrt(2)$ 或 $v>=3+2sqrt(2)$，且 $4(u^2+v)=(v-1)^2>0$。
          $F$ 到直线的距离为 $abs(v-1)/sqrt(1+u^2)$，弦长为
          $ abs(M N)=sqrt(1+u^2)sqrt(16u^2+16v)=2sqrt(1+u^2)abs(v-1). $
          故三角形面积为 $S=(v-1)^2$。
        ]
        #step[求最小值并检验等号][
          在上述取值范围内，$v=3-2sqrt(2)$ 时 $(v-1)^2$ 最小，等于 $12-8sqrt(2)$。
          此时 $u=0$，直线 $x=3-2sqrt(2)>0$ 与抛物线有两个交点，且满足数量积条件，故最小值能够取得。
        ]],
    ),
  ),
)
#block(
  sticky: true,
)[请考生在第 22、23 题中任选一题作答。如果多做，则按所做的第一题计分。]
#question(
  "solution",
  score: 10,
  stem: [选修 4—4：坐标系与参数方程。#linebreak()
    已知点 $P(2,1)$，直线 $l:cases(x=2+t cos alpha, y=1+t sin alpha)$（$t$ 为参数），$alpha$ 为 $l$ 的倾斜角。$l$ 与 $x$ 轴正半轴、$y$ 轴正半轴分别交于点 $A,B$，且 $abs(P A) dot abs(P B)=4$。],
  parts: (
    subquestion(
      stem: [求 $alpha$。],
      answers: ([$(3pi)/4$],),
      explanation: [由两截距均为正数，得 $pi/2<alpha<pi$。$A,B$ 对应的参数分别为 $-1/(sin alpha)$、$-2/(cos alpha)$。
        因参数方向向量为单位向量，故
        $ abs(P A)abs(P B)=abs(2/(sin alpha cos alpha))=4/abs(sin 2alpha)=4. $
        于是 $sin 2alpha=-1$，结合倾斜角范围得 $alpha=(3pi)/4$。],
    ),
    subquestion(
      stem: [以坐标原点为极点，$x$ 轴正半轴为极轴建立极坐标系，求 $l$ 的极坐标方程。],
      answers: ([$rho cos theta+rho sin theta=3$],),
      explanation: [由第（1）问，直线斜率为 $-1$，且过点 $(2,1)$，故直角坐标方程为 $x+y=3$。
        代入 $x=rho cos theta,y=rho sin theta$，得 $rho cos theta+rho sin theta=3$。],
    ),
  ),
)
#question(
  "solution",
  score: 10,
  stem: [选修 4—5：不等式选讲。#linebreak()设 $a>0$，函数 $f(x)=2abs(x-a)-a$。],
  parts: (
    subquestion(
      stem: [求不等式 $f(x)<x$ 的解集。],
      answers: ([$(a/3,3a)$],),
      explanation: [当 $x<=a$ 时，不等式化为 $a-2x<x$，得 $a/3<x<=a$。
        当 $x>a$ 时，不等式化为 $2x-3a<x$，得 $a<x<3a$。
        合并得解集为 $(a/3,3a)$。],
    ),
    subquestion(
      stem: [若曲线 $y=f(x)$ 与 $x$ 轴所围成的图形的面积为 $2$，求 $a$。],
      answers: ([$2$],),
      explanation: [图象的顶点为 $(a,-a)$，与 $x$ 轴的两个交点为 $(a/2,0)$、$((3a)/2,0)$。
        所围三角形的底为 $a$，高为 $a$，故 $a^2/2=2$。结合 $a>0$ 得 $a=2$。],
    ),
  ),
)
