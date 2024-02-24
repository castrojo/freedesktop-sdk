kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libgpg-error.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: components/texinfo.bst
  type: build

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
  url: gnupg:libksba.git
  track: libksba-*
  ref: libksba-1.6.6-0-g3a4382259c3c6e7ef38cd33626fe2c1da282f816
