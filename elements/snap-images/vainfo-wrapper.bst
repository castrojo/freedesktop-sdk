# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: import
sources:
  - kind: local
    path: files/snap/vainfo-wrapper

public:
  bst:
    split-rules:
      app:
      - /vainfo-wrapper
