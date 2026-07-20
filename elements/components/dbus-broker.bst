# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

description: Linux D-Bus Message Broker

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/systemd.bst

# Meson wraps are not fetched by BuildStream. Replace as this issue is
# addressed: https://github.com/apache/buildstream-plugins/issues/5
# In the meantime, we have to keep it in sync by hand with the components
# provided by upstream https://github.com/bus1/dbus-broker/tree/v37/subprojects
sources:
- kind: git_repo
  url: github:bus1/dbus-broker.git
  track: v*
  ref: v37-0-ge5b413f573b2c158bff88370944d571379977b7e
- kind: git_repo
  url: github:c-util/c-dvar.git
  directory: subprojects/libcdvar-1
  track: v1
  ref: 82984409941e577d0b699779c1cd5b701fa7ec65
- kind: git_repo
  url: github:c-util/c-ini.git
  directory: subprojects/libcini-1
  track: v1
  ref: d08d5edeaee9127e72bc1c1f20aca3a63bb880fb
- kind: git_repo
  url: github:c-util/c-list.git
  directory: subprojects/libclist-3
  track: v3
  ref: 9aa81d84cadc67e92b441c89f84c57e72dd1e8a9
- kind: git_repo
  url: github:c-util/c-rbtree.git
  directory: subprojects/libcrbtree-3
  track: v3
  ref: 034f74456617e445a0379d345a362397f02ba1ad
- kind: git_repo
  url: github:c-util/c-shquote.git
  directory: subprojects/libcshquote-1
  track: v1
  ref: c4d0c851126c43eb52a1d7b0063429a79f7579d3
- kind: git_repo
  url: github:c-util/c-stdaux.git
  directory: subprojects/libcstdaux-1
  track: v1
  ref: 112ae96c2459c48ed6bc1549e7a88e6dede9a202
- kind: git_repo
  url: github:c-util/c-utf8.git
  directory: subprojects/libcutf8-1
  track: v1
  ref: aab553d293bbffa42f34dc966be61313d9433c2f
