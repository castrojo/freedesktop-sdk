kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  make-install: make %{make-install-args} install_hdrs install_lib
  local_flags: >-
    -Wno-error

sources:
- kind: git_repo
  url: github:open-iscsi/open-isns.git
  track: v*
  ref: v0.102-0-gc0e6d9fedc5a7041260de477fe1a8455fa074113
