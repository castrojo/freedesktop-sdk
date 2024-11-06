kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/openssl.bst

variables:
  meson-local: >-
    -Dslp=disabled
    -Dsystemddir="%{indep-libdir}/systemd"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libisns.so'

sources:
- kind: git_repo
  url: github:open-iscsi/open-isns.git
  track: v*
  ref: v0.102-0-gc0e6d9fedc5a7041260de477fe1a8455fa074113
