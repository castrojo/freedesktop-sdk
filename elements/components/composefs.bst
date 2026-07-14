# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/go-md2man.bst

depends:
- public-stacks/runtime-minimal.bst
- components/fuse3.bst
- components/openssl.bst

config:
  install-commands:
    (>):
    - find "%{install-root}" -name "lib*.a" -delete

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}'
        - '%{bindir}/**'
        - '%{libdir}/libcomposefs.so'

sources:
- kind: git_repo
  url: github:containers/composefs.git
  track: v*
  ref: v1.0.8-0-g858ce1b38e1534c2602eb431124b5dca706bc746
