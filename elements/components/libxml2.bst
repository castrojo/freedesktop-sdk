kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/doxygen.bst
- components/python3-minimal.bst

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
  cpe:
    ignored:
    - CVE-2016-3709

sources:
- kind: git_repo
  url: gnome:libxml2.git
  track: v*
  ref: v2.15.1-0-gb7fa62cbe8ef0df5869e000d5b690bdedd07f33e
