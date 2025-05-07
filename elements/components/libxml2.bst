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
    - CVE-2025-27113
    - CVE-2025-32414
    - CVE-2025-32415

sources:
- kind: git_repo
  url: gnome:libxml2.git
  track: v2.11.*
  ref: v2.11.9-0-g954e851e1d8d1f4c1dfbdf043623b3c11a1c723c
- kind: patch_queue
  path: patches/libxml2
