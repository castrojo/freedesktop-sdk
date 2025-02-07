kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:exfatprogs/exfatprogs.git
  track: '*.*.*'
  ref: 1.2.7-0-g6b8d63f6c975cc5d93674f9a9284f43b0b6084a4
