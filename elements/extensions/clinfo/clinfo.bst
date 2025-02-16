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
  track: '*.*.*.*.*'
  ref: 3.0.25.02.14-0-gc57b7e73e910ca1b558415472c8192eeb75711b1
