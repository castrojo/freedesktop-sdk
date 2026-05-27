kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:exfatprogs/exfatprogs.git
  track: '*.*.*'
  ref: 1.4.0-0-g57c67a7b2a3960a72551302d42c44f6ba54b99e1
