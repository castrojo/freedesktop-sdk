# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: import
description: Create basic symlinks for bootstrap

public:
  bst:
    split-rules:
      runtime:
        (>):
        - "/**"

sources:
- kind: local
  path: elements/bootstrap/symlinks
