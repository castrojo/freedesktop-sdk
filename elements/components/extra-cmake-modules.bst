kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: |
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_HTML_DOCS:BOOL=OFF \
    -DBUILD_MAN_DOCS:BOOL=OFF \
    -DBUILD_QTHELP_DOCS:BOOL=OFF

sources:
- kind: git_repo
  url: github:KDE/extra-cmake-modules.git
  track: v*
  exclude:
  - '*rc*'
  ref: v6.21.0-0-gf8447eb308c27724be2bcd3a0e8c2f4bd5d9f52f
