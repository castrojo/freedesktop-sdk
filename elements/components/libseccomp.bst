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
- kind: git_tag
  url: github:seccomp/libseccomp.git
  track: release-2.5
  ref: v2.5.5-0-gf0b04ab0b4fc0bc2cde6da1f407b4a487fe6d78f
