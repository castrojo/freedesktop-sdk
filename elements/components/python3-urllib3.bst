kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-hatchling.bst
- components/python3-hatch-vcs.bst

depends:
- components/python3.bst


sources:
- kind: pypi
  name: urllib3
  ref:
    sha256sum: e7d814a81dad81e6caf2ec9fdedb284ecc9c73076b62654547cc64ccdcae26e9
    suffix: 
      ed/63/22ba4ebfe7430b76388e7cd448d5478814d3032121827c12a2cc287e2260/urllib3-2.2.3.tar.gz
