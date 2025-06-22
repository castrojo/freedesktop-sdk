kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
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

config:
  configure-commands:
    (<):
    - |
      rm configure

(@):
- elements/include/lvm2-source.yml
