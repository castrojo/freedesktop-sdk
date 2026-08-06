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
  ref: 2.7.0-0-gcf5897a71ea412ea2aeb1e2f6b5ea74d4fabfd8c
