kind: manual

depends:
- bootstrap-import.bst

build-depends:
- components/python3.bst
- components/which.bst
- components/rdfind.bst

config:
  build-commands:
  - python3 compress.py

  install-commands:
  - make DESTDIR="%{install-root}" FIRMWAREDIR="%{indep-libdir}/firmware" install

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: '[0-9]*'
  ref: 20240709-0-ge94a2a3bc8bdfc6a4a7b05eed7803b64a409c9f5
- kind: local
  path: files/linux-firmware/compress.py
