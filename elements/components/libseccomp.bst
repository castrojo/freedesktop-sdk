kind: autotools

(@):
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gperf.bst
- (@): include/_private/gcc-for-recc.yml

runtime-depends:
- public-stacks/runtime-minimal.bst

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
  ref: v2.6.0-0-gc7c0caed1d04292500ed4b9bb386566053eb9775
