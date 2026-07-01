# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: |
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS"

sources:
- kind: tar
  url: tar_https:download-mirror.savannah.gnu.org/releases/lzip/lzip-1.26.tar.gz
  ref: 641cf30961525cbe3b340cc883436c8854e9f5032f459f444de4782b621e6572
