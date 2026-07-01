# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Dslp=disabled
    -Dsystemddir="%{indep-libdir}/systemd"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libisns.so'

sources:
- kind: git_repo
  url: github:open-iscsi/open-isns.git
  track: v*
  ref: v0.103-0-g3e053e2a2c83293db7167f336940fec51f32fed7
