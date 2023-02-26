kind: autotools

build-depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
- filename: components/gperf.bst

runtime-depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libseccomp.so'

sources:
- kind: git_repo
  url: github:seccomp/libseccomp.git
  track: v*
  ref: v2.5.4-0-gf33f95014b36f97b42f0c2290e96d5c31647ed10
