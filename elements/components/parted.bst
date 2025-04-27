kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/util-linux-full.bst
- components/libdevmapper.bst

variables:
  local_flags: -std=gnu17

sources:
- kind: tar
  url: ftp_gnu_org:parted/parted-3.6.tar.xz
  ref: 3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612

# We have decided to stay with tarballs on this one, because the build
# system is too annoying when building from git. Parted  apparently
# uses rsync to download the po files (translations), so the build
# process  searches for rsync, to download them. However, buildstream
# doesn't let builds access the network, It will be need to change the
# parted build system so that it doesn't use rsync at all by patching it,
# but if you just patch out the calls to rsync, then we lose translations.
# So you'd have to rsync them beforehand, and add them to our repo as additional sources.
