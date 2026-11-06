# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --without-cython

public:
  cpe:
    vendor: 'libimobiledevice'
    product: 'libplist'
    ignored:
    - CVE-2017-5836   # Patch consumed in releases since
    - CVE-2017-5835   # Patch consumed in releases since
    - CVE-2017-5834   # Patch consumed in releases since

sources:
- kind: git_repo
  url: github:libimobiledevice/libplist.git
  track: '*.*.*'
  ref: 2.8.1-0-g678b1a34693b86ae1787fa470dcb7203ffd0ef3f
