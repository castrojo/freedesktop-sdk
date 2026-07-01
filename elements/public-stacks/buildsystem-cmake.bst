# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

(@): elements/include/cmake-stack-common.yml

depends:
  (>):
  - components/cmake.bst
