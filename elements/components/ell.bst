kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libell.so'

sources:
- kind: git_repo
  url: kernel:libs/ell/ell.git
  track: '*.*'
  ref: 0.82-0-g16dbfa76e93c0f1c46de13055675764836f8aeec
