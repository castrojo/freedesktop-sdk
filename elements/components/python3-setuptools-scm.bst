kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-typing-extensions.bst
- components/python3-packaging.bst

sources:
- kind: pypi
  name: setuptools_scm
  ref:
    sha256sum: a18396a1bc0219c974d1a74612b11f9dce0d5bd8b1dc55c65f6ac7fd609e8c28
    suffix: 
      4b/bd/c5d16dd95900567e09744af92119da7abc5f447320d53ec1d9415ec30263/setuptools_scm-8.2.0.tar.gz
