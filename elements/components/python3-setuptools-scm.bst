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
    sha256sum: 3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63
    suffix: 
      b9/19/7ae64b70b2429c48c3a7a4ed36f50f94687d3bfcd0ae2f152367b6410dff/setuptools_scm-8.3.1.tar.gz
