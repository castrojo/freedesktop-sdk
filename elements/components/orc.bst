# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Dorc-test=disabled
    -Dexamples=disabled
    -Dbenchmarks=disabled
    -Dtests=disabled
    -Dhotdoc=disabled

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/orc'
        - '%{libdir}/liborc-0.4.so'

sources:
- kind: git_repo
  url: freedesktop:gstreamer/orc.git
  track: '*.*.*'
  ref: 0.4.42-0-g141218e37a1da2ffa1f3f1c996092f61782f3235
