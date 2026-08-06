# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.96.1-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 107ebdaac6512820b1fdf55920317687a5ff0255602db23a006a982f90880cf6
