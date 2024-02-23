kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libvdpau.bst

variables:
  autogen: autoreconf -fvi

(@): elements/extensions/include/app.yml

sources:
- kind: git_repo
  url: freedesktop:vdpau/vdpauinfo.git
  track: vdpauinfo-*
  ref: vdpauinfo-1.3-0-g0bc58c03e61e038ba3b81dfff36cc35cadfae447

