kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-typing-extensions.bst
- components/python3-packaging.bst

runtime-depends:
- components/python3-tomli.bst

sources:
- kind: pypi
  name: setuptools_scm
  ref:
    sha256sum: 6c508345a771aad7d56ebff0e70628bf2b0ec7573762be9960214730de278f27
    suffix: 98/12/2c1e579bb968759fc512391473340d0661b1a8c96a59fb7c65b02eec1321/setuptools_scm-7.1.0.tar.gz
