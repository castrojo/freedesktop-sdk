# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/gobject-introspection-base.bst

runtime-depends:
- public-stacks/runtime-gnu.bst
- components/glib.bst
- components/python3.bst
- components/python3-mako.bst
- components/python3-markdown.bst
- components/python3-setuptools.bst

config:
  include-orphans: True
