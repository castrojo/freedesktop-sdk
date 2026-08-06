# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.96.1-x86_64-unknown-linux-gnu.tar.xz
  ref: d29ccb1559a177c4e72291f6e5f629de7fe8885e7521ca47802627544b121e95
