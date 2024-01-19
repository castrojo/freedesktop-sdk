kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
      mv "%{install-root}%{includedir}/libunwind.h" "%{install-root}%{includedir}/%{gcc_triplet}/"
      for h in "%{install-root}%{includedir}/"libunwind-{x86,arm,aarch64,x86_64}.h; do
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
  ref: v1.8.0-0-g2c2566c79c4f9cb505e6a23e4ab884d856ef88fe
