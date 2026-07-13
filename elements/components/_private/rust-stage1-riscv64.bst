# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.95.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 172b80cc2c600c2681f2a2199cee9f490427c2ba548ee9bd449483a0c34cd691
