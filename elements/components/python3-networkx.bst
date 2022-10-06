kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: networkx
  include:
  - '2\.8(\.|$)'
  exclude:
  - '.*rc.*'
  ref:
    sha256sum: 815383fd52ece0a7024b5fd8408cc13a389ea350cd912178b82eed8b96f82cd3
    suffix: 9e/89/90846e0da5c412cbffb66d1f976b056cd46c6f2aa7f2f1eb271573b5fefb/networkx-2.8.7.tar.gz
