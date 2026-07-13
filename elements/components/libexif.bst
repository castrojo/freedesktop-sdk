# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexif.so'

  cpe:
    vendor: 'curtis_galloway'

sources:
- kind: git_repo
  url: github:libexif/libexif.git
  track: libexif-*
  ref: libexif-0_6_26-release-0-gb2edc5a8adf4d1b79ce9413a9c9d8f3ab871c082
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
