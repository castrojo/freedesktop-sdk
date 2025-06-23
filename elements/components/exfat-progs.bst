kind: autotools

(@):
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:exfatprogs/exfatprogs.git
  track: '*.*.*'
  ref: 1.3.2-0-g5a0256cda391d8131f01309551b4691dbb4de74d
