# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: import

sources:
- kind: local
  path: files/vm/sysupdate/fdsdk-usr.conf
- kind: local
  path: files/vm/sysupdate/fdsdk-usr-verity.conf
- kind: local
  path: files/vm/sysupdate/fdsdk-kernel.conf

config:
  target: /usr/lib/sysupdate.d
