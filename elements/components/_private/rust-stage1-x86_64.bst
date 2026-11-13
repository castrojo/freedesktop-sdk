# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.99.1-x86_64-unknown-linux-gnu.tar.xz
  ref: 231fcae47ee950621374725b5fc3b5441d2fbda2955ac45dd7dc816d8876cfe7
