kind: autotools

depends:
- bootstrap-import.bst
- components/sndfile.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

sources:
- kind: git_repo
  url: kernel:bluetooth/sbc.git
  track: '*.*'
  ref: 2.1-0-g9b6c775f02b1ea944c8a203452ce23d7854e9187
- kind: patch
  path: patches/sbc/only-run-x86-code-on-x86.patch
