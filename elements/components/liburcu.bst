kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: liburcu:userspace-rcu.git
  track: v*.*.*
  ref: v0.15.2-0-g58b3ad23d85d316ee1fe8238b685eb7e1f2afd1b
