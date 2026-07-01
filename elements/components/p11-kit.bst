# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/sed.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libtasn1.bst
- components/libffi.bst

variables:
  meson-local: >-
    -Dsystemd=disabled
    -Dbash_completion=disabled
    -Dtrust_paths=%{sysconfdir}/pki/ca-trust/source:%{datadir}/pki/ca-trust-source

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libp11-kit.so'

sources:
- kind: git_repo
  url: github:p11-glue/p11-kit.git
  track: '*.*.*'
  ref: 0.26.2-0-g8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef
- kind: git_module
  path: subprojects/pkcs11-json
  url: github:p11-glue/pkcs11-json.git
  ref: 6d56219d6cd640f3629fb621b01068d7e768efc6
