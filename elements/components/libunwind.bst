kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --disable-tests

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
      mv "%{install-root}%{includedir}/libunwind.h" "%{install-root}%{includedir}/%{gcc_triplet}/"
      for h in "%{install-root}%{includedir}/"libunwind-{x86,arm,aarch64,x86_64,loongarch64}.h; do
        if [ -e "${h}" ]; then
           mv "${h}" "%{install-root}%{includedir}/%{gcc_triplet}/"
        fi
      done

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunwind*.so'

sources:
- kind: git_repo
  url: github:libunwind/libunwind.git
  track: v*
  exclude:
  - "*-rc*"
  - "*branchpoint*"
  ref: v1.8.3-0-g7bda80a564cddc5b215a84509026030cf16dfd94
- kind: patch
  path: patches/libunwind/0001-configure-Fix-WCClinker-typo-should-be-XCClinker.patch
