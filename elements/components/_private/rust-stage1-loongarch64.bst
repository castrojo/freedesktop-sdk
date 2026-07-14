# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.95.0-loongarch64-unknown-linux-gnu.tar.xz
  ref: 3ad6bd69588f12efd605a3974f352bf5e3c62d956e0d08453bec56842627aaf6
