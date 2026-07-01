# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gperf.bst

depends:
- public-stacks/runtime-minimal.bst
- components/expat.bst
- components/freetype.bst

variables:
  meson-local: >-
    -Dtests=disabled
    -Dcache-build=disabled
    -Ddoc=disabled
    -Dtemplate-dir="%{sysconfdir}/fonts/conf.avail"
    -Dxml-backend="expat"
    -Dcache-dir="%{indep-libdir}/fontconfig/cache"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfontconfig.so'

    integration-commands:
    - |
      if [ -d "%{datadir}/fonts" ]; then
        touch -d @0 "%{datadir}/fonts" /usr/share/fonts/*
        fc-cache -rs
      fi

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: freedesktop:fontconfig/fontconfig.git
  track: '*.*.*'
  exclude:
  - 2.*.9*
  ref: 2.18.1-0-gd87ec67db56518e9e9c36ff38f151dfc9b728b2e
