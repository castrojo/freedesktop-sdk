# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- oci/layers/sdk-stack.bst
- components/os-release.bst
- components/flatpak.bst
- components/flat-manager-client.bst
- components/flatpak-builder.bst
