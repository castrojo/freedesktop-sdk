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
  ref: r0-52-24-0-g5f2762040505edd7a25878fe27a00a2d34485663
