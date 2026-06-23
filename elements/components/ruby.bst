# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
(?):
- target_arch in ("x86_64", "aarch64"):
    build-depends:
      (>):
      - components/rust.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/zlib-ng.bst
- bootstrap/libxcrypt.bst
- components/libffi.bst
- components/gdbm.bst
- components/gmp.bst
- components/libyaml.bst
- components/openssl.bst


# Set '--with-compress-debug-sections=no' because of
# https://bugs.ruby-lang.org/issues/12934
variables:
  arch-conf: ''
  (?):
  - target_arch in ("x86_64", "aarch64"):
      arch-conf: >-
          --enable-yjit

  conf-local: >-
    --enable-pthread
    --enable-ipv6
    --with-compress-debug-sections=no
    --disable-rpath
    %{arch-conf}

sources:
- kind: tar
  url: tar_https:cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.6.tar.xz
  ref: 9c9d121fe3314ea7c801e690b9de981d2b9d12d7849db99c27482468a541ba0a
