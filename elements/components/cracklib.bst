# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/curl.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/zlib-ng.bst

runtime-depends:
- bootstrap/grep.bst # needed for create-cracklib-dict

variables:
  autogen: |
    cd src
    autopoint -f
    cd m4
    echo EXTRA_DIST = *.m4 > Makefile.am
    cd ..
    autoreconf -f -v -i
    cd ..
  conf-cmd: src/configure
  conf-local: >-
    --without-python

public:
  bst:
    integration-commands:
    - |
      rm -f "%{datadir}/cracklib/pw_dict"{,.pwd,.pwi}
      "%{sbindir}/create-cracklib-dict" -o "%{datadir}/cracklib/pw_dict" "%{datadir}/cracklib/cracklib-small"

    split-rules:
      devel:
        (>):
        - '%{libdir}/libcrack.so'

sources:
- kind: git_repo
  url: github:cracklib/cracklib.git
  track: v*
  ref: v2.10.4-gpg-0-g246592be1a654624965630b748ab4f1ac044f513
