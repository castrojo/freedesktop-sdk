# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.96.1-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 0b67fc803e028110a98387da5b66323afb98a0e4f58a0fb09b05a180083f13d9
