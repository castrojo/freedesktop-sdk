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

config:
  install-commands:
    (>):
    - |
      %{delete_libtool_files}

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
- kind: git_tag
  url: gnome:libxml2.git
  track: master
  track-extra:
  - '2.10'
  ref: v2.10.3-0-gf507d167f1755b7eaea09fb1a44d29aab828b6d1
- kind: patch
  path: patches/libxml2/libxml2-python-in-nodeWrap-deal-with-name-is-None-case.patch
- kind: patch
  path: patches/libxml2/libxml2-python3-unicode-errors.patch
- kind: patch
  path: patches/libxml2/Migrate-away-from-deprecated-API.patch
