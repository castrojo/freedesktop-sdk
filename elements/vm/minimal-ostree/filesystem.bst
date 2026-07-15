# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose
description: "Apply split-rules to the `deps.bst` artifact.\nThe split-rules filter unwanted files from the system, such as development headers and debug symbols."

build-depends:
- vm/minimal-ostree/deps.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - tests
  - shells
  include-orphans: True
  (?):
  - ("locale" not in minimal_vm):
      exclude:
        (>):
        - locale
