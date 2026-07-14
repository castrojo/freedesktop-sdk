# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- components/flat-manager-client.bst
- components/flatpak-builder.bst
- components/flatpak.bst
- components/os-release.bst
- oci/layers/sdk-stack.bst
