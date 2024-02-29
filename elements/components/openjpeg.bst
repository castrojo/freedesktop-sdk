kind: cmake

build-depends:
- filename: public-stacks/buildsystem-cmake.bst

depends:
- filename: bootstrap-import.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_STATIC_LIBS=OFF
    -DOPENJPEG_INSTALL_LIB_DIR=%{lib}
  local_flags: -fvisibility=hidden

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libopenjp2.so'
        - '%{libdir}/openjpeg-2.5'
        - '%{libdir}/openjpeg-2.5/**'
  cpe:
    ignored:
    - CVE-2016-7163
    - CVE-2016-9675

sources:
- kind: git_repo
  url: github:uclouvain/openjpeg.git
  track: v2.*.*
  ref: v2.5.2-0-g39e8c50a2f9bdcf36810ee3d41bcbf1cc78968ae
