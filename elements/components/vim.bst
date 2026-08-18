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
  # track: v*.*.0
  # we track only minor releases because there are several new patches tags every day
  # 9.2.0967 allowed as up to that there are fixes for multiple CVEs (CVE-2026-39881,  CVE-2026-35177, CVE-2026-34982, CVE-2026-34714, CVE-2026-33412, CVE-2026-28422, CVE-2026-28421, CVE-2026-28420, CVE-2026-28419, CVE-2026-28418, CVE-2026-28417, CVE-2026-41411)
  ref: v9.2.0967-0-g6025ea9e029b0681df37ee19e0d3992fb7f4d7fd
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
