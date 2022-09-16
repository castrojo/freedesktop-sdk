kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

sources:
- kind: pypi
  name: idna
  ref:
    sha256sum: 814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4
    suffix: 8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438/idna-3.4.tar.gz
