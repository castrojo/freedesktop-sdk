kind: autotools

depends:
- bootstrap-import.bst
- components/libconfuse.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

runtime-depends:
- components/e2fsprogs.bst
- components/mtools.bst
- components/dosfstools.bst

sources:
- kind: git_repo
  url: github:pengutronix/genimage.git
  track: v*
  ref: v20-0-g48f63eefd69809b62f68cc78ad7c4142a94a6744
