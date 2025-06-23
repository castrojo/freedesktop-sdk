kind: autotools

(@):
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst

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
  url: github:gpg/npth.git
  track: npth-*
  ref: npth-1.8-0-g64905e765aad9de6054ef70a97fc30bd992ce999
