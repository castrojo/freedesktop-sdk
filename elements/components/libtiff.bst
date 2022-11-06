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

sources:
- kind: git_tag
  url: gitlab:libtiff/libtiff.git
  ref: v4.3.0-0-gd21dcc67d0d3f4686ee989a085ad2bea9c58259d
