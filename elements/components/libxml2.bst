kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- components/python3.bst
- public-stacks/buildsystem-autotools.bst

variables:
  conf-local: >-
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
  ref: v2.9.12-0-gb48e77cf4f6fa0792c5f4b639707a2b0675e461b
- kind: patch
  path: patches/libxml2/libxml2-python-in-nodeWrap-deal-with-name-is-None-case.patch
- kind: patch
  path: patches/libxml2/libxml2-python3-unicode-errors.patch
- kind: patch
  path: patches/libxml2/Migrate-away-from-deprecated-API.patch
