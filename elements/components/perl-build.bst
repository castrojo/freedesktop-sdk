# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: makemaker

build-depends:
- bootstrap/make.bst

depends:
- public-stacks/runtime-minimal.bst
- components/perl.bst

sources:
- kind: git_repo
  url: github:Perl-Toolchain-Gang/Module-Build
  track: 0.*
  exclude:
  - '0.*_*'
  # legacy versions
  - 0.3*
  ref: 0.4234-0-gbdf211f8cb3704cd470a98fcb35dca2c1472708e
