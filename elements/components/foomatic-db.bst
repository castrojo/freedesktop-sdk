# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/cups-daemon-only.bst

variables:
  # This project uses names in makefile that do not work with build-dir
  build-dir: ''

config:
  install-commands:
    (>):
    # Cups seems not like non ppd files
    - |
      find "%{install-root}%{datadir}/cups/model/foomatic-db-ppds" -not -type d -not -name "*.ppd" -not -name "*.ppd.*" -delete

sources:
- kind: git_repo
  url: github:OpenPrinting/foomatic-db.git
  track: master
  ref: 20240504-7-g57e546cb7774c7b03e7090ced65fb1ffd552f33d
