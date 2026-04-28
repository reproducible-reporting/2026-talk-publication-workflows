#!/usr/bin/env python3

import matplotlib as mpl
import matplotlib.pyplot as plt
import pandas as pd

UGBL = "#1e64c8"
UGGR = "#2ca02c"
UGCR = "#d62728"

mpl.rc_file("matplotlibrc")
df = pd.read_csv("bioengineered.csv")


def plot1():
    fig, ax = plt.subplots()
    ax.bar(df["year"], df["published"], color=UGBL, label="Articles in Bioengineered")
    ax.set_xlabel("Year")
    ax.set_ylabel("Count")
    ax.legend()
    fig.savefig("../built/bioengineered1.svg")


def plot2():
    fig, ax = plt.subplots()
    ax.bar(df["year"], df["sampled"], color=UGGR, label="Sampled (mouse OR mice OR rat OR rats)")
    ax.bar(df["year"], df["problematic"], color=UGCR, label="Problematic")
    ax.set_xlabel("Year")
    ax.set_ylabel("Count")
    ax.legend()
    fig.savefig("../built/bioengineered2.svg")


plot1()
plot2()
