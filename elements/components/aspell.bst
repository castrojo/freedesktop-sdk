# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/perl.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --enable-curses="-ltinfow -lncursesw"

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/pspell-config'
        - '%{libdir}/libaspell.so'
        - '%{libdir}/libpspell.so'

sources:
- kind: git_repo
  url: savannah:aspell.git
  track: rel-*
  exclude:
  - 'rel-*-*'
  ref: rel-0.60.8.2-0-g3de79d40aee4e9ccdc0d83856637949801a3d33b
