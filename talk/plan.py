#!/usr/bin/env python3
# SPDX-FileCopyrightText: © 2026 Toon Verstraelen <Toon.Verstraelen@UGent.be>
# SPDX-License-Identifier: CC-BY-SA-4.0

from stepup.core.api import glob, mkdir, runpy, runsh, static
from stepup.reprep.api import compile_typst

# Static files
static("talk.typ", "static/")
glob("static/*")

# A few steps to build the HTML
mkdir("built")
runpy(
    "make_plots.py",
    inp=["make_plots.py", "bioengineered.csv", "matplotlibrc"],
    out=["../built/bioengineered1.svg", "../built/bioengineered2.svg"],
    workdir="static/",
)
runsh(
    "dot -Nfontname=FiraGo ${inp} -Tsvg -o ${out}",
    inp=["static/graph_dependency.dot"],
    out=["built/graph_dependency.svg"],
)
compile_typst(
    "talk.typ",
    "talk.html",
    typst_args=("--format=html", "--features=html"),
)
