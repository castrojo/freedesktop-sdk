kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/doxygen.bst
- components/git-minimal.bst
- components/llvm.bst  # bpf support
- components/perl.bst
- components/systemd.bst     # To properly place udev rules

depends:
- bootstrap-import.bst
- components/jpeg.bst
- components/mesa-headers.bst
- components/libbpf.bst

variables:
  meson-local: >-
    -Dudevdir=$(pkg-config --variable=udevdir udev)
    -Dqvidcap=disabled
    -Dqv4l2=disabled
    -Dgconv=disabled

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
  ref: v4l-utils-1.26.1-0-g4aee01a027923cab1e40969f56f8ba58d3e6c0d1
