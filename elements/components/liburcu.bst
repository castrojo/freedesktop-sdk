kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: liburcu:userspace-rcu.git
  track: v*.*.*
  ref: v0.14.0-0-gd1252aeb22cc8dbd9b1806afd66ffaf9ad6d7d07
