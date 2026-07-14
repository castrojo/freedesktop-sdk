# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  # Using build-dir is documented not to be supported. Don't try.
  build-dir: ''
  notparallel: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libslang.so'

sources:
- kind: tar
  url: tar_https:www.jedsoft.org/releases/slang/slang-2.3.3.tar.bz2
  ref: f9145054ae131973c61208ea82486d5dd10e3c5cdad23b7c4a0617743c8f5a18
