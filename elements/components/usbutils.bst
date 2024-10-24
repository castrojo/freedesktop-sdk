kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/libusb.bst

config:
  install-commands:
    (>):
    - |
      rm -v "%{install-root}%{bindir}/lsusb.py" "%{install-root}%{mandir}/man1/lsusb.py.1"

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/gregkh/usbutils.git
  track: v*
  ref: v018-0-gcda6883cade6ec67671d0c7de61e70eb992509a9
