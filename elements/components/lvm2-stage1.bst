kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libaio.bst

variables:
  conf-local: >-
    --enable-dmeventd
    --enable-cmdlib
    --enable-pkgconfig
    --with-confdir=%{sysconfdir}
    --with-staticdir=%{sbindir}
    --with-usrlibdir=%{libdir}
    --with-usrsbindir=%{sbindir}

(@):
- elements/include/lvm2-source.yml
