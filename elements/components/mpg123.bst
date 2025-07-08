kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libpulse.bst

variables:
  conf-local: |
    --with-default-audio=pulse \
    --with-audio=pulse

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}"/*

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libout123.so'
        - '%{libdir}/libmpg123.so'
        - '%{libdir}/libsyn123.so'

sources:
- kind: tar
  url: tar_https:www.mpg123.de/download/mpg123-1.33.0.tar.bz2
  ref: 2290e3aede6f4d163e1a17452165af33caad4b5f0948f99429cfa2d8385faa9d
