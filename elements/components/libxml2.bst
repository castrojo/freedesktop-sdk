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
  ref: v2.14.5-0-g74f3154320df8950eceae4951975cc9dfc3a254d
- kind: patch
  path: 
    patches/libxml2/libxml2-python-in-nodeWrap-deal-with-name-is-None-case.patch
- kind: patch
  path: patches/libxml2/libxml2-xmllint-fix-xinclude-path.patch
- kind: patch
  path: 
    patches/libxml2/libxml2-xmllint-print-document-even-in-case-of-xinclude-errors.patch
