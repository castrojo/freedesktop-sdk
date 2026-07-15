# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: import

config:
  target: /usr/lib/sysupdate.d

sources:
- kind: local
  path: files/vm/sysupdate/fdsdk-usr.conf
- kind: local
  path: files/vm/sysupdate/fdsdk-usr-verity.conf
- kind: local
  path: files/vm/sysupdate/fdsdk-kernel.conf
