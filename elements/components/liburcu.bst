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
      ref: v0.14.0-0-gd1252aeb22cc8dbd9b1806afd66ffaf9ad6d7d07
- target_arch == "loongarch64":
    sources:
    - kind: git_repo
      url: liburcu:userspace-rcu.git
      track: master
      ref: v0.14.0-82-g9fbbb7de38bf42ea2fcc9da5dcb220fcf3eca580
