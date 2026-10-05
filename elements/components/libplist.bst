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
  ref: 2.8.0-0-gfe3dc34dc3484006e12b403f7ceb06f0ad40b6f4
