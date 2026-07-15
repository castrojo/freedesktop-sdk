# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- components/_private/bpf.bst
- components/linux.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - |
    version="$(ls -1 /lib/modules | head -n1)"
    bpftool btf dump file %{indep-libdir}/modules/${version}/vmlinux format c >vmlinux.h

  install-commands:
  - |
    install -Dm644 -t "%{install-root}%{includedir}/%{gcc_triplet}/linux" vmlinux.h
