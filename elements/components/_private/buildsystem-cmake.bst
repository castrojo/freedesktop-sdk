# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

description: |
  Private counterpart to public-stacks/buildsystem-cmake.bst. This
  should be used to bootstrap cmake itself or to resolve cyclic
  dependency chains when using final cmake or cmake stack is not
  possible.

(@): elements/include/cmake-stack-common.yml

depends:
  (>):
  - components/_private/cmake-stage1.bst
