# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  build-dir: ""

  # Nonstandard configure, override plugin default
  conf-args: >-
    --prefix=%{prefix}
    --includedir=%{includedir}
    --libdir=%{libdir}
    --libdevdir=%{libdir}
    --mandir=%{mandir}
    --datadir=%{datadir}

  make-args: "src"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liburing-ffi.so'
        - '%{libdir}/liburing.so'

sources:
- kind: git_repo
  url: github:axboe/liburing.git
  track: liburing-*
  exclude:
  - '*rc*'
  ref: liburing-2.15-0-gd41bf9220ec39277ff235379e9089d9e0fd6c2a5
