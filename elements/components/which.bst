kind: autotools

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: anitya
  project-id: 5127
  url: tar_https:carlowood.github.io/which/which-{version}.tar.gz
  ref:
    version: '2.21'
    sha256sum: f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad
