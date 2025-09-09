kind: autotools

build-depends:
- components/python3-minimal.bst
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
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
  track: v2.13.*
  ref: v2.13.9-0-g04af2cabb9f859c198b8a553c028a87481199410
- kind: patch
  path: 
    patches/libxml2/libxml2-python-in-nodeWrap-deal-with-name-is-None-case.patch
- kind: patch
  path: 
    patches/libxml2/0001-CMAKE_CURRENT_LIST_DIR-is-usr-lib-arch-triplet-cmake.patch
