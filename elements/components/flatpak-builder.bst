# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/include/flatpak-builder-source.yml

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/debugedit.bst
- components/curl.bst
- components/flatpak.bst
- components/fuse3.bst
- components/json-glib.bst
- components/libsoup.bst
- components/libyaml.bst
- components/docbook-xsl.bst
- components/xmlto.bst

runtime-depends:
- components/git.bst
- components/git-lfs.bst
- components/tar.bst
- components/gzip.bst
- components/libarchive.bst

variables:
  meson-local: >-
    -Dtests=false
    -Dfuse=3
