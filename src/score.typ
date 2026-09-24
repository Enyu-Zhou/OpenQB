#let score(value) = {
  assert(
    type(value) in (int, float) and value > 0,
    message: "Score must be a positive number",
  )
  [（#value 分）]
}
