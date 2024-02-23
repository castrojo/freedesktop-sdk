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
    sha256sum: 458650355240a16a98bb430ddac088412af48a86093d400206f09030eb595e8a
    suffix: 
      e4/b8/6d1cce6f0d2a103459a86d5d46e7e1c3ce54b5a27fa9a78e078d18d2d07f/trove-classifiers-2024.2.22.tar.gz
