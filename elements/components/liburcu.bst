kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: liburcu:userspace-rcu.git
  track: v*.*.*
  ref: v0.15.6-0-gd8bd37fb288a2da7238103f9b24bf25e190902be
