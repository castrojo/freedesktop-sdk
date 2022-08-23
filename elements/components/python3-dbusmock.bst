kind: pip

depends:
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

- filename: components/python3-dbus.bst
  type: runtime

sources:
- kind: pypi
  name: python-dbusmock
  ref:
    sha256sum: c63edeacec7796c4f379b2e17566d62afa404c048931ac9eba446470cec80ada
    suffix: b1/82/a901580a954e16f298eaef2ec69cd2927086d5933c934a906b03925a9e3f/python-dbusmock-0.28.0.tar.gz
