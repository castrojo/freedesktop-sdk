# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- components/dbus.bst
- components/shadow.bst
- components/sudo.bst
- components/systemd.bst
- components/util-linux-full.bst
- oci/layers/sdk-stack.bst

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
