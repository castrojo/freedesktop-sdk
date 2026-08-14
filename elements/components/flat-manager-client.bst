# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/flat-manager-client-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/ostree.bst

config:
  include-orphans: True

public:
  bst:
    integration-commands:
    - |
      flat-manager-client --help > /dev/null
