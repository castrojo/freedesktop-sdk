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
  ref: 20240410-0-g1addd7dca2d953a5484c3e3c08dbd7dc253058dd
- kind: local
  path: files/linux-firmware/compress.py
