kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/_private/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libidn2.bst
- components/libunistring.bst

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
  ref: 0.23.0-0-g9c1a0e0588d9040d6b39273e0aa8b72769409a1f
- kind: git_module
  path: list
  url: github:publicsuffix/list.git
  ref: b9a86cf0cd115f1e60b5815533f3fcfd2f9e8f4b
