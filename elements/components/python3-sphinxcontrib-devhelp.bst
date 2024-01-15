kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-devhelp
  ref:
    sha256sum: 9893fd3f90506bc4b97bdb977ceb8fbd823989f4316b28c3841ec128544372d3
    suffix: 
      c7/a1/80b7e9f677abc673cb9320bf255ad4e08931ccbc2e66bde4b59bad3809ad/sphinxcontrib_devhelp-1.0.6.tar.gz
