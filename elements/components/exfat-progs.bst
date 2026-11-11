kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/util-linux.bst

sources:
- kind: git_repo
  url: github:exfatprogs/exfatprogs.git
  track: '*.*.*'
  ref: 1.4.4-0-g7713040c42cfeb2c536714677f46f674ccb2acf7
