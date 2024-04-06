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

sources:
- kind: git_repo
  url: github:open-iscsi/open-iscsi.git
  track: '*.*.*'
  ref: 2.1.9-0-g678c3e9232b2b7177b7131071910da14f065e037
- kind: patch
  path: patches/open-iscsi/no-werror.patch
