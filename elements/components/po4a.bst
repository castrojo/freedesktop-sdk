# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: modulebuild

build-depends:
- bootstrap/diffutils.bst
- bootstrap/make.bst
- components/docbook-xsl.bst
- components/gettext.bst
- components/gettext.bst
- components/libxslt.bst
- components/perl-build.bst
- components/perl-pod-parser.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst

sources:
- kind: git_repo
  url: github:mquinson/po4a.git
  track: v*
  ref: v0.74-0-g5d4c70797ee716aefe259fb57bb9c9c416fd2782
