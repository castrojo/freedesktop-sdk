# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/build.yml
- elements/include/python3.yml

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/binary-seed.bst

variables:
  conf-local: >-
    --enable-static
    --disable-shared

  # Upstream default is -O3 and we should not override this
  local_flags: "-O3"
