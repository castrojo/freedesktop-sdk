# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- components/_private/flat-manager-client-base.bst
- components/ostree-minimal.bst

public:
  bst:
    integration-commands:
    - |
      flat-manager-client --help > /dev/null
