# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/flex.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/pcre2.bst
  config:
    location: '%{sysroot}'

runtime-depends:
- bootstrap/pcre2.bst

environment:
  USE_PCRE2: y
  LIBDIR: '%{libdir}'
  SHLIBDIR: '%{libdir}'
  CC: '%{triplet}-gcc'
  PKG_CONFIG_PATH: '%{sysroot}%{libdir}/pkgconfig'

variables:
  notparallel: True
  command-subdir: libsepol

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}/%{libdir}/libsepol.a"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsepol.so'

sources:
- kind: git_repo
  url: github:SELinuxProject/selinux.git
  track: libsepol-*
  exclude:
  - '*rc*'
  ref: libsepol-3.11-0-g2233a23a4d4f1bf29054037babec13f30d038e65
