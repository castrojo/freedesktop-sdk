kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libconfuse.bst

runtime-depends:
- components/e2fsprogs.bst
- components/mtools.bst
- components/dosfstools.bst

sources:
- kind: git_repo
  url: github:pengutronix/genimage.git
  track: v*
  ref: v19-0-g67a399476add05f29ef1ad722856728fb7639ba9
