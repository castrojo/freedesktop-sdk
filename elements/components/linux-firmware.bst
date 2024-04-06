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
  ref: 20240312-0-g3b128b6069267b60a46a4074c383183177ee6e6d
- kind: local
  path: files/linux-firmware/compress.py
