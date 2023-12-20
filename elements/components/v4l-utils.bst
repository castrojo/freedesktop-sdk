kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/systemd.bst     # To properly place udev rules

depends:
- bootstrap-import.bst
- components/jpeg.bst

variables:
  conf-local: |
    --with-udevdir=$(pkg-config --variable=udevdir udev)

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
