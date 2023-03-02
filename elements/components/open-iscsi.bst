kind: make

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst

depends:
- components/open-isns.bst
- components/kmod.bst
- components/systemd-libs.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    exec_prefix="%{prefix}"
    mandir="%{mandir}"
    etcdir="%{sysconfdir}"
    SBINDIR="%{sbindir}"
    LIB_DIR="%{libdir}"

  make: make %{make-args}
  make-install: make %{make-args} -j1 install install_systemd install_udev_rules DESTDIR="%{install-root}"

config:
  install-commands:
    (>):
    - |
      chmod 0644 '%{install-root}%{indep-libdir}/systemd/system'/*
    - |
      rm %{install-root}%{sysconfdir}/iscsi/initiatorname.iscsi

sources:
- kind: git_repo
  url: github:open-iscsi/open-iscsi.git
  track: '*.*.*'
  ref: 2.1.8-0-gcc4224fc021d40020de3133410586534c5732664
- kind: patch
  path: patches/open-iscsi/no-werror.patch
