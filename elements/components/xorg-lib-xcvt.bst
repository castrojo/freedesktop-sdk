# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcvt.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcvt.git
  track: libxcvt-*
  ref: libxcvt-0.1.3-0-gdd8631c61465cc0de5e476c7a98e56528d62b163
