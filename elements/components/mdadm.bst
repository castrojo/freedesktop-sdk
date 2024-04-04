kind: make

build-depends:
- components/git-minimal.bst
- components/pkg-config.bst
- components/systemd.bst

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    BINDIR="%{bindir}"
    MANDIR="%{mandir}"
    SYSTEMD_DIR="$(pkg-config --variable=systemd_system_unit_dir systemd)"
    CWFLAGS=""
    CHECK_RUN_DIR=0

  make: make %{make-args}
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install install-systemd

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
  ref: mdadm-4.3-0-gd709d4161d1dd51a976147e8372fbd99ff8183bd
- kind: local
  path: files/mdadm
  directory: extra
