kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/zlib.bst
- bootstrap/xz.bst
- components/icu.bst

variables:
  conf-local: >-
    --with-icu
    --with-http
    --with-zlib
    --with-lzml
    --with-python=%{bindir}/python3
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
  ref: v2.14.6-0-gd23960a130c5bb82779c9405fbbf85e65fb3c57c
