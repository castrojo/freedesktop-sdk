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
  ref: 0.22.0-0-g43d9f4d1012b963e12b9124db9bc4101e8b7e3ae
- kind: git_module
  path: list
  url: github:publicsuffix/list.git
  ref: 18ecca5d54471f21918798da451dd8d03a18f3c7
