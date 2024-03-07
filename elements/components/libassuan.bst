kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libgpg-error.bst
- filename: public-stacks/buildsystem-autotools.bst
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
        - '%{bindir}/libassuan-config'
        - '%{libdir}/libassuan.so'

sources:
- kind: git_repo
  url: gnupg:libassuan.git
  track: libassuan-*
  exclude:
  - '*-base'
  ref: libassuan-2.5.7-0-gcc2f776904e0b5e56e2b81b2672ca98d7787ed1b
