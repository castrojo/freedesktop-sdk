# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libdevmapper.bst
- components/util-linux-libs.bst

sources:
- kind: tar
  url: ftp_gnu_org:parted/parted-3.7.tar.xz
  ref: 008de57561a4f3c25a0648e66ed11e7b30be493889b64334a6d70f2c1951ef7b

# We have decided to stay with tarballs on this one, because the build
# system is too annoying when building from git. Parted  apparently
# uses rsync to download the po files (translations), so the build
# process  searches for rsync, to download them. However, buildstream
# doesn't let builds access the network, It will be need to change the
# parted build system so that it doesn't use rsync at all by patching it,
# but if you just patch out the calls to rsync, then we lose translations.
# So you'd have to rsync them beforehand, and add them to our repo as additional sources.
