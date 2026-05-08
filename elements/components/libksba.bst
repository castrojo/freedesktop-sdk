kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libgpg-error.bst

variables:
  conf-local: |
    --enable-maintainer-mode

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/ksba-config'
        - '%{libdir}/libksba.so'

sources:
- kind: git_repo
  url: github:gpg/libksba.git
  track: libksba-*
  ref: libksba-1.7.0-0-g941eed831904fb7b3a4d7a3ed55a6842cf6db478
