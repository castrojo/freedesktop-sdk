# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

# files/boot-keys/modules is expected to be empty, unless testing
# secure boot.
#
# This element should be overridden in the junction by downstream
# projects.
kind: import

(?):
- not prod_keys:
    sources:
    - kind: local
      path: files/boot-keys-test/modules
- prod_keys:
    sources:
    - kind: local
      path: files/boot-keys/modules

config:
  target: /keys
