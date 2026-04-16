# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  fontdir: '%{install-root}%{datadir}/fonts'
  confdir: '%{install-root}%{sysconfdir}/fonts'
  strip-binaries: ''

config:
  install-commands:
  - |
    install -d -m0755 "%{confdir}/conf.avail" "%{confdir}/conf.d" "%{fontdir}/liberation-fonts"
    install -p -m0644 fonts/*.ttf "%{fontdir}/liberation-fonts"
    for i in config/liberation-fonts-*.conf; do
      install -p -m0644 "$i" "%{confdir}/conf.avail/59-$(basename "$i")"
      ln -s "../conf.avail/59-$(basename "$i")" "%{confdir}/conf.d/59-$(basename "$i")"
    done

  - |
    %{install-extra}

sources:
- kind: tar
  url: github_files:liberationfonts/liberation-fonts/files/7261482/liberation-fonts-ttf-2.1.5.tar.gz
  ref: 7191c669bf38899f73a2094ed00f7b800553364f90e2637010a69c0e268f25d0
  directory: fonts
- kind: local
  path: files/font-conf/liberation-fonts
  directory: config
