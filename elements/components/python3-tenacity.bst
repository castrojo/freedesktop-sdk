kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/python3-setuptools-scm.bst

sources:
- kind: pypi
  name: tenacity
  ref:
    sha256sum: 807f37ca97d62aa361264d497b0e31e92b8027044942bfa756160d908320d73b
    suffix: 
      cd/94/91fccdb4b8110642462e653d5dcb27e7b674742ad68efd146367da7bdb10/tenacity-9.0.0.tar.gz
