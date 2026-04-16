kind: script

build-depends:
- components/_private/systemd-stage1.bst
- bootstrap/bash.bst
- bootstrap/coreutils.bst

config:
  commands:
  - |
    systemd-hwdb --usr update
    mkdir -p %{install-root}%{indep-libdir}/udev/
    mv %{indep-libdir}/udev/hwdb.bin %{install-root}%{indep-libdir}/udev/
