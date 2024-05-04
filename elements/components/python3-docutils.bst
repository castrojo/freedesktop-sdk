kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: docutils
  ref:
    sha256sum: 3a6b18732edf182daa3cd12775bbb338cf5691468f91eeeb109deff6ebfa986f
    suffix: 
      ae/ed/aefcc8cd0ba62a0560c3c18c33925362d46c6075480bfa4df87b28e169a9/docutils-0.21.2.tar.gz
