kind: make

(@):
- elements/extensions/include/app.yml

build-depends:
- extensions/clinfo/khronos-headers.bst
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/opencl.bst

sources:
- kind: git_repo
  url: github:Oblomov/clinfo.git
  track: '*.*.*.*.*'
  ref: 3.1.26.09.26-0-g0cb539d22d6e47ec4d635c8a2173d21cab600c3b
