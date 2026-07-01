# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst

config:
  build-commands:
    (<):
      # This is a workaround for a bug with parallel builds.
    - |
      cd "%{build-dir}"
      make -j1 arch/misc

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:groff/groff-1.24.1.tar.gz
  ref: 74e2819795b6aff431aeac983d63a9c8968eeaba2a2eba7df8ba4c7b41e7cfd8
