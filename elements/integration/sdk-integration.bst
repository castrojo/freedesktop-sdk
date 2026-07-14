# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: collect_integration
description: Combines integration commands of all components of the SDK into a single shell script

build-depends:
- sdk.bst

config:
  script-path: '%{libexecdir}/freedesktop-post.sh'
