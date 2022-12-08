kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-smartypants.bst

sources:
- kind: pypi
  name: typogrify
  ref:
    sha256sum: 8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38
    suffix: 8a/bf/64959d6187d42472acb846bcf462347c9124952c05bd57e5769d5f28f9a6/typogrify-2.0.7.tar.gz
