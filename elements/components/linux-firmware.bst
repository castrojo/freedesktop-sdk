kind: manual

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- bootstrap/make.bst
- components/python3.bst
- components/which.bst
- components/rdfind.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - python3 compress.py

  install-commands:
  - make DESTDIR="%{install-root}" FIRMWAREDIR="%{indep-libdir}/firmware" install

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: '[0-9]*'
  ref: 20241210-0-gb00a7f7e525095e5aae663945253fc8c709cc084
- kind: local
  path: files/linux-firmware/compress.py
