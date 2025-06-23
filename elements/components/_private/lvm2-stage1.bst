kind: autotools

(@):
- elements/include/lvm2-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
- components/libaio.bst

variables:
  notparallel: true
  conf-local: >-
    --enable-dmeventd
    --enable-cmdlib
    --enable-pkgconfig
    --with-confdir=%{sysconfdir}
    --with-staticdir=%{sbindir}
    --with-usrlibdir=%{libdir}
    --with-usrsbindir=%{sbindir}
