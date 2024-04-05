kind: stack

depends:
- flatpak-release-repo.bst
- bootstrap/base-sdk/binary-seed-aarch64.bst
- bootstrap/base-sdk/binary-seed-x86_64.bst
- bootstrap/base-sdk/binary-seed-ppc64le.bst
- oci/layers/toolbox-stack.bst
- oci/layers/flatpak-stack.bst
- vm/desktop/deps.bst
- components.bst
