# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: import
description: Create basic symlinks for bootstrap
sources:
- kind: local
  path: elements/bootstrap/symlinks

public:
  bst:
    split-rules:
      runtime:
        (>):
        - "/**"
