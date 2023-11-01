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
  ref: v017-0-g23077bf82534baad8adfe33ce4c02b5fb087eb86
