# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

# Freedesktop SDK CI Test Keys
# Do not use for production
kind: import

config:
  target: /boot-keys

sources:
- kind: local
  path: files/boot-keys-test/PK.key
- kind: local
  path: files/boot-keys-test/PK.crt
- kind: local
  path: files/boot-keys-test/KEK.key
- kind: local
  path: files/boot-keys-test/KEK.crt
- kind: local
  path: files/boot-keys-test/DB.key
- kind: local
  path: files/boot-keys-test/DB.crt
- kind: local
  path: files/boot-keys-test/VENDOR.crt
- kind: local
  path: files/boot-keys-test/VENDOR.key
- kind: local
  path: files/boot-keys-test/extra-kek
  directory: extra-kek
- kind: local
  path: files/boot-keys-test/extra-db
  directory: extra-db
