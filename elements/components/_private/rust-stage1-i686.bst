# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.96.1-i686-unknown-linux-gnu.tar.xz
  ref: 68d2281feea295d94c41f4b1eaa379b7c2484e4a7f8e818e15cea54077db6dd7
