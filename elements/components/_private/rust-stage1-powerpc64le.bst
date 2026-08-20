# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.97.1-powerpc64le-unknown-linux-gnu.tar.xz
  ref: d27b74ae1e480f006847240816198854cac3f9d5c87162aa7f36743049ea90dd
