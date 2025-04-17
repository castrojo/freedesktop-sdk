kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/libflac.bst
- components/libogg.bst
- components/libvorbis.bst
- components/opus.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsndfile.so'
  cpe:
    product: libsndfile
    patches:
    - CVE-2024-50612

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DBUILD_SHARED_LIBS=ON
    -DENABLE_EXTERNAL_LIBS=ON
    -DBUILD_TESTING=OFF
    -DBUILD_PROGRAMS=OFF
    -DBUILD_EXAMPLES=OFF


sources:
- kind: git_repo
  url: github:libsndfile/libsndfile.git
  track: '*.*.*'
  exclude:
  - "*beta*"
  ref: 1.2.2-0-g72f6af15e8f85157bd622ed45b979025828b7001
- kind: patch
  path: patches/sndfile/0001-CVE-2024-50612.patch
