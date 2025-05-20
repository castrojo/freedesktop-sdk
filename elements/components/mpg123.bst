kind: autotools

depends:
- public-stacks/runtime-minimal.bst
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
  url: tar_https:www.mpg123.de/download/mpg123-1.32.10.tar.bz2
  ref: 87b2c17fe0c979d3ef38eeceff6362b35b28ac8589fbf1854b5be75c9ab6557c
