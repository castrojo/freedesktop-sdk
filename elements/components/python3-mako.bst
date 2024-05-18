kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: mako
  ref:
    sha256sum: 48dbc20568c1d276a2698b36d968fa76161bf127194907ea6fc594fa81f943bc
    suffix: 
      67/03/fb5ba97ff65ce64f6d35b582aacffc26b693a98053fa831ab43a437cbddb/Mako-1.3.5.tar.gz
