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
    install -d -m0755 "%{confdir}/conf.avail" "%{confdir}/conf.d" "%{fontdir}/gnu-free"
    install -p -m0644 fonts/*.ttf "%{fontdir}/gnu-free"
    for i in config/gnu-free-*.conf; do
      install -p -m0644 "$i" "%{confdir}/conf.avail/69-$(basename "$i")"
      ln -s "../conf.avail/69-$(basename "$i")" "%{confdir}/conf.d/69-$(basename "$i")"
    done

  - |
    %{install-extra}

sources:
- kind: zip
  url: ftp_gnu_org:freefont/freefont-ttf-20120503.zip
  ref: 7c85baf1bf82a1a1845d1322112bc6ca982221b484e3b3925022e25b5cae89af
  directory: fonts
  version-guess-pattern: '\d{8}'
- kind: local
  path: files/font-conf/gnu-free-fonts
  directory: config
