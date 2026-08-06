# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.96.1-aarch64-unknown-linux-gnu.tar.xz
  ref: 3abcb9489d001d95f30e8cfe68118be85afb0adbf0a9b21438909719689c08fb
