# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.99.1-i686-unknown-linux-gnu.tar.xz
  ref: f5fae4c94233314fef8cc186e0bb8b7cd4165ee39268fcdb5d1fcd69afd7d7ae
