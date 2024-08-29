kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: liburcu:userspace-rcu.git
  track: v*.*.*
  ref: v0.14.1-0-g2b9c413937a8c67261e1065cbce2b09904330d24
