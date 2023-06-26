kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libpulse.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

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
  url: tar_https:www.mpg123.de/download/mpg123-1.31.3.tar.bz2
  ref: 1ca77d3a69a5ff845b7a0536f783fee554e1041139a6b978f6afe14f5814ad1a
