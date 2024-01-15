kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libidn2.bst
- filename: components/libunistring.bst
- filename: components/git-minimal.bst
  type: build
- filename: components/python3.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libpsl.so"

sources:
- kind: git_repo
  url: github:rockdaboot/libpsl.git
  track: '*.*.*'
  ref: 0.21.5-0-gba4c49a205408845834b1648ad23c15ee09f722b
- kind: git_module
  path: list
  url: github:publicsuffix/list.git
  ref: 5db9b65997e3c9230ac4353b01994c2ae9667cb9
