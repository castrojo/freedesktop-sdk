kind: manual

build-depends:
- components/linux.bst
- components/bpf.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - |
    bpftool btf dump file /boot/vmlinux format c >vmlinux.h

  install-commands:
  - |
    install -Dm644 -t "%{install-root}%{includedir}/%{gcc_triplet}/linux" vmlinux.h
