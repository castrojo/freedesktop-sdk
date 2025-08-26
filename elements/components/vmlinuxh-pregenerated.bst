kind: manual

build-depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - mkdir -p '%{install-root}%{includedir}'
  - cp -rT '%{gcc_triplet}' '%{install-root}%{includedir}/%{gcc_triplet}'

sources:
- kind: git_repo
  track: main
  url: fdsdk_git:vmlinux-h.git
  ref: 657d3f5119a02333cdbeae92d5de28234bbcec03
