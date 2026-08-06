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
  url: tar_https:www.mpg123.de/download/mpg123-1.33.7.tar.bz2
  ref: 31d0e35a4ca567ec9b5ebda6c3062bb4435d6d3eacd6ef0d95cadd7854dc03ee
