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
- kind: git_tag
  url: gnupg:libksba.git
  track: master
  ref: libksba-1.6.5-0-g7b3e4785e54280d1a13c5bc839bdc6722d898ac7
