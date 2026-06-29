# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- components/bootc.bst
- components/dosfstools.bst
- components/systemd.bst
- oci/bootc-integration/bootc-config.bst
- oci/minimal-oci.bst
- vm/config/sudo.bst
- vm/config/useradd-ostree.bst
