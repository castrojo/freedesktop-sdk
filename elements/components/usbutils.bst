kind: meson

(@):
- include/_private/meson-recc.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- components/libusb.bst
- components/systemd-libs.bst

config:
  install-commands:
    (>):
    - |
      rm -v "%{install-root}%{bindir}/lsusb.py" "%{install-root}%{mandir}/man1/lsusb.py.1"

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/gregkh/usbutils.git
  track: v*
  ref: v019-0-gd0c76b601b4b3ab9b2ab2647d604a8e3cce6d666
