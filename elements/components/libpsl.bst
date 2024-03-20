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
- kind: git_tag
  url: github:rockdaboot/libpsl.git
  ref: 0.21.2-0-g927b202c69bcd9be4c30ba51c74925f2575e1a69
- kind: git_module
  path: list
  url: github:publicsuffix/list.git
  ref: 4aec132984ce028c5b9d7882a31a85e5e5330346
