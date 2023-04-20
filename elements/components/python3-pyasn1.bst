kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyasn1
  ref:
    sha256sum: 97b7290ca68e62a832558ec3976f15cbf911bf5d7c7039d8b861c2a0ece69fde
    suffix: 61/ef/945a8bcda7895717c8ba4688c08a11ef6454f32b8e5cb6e352a9004ee89d/pyasn1-0.5.0.tar.gz
