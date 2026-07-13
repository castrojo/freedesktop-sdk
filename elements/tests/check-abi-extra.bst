# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- tests/check-abi-deps.bst
- filename: abi/abi-check-extra.bst
  config:
    location: /new-image
- filename: abi/abi-check-extra.bst
  junction: abi/reference-abi.bst
  config:
    location: /old-image

config:
  commands:
  - check-abi --new /new-image --old /old-image --archive-on-core --full-abi-diff %{full_abi_diff} --forward-compatible --suppressions "%{datadir}/check-abi/check-abi-suppressions.json" --abidiff-suppressions "%{datadir}/check-abi/abidiff-suppressions.ini" --only-libs "%{datadir}/check-abi/check-abi-extra-libs.json"
