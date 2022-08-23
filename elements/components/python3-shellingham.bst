kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: shellingham
  ref:
    sha256sum: 4855c2458d6904829bd34c299f11fdeed7cfefbf8a2c522e4caea6cd76b3171e
    suffix: 9c/c9/a3e3bc667c8372a74aa4b16649c3466364cd84f7aacb73453c51b0c2c8a7/shellingham-1.4.0.tar.gz
