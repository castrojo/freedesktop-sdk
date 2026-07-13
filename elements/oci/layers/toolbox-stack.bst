# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- oci/layers/sdk-stack.bst
- components/sudo.bst
- components/shadow.bst
- components/util-linux-full.bst

public:
  bst:
    integration-commands:
    - groupadd -r wheel
    - |
      cat <<EOF >>/etc/sudoers
      %wheel ALL=(ALL) NOPASSWD: ALL
      EOF
    - mkdir -p /media
    - mkdir -p /home
    - touch /etc/machine-id
