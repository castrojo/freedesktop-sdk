# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    -f Makefile.sharedlibrary
    INSTALL_PREFIX=%{prefix}
    LIBDIR=/%{lib}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libduktaped.so'
        - '%{libdir}/libduktape.so'

sources:
- kind: anitya
  project-id: 21345
  url: github_files:svaarala/duktape/releases/download/v{version}/duktape-{version}.tar.xz
  ref:
    version: 2.7.0
    sha256sum: 90f8d2fa8b5567c6899830ddef2c03f3c27960b11aca222fa17aa7ac613c2890
- kind: patch
  path: patches/duktape/duktape-lm.patch
