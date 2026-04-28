// SPDX-FileCopyrightText: © 2026 Toon Verstraelen <Toon.Verstraelen@UGent.be>
// SPDX-License-Identifier: CC-BY-SA-4.0

#import "@local/slipst:0.3.0": *
#import "@preview/suiji:0.5.1": *
#import "@preview/cetz:0.5.0"

#show: slipst.with(
  width: 24cm,
  margin: 0.75cm,
  spacing: 0.75cm,
)
#set text(font: "FiraGo", size: 20pt)
#show raw: set text(font: "Fira Code")

#let ugbl = rgb("#1e64c8")
#let ugor = rgb("#ff7f0e")
#let uggr = rgb("#2ca02c")
#let ugcr = rgb("#d62728")
#let ugpr = rgb("#6d28d9")
#let ugbr = rgb("#8c564b")
#let ugrs = rgb("#e377c2")
#let ugga = rgb("#888888")
#let ugye = rgb("#ffdd00")
#let ugtl = rgb("#17becf")
#let ugdk = rgb("#111111")
#set rect(inset: 0cm)
#show link: it => { underline(text(blue.darken(20%))[#it]) }
#set underline(offset: 2pt)
#set line(stroke: 0.5mm)

#rect(
  width: 24cm,
  height: 13cm,
  fill: white,
  inset: 0cm,
)[
  #rect(
    width: 26cm,
    height: 9cm,
    fill: ugbl,
    inset: (left: 0.5cm, bottom: 0.75cm),
  )[
    #align(bottom)[
      #text(
        size: 48pt,
        fill: white,
      )[Publication Workflows]

      #text(
        size: 12pt,
        fill: white,
      )[
        `toon.verstraelen@ugent.be`

        Center for Molecular Modelling \
        Department of Physics and Astronomy \
        Ghent University
      ]
    ]
  ]
  #grid(
    columns: (auto, auto, 1fr),
    align: right + bottom,
    gutter: 0.75cm,
    image("static/logo-ugent.svg"),
    image("static/logo-cmm.svg"),
    box(
      inset: (top: -0.4cm),
      image("static/qr.svg", height: 3.5cm)
    ),
  )
] <title>
#pause

#rect(
  width: 24cm,
  height: 13cm,
  fill: white,
  inset: 0cm,
  align(
    center + horizon,
    circle(
      radius: 3cm,
      fill: ugbl,
      text(
        size: 36pt,
        fill: white,
      )[Why ?]
    )
  )
) <why>
#up(<title>, offset: 1)
#pause

= 1) Research is more than "findings"
#up(<why>, offset: 1)
#pause

#v(0.75cm)
A good article is #text(fill: uggr)[*informative*] ...
#pause

#h(1fr) ... but preserves #text(fill: ugcr)[*only a small fraction*] of the work.
#pause

#v(1.5cm)
#text(fill: uggr)[*Wait!*] We upload (all) data to XYZ ...
#pause

#h(1fr) ... but data in itself is #text(fill: ugcr)[*not actionable*].
#pause

#align(center, image("static/zenodo.png", width: 18cm)) <zenodo>

If data reuse requires #text(fill: ugcr)[*decisions & reverse-engineering*] ...

- Did you reproduce the work?

- Have you done it differently?

Can we make this process #text(fill: uggr)[*more efficient*]?
#pause

#up(<zenodo>)
#pause

#up(<zenodo>, dy: 10cm)
#pause

#up(<zenodo>, dy: 20cm)
#pause

#up(<zenodo>, dy: 30cm)
#pause

#up(<zenodo>, dy: 40cm)
#pause

#up(<zenodo>, dy: 50cm)
#pause

= 2) Authentic research is under threat <m2>
#up(<zenodo>, offset: 1, dy: 6cm)
#pause

*Just one example...*

R. Aquarius, E. M. Bik, D. Bimler, M.P. Oksvold and K. Patrick \
#link("https://doi.org/10.1080/21655979.2025.2542668")["Tackling paper mills requires us to prevent future contamination and clean up the past – the case of the journal #highlight[Bioengineered]"] (2025) <beref>
#pause

#alter(2)
#only("1", align(
  center,
  image("built/bioengineered1.svg")
))
#only("2", align(
  center,
  image("built/bioengineered2.svg")
))<beplots>
#up(<beref>, offset: 1)
#pause

#up(<beref>, offset: 2)

= Motivation for this work
#v(3cm)
#align(center, text(size: 36pt, fill: ugbl)[1) Increase reproducibility])
#pause

#v(2cm)
#align(center, text(size: 36pt, fill: ugbl)[2) Save science 😉])
<motivation>
#pause

#v(0.5cm)
#block(width: 24cm, height: 13cm, {
  let r1a = 4.2
  let r1b = 5.6
  let r2a = 0.7
  let r2b = 1.0
  place(center + horizon, text(size: 36pt)[What ?])

  let rng = gen-rng-f(2)
  let r = 0
  let color = ugye
  for i in range(0, 12) {
    let angle = (i - 1) / 12 * 360deg
    (rng, r) = uniform-f(rng, low: r1a, high: r1b)
    let x = calc.cos(angle) * r * 1cm
    let y = calc.sin(angle) * r * 1cm
    (rng, r) = uniform-f(rng, low: r2a, high: r2b)
    place(
      center + horizon,
      dx: x,
      dy: y,
      circle(radius: r * 1cm, fill: color)
    )
    color = ugbl
  }
}) <what>
#up(<motivation>, offset: 1, dy: 0.5cm)
#pause

= Publication workflow graph
#up(<what>, offset: 1)
#alter(2)
#only("1", align(center, image("static/dataflow1.svg")))
#only("2", align(center, image("static/dataflow2.svg")))
#pause

= Goals

#v(1cm)

#let accent(it) = text(fill: ugbl, weight: "bold")[#it]

1. #accent[Automate] the workflow

  - From raw data ...

  - ... to ZIP file with article

2. Share and build the workflow #accent[while authoring], not a posteriori

3. Publish the workflow #accent[alongside the article]

4. Make the workflow #accent[executable and reusable]
#up(<what>, offset: 2)
#pause

= Publication workflow graph
#up(<what>, offset: 3)
#alter(2)
#only("1", align(center, image("static/dataflow3.svg")))
#only("2", align(center, image("static/dataflow2.svg")))
#pause

#block(clip: true, width: 26cm, height: 14cm, outset: 1cm, {
  let r1 = 3.5
  let r2a = 0.7
  let r2b = 1.0
  place(center + horizon, text(size: 36pt)[How ?])

  let rng = gen-rng-f(2)
  let r = 0
  let angle = 90deg
  let color = ugbl
  for i in range(0, 113) {
    angle = angle + 2 / r1 * 60deg
    let x = calc.cos(angle) * r1 * 1cm
    let y = calc.sin(angle) * r1 * 1cm
    (rng, r) = uniform-f(rng, low: r2a, high: r2b)
    place(
      center + horizon,
      dx: x,
      dy: y,
      circle(radius: r * 1cm, fill: if (i == 42) { ugye } else { color })
    )
    r1 = r1 + 0.8 / r1
    color = color.lighten(1%)
  }
}) <how>
#up(<what>, offset: 4)
#pause

#v(1cm)
= Jupyter Notebooks <jupyter>
#up(<what>, offset: 5, dy: 1cm)

#let playbutton() = {
  box(
    inset: (right: 2mm),
    polygon(fill: white, (0cm, 0cm), (0.5cm, 0.3cm), (0cm, 0.6cm))
  )
}

#let showjupy(nblock: 5, play: false, logo: false, order: false) = {
  let rng = gen-rng-f(2)
  let height_cm = 2.5
  align(center, box(stroke: 0.5mm, inset: 2mm, height: 15cm, grid(
    columns: 1,
    align: center + horizon,
    gutter: 2mm,
    ..for iblock in range(0, nblock) {
      let is_code = calc.rem(iblock, 2) == 0
      let color = if is_code { ugbr } else { ugga }
      if order {
        color = color.lighten(50%)
      }
      (rng, height_cm) = uniform-f(rng, low: 1, high: 2)

      (
        rect(width: 10cm, height: height_cm * 1cm, fill: color, radius: 2mm,
          if is_code [
            #if play { playbutton() }
            #text(size: 24pt, fill: white)[Code]
          ] else [
            #text(size: 24pt, fill: white)[Text]
          ]
        ),
      )
    }
  )))
  if logo {
    place(
      center + horizon,
      [
        #place(
          dx: 5.5cm,
          dy: -2cm,
          image("static/jupyterhub.svg", height: 3cm)
        )
        #place(
          dx: -12.5cm,
          image("static/kaggle.svg", height: 3cm)
        )
        #place(
          dx: -11cm,
          dy: -4cm,
          image("static/colab.svg", height: 3cm)
        )
      ]
    )
  }
  if order {
    place(center + horizon, dy: -2cm, cetz.canvas({
      import cetz.draw: *
      line(
        (-3cm, 2cm),
        (-3cm, 6cm),
        stroke: 3mm + ugcr,
        mark: (pos: 0.5, end: ">", fill: ugcr, width: 9mm, length: 9mm),
      )
      line(
        (3cm, 5.5cm),
        (3cm, -2cm),
        stroke: 3mm + ugcr,
        mark: (pos: 0.5, end: ">", fill: ugcr, width: 9mm, length: 9mm),
      )
    }))
  }
}

#alter(7)
#only("1", showjupy())
#only("2", showjupy(play: true))
#only("3", showjupy(play: true, logo: true))
#only("4", showjupy(play: true, order: true))
#only("5", showjupy(play: true, nblock: 6))
#only("6", showjupy(play: true, nblock: 7))
#only("7", showjupy(play: true, nblock: 8))

#pause

= Notebook scaling issues
#up(<what>, offset: 6)
#pause

1. *Order of execution* not enforced
#pause
2. *Limited scope*, no scaling beyond a single file
#pause
3. *Impractical code reuse* from other notebooks: copy-paste
#pause
4. *Impractical* in revision control (JSON)
#pause

#v(1cm)
#link("https://marimo.io/")[Marimo] = new notebook concept that addresses 1, 3 and 4.

Other innovative approaches:
- #link("https://deepnote.com/")[Deepnote]
- #link("https://www.jetbrains.com/datalore/")[Datalore]
- #link("https://studiolab.sagemaker.aws/")[Sagemaker Studio Lab]

#pause

#v(1cm)
= First analogy: Workflow tools
#up(<what>, offset: 12, dy: 1cm)

#v(0.5cm)
#align(center, block(width: 20cm)[
  #set text(fill: white)
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    inset: 0.75cm,
    gutter: 0.75cm,
    fill: ugbl,
    [Snakemake],
    [Nextflow],
    [Airflow],
    [CWL],
    [Parsl],
    [Scoop],
    [Joblib],
    [...],
  )
])

These can model the publication workflow!
#pause

#v(1cm)
= A Document as a computation? <comput>
#up(<what>, offset: 13, dy: 1cm)

#grid(
  columns: 2,
  inset: (bottom: 0.5cm, top: 0.5cm),
  column-gutter: 0.75cm,
  text(fill: ugbl)[*Input =*],
  [Document source files (with reference to figures, tables, ...)],
  text(fill: ugbl)[*Output =*],
  [PDF, HTML, ...]
)

#pause

#align(center, block(width: 16cm)[
  #set text(fill: white)
  #grid(
    columns: (1fr, 1fr, 1fr),
    align: center + horizon,
    inset: 0.75cm,
    gutter: 0.75cm,
    fill: ugbl,
    [LaTeX],
    [Typst],
    [Pandoc],
    [(Weasyprint)],
    [(Quarto)],
    [...],
  )
])

#pause

= Second analogy: Build tools
#up(<comput>, offset: 2)

#grid(
  columns: 2,
  inset: (bottom: 0.5cm, top: 0.5cm),
  column-gutter: 0.75cm,
  text(fill: ugbl)[*Input =*],
  [Source code (`*.cpp`, `*.f`, `*.rs`, ...)],
  text(fill: ugbl)[*Output =*],
  [Executable (`*.exe`, `*.so`, `*.dll`, ...)]
)

#pause

#align(center, block(width: 24cm)[
  #set text(fill: white)
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    inset: 0.75cm,
    gutter: 0.75cm,
    fill: ugbl,
    [Make],
    [Tup],
    [Ninja],
    [Bazel],
    [Buck2],
    [Pantsbuild],
    [BuildXL],
    [...],
  )
])

These can _also_ model the publication workflow!

#pause

#v(1cm)
#grid(
  columns: (12cm, 0cm, 12cm),
  align: center + horizon,
  [= Workflow tool],
  [versus],
  [= Build tool]
)
#up(<comput>, offset: 4, dy: 1cm)
#pause

#grid(
  columns: (11cm, 2cm, 11cm),
  align: center + horizon,
  image("static/tool-workflow.svg"),
  line(start: (0cm, 0cm), end: (0cm, 4cm)),
  image("static/tool-build.svg"),
)
#up(<comput>, offset: 4, dy: 1cm)
#pause

#let sidebyside(category, left, right) = {
  grid(
    columns: (11cm, 2cm, 11cm),
    align: center + horizon,
    row-gutter: 0.75cm,
    grid.cell(colspan: 3)[
      #box(height: 0.6em, line(length: 3cm))
      #category
      #box(height: 0.6em, line(length: 3cm))
    ],
    left,
    line(start: (0cm, 0cm), end: (0cm, 3cm)),
    right,
  )
}

#v(0.75cm)
#alter(3)
#only("1", sidebyside(
  [*Storage of the current state*],
  [In memory / database],
  [Files on disk],
))
#only("2", sidebyside(
  [*Execution Mode*],
  [
    #text(fill: ugcr, weight: "bold")[Single-shot]

    Changes? \ $=>$ Rerun entire workflow.
  ],
  [
    #text(fill: uggr, weight: "bold")[Incremental]

    Changes? \ $=>$ Rerun only affected steps.
  ],
))
/*
#only("3", sidebyside(
  [*Graph size*],
  [
    $gt.approx 10^6$

    many low-cost tasks
  ],
  [
    $lt.approx 10^6$

    fewer high-cost tasks
  ],
))
*/
#only("3", sidebyside(
  [*Flexibility*],
  [
    #text(fill: uggr, weight: "bold")[Dynamic]

    Workflow determined on the fly, \
    based on earlier results
  ],
  [
    #text(fill: ugcr, weight: "bold")[Static]

    Workflow determined a priori, \
    then executed as a whole
  ],
))

#pause

= My "build tool trajectory"
#up(<comput>, offset: 7)
#v(0.75cm)

#grid(
  columns: (4cm, 19cm),
  column-gutter: 0.75cm,
  [*Dec 2020*],
  [Paid Overleaf subscription],
)
#pause
#grid(
  columns: (4cm, 19cm),
  column-gutter: 0.75cm,
  [*Dec 2022*],
  [
    Early tests with *Make*
  ],
)
#pause
#grid(
  columns: (4cm, 19cm),
  column-gutter: 0.75cm,
  [*Mar 2023*],
  [
    Canceled Overleaf
    - Replace Make by *Ninja*
    - *RepRepBuild* generator for Ninja
    - Migrated to GitHub for publications
  ],
)
#pause
#grid(
  columns: (4cm, 19cm),
  column-gutter: 0.75cm,
  [*Feb 2024*],
  [
    Started development of *StepUp*
    - #text(fill: uggr, weight: "bold")[Dynamic workflows]
    - #text(fill: uggr, weight: "bold")[Incremental execution]
  ]
)
#pause

#v(1cm)
= Live Demo
#image("built/graph_dependency.svg", width: 24cm)
#up(<comput>, offset: 11, dy: 1cm)
#pause
#up(<comput>, offset: 11, dy: 14.7cm)
#pause

= Integration with Git
#up(<comput>, offset: 13, dy: -1cm)

#v(0.75cm)

- Backup

- Collaboration

- Attribution

- Open Science

#pause

#rect(
  width: 24cm,
  height: 13cm,
  fill: ugbl,
  outset: (left: 1cm, right: 1cm, top: 0.8cm, bottom: 7cm),
  align(
    center + horizon,
    circle(
      radius: 4cm,
      fill: white,
      text(
        size: 36pt,
      )[Summary]
    )
  )
) <summary>
#up(<comput>, offset: 14)
#v(-1.5cm)
#pause

#align(center, text(size: 24pt, fill: white)[
  The *process* toward publication has *value* and is *authentic*
])
#up(<comput>, offset: 14, dy: 3cm)
#v(0.75cm)
#pause

#align(center, text(size: 24pt, fill: white)[Share this process])
#up(<comput>, offset: 14, dy: 4.5cm)
#v(0.75cm)
#pause

#align(center, text(size: 24pt, fill: white)[StepUp])
#up(<comput>, offset: 14, dy: 6cm)
#pause

#v(3cm)
#align(center, image("static/qr.svg", height: 3.5cm))
#up(<comput>, offset: 14, dy: 11.3cm)
#pause
