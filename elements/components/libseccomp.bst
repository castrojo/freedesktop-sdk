kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gperf.bst

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
  ref: v2.6.1-0-ga81cc2de8ee7a33633defc88bb8a2d986b421613
