kind: stack

depends:
- flatpak-release.bst
- bootstrap/base-sdk/image-aarch64.bst
- bootstrap/base-sdk/image-x86_64.bst
- oci/layers/toolbox-stack.bst
- oci/layers/flatpak-stack.bst
- vm/desktop/deps.bst
- components.bst
