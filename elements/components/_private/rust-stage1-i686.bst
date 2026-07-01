# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.95.0-i686-unknown-linux-gnu.tar.xz
  ref: 49954c2ea9d36fea90169b350734b0eb4f53237f62274a73c68f315dcceb8fcd
