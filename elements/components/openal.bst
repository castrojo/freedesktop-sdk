kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: components/libpulse.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_BUILD_TYPE=Release \
    -DALSOFT_EXAMPLES=NO

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/alrecord'
        - '%{bindir}/altonegen'
        - '%{bindir}/bsincgen'
        - '%{bindir}/makehrtf'
        - '%{bindir}/openal-info'
        - '%{libdir}/libopenal.so'

sources:
- kind: git_repo
  url: github:kcat/openal-soft.git
  ref: 1.22.2-0-gdc83d99c95a42c960150ddeee06c124134b52208
