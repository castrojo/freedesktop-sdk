kind: manual

depends:
- bootstrap-import.bst

build-depends:
- components/python3.bst

config:
  build-commands:
  - python3 compress.py

  install-commands:
  - make DESTDIR="%{install-root}" FIRMWAREDIR="%{indep-libdir}/firmware" install

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: main
  ref: 20221214-0-gf3c283e198d3fb69f5183b8dea4fd32b8c3cbe76
- kind: local
  path: files/linux-firmware/compress.py
