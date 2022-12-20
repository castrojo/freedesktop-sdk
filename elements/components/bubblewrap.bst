kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libcap.bst

sources:
- kind: git_repo
  url: github:projectatomic/bubblewrap.git
  track: v*
  ref: v0.7.0-0-gaa0fb696ab4b7482fa54a0422b8a19c87407350e
