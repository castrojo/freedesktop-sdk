kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/doxygen.bst
- components/_private/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/zlib-ng.bst
- bootstrap/xz.bst
- components/icu.bst

variables:
  conf-local: >-
    --with-icu
    --with-http
    --with-zlib
    --with-lzml
    --with-python
    CPPFLAGS="$(pkg-config --cflags-only-I python3)"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/xml2-config'
        - '%{libdir}/libxml2.so'
        - '%{libdir}/xml2Conf.sh'

sources:
- kind: git_repo
  url: gnome:libxml2.git
  track: v*
  ref: v2.15.3-0-gc94eb0210183b9d7cb43f8e7fddc6be55843ef49
