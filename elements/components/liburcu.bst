kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: liburcu:userspace-rcu.git
  track: v*.*.*
  ref: v0.15.6-0-gd8bd37fb288a2da7238103f9b24bf25e190902be
