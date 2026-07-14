# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/include/lvm2-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libaio.bst
- components/systemd-libs.bst

variables:
  conf-local: >-
    --enable-dmeventd
    --enable-cmdlib
    --enable-pkgconfig
    --enable-udev_sync
    --enable-udev_rules
    --with-confdir=%{sysconfdir}
    --with-staticdir=%{sbindir}
    --with-usrlibdir=%{libdir}
    --with-usrsbindir=%{sbindir}
    --with-default-event-activation=0

config:
  configure-commands:
    (<):
    - |
      rm configure

public:
  bst:
    split-rules:
      libdevmapper:
      - '%{includedir}/libdevmapper.h'
      - '%{indep-libdir}/debug/**/libdevmapper.so**'
      - '%{datadir}/licenses/device-mapper-libs'
      - '%{datadir}/licenses/device-mapper-libs/**'
      - '%{libdir}/libdevmapper.so**'
      - '%{libdir}/pkgconfig/devmapper.pc'
