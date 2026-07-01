# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst
- components/libnftnl.bst

sources:
- kind: git_repo
  url: netfilter:iptables
  track: v*
  ref: v1.8.13-0-gafd52551c98871b8ac0321eed8efa0845956037c
