kind: autotools

depends:
- public-stacks/runtime-minimal.bst
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
  ref: libassuan-3.0.2-0-g0f84595a4bc706d3afb969d59618244c7db3b59f
