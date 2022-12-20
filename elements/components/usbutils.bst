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
- kind: git_repo
  url: kernel:linux/kernel/git/gregkh/usbutils.git
  track: v*
  ref: v015-0-g79b796f945ea7d5c2b0e2a74f9b8819cb7948680
