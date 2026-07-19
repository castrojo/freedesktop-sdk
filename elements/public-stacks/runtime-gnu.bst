# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack
description: |
  Runtime environment with a typical GNU userland.

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/bash.bst
- bootstrap/coreutils.bst
