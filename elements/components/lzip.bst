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
- kind: anitya
  project-id: 1866
  url: tar_https:download-mirror.savannah.gnu.org/releases/lzip/lzip-{version}.tar.gz
  ref:
    version: 1.26
    sha256sum: 641cf30961525cbe3b340cc883436c8854e9f5032f459f444de4782b621e6572
