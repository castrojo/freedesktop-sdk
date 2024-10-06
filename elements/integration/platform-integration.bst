kind: collect_integration
description: Combines the integration commands of all components of the runtime into
  a single shell script

build-depends:
- platform.bst

config:
  script-path: '%{libexecdir}/freedesktop-post.sh'
