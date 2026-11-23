kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/cmake.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:marzer/tomlplusplus.git
  track: v*
  ref: v3.5.1-0-gefd80e03356af65c7d4e61c56ffb326b34f8d0f4
