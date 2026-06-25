kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libplist.bst

sources:
- kind: git_repo
  url: github:libimobiledevice/libimobiledevice-glue.git
  track: '*.*.*'
  ref: 1.3.2-0-gaef2bf0f5bfe961ad83d224166462d87b1df2b00
