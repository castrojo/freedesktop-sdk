kind: filter

build-depends:
- components/vulkan-validation-layers-base.bst

runtime-depends:
- bootstrap-import.bst
- components/vulkan-validation-layers-manifest.bst
- components/wayland.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-xrandr.bst

config:
  exclude:
  - layer-manifests
  include-orphans: true
