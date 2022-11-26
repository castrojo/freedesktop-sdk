kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  ref:
    sha256sum: a7a22e05929290a67401440b39690ae6563279bced5f314609d9d03798f56766
    suffix: 8e/b3/8b16a007184714f71157b1a71bbe632c5d66dd43bc8152b3c799b13881e1/zipp-3.11.0.tar.gz
