kind: autotools

depends:
- public-stacks/runtime-minimal.bst
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
  ref: npth-1.8-0-g64905e765aad9de6054ef70a97fc30bd992ce999
