kind: autotools

build-depends:
- components/python3.bst
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/icu.bst

variables:
  conf-local: >-
    --with-icu
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
  track: v2.11.*
  ref: v2.11.7-0-g8711320065405c4bb08aaccd4bd2881450b5ce41
- kind: patch
  path: patches/libxml2/libxml2-python-in-nodeWrap-deal-with-name-is-None-case.patch
