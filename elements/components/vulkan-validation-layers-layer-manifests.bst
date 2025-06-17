kind: filter

build-depends:
- components/vulkan-validation-layers-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst

config:
  include:
  - layer-manifests
