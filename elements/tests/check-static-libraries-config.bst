# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: import

config:
  target: "%{datadir}/check-static-libraries"

sources:
- kind: local
  path: tests/check-static-libraries/static_libraries_allow_list
