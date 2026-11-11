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
    version: 4.0.9
    sha256sum: a8057adb39f51ad6dc3106237504c93dd792bb515837b4fe7817ae21ed7e51f4
