kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/git-minimal.bst
- components/pkg-config.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    BINDIR="%{bindir}"
    MANDIR="%{mandir}"
    SYSTEMD_DIR="$(pkg-config --variable=systemd_system_unit_dir systemd)"
    CWFLAGS=""
    CHECK_RUN_DIR=0

  make-install: make -j1 %{make-install-args} install-systemd

config:
  install-commands:
    (>):
    - |
      tmpfilesdir="$(pkg-config --variable tmpfilesdir systemd)"
      install -Dm644 -t  "%{install-root}${tmpfilesdir}" extra/mdadm.conf

sources:
- kind: git_repo
  url: kernel:utils/mdadm/mdadm.git
  track: mdadm-*
  exclude:
  - mdadm-*rc*
  ref: mdadm-4.4-0-g8e56efac9afd7080bb42bae4b77cdad5f345633a
- kind: local
  path: files/mdadm
  directory: extra
