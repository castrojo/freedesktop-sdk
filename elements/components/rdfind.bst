kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/nettle.bst

sources:
- kind: git_tag
  url: github:pauldreik/rdfind.git
  track: master
  ref: releases/1.6.0-0-gb0f580b8cdc096ea6d006a6bf586f491a47b1801
