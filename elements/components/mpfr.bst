kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/gmp.bst

sources:
- kind: tar
  url: ftp_gnu_org:mpfr/mpfr-4.2.2.tar.xz
  ref: b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01
