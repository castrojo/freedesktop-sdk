# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/patch.bst
- components/perl.bst

depends:
- public-stacks/runtime-minimal.bst

config:
  install-commands:
    (>):
      # Dictionaries will be installed by components/dictionaries.bst
    - |
      rm -f %{install-root}%{datadir}/hyphen/hyph_en_US.dic

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhyphen.so'

sources:
- kind: git_repo
  url: github:hunspell/hyphen.git
  track: v*.*.*
  ref: v2.8.10-0-g476ccbe1f1388e7007c4d4143ee41a063156bf88
