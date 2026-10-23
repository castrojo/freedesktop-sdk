# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/libusb.bst
- components/systemd-libs.bst

config:
  install-commands:
    (>):
    - |
      rm -v "%{install-root}%{bindir}/lsusb.py" "%{install-root}%{mandir}/man1/lsusb.py.1"

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/gregkh/usbutils.git
  track: v*
  ref: v020-0-ged4a892fecd9991e71cfd92a2205336f8c02a73a
  version-guess-pattern: 'v(\d+)'
