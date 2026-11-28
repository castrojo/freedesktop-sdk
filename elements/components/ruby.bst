# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

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
  conf-local: >-
    --enable-pthread
    --enable-ipv6
    --with-compress-debug-sections=no
    --disable-rpath

sources:
- kind: anitya
  project-id: 4223
  url: tar_https:cache.ruby-lang.org/pub/ruby/{major}.{minor}/ruby-{version}.tar.xz
  ref:
    version: 4.0.10
    sha256sum: 1537f7a6003c436546ecab6b48b6e7725a9af2328f45a8af7f42f41c5df90ab8
