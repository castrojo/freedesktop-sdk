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
  ref: libassuan-3.0.0-0-g0351ecfa4f35ad44684075abec153574986b11bd
