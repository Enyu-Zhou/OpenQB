#import "@preview/cetz:0.5.2": draw
#import "@preview/cetz-plot:0.1.4": axes

// 指定三个空间单位向量在纸面上的方向，真实三维点位统一采用斜投影。
#let oblique-project(x, y, z, body) = {
  draw.ortho(x: 0deg, y: 0deg, z: 0deg, sorted: false, {
    draw.transform((
      (x.at(0), y.at(0), z.at(0), 0),
      (x.at(1), y.at(1), z.at(1), 0),
      (0, 0, 1, 0),
      (0, 0, 0, 1),
    ))
    body
  })
}

// 标准坐标轴先在平面中生成，再转到三维轴向，最后与几何体统一投影。
// 从几何体的可见边端点向外延长，避免实线坐标轴覆盖遮挡边的虚线。
#let space-axes(
  starts,
  ends,
  label-anchors: ("north-east", "north-west", "south"),
) = {
  for (i, label) in ($x$, $y$, $z$).enumerate() {
    draw.scope({
      if i == 1 { draw.rotate(z: 90deg) }
      if i == 2 { draw.rotate(y: -90deg) }
      draw.translate((starts.at(i), 0, 0))
      axes.school-book(
        axes.axis(min: starts.at(i), max: ends.at(i), label: label, ticks: (
          step: none,
          minor-step: none,
          grid: false,
        )),
        axes.axis(min: 0, max: 1, ticks: (
          step: none,
          minor-step: none,
          grid: false,
        )),
        size: (ends.at(i) - starts.at(i), 1),
        stroke: 0.6pt,
        padding: 0,
        overshoot: 0,
        shared-zero: false,
        x: (
          label: (
            anchor: label-anchors.at(i),
            offset: 0,
          ),
        ),
        y: (stroke: none, mark: (end: none)),
      )
    })
  }
}
