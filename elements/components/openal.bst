kind: cmake

(@):
- include/_private/cmake-recc.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
- components/libpulse.bst

variables:
  cmake-local: |
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
  track: '*.*.*'
  ref: 1.25.1-0-gc41d64c6a35f6174bf4a27010aeac52a8d3bb2c6
