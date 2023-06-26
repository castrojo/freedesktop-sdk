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
- kind: git_repo
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: '[0-9]*'
  ref: 20230625-0-gee91452dac5abfc4c5b9827cf55e701d8c0ca678
- kind: local
  path: files/linux-firmware/compress.py
