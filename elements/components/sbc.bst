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
  ref: 2.0-0-g8dc5d5ba381512ad5b1afa45c63ec6b0a3833244
- kind: patch
  path: patches/sbc/only-run-x86-code-on-x86.patch
