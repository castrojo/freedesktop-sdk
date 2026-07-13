# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/buildsystem-python-flit.bst
- public-stacks/buildsystem-python-hatchling.bst
- public-stacks/buildsystem-python-poetry.bst
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-pip.bst
