kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

runtime-depends:
- components/python3-importlib-metadata.bst

sources:
- kind: pypi
  name: markdown
  include:
  - 3[.]3[.].*
  ref:
    sha256sum: cbb516f16218e643d8e0a95b309f77eb118cb138d39a4f27851e6a63581db874
    suffix: d6/58/79df20de6e67a83f0d0bbfe6c19bb82adf68cdf362885257eb01099f930a/Markdown-3.3.7.tar.gz
