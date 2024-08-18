kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:containers/composefs.git
  track: v*
  ref: v1.0.5-0-g098d985a1b9a15ac828d7b2382297a6955e31e40
