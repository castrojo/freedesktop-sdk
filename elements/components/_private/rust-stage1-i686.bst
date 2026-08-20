# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.97.1-i686-unknown-linux-gnu.tar.xz
  ref: 1687b56e6e7585dea809ab7b82d93f35417f3760a76c3d0d7f6dec252ff1751b
