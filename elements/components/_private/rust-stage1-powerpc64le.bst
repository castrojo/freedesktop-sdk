# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.95.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: d301b5064ae68180ec1218b533ef0b26aaf83bba20720a0cbfdd1ad09f295133
