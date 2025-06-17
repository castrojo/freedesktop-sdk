kind: stack
description: |
    Stack of elements that create layer manifests in
    datadir/vulkan/{explicit_layer.d,implicit_layer.d,icd.d}. This
    stack is included in `extensions/mesa/mesa.yml` and the layer
    manifests are copied to the search path which vulkan-icd-loader
    is configured to look at.

depends:
- components/vulkan-validation-layers-layer-manifests.bst
