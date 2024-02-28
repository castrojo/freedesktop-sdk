kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  includedir: "%{prefix}/include/%{gcc_triplet}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{prefix}/include'
        - '%{bindir}/npth-config'
        - '%{libdir}/libnpth.so'

sources:
- kind: git_repo
  url: gnupg:npth.git
  track: npth-*
  ref: npth-1.7-0-g150dc11942c90ff8190c2d48344eb4c1c48c7cd8
