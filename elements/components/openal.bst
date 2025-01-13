kind: cmake

depends:
- public-stacks/runtime-minimal.bst
- filename: components/libpulse.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

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
  ref: 1.24.2-0-gb621b5fce739525418f36e0474a46f9e1cab5e64
