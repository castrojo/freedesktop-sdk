# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-gnu.bst
- components/findutils.bst

variables:
  strip-binaries: ''
  license-files-extra: LICENSE fonts/LICENSE

config:
  install-commands:
  - |
    install -dm755 "%{install-root}%{datadir}/fonts/noto"
    find fonts -path '*/hinted/ttf/*.tt[fc]' \
      ! -name 'Noto*-Condensed*.ttf' \
      ! -name 'Noto*-Semi*.ttf' \
      ! -name 'Noto*-Extra*.ttf' \
      -exec install -Dm644 -t "%{install-root}%{datadir}/fonts/noto" {} +

sources:
- kind: git_repo
  url: github:notofonts/notofonts.github.io.git
  track: noto-monthly-release-*
  ref: noto-monthly-release-2026.11.01-0-g412a7edb2c8c535d1066157e5b17e661fd5591fe
