kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:containers/composefs.git
  track: v*
  ref: v1.0.3-0-g2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649
