# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

description: |
  Private Hatchling build stack for bootstrapping Git without depending
  on full Git through hatch-vcs.

depends:
- public-stacks/runtime-gnu.bst
- components/_private/python3-hatch-vcs.bst
- components/python3-build.bst
- components/python3-hatchling.bst
- components/python3-installer.bst
