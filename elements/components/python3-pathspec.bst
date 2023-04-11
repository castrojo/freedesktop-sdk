kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pathspec
  ref:
    sha256sum: 2798de800fa92780e33acca925945e9a19a133b715067cf165b8866c15a31687
    suffix: 95/60/d93628975242cc515ab2b8f5b2fc831d8be2eff32f5a1be4776d49305d13/pathspec-0.11.1.tar.gz
