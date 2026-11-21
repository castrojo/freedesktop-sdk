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
  ref: v2.6.2-0-g72d90906ebcc6a2706868d58404e10a3086ed142
