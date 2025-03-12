kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/slang.bst
- components/popt.bst

variables:
  # newt has enforcing that Makefile is up to date by using
  # configure.ac which breaks when build-dir is used
  build-dir: ''

sources:
- kind: git_repo
  url: pagure:newt.git
  track: r*
  ref: r0-52-25-0-g9b9e7e8936f51f83a7259c5f0a9b4ff909cbd39a
