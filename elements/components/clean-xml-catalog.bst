# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

public:
  bst:
    integration-commands:
    - |
      rm -f "%{sysconfdir}/xml/catalog"
