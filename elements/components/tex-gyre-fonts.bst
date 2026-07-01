# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- public-stacks/runtime-minimal.bst

variables:
  license-files-extra: README.txt
  fontdir: '%{install-root}%{datadir}/fonts'
  confdir: '%{install-root}%{sysconfdir}/fonts'
  strip-binaries: ''

# PostScript font replacements available under the GUST Font License
# which is approved as Libre by the Fedora Project.
#
# Font-config is directly included in 30-metric-aliases.conf which declares these
# fonts as aliases for PostScript fonts.

config:
  install-commands:
  - |
    install -d -m 0755 "%{confdir}/conf.avail" "%{confdir}/conf.d" "%{fontdir}/tex-gyre"
    install -p -m 0644 ./opentype/*.otf "%{fontdir}/tex-gyre"

  - |
    install -m 0644 -p "config/30-tex-gyre.conf" "%{confdir}/conf.avail/30-tex-gyre.conf"; \
    ln -s "../conf.avail/30-tex-gyre.conf" "%{confdir}/conf.d/30-tex-gyre.conf"

  - |
    %{install-extra}

sources:
- kind: zip
  url: tar_https:mirrors.ctan.org/fonts/tex-gyre.zip
  ref: 1773c470f9e388e087b68e3426e115af2cd236845a7e05ceb25b2a503409a7a3
- kind: local
  path: files/font-conf/tex-gyre
  directory: config
