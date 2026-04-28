<!--
SPDX-FileCopyrightText: © 2026 Toon Verstraelen <Toon.Verstraelen@UGent.be>
SPDX-License-Identifier: CC-BY-SA-4.0
-->

![License](https://img.shields.io/github/license/reproducible-reporting/bootstrap)
[![Reproducible Reporting](https://raw.githubusercontent.com/reproducible-reporting/.github/main/profile/logo.svg)](https://github.com/reproducible-reporting)

# Talk Publication Workflows

This repository contains the source files and the [StepUp](https://reproducible-reporting.github.io/stepup-core/) workflows for the talk "Publication Workflows" presented at the Data Café on Reproducible Code and Coffee, April 28, 2024.

This repository is derived from the [Bootstrap repository](https://github.com/reproducible-reporting/bootstrap), where you can find technical details on the software setup.

## License

This repository is licensed under the [Creative Commons CC-BY-SA-4.0 License](https://creativecommons.org/licenses/by-sa/4.0/).

## How to Rebuild the HTML presentation

(These instructions have been tested on Linux.)

### Download the repo and set up the virtual environment

Clone the repository (or fork it and clone your fork):

```bash
git clone git@github.com:reproducible-reporting/2026-talk-publication-workflows.git
cd 2026-talk-publication-workflows
```

Create the Python environment with the `setup.sh` script:

```bash
./setup.sh
```

This will download and install [uv](https://docs.astral.sh/uv/)
and create a virtual environment in the `.venv` directory.

### Activate the virtual environment

A subshell is the simplest robust way to activate the environment.

```bash
./shell.sh
```

(This script is created by the `setup.sh` script.)
When you exit the subshell, you will return to your original environment.

The more traditional `source .venv/bin/activate` command is not recommended,
as it does not allow for customization.
In addition, exiting the shell offers a cleaner way to return to the original environment.

For those who prefer to use [`direnv`](https://direnv.net/), a `.envrc` file is also created that activates the environment when you `cd` into the repository.

### Rebuild the `talk.html` file

The [StepUp](https://reproducible-reporting.github.io/stepup-core/) workflow can be found in in the `talk/` subdirectory:

```bash
cd talk/
stepup boot
```
