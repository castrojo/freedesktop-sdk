# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst

variables:
  make-args: >-
    PREFIX="%{prefix}" CC=gcc ZFLAGS='-b fat'

config:
  install-commands:
    (>):
    # We're really only interested in the timezone data
    - |
      rm -rf "%{install-root}%{bindir}"
    - |
      rm -rf "%{install-root}/etc"
    - |
      rm -rf "%{install-root}%{indep-libdir}"
    - |
      rm -rf "%{install-root}%{prefix}/sbin"

  # Man pages are provided by Linux's man-pages
  # sdk/elements/components/man-pages.bst
    - |
      rm -rf "%{install-root}%{mandir}"

  # Set up a default timezone, for when Flatpak can't use the host one
    - |
      mkdir -p "%{install-root}%{sysconfdir}"
    - |
      ln -sf "%{datadir}/zoneinfo/UTC" "%{install-root}%{sysconfdir}/localtime"

sources:
- kind: git_repo
  url: github:eggert/tz.git
  track: 20*
  ref: 2026e-0-g039ef27cc5f062a2055cb67435d6d71adbefd27d
  version-guess-pattern: '^\d{4}[a-z]'
