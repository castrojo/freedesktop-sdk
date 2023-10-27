kind: script

build-depends:
- components/systemd-stage1.bst

config:
  commands:
  - |
    systemd-hwdb --usr update
    mkdir -p %{install-root}%{indep-libdir}/udev/
    mv %{indep-libdir}/udev/hwdb.bin %{install-root}%{indep-libdir}/udev/
