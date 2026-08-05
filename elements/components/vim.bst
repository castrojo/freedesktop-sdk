# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  command-subdir: src
  # FIXME: vim bundles configure script which is broken with
  # build-dir. We would need to generate our own to fix things.
  build-dir: ''

sources:
- kind: git_repo
  url: github:vim/vim.git
  # we track only major releases because there are several new minor tags every day
  # 9.2.0357 allowed as up to that there are fixes for multiple CVEs (CVE-2026-39881,  CVE-2026-35177, CVE-2026-34982, CVE-2026-34714, CVE-2026-33412, CVE-2026-28422, CVE-2026-28421, CVE-2026-28420, CVE-2026-28419, CVE-2026-28418, CVE-2026-28417, CVE-2026-41411)
  track: v*.0
  ref: v9.2.0357-0-gc78194e41d5a0b05b0ddf383b6679b1503f977fb
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
