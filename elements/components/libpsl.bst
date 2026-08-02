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
  ref: 0.23.1-0-gaa3a80e18f25caf3916636c8668dcc0fff7c016d
- kind: git_module
  path: list
  url: github:publicsuffix/list.git
  ref: e1b8015c3b2f0f4f8c18659c2480fc1a22c07b20
