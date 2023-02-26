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
    - CVE-2022-48281

sources:
- kind: git_repo
  url: gitlab:libtiff/libtiff.git
  track: v*
  exclude:
  - '*rc*'
  ref: v4.5.0-0-g38eb7b00cb5767770017fb91743a960ffd96d774
- kind: patch
  path: patches/libtiff/tiffcrop-Correct-simple-copy-paste-error.patch
