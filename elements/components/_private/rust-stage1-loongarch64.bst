# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.96.1-loongarch64-unknown-linux-gnu.tar.xz
  ref: 61a835866c33d8b7f7d5805489606df4b8eb2eaf002b35679d76ec1599ed829c
