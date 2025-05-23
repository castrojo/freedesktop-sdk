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
  ref: v1.8.2-0-gf2c0bdb4bdde3cf83ed48547a276bdcbc7b41425
