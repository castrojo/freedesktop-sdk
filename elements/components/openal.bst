kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libpulse.bst

variables:
  cmake-local: >-
    -DALSOFT_EXAMPLES=OFF

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
  track: '*.*.*'
  ref: 1.25.2-8-gdd4e07de0fe73d8c0326c4502f63e71da8ef268b
