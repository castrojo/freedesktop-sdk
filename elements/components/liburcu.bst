kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

# FIXME: loongarch-specific source is not needed for next release
(?):
- target_arch != "loongarch64":
    sources:
    - kind: git_repo
      url: liburcu:userspace-rcu.git
      track: v*.*.*
      ref: v0.14.1-0-g2b9c413937a8c67261e1065cbce2b09904330d24
- target_arch == "loongarch64":
    sources:
    - kind: git_repo
      url: liburcu:userspace-rcu.git
      track: master
      ref: v0.14.0-82-g9fbbb7de38bf42ea2fcc9da5dcb220fcf3eca580
