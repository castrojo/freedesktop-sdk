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
    - CVE-2024-7006

sources:
- kind: git_repo
  url: gitlab:libtiff/libtiff.git
  track: v4.6.*
  exclude:
  - '*rc*'
  ref: v4.6.0-0-g8b20804fc0ddeaa93667b799b5e1a2a7dc9e3fb2
- kind: patch
  path: patches/libtiff/0001-CVE-2024-7006.patch
