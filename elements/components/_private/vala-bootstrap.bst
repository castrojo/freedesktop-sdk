# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools


build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst
- components/bison.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst

variables:
  conf-local: --disable-valadoc
  local_flags: -fpermissive

environment:
  VALAC: /no-valac

config:
  configure-commands:
    (<):
    - touch */*.stamp

sources:
- kind: git_repo
  url: git_https:gitlab.gnome.org/Archive/vala-bootstrap.git
  ref: b2beeaccdf2307ced172646c2ada9765e1747b28
