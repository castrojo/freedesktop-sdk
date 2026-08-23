# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.97.1-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 2982687edabf8582b21a5497fed8dd5287a24afdb836a64b206959cea81ab947
