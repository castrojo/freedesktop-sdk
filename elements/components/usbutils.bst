kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libusb.bst

variables:
  autogen: |
    cd usbhid-dump
    ./bootstrap
    cd ..
    autoreconf --install --symlink

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/gregkh/usbutils.git
  track: master
  ref: v016-0-g5148e86d09f9f1b1c44587d014e5bcee3bb8c26e
