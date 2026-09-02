# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/base-sdk/m4.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage2.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

- bootstrap/gnu-config.bst

runtime-depends:
- bootstrap/glibc.bst

variables:
  common_options: "--enable-pcre2-16 --enable-pcre2-32"
  arch_options: ''
  (?):
  - (target_arch == "x86_64" or target_arch == "i686"):
      local_flags: -mshstk
  - target_arch != "riscv64":
      arch_options: "--enable-jit"

  conf-local: >-
    %{common_options}
    %{arch_options}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/pcre2-config'
        - '%{libdir}/libpcre2-8.so'
        - '%{libdir}/libpcre2-16.so'
        - '%{libdir}/libpcre2-32.so'
        - '%{libdir}/libpcre2-posix.so'

sources:
- kind: git_repo
  url: github:PCRE2Project/pcre2.git
  track: pcre2-*
  exclude:
  - '*-RC*'
  ref: pcre2-10.48-0-g7978954dbd2efc6f2196869290553cf1871b4ce6
- kind: git_module
  path: deps/sljit
  url: github:zherczeg/sljit.git
  ref: de0259c7aaf36aa40cba8014f3fad3edde9307f9
