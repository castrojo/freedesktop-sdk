kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: v2.5.3-0-g210a8a5690d0da66f02d49420d7176a21ef409dc
