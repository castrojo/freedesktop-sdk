# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.97.1-loongarch64-unknown-linux-gnu.tar.xz
  ref: 8c6e54fc083f5f6ad9f3bb6d08f935bc799039d15aa517062238def167c2c67a
