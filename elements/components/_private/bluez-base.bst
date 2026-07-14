# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/include/bluez.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/dbus.bst
- components/ell.bst
- components/libical.bst
- components/python3-docutils.bst
- components/python3-pygments.bst
- components/systemd.bst

variables:
  conf-local: >-
    --enable-library
    --enable-external-ell

config:
  install-commands:
    (>):
    - |
      install -Dm644 -t '%{install-root}%{sysconfdir}/bluetooth/' src/main.conf profiles/network/network.conf profiles/input/input.conf

public:
  bst:
    split-rules:
      bluez-libs:
      - '%{libdir}/libbluetooth*.so*'
      - '%{libdir}/pkgconfig/bluez.pc'
      - '%{includedir}/bluetooth/**'
      - '%{debugdir}/dwz/%{stripdir-suffix}/*'
      - '%{debugdir}%{libdir}/libbluetooth*.so*'
      - '%{sourcedir}/**'
      bluez-license:
      - "%{project_licensedir}"
      - "%{project_licensedir}/**"

  cpe:
    product: bluez
