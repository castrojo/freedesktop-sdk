# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- public-stacks/runtime-minimal.bst

variables:
  license-files-extra: OFL.txt
  fontdir: '%{install-root}%{datadir}/fonts'
  confdir: '%{install-root}%{sysconfdir}/fonts'
  fontname: google-crosextra-carlito
  strip-binaries: ''

config:
  install-commands:
  - |
    install -d -m 0755 "%{confdir}/conf.avail" "%{confdir}/conf.d" "%{fontdir}/%{fontname}"
    install -p -m 0644 ./fonts/ttf/*.ttf "%{fontdir}/%{fontname}"
    install -p -m 0644 "config/%{fontname}.conf" "%{confdir}/conf.avail/62-%{fontname}.conf"
    ln -s "../conf.avail/62-%{fontname}.conf" "%{confdir}/conf.d/62-%{fontname}.conf"

  - |
    install -m 0644 -p "config/30-0-%{fontname}.conf" "%{confdir}/conf.avail/30-0-%{fontname}.conf"; \
    ln -s "../conf.avail/30-0-%{fontname}.conf" "%{confdir}/conf.d/30-0-%{fontname}.conf"

  - |
    %{install-extra}

sources:
- kind: git_repo
  url: github:googlefonts/carlito.git
  track: main
  ref: 3a810cab78ebd6e2e4eed42af9e8453c4f9b850a
- kind: local
  path: files/font-conf/google-crosextra-carlito
  directory: config
