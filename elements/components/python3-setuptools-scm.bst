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
    sha256sum: 51cfdd1deefc9b8c08d1a61e940a59c4dec39eb6c285d33fa2f1b4be26c7874d
    suffix: 
      98/7d/334fba3c2e30ddb5cb9fca7fb8f883c8093891cd1fb02fcf981f2fc4ca96/setuptools_scm-8.2.1.tar.gz
