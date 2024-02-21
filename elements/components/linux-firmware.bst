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
  ref: 20240220-0-g97b693d243f0bb464819fa3f8326edd4091032e4
- kind: local
  path: files/linux-firmware/compress.py
