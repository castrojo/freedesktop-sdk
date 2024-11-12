kind: cmake

(@): elements/extensions/ffmpeg-full/config.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst
- components/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: 4.0-0-g6318f223684118a2c71f67f3f4633a9e35046b00
