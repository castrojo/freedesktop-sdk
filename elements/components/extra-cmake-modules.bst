kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

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
  ref: v6.29.0-0-g42f0170593df4920068946494c6978ca7005217b
