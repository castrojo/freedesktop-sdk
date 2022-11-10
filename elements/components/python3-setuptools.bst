kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: e197a19aa8ec9722928f2206f8de752def0e4c9fc6953527360d1c36d94ddb2f
    suffix: 26/f4/ca5cb6df512f453ad50f78900bf7ec6a5491ee44bb49d0f6f76802dbdd43/setuptools-65.5.1.tar.gz
