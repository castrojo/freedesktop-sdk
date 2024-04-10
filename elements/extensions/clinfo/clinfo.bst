kind: manual

(@): elements/extensions/include/app.yml

depends:
- filename: bootstrap-import.bst
- filename: components/opencl.bst
- filename: extensions/clinfo/khronos-headers.bst
  type: build

config:
  build-commands:
  - make
  install-commands:
  - make -j1 PREFIX=%{install-root}%{prefix} install

sources:
- kind: git_repo
  url: github:Oblomov/clinfo.git
  track: '*.*.*.*'
  ref: 3.0.23.01.25-0-g748c3930a9b9cb826e631d77439e2cb8f84f5bcf
