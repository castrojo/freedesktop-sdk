kind: manual

depends:
- bootstrap-import.bst

build-depends:
- components/python3.bst
- components/which.bst
- components/rdfind.bst

variables:
  license-files-extra: WHENCE MIT

config:
  build-commands:
  - python3 compress.py

  install-commands:
  - make DESTDIR="%{install-root}" FIRMWAREDIR="%{indep-libdir}/firmware" install

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: '[0-9]*'
  ref: 20240909-0-g552ed9b8d523588116adf4193bb4a40813bc0fc7
- kind: local
  path: files/linux-firmware/compress.py
