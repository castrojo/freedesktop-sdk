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
  ref: v018-0-gcda6883cade6ec67671d0c7de61e70eb992509a9
