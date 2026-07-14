# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

# Drop -R when make 4.5 is out

variables:
  make-args: >-
    -R
    prefix="%{prefix}"

config:
  install-commands:
    (>):
    - |
      # The following is provided by components/shadow.bst
      rm "%{install-root}%{mandir}/man3/getspnam.3"
      rm "%{install-root}%{mandir}/man5/passwd.5"
      # The following is provided by bootstrap/libxcrypt.bst
      rm "%{install-root}%{mandir}/man3/crypt.3"
      rm "%{install-root}%{mandir}/man3/crypt_r.3"

sources:
- kind: git_repo
  url: kernel:docs/man-pages/man-pages.git
  track: man-pages-*
  exclude:
  - '*rc*'
  - '*-a*'
  ref: man-pages-6.18-0-g66d786852379759d22c891d70ff9311d9f193fdc
