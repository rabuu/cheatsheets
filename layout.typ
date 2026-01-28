#let layout(
  name: "Rasmus Buurman",
  title: none,
  flipped: true,
  margin-x: 1em,
  margin-y: 2.2em,
  columns: 4,
  column-gutter: 1em,
  font-size: 10pt,
  heading-size: auto,
  colors: (
    color.orange,
    color.teal,
    color.green,
    color.red,
    color.fuchsia,
    color.yellow,
    color.gray,
    color.eastern,
    color.olive,
    color.purple,
    color.aqua,
    color.lime,
  ),
  body,
) = {
  set page(
    paper: "a4",
    flipped: flipped,
    margin: (x: margin-x, y: margin-y),
    columns: columns,
    header: {
      grid(
        columns: (1fr, 1fr, 1fr),
        align: (left, center, right),
        gutter: 0pt,
        name,
        if title != none { smallcaps(title) },
        {
          let p = counter(page)
          [Seite #context p.display() / #context p.final().first()]
        },
      )
      v(-1em)
      line(length: 100%, stroke: black)
      v(0.1em)
    },
  )

  set std.columns(gutter: column-gutter)

  set heading(numbering: "1.1")
  show heading: it => {
    set text(font-size, weight: "bold")
    block(
      above: 1em,
      below: 0.8em,
      it.body,
    )
  }

  show heading.where(level: 1): it => context {
    let section = counter(heading).get().first()
    let color-index = calc.rem(section - 1, colors.len())
    let color = colors.at(color-index, default: gray)

    let heading-size = if heading-size == auto { 1.2 * font-size } else { heading-size }
    set text(black, size: heading-size, weight: "bold")
    set align(center)

    block(
      radius: 0.6mm,
      inset: 1.0mm,
      width: 100%,
      above: 0.8em,
      below: 0.5em,
      fill: color,
      smallcaps(it.body),
    )
  }

  show heading.where(level: 2): it => context {
    let section = counter(heading).get().first()
    let color-index = calc.rem(section - 1, colors.len())
    let color = colors.at(color-index, default: gray)

    set text(color, font-size, weight: "bold")
    block(
      grid(
        columns: (1fr, auto, 1fr),
        align: horizon + center,
        column-gutter: 1em,
        line(length: 100%, stroke: 1pt + color), it.body, line(length: 100%, stroke: 1pt + color),
      ),
    )
  }

  body
}
