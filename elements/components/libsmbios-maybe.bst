# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

(?):
- target_arch in ["x86_64", "i686"]:
    depends:
    - components/_private/libsmbios.bst
