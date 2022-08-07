kind: autotools

depends:
- bootstrap-import.bst
- components/jpeg.bst
- components/lzip.bst
- components/libwebp.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

variables:
  autogen: autoreconf -fvi

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
      mv "%{install-root}%{includedir}/tiffconf.h" "%{install-root}%{includedir}/%{gcc_triplet}/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtiff.so'
        - '%{libdir}/libtiffxx.so'
  cpe:
    patches:
    - CVE-2022-2056
    - CVE-2022-2057
    - CVE-2022-2058
    - CVE-2022-34526

sources:
- kind: git_tag
  url: gitlab:libtiff/libtiff.git
  track: master
  exclude:
  - '*rc*'
  ref: v4.4.0-0-gb6a17e567f143fab49734a9e09e5bafeb6f97354
- kind: patch
  path: patches/libtiff/fix-the-FPE-in-tiffcrop-415-427-and-428.patch
- kind: patch
  path: patches/libtiff/CVE-2022-34526.patch
