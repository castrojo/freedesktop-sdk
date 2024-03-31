kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pycparser
  ref:
    sha256sum: 491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6
    suffix: 
      1d/b2/31537cf4b1ca988837256c910a668b553fceb8f069bedc4b1c826024b52c/pycparser-2.22.tar.gz
