# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/grep.bst
- bootstrap/sed.bst
- components/doxygen.bst
- components/_private/git-minimal.bst
- components/llvm.bst  # bpf support
- components/perl.bst
- components/systemd.bst     # To properly place udev rules

depends:
- public-stacks/runtime-minimal.bst
- components/jpeg.bst
- components/libbpf.bst
- components/mesa-headers.bst

variables:
  meson-local: >-
    -Dudevdir=$(pkg-config --variable=udevdir udev)
    -Dqvidcap=disabled
    -Dqv4l2=disabled
    -Dgconv=disabled
    -Dv4l2-tracer=disabled

config:
  install-commands:
    (>):
    # Undo sbin split done by v4l-utils
    - |
      mv %{install-root}/%{prefix}/sbin/* %{install-root}%{bindir}
      rmdir %{install-root}/%{prefix}/sbin

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdvbv5.so'
        - '%{libdir}/libv4l1.so'
        - '%{libdir}/libv4l2.so'
        - '%{libdir}/libv4l2rds.so'
        - '%{libdir}/libv4lconvert.so'
        - '%{libdir}/v4l1compat.so'
        - '%{libdir}/v4l2convert.so'

sources:
- kind: git_repo
  url: git_https:git.linuxtv.org/v4l-utils.git
  track: v4l-utils-*
  ref: v4l-utils-1.32.0-0-g5a666c7ce89c00d66aa8e53c8f098a0c6c401f91
