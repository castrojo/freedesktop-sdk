# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.95.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 094c9c36531911c5cc7dd6ab2d3069ab8dcd744d6239b0bda1387b243dfc391e
