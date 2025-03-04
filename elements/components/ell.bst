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
  ref: 0.74-0-g1601d77408d9f3e546d742906ecc06fd9517077c
