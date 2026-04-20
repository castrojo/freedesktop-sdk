kind: cmake

(@): elements/extensions/ffmpeg-full/config.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst
- components/git-minimal.bst

depends:
- bootstrap-import.bst

variables:
  conf-root: "source"

  cmake-local: >-
    -DLIB_INSTALL_DIR="%{prefix}"
    -DENABLE_SHARED=ON
    -DENABLE_CLI=OFF

config:
  install-commands:
    (>):
    - find "%{install-root}%{prefix}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: git_https:bitbucket.org/multicoreware/x265_git.git
  track: '*.*'
  exclude:
  - "*rc*"
  ref: 4.2-0-ge444744c03978c1fb4e037168967020cf2648427
