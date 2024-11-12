kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  make-install: make -j1 install install_hdrs install_lib DESTDIR="%{install-root}"
  local_flags: >-
    -Wno-error

sources:
- kind: git_repo
  url: github:open-iscsi/open-isns.git
  track: v*
  ref: v0.103-0-g3e053e2a2c83293db7167f336940fec51f32fed7
