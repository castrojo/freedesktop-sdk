kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpopt.so'

sources:
- kind: git_repo
  url: github:rpm-software-management/popt.git
  track: popt-*
  ref: popt-1.19-release-0-g916e61045d268f7e37ade5ec047eb77e8299e6ad
