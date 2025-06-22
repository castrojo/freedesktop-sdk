kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/jpeg.bst
- components/lzip.bst
- components/libwebp.bst

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
  ref: v4.7.0-0-g9dff73bebc5661f2dace6f16e14cf9e857172f4e
