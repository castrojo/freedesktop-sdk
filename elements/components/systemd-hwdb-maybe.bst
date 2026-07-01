# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

(?):
- target_arch != "ppc64le":
    depends:
    - components/_private/systemd-hwdb.bst
