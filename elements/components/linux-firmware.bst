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
  ref: 20230210-0-gbf4115c1aa2bee686ec675595271da50611684b5
- kind: local
  path: files/linux-firmware/compress.py
