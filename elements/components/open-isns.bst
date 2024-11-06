kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Dslp=disabled
    -Dsystemddir="%{indep-libdir}/systemd"

sources:
- kind: git_repo
  url: github:open-iscsi/open-isns.git
  track: v*
  ref: v0.102-0-gc0e6d9fedc5a7041260de477fe1a8455fa074113
