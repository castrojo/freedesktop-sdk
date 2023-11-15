kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/systemd-stage1.bst # Depends on udev

depends:
- components/libcbor.bst

sources:
- kind: git_tag
  url: github:Yubico/libfido2.git
  track: main
  ref: 1.14.0-0-g1a9d335c8f0e821f9eff27482fdda96e59a4f577
