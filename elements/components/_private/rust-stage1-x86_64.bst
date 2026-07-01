# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.95.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 2e0338f18ecbaa4a0f631b9e80e8b8e26bb6fe77dd5454fba8a70cf96c1e84a1
