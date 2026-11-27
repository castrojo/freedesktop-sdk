# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: anitya
  project-id: 2028
  url: ftp_gnu_org:mtools/mtools-{version}.tar.bz2
  ref:
    version: 4.0.50
    sha256sum: f3a58e6cfc2634b03c240442548e3b00103692357afc28e1e7104744dd6478b5
  provenance:
    source-repo: https://https.git.savannah.gnu.org/git/mtools.git
