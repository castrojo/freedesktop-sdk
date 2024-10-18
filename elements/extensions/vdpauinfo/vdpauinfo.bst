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
  track: "*.*"
  ref: 1.5-0-gd3c5bd63bf8878d59b22d618d2bb5116db392d28

