# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

(@):
- elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-make.bst
- extensions/clinfo/khronos-headers.bst

depends:
- public-stacks/runtime-gnu.bst
- components/opencl.bst

sources:
- kind: git_repo
  url: github:Oblomov/clinfo.git
  track: '*.*.*.*.*'
  ref: 3.0.25.02.14-0-gc57b7e73e910ca1b558415472c8192eeb75711b1
