kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-calver.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: trove-classifiers
  ref:
    sha256sum: 6e36caf430ff6485c4b57a4c6b364a13f6a898d16b9417c6c37467e59c14b05a
    suffix: 
      44/e4/9de7cda4a03a996758fbdb7ddacc071b4c62fdcd645e0a1192a22e8c55c0/trove-classifiers-2024.1.8.tar.gz
