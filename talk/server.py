#!/usr/bin/env python3
# SPDX-FileCopyrightText: © 2026 Toon Verstraelen <toon.verstraelen@ugent.be>
# SPDX-License-Identifier: CC-BY-SA-4.0

from livereload import Server

HTML = "talk.html"
server = Server()
server.watch(HTML)
server.serve(root=".", default_filename=HTML, open_url_delay=0.5)
