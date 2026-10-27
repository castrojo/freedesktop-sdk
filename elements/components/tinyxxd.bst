# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/buildsystem-make.bst

config:
  build-commands:
  - make

  install-commands:
  - install -D -m 0755 tinyxxd "%{install-root}%{bindir}/tinyxxd"
  - ln -s tinyxxd "%{install-root}%{bindir}/xxd"

public:
  bst:
    overlap-whitelist:
    - |
      %{install-root}%{bindir}/xxd

sources:
- kind: git_repo
  url: github:xyproto/tinyxxd
  track: v*
  ref: v1.3.17-0-g90fb3cd7616ec1908925a824d03030d10b5157cd
