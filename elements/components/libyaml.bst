# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libyaml.so'

sources:
- kind: git_repo
  url: github:yaml/libyaml.git
  track: '*.*.*'
  exclude:
  - "*rc*"
  ref: 0.2.5-0-g2c891fc7a770e8ba2fec34fc6b545c672beb37e6
