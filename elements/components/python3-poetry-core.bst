kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: poetry-core
  ref:
    sha256sum: fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2
    suffix: 
      f2/db/20a9f9cae3f3c213a8c406deb4395698459fd96962cea8f2ccb230b1943c/poetry_core-1.9.0.tar.gz
