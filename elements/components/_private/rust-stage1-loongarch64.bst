# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.98.1-loongarch64-unknown-linux-gnu.tar.xz
  ref: 64ce14f8f358ec2997fc214f74663cd6909747f503c69512f7cc39bdaec11396
