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
  ref: libksba-1.6.4-0-g557999424ebd13e70d6fc17e648a5dd2a06f440b
