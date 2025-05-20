kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: liburcu:userspace-rcu.git
  track: v*.*.*
  ref: v0.15.3-0-gba5f2bfb6646701a7268c5a03d0454d68b083948
